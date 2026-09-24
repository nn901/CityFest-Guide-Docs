SELECT
    e.id,
    e.title,
    e.start_at,
    COUNT(t.id) AS tickets_sold
FROM events e
JOIN orders o ON o.event_id = e.id
JOIN tickets t ON t.order_id = o.id
WHERE o.status = 'paid'
GROUP BY e.id, e.title, e.start_at
ORDER BY tickets_sold DESC
LIMIT 10;
