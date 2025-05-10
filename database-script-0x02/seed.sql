-- Seed data for AirBnB Database
-- Sample data for User, Property, Booking, Payment, Review, and Message tables

-- Insert Users (mix of guests, hosts, and admin users)
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    -- Admin users
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Admin', 'User', 'admin@airbnb.com', '$2a$12$1InE4QyUH9WMSRwY8MDFkOM8mE2u.uCPVqcRVJEEEEEXb8JxbAXrW', '+1234567890', 'admin', '2023-01-01 10:00:00'),
    
    -- Host users
    ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'John', 'Smith', 'john.smith@email.com', '$2a$12$8KscVpT5Fm8ULEr7LMmP2ePhE5Mt1uLU1CIijVE8O6TQ0GZdMVFHi', '+1987654321', 'host', '2023-01-15 11:30:00'),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Maria', 'Garcia', 'maria.garcia@email.com', '$2a$12$dIL7TkWRYmHDQQJCKaZ8K.6Ap7RmCzPpzLTIYHrV4mR3wHJfQhHOC', '+1567891234', 'host', '2023-02-01 09:45:00'),
    ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Ahmed', 'Hassan', 'ahmed.hassan@email.com', '$2a$12$JUgfPLHqpMFPJPNQV6CpNu3Eb2o2Nbnw0xRCChjuOHQBFKmIJMVty', '+2012345678', 'host', '2023-02-10 14:20:00'),
    
    -- Guest users
    ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Sarah', 'Johnson', 'sarah.johnson@email.com', '$2a$12$QUBMKvmJYcFTpMD72SvfAeeYmFNnYrMjF9MFFqbHRxzXNPOlwLkCK', '+1122334455', 'guest', '2023-02-20 16:15:00'),
    ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Michael', 'Williams', 'michael.williams@email.com', '$2a$12$x5CpaZRyhSPcJPxI6YUDo.2.S8ptZsKbmVLKdVa5wWGY3bOEJMKbW', '+1654987320', 'guest', '2023-03-05 10:10:00'),
    ('g0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Emma', 'Brown', 'emma.brown@email.com', '$2a$12$BVpTkCpNIZyfZRnWPvMnCeT0xR1U5M7rMgzZ5BwVFwBFjYECcjlB2', '+1789456123', 'guest', '2023-03-15 12:45:00'),
    ('h0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'David', 'Jones', 'david.jones@email.com', '$2a$12$qKbLF1V0EdBnNT2FxDVt5.UqD9mZc3BpzXlWQH1prpYpcGVYVXtcy', '+1321654987', 'guest', '2023-03-22 17:30:00'),
    ('i0eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Sofia', 'Martinez', 'sofia.martinez@email.com', '$2a$12$3eVLGxKZRZ2C4xF7k7Hpfucsd5V4YT1JE55T4rVZR3Xu9wqkV94I6', '+1456789123', 'guest', '2023-04-01 09:15:00'),
    ('j0eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'James', 'Miller', 'james.miller@email.com', '$2a$12$dI/mCdvOvq8AfY1p6NfM8e9u1U4fYs5LfObLz8Ar/sWJTGGAH9/XO', '+1654321789', 'guest', '2023-04-10 15:20:00');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
    -- John Smith's properties
    ('a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Cozy Downtown Apartment', 'A beautiful, modern apartment in the heart of downtown. Walking distance to restaurants and attractions.', 'New York, NY', 150.00, '2023-01-20 13:00:00', '2023-01-20 13:00:00'),
    ('b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Lakefront Cabin', 'Peaceful cabin with stunning lake views. Perfect for a weekend getaway.', 'Lake Tahoe, CA', 200.00, '2023-01-25 14:30:00', '2023-02-01 11:15:00'),
    
    -- Maria Garcia's properties
    ('c1eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Beachfront Villa', 'Luxurious villa right on the beach. Enjoy beautiful sunsets from your private balcony.', 'Miami, FL', 350.00, '2023-02-05 10:45:00', '2023-02-05 10:45:00'),
    ('d1eebc99-9c0b-4ef8-bb6d-6bb9bd380a24', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Mountain Retreat', 'Cozy cabin in the mountains. Great hiking trails nearby.', 'Aspen, CO', 175.00, '2023-02-10 16:20:00', '2023-02-15 09:10:00'),
    
    -- Ahmed Hassan's properties
    ('e1eebc99-9c0b-4ef8-bb6d-6bb9bd380a25', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Desert Oasis', 'Modern home with private pool in a peaceful desert setting.', 'Scottsdale, AZ', 225.00, '2023-02-15 15:00:00', '2023-03-01 14:45:00'),
    ('f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a26', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Urban Loft', 'Stylish loft in a historic building. Industrial chic with modern amenities.', 'Chicago, IL', 190.00, '2023-02-20 11:30:00', '2023-02-25 10:15:00');

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    -- Sarah's bookings
    ('a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a31', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', '2023-05-10', '2023-05-15', 750.00, 'confirmed', '2023-03-01 09:30:00'),
    ('b2eebc99-9c0b-4ef8-bb6d-6bb9bd380a32', 'c1eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', '2023-07-15', '2023-07-20', 1750.00, 'pending', '2023-04-05 14:20:00'),
    
    -- Michael's bookings
    ('c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'e1eebc99-9c0b-4ef8-bb6d-6bb9bd380a25', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', '2023-06-01', '2023-06-07', 1575.00, 'confirmed', '2023-03-15 11:45:00'),
    
    -- Emma's bookings
    ('d2eebc99-9c0b-4ef8-bb6d-6bb9bd380a34', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'g0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', '2023-05-20', '2023-05-25', 1000.00, 'confirmed', '2023-03-20 16:30:00'),
    ('e2eebc99-9c0b-4ef8-bb6d-6bb9bd380a35', 'd1eebc99-9c0b-4ef8-bb6d-6bb9bd380a24', 'g0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', '2023-08-10', '2023-08-15', 875.00, 'canceled', '2023-03-25 10:15:00'),
    
    -- David's bookings
    ('f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a36', 'f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a26', 'h0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', '2023-06-15', '2023-06-20', 950.00, 'confirmed', '2023-04-01 15:30:00'),
    
    -- Sofia's bookings
    ('g2eebc99-9c0b-4ef8-bb6d-6bb9bd380a37', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'i0eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', '2023-07-01', '2023-07-05', 600.00, 'confirmed', '2023-04-10 09:45:00'),
    
    -- James's bookings
    ('h2eebc99-9c0b-4ef8-bb6d-6bb9bd380a38', 'c1eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'j0eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', '2023-08-20', '2023-08-27', 2450.00, 'pending', '2023-04-15 14:00:00');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    -- Payments for confirmed bookings
    ('a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a31', 750.00, '2023-03-01 09:35:00', 'credit_card'),
    ('c3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 1575.00, '2023-03-15 11:50:00', 'paypal'),
    ('d3eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'd2eebc99-9c0b-4ef8-bb6d-6bb9bd380a34', 1000.00, '2023-03-20 16:35:00', 'credit_card'),
    ('f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a46', 'f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a36', 950.00, '2023-04-01 15:35:00', 'stripe'),
    ('g3eebc99-9c0b-4ef8-bb6d-6bb9bd380a47', 'g2eebc99-9c0b-4ef8-bb6d-6bb9bd380a37', 600.00, '2023-04-10 09:50:00', 'credit_card');

-- Insert Reviews (for completed stays)
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    -- Sarah's review for Cozy Downtown Apartment
    ('a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a51', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 5, 'Amazing location and beautiful apartment! Everything was clean and exactly as described. Would definitely stay again.', '2023-05-16 10:30:00'),
    
    -- Michael's review for Desert Oasis
    ('b4eebc99-9c0b-4ef8-bb6d-6bb9bd380a52', 'e1eebc99-9c0b-4ef8-bb6d-6bb9bd380a25', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 4, 'Great property with a beautiful pool. The desert views were spectacular. The only small issue was the AC struggled a bit during the hottest part of the day.', '2023-06-08 14:15:00'),
    
    -- Emma's review for Lakefront Cabin
    ('c4eebc99-9c0b-4ef8-bb6d-6bb9bd380a53', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'g0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 5, 'Peaceful and serene location. The cabin was cozy and had all the amenities we needed. The lake view is even better than in the photos!', '2023-05-26 09:45:00'),
    
    -- David's review for Urban Loft
    ('d4eebc99-9c0b-4ef8-bb6d-6bb9bd380a54', 'f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a26', 'h0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 3, 'Cool space with great design. However, it was quite noisy at night due to the busy street below. Earplugs recommended!', '2023-06-21 16:20:00'),
    
    -- Sofia's review for Cozy Downtown Apartment
    ('e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'i0eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 4, 'Clean and comfortable apartment in a perfect location. The host was very responsive. Would recommend!', '2023-07-06 11:30:00');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    -- Conversation between Sarah and John about Cozy Downtown Apartment
    ('a5eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Hi, I'm interested in your Cozy Downtown Apartment. Is it available for the dates I selected?', '2023-02-28 15:20:00'),
    ('b5eebc99-9c0b-4ef8-bb6d-6bb9bd380a62', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Hello Sarah! Yes, the apartment is available for those dates. Let me know if you have any questions about the property.', '2023-02-28 16:45:00'),
    ('c5eebc99-9c0b-4ef8-bb6d-6bb9bd380a63', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Great! Is parking available nearby? And how far is it from public transportation?', '2023-02-28 17:30:00'),
    ('d5eebc99-9c0b-4ef8-bb6d-6bb9bd380a64', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'There's a parking garage half a block away that costs $25/day. The subway station is just a 3-minute walk!', '2023-02-28 18:15:00'),
    
    -- Conversation between Michael and Ahmed about Desert Oasis
    ('e5eebc99-9c0b-4ef8-bb6d-6bb9bd380a65', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Hello, I'm interested in booking your Desert Oasis property. Is the pool heated?', '2023-03-14 10:10:00'),
    ('f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Hi Michael! Yes, the pool is heated and maintained at a comfortable temperature year-round. It's especially nice in the evenings!', '2023-03-14 11:05:00'),
    
    -- Conversation between Emma and Maria about Mountain Retreat
    ('g5eebc99-9c0b-4ef8-bb6d-6bb9bd380a67', 'g0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Hi Maria, do you have recommendations for hiking trails near the Mountain Retreat?', '2023-03-24 14:25:00'),
    ('h5eebc99-9c0b-4ef8-bb6d-6bb9bd380a68', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'g0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Hello Emma! There are several great trails nearby. I recommend Aspen Vista Trail for beginners and Ute Trail for more experienced hikers. I have a guidebook in the cabin with detailed information!', '2023-03-24 15:40:00'),
    
    -- Conversation between James and Maria about Beachfront Villa
    ('i5eebc99-9c0b-4ef8-bb6d-6bb9bd380a69', 'j0eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Hello, I'm considering booking your Beachfront Villa. Is beach access private or public?', '2023-04-14 09:15:00'),
    ('j5eebc99-9c0b-4ef8-bb6d-6bb9bd380a70', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'j0eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Hi James! The villa has direct access to a semi-private beach. It's shared only with the other 5 properties in our gated community, so it's never crowded. You'll love it!', '2023-04-14 10:30:00');