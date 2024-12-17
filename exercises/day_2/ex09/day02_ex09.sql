with pizza_list as
(select p.name, 
case when m.pizza_name = 'pepperoni pizza' then 1 else 0 end as pepperoni,
case when m.pizza_name = 'cheese pizza' then 1 else 0 end as cheese
from person_order po
inner join person p on po.person_id = p.id
inner join menu m on m.id = po.menu_id
where gender = 'female' and m.pizza_name in ('pepperoni pizza', 'cheese pizza'))

select pc.name 
from (select pl.name,  count(cheese + pepperoni) as pizza_count from pizza_list pl group by name) as pc 
where pc.pizza_count = 2
order by name; 


