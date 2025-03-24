SELECT *
from person
         CROSS JOIN pizzeria
ORDER BY person.id, pizzeria.id;