CREATE DATABASE IF NOT EXISTS student_success_db;
USE student_success_db ;

CREATE TABLE specialty (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  scholarship DOUBLE NULL DEFAULT 0,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE student_success_db.group (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  enter_year INT NULL DEFAULT 0,
  group_code INT NULL DEFAULT 0,
  specialty_id INT NOT NULL,
  PRIMARY KEY (id, specialty_id),
  INDEX fk_group_specialty1_idx (specialty_id ASC) VISIBLE,
  CONSTRAINT fk_group_specialty1
    FOREIGN KEY (specialty_id)
    REFERENCES specialty (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE student (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  middle_name VARCHAR(20) NULL DEFAULT NULL,
  birthday DATE NULL,
  adress MEDIUMTEXT NULL,
  photo BLOB NULL,
  biography LONGTEXT NULL,
  rating DOUBLE NULL DEFAULT 0,
  scholarship VARCHAR(5) NULL DEFAULT 'no',
  group_id INT NOT NULL,
  PRIMARY KEY (id, group_id),
  INDEX fk_student_group_idx (group_id ASC) VISIBLE,
  CONSTRAINT fk_student_group
    FOREIGN KEY (group_id)
    REFERENCES student_success_db.group (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE lecturer (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE subject (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  is_compl VARCHAR(5) NULL DEFAULT 'no',
  type_of_exam VARCHAR(30) NULL DEFAULT '-',
  numb_of_sem VARCHAR(45) NULL DEFAULT '-',
  model1_res INT NULL DEFAULT 0,
  model2_res INT NULL DEFAULT 0,
  grade_100 INT NULL DEFAULT 0,
  grade_5 INT NULL DEFAULT 0,
  lecturer_id INT NOT NULL,
  PRIMARY KEY (id, lecturer_id),
  INDEX fk_subject_lecturer1_idx (lecturer_id ASC) VISIBLE,
  CONSTRAINT fk_subject_lecturer1
    FOREIGN KEY (lecturer_id)
    REFERENCES lecturer (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE student_has_subject (
  student_id INT NOT NULL,
  student_group_id INT NOT NULL,
  subject_id INT NOT NULL,
  PRIMARY KEY (student_id, student_group_id, subject_id),
  INDEX fk_student_has_subject_subject1_idx (subject_id ASC) VISIBLE,
  INDEX fk_student_has_subject_student1_idx (student_id ASC, student_group_id ASC) VISIBLE,
  CONSTRAINT fk_student_has_subject_student1
    FOREIGN KEY (student_id , student_group_id)
    REFERENCES student (id , group_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_student_has_subject_subject1
    FOREIGN KEY (subject_id)
    REFERENCES subject (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#---student------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into student values(1, 'Orest', 'Troskiy', 'Maryanovich', '1998-05-15', 'Lviv', 0, 'no', '15', 'Yes', 1);
insert into student values(2, 'Sergiy', 'Stefanchuk', 'Vitaliyovich', '1997-10-27', 'Ternopil', 0, 'no', '5', 'Yes', 2);
insert into student values(3, 'Andriy', 'Halan', 'Mykolaovych', '1996-06-20', 'Kyiv', 0, 'no', '18', 'Yes', 3);
insert into student values(4, 'Andriy', 'Semenov', 'Mykolaovych', '1998-11-30', 'Lutsk', 0, 'no', '45', 'No', 1);
insert into student values(5, 'Anna', 'Makovey', 'Vasylivna', '1998-02-03', 'Lviv', 0, 'no', '1', 'Yes', 1);

#---subject------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into subject values(1, 'Data Base', 'yes', 'exam', '1', 35, 40, 75, 4, 1);
insert into subject values(2, 'Math', 'yes', 'exam', '1', 15, 40, 55, 3, 2);
insert into subject values(3, 'Economy', 'yes', 'exam', '1', 40, 45, 85, 4, 3);
insert into subject values(4, 'Filosophy', 'yes', 'zalik', '1', 50, 40, 90, 5, 4);

#---group------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into student_success_db.group values(1, 'KI-35', 2017, 1245, 1);
insert into student_success_db.group values(2, 'KN-20', 2018, 3548, 2);
insert into student_success_db.group values(3, 'PI-41', 2016, 1465, 3);

#---lecturer------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into lecturer values(1, 'Oryshchin O.V.');
insert into lecturer values(2, 'Dunets B.V.');
insert into lecturer values(3, 'Shologon O.A.');
insert into lecturer values(4, 'Nohal M.A.');
insert into lecturer values(5, 'Vavruk K.A.');

#---specialty------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into specialty values(1, 'Mathematics', 1200);
insert into specialty values(2, 'Informatics', 1400);
insert into specialty values(3, 'Computer Science', 1110);

#---student_has_subject------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into student_has_subject value(1, 1, 1);
insert into student_has_subject value(2, 2, 2);
insert into student_has_subject value(3, 2, 3);
insert into student_has_subject value(4, 3, 1);
insert into student_has_subject value(5, 1, 1);