# Quick Guide to SQL 

*This is an informal cheat sheet for help in writing sql queries.*

## Creating Tables:

CREATE TABLE table_name 
(
column_name1 data_type,
column_name2 data_type,
column_name3 data_type,
....
);

*remember that data_type can be (int) or (varchar)

## Inserting Data into Tables:

INSERT INTO table_name (column1,column2,column3,...)
VALUES (value1,value2,value3,...);
*remember to put parentheses around strings


## Pulling Data:

Use “Like” for keywords
SELECT name
FROM table
WHERE name Like ‘Sam%’
*note you can have % before or after the desired keyword

Use ‘WHERE’… ‘IN’ for data pull having a field in a list
SELECT name
FROM table
WHERE name IN (‘Marnie’, ‘Bethany’, ‘Bobby’)

OR/AND
SELECT name
FROM table
WHERE name = ‘America’
OR name = ‘Brazil’

Between
SELECT date
FROM table
WHERE date BETWEEN ‘July’ AND ‘December’

Round Function: Round any column value by
ROUND(age, 2)
2 in this case means 2 decimal places
Rounding to the nearest 1000 is (-3)

Not Equal is expressed as (!=)

SELECT DISTINCT allows you to only pull unique values

ORDER BY/GROUP BY
Order by can list columns alphabetically or ascending or descending
ASC/DESC
SELECT name
FROM table 
ORDER BY name DESC
*this will list names from Z to A.

Group will cluster distinct values together. Best used with aggregate functions
SELECT name, COUNT(goats)
FROM farmrecords
GROUP BY name
*this will grab everyone and how many goats they have, regardless if they are listed twice in the table

HAVING is used for aggregate functions
SELECT name 
FROM list
GROUP BY name
HAVING sum(population) >= 0

Selecting null values
SELECT name 
FROM table
Where name IS NULL

## Unions:
need same number of columns in each select statement

(
SELECT name FROM table
)
UNION
(
SELECT name FROM othertable
)

## Joins:

Inner Join
SELECT name 
FROM table1 JOIN table2 ON (table1.column1 = table2.column2);

*table.column referencing back to this

Left Join: includes rows from left table even when linking value is null
SELECT yr
FROM games LEFT JOIN city ON (games.city = city.name)

| ID            | NAME          |
| ------------- |:-------------:|
| 1             | Milo          |
| 2             | NULL          |
| 3             | Bethany       |


Right Join: includes rows from right table even when linking value is null


| ID            | NAME          |
| ------------- |:-------------:|
| 1             | Milo          |
| NULL          | Jeremy        |
| 3             | Bethany       |


Outer Join: includes all values of fields, even though some may be null

Example of a Triple Join:
(SELECT movie.title, actor.name 
FROM movie 
JOIN casting ON (movie.id = casting.movieid)
JOIN actor ON (casting.actorid = actor.id)
WHERE casting.ord = 1 AND yr = 1962)

## Case: 
Used to assign values (create a new field) to existing values
SELECT 	column, 
	CASE when column = 1
	THEN ‘low’
	WHEN column = 2
	THEN ‘med’
	WHEN column = 3
	THEN ‘high’
	ELSE ‘Horray!’
END
FROM table
	
