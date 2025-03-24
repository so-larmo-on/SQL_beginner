-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); -- ex01
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29'); -- ex01

SELECT  
    t1.name,
    t1.lastname,
    t1.currency_name,
    t1.money * t1.rate_to_usd AS currency_in_usd
FROM (
    SELECT
        COALESCE("user".name, 'not defined') AS name,
        COALESCE("user".lastname, 'not defined') AS lastname,
        currency.name AS currency_name,
        balance.money,
        COALESCE(
            (SELECT rate_to_usd
             FROM currency c1
             WHERE balance.currency_id = c1.id AND balance.updated > c1.updated
             ORDER BY c1.updated DESC
             LIMIT 1), -- target
          
            (SELECT rate_to_usd
             FROM currency c2
             WHERE balance.currency_id = c2.id AND balance.updated < c2.updated
             ORDER BY c2.updated ASC
             LIMIT 1) -- nil
        ) AS rate_to_usd
    FROM balance 
            JOIN (
                SELECT currency.id, currency.name 
                FROM currency 
                GROUP BY currency.id, currency.name
            ) currency ON currency.id = balance.currency_id

            LEFT JOIN "user" ON balance.user_id = "user".id 
) t1

ORDER BY 
    t1.name DESC, 
    t1.lastname, 
    t1.currency_name;