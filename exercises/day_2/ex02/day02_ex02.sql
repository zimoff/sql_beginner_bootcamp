with pv as
(select visit_date, pizzeria_id, person_id from person_visits where visit_date between '2022-01-01' and '2022-01-03')

select coalesce(ps.name, '-') as person_name, pv.visit_date, coalesce(pz.name, '-') as pizzeria_name  
from pv 
full outer join pizzeria pz on pv.pizzeria_id = pz.id 
full outer join person ps on pv.person_id = ps.id
order by ps.name nulls first, pv.visit_date, pz.name;
