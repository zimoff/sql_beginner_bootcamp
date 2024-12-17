with order_list as
(select pz.name, p.gender, count(gender) from person_order po
join person p on po.person_id = p.id
join menu m on m.id = po.menu_id
join pizzeria pz on pz.id = m.pizzeria_id
group by p.gender, pz.name)

select ol1.name as pizzeria_name from order_list ol1 where gender like 'female'
except
select ol2.name as pizzeria_name from order_list ol2 where gender like 'male'
;
