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
