### Notes on common pratice
/*
Capitalize all clauses 
Line break after each clause
Do not have spaces in between table names
* means all
*/ 

SELECT id, account_id, channle
FROM orders; 

SELECT *  
FROM order; 


/*
LIMIT shows the first few rows of the table 
Use when your dataset is large but you only want to check the first few rows
*/ 

SELECT occured_at 
FROM web_events
LIMIT 15; 


/*
ORDER BY can be a date column, quantity
The order is from eariliest to latest, from smallest to largest
Adding DESC by the end can reverse the order 
Place it before lIMIT but after SELECT FROM clauses

ORDER BY multiple columns, can add DESC after each column
*/ 

SELECT * 
FROM orders 
ORDER BY occured_at
LIMIT 10; 

SELECT id, account_id, total_amt_usd
FROM orders 
ORDER BY account_id, total_amt_usd DESC; 

/*
WHERE: filter a set of result based on specific critera
goes after FROM but before ORDER BY
Comparison operators: 
Note: equals is only =, not "=="
Note: use single quotes '', not double quotes ""
*/

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5; 

SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil'; 

/*
Derived Column and Alias
keep the alias name lower case and without blank space
*/

SELECT id, account_id, standard_amt_usd / standard_qty AS unit_price 
FROM orders
LIMIT 10;

/*
Logical Operations:
LIKE: wild card matching 
eg: '%google%' start and end with any number of characters
IN: filter data based on several possble values 
BETWEEN:a cleaner statement than AND, is inclusive for numerical valus 
For date values, the asummed time is at 00:00:00
eg: to include all dates from 2016, we can do BETWEEN '2016-01-01' AND '2017-01-01'
*/ 

SELECT name 
FROM accounts
WHERE name LIKE '%google%';

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name in ('Walmart', 'Target', 'Nordstrom'); 

WHERE column >= 6 AND column <= 10

# This is equivalent to 

WHERE column BETWEEN 6 AND 10



