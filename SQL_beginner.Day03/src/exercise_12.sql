INSERT INTO person_order 
SELECT 
    MAX (person_order.id) + i,
    i,
    (SELECT menu.id FROM menu WHERE menu.pizza_name = 'greek pizza'),
    '2022-02-25'
FROM generate_series(1, (SELECT COUNT(*) FROM person)) AS i CROSS JOIN person_order
GROUP BY i;