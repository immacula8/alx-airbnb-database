-- Indexes for Users table
CREATE INDEX idx_users_email ON users(email);

-- Indexes for Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_date ON bookings(date);

-- Indexes for Properties table
CREATE INDEX idx_properties_location ON properties(location);

EXPLAIN SELECT * 
FROM bookings 
WHERE user_id = 5 
ORDER BY date DESC;
