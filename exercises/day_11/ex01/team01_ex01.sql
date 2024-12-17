-- INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
-- INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

with c_name as (select distinct id, name from currency)

select 
    coalesce(u.name, 'not defined') as name,
    coalesce(u.lastname, 'not defined') as lastname,
    c_name.name as currency_name,
    coalesce(
        (select rate_to_usd from currency cur_min --t1
        where cur_min.name = c_name.name
         and cur_min.updated < b.updated
        order by cur_min.updated desc
        limit 1),

        (select rate_to_usd from currency cur_max --t2
        where cur_max.name = c_name.name
         and cur_max.updated > b.updated
        order by cur_max.updated
        limit 1)) 
        * b.money as currency_in_usd

from "user" u
full join balance b on u.id = b.user_id
join c_name on b.currency_id = c_name.id 
order by name desc,
         lastname,
         currency_name;

