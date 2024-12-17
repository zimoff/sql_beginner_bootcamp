create function func_minimum(variadic arr numeric[]) returns numeric as 
    $$
    begin
        return 
        (select min($1[i]) from generate_subscripts($1, 1) g(i));
    end;
    $$ 
    language plpgsql;

select func_minimum(variadic arr => array[10.0, -1.0, 5.0, 4.4]);
