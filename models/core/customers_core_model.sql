MODEL (
	name core.customers,
	kind VIEW,
  audits (
    not_null(columns := (id, username))
  )
);

SELECT
	customer_id AS id,
	username,
	email,
	phone,
	first_name,
	last_name,
	date_of_birth,
	preferred_difficulty,
	location_city,
	location_state,
	location_country,
	profile_created_date,
	total_hikes_logged,
	favorite_trail_type
FROM stg.customers;