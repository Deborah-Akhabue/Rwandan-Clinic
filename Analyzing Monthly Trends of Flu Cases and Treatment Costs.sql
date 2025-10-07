-- The total number of flu cases recorded is 2668.

SELECT COUNT(*) AS total_number_of_flu_cases_recorded
FROM dbo.patient_records_fact
WHERE diagnosis = 'Flu';


-- The total cost of flu treatment amounted to 789,279.16

SELECT SUM(cost) AS total_cost_for_flu_cases
FROM dbo.patient_records_fact
WHERE diagnosis = 'Flu';



-- The total cost of flu treatment amounted to 789,279.16, out of an overall cost of 8,794,379.79.

SELECT diagnosis,
      SUM(cost) AS total_cost_per_diagnosis
FROM dbo.patient_records_fact
GROUP BY diagnosis
ORDER BY total_cost_per_diagnosis DESC;


/*The peak months of the flu season with the highest flu activity 
based on both the number of flu cases and total treatment costs.*/


SELECT 
    YEAR(visit_date) AS year,
    MONTH(visit_date) AS month,
	DATENAME(MONTH, visit_date) AS month_name,
    COUNT(*) AS total_cases,
    SUM(cost) AS total_cost
FROM dbo.patient_records_fact
WHERE diagnosis LIKE '%flu%'
GROUP BY YEAR(visit_date), MONTH(visit_date), DATENAME(MONTH, visit_date) 
ORDER BY total_cases DESC, total_cost DESC;


/*The top 3 months of each year with the highest flu activity 
based on both the number of flu cases and total treatment costs.*/

WITH flu_summary AS (
    SELECT 
        YEAR(visit_date) AS year,
        DATENAME(MONTH, visit_date) AS month_name,
        COUNT(*) AS total_cases,
        SUM(cost) AS total_cost
    FROM dbo.patient_records_fact
    WHERE diagnosis LIKE '%flu%'
    GROUP BY YEAR(visit_date), DATENAME(MONTH, visit_date)
),
ranked_flu AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY year ORDER BY total_cases DESC, total_cost DESC) AS rank_in_year
    FROM flu_summary
)
SELECT 
    year,
    month_name,
    total_cases,
    total_cost
FROM ranked_flu
WHERE rank_in_year <= 3
ORDER BY year DESC, total_cases DESC, total_cost DESC;


-- Peak by cases

WITH flu_summary AS (
    SELECT 
        YEAR(visit_date) AS year,
        DATENAME(MONTH, visit_date) AS month_name,
        COUNT(*) AS total_cases,
        SUM(cost) AS total_cost
    FROM dbo.patient_records_fact
    WHERE diagnosis LIKE '%flu%'
    GROUP BY YEAR(visit_date), DATENAME(MONTH, visit_date)
)
SELECT TOP 10 year, month_name, total_cases
FROM flu_summary
ORDER BY total_cases DESC;

-- Peak by costs

WITH flu_summary AS (
    SELECT 
        YEAR(visit_date) AS year,
        DATENAME(MONTH, visit_date) AS month_name,
        COUNT(*) AS total_cases,
        SUM(cost) AS total_cost
    FROM dbo.patient_records_fact
    WHERE diagnosis LIKE '%flu%'
    GROUP BY YEAR(visit_date), DATENAME(MONTH, visit_date)
)
SELECT TOP 10 year, month_name, total_cost
FROM flu_summary
ORDER BY total_cost DESC;

-- Peak by cases and cost
/*Flu cases peaked in August 2025, with 22 recorded cases.
However, treatment costs were highest in April 2024 (5,859.88).
From the analysis, June, July, and August represent the months with the greatest budget impact.*/

WITH flu_summary AS (
    SELECT 
        YEAR(visit_date) AS year,
        DATENAME(MONTH, visit_date) AS month_name,
        COUNT(*) AS total_cases,
        SUM(cost) AS total_cost
    FROM dbo.patient_records_fact
    WHERE diagnosis LIKE '%flu%'
    GROUP BY YEAR(visit_date), DATENAME(MONTH, visit_date)
)
SELECT TOP 10 year, month_name, total_cases, total_cost
FROM flu_summary
ORDER BY total_cases DESC, total_cost DESC;





