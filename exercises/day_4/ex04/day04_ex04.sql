(select * from person_visits 
where visit_date < '2022-01-02'
except all
select * from person_visits 
where visit_date < '2022-01-06')
union
(select * from person_visits 
where visit_date < '2022-01-06'
except all
select * from person_visits 
where visit_date < '2022-01-02');
