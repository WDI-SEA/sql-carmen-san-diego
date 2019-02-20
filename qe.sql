SELECT city.name, country.name FROM country
INNER JOIN city ON city.countrycode = country.code
WHERE city.name LIKE 'Serra%'
AND country.region = 'South America';
