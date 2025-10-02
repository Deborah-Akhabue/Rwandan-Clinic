SELECT * FROM dbo.wellness_activity;

SELECT COUNT(*) FROM dbo.wellness_activity; -- 49,776

SELECT DISTINCT patient_id FROM dbo.wellness_activity;

SELECT DISTINCT activity_type FROM dbo.wellness_activity;

SELECT DISTINCT activity_date FROM dbo.wellness_activity;

SELECT DISTINCT duration_minutes FROM dbo.wellness_activity;

SELECT DISTINCT wellness_status FROM dbo.wellness_activity;

-- This table is fine, need no cleaning

SELECT COUNT(*) FROM dbo.wellness_activity WHERE patient_id IS NULL;

SELECT COUNT(*) FROM dbo.wellness_activity WHERE activity_type IS NULL;

SELECT COUNT(*) FROM dbo.wellness_activity WHERE activity_date IS NULL;

SELECT COUNT(*) FROM dbo.wellness_activity WHERE duration_minutes IS NULL;

SELECT COUNT(*) FROM dbo.wellness_activity WHERE wellness_status IS NULL;

SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'wellness_activity';