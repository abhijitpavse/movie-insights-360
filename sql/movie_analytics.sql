-- 24 08 2026

-- Create a database named movie_analytics.
CREATE DATABASE movie_analytics;
USE movie_analytics;

DESCRIBE movies;
TRUNCATE TABLE movies;
-- Create an appropriate table for the cleaned movie data.

CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(255),
    release_year INT,
    genre TEXT,
    rating DECIMAL(3,1),
    one_line TEXT,
    stars TEXT,
    votes BIGINT,
    runtime INT,
    gross VARCHAR(100)
);

LOAD DATA LOCAL INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_movies_mysql.csv'
INTO TABLE movies
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    movie_name,
    @original_year,
    genre,
    rating,
    one_line,
    stars,
    @votes,
    @runtime,
    gross,
    @release_year
)
SET
    release_year = CAST(NULLIF(@release_year, '') AS UNSIGNED),
    votes = CAST(NULLIF(@votes, '') AS UNSIGNED),
    runtime = CAST(NULLIF(@runtime, '') AS UNSIGNED);
    
    SELECT COUNT(*) AS total_movies
FROM movies;



-- Verify the imported row count against the cleaned Python dataset.
SELECT COUNT(*) AS total_records
FROM movies;

-- Write a query to display the top-rated movies using the available rating field.
SELECT
    movie_name,
    rating
FROM movies
WHERE rating IS NOT NULL
ORDER BY rating DESC
LIMIT 10;

-- Write a query to find movies above a selected rating threshold.
SELECT
    movie_name,
    rating,
    votes
FROM movies
WHERE rating >= 8
ORDER BY rating DESC;

-- Write a query to calculate average rating by genre/category where possible.
SELECT
    genre,
    COUNT(*) AS title_count,
    AVG(rating) AS average_rating
FROM movies
WHERE genre IS NOT NULL
  AND rating IS NOT NULL
GROUP BY genre
ORDER BY average_rating DESC;

-- Write a query to count movies by year or release period where possible.
SELECT
    release_year,
    COUNT(*) AS title_count
FROM movies
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY release_year;

SELECT
    release_year,
    COUNT(*) AS title_count
FROM movies
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY title_count DESC
LIMIT 1;

-- Write a query to identify the most represented genres/categories.
SELECT
    genre,
    COUNT(*) AS title_count
FROM movies
GROUP BY genre
ORDER BY title_count DESC;

-- Write a query to identify records with missing values in important analytical fields.
SELECT *
FROM movies
WHERE rating IS NULL;

SELECT *
FROM movies
WHERE rating IS NULL;

SELECT
    COUNT(*) AS missing_votes
FROM movies
WHERE votes IS NULL;

SELECT
    COUNT(*) AS missing_runtime
FROM movies
WHERE runtime IS NULL;

SELECT
    COUNT(*) AS missing_release_year
FROM movies
WHERE release_year IS NULL;

SELECT
    COUNT(*) AS missing_genre
FROM movies
WHERE genre IS NULL;

SELECT
    COUNT(*) AS total_records,

    SUM(
        CASE
            WHEN rating IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_rating,

    SUM(
        CASE
            WHEN votes IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_votes,

    SUM(
        CASE
            WHEN runtime IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_runtime,

    SUM(
        CASE
            WHEN release_year IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_year,

    SUM(
        CASE
            WHEN genre IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_genre
FROM movies;


-- Write a query that returns a management-ready summary containing movie title, rating and one additional relevant metric.
SELECT
    movie_name,
    rating,
    votes
FROM movies
WHERE rating IS NOT NULL
  AND votes IS NOT NULL
ORDER BY votes DESC
LIMIT 20;

-- Create at least one derived field using SQL, such as Rating_Category (for example: Excellent, Good, Average, Low) using CASE.
SELECT
    movie_name,
    rating,

    CASE
        WHEN rating >= 8 THEN 'Excellent'
        WHEN rating >= 7 THEN 'Good'
        WHEN rating >= 5 THEN 'Average'
        WHEN rating < 5 THEN 'Low'
        ELSE 'Not Rated'
    END AS Rating_Category
FROM movies;