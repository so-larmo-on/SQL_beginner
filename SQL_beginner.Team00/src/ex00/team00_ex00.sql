create table if not exists graph(
	id serial primary key,
	point1 text not null,
	point2 text not null,
	cost int not null
);

insert into graph(point1, point2, cost)
values ('a', 'b', 10),
       ('b', 'a', 10),
       ('a', 'c', 15),
       ('c', 'a', 15),
       ('a', 'd', 20),
       ('d', 'a', 20),
       ('b', 'd', 25),
       ('d', 'b', 25),
       ('c', 'd', 30),
       ('d', 'c', 30),
       ('b', 'c', 35),
       ('c', 'b', 35);

create or replace view ex00 as (
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

select * from ex00
where total_cost = (select min(total_cost) from ex00)
order by 1,2;
