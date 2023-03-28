-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.
world=# SELECT countries.name, countries.population FROM countries WHERE population > 0 AND countries.continent = 'Europe' ORDER BY population LIMIT 1;
              name               | population 
---------------------------------+------------
 Holy See (Vatican Cities State) |       1000
(1 row)


-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.
world=# SELECT countries.code FROM countries WHERE name = 'Holy See (Vatican Cities State)';
 code 
------
 VAT
(1 row)

world=# SELECT countrylanguages.language, countrylanguages.isofficial FROM countrylanguages WHERE countrylanguages.countrycode = 'VAT';
 language | isofficial 
----------+------------
 Italian  | t
(1 row)



-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.

world=# SELECT countries.region FROM countries WHERE name = 'Holy See (Vatican Cities State)';
     region      
-----------------
 Southern Europe
(1 row)

world=# SELECT countrylanguages.countrycode FROM countrylanguages WHERE countrylanguages.language = 'Italian' AND countrylanguages.percentage = 100;
 countrycode 
-------------
 SMR
(1 row)

world=# SELECT countries.region FROM countries WHERE countries.code ='SMR';
     region      
-----------------
 Southern Europe
(1 row)

-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.

world=# SELECT countries.name FROM countries WHERE countries.code ='SMR';
    name    
------------
 San Marino
(1 row)

world=# SELECT cities.name FROM cities WHERE NOT cities.name = 'San Marino' AND cities.countrycode = 'SMR';                 
    name    
------------
 Serravalle
(1 row)


-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

world=# SELECT * FROM cities WHERE cities.name LIKE '%Mari%';
  id  |          name           | countrycode |       district       | population 
------+-------------------------+-------------+----------------------+------------
  271 | Maring�                 | BRA         | Paran�               |     286461
  293 | Santa Maria             | BRA         | Rio Grande do Sul    |     238473
  781 | Marikina                | PHL         | National Capital Reg |     391170
  828 | Santa Maria             | PHL         | Central Luzon        |     144282
  856 | General Mariano Alvarez | PHL         | Southern Tagalog     |     112446
  881 | Marilao                 | PHL         | Central Luzon        |     101017
 3171 | San Marino              | SMR         | San Marino           |       2294
 3213 | Maribor                 | SVN         | Podravska            |     115532
 3435 | Mariupol                | UKR         | Donetsk              |     490000
(9 rows)



-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!
world=# SELECT countries.capital FROM countries WHERE countries.code = 'BRA';
 capital 
---------
     211
(1 row)

world=# SELECT cities.name FROM cities WHERE cities.id = 211;
   name   
----------
 Brasília
(1 row)


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

world=# SELECT cities.name, cities.countrycode FROM cities WHERE cities.population = 91084;
     name     | countrycode 
--------------+-------------
 Santa Monica | USA
(1 row)


-- She's in ________Santa Monica____________________!
