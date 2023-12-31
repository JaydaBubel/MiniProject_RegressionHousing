-- 1. Create a database called house_price_regression.
CREATE DATABASE house_price_regression;

-- 4. Select all the data from table house_price_data to check if the data was imported correctly
SELECT * FROM house_price_data;

-- 5. Use the alter table command to drop the column date from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.
ALTER TABLE house_price_data
DROP COLUMN date;

SELECT * FROM house_price_data LIMIT 10;

-- 6. Use sql query to find how many rows of data you have.
SELECT COUNT(*) AS row_count FROM house_price_data;

-- 7. Now we will try to find the unique values in some of the categorical columns:
-- bedrooms
SELECT DISTINCT bedrooms FROM house_price_data;

-- bathrooms
SELECT DISTINCT bathrooms FROM house_price_data;

-- floors
SELECT DISTINCT floors FROM house_price_data;

-- condition
SELECT DISTINCT `condition` FROM house_price_data;

-- grade
SELECT DISTINCT grade FROM house_price_data;

-- 8. Arrange the data in a decreasing order by the price of the house. Return only the IDs of the top 10 most expensive houses in your data.
SELECT id FROM house_price_data
ORDER BY price DESC
LIMIT 10;

-- 9. What is the average price of all the properties in your data?
SELECT AVG(price) AS average_price FROM house_price_data;

-- 10. In this exercise we will use simple group by to check the properties of some of the categorical variables in our data
-- 10.1
SELECT bedrooms, AVG(price) AS average_price FROM house_price_data
GROUP BY bedrooms;

-- 10.2
SELECT bedrooms, AVG(sqft_living) AS average_sqft_living FROM house_price_data
GROUP BY bedrooms;

-- 10.3
SELECT waterfront, AVG(price) AS average_price FROM house_price_data
GROUP BY waterfront;

-- 10.4
SELECT `condition`, AVG(grade) AS average_grade
FROM house_price_data
GROUP BY `condition`;

-- 11. One of the customers is only interested in the following houses:
SELECT *
FROM house_price_data
WHERE bedrooms IN (3, 4)
  AND bathrooms > 3
  AND floors = 1
  AND waterfront = 0
  AND `condition` >= 3
  AND grade >= 5
  AND price < 300000;


-- 12. Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. Write a query to show them the list of such properties. You might need to use a sub query for this problem.
SELECT * FROM house_price_data
WHERE price > (SELECT 2 * AVG(price) FROM house_price_data);

-- 13. Since this is something that the senior management is regularly interested in, create a view of the same query.
CREATE VIEW expensive_properties AS
SELECT * FROM house_price_data
WHERE price > (SELECT 2 * AVG(price) FROM house_price_data);

-- 14. Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms?
SELECT 
    (SELECT AVG(price) FROM house_price_data WHERE bedrooms = 3) AS average_price_3_bedrooms,
    (SELECT AVG(price) FROM house_price_data WHERE bedrooms = 4) AS average_price_4_bedrooms;

-- 15. What are the different locations where properties are available in your database? (distinct zip codes)
SELECT DISTINCT zipcode FROM house_price_data;

-- 16. Show the list of all the properties that were renovated.
SELECT * FROM house_price_data
WHERE yr_renovated > 0;

-- 17. Provide the details of the property that is the 11th most expensive property in your database.
SELECT *
FROM house_price_data
ORDER BY price DESC
LIMIT 1 OFFSET 10;


