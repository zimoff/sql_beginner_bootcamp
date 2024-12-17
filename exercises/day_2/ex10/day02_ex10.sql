-- with 
    -- name_list as 
    -- (select l1.id as id_1, 
    -- l1.name as name_1, 
    -- l2.id as id_2, 
    -- l2.name as name_2, 
    -- l1.address, 
    -- l2.address as address_2 
    -- from person l1 cross join person l2 
    -- where l1.id != l2.id and l1.address = l2.address),

    -- name_list_2 as 
    -- (select distinct on (id_both) id_2, name_2, id_1, name_1,
    -- case when id_1 < id_2 then concat(id_1, id_2) else concat(id_2, id_1) end as id_both,
    -- address_2
    -- from name_list 
    -- order by id_both, name_2, name_1)

-- select name_2 as person_name_1, name_1 as person_name_2, address_2 as common_addres from name_list_2
-- ;

select p1.name as person_name_1, p2.name as person_name_2, p1.address as common_addres from person p1 join person p2 on p1.address = p2.address
where p1.id > p2.id
;
