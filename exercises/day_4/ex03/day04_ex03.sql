select generated_date from v_generated_dates
where generated_date not in (select visit_date from person_visits);


