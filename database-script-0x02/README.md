# Database Seed Script

This directory contains SQL scripts to populate the Airbnb database with **sample data**.

## Files
- **seed.sql** → Adds sample data for:
  - Users
  - Properties
  - Bookings
  - Payments

## Usage

Run the script after creating the database schema:

```bash
mysql -u username -p database_name < database-script-0x02/seed.sql
