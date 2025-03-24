SELECT date_gen.visit_date::date AS missing_date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) as date_gen(visit_date)
LEFT JOIN (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
) as visits ON date_gen.visit_date = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missing_date;