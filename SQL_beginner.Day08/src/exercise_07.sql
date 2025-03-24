-- Session #1
BEGIN;
-- Session #2
BEGIN;
-- Session #1
UPDATE pizzeria
SET rating = 1
WHERE id = 1;
-- Session #2
UPDATE pizzeria
SET rating = 2
WHERE id = 2;
-- Session #1
UPDATE pizzeria
SET rating = 2.2
WHERE id = 2;
-- Waiting session #2
-- Session #2
UPDATE pizzeria
SET rating = 1.1
WHERE id = 1;
-- Waiting session #1
-- Session #1
ROLLBACK;
-- Session #2
ROLLBACK;