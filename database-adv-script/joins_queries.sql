-- Create database
CREATE DATABASE shop_db;
USE shop_db;

-- Create users table
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Create bookings table
CREATE TABLE bookings (
    id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create properties table
CREATE TABLE properties (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

-- Create reviews table
CREATE TABLE reviews (
    id INT PRIMARY KEY,
    property_id INT,
    rating INT,
    comment VARCHAR(255),
    FOREIGN KEY (property_id) REFERENCES properties(id)
);

-- INNER JOIN
SELECT bookings.id AS booking_id, users.name AS user_name, bookings.date
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

-- LEFT JOIN
SELECT properties.name AS property_name, reviews.rating, reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;
ORDER BY properties.name;

-- FULL OUTER JOIN (MySQL version using UNION)
SELECT users.name AS user_name, bookings.id AS booking_id, bookings.date
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id
UNION
SELECT users.name AS user_name, bookings.id AS booking_id, bookings.date
FROM users
RIGHT JOIN bookings ON users.id = bookings.user_id;
