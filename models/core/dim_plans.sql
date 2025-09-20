MODEL (
  name core.dim_plans,
  kind FULL,
  grain id,
  audits (
    not_null(columns := id),
    unique_values(columns := id)
  )
);

SELECT
	id,
	name,
	level,
	price_usd_cents
FROM stg.plans