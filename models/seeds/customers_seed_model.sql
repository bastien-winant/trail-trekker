MODEL (
	name raw.customers,
	kind SEED (
		path: '$/seeds/customers.csv'
	),
	start '2022-08-20',
	columns (
		customer_id VARCHAR(10),
		username VARCHAR(50),
		email VARCHAR(50),
		phone VARCHAR(12),
		first_name VARCHAR(50),
		last_name VARCHAR(50),
		date_of_birth DATE,
		preferred_difficulty VARCHAR(50),
		location_city VARCHAR(50),
		location_state CHAR(2),
		location_country VARCHAR(50),
		profile_created_date DATE,
		total_hikes_logged INTEGER,
		favorite_trail_type VARCHAR(50)
	),
	grain (customer_id)
)