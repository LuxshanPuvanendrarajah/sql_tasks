use world;
-- q1 Using COUNT, get the number of cities in the USA.
SELECT COUNT(ID)
FROM city
WHERE CountryCode = "USA";
-- q2 Find out the population and life expectancy for people in Argentina.
SELECT Population,LifeExpectancy
FROM country
WHERE `Name`='Argentina';
-- q3 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT`Name`
FROM country
WHERE LifeExpectancy
ORDER BY LifeExpectancy DESC LIMIT 1;
-- q4 Using JOIN ... ON, find the capital city of Spain.
SELECT c.`Name`
FROM city c 
JOIN country co ON c.ID= co.Capital
WHERE co.`Name`='Spain';
-- q5 Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT cl.`Language`
FROM countrylanguage cl
JOIN country c ON cl.CountryCode=c.`Code`
WHERE c.Region='Southeast Asia';
-- q6 Using a single query, list 25 cities around the world that start with the letter F.
SELECT `Name`
FROM city
WHERE `Name` like 'F%'
LIMIT 25;
-- q7 Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT COUNT(c.ID)
FROM city c
JOIN country co ON c.CountryCode=co.`Code`
WHERE co.`Name`='CHINA';
-- q8 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT `Name`,Population
FROM country
WHERE Population IS NOT NULL AND Population = 0
ORDER BY Population ASC LIMIT 1;
-- q9 Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(`Code`)
FROM country;
-- q 10 What are the top ten largest countries by area?
SELECT `Name`
FROM country
ORDER BY SurfaceArea DESC LIMIT 10;
-- q 11 List the five largest cities by population in Japan.
SELECT `Name`
FROM city
WHERE CountryCode='JPN'
ORDER BY Population DESC LIMIT 5;
-- q12 List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
SELECT `Name`,`Code`
FROM country
WHERE HeadOfState ='Elisabeth II';
-- q13 List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
SELECT `Name`
FROM country 
WHERE Population/SurfaceArea != 0 
ORDER BY Population/SurfaceArea ASC LIMIT 10;
-- q14List every unique world language.
SELECT DISTINCT `Language`
FROM countrylanguage;
-- q15 List the names and GNP of the world's top 10 richest countries.
SELECT `Name`,`GNP`
FROM country
ORDER BY GNP DESC LIMIT 10;
-- q16 List the names of, and number of languages spoken by, the top ten most multilingual countries.
SELECT c.`Name`, COUNT(cl.`Language`) 
FROM country c
JOIN countrylanguage cl ON c.`Code` = cl.CountryCode
GROUP BY c.`Name`
ORDER BY COUNT(cl.`Language`) DESC LIMIt 10;
-- Q17 List every country where over 50% of its population can speak German.
SELECT c.`Name` 
FROM country c
JOIN countrylanguage cl ON c.`Code` = cl.CountryCode
WHERE `Language` = "German" AND Percentage > 50;
-- Q18 Which country has the worst life expectancy? Discard zero or null values.
SELECT `Name`
FROM country
WHERE LifeExpectancy IS NOT NULL AND LifeExpectancy != 0
ORDER BY Lifeexpectancy ASC LIMIT 1;
-- Q19 List the top three most common government forms.
SELECT GovernmentForm, COUNT(GovernmentForm) 
FROM country 
GROUP BY GovernmentForm 
ORDER BY COUNT(GovernmentForm) DESC LIMIt 3;
-- Q20 How many countries have gained independence since records began?
SELECT COUNT(IndepYear) 
FROM country
WHERE IndepYear IS NOT NULL AND IndepYear !=0;