MODEL (
  name stg.subscriptions,
  kind VIEW,
  grain id,
  audits (
    not_null(columns := (id, customer_id, plan_id))
  ),
  description 'Subscription details for a customer'
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
FROM raw.subscriptions