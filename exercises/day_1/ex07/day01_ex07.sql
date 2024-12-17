select po.order_date, concat(p.name, '(age:', p.age, ')') as person_information from person_order po
inner join person p
on po.person_id = p.id
order by order_date asc, person_information asc;
