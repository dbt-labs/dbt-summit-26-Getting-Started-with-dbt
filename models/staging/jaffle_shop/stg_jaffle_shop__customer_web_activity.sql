with 

source as (

    select * from {{ source('jaffle_shop', 'customer_web_activity') }}

),

renamed as (

    select
        customer_id,
        web_session_length,
        session_date,
        count_pages_visited,
        device_type,
        referrer_source

    from source

)

select * from renamed