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
'''sql
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
'''
