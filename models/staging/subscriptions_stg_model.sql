MODEL (
	name stg.subscriptions,
	kind VIEW,
  grain id,
  audits (
    NOT_NULL(columns := (id, customer_id, plan_id, start_date, status))
  )
);

SELECT
	subscription_id AS id,
	customer_id,
	plan_id,
	billing_cycle AS billing_cadence,
	subscription_start_date AS start_date,
	subscription_end_date AS end_date,
	status AS status,
	next_billing_date AS next_billing_date,
	payment_method
FROM raw.subscriptions;