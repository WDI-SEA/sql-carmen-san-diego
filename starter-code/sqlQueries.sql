
--Query to find the country that's the least populated that speaks 100% that country's language
-- Clues 1, 2, 3, 4.
SELECT 
country.code,
country.name AS Country_Name,
country.continent,
country.region,
country.population,
country.localname,
countrylanguage.language,
city.name AS City_Name,
countrylanguage.percentage
FROM country
INNER JOIN city ON country.code = city.countrycode
INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE region='Southern Europe' AND countrylanguage.percentage > 99
ORDER BY population ASC;


-- A city in South America Like Serravalle
SELECT
country.continent AS Continent,
city.id,
city.name,
city.countrycode,
city.population
FROM city
INNER JOIN country ON country.code = city.countrycode WHERE country.continent='South America' AND city.name LIKE '%se%';


--Find the country that has a capital with the same name as the country
--SELECT 
--city.name AS City_Name,
--code,
--country.name AS Country_Name,
--continent,
--region,
--country.population AS Country_Population,
--city.population AS City_Population,
--localname,
--country.capital AS Country_Capital_ID,
--city.id AS City_ID
--FROM country
--INNER JOIN city ON country.code = city.countrycode WHERE city.name = country.name;

--Pull all the cities in the countries from that result
--SELECT 
--city.name AS City_Name,
--code,
--country.name AS Country_Name,
--continent,
--region,
--country.population AS Country_Population,
--city.population AS City_Population,
--localname,
--country.capital AS Country_Capital_ID,
--city.id AS City_ID
--FROM country
--INNER JOIN city ON country.code = city.countrycode WHERE country.name IN (
--'Djibouti',
--'Gibraltar',
--'Kuwait',
--'Macao',
--'San Marino',
--'Singapore'
--);



--
--SELECT 
--city.name AS City_Name,
--code,
--country.name AS Country_Name,
--continent,
--region,
--country.population AS Country_Population,
--city.population AS City_Population,
--localname,
--country.capital AS Country_Capital_ID,
--city.id AS City_ID
--FROM country
--INNER JOIN city ON country.code = city.countrycode
--WHERE continent='South America' AND country.capital = city.id
--ORDER BY city.population ASC;


--Last clue to find out that Carmen is in Santa Monica
SELECT * FROM city WHERE population BETWEEN 91084 AND 91086;
