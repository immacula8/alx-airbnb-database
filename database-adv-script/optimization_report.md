Query Performance Optimization
1. Initial Query

Retrieved all bookings with user, property, and payment details.

2. Performance Analysis

Used EXPLAIN ANALYZE to check execution time and identify inefficiencies.

3. Optimized Query

Removed unnecessary columns

Used LEFT JOIN for optional payments

Ensured indexes on join columns (user_id, property_id, booking_id)

✅ Result: Faster query execution and improved efficiency.