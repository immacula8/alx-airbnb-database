-- Step 1: Monitor performance of frequent queries
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';

EXPLAIN ANALYZE
SELECT *
FROM users
WHERE email = 'test@example.com';

-- Step 2: Identify bottlenecks
-- If queries are slow due to sequential scans, we add indexes.

-- Step 3: Implement improvements
CREATE INDEX idx_bookings_start_date ON bookings (start_date);
CREATE INDEX idx_users_email ON users (email);

-- Step 4: Test again with EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';

EXPLAIN ANALYZE
SELECT *
FROM users
WHERE email = 'test@example.com';
