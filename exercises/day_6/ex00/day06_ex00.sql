create table person_discounts(
    id int primary key,
    person_id int not null,
    pizzeria_id int not null,
    discount numeric not null,
    constraint fk_person_discounts_person_id foreign key  (person_id) references person(id),
    constraint fk_person_discounts_pizzeria_id foreign key  (pizzeria_id) references pizzeria(id)
);
