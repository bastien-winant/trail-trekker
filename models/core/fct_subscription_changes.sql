MODEL (
	name core.fct_subscription_changes,
  kind VIEW,
  grain (subscription_id, change_date),
  audits (
    NOT_NULL(columns := (subscription_id, customer_id, change_date))
  )
);

WITH lagged_subscriptions AS (
	SELECT
		id,
		customer_id,
		plan_id,
		start_date,
		LAG(plan_id) OVER (PARTITION BY customer_id ORDER BY start_date) AS previous_plan_id,
		LAG(end_date) OVER (PARTITION BY customer_id ORDER BY start_date) AS previous_plan_end_date
	FROM stg.subscriptions
),
subscription_changes AS (
	SELECT
		id AS subscription_id,
		customer_id,
		'change' AS change_type,
		start_date AS change_date,
		plan_id,
		previous_plan_id
	FROM lagged_subscriptions
	WHERE previous_plan_id IS NOT NULL
	AND start_date = previous_plan_end_date
)
SELECT *
FROM subscription_changes
ORDER BY customer_id, change_date;