with orders_raw as (
    select *
    from {{ source('jaffle_shop', 'orders') }}
)

, renamed as (
    select id as order_id
    , user_id as customer_id
    , order_date
    from orders_raw
)

select * from renamed