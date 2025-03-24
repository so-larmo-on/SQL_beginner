select menu.pizza_name, pizzeria.name as pizzeria_name, menu.price
from menu
left join pizzeria on menu.pizzeria_id=pizzeria.id
where pizza_name='mushroom pizza' or
pizza_name='pepperoni pizza'
order by pizza_name, pizzeria_name