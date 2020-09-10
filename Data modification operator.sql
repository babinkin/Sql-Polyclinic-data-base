UPDATE retraining_of_doctors  SET retraining_of_doctors.date = '2019-05-20' WHERE retraining_of_doctors.retraining_id = 5 AND retraining_of_doctors.doctor_id = 1;
SELECT retraining_of_doctors.date FROM retraining_of_doctors  WHERE retraining_of_doctors.doctor_id = 1;

// Меняет дату переподготовки Ивановой Анастасии Александровой по направлению 'Поликлинический Лор' 


INSERT INTO doctors_appointment(doctors_appointment_id,date,doctor_id,patient_id,diagnosis_id) VALUE (16,'2019-05-20',6 ,NULL);
SELECT * FROM doctors_appointment;
DELETE FROM doctors_appointment
	WHERE diagnosis_id = NULL;
SELECT * FROM doctors_appointment;

//Удаляет сведение о приёме где не был поставлен диагноз



INSERT INTO retraining(retraining_id, name)  SELECT MAX(retraining_id)+1, 'Новое направление переподготовки' FROM retraining; 
SELECT * FROM retraining;


//Добавляет новое направление переподготовки

