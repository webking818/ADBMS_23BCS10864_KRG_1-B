CREATE VIEW vW_ORDER_SUMMARY AS 
SELECT  
    O.order_id, 
    O.order_date, 
    P.product_name, 
    C.full_name, 
    (P.unit_price * O.quantity) - ((P.unit_price * O.quantity) * O.discount_percent / 100) AS final_cost 
FROM customer_master AS C 
JOIN sales_orders AS O  
    ON O.customer_id = C.customer_id 
JOIN product_catalog AS P 
    ON P.product_id = O.product_id; 
 
SELECT * FROM vW_ORDER_SUMMARY; 
 
 
 
CREATE ROLE CLIENT_USER 
LOGIN 
PASSWORD 'client_password'; 
 
GRANT SELECT ON vW_ORDER_SUMMARY TO CLIENT_USER; 
 
REVOKE SELECT ON vW_ORDER_SUMMARY FROM CLIENT_USER; 
