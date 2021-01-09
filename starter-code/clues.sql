-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.

world=# SELECT name FROM countries WHERE region='Southern Europe' ORDER BY population ASC LIMIT 1 ;
              name
---------------------------------
 Holy See (Vatican Cities State)
(1 row)

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

world=# SELECT  countrylanguages.language                
world-# FROM countries INNER JOIN countrylanguages
world-# ON countries.code=countrylanguages.countrycode WHERE countries.name ='Holy See (Vatican Cities State)' ;
 language
----------
 Italian
(1 row)

-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.

world=# SELECT countrylanguages.language , countrylanguages.percentage, countries.name
world=#  SELECT countrylanguages.language , countrylanguages.percentage, countries.name, countries.code
world-# FROM countries INNER JOIN countrylanguages 
world-# ON countries.code=countrylanguages.countrycode WHERE countrylanguages.language='Italian'  ORDER BY countrylanguages.percentage DESC  LIMIT 1;
 language | percentage |    name    | code
----------+------------+------------+------
 Italian  |        100 | San Marino | SMR

-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.

world=# SELECT name FROM cities WHERE countrycode='SMR' ;
    name
------------
 Serravalle
 San Marino

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

world=# SELECT cities.name, countries.name, cities.countrycode
world-# FROM cities INNER JOIN countries
world-# ON cities.countrycode=countries.code WHERE cities.name LIKE 'Serr%'; 
    name    |    name    | countrycode
------------+------------+-------------
 Serra      | Brazil     | BRA
 Serravalle | San Marino | SMR

-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!

world=# SELECT capital FROM countries WHERE code = 'BRA';
 capital
---------
     211

-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to
 -- the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the
 -- landing dock.
-- Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but
-- if we can crack it, we can finally put her where she belongs – behind bars.

-- Our play date of late has been unusually fun –
-- As an agent, I'll say, you've been a joy to outrun.
-- And while the food here is great, and the people – so nice!
-- I need a little more sunshine with my slice of life.
-- So I'm off to add one to the population I find
-- In a city of ninety-one thousand and now, eighty five.


-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.


world=# SELECT name FROM cities WHERE population='91084'; 
     name     
--------------
 Santa Monica
-- She's in ____________________________!
