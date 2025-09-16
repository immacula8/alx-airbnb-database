### Subqueries Data ###
SELECT property_id, AVG(rating) AS avg_rating
FROM reviews
GROUP BY property_id;

SELECT *
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

### Correlated Subquery ###

SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;
SELECT *
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
