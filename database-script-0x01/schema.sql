-- Create User table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index on email for faster login lookups
CREATE INDEX idx_user_email ON User(email);

-- Create Property table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Create index on host_id for faster property lookups by host
CREATE INDEX idx_property_host ON Property(host_id);

-- Create Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    CHECK (end_date > start_date)
);

-- Create composite index for property bookings by date for availability searches
CREATE INDEX idx_booking_property_dates ON Booking(property_id, start_date, end_date);
-- Create index for user bookings for faster user booking history
CREATE INDEX idx_booking_user ON Booking(user_id);

-- Create Payment table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE,
    UNIQUE (booking_id)
);

-- Create index on booking_id for faster payment lookups
CREATE INDEX idx_payment_booking ON Payment(booking_id);

-- Create Review table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    CHECK (rating >= 1 AND rating <= 5)
);

-- Create indexes for faster review lookups
CREATE INDEX idx_review_property ON Review(property_id);
CREATE INDEX idx_review_user ON Review(user_id);

-- Create Message table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Create indexes for faster message lookups
CREATE INDEX idx_message_sender ON Message(sender_id);
CREATE INDEX idx_message_recipient ON Message(recipient_id);
-- Create composite index for conversation lookup (between two users)
CREATE INDEX idx_message_conversation ON Message(sender_id, recipient_id);