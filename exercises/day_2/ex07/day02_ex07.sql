select pz.name as pizzeria_name from person_visits pv
join person p on p.id = pv.person_id
join pizzeria pz on pz.id = pv.pizzeria_id
join menu m on m.pizzeria_id = pv.pizzeria_id
where p.name = 'Dmitriy' and m.price < 800 and pv.visit_date = '2022-01-08';
