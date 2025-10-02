SELECT * FROM dbo.patient_mapping;

SELECT COUNT(*) FROM dbo.patient_mapping;

SELECT DISTINCT patient_id FROM dbo.patient_mapping; -- 3243 rows

SELECT DISTINCT patient_name FROM dbo.patient_mapping; -- 3243 rows

SELECT DISTINCT health_score FROM dbo.patient_mapping; -- 56 rows

SELECT DISTINCT insurance_type FROM dbo.patient_mapping; -- 7 rows however, the column needs to be cleaned

SELECT DISTINCT primary_care_physician_id FROM dbo.patient_mapping; -- 26 rows

SELECT DISTINCT blood_type FROM dbo.patient_mapping; -- 8 rows column is fine

SELECT DISTINCT city FROM dbo.patient_mapping; -- 6 rows. column is fine

SELECT COUNT(*) FROM dbo.patient_mapping WHERE patient_id IS NULL; -- No Null

SELECT COUNT(*) FROM dbo.patient_mapping WHERE patient_name IS NULL; -- No Null

SELECT COUNT(*) FROM dbo.patient_mapping WHERE health_score IS NULL; -- No Null

SELECT COUNT(*) FROM dbo.patient_mapping WHERE insurance_type IS NULL; -- No Null

SELECT COUNT(*) FROM dbo.patient_mapping WHERE primary_care_physician_id IS NULL; -- No Null

SELECT COUNT(*) FROM dbo.patient_mapping WHERE blood_type IS NULL; -- No Null

SELECT COUNT(*) FROM dbo.patient_mapping WHERE city IS NULL; -- No Null

SELECT patient_id, COUNT(*) FROM dbo.patient_mapping GROUP BY patient_id HAVING COUNT(*) > 1;

SELECT patient_name, COUNT(*) FROM dbo.patient_mapping GROUP BY patient_name HAVING COUNT(*) > 1;

SELECT health_score, COUNT(*) FROM dbo.patient_mapping GROUP BY health_score HAVING COUNT(*) > 1;

SELECT insurance_type, COUNT(*) FROM dbo.patient_mapping GROUP BY insurance_type HAVING COUNT(*) > 1;

SELECT primary_care_physician_id, COUNT(*) FROM dbo.patient_mapping GROUP BY primary_care_physician_id HAVING COUNT(*) > 1;

SELECT blood_type, COUNT(*) FROM dbo.patient_mapping GROUP BY blood_type HAVING COUNT(*) > 1;

SELECT city, COUNT(*) FROM dbo.patient_mapping GROUP BY city HAVING COUNT(*) > 1;

SELECT patient_id, patient_name, health_score, insurance_type, primary_care_physician_id, blood_type, city,
      COUNT(*)
FROM dbo.patient_mapping
GROUP BY patient_id, patient_name, health_score, insurance_type, primary_care_physician_id, blood_type, city
HAVING COUNT(*) > 1;

SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'patient_mapping';

UPDATE patient_mapping
SET patient_name = UPPER(LEFT(patient_name, 1)) 
       + LOWER(SUBSTRING(patient_name, 2, LEN(patient_name)));

UPDATE patient_mapping
SET insurance_type = CASE 
                     WHEN insurance_type = 'GOV' THEN 'Govt'
                     WHEN insurance_type = 'PUBlic' THEN 'Public'
					 WHEN insurance_type = 'Privatte' THEN 'Private'
                     WHEN insurance_type = 'N/A' THEN 'None'
                     ELSE insurance_type  
                  END;

SELECT * FROM dbo.patient_mapping;