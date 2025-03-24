WITH stats AS (SELECT p.address,
                      ROUND(MAX(p.age) - (CAST(MIN(p.age) AS NUMERIC) / MAX(p.age)), 2) AS formula,
                      ROUND(AVG(p.age), 2)                                              AS average
               FROM person p
               GROUP BY p.address)
SELECT address,
       formula,
       average,
       CASE WHEN formula > average THEN 'true' ELSE 'false' END AS comparison
FROM stats
ORDER BY address;