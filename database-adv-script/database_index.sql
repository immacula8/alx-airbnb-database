-- Create indexes to optimize queries
CREATE INDEX idx_bookings_user_id
ON bookings (user_id);

CREATE INDEX idx_bookings_property_id
ON bookings (property_id);

CREATE INDEX idx_users_email
ON users (email);

CREATE INDEX idx_properties_location
ON properties (location);

-- Measure query performance BEFORE and AFTER indexes

-- Example: count bookings per user
EXPLAIN ANALYZE
SELECT user_id, COUNT(*)
FROM bookings
GROUP BY user_id;

-- Example: get all bookings for a property
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE property_id = 1;

-- Example: search user by email
EXPLAIN ANALYZE
SELECT *
FROM users
WHERE email = 'test@example.com';

-- Example: filter properties by location
EXPLAIN ANALYZE
SELECT *
FROM properties
WHERE location = 'Lagos';
