-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.

--  code |              name               | continent |     region      | surfacearea | indepyear | population | lifeexpectancy |    gnp     |   gnpold   |           localname           |        governmentform         |     headofstate      | capital | code2 
-- ------+---------------------------------+-----------+-----------------+-------------+-----------+------------+----------------+------------+------------+-------------------------------+-------------------------------+----------------------+---------+-------
--  ALB  | Albania                         | Europe    | Southern Europe |       28748 |      1912 |    3401200 |           71.6 |    3205.00 |    2500.00 | Shqip�ria                     | Republic                      | Rexhep Mejdani       |      34 | AL
--  AND  | Andorra                         | Europe    | Southern Europe |         468 |      1278 |      78000 |           83.5 |    1630.00 |            | Andorra                       | Parliamentary Coprincipality  |                      |      55 | AD
--  BIH  | Bosnia and Herzegovina          | Europe    | Southern Europe |       51197 |      1992 |    3972000 |           71.5 |    2841.00 |            | Bosna i Hercegovina           | Federal Republic              | Ante Jelavic         |     201 | BA
--  ESP  | Spain                           | Europe    | Southern Europe |      505992 |      1492 |   39441700 |           78.8 |  553233.00 |  532031.00 | Espa�a                        | Constitutional Monarchy       | Juan Carlos I        |     653 | ES
--  GIB  | Gibraltar                       | Europe    | Southern Europe |           6 |           |      25000 |             79 |     258.00 |            | Gibraltar                     | Dependent Territory of the UK | Elisabeth II         |     915 | GI
--  ITA  | Italy                           | Europe    | Southern Europe |      301316 |      1861 |   57680000 |             79 | 1161755.00 | 1145372.00 | Italia                        | Republic                      | Carlo Azeglio Ciampi |    1464 | IT
--  YUG  | Yugoslavia                      | Europe    | Southern Europe |      102173 |      1918 |   10640000 |           72.4 |   17000.00 |            | Jugoslavija                   | Federal Republic              | Vojislav Ko�tunica   |    1792 | YU
--  GRC  | Greece                          | Europe    | Southern Europe |      131626 |      1830 |   10545700 |           78.4 |  120724.00 |  119946.00 | Ell�da                        | Republic                      | Kostis Stefanopoulos |    2401 | GR
--  HRV  | Croatia                         | Europe    | Southern Europe |       56538 |      1991 |    4473000 |           73.7 |   20208.00 |   19300.00 | Hrvatska                      | Republic                      | �tipe Mesic          |    2409 | HR
--  MKD  | Macedonia                       | Europe    | Southern Europe |       25713 |      1991 |    2024000 |           73.8 |    1694.00 |    1915.00 | Makedonija                    | Republic                      | Boris Trajkovski     |    2460 | MK
--  MLT  | Malta                           | Europe    | Southern Europe |         316 |      1964 |     380200 |           77.9 |    3512.00 |    3338.00 | Malta                         | Republic                      | Guido de Marco       |    2484 | MT
--  PRT  | Portugal                        | Europe    | Southern Europe |       91982 |      1143 |    9997600 |           75.8 |  105954.00 |  102133.00 | Portugal                      | Republic                      | Jorge Samp�io        |    2914 | PT
--  SMR  | San Marino                      | Europe    | Southern Europe |          61 |       885 |      27000 |           81.1 |     510.00 |            | San Marino                    | Republic                      |                      |    3171 | SM
--  SVN  | Slovenia                        | Europe    | Southern Europe |       20256 |      1991 |    1987800 |           74.9 |   19756.00 |   18202.00 | Slovenija                     | Republic                      | Milan Kucan          |    3212 | SI
--  VAT  | Holy See (Vatican Cities State) | Europe    | Southern Europe |         0.4 |      1929 |       1000 |                |       9.00 |            | Santa Sede/Citt� del Vaticano | Independent Church State      | Johannes Paavali II  |    3538 | VA
-- (15 rows)

-- VAT  | Holy See (Vatican Cities State) | Europe    | Southern Europe |         0.4 |      1929 |       1000 |                |       9.00 |            | Santa Sede/Citt� del Vaticano | Independent Church State      | Johannes Paavali II  |    3538 | VA

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

--  countrycode | language | isofficial | percentage 
-- -------------+----------+------------+------------
--  VAT         | Italian  | t          |          0
-- (1 row)

-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.

--  code |    name    | continent |     region      | surfacearea | indepyear | population | lifeexpectancy |  gnp   | gnpold | localname  | governmentform | headofstate | capital | code2 
-- ------+------------+-----------+-----------------+-------------+-----------+------------+----------------+--------+--------+------------+----------------+-------------+---------+-------
--  SMR  | San Marino | Europe    | Southern Europe |          61 |       885 |      27000 |           81.1 | 510.00 |        | San Marino | Republic       |             |    3171 | SM
-- (1 row)

-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.

--   id  |    name    | countrycode |     district      | population 
-- ------+------------+-------------+-------------------+------------
--  3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
--  3171 | San Marino | SMR         | San Marino        |       2294
-- (2 rows)

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

-- world=# SELECT * FROM cities WHERE name LIKE 'Serra%';
--   id  |    name    | countrycode |     district      | population 
-- ------+------------+-------------+-------------------+------------
--   265 | Serra      | BRA         | Esp�rito Santo    |     302666
--  3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
-- (2 rows)


-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!

--  id  |   name   | countrycode |     district     | population 
-- -----+----------+-------------+------------------+------------
--  211 | Bras�lia | BRA         | Distrito Federal |    1969868
-- (1 row)

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

-- She's in   

-- world=# SELECT * FROM cities WHERE population = '91084';
--   id  |     name     | countrycode |  district  | population 
-- ------+--------------+-------------+------------+------------
--  4060 | Santa Monica | USA         | California |      91084
-- (1 row)

