WITH woman_visited AS (SELECT pi.name AS pizzeria_name
                       FROM person_visits pe
                                JOIN person p ON pe.person_id = p.id
                                JOIN pizzeria pi ON pe.pizzeria_id = pi.id
                       WHERE p.gender = 'female'),
     man_visited AS (SELECT pi.name AS pizzeria_name
                     FROM person_visits pe
                              JOIN person p ON pe.person_id = p.id
                              JOIN pizzeria pi ON pe.pizzeria_id = pi.id
                     WHERE p.gender = 'male'),
     more_woman AS (SELECT pizzeria_name
                    FROM woman_visited
                    EXCEPT ALL
                    SELECT pizzeria_name
                    FROM man_visited),
     more_man AS (SELECT pizzeria_name
                  FROM man_visited
                  EXCEPT ALL
                  SELECT pizzeria_name
                  FROM woman_visited)
SELECT pizzeria_name
FROM more_man
UNION ALL
SELECT pizzeria_name
FROM more_woman
ORDER BY pizzeria_name;