SELECT * FROM dbo.doctors;

SELECT COUNT(*) FROM dbo.doctors;

SELECT DISTINCT doctor_id FROM dbo.doctors;

SELECT DISTINCT doctor_name FROM dbo.doctors;

SELECT DISTINCT doctor_name FROM dbo.doctors;

SELECT DISTINCT specialty FROM dbo.doctors;

SELECT COUNT(*) FROM dbo.doctors WHERE doctor_id IS NULL;

SELECT COUNT(*) FROM dbo.doctors WHERE doctor_name IS NULL;

SELECT COUNT(*) FROM dbo.doctors WHERE specialty IS NULL;

SELECT doctor_id, COUNT(*) FROM dbo.doctors GROUP BY doctor_id HAVING COUNT(*) > 1;

SELECT doctor_name, COUNT(*) FROM dbo.doctors GROUP BY doctor_name HAVING COUNT(*) > 1;

SELECT specialty, COUNT(*) FROM dbo.doctors GROUP BY specialty HAVING COUNT(*) > 1;

SELECT doctor_id, doctor_name, specialty, 
       COUNT(*) 
	   FROM dbo.doctors 
	   GROUP BY doctor_id, doctor_name, specialty 
	   HAVING COUNT(*) > 1;

SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'doctors';

UPDATE doctors
SET doctor_name = UPPER(LEFT(
                    LTRIM(
                        REPLACE(REPLACE(REPLACE(doctor_name, 'Dr. ', ''), 'DR. ', ''), 'dr. ', '')
                    ), 1))
           + LOWER(SUBSTRING(
                    LTRIM(
                        REPLACE(REPLACE(REPLACE(doctor_name, 'Dr. ', ''), 'DR. ', ''), 'dr. ', '')
                    ), 2, LEN(doctor_name)))

SELECT * FROM dbo.doctors;