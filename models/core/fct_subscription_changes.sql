MODEL (
	name core.fct_subscription_changes,
  kind VIEW,
  grain (customer_id, change_date),
  audits (
    NOT_NULL(columns := (customer_id, change_date))
  )
);

WITH lagged_subscriptions AS (
	SELECT
		customer_id,
		plan_id,
		start_date,
		end_date,
		status,
		LAG(plan_id) OVER (PARTITION BY customer_id ORDER BY start_date) AS previous_plan_id,
		LAG(end_date) OVER (PARTITION BY customer_id ORDER BY start_date) AS previous_plan_end_date,
		LEAD(plan_id) OVER (PARTITION BY customer_id ORDER BY start_date) AS next_plan_id,
		LEAD(start_date) OVER (PARTITION BY customer_id ORDER BY start_date) AS next_plan_start_date
	FROM stg.subscriptions
),
subscription_changes AS (
	SELECT
		customer_id,
		'change' AS change_type,
		start_date AS change_date,
		plan_id,
		previous_plan_id
	FROM lagged_subscriptions
	WHERE previous_plan_id IS NOT NULL
	AND start_date = previous_plan_end_date
),
subscription_cancellations AS (
	SELECT
		customer_id,
		'cancellation' AS change_type,
		end_date AS change_date,
		plan_id,
		previous_plan_id
	FROM lagged_subscriptions
	WHERE (next_plan_start_date IS NULL AND status = 'cancelled')
	OR (next_plan_start_date IS NOT NULL AND end_date <> next_plan_start_date)
)
SELECT *
FROM subscription_changes
UNION
SELECT *
FROM subscription_cancellations
ORDER BY change_date;