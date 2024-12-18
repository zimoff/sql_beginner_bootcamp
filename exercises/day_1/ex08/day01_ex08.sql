select order_date, concat(p.name, '(age:', p.age, ')') as person_information from person_order
natural full join 
(select id as person_id, name, age from person) as p
order by order_date asc, person_information asc;
