MODEL (
  name raw.customers,
  kind SEED (
    path '$root/seeds/customers.csv'
  ),
  columns (
    customer_id VARCHAR(10),
		username VARCHAR(100),
		email VARCHAR(254),
		phone VARCHAR(15),
		first_name VARCHAR(100),
		last_name VARCHAR(100),
		date_of_birth DATE,
		preferred_difficulty VARCHAR(10),
		location_city VARCHAR(100),
		location_state VARCHAR(2),
		location_country VARCHAR(100),
		profile_created_date DATE,
		total_hikes_logged INTEGER,
		favorite_trail_type VARCHAR(20)
  ),
  grain customer_id
);