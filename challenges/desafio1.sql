-- Descomente e altere as linhas abaixo:

-- DROP DATABASE IF EXISTS SpotifyClone;
-- CREATE DATABASE IF NOT EXISTS SpotifyClone;
-- CREATE TABLE SpotifyClone.tabela1(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;
-- CREATE TABLE SpotifyClone.tabela2(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;
-- INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados A'),
--   ('exemplo de dados 2', 'exemplo de dados B'),
--   ('exemplo de dados 3', 'exemplo de dados C');
-- INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados X'),
DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;



CREATE TABLE SpotifyClone.plan (
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_type VARCHAR(20) NOT NULL,
  plan_value DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artist (
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.album (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(200) NOT NULL,
  release_year YEAR NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.song (
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(200) NOT NULL,
  song_duration INT NOT NULL,
  album_id INT NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album(album_id),
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.user (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(100) NOT NULL,
  user_age INT NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES plan(plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.follow (
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history (
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  played_at DATETIME NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (song_id) REFERENCES song(song_id)
) engine = InnoDB;



INSERT INTO SpotifyClone.plan (plan_type, plan_value) VALUES
	('gratuito', 0),
	('universitario', 5.99),
	('pessoal', 6.99),
	('familiar', 7.99);

INSERT INTO SpotifyClone.artist (artist_name) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');
   

INSERT INTO SpotifyClone.album (album_id, album_name, release_year, artist_id) VALUES
	('1', 'Renaissance', '2022','1'),
	('2', 'Jazz', '1978','2'),
	('3', 'Hot Space', '1982','2'),
	('4', 'Falso Brilhante', '1998','3'),
	('5', 'Vento de Maio', '2001','3'),
	('6', 'QVVJFA?', '2003', '4'),
	('7', 'Somewhere Far Beyond', '2007', '5'),
	('8', 'I Put A Spell On You', '2012', '6');
    
INSERT INTO SpotifyClone.song (song_name, song_duration, album_id, artist_id) VALUES
	('"BREAK MY SOUL"', '279', '1', '1'),
	('"VIRGO\'S GROOVE"', '369', '1', '1'),
	('"ALIEN SUPERSTAR"', '116', '1', '1'),
	('"Don\'t Stop Me Now"', '203', '2', '2'),
	('"Under Pressure"', '152', '3', '2'),
	('"Como Nossos Pais"', '105', '4', '3'),
	('"O Medo de Amar é o Medo de Ser Livre"', '207', '5', '3'),
	('"Samba em Paris"', '267', '6','4'),
	('"The Bard\'s Song"', '244', '7','5'),
	('"Feeling Good"', '100', '8','6');
    
  INSERT INTO SpotifyClone.user (user_id, user_name, user_age, plan_id) VALUES
	('1', 'Barbara Liskov', '82', '1'),
	('2', 'Robert Cecil Martin', '58', '1'),
	('3', 'Ada Lovelace', '37','4'),
	('4', 'Martin Fowler', '46', '4'),
	('5', 'Sandi Metz', '58', '4'),
	('6', 'Paulo Freire', '19', '2'),
	('7', 'Bell Hooks', '26', '2'),
	('8', 'Christopher Alexander', '85', '3'),
	('9', 'Judith Butler', '45', '3'),
	('10', 'Jorge Amado', '58', '3');
    
    INSERT INTO SpotifyClone.follow (user_id, artist_id) VALUES
	('1', '1'),
	('1', '2'),
	('1', '3'),
	('2', '1'),
	('2', '3'),
	('3', '2'),
	('4', '4'),
	('5', '5'),
	('5', '6'),
	('6', '1'),
	('6', '6'),
	('7', '6'),
	('9', '3'),
	('10', '2');
    
INSERT INTO SpotifyClone.history (user_id, song_id, played_at) VALUES
	('1', '8', '2022-02-28 10:45:55'),
	('1', '2', '2020-05-02 05:30:35'),
	('1', '10', '2020-03-06 11:22:33'),
	('2', '10', '2022-08-05 08:05:17'),
	('2', '7', '2020-01-02 07:40:33'),
	('3', '10', '2020-11-13 16:55:13'),
	('3', '2', '2020-12-05 18:38:30'),
	('4', '8', '2021-08-15 17:10:10'),
	('5', '8', '2022-01-09 01:44:33'),
	('5', '5', '2020-08-06 15:23:43'),
	('6', '7', '2017-01-24 00:31:17 '),
	('6', '1', '2017-10-12 12:35:20'),
	('7', '4', '2011-12-15 22:30:49'),
	('8', '4', '2012-03-17 14:56:41'),
	('9', '9', '2022-02-24 21:14:22'),
	('10', '3', '2015-12-13 08:30:22');
