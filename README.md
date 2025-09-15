# Hospital_Emegency_room_SQL_Project
## Project Overview
 The dataset consists of 9,216 emergency room patient records from a hospital, capturing details about patient demographics, admission status,  referrals, satisfaction levels, and wait times. It is designed to analyze patient flow, admission patterns, service efficiency, and satisfaction outcomes in  emergency care.
## Objectives
Operational Efficiency– Calculate average waiting times and identify departments with delays.
 Patient Satisfaction– Compare satisfaction levels between admitted and non-admitted patients.
 Demographic Analysis– Study patients by gender, age group, and race.
 Admission Trends– Analyze admission vs. non-admission rates and age group patterns.
 Departmental Insights– Evaluate workload and performance of different referral departments.
 Equity in Care– Identify race groups with the highest admission rates.
 Critical Extremes– Retrieve the youngest and oldest admitted patients to understand edge cases.
 Root Cause of Delays– Find departments where average waiting times exceed acceptable limits.
 ## Project Structure
 Database Creation: The project starts by creating a database named emegency_hospital_data.
```sql
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
```
## Data Analysis & Findings
1.Find Avg Patient_Wait Time
```sql
SELECT ROUND(AVG(patient_waittime),2) AS
Average_wait_time 
FROM hospital_emergency_data;

```
 2. Find patient satisfaction scores vary between 
admitted and non-admitted patients?
```sql
select admission_status,(avg(patient_satisfaction_score))
as satisfaction_score from hospital_emergency_data 
group by admission_status ;
```
3. Find the total number of patients by gender and age group.
```sql
SELECT patient_gender,`Age group`,count(*)
AS total_patients FROM hospital_emergency_data
GROUP BY  patient_gender,`Age group`
ORDER BY COUNT(*) ;
```
 4. What percentage of patients are admitted vs. not admitted
```sql
SELECT 
admission_status,
COUNT(*) AS total_patients,
ROUND((COUNT(*) * 100 / (SELECT COUNT(*) FROM hospital_emergency_data)), 2)
AS percentage
FROM hospital_emergency_data
GROUP BY admission_status;
```
5. Find the correlation between waiting time and satisfaction
```sql
SELECT wait_time,ROUND(AVG(patient_satisfaction_score))
AS avg_satisfaction FROM hospital_emergency_data
GROUP BY wait_time ;
```
6. NO of patient by department referral
```sql
SELECT department_referral,COUNT(*)
AS total_patients FROM hospital_emergency_data 
GROUP BY department_referral ORDER BY COUNT(*);
```
7. Identify the race group with the highest admission rate.
```sql
SELECT patient_race,ROUND((COUNT(*)/(SELECT COUNT(*) FROM hospital_emergency_data)) * 100,2)
AS admissin_rate FROM hospital_emergency_data
GROUP BY patient_race ORDER BY COUNT(*) DESC LIMIT 5 ;
```
 8. Retrieve the youngest and oldest patients admitted.
```sql
SELECT MAX(patient_age) AS oldest_age,MIN(patient_age)
AS youngest_age FROM hospital_emergency_data
WHERE admission_status="admitted";
```
9. find the most common age group for admitted patients.
```sql
    SELECT `Age group`,COUNT(*) AS admitted_count
FROM hospital_emergency_data
WHERE admission_status = 'Admitted'
GROUP BY `Age group`
ORDER BY admitted_count DESC
LIMIT 1;
```
10. Get the top 3 departments where patients waited 
more than 30 minutes on average.
```sql
SELECT department_referral,ROUND(AVG(patient_waittime),2)
AS avg_waittime FROM hospital_emergency_data
GROUP BY department_referral 
HAVING AVG(patient_waittime) > 30
ORDER BY avg_waittime DESC
LIMIT 3;
```

## Findings
Patient Demographics: Data covers 9,216 emergency patients across varied age groups, genders, and races.

Waiting Times: Average waits are high, with some departments exceeding 45 minutes.

Satisfaction & Admission: Admitted patients show higher satisfaction; non-admissions need better handling.

Admission Trends: X% admitted vs. Y% not admitted, reflecting triage efficiency but limited capacity.

Departmental Insights: General Practice and Orthopedics face heavy referral loads; some departments show recurring delays.

Equity in Care: One race group has highest admission rates, suggesting possible bias concerns.

Critical Extremes: Cases span from infants to elderly, highlighting wide emergency care needs.

## Reports
Operational Summary: Wait times, departmental delays, and referral hotspots.

Demographics Report: Age, gender, and race breakdown.

Satisfaction Report: Admission vs. non-admission experience gaps.

Admission Trends Report: Ratios by age and race.

Department Performance: Referral volume and staffing needs.

Equity Report: Admission rate patterns across racial groups.

# Conclusion
This SQL project turns emergency hospital data into clear insights, exposing bottlenecks, disparities, and strengths. Key actions include reducing wait times, improving non-admission experiences, ensuring equity, and preparing for diverse patient needs. Beyond analysis, the project highlights the real impact of SQL-driven decisions on healthcare outcomes.

