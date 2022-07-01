Use movielens;
-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
SELECT * FROM movies
WHERE release_date BETWEEN '1983-01-01' AND '1993-12-31'
ORDER BY release_date DESC;
-- Without using LIMIT, list the titles of the movies with the lowest average rating.
SELECT m.title,AVG(r.rating)
FROM movies m
JOIN ratings r ON m.id=r.movie_id 
GROUP BY m.id
ORDER BY AVG(r.rating) ASC;
-- List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.
SELECT DISTINCT m.title , g.`name` ,r.rating, u.gender , u.age, o.`name` 
FROM movies m
JOIN genres_movies gm ON gm.movie_id = m.id
JOIN ratings r ON r.movie_id = m.id
JOIN genres g ON g.id = gm.genre_id
JOIN users u ON u.id = r.user_id
JOIN occupations o ON o.id = u.occupation_id 
WHERE g.`name` = "Sci-Fi" AND u.age = 24 AND u.gender = "M" AND o.`name` = "Student" AND r.rating = 5;
-- List the unique titles of each of the movies released on the most popular release day.
SELECT title FROM movies
 WHERE release_date = (
	SELECT release_date FROM movies
    GROUP BY release_date
    ORDER BY count(id) DESC
    LIMIT 1
    );
-- Find the total number of movies in each genre; list the results in ascending numeric order.
SELECT g.`name`, COUNT(m.id) 
FROM movies m
JOIN genres_movies gm ON gm.movie_id = m.id
JOIN genres g ON g.id = gm.genre_id
GROUP BY g.`name`
ORDER BY COUNT(m.id) ASC;