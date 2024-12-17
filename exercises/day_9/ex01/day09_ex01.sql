create function fnc_trg_person_update_audit() returns trigger as $trg_person_update_audit$
    begin

        IF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit SELECT now(), 'U', OLD.*;
            RETURN OLD;
        END IF;
        RETURN NULL; 

    end;
    $trg_person_update_audit$ language plpgsql;

create trigger trg_person_update_audit
after update on person 
    for each row execute procedure fnc_trg_person_update_audit();


UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

table person_audit;
table person;
