class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update, :following, :followers]
	before_action :correct_user, only: [:edit, :update]
	
	def show
		@user = User.find_by_name(params[:name])
		if @user.nil?
			redirect_to root_path
		else
			@photos = @user.photos
		end
	end

	def new 
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Welcome to Instagram!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find_by_name(params[:name])
	end

	def update
		@user = User.find_by_name(params[:name])
		if @user.update_attributes(update_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def following
		@title = 'Following'
		@user = User.find_by_name(params[:name])
		@users = @user.following
		render 'show_follow'
	end

	def followers
		@title = 'Followers'
		@user = User.find_by_name(params[:name])
		@users = @user.followers
		render 'show_follow'
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def update_params
			params.require(:user).permit(
				:name, :email, 
				:first_name, :last_name, 
				:bio,
				:password, :password_confirmation)
		end

		def logged_in_user
			unless logged_in?
				flash[:danger] = "Please log in"
				redirect_to login_url
			end
		end

		def correct_user
			@user = User.find_by(name: params[:name])
			redirect_to(root_url) unless current_user?(@user)
		end
end
