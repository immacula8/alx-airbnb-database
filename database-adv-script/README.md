# SQL Joins Practice

This project is for practicing SQL joins.

## Database Setup
1. Create a database called `shop_db`.
2. Create the following tables:
   - `users`
   - `bookings`
   - `properties`
   - `reviews`

## Tasks Practiced
1. **INNER JOIN**  
   Query to get all bookings and the respective users who made those bookings.

2. **LEFT JOIN**  
   Query to get all properties and their reviews, including properties without reviews.

3. **FULL OUTER JOIN**  
   Query to get all users and all bookings, even if a user has no booking or a booking is not linked to a user.



# SQL Subquery Examples

This project contains SQL examples using **subqueries** and **correlated subqueries**.

## 📌 Queries

### 1. Properties with Average Rating > 4.0
Find all properties where the average rating is greater than 4.0.

```sql
SELECT *
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

# SQL Queries: Bookings Count and Property Ranking

This section includes SQL queries that use **COUNT**, **GROUP BY**, and **window functions** like `RANK()`.

---

## 1. Total Number of Bookings per User
Find the total number of bookings made by each user.

```sql
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUSP BY user_id;

