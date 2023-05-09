SELECT REPLACE(s.song_name, '"', '') AS cancao, COUNT(*) AS reproducoes
FROM SpotifyClone.history AS h
INNER JOIN SpotifyClone.song AS s ON h.song_id = s.song_id
GROUP BY s.song_name
ORDER BY reproducoes DESC,  cancao ASC
LIMIT 2;
