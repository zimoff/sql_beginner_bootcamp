select p.name from person_order po
inner join person p on po.person_id = p.id
inner join menu m on po.menu_id = m.id
where p.gender = 'male' and address in ('Moscow', 'Samara') and m.pizza_name in ('pepperoni pizza', 'mushroom pizza')
order by name desc;
