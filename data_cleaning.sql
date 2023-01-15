/*
LEFT and RIGHT: pull characters from a string 
and present them as a separate string
LENGTH: returns the length of the string
*/

SELECT AVG(first_letter_vowel)
FROM
(SELECT (CASE WHEN LEFT(UPPER(name), 1) 
	IN ('A', 'E', 'I', 'O', 'U') THEN 1 ELSE 0 END) 
first_letter_vowel
FROM accounts) count 

/*
POSITION: how far a particular character is away from the LEFT 
side of the string
STRPOS: simialr to above
BOth are case sensitive, you can use UPPER and LOWER 
if you don't care about case
*/

SELECT LEFT(primary_poc, 
	POSITION(' ' IN primary_poc)-1) first_name, 
RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) 
last_name
FROM accounts

# using STRPOS
SELECT LEFT(primary_poc, 
	STRPOS(primary_poc, ' ') -1 ) first_name, 
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' '))
 last_name
FROM accounts;

/*
CONCAT: combine strings from several columns
or you can use || 
*/

SELECT CONCAT(first_name, '.', last_name, '@', name, '.com') AS email
FROM
(SELECT LEFT(primary_poc, 
	POSITION(' ' IN primary_poc)-1) first_name, 
RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) 
last_name, name
FROM accounts) t1

# you can also use a with statement
WITH t1 AS (
	SELECT LEFT(primary_poc, 
	POSITION(' ' IN primary_poc)-1) first_name, 
RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) 
last_name
FROM accounts
)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
FROM t1;


/*
CAST: allows you to change one data type to another
perform LEFT RIGHT will automatically change num to string
SUBSTR: extract a substring from a string start from x, etract y characters
SUBSTR(STRING, x, y)
*/

WITH t1 AS(SELECT LEFT(date, STRPOS(date, ' ') -1) mdy_part 
FROM sf_crime_data)

SELECT 
(RIGHT(mdy_part, 4) || '-' || LEFT(mdy_part, 2) || '-'|| SUBSTR(mdy_part, 4, 2))::date AS foratted_date
FROM t1
# the date part starts at position 4 and has 2 digits - SUBSTR(mdy_part, 4, 2)

/*
COALESCE: return the first non-null value passed for each row
Python equivalnet of fillna 
*/
SELECT COALESCE(o.id, a.id) filled_id, 
COALESCE(o.account_id, a.id) account_id,
COALESCE(o.standard_qty, 0) standard_qty, 
LEFT JOIN orders o
ON a.id = o.account_id;
