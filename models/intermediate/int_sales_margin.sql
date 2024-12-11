select
    products_id,
    orders_id,
    date_date,
    revenue,
    quantity,
    round(product.purchase_price * sales.quantity,2) as purchase_cost,
    round(sales.revenue - (product.purchase_price * sales.quantity),2) as margin
from {{ref("stg_data__sales")}} as sales
    join {{ref("stg_data__product")}} as product
    using (products_id)