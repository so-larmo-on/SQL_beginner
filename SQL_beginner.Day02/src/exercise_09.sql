with 
cheese_fan(person_name) as (select person.name as person_name
	from person_order
	left join person on person.id=person_order.person_id
	left join menu on menu.id=person_order.menu_id
	where menu.pizza_name='cheese pizza' and
		   person.gender='female'
	order by person_name),
pepperoni_fan(person_name) as (select person.name as person_name
	from person_order
	left join person on person.id=person_order.person_id
	left join menu on menu.id=person_order.menu_id
	where menu.pizza_name='pepperoni pizza' and
		   person.gender='female'
	order by person_name)
select cheese_fan.person_name
from cheese_fan
left join pepperoni_fan on cheese_fan.person_name=pepperoni_fan.person_name
where cheese_fan.person_name=pepperoni_fan.person_name
order by person_name