SELECT * FROM dbo.patient_records_fact;

SELECT COUNT(*) FROM dbo.patient_records_fact; -- 24,928

SELECT DISTINCT patient_id FROM dbo.patient_records_fact;

SELECT DISTINCT visit_date FROM dbo.patient_records_fact;

SELECT DISTINCT age FROM dbo.patient_records_fact;

SELECT DISTINCT gender FROM dbo.patient_records_fact;

SELECT DISTINCT diagnosis FROM dbo.patient_records_fact;

SELECT DISTINCT cost FROM dbo.patient_records_fact;

SELECT DISTINCT doctor_id FROM dbo.patient_records_fact;

SELECT DISTINCT treatment_type FROM dbo.patient_records_fact;

SELECT COUNT(*) FROM dbo.patient_records_fact WHERE patient_id IS NULL;

SELECT COUNT(*) FROM dbo.patient_records_fact WHERE visit_date IS NULL;

SELECT COUNT(*) FROM dbo.patient_records_fact WHERE age IS NULL; -- 1540 null values

SELECT COUNT(*) FROM dbo.patient_records_fact WHERE gender IS NULL; -- 3630 null values

SELECT COUNT(*) FROM dbo.patient_records_fact WHERE diagnosis IS NULL;

SELECT COUNT(*) FROM dbo.patient_records_fact WHERE cost IS NULL; -- 624 null values

SELECT COUNT(*) FROM dbo.patient_records_fact WHERE doctor_id IS NULL;

SELECT COUNT(*) FROM dbo.patient_records_fact WHERE treatment_type IS NULL;

SELECT patient_id, COUNT(*) FROM dbo.patient_records_fact GROUP BY patient_id HAVING COUNT(*) > 1;

SELECT visit_date, COUNT(*) FROM dbo.patient_records_fact GROUP BY visit_date HAVING COUNT(*) > 1;

SELECT age, COUNT(*) FROM dbo.patient_records_fact GROUP BY age HAVING COUNT(*) > 1;

SELECT gender, COUNT(*) FROM dbo.patient_records_fact GROUP BY gender HAVING COUNT(*) > 1;

SELECT diagnosis, COUNT(*) FROM dbo.patient_records_fact GROUP BY diagnosis HAVING COUNT(*) > 1;

SELECT cost, COUNT(*) FROM dbo.patient_records_fact GROUP BY cost HAVING COUNT(*) > 1;

SELECT doctor_id, COUNT(*) FROM dbo.patient_records_fact GROUP BY doctor_id HAVING COUNT(*) > 1;

SELECT treatment_type, COUNT(*) FROM dbo.patient_records_fact GROUP BY treatment_type HAVING COUNT(*) > 1;

SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'patient_records_fact';

UPDATE dbo.patient_records_fact
  SET age = NULL
WHERE age = -5;

UPDATE patient_records_fact
SET gender = CASE 
                     WHEN gender = '?' THEN 'NULL'
                     WHEN gender = '123' THEN 'NULL'
					 WHEN gender = 'F' THEN 'Female'
                     WHEN gender = 'M' THEN 'Male'
                     ELSE gender
                  END;

UPDATE patient_records_fact
SET cost = CASE 
                     WHEN cost = 'two hundred' THEN '200'
                     WHEN cost = 'free' THEN '0'
					 WHEN cost = 'error' THEN 'NULL'
                     WHEN cost = 'missing' THEN 'NULL'
                     ELSE cost
                  END;