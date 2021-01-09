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



-- She's in __Santa Monica!

1.SELECT * FROM countries WHERE region = 'Southern Europe' ORDER BY population ASC;

 code |              name               | continent |     region      | surfacearea | indepyear | population | lifeexpectancy |    gnp     |   gnpold   |           localname           |        governmentform         |     headofstate      | capital | code2 

------+---------------------------------+-----------+-----------------+-------------+-----------+------------+----------------+------------+------------+-------------------------------+-------------------------------+----------------------+---------+-------

 VAT  | Holy See (Vatican Cities State) | Europe    | Southern Europe |         0.4 |      1929 |       1000 |                |       9.00 |            | Santa Sede/Citt del Vaticano | Independent Church State      | Johannes Paavali II  |    3538 | VA

 GIB  | Gibraltar                       | Europe    | Southern Europe |           6 |           |      25000 |             79 |     258.00 |            | Gibraltar                     | Dependent Territory of the UK | Elisabeth II         |     915 | GI

 SMR  | San Marino                      | Europe    | Southern Europe |          61 |       885 |      27000 |           81.1 |     510.00 |            | San Marino                    | Republic                      |                      |    3171 | SM

 AND  | Andorra                         | Europe    | Southern Europe |         468 |      1278 |      78000 |           83.5 |    1630.00 |            | Andorra                       | Parliamentary Coprincipality  |                      |      55 | AD

 MLT  | Malta                           | Europe    | Southern Europe |         316 |      1964 |     380200 |           77.9 |    3512.00 |    3338.00 | Malta                         | Republic                      | Guido de Marco       |    2484 | MT

 SVN  | Slovenia                        | Europe    | Southern Europe |       20256 |      1991 |    1987800 |           74.9 |   19756.00 |   18202.00 | Slovenija                     | Republic      



2.SELECT name, population FROM countries WHERE region = 'Southern Europe' ORDER BY population ASC;

              name               | population 

---------------------------------+------------

 Holy See (Vatican Cities State) |       1000

 Gibraltar                       |      25000

 San Marino                      |      27000

 Andorra                         |      78000

 Malta                           |     380200

 Slovenia                        |    1987800

 Macedonia                       |    2024000

 Albania                         |    3401200

 Bosnia and Herzegovina          |    3972000

 Croatia                         |    4473000

 Portugal                        |    9997600

 Greece                          |   10545700

 Yugoslavia                      |   10640000

 Spain                           |   39441700

 Italy                           |   57680000

(15 rows)

world=# SELECT code FROM countries WHERE region = 'Southern Europe';

 code 

------

 ALB

 AND

 BIH

 ESP

 GIB

 ITA

 YUG

 GRC

 HRV

 MKD

 MLT

 PRT

 SMR

 SVN

 VAT

(15 rows)



4.world=# SELECT language FROM countrylanguages WHERE countrycode = 'VAT';

 language 

----------

 Italian



5. world=# SELECT * FROM countrylanguages WHERE language = 'Italian';

 countrycode | language | isofficial | percentage 

-------------+----------+------------+------------

 ITA         | Italian  | t          |       94.1

 SMR         | Italian  | t          |        100

 VAT         | Italian  | t          |          0

 ARG         | Italian  | f          |        1.7

 AUS         | Italian  | f          |        2.2

 LIE         | Italian  | f          |        2.5

 BEL         | Italian  | f          |        2.4

 BRA         | Italian  | f          |        0.4

 LUX         | Italian  | f          |        4.6

 MCO         | Italian  | f          |       16.1

 CHE         | Italian  | t          |        7.7

 CAN         | Italian  | f          |        1.7

 FRA         | Italian  | f          |        0.4

 DEU         | Italian  | f          |        0.7

 USA         | Italian  | f          |        0.6

(15 rows)


6. world=# SELECT * FROM countries WHERE code = 'SMR';
 code |    name    | continent |     region      | surfacearea | indepyear | population | lifeexpectancy |  gnp   | gnpold | localname  | governmentform | headofstate | capital | code2 

------+------------+-----------+-----------------+-------------+-----------+------------+----------------+--------+--------+------------+----------------+-------------+---------+-------

 SMR  | San Marino | Europe    | Southern Europe |          61 |       885 |      27000 |           81.1 | 510.00 |        | San Marino | Republic       |             |    3171 | SM


7. world=# SELECT * FROM cities WHERE countrycode = 'SMR';
  id  |    name    | countrycode |     district      | population 

------+------------+-------------+-------------------+------------

 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802

 3171 | San Marino | SMR         | San Marino        |       2294

7. world=# SELECT countrycode FROM cities WHERE name LIKE 'Serr%';
 countrycode 

-------------

 BRA

 SMR

8. world=# SELECT name FROM countries WHERE code = 'BRA';
  name  

--------

 Brazil

9. world=# SELECT * FROM cities WHERE id = 211;

 id  |   name   | countrycode |     district     | population 

-----+----------+-------------+------------------+------------

 211 | Braslia | BRA         | Distrito Federal |    1969868



10. world=# SELECT * FROM cities WHERE population = 91084;

  id  |     name     | countrycode |  district  | population 

------+--------------+-------------+------------+------------

 4060 | Santa Monica | USA         | California |      91084



