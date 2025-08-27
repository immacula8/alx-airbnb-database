-- seed.sql
-- Insert sample Users
INSERT INTO Users (id, name, email, password) VALUES
(1, 'Alice Johnson', 'alice@example.com', 'hashed_password1'),
(2, 'Bob Smith', 'bob@example.com', 'hashed_password2'),
(3, 'Charlie Brown', 'charlie@example.com', 'hashed_password3');

-- Insert sample Properties
INSERT INTO Properties (id, owner_id, title, location, price_per_night) VALUES
(1, 1, 'Cozy Apartment in Lagos', 'Lagos, Nigeria', 50.00),
(2, 2, 'Beach House in Cape Town', 'Cape Town, South Africa', 120.00),
(3, 1, 'Studio in Nairobi', 'Nairobi, Kenya', 40.00);

-- Insert sample Bookings
INSERT INTO Bookings (id, user_id, property_id, start_date, end_date, total_amount) VALUES
(1, 2, 1, '2025-09-01', '2025-09-05', 200.00),
(2, 3, 2, '2025-09-10', '2025-09-15', 600.00),
(3, 1, 3, '2025-09-20', '2025-09-22', 80.00);

-- Insert sample Payments
INSERT INTO Payments (id, booking_id, amount, payment_date, status) VALUES
(1, 1, 200.00, '2025-08-25', 'Completed'),
(2, 2, 600.00, '2025-08-26', 'Pending'),
(3, 3, 80.00, '2025-08-27', 'Completed');
