-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.

SELECT * FROM countries WHERE region = 'Southern Europe' ORDER BY population ASC;

-- Carmen was spotted in VAT (Vatican City)

------------------------------------------------------------------
-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

SELECT * FROM countrylanguages WHERE countrycode = 'VAT'; 
-- I got errors when I used double quotes. HAVE to use single quotes in SQL!!
-- Official language in VAT is Italian.

-------------------------------------------------------------------
-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.

-- Want to do an inner join where countries.region = Southern Europe, countrylanguages.language = Italian, countrylanguages.isofficial = t. Foreign key is countrycode.

SELECT c.code, c.region, cl.language, cl.isofficial
FROM countries c INNER JOIN countrylanguages cl
ON c.code=cl.countrycode
WHERE c.region = 'Southern Europe' AND cl.language = 'Italian' AND cl.isofficial = 't'
-- Carmen is either in ITA or SMR, and is leaving VAT.

SELECT * FROM countries WHERE code = 'ITA' OR code = 'SMR' OR code = 'VAT';
-- So Carmen is either in Italy or San Marino. Now we need to check if either of those speak any other language besides Italian.

SELECT * FROM countrylanguages WHERE countrycode = 'ITA' OR countrycode = 'SMR';
-- Carmen must be in San Marino since Italian is the only language that they speak there.

--------------------------------------------------------------------------------------------
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



-- She's in ____________________________!


-- \l (lowercase L) to view what databases are available
-- CREATE DATABASE name
-- \connect or \c to switch to a database
-- \d to see what tables are available within your database.
-- CREATE TABLE customers (
--   id SERIAL PRIMARY KEY,
--   name TEXT,
--   age INTEGER,
--   country TEXT,
--   salary INTEGER
-- );