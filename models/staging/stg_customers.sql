MODEL (
  name stg.customers,
  kind INCREMENTAL_BY_TIME_RANGE (
    time_column profile_created_date
  ),
  start '2022-01-01',
  cron '@daily',
  grain id,
  audits (
    not_null(columns := (id, username, email, phone, profile_created_date)),
    unique_values(columns := (id, username, email, phone))
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
FROM
  raw.customers
WHERE
  profile_created_date between @start_date and @end_date;