
CREATE VIEW view_doctors_qualification_and_retraining AS
	SELECT doctor.name AS 'Доктор', doctor.qualification AS 'Специализация', retraining.name AS 'Направление переподготовки' , retraining_of_doctors.date AS 'Дата прохождения переподготовки' from retraining_of_doctors
  inner join retraining
    on  retraining_of_doctors.retraining_id = retraining.retraining_id 
  inner join doctor
    on doctor.doctor_id = retraining_of_doctors.doctor_id;

Select * FROM view_doctors_qualification_and_retraining ;

DROP VIEW view_doctors_qualification_and_retraining ;

