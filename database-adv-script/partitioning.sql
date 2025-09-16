-- Step 1: Rename the existing bookings table (keep a backup)
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create a new partitioned bookings table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (example: yearly partitions)
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Step 4: (Optional) Insert old data into new partitioned table
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, status, created_at)
SELECT id, user_id, property_id, start_date, end_date, status, created_at
FROM bookings_old;

-- Step 5: Test performance with EXPLAIN ANALYZE on date range query
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
