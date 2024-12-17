select visit_date as date, person_id as id  from person_visits 
union 
select order_date as date, person_id as id from person_order
order by date asc, id desc;
