explain analyse
select * from article
where id = 1;


EXPLAIN ANALYZE
UPDATE article
SET status_id = 2, updated_at = NOW()
WHERE id = 1;


EXPLAIN ANALYZE
SELECT
    c.name AS category_name,
    COUNT(ac.article_id) AS article_count
FROM
    category c
        LEFT JOIN
    article_category ac ON c.id = ac.category_id
GROUP BY
    c.id, c.name;

EXPLAIN ANALYZE
SELECT *
FROM article_category
WHERE category_id = 2;

EXPLAIN ANALYZE
SELECT category_id, COUNT(*) AS article_count
FROM article_category
GROUP BY category_id;