SELECT pi.name,
       COUNT(po.menu_id)      AS count_orders,
       ROUND(AVG(m.price), 2) AS average_price,
       MAX(m.price)           AS max_price,
       MIN(m.price)           AS min_price
FROM menu m
         JOIN person_order po ON m.id = po.menu_id
         JOIN pizzeria pi ON pi.id = m.pizzeria_id
GROUP BY pi.name
ORDER BY pi.name;