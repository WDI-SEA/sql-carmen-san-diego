-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.



-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.



-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.



-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.



-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!



-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!



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



-- She's in Santa Monica!

world=# \d
               List of relations
 Schema |       Name       | Type  |   Owner   
--------+------------------+-------+-----------
 public | cities           | table | aimeepham
 public | countries        | table | aimeepham
 public | countrylanguages | table | aimeepham
(3 rows)

world=# SELECT * FROM cities
world-# ;
world=# SELECT * FROM countries;
world=# SELECT * FROM countries WHERE region = 'Southern Europe';
world=# SELECT * FROM countrylanguages;
world=# SELECT * FROM countries WHERE region = 'Southern Europe';
world=# SELECT * FROM countrylanguages;
world=# SELECT * FROM countrylanguages WHERE countrycode = 'VAT', 'GIB', 'AND', 'SMR';
ERROR:  syntax error at or near ","
LINE 1: ... * FROM countrylanguages WHERE countrycode = 'VAT', 'GIB', '...
                                                             ^
world=# SELECT * FROM countrylanguages WHERE countrycode = 'VAT';
 countrycode | language | isofficial | percentage 
-------------+----------+------------+------------
 VAT         | Italian  | t          |          0
(1 row)

world=# SELECT * FROM countrylanguages WHERE countrycode = 'GIB';
 countrycode | language | isofficial | percentage 
-------------+----------+------------+------------
 GIB         | English  | t          |       88.9
 GIB         | Arabic   | f          |        7.4
(2 rows)

world=# SELECT * FROM countrylanguages WHERE countrycode = 'AND';
 countrycode |  language  | isofficial | percentage 
-------------+------------+------------+------------
 AND         | Spanish    | f          |       44.6
 AND         | Catalan    | t          |       32.3
 AND         | Portuguese | f          |       10.8
 AND         | French     | f          |        6.2
(4 rows)

world=# SELECT * FROM countrylanguages WHERE countrycode = 'SMR';
 countrycode | language | isofficial | percentage 
-------------+----------+------------+------------
 SMR         | Italian  | t          |        100
(1 row)

world=# SELECT * FROM cities
;
world=# SELECT * FROM countries;
world=# SELECT * FROM cities
;
world=# SELECT * FROM cities WHERE countrycode = 'SMR';
  id  |    name    | countrycode |     district      | population 
------+------------+-------------+-------------------+------------
 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
 3171 | San Marino | SMR         | San Marino        |       2294
(2 rows)

world=# SELECT * FROM countries;                       
world=# SELECT * FROM countries WHERE localname = 'Serravalle'
world-# SELECT * FROM countries WHERE region = 'South America'
world-# ;
ERROR:  syntax error at or near "SELECT"
LINE 2: SELECT * FROM countries WHERE region = 'South America'
        ^
world=# SELECT * FROM countries WHERE localname = 'Serravalle'
SELECT * FROM countries WHERE region = 'South America'
;
ERROR:  syntax error at or near "SELECT"
LINE 2: SELECT * FROM countries WHERE region = 'South America'
        ^
world=# SELECT * FROM countries WHERE region = 'South America';
world=# SELECT * FROM cities;
world=# SELECT * FROM cities WHERE name LIKE {Serr};
ERROR:  syntax error at or near "{"
LINE 1: SELECT * FROM cities WHERE name LIKE {Serr};
                                             ^
world=# SELECT * FROM cities WHERE name LIKE Serr;
ERROR:  column "serr" does not exist
LINE 1: SELECT * FROM cities WHERE name LIKE Serr;
                                             ^
world=# SELECT * FROM cities WHERE name LIKE 'Serr';
 id | name | countrycode | district | population 
----+------+-------------+----------+------------
(0 rows)

world=# SELECT * FROM cities WHERE name LIKE 'serr';
 id | name | countrycode | district | population 
----+------+-------------+----------+------------
(0 rows)

world=# SELECT * FROM cities WHERE name LIKE 'san';
 id | name | countrycode | district | population 
----+------+-------------+----------+------------
(0 rows)

world=# SELECT * FROM cities WHERE name = 'serr';
 id | name | countrycode | district | population 
----+------+-------------+----------+------------
(0 rows)

world=# SELECT * FROM cities WHERE name = 'san';
 id | name | countrycode | district | population 
----+------+-------------+----------+------------
(0 rows)

world=# SELECT * FROM cities WHERE name = 'valle';
 id | name | countrycode | district | population 
----+------+-------------+----------+------------
(0 rows)

world=# SELECT * FROM cities WHERE NAME LIKE 'Serr';
 id | name | countrycode | district | population 
----+------+-------------+----------+------------
(0 rows)

world=# SELECT * FROM cities WHERE NAME LIKE 'Serr%';
  id  |    name    | countrycode |     district      | population 
------+------------+-------------+-------------------+------------
  265 | Serra      | BRA         | Esp�rito Santo    |     302666
 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
(2 rows)

world=# SELECT * FROM countries
world-# ;
world=# SELECT * FROM cities
world-# ;
world=# SELECT * FROM cities
;
world=# SELECT * FROM cities       
;
world=# SELECT * FROM cities WHERE name = 'Bras�lia';
 id  |   name   | countrycode |     district     | population 
-----+----------+-------------+------------------+------------
 211 | Bras�lia | BRA         | Distrito Federal |    1969868
(1 row)

world=# SELECT * FROM cities WHERE population = '91084'
world-# ;
  id  |     name     | countrycode |  district  | population 
------+--------------+-------------+------------+------------
 4060 | Santa Monica | USA         | California |      91084
(1 row)
