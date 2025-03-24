INSERT INTO person_visits values ((SELECT MAX (id) + 1 FROM person_visits), 
(SELECT id FROM person WHERE name = 'Denis'),   
(SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
'2022-02-24');

INSERT INTO person_visits values ((SELECT MAX (id) + 1 FROM person_visits), 
(SELECT id FROM person WHERE name = 'Irina'),   
(SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
'2022-02-24');