SELECT population FROM country WHERE region = 'Southern Europe';

SELECT name FROM country WHERE population = 1000;

SELECT language FROM countrylanguage WHERE countrycode = 'VAT';

SELECT countrycode FROM countrylanguage WHERE language = 'Italian' AND percentage = 100;

SELECT name FROM city WHERE countrycode = 'SMR';

SELECT name FROM city WHERE name LIKE 'Serra%';

SELECT countrycode FROM city WHERE name = 'Serra';

SELECT capital FROM country WHERE code = 'BRA';

SELECT name FROM city WHERE id = 211;

SELECT name FROM city WHERE population = 91084;
SELECT countrycode  FROM city WHERE population = 91084;

Santa Monica, USA