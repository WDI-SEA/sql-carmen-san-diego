-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description 
-- has been traveling through Southern Europe. She's most likely traveling someplace 
-- where she won't be noticed, so find the least populated country in Southern Europe, 
-- and we'll start looking for her there.

SELECT name, region, population 
FROM country
WHERE region = 'Southern Europe'
ORDER BY population ASC
LIMIT 1;

             name              |     region      | population 
-------------------------------+-----------------+------------
 Holy See (Vatican City State) | Southern Europe |       1000
(1 row)


-- Clue #2: Now that we're here, we have insight that Carmen was seen attending 
-- language classes in this country's officially recognized language. Check our 
-- databases and find out what language is spoken in this country, so we can call
-- in a translator to work with you.

SELECT code, name region, population, language 
FROM country
INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE region = 'Southern Europe'
ORDER BY population ASC
LIMIT 1;

 code |            region             | population | language 
------+-------------------------------+------------+----------
 VAT  | Holy See (Vatican City State) |       1000 | Italian
(1 row)

-- Clue #3: We have new news on the classes Carmen attended: our gumshoes tell us 
-- she's moved on to a different country, a country where people speak only the 
-- language she was learning. Find out which nearby country speaks nothing but 
-- that language.

SELECT name, language, percentage
FROM country
INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode 
WHERE language = 'Italian'
AND percentage = 100;

    name    | language | percentage 
------------+----------+------------
 San Marino | Italian  |        100
(1 row)

--Clue #4: We're booking the first flight out: maybe we've actually got a chance 
--to catch her this time. There are only two cities she could be flying to in the 
--country. One is named the same as the country – that would be too obvious. We're 
--following our gut on this one; find out what other city in that country she 
--might be flying to.

SELECT id, city.name, country.name 
FROM city
INNER JOIN country on city.countrycode = country.code
WHERE city.countrycode = 'SMR'
AND city.name <> country.name;

  id  | city_name  | country_name 
------+------------+--------------
 3170 | Serravalle | San Marino
(1 row)


-- Clue #5: Oh no, she pulled a switch: there are two cities with very similar 
-- names, but in totally different parts of the globe! She's headed to South 
-- America as we speak; go find a city whose name is like the one we were headed to,
-- but doesn't end the same. Find out the city, and do another search for what 
-- country it's in. Hurry!

SELECT city.name, country.name,  FROM country
INNER JOIN city
WHERE city.name LIKE 'Serra%'
AND country.region = 'South America';

 name  |  name  
-------+--------
 Serra | Brazil
(1 row)

--Clue #6: We're close! Our South American agent says she just got a taxi at the 
--airport, and is headed towards the capital! Look up the country's capital, and 
--get there pronto! Send us the name of where you're headed and we'll follow right 
--behind you!

SELECT name FROM city
WHERE id = (
  SELECT capital FROM country
  WHERE name = 'Brazil';
);

   name   
----------
 Bras�lia
(1 row)


-- Clue #7: She knows we're on to her: her taxi dropped her off at the 
-- international airport, and she beat us to the boarding gates. We have one
-- chance to catch her, we just have to know where she's heading and beat her
-- to the landing dock.

SELECT * FROM city
WHERE population = 91085
OR population = 91084;

  id  |     name     | countrycode |  district  | population 
------+--------------+-------------+------------+------------
 4060 | Santa Monica | USA         | California |      91084
(1 row)
