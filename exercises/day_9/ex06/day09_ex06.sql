create function fnc_person_visits_and_eats_on_date(
    pperson varchar default 'Dmitriy', 
    pprice numeric default 500, 
    pdate date default '2022-01-08') 
    returns  table (name varchar) as $$
    begin
        return query 
        select 
            pz.name from person_visits pv
            join person p on p.id = pv.person_id
            join pizzeria pz on pz.id = pv.pizzeria_id
            join menu m on m.pizzeria_id = pz.id
        where p.name = pperson and m.price < pprice and pv.visit_date = pdate
        GROUP BY pz.name;
    end;
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);
select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
