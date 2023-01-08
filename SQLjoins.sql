 /*
Primary Key: a unique column in a table
usually the first column in tables in databases 
Foreign key: can appear in many rows  
*/

SELECT * 
FROM orders 
JOIN accounts 
ON orders.account_id = accounts.id; 

/*
Give table name alias
Sometimes you need to rename a column after join
Especially when they have the exact same name, you need to distinguish them rom each other
*/

SELECT r.name region, s.name rep, a.name account
FROM region AS r
JOIN sales_reps AS s
ON r.id = s.region_id 
JOIN accounts AS a
ON a.sales_rep_id = s.id
ORDER BY a.name