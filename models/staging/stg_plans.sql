MODEL (
  name stg.plans,
  kind INCREMENTAL_BY_TIME_RANGE (
    time_column launch_date
  ),
  start '2021-01-01',
  cron '@daily',
  grain id,
  audits (
    not_null(columns := (id, name, launch_date)),
    unique_values(columns := id)
  )
);

SELECT
  plan_id AS id,
	plan_name AS name,
	plan_level AS level,
	CAST(100*price AS INTEGER) AS price_cents,
	max_hikes_per_month,
	photo_storage_gb,
	description,
	created_at AS launch_date
FROM
  raw.plans
WHERE
  created_at between @start_date and @end_date;