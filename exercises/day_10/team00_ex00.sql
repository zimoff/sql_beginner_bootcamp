create table paths(
    point_1 text,
    point_2 text,
    cost int
);
insert into paths (point_1, point_2, cost)
values 
    ('A', 'B', 10),
    ('B', 'A', 10),

    ('A', 'C', 15),
    ('C', 'A', 15),
    
    ('B', 'C', 35),
    ('C', 'B', 35),

    ('A', 'D', 20),
    ('D', 'A', 20),

    ('B', 'D', 25),
    ('D', 'B', 25),

    ('D', 'C', 30),
    ('C', 'D', 30)
;

with recursive p1 as
(
    select 
        paths.*, 
        array['A', paths.point_2] as ar, 
        paths.cost as path_sum
        from paths where point_1 = 'A' 

    union 

    select 
        p.*, 
        ar || array[p.point_2],
        (path_sum + p.cost) as path_sum 
        from p1 
        join paths p on p.point_1 = p1.point_2
        where p.point_2 != all(p1.ar) 
),
p2 as
(
    select 
    (p1.path_sum + p.cost) as total_cost,
    array_append(p1.ar, p.point_2) as tour 
    from p1
    join paths p on p1.ar[array_length(p1.ar, 1)] = p.point_1
    where array_length(p1.ar,1) = 4 and p.point_2 = 'A' 
)

select * from p2 where total_cost = (select min(total_cost) from p2)
order by 1,2

;
