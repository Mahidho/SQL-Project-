-- Netflix Users SQL Project
-- Dataset from Kaggle - 25,000 Netflix users


-- create countries table
CREATE TABLE IF NOT EXISTS countries (
    country_name   TEXT PRIMARY KEY,
    continent      TEXT,
    region         TEXT,
    netflix_since  INTEGER
);

INSERT INTO countries VALUES ('USA',       'North America', 'Northern America', 2007);
INSERT INTO countries VALUES ('Canada',    'North America', 'Northern America', 2010);
INSERT INTO countries VALUES ('Mexico',    'North America', 'Central America',  2011);
INSERT INTO countries VALUES ('Brazil',    'South America', 'South America',    2011);
INSERT INTO countries VALUES ('UK',        'Europe',        'Western Europe',   2012);
INSERT INTO countries VALUES ('France',    'Europe',        'Western Europe',   2014);
INSERT INTO countries VALUES ('Germany',   'Europe',        'Western Europe',   2014);
INSERT INTO countries VALUES ('India',     'Asia',          'South Asia',       2016);
INSERT INTO countries VALUES ('Japan',     'Asia',          'East Asia',        2015);
INSERT INTO countries VALUES ('Australia', 'Oceania',       'Oceania',          2015);


-- look at the data first
SELECT * FROM netflix_users LIMIT 10;


-- WHERE
SELECT field2, field4, field5
FROM netflix_users
WHERE field4 = 'India';


-- OR
SELECT field2, field4, field7
FROM netflix_users
WHERE field7 = 'Action'
   OR field7 = 'Horror';


-- NOT
SELECT field2, field5, field6
FROM netflix_users
WHERE NOT field5 = 'Basic';


-- ORDER BY
SELECT field2, field4, field6
FROM netflix_users
ORDER BY field6 DESC;


-- GROUP BY
SELECT field5, COUNT(*) AS total_users
FROM netflix_users
GROUP BY field5;

SELECT field7, COUNT(*) AS total_users
FROM netflix_users
GROUP BY field7
ORDER BY total_users DESC;


-- HAVING
SELECT field4, COUNT(*) AS total_users
FROM netflix_users
GROUP BY field4
HAVING total_users > 1000;


-- aggregate functions
SELECT
    COUNT(*) AS total_users,
    ROUND(AVG(field6), 2) AS avg_watch_hours,
    MIN(field6) AS min_hours,
    MAX(field6) AS max_hours,
    ROUND(SUM(field6), 0) AS total_hours
FROM netflix_users;


-- INNER JOIN
SELECT
    u.field2 AS name,
    u.field4 AS country,
    c.continent,
    u.field5 AS subscription,
    u.field6 AS watch_hours
FROM netflix_users u
INNER JOIN countries c ON u.field4 = c.country_name;


-- LEFT JOIN
SELECT
    c.country_name,
    c.continent,
    COUNT(u.field1) AS total_users
FROM countries c
LEFT JOIN netflix_users u ON c.country_name = u.field4
GROUP BY c.country_name;


-- which continent watches the most
SELECT
    c.continent,
    COUNT(*) AS total_users,
    ROUND(AVG(u.field6), 2) AS avg_watch_hours
FROM netflix_users u
INNER JOIN countries c ON u.field4 = c.country_name
GROUP BY c.continent
ORDER BY avg_watch_hours DESC;


-- premium users who watch more than 800 hours
SELECT field2, field4, field6, field7
FROM netflix_users
WHERE field5 = 'Premium'
  AND field6 > 800
ORDER BY field6 DESC;
