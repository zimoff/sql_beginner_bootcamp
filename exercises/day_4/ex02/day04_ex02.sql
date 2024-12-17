create view v_generated_dates as
select date(generate_series('2022-01-01', '2022-01-31', interval '1 day')) as generated_date
order by generated_date;
