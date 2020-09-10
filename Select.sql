
---------------------------------------1-------------------------------------------------------
select doctor.name AS 'Доктор', doctor.qualification AS 'Специализация', retraining.name AS 'Направление переподготовки' , retraining_of_doctors.date AS 'Дата прохождения переподготовки' from retraining_of_doctors
  inner join retraining
    on  retraining_of_doctors.retraining_id = retraining.retraining_id 
  inner join doctor
    on doctor.doctor_id = retraining_of_doctors.doctor_id;
// Выводит список докторов поликлиники, их специализацию и переподготовки

---------------------------------------2-------------------------------------------------------
SELECT patient.name AS 'Пациент', diagnosis.name AS 'Диагноз',doctor.name AS 'Поставил' FROM doctors_appointment
RIGHT JOIN patient
ON patient.patient_id = doctors_appointment.patient_id
RIGHT JOIN diagnosis
ON diagnosis.diagnosis_id = doctors_appointment.diagnosis_id
RIGHT JOIN doctor
ON doctor.doctor_id = doctors_appointment.doctor_id
ORDER BY patient.name
;
// Список пациентов с их диагнозами и перечнем специалистов которые их поставили

---------------------------------------3-------------------------------------------------------
SELECT patient.name AS 'Пациент', doctors_appointment.date AS 'Дата приёма', doctor.name AS 'Врач' FROM doctors_appointment
INNER JOIN doctor
ON doctor.doctor_id = doctors_appointment.doctor_id
INNER JOIN patient
ON patient.patient_id = doctors_appointment.patient_id;
//История обращений пациентов к врачам

---------------------------------------4-------------------------------------------------------
SELECT doctor.name AS 'Врач', COUNT(doctors_appointment_id) AS 'Количество принятых пациентов' FROM doctors_appointment
INNER JOIN doctor
ON doctor.doctor_id = doctors_appointment.doctor_id
GROUP BY doctor.name
;
//Количество пациетов принятых каждым врачом поликлиники

---------------------------------------5--------------------------------------------------------
SELECT category_of_diagnosis.name,count(diagnosis.name) AS 'Количество установленных диагнозов' FROM diagnosis
INNER JOIN doctors_appointment
ON diagnosis.diagnosis_id = doctors_appointment.diagnosis_id 
INNER JOIN category_of_diagnosis
ON diagnosis.category_of_diagnosis_id = category_of_diagnosis.category_of_diagnosis_id
GROUP BY category_of_diagnosis.name
ORDER BY count(diagnosis.name) DESC
;
//Самые распространённые группы заболеваний

--------------------------------------6----------------------------------------------------------
SELECT doctor.name AS 'Доктор' FROM doctor
WHERE doctor.qualification = 'Терапевт';
//Выводит список всех терапевтов

--------------------------------------7----------------------------------------------------------
SELECT MIN(patient.birth_date) AS 'Дата рождения самого возрастного пациента', MAX(patient.birth_date) AS   'Дата рождения самого молодого пациента' FROM patient;
// Выводит даты рождения самого возрастного и самого молодого пациентов

--------------------------------------8----------------------------------------------------------
SELECT patient.name AS 'Пациент' FROM doctors_appointment
JOIN patient
ON patient.patient_id = doctors_appointment.patient_id AND  doctors_appointment.diagnosis_id = '5'
;
// Список пациентов с диагнозом 'Гайморит'

--------------------------------------9----------------------------------------------------------
SELECT patient.name AS 'Пациент' FROM doctors_appointment, patient
WHERE patient.patient_id = doctors_appointment.patient_id AND  doctors_appointment.diagnosis_id = '5'
;
// Вариант 8 запроса без использования JOIN

--------------------------------------10----------------------------------------------------------
SELECT patient.name AS 'Пациент', COUNT(doctors_appointment_id) AS 'Количество поставленных диагнозов' FROM doctors_appointment
INNER JOIN patient
ON patient.patient_id = doctors_appointment.patient_id
GROUP BY  patient.name
HAVING COUNT(doctors_appointment_id) > 1
;
// Список пациентов, которым поставили больше 1 диагноза
--------------------------------------11----------------------------------------------------------
SELECT doctor.name AS 'Врач' FROM retraining_of_doctors, doctor
WHERE doctor.doctor_id = retraining_of_doctors.doctor_id AND  retraining_of_doctors.retraining_id = 2
UNION
SELECT doctor.name AS 'Врач' FROM retraining_of_doctors, doctor
WHERE doctor.doctor_id = retraining_of_doctors.doctor_id AND  retraining_of_doctors.retraining_id = 3
;
// Cписок докторов с напрвлением переподготовки 'Пластический хирург' или 'Сосудистый хирург'

--------------------------------------12----------------------------------------------------------
SELECT * FROM patient 
 HAVING patient.name IN (SELECT patient.name FROM patient 
 HAVING DATEDIFF('2019-05-20',patient.birth_date) > 10950) ;
// Данные о пациентах которые старше 30 лет


