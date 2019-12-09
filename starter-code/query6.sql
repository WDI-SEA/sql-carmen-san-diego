 SELECT name, capital FROM country WHERE code = 'BRA'
 
/*  A quick query tells us the city code for the capital city is 211.  Then, we can query the city dB for the name of the city as follows: */

 SELECT * FROM city WHERE id='211';
