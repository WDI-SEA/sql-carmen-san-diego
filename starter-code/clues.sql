-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.

SELECT name, population, region FROM country WHERE region = 'Southern Europe' ORDER BY population ASC;
            name              | population |     region      
-------------------------------+------------+-----------------
 Holy See (Vatican City State) |       1000 | Southern Europe -- Least populated country in Southern Europe!
 Gibraltar                     |      25000 | Southern Europe
 San Marino                    |      27000 | Southern Europe
 Andorra                       |      78000 | Southern Europe
 Malta                         |     380200 | Southern Europe
 Slovenia                      |    1987800 | Southern Europe
 Macedonia                     |    2024000 | Southern Europe
 Albania                       |    3401200 | Southern Europe
 Bosnia and Herzegovina        |    3972000 | Southern Europe
 Croatia                       |    4473000 | Southern Europe
 Portugal                      |    9997600 | Southern Europe
 Greece                        |   10545700 | Southern Europe
 Yugoslavia                    |   10640000 | Southern Europe
 Spain                         |   39441700 | Southern Europe
 Italy                         |   57680000 | Southern Europe
(15 rows)

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

SELECT * FROM country language WHERE population < 1001;
VAT  | Holy See (Vatican City State)                | Europe     | Southern Europe           |         0.4 |      1929 |       1000 |                | 9.00 |        | Santa Sede/Citt� del Vaticano                | Independent Church State            | Johannes Paavali II |    3538 | VA

-- country code is VAT
SELECT language FROM countrylanguage WHERE countrycode = 'VAT';
 language 
----------
 Italian
(1 row)


-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.

SELECT * FROM countrylanguage WHERE language = 'Italian' AND isofficial = 'true' AND percentage = 100;
 countrycode | language | isofficial | percentage 
-------------+----------+------------+------------
 SMR         | Italian  | t          |        100
(1 row)


-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.

world=# SELECT name FROM city WHERE countrycode = 'SMR';
    name    
------------
 Serravalle -- That's the city!
 San Marino
 (2 rows)

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

--Try finding similar cities:
world=# SELECT * FROM city WHERE name LIKE 'Serra%';
  id  |    name    | countrycode |     district      | population 
------+------------+-------------+-------------------+------------
  265 | Serra      | BRA         | Esp�rito Santo    |     302666
 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
(2 rows)


SELECT name, code, region, capital FROM country WHERE continent = 'South America';
       name       | code |    region     | capital 
------------------+------+---------------+---------
 Argentina        | ARG  | South America |      69
 Bolivia          | BOL  | South America |     194
 Brazil           | BRA  | South America |     211 -- That's the country!
 Chile            | CHL  | South America |     554 
 Ecuador          | ECU  | South America |     594
 Falkland Islands | FLK  | South America |     763
 Guyana           | GUY  | South America |     928
 Colombia         | COL  | South America |    2257
 Paraguay         | PRY  | South America |    2885
 Peru             | PER  | South America |    2890
 French Guiana    | GUF  | South America |    3014
 Suriname         | SUR  | South America |    3243
 Uruguay          | URY  | South America |    3492
 Venezuela        | VEN  | South America |    3539
(14 rows)


-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!

SELECT name FROM city WHERE id = 211;
   name   
----------
 Bras�lia -- That's the city!
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

SELECT name FROM city WHERE population = 91084;
     name     
--------------
 Santa Monica
(1 row)

-- She's in ___Santa Monica_________________________!
