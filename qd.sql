SELECT id, city.name AS city_name, country.name AS country_name 
FROM city
INNER JOIN country on city.countrycode = country.code
WHERE city.countrycode = 'SMR'
AND city.name <> country.name;
