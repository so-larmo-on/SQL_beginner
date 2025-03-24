SELECT
       (SELECT person.name FROM person WHERE person.id = person_order.person_id ) AS name,
       (SELECT person.name = 'Denis' FROM person WHERE person.id = person_order.person_id) AS check_name
FROM person_order
WHERE (menu_id BETWEEN 13 AND 14 OR menu_id = 18) AND order_date = '2022-01-07';