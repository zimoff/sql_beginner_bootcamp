select pz.name, pz.rating from pizzeria pz left join person_visits pv on pz.id = pv.pizzeria_id where pv.person_id is null;
