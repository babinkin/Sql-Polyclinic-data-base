SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `polyclinic` ;
CREATE SCHEMA IF NOT EXISTS `polyclinic` ;
USE `polyclinic` ;

DROP TABLE IF EXISTS `polyclinic`.`doctor` ;
CREATE TABLE IF NOT EXISTS `polyclinic`.`doctor` (
  `doctor_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`doctor_id`),
  UNIQUE INDEX `doctor_id_UNIQUE` (`doctor_id` ASC) )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `polyclinic`.`patient` ;
CREATE TABLE IF NOT EXISTS `polyclinic`.`patient` (
  `patient_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `birth_date` DATE NULL,
  `Address` VARCHAR(50),
  PRIMARY KEY (`patient_id`),
  UNIQUE INDEX `patient_id_UNIQUE` (`patient_id` ASC) )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `polyclinic`.`qualification` ;
CREATE TABLE IF NOT EXISTS `polyclinic`.`qualification` (
  `qualification_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`qualification_id`),
  UNIQUE INDEX `qualificatioon_id_UNIQUE` (`qualification_id` ASC) )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `polyclinic`.`retraining` ;
CREATE TABLE IF NOT EXISTS `polyclinic`.`retraining` (
  `retraining_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`retraining_id`),
  UNIQUE INDEX `retraining_id_UNIQUE` (`retraining_id` ASC) )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `polyclinic`.`diagnosis` ;
CREATE TABLE IF NOT EXISTS `polyclinic`.`diagnosis` (
  `diagnosis_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `category_of_diagnosis_id` INT NOT NULL, 
  PRIMARY KEY (`diagnosis_id`),
  INDEX `fk_diagnosis_category1_idx` (`category_of_diagnosis_id` ASC) ,
  CONSTRAINT `fk_diagnosis_category1`
    FOREIGN KEY (`category_of_diagnosis_id`)
    REFERENCES `polyclinic`.`category_of_diagnosis` (`category_of_diagnosis_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `polyclinic`.`category_of_diagnosis` ;
CREATE TABLE IF NOT EXISTS `polyclinic`.`category_of_diagnosis` (
  `category_of_diagnosis_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_of_diagnosis_id`),
  UNIQUE INDEX `category_of_diagnosis_id_UNIQUE` (`category_of_diagnosis_id` ASC) )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `polyclinic`.`qualification_of_doctors` ;
