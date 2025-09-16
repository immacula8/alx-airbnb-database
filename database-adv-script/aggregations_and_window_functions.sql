### SQL Query ###

SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

SELECT property_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY property_id;

SELECT property_id,
       COUNT(*) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_row_number
FROM bookings
GROUP BY property_id;
