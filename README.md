# Film Store Analysis


## Table of Contents
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Data Cleaning/Preparation](#data-cleaningpreparation)
- [Descriptive Data Analysis](#descriptive-data-analysis)
- [Data Analysis](#data-analysis)
- [Results/Findings](#resultsfindings)
- [Recommendations](#recommendations)
- [Limitations](#limitations)


### Project Overview

This project analyzes a fictional film database to gain insights into the various facets of the film industry, from analyzing film ratings and genres to tracking actors' performances and box office success.

### Data Sources

Film Store Data: The primary database used for this analysis is the "film_schema.sql" and "film.sql" database files, containing detailed information about the film store.


### Tools

- PostgresSQL Sever - Database creation, Table creation, Inserting datasets, and Data analysis.


### Data Cleaning/Preparation

In the intial data preparation phase we perfromed the following tasks
1. Data loading and inspection
2. Review the database schema and identify the primary keys, foreign keys, and relationships between tables.
3. Understand the purpose of each table and its role in the database


### Descriptive Data Analysis

This involved exploring the film database to retrive the following information:
- Total number of movies in the database.
- Average rating for each movie.
- List of actors who have appeared in the most movies.
- Highest-grossing movies.
- Update Film records to correct any errors or update information.
- Insert new records for new movies or actors.
- Delete records for movies that are no longer relevant.
- Update the information of actors, such as their bio, birthdate, or nationality, based on new data or corrections.
- Insert records for new movies that have been released. 
- Insert new reviews for movies, including the review text, rating, and the reviewer's information if available.
- Delete records for movies that are no longer relevant or have been discontinued.
- Analyze Film genres to identify trends or patterns.
- Popular actors or directors based on the number of movies and ratings.
- Popularity of different Film genres, counting the number of movies in each genre.
- Average rating of movies directed by each director to determine their success rate.
- Impact of reviews on Film ratings, comparing average ratings of movies with and without reviews.


### Data Analysis

This data analysis contains SQL queries and insights derived from analyzing a film database using PostgreSQL. The analysis focuses on various aspects of the film industry, including genre trends, the popularity of actors and directors, and the performance of production companies. Additionally, it explores the impact of reviews on film ratings and calculates success rates for directors based on average movie ratings. The goal of this analysis is to provide actionable insights for filmmakers, production companies, and industry professionals, enabling data-driven decision-making in film production and distribution.

```sql
Total Number of Movies
SELECT COUNT(*) AS total_movies
FROM films
```
```sql
Actors Who Have Appeared in the Most Movies
SELECT r.person_id, COUNT(r.film_id) AS movie_count
FROM roles r
WHERE r.role = 'actor'
GROUP BY r.person_id
ORDER BY movie_count DESC
LIMIT 10
```
```sql
Film Trends
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
```
```sql
Popularity of Different Film Genres
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
```

### Results/Findings

The analysis results are summarised as follows:
- The analysis revealed that certain film genres, such as action and drama, dominate the industry in terms of the number of films produced. These genres also tend to receive higher average ratings, indicating strong audience interest and satisfaction.
- Actors with a high volume of work and consistently strong ratings were highlighted as key industry players. Similarly, directors with high average ratings were identified as having a significant impact on a film’s success.
- Companies with a strong focus on a few specific genres also performed well if those genres aligned with current audience preferences. Recommendations for production companies include expanding genre diversity and collaborating with top-rated directors and actors.
- The count of films by genre confirmed that genres like action, drama, and comedy are the most popular in terms of production volume. However, niche genres like horror and independent films, though produced in smaller numbers, often receive high average ratings, suggesting a dedicated audience base.
- The average rating analysis for directors revealed a clear distinction between those who consistently deliver high-quality films and those with more variable success. Directors with consistently high average ratings were recommended for high-profile projects.
- The comparison of films with and without reviews showed that reviewed films generally have higher average ratings. This suggests that reviews play a significant role in boosting a film’s perceived quality, likely influencing audience interest and viewership. Films without reviews tend to have more variable and generally lower ratings, emphasizing the importance of critical and audience feedback.

### Recommendations

Based on the analysis we recommend the following actions:
- Production companies should continue to invest in popular genres like action, drama, and comedy, as these consistently attract large audiences.
- To maximize the success of a film, companies should prioritize working with actors and directors who have a proven track record of high ratings and consistent performance. These individuals can significantly enhance a film’s appeal and commercial success.
- Production companies that diversify their genre portfolio tend to achieve higher overall ratings. By producing films in a variety of genres, companies can reach a broader audience and mitigate the risk of relying too heavily on a single genre.
- Companies should encourage and facilitate early reviews from critics and audiences to boost a film’s visibility and perceived quality. Engaging with reviewers and critics can be a strategic tool in a film’s marketing campaign.
- Although niche genres like horror and independent films have smaller production volumes, they often receive high ratings and have dedicated fan bases. Production companies could consider investing in these genres to cater to niche markets and create critically acclaimed films.
- Companies should regularly assess the performance of directors by tracking the average ratings of their films. Investing in directors with consistently high ratings will likely lead to better film outcomes. Conversely, directors with variable success should be considered for projects that align closely with their strengths.
- The film industry is dynamic, with trends and audience preferences continually evolving. Companies should stay attuned to these changes by analyzing audience feedback and market trends, allowing them to make informed decisions about future film projects and marketing strategies.

### Limitations

1.  Ratings and reviews can be subjective and influenced by various factors, such as marketing, hype, or even the timing of the film’s release. This bias can affect the average ratings and the perceived success of actors, directors, and genres, potentially skewing the analysis.
2.  Films often belong to multiple genres, and the way they are classified can vary. This can lead to challenges in accurately analyzing genre trends and popularity, especially if the classification is inconsistent or overly broad.
3.  The analysis primarily focuses on internal data such as ratings, reviews, and genre counts. It does not account for external factors like budget, marketing spend, release timing, or competition from other films, all of which can significantly influence a film’s success.
4.  The analysis captures trends based on historical data, which may not fully account for rapidly changing audience preferences or emerging trends in the industry. This limitation can make it difficult to predict future success accurately.


### Reference

1. SQL Query script used has been attached
2. PostgresSQL v.16.4
3. Database ERD Diagram
