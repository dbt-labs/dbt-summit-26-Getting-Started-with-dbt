-- created_at: 2025-10-03T09:41:20.522621+00:00
-- finished_at: 2025-10-03T09:41:20.782095+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01bf75c5-0609-9725-0075-7d83164d1bbe
-- desc: execute adapter call
show terse schemas in database dbt_learn
    limit 10000
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"default","target_name":"dev","connection_name":""} */;
-- created_at: 2025-10-03T09:41:20.784557+00:00
-- finished_at: 2025-10-03T09:41:21.019077+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01bf75c5-0609-9725-0075-7d83164d1bc2
-- desc: execute adapter call
create schema if not exists dbt_learn.dbt_atrivedi_gs
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"default","target_name":"dev","connection_name":""} */;
-- created_at: 2025-10-03T09:41:21.580626+00:00
-- finished_at: 2025-10-03T09:41:21.809952+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.customers
-- query_id: 01bf75c5-0609-94aa-0075-7d83164d3862
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "DBT_LEARN"."DBT_ATRIVEDI_GS" LIMIT 10000;
-- created_at: 2025-10-03T09:41:21.815469+00:00
-- finished_at: 2025-10-03T09:41:22.329972+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.customers
-- query_id: 01bf75c5-0609-94aa-0075-7d83164d3866
-- desc: execute adapter call
create or replace   view dbt_learn.dbt_atrivedi_gs.customers
  
   as (
    with customers as (

    select
        id as customer_id,
        first_name,
        last_name

    from raw.jaffle_shop.customers

),

orders as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from raw.jaffle_shop.orders

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),


final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

)

select * from final
  )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"default","target_name":"dev","node_id":"model.jaffle_shop.customers"} */;
