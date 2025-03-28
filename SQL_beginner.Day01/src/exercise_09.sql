SELECT name
FROM pizzeria p
WHERE p.id NOT IN (SELECT pizzeria_id FROM person_visits);

SELECT name
FROM pizzeria p
WHERE NOT EXISTS (SELECT pizzeria_id FROM person_visits WHERE pizzeria_id = p.id);