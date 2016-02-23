#printing out the top ten numbers
SELECT
	name,
	surfacearea

FROM
	country

ORDER BY
	surfacearea DESC

LIMIT
	10;

__________________________________________
#sum of the top ten numbers
WITH
largest AS(SELECT name, surfacearea FROM country
ORDER BY surfacearea DESC
LIMIT 10)
SELECT SUM(surfacearea) FROM largest
__________________________________________
#ten smallest sum
WITH
largest AS(SELECT name, surfacearea FROM country
ORDER BY surfacearea ASC
LIMIT 10)
SELECT SUM(surfacearea) FROM largest
___________________________________________
#List the countries in africa that have a population smaller than 30,000,000 and a life expectancy of more than 45?
SELECT
	name,
	continent,
	population,
	lifeexpectancy

FROM
	country
WHERE
	continent = 'Africa'
	AND
		population > 30000000
	AND
		lifeexpectancy > 45;
__________________________________________
#How many countries gained independence after 1910 that are also a republic
SELECT
	name,
	governmentform,
	indepyear

FROM
	country
WHERE
	governmentform = 'Republic'
AND
	indepyear > 1910;
____________________________________________
#Which region has the highest ave gnp?
WITH
highest AS(SELECT name, gnp FROM country)
SELECT AVG(gnp) FROM highest;
__________________________________________
#Who is the head of state for the Top 10 highest ave gnp?
WITH
largest AS(SELECT name, gnp, headofstate FROM country
ORDER BY gnp DESC
LIMIT 10)
SELECT (headofstate) FROM largest
__________________________________________
#What are the forms of government for the top ten countries by surface area?
WITH
largest AS(SELECT name, gnp, headofstate, governmentform, surfacearea FROM country
ORDER BY surfacearea DESC
LIMIT 10)
SELECT (governmentform) FROM largest
_____________________________________________
#Which fifteen countries have the lowest life expectancy?
WITH
largest AS(SELECT name, lifeexpectancy, headofstate, governmentform, surfacearea FROM country
ORDER BY lifeexpectancy ASC
LIMIT 10)
SELECT (lifeexpectancy) FROM largest
____________________________________________
#Which five countries have the lowest population density?
	WITH
	lowest AS(SELECT name, surfacearea, population
	FROM country
	WHERE population=population/surfacearea
	ORDER BY population ASC
	LIMIT 5)
	SELECT name FROM lowest
