SELECT * FROM doctors_appointment;

DROP PROCEDURE IF EXISTS AddDoctorsAppointment;

DELIMITER $$
CREATE PROCEDURE AddDoctorsAppointment (doctors_appointment_number INT, date_of_appointment DATE, doctor1_id INT, patient1_id INT, diagnosis1_id INT)
BEGIN
	IF NOT EXISTS (SELECT * FROM doctors_appointment WHERE (doctors_appointment_id = doctors_appointment_number)
    THEN 
	INSERT INTO  doctors_appointment(doctors_appointment_id,date,doctor_id,patient_id,diagnosis_id) VALUE (doctors_appointment_number, date_of_appointment, doctor1_id, patient1_id, diagnosis1_id);
    END IF;
END $$
DELIMITER ;

CALL  AddDoctorsAppointment(16,2019-05-20,4,8,6);

SELECT * FROM doctors_appointment;

//Добавляет новый приём у врача
