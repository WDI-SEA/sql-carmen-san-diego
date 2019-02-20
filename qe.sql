SELECT city.name, country.name,  FROM country
INNER JOIN city
WHERE city.name LIKE 'Serra%'
AND country.region = 'South America';
