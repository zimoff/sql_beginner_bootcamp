with list_pizza as 
(select m.*, pz.id as pz_id, pz.name from menu m
join pizzeria pz on pz.id = m.pizzeria_id)

select 
    l1.pizza_name,  
    l1.name as pizzeria_name_1, 
    l2.name as pizzeria_name_2, 
    l1.price 
from list_pizza l1 cross join list_pizza l2

where 
    l1.pizza_name = l2.pizza_name  and 
    l1.price = l2.price and 
    l1.name != l2.name and 
    l1.pz_id > l2.pz_id
order by pizza_name
;
