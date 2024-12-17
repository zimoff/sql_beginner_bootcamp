drop trigger trg_person_insert_audit on person ;
drop trigger trg_person_update_audit on person ;
drop trigger trg_person_delete_audit on person ;

drop function fnc_trg_person_delete_audit;
drop function fnc_trg_person_insert_audit;
drop function fnc_trg_person_update_audit;

truncate person_audit ;

create function fnc_trg_person_audit() returns trigger as $person_audit$
    begin

        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit SELECT now(), 'I', NEW.*;
            RETURN NEW;
        ELSIF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit SELECT now(), 'D', OLD.*;
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit SELECT now(), 'U', OLD.*;
            RETURN OLD;
        END IF;

        RETURN NULL; 

    end;
    $person_audit$ language plpgsql;

create trigger trg_person_audit
after delete or insert or update on person 
    for each row execute procedure fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
