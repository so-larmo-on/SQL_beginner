    (SELECT person.name FROM person ORDER BY person.name)
    UNION ALL
    (SELECT menu.pizza_name AS object_name FROM menu ORDER BY menu.pizza_name);