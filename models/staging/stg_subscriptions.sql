MODEL (
  name stg.subscriptions,
  kind INCREMENTAL_BY_TIME_RANGE (
    time_column start_date
  ),
  start '2022-01-01',
  cron '@daily',
  grain (id, start_date),
  audits (
    not_null(columns := (id, customer_id, plan_id))
  )
);

SELECT
  subscription_id AS id,
	customer_id,
	plan_id,
	billing_cycle AS billing_cadence,
	subscription_start_date AS start_date,
	subscription_end_date AS end_date,
	status,
	next_billing_date,
	payment_method
FROM
  raw.subscriptions
WHERE
  subscription_start_date between @start_date and @end_date;