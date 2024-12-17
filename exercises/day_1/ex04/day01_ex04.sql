select person_id, order_date as date from person_order where order_date = '2022-01-07'
except all
select person_id, visit_date as date from person_visits where visit_date = '2022-01-07';
