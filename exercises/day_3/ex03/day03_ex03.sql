with vis_count as 
(select pz.name as pizza_name, p.gender , count(*) as visit_count from person_visits pv
join person p on p.id = pv.person_id
join pizzeria pz on pv.pizzeria_id  = pz.id
group by pz.name, p.gender)

select distinct on (v1.pizza_name) v1.pizza_name as pizzeria_name from vis_count v1
join vis_count v2 on v1.pizza_name = v2.pizza_name
where v1.gender != v2.gender
and v1.visit_count != v2.visit_count
order by 1
;
