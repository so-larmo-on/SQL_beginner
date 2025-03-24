select pz.name, pz.rating
from pizzeria pz
left join person_visits pv on pv.pizzeria_id=pz.id
where pv.id IS NULL