INSERT INTO person_order values ((SELECT MAX (id) + 1 FROM person_order), 
(SELECT id FROM person WHERE name = 'Denis'),   
(SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
'2022-02-24');

INSERT INTO person_order values ((SELECT MAX (id) + 1 FROM person_order), 
(SELECT id FROM person WHERE name = 'Irina'),   
(SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
'2022-02-24');