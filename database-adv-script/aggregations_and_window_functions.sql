### SQL Query ###

SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

SELECT property_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY property_id;

-- Rank properties using ROW_NUMBER (always unique ranks)
SELECT property_id,
       COUNT(*) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_row_number
FROM bookings
GROUP BY property_id;

-- Rank properties using RANK (ties allowed)
SELECT property_id,
       COUNT(*) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM bookings
GROUP BY property_id;