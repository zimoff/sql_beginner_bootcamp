select object_name from 
(select  pizza_name as object_name, 'pizza' as category from menu
union all
select name as object_name, 'people' as category from person) as subquery
order by category, object_name;
