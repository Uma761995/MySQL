USE NetflixDB;
-- 1. List all users subscribed to the Premium plan:
SELECT user_name,email
FROM users
WHERE plan='premium';

-- 2. Retrieve all movies in the Drama genre with a rating higher than 8.5:
SELECT title,genre,rating
FROM movies
WHERE genre='Drama' AND rating>8.5;

-- 3.Find the average rating of all movies released after 2015:
SELECT AVG(rating) as avg_rating 
FROM movies
WHERE release_year>2015;

-- 4. List the names of users who have watched the movie Stranger Things along with their completion percentage:
SELECT users.user_name,watchHistory.completion_percentage
FROM users
JOIN watchHistory ON users.user_id=watchHistory.user_id
JOIN movies ON watchHistory.movie_id=movies.movie_id
WHERE movies.title='Stranger Things';

-- 5.Find the name of the user(s) who rated a movie the highest among all reviews:
SELECT users.user_name
FROM users
JOIN reviews ON users.user_id=reviews.user_id
WHERE reviews.rating=(SELECT MAX(rating) FROM reviews);

-- 6. Calculate the number of movies watched by each user and sort by the highest count:
SELECT users.user_name, COUNT(watchHistory.watch_id) AS movies_watched 
FROM users 
JOIN watchHistory ON users.user_id = watchHistory.user_id 
GROUP BY users.user_id 
ORDER BY movies_watched DESC;

-- 7.List all movies watched by John Doe, including their genre, rating, and his completion percentage:
SELECT movies.title, movies.genre, movies.rating, watchHistory.completion_percentage 
FROM movies
JOIN watchHistory ON movies.movie_id = watchHistory.movie_id
JOIN Users ON watchHistory.user_id = users.user_id
WHERE users.user_name = 'John Doe';

-- 8.Update the movie's rating for Stranger Things:
SET SQL_SAFE_UPDATES=0;

UPDATE movies 
SET rating = 8.9 
WHERE title = 'Stranger Things';

-- 9.Remove all reviews for movies with a rating below 4.0:
DELETE FROM reviews 
WHERE movie_id IN (SELECT movie_id FROM movies WHERE rating < 4.0);

-- 10. Fetch all users who have reviewed a movie but have not watched it completely (completion percentage < 100):
SELECT U.user_name, M.title, R.review_text 
FROM users U
JOIN reviews R ON U.user_id = R.user_id
JOIN movies M ON R.movie_id = M.movie_id
LEFT JOIN watchHistory W ON U.user_id = W.user_id AND M.movie_id = W.movie_id
WHERE (W.completion_percentage IS NULL OR W.completion_percentage < 100);

-- 11.List all movies along with the total number of reviews and average rating for each movie, including only movies with at least two reviews:
SELECT M.title, COUNT(R.review_id) AS total_reviews, AVG(R.rating) AS average_rating 
FROM movies M
JOIN reviews R ON M.movie_id = R.movie_id
GROUP BY M.movie_id
HAVING COUNT(R.review_id) >= 2;







