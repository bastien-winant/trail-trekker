MODEL (
	name stg.plans,
	kind VIEW,
  grain id,
  audits (
    NOT_NULL(columns := (id, name))
  )
);

SELECT
	plan_id AS id,
	plan_name AS name,
	plan_level AS level,
	description,
	CAST(price*100 AS INTEGER) AS price_cents,
	max_hikes_per_month,
	photo_storage_gb,
	created_at
FROM raw.plans
WHERE plan_id LIKE '%A' OR plan_id LIKE '%M';