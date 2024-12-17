with formula_list as
(select 
    address, 
    round((max(age::numeric) - (min(age::numeric)/max(age::numeric))), 2) as formula,
    round(avg(age), 2) as average
from person
group by address
order by 1)

select fl.*,
    case
        when formula > average then 'true'
        else 'false'
    end
from formula_list fl
;
