/*
Aggregation methods: COUNT, SUM, MIN, MAX
NULL is not a value, it is a property of a data 
Different from space
Usually occur after left and right joins, or simly missing data in the database
Count looks for only NON-NULL data
Sum can only be used on numerical values, will ignore NULL values (treat NULLs as 0?)
SAME as other aggregation functions
AVG functions ignore NULL completely, do not count 
*/

SELECT COUNT(*)
FROM accounts

/*
GROUP BY clause goes between the "WHERE" and "ORDER BY" clause
All SELECT statements that are not being aggregated on should be seen in the GROUP BY clause
GROUP BY column orders do not matter
*/

SELECT a.name, SUM(o.total_amt_usd)
FROM accounts a
JOIN orders o 
ON o.account_id = a.id
GROUP BY a.name

SELECT COUNT(*) num, r.name
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
GROUP BY r.name
ORDER BY num


SELECT COUNT(w.channel) occur_num, s.name, w.channel
FROM web_events w
JOIN accounts a 
ON a.id = w.account_id 
JOIN sales_reps s
ON a.sales_rep_id = s.id
GROUP BY s.name, w.channel
ORDER BY occur_num DESC

/*
DISINCT: used in SELECT statements, can only use once 
kind of tricky
HAVING: WHERE clause does not allow you to filter aggregate columns 
this is where you use HAVING
You can add conditions on the having clause but 
it must be in the group by statement or an aggregate function
You can also use a WHERE clause but it cannot show up in the SELECT statement (not aggregation)
*/

SELECT a.id, a.name, COUNT(*)
FROM accounts a
LEFT JOIN web_events w
ON w.account_id = a.id 
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'

/*
DATE FUNCTION
DATE_TRUNC("day", 2017-04-01 12:51:01) output: 2017-04-01
DATE_PART("month", 2017-04-01 12:51:01) output: 4
DATE_PART("dow", 2017-04-01) gives the day of week 
0: Sunday, 6:Saturday
can use 1,2 referring to SELECT statement clauses
*/
 SELECT DATE_PART('month', occurred_at) month_occurred, COUNT(*)
 FROM orders
 GROUP BY 1
 ORDER BY 2 DESC




