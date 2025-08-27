### Demonstrate that the schema is in Third Normal Form (3NF) while remaining practical for an Airbnb‑like workload. ###

***1NF (Atomicity & Keys)***

Every table has a primary key.

All attributes are atomic (no repeating groups).

Examples: amenities are not stored as a comma‑separated list inside Property; instead they are normalized into Amenity + PropertyAmenity.

***2NF (No partial dependency on part of a composite key)***

Only junction table PropertyAmenity has a composite PK (property_id,amenity_id), and no non‑key attributes depend on part of that composite key.

All other tables use single‑column surrogate keys; non‑key attributes depend on the whole key.

***3NF (No transitive dependencies)***

In Property, location attributes (country, state, city, etc.) describe the property and depend directly on property_id; they do not determine other non‑key attributes.

In Booking, financial snapshots (nightly_price_snapshot, fees, taxes) are denormalized on purpose as historical snapshots. They depend on the booking (the key) and are not used as lookup references—so no transitive dependency that violates 3NF.

Payment depends only on booking_id (1‑to‑1).

PropertyReview attributes (rating, comment) depend on the review row (the key).