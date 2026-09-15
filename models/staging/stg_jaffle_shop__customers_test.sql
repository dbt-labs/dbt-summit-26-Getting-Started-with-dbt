with source as (

    select * from {{ source('jaffle_shop', 'customers_test') }}

),

renamed as (

    select
        id as customer_id,
        name as customer_name

    from source

)

select * from renamed
