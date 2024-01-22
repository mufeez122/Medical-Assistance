CREATE DATABASE  MedicalRecords;

USE MedicalRecords;

CREATE TABLE IF NOT EXISTS Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    symptoms VARCHAR(100),
    gender ENUM('Male', 'Female', 'Other'),
    city VARCHAR(100)
);

INSERT INTO Patients (name, age, symptoms, gender, city) VALUES
    ('John Doe', 30, 'Fever, Headache', 'Male', 'New York'),
    ('Jane Doe', 25, 'Cough, Fatigue', 'Female', 'Los Angeles'),
    ('Alex Smith', 40, 'Shortness of breath', 'Other', 'Chicago');
    
    CREATE DATABASE  MedicalSymptoms;
    
    USE MedicalSymptoms;
    
    CREATE TABLE  Symptoms (
    symptom_id INT AUTO_INCREMENT PRIMARY KEY,
    symptom_name VARCHAR(100) NOT NULL
);

INSERT INTO Symptoms (symptom_name) VALUES
    ('Fever'),
    ('Headache'),
    ('Cough'),
    ('Fatigue'),
    ('Shortness of breath');
    
    CREATE DATABASE MedicalRemedies;
    
    USE MedicalRemedies;
    
    
    CREATE TABLE IF NOT EXISTS Remedies (
    remedy_id INT AUTO_INCREMENT PRIMARY KEY,
    symptom_id INT,
    remedy_description TEXT,
    FOREIGN KEY (symptom_id) REFERENCES Symptoms(symptom_id)
);

INSERT INTO Remedies (symptom_id, remedy_description) VALUES
    (1, 'Take acetaminophen and rest.'),
    (2, 'Drink plenty of water and get enough sleep.'),
    (3, 'Use cough drops and stay hydrated.'),
    (4, 'Get enough sleep and rest.'),
    (5, 'Seek medical attention immediately if severe.');
    
    
    SET @target_symptom = 'Fever';
    
    SELECT Remedies.remedy_description
FROM Remedies
JOIN Symptoms ON Remedies.symptom_id = Symptoms.symptom_id
WHERE Symptoms.symptom_name = @target_symptom;

SELECT *
FROM Patients
WHERE gender = 'Female';

SELECT *
FROM Patients
WHERE gender = 'Male';

    
    USE MedicalRecords;
SELECT * FROM Patients WHERE age >= 30;


USE MedicalRecords;
SELECT * FROM Patients WHERE city = 'New York';


USE MedicalRecords;
SELECT COUNT(*) as male_patient_count FROM Patients WHERE gender = 'Male';

USE MedicalSymptoms;
SELECT DISTINCT symptom_name FROM Symptoms;


USE MedicalSymptoms;
USE MedicalRemedies;
SET @target_symptom = 'Fever';
SELECT Remedies.remedy_description
FROM Remedies
JOIN Symptoms ON Remedies.symptom_id = Symptoms.symptom_id
WHERE Symptoms.symptom_name = @target_symptom;


USE MedicalRecords;
UPDATE Patients SET age = 35 WHERE name = 'John Doe';


USE MedicalRecords;
DELETE FROM Patients WHERE name = 'Jane Doe';



