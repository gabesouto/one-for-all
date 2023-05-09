SELECT ROUND(MIN(plan_value), 2) AS faturamento_minimo,
       ROUND(MAX(plan_value), 2) AS faturamento_maximo,
       ROUND(AVG(plan_value), 2) AS faturamento_medio,
       ROUND(SUM(plan_value), 2) AS faturamento_total
FROM SpotifyClone.plan AS p
JOIN SpotifyClone.user ON user.plan_id = p.plan_id