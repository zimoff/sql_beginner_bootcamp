(select pz.name as pizzeria_name from person_visits pv 
join person p on p.id = pv.person_id 
join pizzeria pz on pz.id = pv.pizzeria_id
where p.name = 'Andrey')
except
(select pz.name as pizzeria_name from person_order po 
join person p on p.id = po.person_id 
join menu m on m.id = po.menu_id
join pizzeria pz on m.pizzeria_id = pz.id
where p.name = 'Andrey')
;
