create or replace view ex01 as (
	with recursive alg as(
		select 
			point1 as trip,
			point2 as next_p,
			cost as res
		from graph
		where point1 = 'a'

		union

		select 
			alg.trip || ',' || alg.next_p as trip, 
			graph.point1 as next_p, 
			alg.res + graph.cost as res
		from alg
		inner join graph
		on alg.next_p = graph.point2
		where trip not like '%' || graph.point2 || '%'
	)
  
  select 
		res as total_cost,
		'{' || trip || ',' || 'a' || '}' as tour
  from alg
  where length(trip) = 7 and next_p = 'a'
);

select *
from ex00
order by 1,2;