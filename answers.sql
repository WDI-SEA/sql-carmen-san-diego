Answer 1. SELECT name FROM country WHERE region = 'Southern Europe' ORDER by population LIMIT 1;

 Holy See (Vatican City State)

SELECT code FROM country WHERE name = 'Holy See (Vatican City State)';

2. SELECT language FROM countrylanguage  WHERE countrycode= 'VAT';
	 language 
	----------
	 Italian
	(1 row)

SELECT countrycode FROM countrylanguage WHERE language = 'Italian' AND percentage >99;
	 countrycode 
	-------------
	 SMR
	(1 row)
 3. SELECT name FROM country WHERE code = 'SMR';
	    name    
	------------
	 San Marino
	(1 row)

4.	SELECT * FROM city WHERE countrycode = 'SMR';                                                                                                                                                       id  |    name    | countrycode |     district      | population 
------+------------+-------------+-------------------+------------
 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802

 5. SELECT * FROM city WHERE name LIKE 'Serr%';
	  id  |    name    | countrycode |     district      | population 
	------+------------+-------------+-------------------+------------
	  265 | Serra      | BRA         | Esp�rito Santo    |     302666
	  SELECT name FROM country WHERE code='BRA';
	  name  
	--------
	 Brazil
	(1 row)

6. SELECT capital FROM country WHERE name= 'Brazil';
	 capital 
	---------
	     211
	(1 row)

	world=# SELECT name FROM city WHERE id = 211;
	   name   
----------

8. SELECT name FROM city WHERE population=91084;
     name     
--------------
 Santa Monica
(1 row)
