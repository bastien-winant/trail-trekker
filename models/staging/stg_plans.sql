MODEL (
  name stg.plans,
  kind VIEW,
  grain id,
  audits (
    not_null(columns := id),
    unique_values(columns := id)
  ),
  description 'Perks and pricing details for each plan'
);

SELECT
	plan_id AS id,
	plan_name AS name,
	plan_level AS level,
	CAST(price*100 AS INTEGER) AS price_usd_cents,
	max_hikes_per_month,
	photo_storage_gb,
	description,
	created_at AS launch_date
FROM raw.plans
WHERE plan_id LIKE '%M' OR plan_id LIKE '%A'