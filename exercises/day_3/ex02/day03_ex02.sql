select m.pizza_name, m.price, pz.name as pizzeria_name from menu m
join pizzeria pz on pz.id = m.pizzeria_id
where m.id not in (select menu_id from person_order)
order by 1,2
;
