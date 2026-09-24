SELECT
    e.id,
    e.title,
    e.start_at,
    COUNT(f.id) AS favorites_count
FROM events e
JOIN favorites f ON f.event_id = e.id
WHERE e.status = 'published'
GROUP BY e.id, e.title, e.start_at
HAVING COUNT(f.id) >= 5
ORDER BY favorites_count DESC
LIMIT 5;
