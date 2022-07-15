#question 1: Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
SELECT *
FROM city 
WHERE population > 100000
    AND countrycode = 'USA';

#question 2: Query the NAME field for all American cities in the CITY table with populations larger than 120000.
SELECT name 
FROM city 
WHERE countrycode = 'USA' AND population > 120000;

#question 3: 
SELECT * 
FROM CITY;

#question 4: Query all columns for a city in CITY with the ID 1661.
SELECT * 
FROM city
WHERE ID = 1661; 

#question 5: Query the details for all the Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT * 
FROM citycountrycode = 'JPN';        

#question 6: Query the the names of all the Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT name
FROM city 
WHERE countrycode = 'JPN';        

#question 7: Query a list of CITY and STATE from STATION.
SELECT city, state 
FROM station;       

#question 8: Query a list of CITY names from STATION with even ID numbers only. 
SELECT DISTINCT city
FROM station 
WHERE MOD(ID,2)=0 
ORDER BY city ASC; 

#question 9: Let NUM be the number of CITY entries in STATION, and NUMunique be the number of unique cities. Query the value of NUM−NUMunique from STATION
SELECT COUNT(city) - COUNT(DISTINCT city) 
FROM STATION;

#question 10: Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
select city, length(city) from station order by length(city) DESC,city ASC fetch first row only;
select city, length(city) from station order by length(city) asc ,city asc fetch first row only;      

#question 11: Query the list of CITY names starting with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT(city) 
FROM station 
WHERE city LIKE 'A%' OR city LIKE 'E%' OR city LIKE 'I%' OR city LIKE 'O%' OR city LIKE 'U%' 
ORDER BY CITY ASC;       

#question 12: Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT(city) 
FROM station 
WHERE city LIKE 'A%' OR city LIKE 'E%' OR city LIKE 'I%' OR city LIKE 'O%' OR city LIKE 'U%' 
ORDER BY CITY ASC; 

#question 13: Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT city 
FROM station 
WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%') AND (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u') 
ORDER BY city;

#question 14: Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT(city) 
FROM station 
WHERE upper(substr(city,1,1)) NOT IN ('A','U','E','O','I') AND lower(substr(city,1,1)) NOT IN ('u','e','o','a','i') 

#question 15:
SELECT DISTINCT city 
FROM station 
WHERE UPPER(substr(CITY, LENGTH(city), 1)) NOT IN ('A','U','E','O','I') 
    AND LOWER(SUBSTR(city, LENGTH(city),1)) NOT IN ('u','e','o','a','i');

#question 16: Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION 
WHERE LOWER(SUBSTR(CITY,1,1)) NOT IN ('a','e','i','o','u') 
    OR LOWER(SUBSTR(CITY, LENGTH(CITY),1)) NOT IN ('a','e','i','o','u');   

#question 17: Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION 
WHERE LOWER(SUBSTR(CITY,1,1)) NOT IN ('a','e','i','o','u') 
    AND LOWER(SUBSTR(CITY, LENGTH(CITY),1)) NOT IN ('a','e','i','o','u');   

#question 18: Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT name
FROM students
WHERE marks > 75 ORDER BY SUBSTR(name, length(name)-2, 3), id

#question 19: Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name
FROM employee
ORDER BY name ASC;

#question 20: Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.

SELECT NAME 
FROM EMPLOYEE 
WHERE SALARY > 2000  AND MONTHS < 10 
ORDER BY EMPLOYEE_ID;  






