create table if not exists person_audit (
    created timestamp default current_timestamp not null,
    type_event char default 'I' not null,
    row_id bigint not null,
    name varchar,
    age int,
    gender varchar,
    address varchar,
    constraint ch_type_event check (type_event in ('I', 'D', 'U'))
)

create function fnc_trg_person_insert_audit() returns trigger as $person_audit$
    begin

        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit SELECT now(), 'I', NEW.*;
            RETURN NEW;
        END IF;
        RETURN NULL; 

    end;
    $person_audit$ language plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person 
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

table person_audit;
table person;

