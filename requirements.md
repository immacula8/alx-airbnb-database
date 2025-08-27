###Entities & Attributes###

***User***

user_id (PK)

first_name, last_name

email (unique)

phone (nullable, unique)

password_hash

role ENUM(guest,host,admin)

created_at, updated_at

***Property***

property_id (PK)

owner_id (FK → User.user_id)

title

description

property_type (e.g., apartment, house, room)

max_guests

bedrooms, beds, bathrooms

price_per_night

country, state, city, address_line, postal_code

latitude, longitude (nullable)

created_at, updated_at

***Amenity***

amenity_id (PK)

name (unique)

category (e.g., Essentials, Safety, Entertainment)

***PropertyAmenity (junction)***

property_id (FK → Property.property_id)

amenity_id (FK → Amenity.amenity_id)

PK (property_id,amenity_id)

***PropertyPhoto***

photo_id (PK)

property_id (FK → Property.property_id)

url

caption (nullable)

position (for ordering)

***Booking***

booking_id (PK)

guest_id (FK → User.user_id)

property_id (FK → Property.property_id)

check_in (DATE)

check_out (DATE)

guests_count

nightly_price_snapshot

cleaning_fee_snapshot (nullable, default 0)

taxes_snapshot (nullable, default 0)

total_amount

status ENUM(pending,confirmed,cancelled,completed)

created_at, updated_at

***Payment***

payment_id (PK)

booking_id (FK → Booking.booking_id, unique)

amount

currency (ISO 4217 code)

payment_method (card, wallet, transfer)

provider_ref (nullable)

status ENUM(authorized,captured,refunded,failed)

paid_at (nullable)

***PropertyReview***

review_id (PK)

property_id (FK → Property.property_id)

guest_id (FK → User.user_id)

rating (1–5)

comment (nullable)

created_at

###Relationships###

User (host) 1—∞ Property (User owns many Properties).

User (guest) 1—∞ Booking (User makes many Bookings).

Property 1—∞ Booking (Property has many Bookings).

Booking 1—1 Payment (each Booking has at most one Payment record).

Property 1—∞ PropertyPhoto (gallery).

Property ∞—∞ Amenity via PropertyAmenity.

User (guest) 1—∞ PropertyReview and Property 1—∞ PropertyReview.

### Visual ERD (Mermaid — importable in draw.io) ###

USER ||--o{ PROPERTY : owns
USER ||--o{ BOOKING : makes
PROPERTY ||--o{ BOOKING : "is booked in"
BOOKING ||--|{ PAYMENT : has
PROPERTY ||--o{ PROPERTY_PHOTO : has
PROPERTY ||--o{ PROPERTY_REVIEW : receives
USER ||--o{ PROPERTY_REVIEW : writes
PROPERTY ||--o{ PROPERTY_AMENITY : features
AMENITY ||--o{ PROPERTY_AMENITY : listed_in


USER {
string first_name
string last_name
string email UNIQUE
string phone
string password_hash
enum role
datetime created_at
datetime updated_at
}
PROPERTY {
bigint property_id PK
bigint owner_id FK
string title
text description
string property_type
smallint max_guests
smallint bedrooms
smallint beds
smallint bathrooms
numeric price_per_night
string country
string state
string city
string address_line
string postal_code
numeric latitude
numeric longitude
datetime created_at
datetime updated_at
}
AMENITY {
bigint amenity_id PK
string name UNIQUE
string category
}
PROPERTY_AMENITY {
bigint property_id PK,FK
bigint amenity_id PK,FK
}
PROPERTY_PHOTO {
bigint photo_id PK
bigint property_id FK
string url
string caption
smallint position
}
BOOKING {
bigint booking_id PK
bigint guest_id FK
bigint property_id FK
date check_in
date check_out
smallint guests_count
numeric nightly_price_snapshot
numeric cleaning_fee_snapshot
numeric taxes_snapshot
numeric total_amount
enum status
datetime created_at
datetime updated_at
}
PAYMENT {
bigint payment_id PK
bigint booking_id UNIQUE,FK
numeric amount
string currency
string payment_method
string provider_ref
enum status
datetime paid_at
}
PROPERTY_REVIEW {
bigint review_id PK
bigint property_id FK
bigint guest_id FK
smallint rating
text comment
datetime created_at
}