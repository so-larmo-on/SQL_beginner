select person.name as person_name
from person_order
left join person on person.id=person_order.person_id
left join menu on menu.id=person_order.menu_id
where (menu.pizza_name='pepperoni pizza' or menu.pizza_name='mushroom pizza') and
person.gender='male' and (person.address='Moscow' or person.address='Samara')
order by person_name desc