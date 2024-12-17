with discounts as
(select po.person_id, m.pizzeria_id,
case 
    when count(*) = 1 then 10.5
    when count(*) = 2 then 22
    else 30
    end as discount 
from person_order po 
inner join menu m on po.menu_id = m.id
group by po.person_id, m.pizzeria_id
order by po.person_id, m.pizzeria_id)

insert into person_discounts (id, person_id, pizzeria_id, discount)
select row_number() over() as id,
di.*
from discounts di
;
