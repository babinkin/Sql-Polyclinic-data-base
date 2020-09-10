INSERT INTO doctors_appointment(doctors_appointment_id,date,doctor_id,patient_id,diagnosis_id) VALUES(1024,'2019-04-18',7,10,4);
select * from doctors_appointment;
select * from doctors_appointment;
 
 INSERT INTO patient(patient_id,name,birth_date,Address) VALUES (41,'новый пациент','1999-06-26','Балтийская ул., дом 14,кв.7');
select * from patient;

SELECT patient.name AS 'Пациент', diagnosis.name AS 'Диагноз',doctor.name AS 'Поставил' FROM doctors_appointment
RIGHT JOIN diagnosis
ON diagnosis.diagnosis_id = doctors_appointment.diagnosis_id
RIGHT JOIN doctor
ON doctor.doctor_id = doctors_appointment.doctor_id
RIGHT outer JOIN patient
ON patient.patient_id = doctors_appointment.patient_id
ORDER BY patient.name
;
