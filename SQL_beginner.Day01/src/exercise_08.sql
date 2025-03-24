SELECT order_date, p.name || ' (age:' || p.age || ')' AS person_information
FROM person_order po
         NATURAL JOIN LATERAL (SELECT name, age FROM person WHERE id = po.person_id) AS p
ORDER BY order_date, person_information;