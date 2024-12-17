explain analyze select m.pizza_name, pz.name as pizzeria_name from menu m
join pizzeria pz on m.pizzeria_id = pz.id
order by 1,2;

set enable_seqscan = false;

explain analyze select m.pizza_name, pz.name as pizzeria_name from menu m
join pizzeria pz on m.pizzeria_id = pz.id
order by 1,2;

set enable_seqscan = true;
