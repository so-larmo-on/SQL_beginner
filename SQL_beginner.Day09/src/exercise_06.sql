DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date;

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson varchar DEFAULT 'Dmitriy',
    IN pprice numeric DEFAULT 500,
    IN pdate date DEFAULT '2022-01-08'
)
RETURNS TABLE (
    pizzeria_name varchar
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        pizzeria.name AS pizzeria_name
    FROM
        person
    JOIN
        person_order ON person.id = person_order.person_id
    JOIN
        menu ON person_order.menu_id = menu.id
    JOIN
        pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE
        person.name = pperson
        AND person_order.order_date = pdate
        AND menu.price < pprice;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');