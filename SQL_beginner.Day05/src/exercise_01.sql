set enable_seqscan =off;
EXPLAIN ANALYZE SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;