MODEL (
  name core.dim_plans,
  kind VIEW,
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
	price_usd_cents,
	launch_date
FROM stg.plans