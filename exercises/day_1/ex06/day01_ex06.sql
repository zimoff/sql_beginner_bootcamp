select subquery.action_date, person.name as person_name from 
(select visit_date as action_date, person_id as id  from person_visits 
union 
select order_date as action_date, person_id as id from person_order) as subquery
inner join person on subquery.id = person.id
order by action_date asc, person_name desc;
