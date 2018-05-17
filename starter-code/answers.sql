
                                           ^
world=# SELECT * FROM country WHERE region='europe';
world=# SELECT * FROM country WHERE region LIKE '%europe%';
world=# SELECT region FROM country;
world=# SELECT * FROM country WHERE region LIKE '%Southern Europe%';
world=# SELECT * FROM countrylanguage;
world=# SELECT * FROM countrylanguage WHERE countrycode='VAT';


world=# SELECT * FROM countrylanguage WHERE language='Italian';


world=# SELECT * FROM city WHERE countrycode='SMR';

world=# SELECT * FROM city WHERE name LIKE '%Serra%';

world=# SELECT * FROM city WHERE name LIKE '%Bra%';


world=# SELECT * FROM city WHERE population=91084;
