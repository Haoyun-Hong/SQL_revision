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
WHERE

*/
