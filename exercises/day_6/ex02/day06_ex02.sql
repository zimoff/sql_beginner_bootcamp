with discounter as 
(select distinct on (person_id) * from person_discounts)

select 
    p.name, 
    m.pizza_name, 
    m.price , 
    round((m.price - (m.price/100 * pd.discount)), 1)::float as discount_price,
    pz.name as pizzeria_name 
    from person_order po
    join person p on p.id = po.person_id
    join menu m on m.id = po.menu_id
    join discounter pd on pd.person_id = p.id
    join pizzeria pz on pz.id = m.pizzeria_id
    order by 1,2
;
