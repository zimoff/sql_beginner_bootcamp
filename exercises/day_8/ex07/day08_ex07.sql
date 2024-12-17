--session #1
begin ;
update pizzeria set rating = 2.7 where id = 1; --set #1
update pizzeria set rating = 4.7 where id = 2; --set #3 
--command line fall in 'sleep' state
commit ;




--session #2
begin ;
update pizzeria set rating = 3.3 where id = 2; --set #1
update pizzeria set rating = 4.4 where id = 1; --set #4
-- deadlock detected
commit ; -- rollback after trying to commit changes with deadlock

