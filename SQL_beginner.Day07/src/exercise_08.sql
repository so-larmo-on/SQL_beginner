SELECT p.address, pi.name, COUNT(po.person_id) AS count_of_orders
FROM person p
         JOIN person_order po ON po.person_id = p.id
         JOIN menu m ON m.id = po.menu_id
         JOIN pizzeria pi ON pi.id = m.pizzeria_id
GROUP BY p.address, pi.name
ORDER BY p.address, pi.name;