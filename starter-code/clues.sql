-- SQL Deliverable - Emily Ryan

-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.

    world-# \d countries
                            Table "public.countries"
            Column     |     Type      | Collation | Nullable | Default 
        ----------------+---------------+-----------+----------+---------
        code           | character(3)  |           | not null | 
        name           | text          |           | not null | 
        continent      | text          |           | not null | 
        region         | text          |           | not null | 
        surfacearea    | real          |           | not null | 
        indepyear      | smallint      |           |          | 
        population     | integer       |           | not null | 
        lifeexpectancy | real          |           |          | 
        gnp            | numeric(10,2) |           |          | 
        gnpold         | numeric(10,2) |           |          | 
        localname      | text          |           | not null | 
        governmentform | text          |           | not null | 
        headofstate    | text          |           |          | 
        capital        | integer       |           |          | 
        code2          | character(2)  |           | not null | 

    world=# SELECT name, region, population, code FROM countries WHERE region = 'Southern Europe' ORDER BY population DESC;

                name               |     region      | population 
        ---------------------------------+-----------------+------------
        Italy                           | Southern Europe |   57680000
        Spain                           | Southern Europe |   39441700
        Yugoslavia                      | Southern Europe |   10640000
        Greece                          | Southern Europe |   10545700
        Portugal                        | Southern Europe |    9997600
        Croatia                         | Southern Europe |    4473000
        Bosnia and Herzegovina          | Southern Europe |    3972000
        Albania                         | Southern Europe |    3401200
        Macedonia                       | Southern Europe |    2024000
        Slovenia                        | Southern Europe |    1987800
        Malta                           | Southern Europe |     380200
        Andorra                         | Southern Europe |      78000
        San Marino                      | Southern Europe |      27000 
        Gibraltar                       | Southern Europe |      25000
        Holy See (Vatican Cities State) | Southern Europe |       1000
        (15 rows)
        -- Smallest population = Holy See (Vatican Cities State), VAT


-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

    world=# SELECT language, countrycode FROM countrylanguages WHERE countrycode = 'VAT';

        language | countrycode 
        ----------+-------------
        Italian  | VAT
        (1 row)
        -- Language spoken: Italian


-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.

    world=# SELECT language, countrycode, percentage FROM countrylanguages WHERE language = 'Italian' AND percentage = '100';

        language | countrycode | percentage 
        ----------+-------------+------------ 
        Italian  | SMR         |        100
        (1 row)
        --Country code: SMR

    world=# SELECT name, continent, code FROM countries WHERE code = 'SMR';

        name    | continent | code 
        ------------+-----------+------
        San Marino | Europe    | SMR
        (1 row)
        -- Country name: San Marino

-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.

    world=# SELECT name, countrycode FROM cities WHERE countrycode = 'SMR';
        name    | countrycode 
        ------------+-------------
        Serravalle | SMR
        San Marino | SMR
        (2 rows)
        -- Two city options: San Marino and Serravalle
        -- Correct city: Serravalle

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

    world=# SELECT * FROM cities WHERE name LIKE 'Serra%';
          id  |    name    | countrycode |     district      | population 
        ------+------------+-------------+-------------------+------------
        265 | Serra      | BRA         | Esp�rito Santo    |     302666
        3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
        (2 rows)
        -- City: Serra, countrycode: BRA

    world=# SELECT name, continent, code FROM countries WHERE code = 'BRA';
        name  |   continent   | code 
        --------+---------------+------
        Brazil | South America | BRA
        (1 row)
        -- Country: Brazil in South America

-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!

    world=# SELECT code, capital FROM countries WHERE code = 'BRA';
        code | capital 
        ------+---------
        BRA  |     211
        (1 row)
        -- Capital: 211

    world=# SELECT id, name FROM cities WHERE id = '211';
        id  |   name   
        -----+----------
        211 | Bras�lia
        (1 row)
        -- Capital name: Brasilia

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

    world=# SELECT * FROM cities WHERE population = 91084;
        id  |     name     | countrycode |  district  | population 
        ------+--------------+-------------+------------+------------
        4060 | Santa Monica | USA         | California |      91084

-- She's in ___________Santa Monica, CA_________________!
