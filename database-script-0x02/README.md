# AirBnB Database Seeding

This directory contains SQL scripts for populating the AirBnB database with realistic sample data. These scripts provide a foundation for testing, development, and demonstration purposes.

## Overview

The seeding process populates all tables in the database schema with realistic, interconnected data that simulates a functioning AirBnB-like platform. This includes:

- User accounts (hosts, guests, and admins)
- Properties with descriptions and pricing
- Bookings with various statuses (pending, confirmed, canceled)
- Payments linked to confirmed bookings
- Reviews from guests who have completed stays
- Messages between users

## Data Relationships

The sample data maintains all relational integrity constraints, ensuring that:

1. All users have appropriate roles (host, guest, admin)
2. All properties are linked to valid host users
3. All bookings reference valid properties and guest users
4. All payments are associated with confirmed bookings
5. All reviews are linked to properties and users who have completed stays
6. All messages have valid sender and recipient users

## Sample Data Statistics

The seed script creates:

- **10 Users**: 1 admin, 3 hosts, and 6 guests
- **6 Properties**: Distributed among the 3 hosts
- **8 Bookings**: With varying statuses (5 confirmed, 2 pending, 1 canceled)
- **5 Payments**: One for each confirmed booking
- **5 Reviews**: From guests who have completed their stays
- **10 Messages**: Conversations between hosts and guests

## Data Scenarios

The seed data is designed to demonstrate various common scenarios in the AirBnB application:

### Host Scenarios
- Hosts with multiple properties
- Properties with different pricing and locations
- Properties with and without reviews

### Guest Scenarios
- Guests with multiple bookings
- Guests with different booking statuses
- Guests who have left reviews
- Guests with ongoing conversations with hosts

### Booking Scenarios
- Confirmed bookings with payments
- Pending bookings awaiting confirmation
- Canceled bookings
- Completed stays with reviews

## Usage Instructions

To populate your database with this sample data:

1. First, ensure you have created the database schema using the `schema.sql` script
2. Run the seed script against your database:

```bash
# For MySQL
mysql -u username -p database_name < seed-data.sql

# For PostgreSQL
psql -U username -d database_name -f seed-data.sql
```

## Data Customization

To customize the seed data for your specific needs:

1. Modify the UUIDs if necessary (ensure they remain unique)
2. Adjust dates to reflect your current timeline
3. Add or remove records to achieve your desired data volume
4. Modify property descriptions, prices, or user details as needed

## Important Notes

- All passwords in the seed data are hashed (using bcrypt in this example)
- The seed script uses UUIDs for all primary keys as specified in the schema
- Timestamps are set to maintain a logical timeline of events
- The data maintains all constraints specified in the database schema

## Next Steps

After seeding the database, you can:

1. Run sample queries to explore the data relationships
2. Test application functionality with a realistic dataset
3. Add more specific data to test edge cases
4. Develop and test database queries and procedures

## Example Queries

Here are some example queries you can run to explore the seeded data:

```sql
-- Find all properties with reviews and their average ratings
SELECT 
    p.name, 
    p.location, 
    COUNT(r.review_id) AS review_count, 
    AVG(r.rating) AS avg_rating
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name, p.location
ORDER BY avg_rating DESC;

-- Find booking success rate by property
SELECT 
    p.name, 
    COUNT(b.booking_id) AS total_bookings,
    SUM(CASE WHEN b.status = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_bookings,
    ROUND(SUM(CASE WHEN b.status = 'confirmed' THEN 1 ELSE 0 END) * 100.0 / COUNT(b.booking_id), 2) AS confirmation_rate
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY confirmation_rate DESC;

-- Find total revenue by host
SELECT 
    CONCAT(u.first_name, ' ', u.last_name) AS host_name,
    COUNT(DISTINCT p.property_id) AS property_count,
    SUM(b.total_price) AS total_revenue
FROM User u
JOIN Property p ON u.user_id = p.host_id
JOIN Booking b ON p.property_id = b.property_id
WHERE b.status = 'confirmed'
GROUP BY u.user_id, host_name
ORDER BY total_revenue DESC;
```