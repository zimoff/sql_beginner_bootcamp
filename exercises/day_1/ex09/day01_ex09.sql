select * from pizzeria pz where not exists (select 1 from person_visits pv where pv.pizzeria_id = pz.id);
select * from pizzeria where id not in (select pizzeria_id from person_visits);
