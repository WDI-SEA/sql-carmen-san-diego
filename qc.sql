SELECT name, language, percentage
FROM country
INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode 
WHERE language = 'Italian'
AND percentage = 100;