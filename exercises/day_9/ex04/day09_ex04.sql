create function fnc_persons_male() returns 
    table(
        id bigint,
        name varchar,
        age int,
        gender varchar,
        address varchar)
    as $$
    begin
        return query select * from person
        where person.gender = 'male';
    end;
    $$ language plpgsql;

create function fnc_persons_female() returns 
    table(
        id bigint,
        name varchar,
        age int,
        gender varchar,
        address varchar)
    as $$
    begin
        return query select * from person
        where person.gender = 'female';
    end;
    $$ language plpgsql;

SELECT * FROM fnc_persons_female();
SELECT * FROM fnc_persons_male();
