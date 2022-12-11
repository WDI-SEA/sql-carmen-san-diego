-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.

 SELECT * FROM countries;
 \d countries
SELECT * FROM countries WHERE region = 'Southern Europe' ; 
 VAT  | Holy See (Vatican Cities State) | Europe    | Southern Europe |         0.4 |      1929 |       1000 |                |    9.00 |        | Santa Sede/Citt� del Vaticano | Independent Church State      | Johannes Paavali II |    3538 | VA

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

SELECT * FROM countrylanguages                           ;
SELECT * FROM countrylanguages WHERE countrycode = 'AND' ;


SELECT * FROM countrylanguages WHERE countrycode = 'VAT'; 
 countrycode | language | isofficial | percentage 
-------------+----------+------------+------------
 VAT         | Italian  | t          |          0
(1 row)

-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.
SELECT * FROM countrylanguages WHERE language = 'Italian'AND isofficial = 't';
 countrycode | language | isofficial | percentage 
-------------+----------+------------+------------
 ITA         | Italian  | t          |       94.1
 SMR         | Italian  | t          |        100
 VAT         | Italian  | t          |          0
 CHE         | Italian  | t          |        7.7


-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.
SELECT * FROM countries WHERE code = 'SMR';
 SMR  | San Marino | Europe    | Southern Europe |          61 |       885 |      27000 |           81.1 | 510.00 |        | San Marino | Republic       |             |    3171 | SM
(1 row)

 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802


-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!
SELECT * FROM countries WHERE continent ='South America' ;         
ARG  | Argentina        | South America | South America |   2.78
04e+06 |      1816 |   37032000 |           75.1 | 340238.00 | 32
3310.00 | Argentina        | Federal Republic              | Fern
ando de la R�a         |      69 | AR
 BOL  | Bolivia          | South America | South America | 1.0985
81e+06 |      1825 |    8329000 |           63.7 |   8571.00 |   
7967.00 | Bolivia          | Republic                      | Hugo
 B�nzer Su�rez         |     194 | BO
 BRA  | Brazil           | South America | South America | 8.5474
03e+06 |      1822 |  170115000 |           62.9 | 776739.00 | 80
4108.00 | Brasil           | Federal Republic              | Fern
ando Henrique Cardoso  |     211 | BR
 CHL  | Chile            | South America | South America |       
756626 |      1810 |   15211000 |           75.7 |  72949.00 |  7
5780.00 | Chile            | Republic                      | Rica
rdo Lagos Escobar      |     554 | CL
ECU  | Ecuador          | South America | South America |       283561 |      1822 |   12646000 |           71.1 |  19770.00 |  19769.00 | Ecuador          | Republic                      | Gustavo Noboa Bejarano     |     594 | EC
 FLK  | Falkland Islands | South America | South America |        12173 |           |       2000 |                |      0.00 |           | Falkland Islands | Dependent Territory of the UK | Elisabeth II               |     763 | FK
 GUY  | Guyana           | South America | South America |       214969 |      1966 |     861000 |             64 |    722.00 |    743.00 | Guyana           | Republic                      | Bharrat Jagdeo             |     928 | GY
 COL  | Colombia         | South America | South America | 1.138914e+06 |      1810 |   42321000 |           70.3 | 102896.00 | 105116.00 | Colombia         | Republic                      | Andr�s Pastrana Arango     |    2257 | CO
 PRY  | Paraguay         | South America | South America |       406752 |      1811 |    5496000 |           73.7 |   8444.00 |   9555.00 | Paraguay         | Republic                      | Luis:
PER  | Peru             | South America | South America | 1.285216e+06 |      1821 |   25662000 |             70 |  64140.00 |  65186.00 | Per�/Piruw       | Republic                      | Valentin Paniagua Corazao  |    2890 | PE
 GUF  | French Guiana    | South America | South America |        90000 |           |     181000 |           76.1 |    681.00 |           | Guyane fran�aise | Overseas Department of France | Jacques Chirac             |    3014 | GF
 SUR  | Suriname         | South America | South America |       163265 |      1975 |     417000 |           71.4 |    870.00 |    706.00 | Suriname         | Republic                      | Ronald Venetiaan           |    3243 | SR
 URY  | Uruguay          | South America | South America |       175016 |      1828 |    3337000 |           75.2 |  20831.00 |  19967.00 | Uruguay          | Republic                      | Jorg:
VEN  | Venezuela        | South America | South America |       912050 |      1811 |   24170000 |           73.1 |  95023.00 |  88434.00 | Venezuela        | Federal Republic              | Hugo Ch�vez Fr�as          |    3539 | VE

SELECT * FROM cities WHERE countrycode = 'ARG';
83 | Moreno                         | ARG         | Buenos Aires        |     356993
 104 | Santiago del Estero            | ARG         | Santiago de
l Estero |     189947
  84 | Santa F�                       | ARG         | Santa F�   
         |     353063
 105 | San Salvador de Jujuy          | ARG         | Jujuy      
         |     178748
 124 | San Rafael                     | ARG         | Mendoza    
         |      94651
 117 | San Nicol�s de los Arroyos     | ARG         | Buenos Aires        |     119302
  78 | San Miguel de Tucum�n          | ARG         | Tucum�n             |     470809
  95 | San Miguel                     | ARG         | Buenos Aires        |     248700
 122 | San Luis                       | ARG         | San Luis            |     110136
 118 | San Juan                       | ARG         | San Juan            |     119152
  89 | San Isidro                     | ARG         | Buenos Aires        |     306341
SELECT * FROM cities WHERE countrycode = 'BOL';
SELECT * FROM cities WHERE countrycode = 'BRA' ORDER BY cities DESC;

SELECT * FROM cities WHERE countrycode = 'COL' ORDER BY name DESC;
 2266 | Santa Marta       | COL         | Magdalena          |     359147

SELECT * FROM cities WHERE countrycode = 'PRY' ORDER BY name DESC;
2887 | San Lorenzo         | PRY         | Central     |     133395
 293 | Santa Maria              | BRA         | Rio Grande do Sul   |     238473

 SELECT * FROM cities WHERE countrycode = 'PRY' ORDER BY name DESC;
 2887 | San Lorenzo         | PRY         | Central     |     133395


-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!
 265 | Serra                    | BRA         | Esp�rito Santo      |     302666
 sao paolo


-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to
 -- the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the
 -- landing dock.
-- Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but
-- if we can crack it, we can finally put her where she belongs – behind bars.

-- Our play date of late has been unusually fun –
-- As an agent, I'll say, you've been a joy to outrun.
-- And while the food here is great, and the people – so nice!
-- I need a little more sunshine with my slice of life.
-- So I'm off to add one to the population I find
-- In a city of ninety-one thousand and now, eighty five.


-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.


SELECT * FROM cities WHERE population = '91084'  
-- She's in Santa Monica!
