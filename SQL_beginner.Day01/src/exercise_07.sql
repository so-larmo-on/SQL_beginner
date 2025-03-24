select order_date, concat(name, '(', 'возраст:', age,')') as name_order 
from person_order po
join person on po.person_id=person.id
order by order_date, name_order