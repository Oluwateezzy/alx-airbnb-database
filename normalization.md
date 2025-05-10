# AirBnB Database ER Diagram

## Mermaid ER Diagram Code

```mermaid
erDiagram
    USER {
        uuid user_id PK
        varchar first_name
        varchar last_name
        varchar email
        varchar password_hash
        varchar phone_number
        enum role
        timestamp created_at
    }
    
    PROPERTY {
        uuid property_id PK
        uuid host_id FK
        varchar name
        text description
        varchar location
        decimal price_per_night
        timestamp created_at
        timestamp updated_at
    }
    
    BOOKING {
        uuid booking_id PK
        uuid property_id FK
        uuid user_id FK
        date start_date
        date end_date
        decimal total_price
        enum status
        timestamp created_at
    }
    
    PAYMENT {
        uuid payment_id PK
        uuid booking_id FK
        decimal amount
        timestamp payment_date
        enum payment_method
    }
    
    REVIEW {
        uuid review_id PK
        uuid property_id FK
        uuid user_id FK
        integer rating
        text comment
        timestamp created_at
    }
    
    MESSAGE {
        uuid message_id PK
        uuid sender_id FK
        uuid recipient_id FK
        text message_body
        timestamp sent_at
    }
    
    USER ||--o{ PROPERTY : "hosts"
    USER ||--o{ BOOKING : "makes"
    USER ||--o{ REVIEW : "writes"
    USER ||--o{ MESSAGE : "sends"
    USER ||--o{ MESSAGE : "receives"
    PROPERTY ||--o{ BOOKING : "has"
    PROPERTY ||--o{ REVIEW : "receives"
    BOOKING ||--|| PAYMENT : "has"
```

## Database Entities

### User
- Stores user information including authentication details
- Users can be guests, hosts, or admins
- Primary key: `user_id` (UUID)

### Property
- Represents rental properties listed on the platform
- Owned by a host (user with host role)
- Primary key: `property_id` (UUID)
- Foreign key: `host_id` references User

### Booking
- Records reservation information
- Links guests with properties for specific dates
- Primary key: `booking_id` (UUID)
- Foreign keys: `property_id` and `user_id`

### Payment
- Tracks payment information for bookings
- Primary key: `payment_id` (UUID)
- Foreign key: `booking_id` references Booking

### Review
- Stores user feedback about properties
- Primary key: `review_id` (UUID)
- Foreign keys: `property_id` and `user_id`

### Message
- Facilitates communication between users
- Primary key: `message_id` (UUID)
- Foreign keys: `sender_id` and `recipient_id` (both reference User)

## Relationships
- A user can host multiple properties
- A user can make multiple bookings
- A user can write multiple reviews
- A user can send and receive multiple messages
- A property can have multiple bookings
- A property can receive multiple reviews
- Each booking has exactly one payment
