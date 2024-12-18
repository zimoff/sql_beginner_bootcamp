alter table person_discounts
add constraint ch_nn_person_id check (person_id is not null),
add constraint ch_nn_pizzeria_id check (person_id is not null),
add constraint ch_nn_discount check (person_id is not null),
add constraint ch_range_discount check (discount between 0 and 100);

alter table person_discounts alter column discount set default 0;

