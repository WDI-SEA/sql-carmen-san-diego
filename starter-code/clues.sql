-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.

SELECT * FROM countries WHERE region = 'Southern Europe';
 code |              name               | continent |     region      | surfacearea | indepyear | population | lifeexpectancy |    gnp     |   gnpold   |           localname           |        governmentform 
 VAT  | Holy See (Vatican Cities State) | Europe    | Southern Europe |         0.4 |      1929 |       1000 |                |       9.00 |            | Santa Sede/Citt� del Vaticano | Independent Church State      
        | Johannes Paavali II  |    3538 | VA

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

SELECT * FROM countrylanguages WHERE countrycode ='VAT';
 countrycode | language | isofficial | percentage
-------------+----------+------------+------------
 VAT         | Italian  | t          |          0


-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.

SELECT * FROM countrylanguages WHERE language = 'Italian';
 countrycode | language | isofficial | percentage
-------------+----------+------------+------------
 SMR         | Italian  | t          |        100


  SMR  | San Marino                      | Europe    | Southern Europe |          61 |       885 |      27000 |           81.1 |     510.00 |            | San Marino                    | Republic
       |                      |    3171 | SM

-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.

SELECT * FROM cities WHERE countrycode = 'SMR';

  id  |    name    | countrycode |     district      | population
------+------------+-------------+-------------------+------------
 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
 3171 | San Marino | SMR         | San Marino        |       2294


-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

SELECT * FROM countries WHERE region = 'South America';

 code |       name       |   continent   |    region     | surfacearea  | indepyear | population | lifeexpectancy |    gnp    |  gnpold   |    localname     |        governmentform         |        headofstate         | capital | code2
------+------------------+---------------+---------------+--------------+-----------+------------+----------------+-----------+-----------+------------------+-------------------------------+----------------------------+---------+-------
 ARG  | Argentina        | South America | South America |   2.7804e+06 |      1816 |   37032000 |           75.1 | 340238.00 | 323310.00 | Argentina        | Federal Republic              | Fernando de la R�a         |      69 | AR
 BOL  | Bolivia          | South America | South America | 1.098581e+06 |      1825 |    8329000 |           63.7 |   8571.00 |   7967.00 | Bolivia          | Republic                      | Hugo B�nzer Su�rez         |     194 | BO
 BRA  | Brazil           | South America | South America | 8.547403e+06 |      1822 |  170115000 |           62.9 | 776739.00 | 804108.00 | Brasil           | Federal Republic              | Fernando Henrique Cardoso  |     211 | BR
 CHL  | Chile            | South America | South America |       756626 |      1810 |   15211000 |           75.7 |  72949.00 |  75780.00 | Chile            | Republic                      | Ricardo Lagos Escobar      |     554 | CL
 ECU  | Ecuador          | South America | South America |       283561 |      1822 |   12646000 |           71.1 |  19770.00 |  19769.00 | Ecuador          | Republic                      | Gustavo Noboa Bejarano     |     594 | EC
 FLK  | Falkland Islands | South America | South America |        12173 |           |       2000 |                |      0.00 |           | Falkland Islands | Dependent Territory of the UK | Elisabeth II               |     763 | FK
 GUY  | Guyana           | South America | South America |       214969 |      1966 |     861000 |             64 |    722.00 |    743.00 | Guyana           | Republic                      | Bharrat Jagdeo             |     928 | GY
 COL  | Colombia         | South America | South America | 1.138914e+06 |      1810 |   42321000 |           70.3 | 102896.00 | 105116.00 | Colombia         | Republic                      | Andr�s Pastrana Arango     |    2257 | CO
 PRY  | Paraguay         | South America | South America |       406752 |      1811 |    5496000 |           73.7 |   8444.00 |   9555.00 | Paraguay         | Republic                      | Luis �ngel Gonz�lez Macchi |    2885 | PY
 PER  | Peru             | South America | South America | 1.285216e+06 |      1821 |   25662000 |             70 |  64140.00 |  65186.00 | Per�/Piruw       | Republic                      | Valentin Paniagua Corazao  |    2890 | PE
 GUF  | French Guiana    | South America | South America |        90000 |           |     181000 |           76.1 |    681.00 |           | Guyane fran�aise | Overseas Department of France | Jacques Chirac             |    3014 | GF
 SUR  | Suriname         | South America | South America |       163265 |      1975 |     417000 |           71.4 |    870.00 |    706.00 | Suriname         | Republic                      | Ronald Venetiaan           |    3243 | SR
 URY  | Uruguay          | South America | South America |       175016 |      1828 |    3337000 |           75.2 |  20831.00 |  19967.00 | Uruguay          | Republic                      | Jorge Batlle Ib��ez        |    3492 | UY
 VEN  | Venezuela        | South America | South America |       912050 |      1811 |   24170000 |           73.1 |  95023.00 |  88434.00 | Venezuela        | Federal Republic              | Hugo Ch�vez Fr�as          |    3539 | VE

SELECT * FROM cities WHERE name LIKE 'Serra%';

  id  |    name    | countrycode |     district      | population
------+------------+-------------+-------------------+------------
  265 | Serra      | BRA         | Esp�rito Santo    |     302666
 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802


-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!
 SELECT * FROM countries WHERE continent = 'South America';

 code |       name       |   continent   |    region     | surfacearea  | indepyear | population | lifeexpectancy |    gnp    |  gnpold   |    localname     |        governmentform         |        headofstate         | capital | code2
------+------------------+---------------+---------------+--------------+-----------+------------+----------------+-----------+-----------+------------------+-------------------------------+----------------------------+---------+-------
 BRA  | Brazil           | South America | South America | 8.547403e+06 |      1822 |  170115000 |           62.9 | 776739.00 | 804108.00 | Brasil           | Federal Republic              | Fernando Henrique Cardoso  |     211 | BR

SELECT * FROM cities WHERE id = '211';
 id  |   name   | countrycode |     district     | population
-----+----------+-------------+------------------+------------
 211 | Bras�lia | BRA         | Distrito Federal |    1969868

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
                                    91,084

SELECT * FROM cities WHERE population = 91084;
  id  |     name     | countrycode |  district  | population
------+--------------+-------------+------------+------------
 4060 | Santa Monica | USA         | California |      91084

-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.



-- She's in ____________________________!

SHE'S IN SANTA MONICA!
