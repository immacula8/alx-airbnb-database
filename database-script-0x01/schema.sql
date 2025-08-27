-- Schema for an Airbnb-like relational database (PostgreSQL)
CREATE SCHEMA IF NOT EXISTS airbnb;
SET search_path = airbnb, public;


-- ENUM types
DO $$ BEGIN
IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'user_role') THEN
CREATE TYPE user_role AS ENUM ('guest','host','admin');
END IF;
IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'booking_status') THEN
CREATE TYPE booking_status AS ENUM ('pending','confirmed','cancelled','completed');
END IF;
IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'payment_status') THEN
CREATE TYPE payment_status AS ENUM ('authorized','captured','refunded','failed');
END IF;
END $$;


-- USERS
CREATE TABLE IF NOT EXISTS users (
user_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
first_name VARCHAR(80) NOT NULL,
last_name VARCHAR(80) NOT NULL,
email CITEXT NOT NULL UNIQUE,
phone VARCHAR(32) UNIQUE,
password_hash TEXT NOT NULL,
role user_role NOT NULL DEFAULT 'guest',
created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- PROPERTIES
CREATE TABLE IF NOT EXISTS properties (
property_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
owner_id BIGINT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
title VARCHAR(160) NOT NULL,
description TEXT,
property_type VARCHAR(40) NOT NULL,
max_guests SMALLINT NOT NULL CHECK (max_guests > 0),
bedrooms SMALLINT NOT NULL CHECK (bedrooms >= 0),
beds SMALLINT NOT NULL CHECK (beds >= 0),
bathrooms SMALLINT NOT NULL CHECK (bathrooms >= 0),
price_per_night NUMERIC(12,2) NOT NULL CHECK (price_per_night >= 0),
country VARCHAR(60) NOT NULL,
state VARCHAR(60),
city VARCHAR(80) NOT NULL,
address_line VARCHAR(160) NOT NULL,
postal_code VARCHAR(24),
latitude NUMERIC(9,6),
longitude NUMERIC(9,6),
created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- AMENITIES
CREATE TABLE IF NOT EXISTS amenities (
amenity_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
category VARCHAR(60) NOT NULL
);


-- PROPERTY_AMENITIES (junction)
CREATE TABLE IF NOT EXISTS property_amenities (
property_id BIGINT NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE,
amenity_id BIGINT NOT NULL REFERENCES amenities(amenity_id) ON DELETE CASCADE,
PRIMARY KEY (property_id, amenity_id)
);


-- PROPERTY_PHOTOS
CREATE TABLE IF NOT EXISTS property_photos (
photo_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
property_id BIGINT NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE,
url TEXT NOT NULL,
caption TEXT,
position SMALLINT NOT NULL DEFAULT 1 CHECK (position >= 1)
);


-- BOOKINGS
CREATE TABLE IF NOT EXISTS bookings (
booking_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
guest