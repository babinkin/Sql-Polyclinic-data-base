SELECT * FROM doctors_appointment;

DELIMITER $$
CREATE TRIGGER tr_ins_doctors_appointment
BEFORE INSERT ON doctors_appointment
FOR EACH ROW 
BEGIN
	DECLARE varDoctorsAppointmentId INTEGER;
    SELECT MAX(doctors_appointment_id)+1 INTO varDoctorsAppointmentId FROM doctors_appointment ;
    SET NEW.doctors_appointment_id = varDoctorsAppointmentId;
END; $$
DELIMITER ; 

// Добавляет id приёма пациента у врача до внесения данных о приёме
