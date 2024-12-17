insert into menu (id, pizzeria_id, pizza_name, price)
select 
    max(id) + 1, 
    (select id from pizzeria where name = 'Dominos'),
    'Sicilian pizza',
    900 
from menu ;

