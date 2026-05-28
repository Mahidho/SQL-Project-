# Netflix Users SQL Project

Picked up a dataset from Kaggle with 25,000 Netflix users and ran some SQL queries on it using DB Browser for SQLite.

---

## Files

- `netflix_users.csv` — the dataset from Kaggle
- `netflix_project.sql` — all my queries

---

## About the Dataset

The dataset has 25,000 Netflix users with info like their country, subscription type (Basic, Standard, Premium), how many hours they watch, their favorite genre and last login date.

There is also a second table that i created with the help of claude called `countries` to store continent and region info so I could practice JOINs. 

---

## What I practiced

- WHERE, OR, NOT
- ORDER BY
- Aggregate functions — COUNT, SUM, AVG, MIN, MAX
- GROUP BY and HAVING
- INNER JOIN and LEFT JOIN

---

## How to run it

1. Download DB Browser for SQLite from sqlitebrowser.org
2. Create a new database
3. Import `netflix_users.csv` as a table
4. Run the queries in `netflix_project.sql`
