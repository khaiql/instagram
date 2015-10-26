## GOOD
- Good OOP Implementation
- New to Rails but coding style is good, well follow convention of framework (file structures, naming...)
- Distinct search results, which is commonly forgot by developer
- Have unit test
- Nice UI

## BAD
- Don't have a separated table for hashtag, search tags using LIKE query is terrible
- The #hashtags are not recognized and highlighted by hyperlink
- Don't preprocess #hashtag before actual searching, for example, I have hashtag `#sss`, I can search with `sss`, but nope with `#sss`
- Have no idea why the photos become not found after a while

