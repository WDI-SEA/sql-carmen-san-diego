SELECT code, name region, population, language 
FROM country
INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE region = 'Southern Europe'
ORDER BY population ASC
LIMIT 1;
