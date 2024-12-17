create sequence seq_person_discount start 1;
select setval('seq_person_discount', (select count(*) + 1 from person_discounts));
alter table person_discounts alter id set default nextval('seq_person_discount');


