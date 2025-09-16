1. Monitoring

Used EXPLAIN ANALYZE on frequent queries (bookings by start_date, users by email) to check performance.

2. Bottlenecks

Queries were slow because of full table scans.

3. Optimization

Added index on bookings.start_date

Added index on users.email

4. Results

After re-running EXPLAIN ANALYZE, queries executed much faster with index scans.

✅ Indexes removed bottlenecks and improved performance.