create function fnc_trg_person_delete_audit() returns trigger as $$
    begin

        IF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit SELECT now(), 'D', OLD.*;
            RETURN OLD;
        END IF;
        RETURN NULL; 

    end;
    $$ language plpgsql;

create trigger trg_person_delete_audit
after delete on person 
    for each row execute procedure fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

table person_audit;
table person;
