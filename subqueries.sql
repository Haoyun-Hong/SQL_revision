/*
subqueries
format:you can tab the inner group by order by statements 
so that it makes easier to read
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