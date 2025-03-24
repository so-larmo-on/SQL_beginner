CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS
$trg_person_delete_audit$
    BEGIN
        CASE TG_OP 
            WHEN 'DELETE' THEN INSERT INTO person_audit VALUES (
                CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'D', old.id, old.name,
                old.age, old.gender, old.address);
            ELSE NULL;
        END CASE;
    RETURN coalesce(NEW, OLD);
    END;
$trg_person_delete_audit$
LANGUAGE  plpgsql; 
CREATE OR REPLACE TRIGGER trg_person_delete_audit
AFTER DELETE
ON person 
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_delete_audit();
DELETE FROM person WHERE id = 10;