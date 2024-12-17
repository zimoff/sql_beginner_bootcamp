create unique index idx_menu_unique on menu (pizzeria_id, pizza_name);
set enable_seqscan to off;
explain analyze select * from menu where pizzeria_id = 3;
set enable_seqscan to on;
