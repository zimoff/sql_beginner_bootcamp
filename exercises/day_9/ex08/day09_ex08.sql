create function fnc_fibonacci(pstop integer default 10) returns table (num integer) as 
    $$
    declare
        a int = 0;
        b int = 1;
        temp int;
    begin
        while a < pstop loop
                num = a;
                return next;
                temp = a;
                a = b;
                b = temp + b;
            end loop;
    end;
    $$ language plpgsql;

select num from fnc_fibonacci(100);
select num from fnc_fibonacci();
