MODEL (
	name core.plans,
	kind VIEW,
  audits (
    not_null(columns := (plan_id))
  )
);

WITH monthly_plan AS (
	SELECT
		*,
		SUBSTRING(plan_id, 1, LEN(plan_id) - 1) AS id
	FROM stg.plans
	WHERE plan_id LIKE '%M'
),
annual_plan AS (
	SELECT
		*,
		SUBSTRING(plan_id, 1, LEN(plan_id) - 1) AS id
	FROM stg.plans
	WHERE plan_id LIKE '%A'
)
SELECT
	m.id as plan_id,
	m.plan_name,
	m.plan_level,
	CAST(m.price*100 AS INTEGER) AS monthly_price_usd_cents,
	CAST(a.price*100 AS INTEGER) yearly_price_usd_cents,
	m.max_hikes_per_month,
	m.photo_storage_gb,
	m.description
FROM monthly_plan m
JOIN annual_plan a
ON m.id = a.id;