CREATE TABLE IF NOT EXISTS `polyclinic`.`qualification_of_doctors` (
  `qualification_id` INT NOT NULL,
  `doctor_id` INT NOT NULL,
  INDEX `fk_qualification_of_doctors_qualification1_idx` (`qualification_id` ASC) ,
  INDEX `fk_qualification_of_doctors_doctor1_idx` (`doctor_id` ASC) ,
  CONSTRAINT `fk_qualification_of_doctors_qualification1`
    FOREIGN KEY (`qualification_id`)
    REFERENCES `polyclinic`.`qualification` (`qualification_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_qualification_of_doctors_doctor1`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `polyclinic`.`doctor` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `polyclinic`.`retraining_of_doctors` ;
CREATE TABLE IF NOT EXISTS `polyclinic`.`retraining_of_doctors` (
  `retraining_id` INT NOT NULL,
  `doctor_id` INT NOT NULL,
  `date` DATE NULL,
  INDEX `fk_retraining_of_doctors_retraining1_idx` (`retraining_id` ASC) ,
  INDEX `fk_retraining_of_doctors_doctor1_idx` (`doctor_id` ASC) ,
  CONSTRAINT `fk_retraining_of_doctors_retraining1`
    FOREIGN KEY (`retraining_id`)
    REFERENCES `polyclinic`.`retraining` (`retraining_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_retraining_of_doctors_doctor1`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `polyclinic`.`doctor` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `polyclinic`.`doctors_appointment` ;
CREATE TABLE IF NOT EXISTS `polyclinic`.`doctors_appointment` (
  `doctors_appointment_id` INT NOT NULL,
  `data` DATE NULL,
  `doctor_id` INT NOT NULL,
  `patient_id` INT NOT NULL,
  PRIMARY KEY (`doctors_appointment_id`),
  INDEX `fk_doctors_appointment_doctor1_idx` (`doctor_id` ASC) ,
  INDEX `fk_doctors_appointment_patient1_idx` (`patient_id` ASC) ,
  UNIQUE INDEX `doctors_appointment_UNIQUE` (`doctors_appointment_id` ASC) ,
  CONSTRAINT `fk_doctors_appointment_doctor1`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `polyclinic`.`doctor` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctors_appointment_patient1`
    FOREIGN KEY (`patient_id`)
    REFERENCES `polyclinic`.`patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `polyclinic`.`doctor_diagnosed` ;
CREATE TABLE IF NOT EXISTS `polyclinic`.`doctor_diagnosed` (
  `doctors_appointment_id` INT NOT NULL,
  `diagnosis_id` INT NOT NULL,
  INDEX `fk_doctor_diagnosed_doctors_appointment1_idx` (`doctors_appointment_id` ASC) ,
  INDEX `fk_doctor_diagnosed_diagnosis1_idx` (`diagnosis_id` ASC) ,
  CONSTRAINT `fk_doctor_diagnosed_doctors_appointment1`
    FOREIGN KEY (`doctors_appointment_id`)
    REFERENCES `polyclinic`.`doctors_appointment` (`doctors_appointment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctor_diagnosed_diagnosis1`
    FOREIGN KEY (`diagnosis_id`)
    REFERENCES `polyclinic`.`diagnosis` (`diagnosis_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO doctor(doctor_id,name) VALUES (1,'Иванова Анастасия Александровна');
INSERT INTO doctor(doctor_id,name) VALUES (2,'Лыткина Полина Романовна');
INSERT INTO doctor(doctor_id,name) VALUES (3,'Селезнёва Валентина Виталиевна');
INSERT INTO doctor(doctor_id,name) VALUES (4,'Яровой Феликс Романович');
INSERT INTO doctor(doctor_id,name) VALUES (5,'Фадеева Полина Артёмовна');
INSERT INTO doctor(doctor_id,name) VALUES (6,'Давыдов Николай Владимирович');
INSERT INTO doctor(doctor_id,name) VALUES (7,'Лапина Дарья Борисовна');
INSERT INTO doctor(doctor_id,name) VALUES (8,'Блохина Зинаида Даниловнаdoctor');
INSERT INTO doctor(doctor_id,name) VALUES (9,'Рябов Георгий Алексеевич');
INSERT INTO doctor(doctor_id,name) VALUES (10,'Кравченко Юлий Юхимович');

INSERT INTO patient(patient_id,name,birth_date,Address) VALUES (1,'Бондаренко Ксения Даниловна','1999-06-26','Балтийская ул., дом 14,кв.7');
INSERT INTO patient(patient_id,name,birth_date,Address) VALUES (2,'Макаров Георгий Владимирович','1985-05-23','Балтийская ул., дом 21,кв.18');
INSERT INTO patient(patient_id,name,birth_date,Address) VALUES (3,'Захаров Егор Данилович','1938-06-08','Тракторная ул., дом 4, кв.42');
INSERT INTO patient(patient_id,name,birth_date,Address) VALUES (4,'Мазайло Ева Владимировна','1967-03-12','Лермонтовский пер., 1х, кв.65');
INSERT INTO patient(patient_id,name,birth_date,Address) VALUES (5,'Куликова Жанна Валерьевна','1975-07-29','Швецова ул., дом 2, кв.76');
INSERT INTO patient(patient_id,name,birth_date,Address) VALUES (6,'Семёнов Тарас Платонович','1961-10-24','Сивков пер., 1х, кв.5');
INSERT INTO patient(patient_id,name,birth_date,Address) VALUES (7,'Иванов Филипп Евгеньевич','1969-07-30','Балтийская ул., дом 7, кв. 11');
INSERT INTO patient(patient_id,name,birth_date,Address) VALUES (8,'Капустина Елена Александровна','1982-12-30','Сивков пер., 1х, кв.17');
INSERT INTO patient(patient_id,name,birth_date,Address) VALUES (9,'Колобов Фёдор Эдуардович','1993-02-02','Тракторная ул., дом 6, кв.1');
INSERT INTO patient(patient_id,name,birth_date,Address) VALUES (10,'Кириллова Владлена Эдуардовна','1978-08-31','Лермонтовский пер., 1х, кв.7');

INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (1,'ОРВИ',1);
INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (2,'Гипертоническая болезнь',2);
INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (3,'Вегето-сосудистая дистония',2);
INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (4,'Тонзиллит',1);
INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (5,'Гайморит',2);
INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (6,'Ишемическая болезнь сердца',2);
INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (7,'Остеохондроз позвоночника',4);
INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (8,'Гангрена',3);
INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (9,'Аппендицит',3);
INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (10,'Прободная язва желудка',4);
INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (11,'Гастрит',2);
INSERT INTO diagnosis(diagnosis_id,name,category_of_diagnosis_id) VALUES (12,'Врождённый порок сердца',3);

INSERT INTO category_of_diagnosis(category_of_diagnosis_id,name) VALUES (1,'Инфекционное');
INSERT INTO category_of_diagnosis(category_of_diagnosis_id,name) VALUES (2,'Соматическое');
INSERT INTO category_of_diagnosis(category_of_diagnosis_id,name) VALUES (3,'Основное');
INSERT INTO category_of_diagnosis(category_of_diagnosis_id,name) VALUES (4,'Хирургическое');

INSERT INTO qualification(qualification_id,name) VALUES (1,'Терапевт');
INSERT INTO qualification(qualification_id,name) VALUES (2,'ЛОР');
INSERT INTO qualification(qualification_id,name) VALUES (3,'Кардиолог');
INSERT INTO qualification(qualification_id,name) VALUES (4,'Невролог');
INSERT INTO qualification(qualification_id,name) VALUES (5,'Хирург');
INSERT INTO qualification(qualification_id,name) VALUES (6,'Гастроэнтеролог');

INSERT INTO retraining(retraining_id,name) VALUES (1,'Ортопед');
INSERT INTO retraining(retraining_id,name) VALUES (2,'Пластический хирург');
INSERT INTO retraining(retraining_id,name) VALUES (3,'Сосудистый хирург');
INSERT INTO retraining(retraining_id,name) VALUES (4,'Опрерующий ЛОР');
INSERT INTO retraining(retraining_id,name) VALUES (5,'Поликлинический ЛОР');
INSERT INTO retraining(retraining_id,name) VALUES (6,'Станционарный ЛОР');
INSERT INTO retraining(retraining_id,name) VALUES (7,'Педиатр');

INSERT INTO qualification_of_doctors(qualification_id, doctor_id) VALUES (2,1);
INSERT INTO qualification_of_doctors(qualification_id, doctor_id) VALUES (6,2);
INSERT INTO qualification_of_doctors(qualification_id, doctor_id) VALUES (1,3);
INSERT INTO qualification_of_doctors(qualification_id, doctor_id) VALUES (4,4);
INSERT INTO qualification_of_doctors(qualification_id, doctor_id) VALUES (3,5);
INSERT INTO qualification_of_doctors(qualification_id, doctor_id) VALUES (5,6);
INSERT INTO qualification_of_doctors(qualification_id, doctor_id) VALUES (2,7);
INSERT INTO qualification_of_doctors(qualification_id, doctor_id) VALUES (5,8);
INSERT INTO qualification_of_doctors(qualification_id, doctor_id) VALUES (1,9);
INSERT INTO qualification_of_doctors(qualification_id, doctor_id) VALUES (1,10);

INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (5,1,'2014-04-26');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (6,1,'2016-03-11');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (3,2,'2016-09-26');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (7,3,'2017-03-12');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (7,4,'2016-06-25');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (1,5,'2017-06-02');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (2,6,'2018-12-17');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (4,7,'2014-08-13');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (6,7,'2016-06-16');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (3,8,'2019-05-31');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (4,8,'2018-04-16');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (1,9,'2018-10-26');
INSERT INTO retraining_of_doctors(retraining_id, doctor_id) VALUES (7,10,'2015-01-16');

