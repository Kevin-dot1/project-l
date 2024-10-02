## TOTAL SALES per product category
SELECT 
    p.product_category_name, 
    SUM(o.total_price) AS total_sales
FROM 
    orders o
JOIN 
    products p
ON 
    o.product_id = p.product_id
GROUP BY 
    p.product_category_name
ORDER BY 
    total_sales DESC;
   
   
## The average delivery time per seller from the fact table
SELECT 
    o.seller_id, 
    AVG(TIMESTAMPDIFF(DAY, o.order_purchase_timestamp, o.order_delivered_customer_date)) AS avg_delivery_time
FROM 
    orders o
WHERE 
    o.order_delivered_customer_date IS NOT NULL
GROUP BY 
    o.seller_id
ORDER BY 
    avg_delivery_time ASC;
   

## Number of orders from each state from the customer dimension.
SELECT 
    c.customer_state, 
    COUNT(o.order_id) AS num_orders
FROM 
    customers c
JOIN 
    orders o
ON 
    c.customer_id = o.customer_id
GROUP BY 
    c.customer_state
ORDER BY 
    num_orders DESC;

    