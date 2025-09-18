MODEL (
  name raw.subscriptions,
  kind SEED (
    path '$root/seeds/subscriptions.csv'
  ),
  columns (
		subscription_id VARCHAR(10),
		customer_id VARCHAR(10),
		plan_id VARCHAR(10),
		billing_cycle VARCHAR(10),
		subscription_start_date DATE,
		subscription_end_date DATE,
		status VARCHAR(10),
		next_billing_date DATE,
		payment_method VARCHAR(20)
  ),
  grain subscription_id
);