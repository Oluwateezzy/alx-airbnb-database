-- Analyze the initial query performance
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    py.payment_id,
    py.amount,
    py.payment_date,
    py.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment py ON b.booking_id = py.booking_id
ORDER BY 
    b.start_date DESC;

-- Optimized query with filters and proper indexing
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    py.payment_id,
    py.amount,
    py.payment_date,
    py.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment py ON b.booking_id = py.booking_id
WHERE 
    b.start_date >= CURRENT_DATE - INTERVAL '6 months'  -- Focus on recent bookings
    AND b.status IN ('confirmed', 'completed')         -- Filter by relevant statuses
    AND p.location LIKE 'New York%'                    -- Filter by specific location
ORDER BY 
    b.start_date DESC
LIMIT 100;                                             -- Limit results for pagination

-- Recommended indexes to improve performance
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);
CREATE INDEX idx_booking_dates_status ON Booking(start_date, status);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_payment_booking ON Payment(booking_id);