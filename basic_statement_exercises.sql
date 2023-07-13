SHOW DATABASES;
USE albums_db;
SHOW TABLES;
DESCRIBE albums;
-- What is the primary key for the albums table?
--          The id column

SELECT * FROM albums;
-- What does the column named 'name' represent?
--         Name of the Album
-- What do you think the sales column represents?
--         Total Album Sales

-- Find the name of all albums by Pink Floyd
SELECT name FROM albums WHERE artist = 'Pink Floyd';
-- dark side of the moon, the wall

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- 1967

-- What is the genre for the album Nevermind?
SELECT genre FROM albums WHERE name = "Nevermind";
--     Grunge, Alt Rock

-- Which albums were released in the 1990s?
SELECT * FROM albums WHERE release_date >= 1990 AND release_date <= 1999;
-- 11 rows returned

-- Which albums had less than 20M certified sales? Rename this column as low_selling_albums
SELECT name as low_selling_albums, sales FROM albums WHERE sales < 20;
-- 13 rows returned