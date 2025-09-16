-- Index on user_id column in bookings table for faster lookups and joins
CREATE INDEX idx_bookings_user_id
ON bookings (user_id);

-- Index on property_id column in bookings table for faster filtering
CREATE INDEX idx_bookings_property_id
ON bookings (property_id);

-- Index on email column in users table for quick searches
CREATE INDEX idx_users_email
ON users (email);

-- Index on location column in properties table for faster filtering by location
CREATE INDEX idx_properties_location
ON properties (location);
