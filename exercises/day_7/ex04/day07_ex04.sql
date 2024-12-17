select p.name, count(*) as count_of_visits from person_visits pv
join person p on p.id = pv.person_id
group by p.name
having count(*) > 3
;
