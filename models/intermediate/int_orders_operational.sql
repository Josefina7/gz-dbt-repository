SELECT
    margin.products_id,
    margin.orders_id,
    margin.date_date,
    margin.revenue,
    margin.quantity,
    margin.purchase_cost,
    margin.margin,
    ship.shipping_fee,
    ship.logcost AS log_cost,
    ship.ship_cost,
    ROUND((margin.margin + ship.shipping_fee) - (ship.logcost + ship.ship_cost),2) AS operational_margin
FROM {{ref("int_orders_margin")}} as margin 
LEFT JOIN {{ref("stg_data__ship")}} as ship 
USING (orders_id)
ORDER BY orders_id DESC