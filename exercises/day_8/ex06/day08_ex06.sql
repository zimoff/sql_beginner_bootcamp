--session #1
begin isolation level repeatable read;
select sum(rating) from pizzeria ; -- table before change rating in session #2
select sum(rating) from pizzeria ; -- table after change rating in session #2
commit;

select sum(rating) from pizzeria ; --final check table after commits

--session #2
begin isolation level repeatable read;
update pizzeria set rating = 5 where id = 1; --set new value of rating in session #2
commit;
 
select sum(rating) from pizzeria ; --final check table after commits

