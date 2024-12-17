select date(date_day) as missing_date from 
generate_series('2022-01-01'::timestamp, '2022-01-10','1 day')  day(date_day) 
left join (select visit_date from person_visits pv 
where pv.person_id in (1,2)) as p_date on date_day = p_date.visit_date
where p_date.visit_date is null; 


-- with people_visit as
-- (select distinct visit_date from person_visits where person_id = 1 or person_id = 2)

-- select date(day) as missing_date from generate_series('2022-01-01'::timestamp, '2022-01-10','1 day') day 
-- left join people_visit pv on day = pv.visit_date
-- where pv.visit_date is null;
