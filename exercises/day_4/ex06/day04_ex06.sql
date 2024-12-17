create materialized view mv_dmirty_visits_and_eats as
select 
    pv.visit_date as visit_and_order_date, 
    p.name, 
    pz.name as pizzeria_name, 
    m.pizza_name, 
    m.price 
    from person_visits pv 
    join person p on p.id = pv.person_id 
    join pizzeria pz on pv.pizzeria_id = pz.id
    join person_order po on po.order_date = pv.visit_date
    join menu m on m.id = po.menu_id
where p.name like 'Dmitriy' and pv.visit_date = '2022-01-08';

