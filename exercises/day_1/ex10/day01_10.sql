-- select po.person_id, p.name , po.menu_id, m.pizza_name, m.pizzeria_id, pz.name from person_order po 
select p.name,  m.pizza_name, pz.name from person_order po 
inner join menu m on po.menu_id = m.id
inner join person p on p.id = po.person_id
inner join pizzeria pz on m.pizzeria_id = pz.id
order by p.name, m.pizza_name, pz.name
;
