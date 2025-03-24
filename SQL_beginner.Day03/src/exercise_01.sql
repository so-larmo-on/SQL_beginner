SELECT menu.id AS menu_id
FROM menu
WHERE menu.id NOT IN (SELECT menu_id from person_order);