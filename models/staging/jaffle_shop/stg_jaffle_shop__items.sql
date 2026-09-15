with 

source as (

    select * from {{ source('jaffle_shop', 'items') }}

),

renamed as (

    select
        id,
        order_id,
        sku

    from source

)

select * from renamed