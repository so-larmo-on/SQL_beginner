SELECT p.name AS person_name, m.pizza_name, pi.name AS pizzeria_name
FROM person p
         JOIN person_order pe ON p.id = pe.person_id
         JOIN menu m ON pe.menu_id = m.id
         JOIN pizzeria pi ON m.pizzeria_id = pi.id
ORDER BY person_name, pizza_name, pizzeria_name;