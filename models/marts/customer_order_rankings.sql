with customers as (

    select
        id as customer_id,
        name as customer_name

    from {{ source('jaffle_shop', 'raw_customers') }}

),

customer_order_totals as (

    select
        customer as customer_id,
        count(*) as number_of_orders,
        cast(sum(order_total) / 100.0 as decimal(18, 2)) as total_order_amount

    from {{ source('jaffle_shop', 'raw_orders') }}

    group by 1

),

final as (

    select
        customers.customer_id,
        customers.customer_name,
        coalesce(customer_order_totals.number_of_orders, 0) as number_of_orders,
        coalesce(customer_order_totals.total_order_amount, 0) as total_order_amount,
        dense_rank() over (
            order by coalesce(customer_order_totals.total_order_amount, 0) desc
        ) as customer_rank

    from customers

    left join customer_order_totals using (customer_id)

)

select * from final
