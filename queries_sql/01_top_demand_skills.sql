-- Top 10 Demanded Skills for Data Scientist in United States

SELECT
sd.skills AS Skills,
COUNT(jpf.job_title_short) AS Job_Postings

FROM
job_postings_fact AS jpf

LEFT JOIN skills_job_dim AS sjd
ON jpf.job_id = sjd.job_id

INNER JOIN skills_dim AS sd
ON sjd.skill_id = sd.skill_id

WHERE
(jpf.job_title_short = 'Data Scientist') AND (jpf.job_country = 'United States')

GROUP BY
sd.skills
ORDER BY
Job_Postings DESC

LIMIT
10;


/*
┌────────────┬──────────────┐
│   Skills   │ Job_Postings │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ python     │        76602 │
│ sql        │        53882 │
│ r          │        44859 │
│ sas        │        24484 │
│ tableau    │        23694 │
│ aws        │        19680 │
│ spark      │        17103 │
│ tensorflow │        13884 │
│ azure      │        13380 │
│ java       │        12595 │
└────────────┴──────────────┘
*/