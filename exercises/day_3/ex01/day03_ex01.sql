select m.id as menu_id from menu m where m.id not in (select menu_id from person_order)
order by menu_id
;
