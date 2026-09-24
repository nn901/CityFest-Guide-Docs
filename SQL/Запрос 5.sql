SELECT
    e.id,
    e.title,
    e.start_at,
    v.name AS venue_name,
    v.district,
    c.name AS category_name,
    MIN(tt.price) AS min_price
FROM events e
JOIN venues v ON v.id = e.venue_id
JOIN categories c ON c.id = e.category_id
LEFT JOIN ticket_types tt ON tt.event_id = e.id
WHERE e.status = 'published'
  AND e.start_at >= '2026-11-12 00:00:00'
  AND e.start_at <  '2026-11-15 00:00:00'
GROUP BY e.id, e.title, e.start_at, v.name, v.district, c.name
ORDER BY e.start_at ASC;
