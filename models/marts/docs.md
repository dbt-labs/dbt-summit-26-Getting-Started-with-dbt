{% docs source_jaffle_shop %}
Raw operational data for the Jaffle Shop application. This source provides the customer and order records used to build the analytics layer.
{% enddocs %}

{% docs source_jaffle_shop_customers %}
Raw customer records from the Jaffle Shop application. Each row represents one customer.
{% enddocs %}

{% docs source_jaffle_shop_orders %}
Raw order records from the Jaffle Shop application. Each row represents one order placed by a customer.
{% enddocs %}

{% docs stg_customers %}
Staged customer records from the Jaffle Shop source. This model renames the source identifier to `customer_id` and retains each customer's name attributes. The grain is one row per customer.
{% enddocs %}

{% docs stg_orders %}
Staged order records from the Jaffle Shop source. This model standardizes raw order fields for downstream use. The grain is one row per order.
{% enddocs %}

{% docs dim_customers %}
Customer dimension with lifetime order activity. The grain is one row per customer, including customers who have never placed an order. Order metrics include the first order date, most recent order date, and total number of orders.
{% enddocs %}

{% docs order_status %}
One of the following values:

| status | definition |
|---|---|
| placed | Order placed, not yet shipped |
| shipped | Shipped, not yet delivered |
| completed | Received by customer |
| return_pending | Return requested |
| returned | Item returned |
{% enddocs %}

