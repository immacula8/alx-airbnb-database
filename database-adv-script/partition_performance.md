1. Why Partition?

The bookings table is very large, making queries slow. Partitioning splits the data into smaller chunks based on start_date, so the database only looks at the needed part.

2. What We Did

Created a new bookings table partitioned by start_date.

Added yearly partitions (bookings_2023, bookings_2024).

Moved old data into the new partitioned table.

Tested queries using EXPLAIN ANALYZE with a date range.

3. Results

Before: Queries scanned the whole bookings table.

After: Queries only scanned the matching partition, making them much faster.

Partitioning improved efficiency and scalability as data grows.

✅ Partitioning = Faster queries, better performance.
