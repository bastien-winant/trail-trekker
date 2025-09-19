MODEL (
  name core.fct_subscription_changes,
	kind FULL,
	grain (subscription_id, change_date),
	audits (
		not_null(columns := (subscription_id, customer_id, change_type, change_date))
	)
);

WITH lagged_subscriptions AS (
	SELECT
		id AS subscription_id,
		customer_id,
		plan_id,
		start_date,
		end_date,
		status,
		LEAD(id) OVER (PARTITION BY customer_id ORDER BY start_date) AS next_subscription_id,
		LEAD(plan_id) OVER (PARTITION BY customer_id ORDER BY start_date) AS next_plan_id,
		LEAD(start_date) OVER (PARTITION BY customer_id ORDER BY start_date) AS next_plan_start_date
	FROM stg.subscriptions
),
subscription_changes AS (
	SELECT
		subscription_id,
		customer_id,
		CASE
			WHEN subscription_id = next_subscription_id THEN 'switch'
			WHEN subscription_id <> next_subscription_id THEN 'cancellation'
		END AS change_type,
		end_date AS change_date
	FROM lagged_subscriptions
	WHERE status = 'cancelled'
)
SELECT * FROM subscription_changes
ORDER BY subscription_id;