-- with people_visit as
-- (select distinct visit_date from person_visits where person_id = 1 or person_id = 2)

-- select date(day) as missing_date from generate_series('2022-01-01'::timestamp, '2022-01-10','1 day') day 
-- left join people_visit pv on day = pv.visit_date
-- where pv.visit_date is null;

with day_generator as
(select date(days) as missing_date from generate_series('2022-01-01'::timestamp, '2022-01-10','1 day') days)

select missing_date from day_generator dg 
left join 
(select distinct visit_date from person_visits where person_id = 1 or person_id = 2) pv 
on pv.visit_date = dg.missing_date
where pv.visit_date is null;

