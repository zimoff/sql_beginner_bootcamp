--session #1
begin isolation level serializable;
table pizzeria; -- table before change rating in session #2
table pizzeria; -- table after change rating in session #2
commit;

table pizzeria; --final check table after commits

--session #2
begin isolation level serializable;
update pizzeria set rating = 3.0 where id = 1; --set new value of rating
commit;
table pizzeria; --final check table after commits
