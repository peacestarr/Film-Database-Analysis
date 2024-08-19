1. Total number of movies in the database.

SELECT COUNT(*) AS total_movies
FROM films

2. Average rating for each movie.

SELECT f.title, AVG(r.num_votes) AS average_rating
FROM films f
JOIN reviews r ON f.id = r.id
GROUP BY f.title

	
3. List of actors who have appeared in the most movies. 

SELECT r.person_id, COUNT(r.film_id) AS movie_count
FROM roles r
WHERE r.role = 'actor'
GROUP BY r.person_id
ORDER BY movie_count DESC
LIMIT 10

	
4. Identify the highest-grossing movies. **************

SELECT title, gross
FROM films
ORDER BY gross DESC
LIMIT 10



	

5. Update Film records to correct any errors or update information.
--a. 
UPDATE films
SET certification = 'Not Rated'
WHERE certification = 'null'

-- b.
UPDATE films
SET language = 'English'
WHERE country = 'USA'


6. Insert new records for new movies or actors.
INSERT INTO films (id, title, release_year, country, duration, language, certification)
VALUES ('4969', 'Longlegs', '2024', 'USA', '101', 'English', 'R')

	
7. Delete records for movies that are no longer relevant.
DELETE FROM Films
WHERE id = 4969


8. Update the information of actors, such as their bio, birthdate, or nationality, based on new data or corrections.
ALTER TABLE roles ADD COLUMN name character varying
---------------------------------------------
UPDATE  
    roles
SET 
  name = '50 Cent'
WHERE id = 1
-----------------------------------------------
select name from roles
where id = 1


9. Insert records for new movies that have been released.

INSERT INTO films (id, title, release_year, country, duration, language, certification)
VALUES ('4969', 'Longlegs', '2024', 'USA', '101', 'English', 'R')

	
10. Insert new reviews for movies, including the review text, rating, and the reviewer information if available.

INSERT INTO reviews (id, num_user, num_critic, num_votes, facebook_likes)
VALUES (4969, 565, 174, 526, 77)


11. Delete records for movies that are no longer relevant or have been discontinued.

DELETE FROM films
WHERE release_year = (1929)

	
12. Analyze Film genres to identify trends or patterns. 
SELECT 
    f.title, 
    COUNT(r.film_id) AS number_of_films, 
    AVG(f.release_year) AS avg_release_year, 
    AVG(r.num_votes) AS avg_rating
FROM 
    films f
JOIN 
    reviews r ON f.id = r.id
GROUP BY 
    f.title
ORDER BY 
    number_of_films DESC


13. Identify popular actors or directors based on the number of movies and ratings.
-- a. Popular actors
SELECT 
    p.name, roles.role,
    COUNT(reviews.film_id) AS number_of_films, 
    AVG(reviews.num_votes) AS avg_rating
FROM 
    reviews 
JOIN 
    roles ON reviews.film_id = roles.film_id
JOIN 
    people p ON roles.id = p.id
WHERE role = 'actor'
GROUP BY p.name, roles.role
ORDER BY 
    number_of_films DESC, avg_rating DESC
LIMIT 10

-- b. Popular directors
SELECT 
    p.name, roles.role,
    COUNT(reviews.film_id) AS number_of_films, 
    AVG(reviews.num_votes) AS avg_rating
FROM 
    reviews 
JOIN 
    roles ON reviews.film_id = roles.film_id
JOIN 
    people p ON roles.id = p.id
WHERE role = 'director'
GROUP BY p.name, roles.role
ORDER BY 
    number_of_films DESC, avg_rating DESC
LIMIT 10


14. Generate insights and recommendations for Film production companies based on the analysis
SELECT 
    p.name, 
    COUNT(f.id) AS number_of_films, 
    AVG(f.rating) AS avg_rating 
FROM 
    films f
JOIN 
    people p ON f.id = p.id
GROUP BY 
    p._name
ORDER BY 
    avg_rating DESC, number_of_films DESC


	
15. Analyze the popularity of different Film genres by counting the number of movies in each genre.
SELECT 
    g.genre_name, 
    COUNT(f.film_id) AS number_of_films
FROM 
    films f
JOIN 
    film_genres fg ON f.film_id = fg.film_id
JOIN 
    genres g ON fg.genre_id = g.genre_id
GROUP BY 
    g.genre_name
ORDER BY 
    number_of_films DESC


select * from films
	
16. Calculate the average rating of movies directed by each director to determine their success rate.
SELECT 
    p.name, roles.role, 
    AVG(reviews.num_votes) AS avg_rating
FROM 
    reviews 
JOIN 
    roles ON reviews.film_id = roles.film_id
JOIN 
    people p ON roles.id = p.id
WHERE role = 'director'
GROUP BY p.name, roles.role
ORDER BY 
     avg_rating DESC
	
	
17. Analyze the impact of reviews on Film ratings by comparing average ratings of movies with and without reviews.

	--a. Average rating of movies with reviews
SELECT 
    film_id, 'With Reviews' AS review_status, 
    AVG(num_votes) AS avg_rating
FROM 
    reviews 
GROUP BY 
    film_id,
	review_status


	
-- b. Average rating of movies without reviews
SELECT 
    'Without Reviews' AS review_status, 
    AVG(num_votes) AS avg_rating
FROM 
    reviews 
WHERE 
    num_votes IS NULL
GROUP BY 
    review_status
