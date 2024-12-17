with max_ as 
    (select max(id) as max_id from person_order),
    gen_ser as 
    (select generate_series(1, 9, 1) + max_.max_id as id , generate_series(1, 9) as person_id from max_)

insert into person_order(id, person_id, menu_id, order_date) 
select 
    id,
    person_id,
    (select id from menu where pizza_name = 'Greek pizza'),
    '2022-02-25'
    from gen_ser;
