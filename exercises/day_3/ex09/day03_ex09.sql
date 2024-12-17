insert into person_visits (id, person_id, pizzeria_id, visit_date) 
select count(*) + 1, 
    (select id from person where name = 'Denis'),
    (select id from pizzeria where name = 'Dominos'),
    '2020-02-24' from person_visits;     

insert into person_visits (id, person_id, pizzeria_id, visit_date) 
select count(*) + 1, 
    (select id from person where name = 'Irina'),
    (select id from pizzeria where name = 'Dominos'),
    '2020-02-24' from person_visits;     
