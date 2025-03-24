WITH
person_visits_period AS (
	SELECT DISTINCT person_id, pizzeria_id, visit_date
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
),
pizzeria_not_visited AS (
    SELECT pz.name AS pizzeria_name
    FROM pizzeria pz
    LEFT JOIN person_visits_period pvp ON pz.id = pvp.pizzeria_id
    WHERE pvp.pizzeria_id IS NULL
),
person_not_visited AS (
    SELECT p.name AS person_name
    FROM person p
    LEFT JOIN person_visits_period pvp ON p.id = pvp.person_id
    WHERE pvp.person_id IS NULL
),
all_visits AS (
    SELECT
        COALESCE(p.name, '-') AS person_name,
        COALESCE(pv.visit_date, null) as visit_date,
        COALESCE(z.name, '-') AS pizzeria_name
    FROM person p
    FULL JOIN person_visits_period pv ON p.id = pv.person_id
    FULL JOIN pizzeria z ON pv.pizzeria_id = z.id
)
select * from all_visits ORDER BY person_name, visit_date, pizzeria_name;