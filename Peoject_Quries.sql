CREATE DATABASE emegency_hospital_data;

USE hospital_emergency_data;

CREATE TABLE Project (
    patient_id varchar(23) PRIMARY KEY,
    patient_admission_date DATETIME,
    patient_first_inital CHAR(1),
    patient_last_name VARCHAR(50),
    patient_gender VARCHAR(10),
    patient_age TINYINT,
    Age_group VARCHAR(10),
    patient_race VARCHAR(20),
    department_referral VARCHAR(50),
    patient_admission_flag BOOLEAN,
    admission_status VARCHAR(20),
    patient_satisfaction_score TINYINT,
    patient_waittime SMALLINT,
    wait_time VARCHAR(20)
);



SELECT ROUND(AVG(patient_waittime),2) AS
Average_wait_time 
FROM hospital_emergency_data;


select admission_status,(avg(patient_satisfaction_score))
as satisfaction_score from hospital_emergency_data 
group by admission_status ;


SELECT patient_gender,`Age group`,count(*)
AS total_patients FROM hospital_emergency_data
GROUP BY  patient_gender,`Age group`
ORDER BY COUNT(*) ;


SELECT 
admission_status,
COUNT(*) AS total_patients,
ROUND((COUNT(*) * 100 / (SELECT COUNT(*) FROM hospital_emergency_data)), 2)
AS percentage
FROM hospital_emergency_data
GROUP BY admission_status;


SELECT wait_time,ROUND(AVG(patient_satisfaction_score))
AS avg_satisfaction FROM hospital_emergency_data
GROUP BY wait_time ;


SELECT department_referral,COUNT(*)
AS total_patients FROM hospital_emergency_data 
GROUP BY department_referral ORDER BY COUNT(*);


SELECT patient_race,ROUND((COUNT(*)/(SELECT COUNT(*) FROM hospital_emergency_data)) * 100,2)
AS admissin_rate FROM hospital_emergency_data
GROUP BY patient_race ORDER BY COUNT(*) DESC LIMIT 5 ;


SELECT MAX(patient_age) AS oldest_age,MIN(patient_age)
AS youngest_age FROM hospital_emergency_data
WHERE admission_status="admitted";


SELECT `Age group`,COUNT(*) AS admitted_count
FROM hospital_emergency_data
WHERE admission_status = 'Admitted'
GROUP BY `Age group`
ORDER BY admitted_count DESC
LIMIT 1;


SELECT department_referral,ROUND(AVG(patient_waittime),2)
AS avg_waittime FROM hospital_emergency_data
GROUP BY department_referral 
HAVING AVG(patient_waittime) > 30
ORDER BY avg_waittime DESC
LIMIT 3;

