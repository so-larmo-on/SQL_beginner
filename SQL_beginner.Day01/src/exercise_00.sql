SELECT menu.id AS object_id, menu.pizza_name AS object_name
FROM menu
UNION
SELECT person.id, person.name
FROM person
ORDER BY object_id, object_name;