USE SpotifyClone;

SELECT 
	u.user_name AS pessoa_usuaria,
	COUNT(h.song_id) AS musicas_ouvidas,
	ROUND(SUM(c.song_duration )/60, 2) AS total_minutos 
    FROM user as u
    INNER JOIN history as h
    ON u.user_id = h.user_id
	INNER JOIN  song AS c ON h.song_id = c.song_id
    GROUP BY u.user_name 
    ORDER BY u.user_name; 