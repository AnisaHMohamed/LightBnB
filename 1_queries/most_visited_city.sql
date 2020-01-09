
SELECT  city, COUNT(reservations) as total_reservations
FROM properties 
JOIN reservations ON properties.id = property_id
GROUP BY city
ORDER BY total_reservations DESC

-- Get a list of the most visited cities.

-- Select the name of the city and the number of reservations for that city.

-- Expected Result:

--        city        | total_reservations 
-- -------------------+--------------------
--  Carcross          |                405
--  Town of Hay River |                379