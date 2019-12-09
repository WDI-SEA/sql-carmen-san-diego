\connect carmen;
SELECT name, population, code
FROM country
WHERE region='Southern Europe'
ORDER BY
population ASC;