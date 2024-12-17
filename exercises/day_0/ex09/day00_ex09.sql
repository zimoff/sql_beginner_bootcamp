select 
    (select name from person where id = pv.person_id) as person_name, 
    (select name from pizzeria where id = pv.pizzeria_id) as piz_name 
    from 
    (select person_id, pizzeria_id from person_visits where (visit_date between '2022-01-07' and '2022-01-09')) pv 
    order by person_name asc, piz_name desc;
