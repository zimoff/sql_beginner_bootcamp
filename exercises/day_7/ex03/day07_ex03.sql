with visit_list as
    (select pz.name, count(*) as count from person_visits pv
    join pizzeria pz on pz.id = pv.pizzeria_id
    group by pz.name),
    order_list as 
    (select pz.name, count(*) as count from person_order po 
    join menu m on m.id = po.menu_id
    join pizzeria pz on m.pizzeria_id = pz.id
    group by pz.name)

select ol.name, (ol.count + vl.count) as total_count from order_list ol
full outer join visit_list vl on ol.name = vl.name
order by total_count desc, ol.name asc
;
