with last_up as
(select *, row_number() over (partition by id order by updated desc) as tmp_cur from currency)

SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    b.type,
    sum(b.money) AS volume,
    COALESCE(lup.name, 'not defined') AS currency_name,
    COALESCE(lup.rate_to_usd, 1) AS last_rate_to_usd,
    sum(b.money) * COALESCE(lup.rate_to_usd, 1)::float AS total_volume_in_usd
FROM balance b
LEFT JOIN "user" u ON u.id=b.user_id
LEFT JOIN last_up lup ON lup.tmp_cur = 1
AND lup.id=b.currency_id
GROUP BY b.user_id,
    u.name,
    u.lastname,
    b.type,
    lup.name,
    lup.rate_to_usd
ORDER BY name DESC,
    lastname,
    b.type;

