/*
subqueries
format:you can tab the inner group by order by statements 
so that it makes easier to read
do not need include an alias name in a conditional statement
*/

SELECT channel, AVG(event_count) AS average_count
FROM
(SELECT DATE_TRUNC('day', occurred_at) AS day, channel, COUNT(*) AS event_count
FROM web_events
GROUP BY 1, 2
ORDER BY 3 DESC) sub
GROUP BY 1

# for instance 
SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
      FROM web_events 
      GROUP BY 1,2
      ORDER BY 3 DESC) sub
GROUP BY day, channel, events
ORDER BY 2 DESC;

# complicated subqueires
SELECT s.name
FROM sales_reps s
JOIN accounts a 
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.total_amt_usd IN
(SELECT  MAX(o.total_amt_usd)
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a 
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
GROUP BY r.id)


# you can name the temporary table 

SELECT AVG(total)
FROM 
(SELECT a.id account_id, SUM(total_amt_usd) total
FROM accounts a
JOIN orders o 
ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10) temp


/*
Common Table Expression: CTE
improve speed
define it at the beginning, get an alias
*/

WITH temp AS 
(SELECT a.id account_id, 
SUM(total_amt_usd) total
FROM accounts a 
JOIN orders o 
ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10)

SELECT AVG(total)
FROM temp


