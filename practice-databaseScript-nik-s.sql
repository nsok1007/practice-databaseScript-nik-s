CREATE DATABASE kpop_database;
USE kpop_database;

SELECT DATABASE();

--

START TRANSACTION;

DROP TABLE IF EXISTS artists, albums, concerts;

CREATE TABLE artists (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL,
    stage_name VARCHAR(100) NULL, -- nullable: can be left blank
    age INT NOT NULL,
    artist_group VARCHAR(100) NULL DEFAULT 'N/A',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE albums (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    artist_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    tracklist_total INT NULL, -- nullable: can be left blank
    year_released YEAR NOT NULL,
    extendedplay BOOLEAN NULL, -- nullable: can be left blank
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE TABLE concerts (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    concert_id INT NOT NULL,
    concert_title VARCHAR(100) NOT NULL,
    venue VARCHAR(100) NOT NULL,
    year_performed YEAR NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (concert_id) REFERENCES artists(id)
);

INSERT INTO artists (artist_name, stage_name, age, artist_group) VALUES
('Jung Hoseok', 'J-Hope', 32, 'BTS'),
('Kim Seokjin', 'Jin', 33, 'BTS'),
('Lee Taemin', 'Taemin', 33, 'SHINee'),
('Liu Amber', 'Amber', 34, 'f (x)');

SELECT * FROM artists;

INSERT INTO albums (artist_id, title, tracklist_total, year_released, extendedplay) VALUES
(1,'Jack in the Box',10, 2022, false),
(2, 'Echo', 7, 2025, true),
(3, 'Phase 1: Soft Violence', 11, 2026, true),
(4, 'X', 6, 2020, true);

SELECT * FROM albums;

INSERT INTO concerts (concert_id, concert_title, venue, year_performed) VALUES
(1, 'Hope on the Stage Tour', 'Allstate Arena', 2025),
(2, 'RunSeokjin Ep. Tour', 'Amalie Arena', 2025),
(3, 'LiMiNaL', 'Jamsil Indoor Stadium', 2026),
(4, 'Tour X', 'Paradise Rock Club', 2020);

SELECT * FROM concerts;

COMMIT;