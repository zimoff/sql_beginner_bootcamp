--session #1
show transaction_isolation ;
begin;
select * from --table before changes
select * from pizzeria ;
update pizzeria set rating = 4 where id = 1;
commit;
table pizzeria ; --table after commit

--session #2
show transaction_isolation ;
begin;
select * from --table before changes
select * from pizzeria ;
update pizzeria set rating = 3.6 where id = 1;
--command line fall in 'sleep' state, and answer 'UPDATE 1' after session2 commit changes
commit;
table pizzeria ; --table after commit
