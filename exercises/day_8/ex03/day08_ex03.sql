--session #1
begin isolation level read committed ;
select * from pizzeria ; --show table begin update in session #2
select * from pizzeria ; --show table after update in session #2
commit ;
select * from pizzeria ; --final check table after commits

--session #2
begin isolation level read committed ;
update pizzeria set rating = 3.6 where id = 1; --set new value of rating
commit;
select * from pizzeria ; --final check table after commits
