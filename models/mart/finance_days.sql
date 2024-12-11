select
    date_date,
    count(orders_id) as nb_transactions,
    round(sum(revenue), 2) as total_revenue,
    round(safe_divide((sum(revenue)), count(orders_id))) as average_basket,
    round(sum(margin), 2) as margin,
    round(sum(operational_margin), 2) as operational_margin,
    round(sum(purchase_cost), 2) as purchase_cost,
    round(sum(shipping_fee), 2) as shipping_fee,
    round(sum(log_cost), 2) as log_cost,
    count(quantity) as quantity
from {{ ref("int_orders_operational") }}
group by date_date
