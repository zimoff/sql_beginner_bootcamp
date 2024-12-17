--session #1
begin; --start transaction
table pizzeria; --show table with no changes
update pizzeria 
day_8_1-*# set rating = 5 
day_8_1-*# where id = 1;

table pizzeria; --show table in transaction
commit; --commit and end transaction
table pizzeria; -- show table after transaction

--session #2
table pizzeria; --show table before commit
table pizzeria; --show table after commit

