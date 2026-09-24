SELECT
    c.name AS category_name,
    COUNT(o.id) AS orders_count,
    AVG(o.total_amount) AS avg_order_amount
FROM categories c
JOIN events e ON e.category_id = c.id
JOIN orders o ON o.event_id = e.id
WHERE o.status = 'paid'
GROUP BY c.name
ORDER BY avg_order_amount DESC;
