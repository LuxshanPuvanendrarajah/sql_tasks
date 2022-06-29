Use movielens;
-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
SELECT * FROM movies
WHERE release_date BETWEEN '1983-01-01' AND '1993-12-31'
ORDER BY release_date DESC;
-- Without using LIMIT, list the titles of the movies with the lowest average rating.
SELECT m.title,AVG(r.rating)
FROM movies m
JOIN ratings r ON m.id=r.movie_id 
Group by m.title
ORDER BY AVG(r.rating) ASC;
-- List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.


-- List the unique titles of each of the movies released on the most popular release day.

-- Find the total number of movies in each genre; list the results in ascending numeric order.