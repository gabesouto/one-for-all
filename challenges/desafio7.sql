SELECT a.artist_name AS artista, alb.album_name AS album, COUNT(s.artist_id) AS pessoas_seguidoras 
FROM SpotifyClone.artist AS a 
INNER JOIN SpotifyClone.album AS alb ON alb.artist_id = a.artist_id
LEFT JOIN SpotifyClone.follow AS s ON s.artist_id = a.artist_id
GROUP BY a.artist_id, alb.album_id
ORDER BY pessoas_seguidoras DESC, artista, album;
