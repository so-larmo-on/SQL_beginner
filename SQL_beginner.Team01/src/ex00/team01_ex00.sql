SELECT DISTINCT
    t1.name,
    t1.lastname,
    t1.type,
    SUM(t1.money::numeric) AS volume,
    t1.currency_name,
    t1.last_rate_to_usd,
    (SUM(t1.money) * t1.last_rate_to_usd) AS total_volume_in_usd
FROM (
    SELECT DISTINCT
        COALESCE(u.name, 'not defined') AS name,
        COALESCE(u.lastname, 'not defined') AS lastname,
        b.type,
        b.money,
        COALESCE(c.name, 'not defined') AS currency_name,
        COALESCE(
            FIRST_VALUE(c.rate_to_usd) OVER (PARTITION BY c.id ORDER BY c.updated DESC), 
            1
        ) AS last_rate_to_usd
    FROM balance b
            FULL JOIN "user" u ON b.user_id = u.id
            FULL JOIN currency c ON b.currency_id = c.id
) AS t1

GROUP BY 
    t1.name, 
    t1.lastname, 
    t1.type, 
    t1.currency_name, 
    t1.last_rate_to_usd
ORDER BY 
    t1.name DESC, 
    t1.lastname, 
    t1.type;