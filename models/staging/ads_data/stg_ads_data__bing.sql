with 

source as (

    select * from {{ source('data', 'bing') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        campgn_name as campaign_name,
        CAST(ads_cost as FLOAT64) AS ads_cost,
        impression,
        click

    from source

)

select * from renamed
