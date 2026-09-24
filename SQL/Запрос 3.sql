SELECT
    e.id,
    e.title,
    e.status,
    m.auto_score,
    m.auto_result,
    u.name AS moderator_name
FROM events e
JOIN moderation_checks m ON m.event_id = e.id
LEFT JOIN users u ON u.id = m.moderator_id
WHERE e.status = 'pending'
  AND m.auto_score >= 70
ORDER BY m.auto_score DESC;
