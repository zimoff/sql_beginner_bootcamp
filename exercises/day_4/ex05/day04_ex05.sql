select p.name, m.pizza_name, m.price, trunc((m.price - m.price * 0.1), 0) as discount from person_order po
join person p on p.id = po.person_id
join menu m on m.id = po.menu_id
;

select 'discount need convert to int' as not_yet_ready;
