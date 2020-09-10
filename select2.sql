USE `polyclinic` ;
select doctor.name AS 'Доктор', doctor.qualification AS 'Специализация', retraining.name AS 'Направление переподготовки' , retraining_of_doctors.date AS 'Дата прохождения переподготовки' from retraining_of_doctors
  inner join retraining
    on  retraining_of_doctors.retraining_id = retraining.retraining_id 
  inner join doctor
    on doctor.doctor_id = retraining_of_doctors.doctor_id;
    
    SELECT patient.name AS 'Пациент', diagnosis.name AS 'Диагноз',doctor.name AS 'Поставил' FROM doctors_appointment
RIGHT JOIN patient
ON patient.patient_id = doctors_appointment.patient_id
RIGHT JOIN diagnosis
ON diagnosis.diagnosis_id = doctors_appointment.diagnosis_id
RIGHT JOIN doctor
ON doctor.doctor_id = doctors_appointment.doctor_id
ORDER BY patient.name
;

SELECT patient.name AS 'Пациент', doctors_appointment.date AS 'Дата приёма', doctor.name AS 'Врач' FROM doctors_appointment
INNER JOIN doctor
ON doctor.doctor_id = doctors_appointment.doctor_id
INNER JOIN patient
ON patient.patient_id = doctors_appointment.patient_id;

SELECT doctor.name AS 'Врач', COUNT(doctors_appointment_id) AS 'Количество принятых пациентов' FROM doctors_appointment
INNER JOIN doctor
ON doctor.doctor_id = doctors_appointment.doctor_id
GROUP BY doctor.name
;

SELECT category_of_diagnosis.name,count(diagnosis.name) AS 'Количество установленных диагнозов' FROM diagnosis
INNER JOIN doctors_appointment
ON diagnosis.diagnosis_id = doctors_appointment.diagnosis_id 
INNER JOIN category_of_diagnosis
ON diagnosis.category_of_diagnosis_id = category_of_diagnosis.category_of_diagnosis_id
GROUP BY category_of_diagnosis.name
ORDER BY count(diagnosis.name) DESC
;

SELECT doctor.name AS 'Доктор' FROM doctor
WHERE doctor.qualification = 'Терапевт';

SELECT MIN(patient.birth_date) AS 'Дата рождения самого возрастного пациента', MAX(patient.birth_date) AS   'Дата рождения самого молодого пациента' FROM patient;

SELECT patient.name AS 'Пациент' FROM doctors_appointment
JOIN patient
ON patient.patient_id = doctors_appointment.patient_id AND  doctors_appointment.diagnosis_id = '5'
;

SELECT patient.name AS 'Пациент' FROM doctors_appointment, patient
WHERE patient.patient_id = doctors_appointment.patient_id AND  doctors_appointment.diagnosis_id = '5'
;

SELECT patient.name AS 'Пациент', COUNT(doctors_appointment_id) AS 'Количество поставленных диагнозов' FROM doctors_appointment
INNER JOIN patient
ON patient.patient_id = doctors_appointment.patient_id
GROUP BY  patient.name
HAVING COUNT(doctors_appointment_id) > 1
;

SELECT doctor.name AS 'Врач' FROM retraining_of_doctors, doctor
WHERE doctor.doctor_id = retraining_of_doctors.doctor_id AND  retraining_of_doctors.retraining_id = 2
UNION
SELECT doctor.name AS 'Врач' FROM retraining_of_doctors, doctor
WHERE doctor.doctor_id = retraining_of_doctors.doctor_id AND  retraining_of_doctors.retraining_id = 3
;

SELECT * FROM patient 
 HAVING patient.name IN (SELECT patient.name FROM patient 
 HAVING DATEDIFF('2019-05-20',patient.birth_date) > 10950) ;