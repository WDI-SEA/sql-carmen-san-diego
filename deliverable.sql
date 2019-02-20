-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description 
-- has been traveling through Southern Europe. She's most likely traveling someplace 
-- where she won't be noticed, so find the least populated country in Southern Europe, 
-- and we'll start looking for her there.

SELECT name, region, population 
FROM country
WHERE region = 'Southern Europe'
ORDER BY population ASC
LIMIT 1;
