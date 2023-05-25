--Q1 Row count
SELECT COUNT(*)
FROM data_analyst_jobs;
--Q2 Limit 10. 10th Row is ExxonMobil
SELECT company
FROM data_analyst_jobs
LIMIT 10
--Q3 Posting in TN/KY
SELECT COUNT(location) AS jobs_in_TN
FROM data_analyst_jobs
WHERE location='TN';
SELECT COUNT (CASE WHEN location='TN' THEN location END) AS jobs_in_TN,
       COUNT (CASE WHEN location='KY' THEN location END) AS jobs_in_KY
FROM data_analyst_jobs;
--Q4 TN Rating above 4
SELECT COUNT(location) AS TN_rating_above_4
FROM data_analyst_jobs
WHERE star_rating>4 
	  AND location='TN';
--Q5 Count review beween  500 and 1000
SELECT COUNT (*) AS review_between_500_and_1000
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--Q6 Average start rating for companies
SELECT location AS state,ROUND(AVG(star_rating),1) AS avg_rating, company
FROM data_analyst_jobs
WHERE location IS NOT NULL
      AND star_rating IS NOT NULL
GROUP BY company,state
ORDER BY avg_rating DESC
--Q7 Unique job titles
SELECT COUNT (DISTINCT title) AS unique_job_titles
FROM data_analyst_jobs;
--Q8 Unique job titles in CA
SELECT COUNT(DISTINCT title) AS unique_job_titles_in_CA
FROM data_analyst_jobs
WHERE location='CA';
--Q9 Each company avg star rating
SELECT company,AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE COMPANY IS NOT NULL
GROUP BY company
HAVING SUM(review_count)>5000;
--Q10 Order By rating from Q9
SELECT company,AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE COMPANY IS NOT NULL
GROUP BY company
HAVING SUM(review_count)>5000
ORDER BY avg_rating DESC;
--Q11 Jobs containing Analyst
SELECT COUNT(DISTINCT title)AS jobs_with_analyst_title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--Q12 Jobs not containing Analyst or Analytics
SELECT DISTINCT (title) AS jobs__not_with_analyst_or_analytics_title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%'
ORDER BY jobs__not_with_analyst_or_analytics_title;

