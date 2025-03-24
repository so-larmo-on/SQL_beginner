(SELECT pizzeria.name AS pizzeria_name
FROM person_visits
JOIN person ON person_visits.person_id = person.id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
WHERE (person.name = 'Andrey'))
EXCEPT
(
SELECT pizzeria.name AS pizzeria_name
FROM person_order
JOIN  person ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Andrey'
)