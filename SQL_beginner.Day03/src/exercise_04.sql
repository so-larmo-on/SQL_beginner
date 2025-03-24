WITH t AS (
    SELECT person.id, gender, pizzeria.name 
    FROM person
    JOIN person_order ON person_order.person_id = person.id
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
)

(SELECT t.name AS pizzeria_name 
FROM t
WHERE t.gender = 'female'
EXCEPT 
SELECT t.name
FROM t
WHERE t.gender = 'male')
UNION
(SELECT t.name
FROM t
WHERE t.gender = 'male'
EXCEPT 
SELECT t.name
FROM t
WHERE t.gender = 'female')