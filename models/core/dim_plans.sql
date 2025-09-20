MODEL (
  name core.dim_plans,
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
	id,
	name,
	level,
	price_cents,
	launch_date
FROM stg.plans
WHERE
  launch_date between @start_date and @end_date;