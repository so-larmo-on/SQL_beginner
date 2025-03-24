-- Session #1
BEGIN ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #2
BEGIN ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #1
SELECT SUM(rating) AS sum
FROM pizzeria; -- 19.9
-- Session #2
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';
COMMIT;
-- Session #1
SELECT SUM(rating) AS sum
FROM pizzeria; -- 19.9
COMMIT;
SELECT SUM(rating) AS sum
FROM pizzeria; -- 23.9
-- Session #2
SELECT SUM(rating) AS sum
FROM pizzeria; -- 23.9