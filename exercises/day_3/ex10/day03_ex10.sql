insert into person_order(id, person_id, menu_id, order_date) 
select count(*) + 1, 
    (select id from person where name = 'Denis'),
    (select id from menu where pizza_name = 'Sicilian pizza'),
    '2020-02-24' from person_order;     

insert into person_order(id, person_id, menu_id, order_date) 
select count(*) + 1, 
    (select id from person where name = 'Irina'),
    (select id from menu where pizza_name = 'Sicilian pizza'),
    '2020-02-24' from person_order;     

