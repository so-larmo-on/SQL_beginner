with
data_range as (SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval)::date as visit_date),
visits as (SELECT distinct visit_date from person_visits where person_id=1 or person_id=2)

select data_range.visit_date as missing_date
from data_range
left join visits on data_range.visit_date=visits.visit_date
where visits.visit_date is null
order by missing_date