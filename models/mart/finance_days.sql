SELECT
    date_date,
    COUNT(orders_id) as nb_transactions,
    ROUND(SUM(revenue),2) as total_revenue,
    ROUND(SAFE_DIVIDE((SUM(revenue)),COUNT(orders_id))) as average_basket,
    ROUND(SUM(margin),2) as margin,
    ROUND(SUM(operational_margin),2) as operational_margin,
    ROUND(SUM(purchase_cost),2) as purchase_cost,
    ROUND(SUM(shipping_fee),2) as shipping_fee,
    ROUND(SUM(log_cost),2) as log_cost,
    COUNT(quantity) as quantity
FROM {{ref("int_orders_operational")}}
GROUP BY date_date