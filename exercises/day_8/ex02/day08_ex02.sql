--session #1
begin isolation level repeatable read ; --setting isolation level
table pizzeria ;
update pizzeria set rating = 4 where id = 1;
commit;
table pizzeria ;

--session #2
begin isolation level repeatable read ; --setting isolation level
table pizzeria ;
update pizzeria set rating = 4 where id = 1;
--transaction failed by exception 'parallel changing'
rollback; --to end fail transaction
table pizzeria ;
