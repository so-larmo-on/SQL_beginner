INSERT INTO MENU VALUES ((SELECT MAX (menu.id) + 1 FROM MENU), (SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'), 'sicilian pizza', 900);