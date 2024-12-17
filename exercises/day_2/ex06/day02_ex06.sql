select m.pizza_name, pz.name as pizzeria_name from person_order po 
inner join person p on p.id = po.person_id
inner join menu m on po.menu_id = m.id
inner join pizzeria pz on m.pizzeria_id = pz.id
where p.name in ('Denis', 'Anna')
order by pizza_name, pizzeria_name;
