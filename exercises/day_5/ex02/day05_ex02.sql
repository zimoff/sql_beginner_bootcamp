set enable_seqscan = false;

create index idx_person_name on person (upper(name));
explain analyze select * from person where upper(name) like 'KATE';

set enable_seqscan = true;
