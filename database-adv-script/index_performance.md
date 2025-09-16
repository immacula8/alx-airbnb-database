# Database Indexing

This project includes SQL commands for creating indexes on high-usage columns.

## File
- **database_index.sql**: contains all the `CREATE INDEX` commands.

## Indexed Columns
- Users: `email`
- Bookings: `user_id`, `property_id`, `date`
- Properties: `location`

## Usage
Run the SQL file in your database:

```bash
psql -d your_database -f database_index.sql

