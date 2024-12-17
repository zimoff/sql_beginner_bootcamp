insert into person_visits (id, person_id, pizzeria_id, visit_date)
select max(id) + 1,
(select distinct id as person_id from person where name like 'Dmitriy'),
(select id as pizzeria_id from pizzeria where name like 'Dominos'),
'2022-01-08'
from person_visits;

refresh materialized view mv_dmirty_visits_and_eats;


