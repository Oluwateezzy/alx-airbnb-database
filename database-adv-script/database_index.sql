-- Measure performance before adding indexes
EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'test@example.com';
EXPLAIN ANALYZE SELECT * FROM User WHERE role = 'guest';
EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id = 123;
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 456;
EXPLAIN ANALYZE SELECT * FROM Booking WHERE status = 'confirmed';
EXPLAIN ANALYZE SELECT * FROM Booking WHERE start_date = '2023-01-01' AND end_date = '2023-01-07';
EXPLAIN ANALYZE SELECT * FROM Property WHERE host_id = 789;
EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'New York';
EXPLAIN ANALYZE SELECT * FROM Property WHERE price_per_night < 100;

-- Create indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
CREATE INDEX idx_property_host ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price_per_night);

-- Measure performance after adding indexes
EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'test@example.com';
EXPLAIN ANALYZE SELECT * FROM User WHERE role = 'guest';
EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id = 123;
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 456;
EXPLAIN ANALYZE SELECT * FROM Booking WHERE status = 'confirmed';
EXPLAIN ANALYZE SELECT * FROM Booking WHERE start_date = '2023-01-01' AND end_date = '2023-01-07';
EXPLAIN ANALYZE SELECT * FROM Property WHERE host_id = 789;
EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'New York';
EXPLAIN ANALYZE SELECT * FROM Property WHERE price_per_night < 100;