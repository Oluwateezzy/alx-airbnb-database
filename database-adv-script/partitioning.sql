-- 1. Create new partitioned table structure
CREATE TABLE Booking_partitioned (
    booking_id UUID,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date),
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    CHECK (end_date > start_date)
) PARTITION BY RANGE (YEAR(start_date));

-- 2. Create partitions for different years
CREATE TABLE booking_y2020 PARTITION OF Booking_partitioned
    FOR VALUES FROM (2020) TO (2021);

CREATE TABLE booking_y2021 PARTITION OF Booking_partitioned
    FOR VALUES FROM (2021) TO (2022);

CREATE TABLE booking_y2022 PARTITION OF Booking_partitioned
    FOR VALUES FROM (2022) TO (2023);

CREATE TABLE booking_y2023 PARTITION OF Booking_partitioned
    FOR VALUES FROM (2023) TO (2024);

CREATE TABLE booking_future PARTITION OF Booking_partitioned
    FOR VALUES FROM (2024) TO (MAXVALUE);

-- 3. Migrate data from original table
INSERT INTO Booking_partitioned 
SELECT * FROM Booking;

-- 4. Replace original table (optional - in production you would schedule downtime)
-- DROP TABLE Booking;
-- ALTER TABLE Booking_partitioned RENAME TO Booking;