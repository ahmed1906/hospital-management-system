CREATE TABLE hospital (
hospital_id INT AUTO_INCREMENT PRIMARY KEY,
address VARCHAR(100) ,
name VARCHAR(40) ,
city VARCHAR(40)
);


CREATE TABLE staff (
staff_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(40),
last_name VARCHAR(40),
sex CHAR(1)
);

CREATE TABLE doctor (
doctor_id INT AUTO_INCREMENT PRIMARY KEY,
staff_id INT,
salary INT,
phone VARCHAR(20),
FOREIGN KEY(staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE
);

CREATE TABLE nurse (
id INT AUTO_INCREMENT PRIMARY KEY,
staff_id INT,
salary INT,
phone VARCHAR(20),
FOREIGN KEY(staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE 
);
 

CREATE TABLE patient (
patient_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(40),
last_name VARCHAR(40),
address VARCHAR(100),
phone VARCHAR(20), 
sex VARCHAR(1),
registration_id INT
);


CREATE TABLE registration (
registration_id INT AUTO_INCREMENT PRIMARY KEY,
assurance INT,
age INT,
patient_id INT,
FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE
);

ALTER TABLE patient
ADD FOREIGN KEY(registration_id) 
REFERENCES registration(registration_id) 
ON DELETE SET NULL;



CREATE TABLE appointment (
app_date DATE,
app_time TIME,
duration INT,
reason VARCHAR(200),
registration_id INT, 
doctor_id INT,
FOREIGN KEY(registration_id) REFERENCES registration(registration_id) ON DELETE CASCADE,
FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id) ON DELETE CASCADE
);



CREATE TABLE med_record(
med_record_id INT AUTO_INCREMENT PRIMARY KEY,
record_date DATE,
diagnosis VARCHAR(200),
drugs VARCHAR(100),
doctor_id INT,
registration_id INT, 
FOREIGN KEY(registration_id) REFERENCES registration(registration_id) ON DELETE SET NULL,
FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id) ON DELETE SET NULL
);

CREATE TABLE administration (
letter_id INT AUTO_INCREMENT PRIMARY KEY,
the_input VARCHAR(100),
med_record_id INT,
FOREIGN KEY(med_record_id) REFERENCES med_record(med_record_id) ON DELETE SET NULL
);

CREATE TABLE health_office (
reception INT,
administration_letter_id INT,
FOREIGN KEY(administration_letter_id) REFERENCES administration(letter_id) ON DELETE SET NULL 
);

INSERT INTO hospital(address, name, city) VALUES ("408/1 Ghorpadi Peth, Ekbote Colony, Shankarsheth Road, Opposite Pournima Towers" , "Sharda Clinic", "Pune")
INSERT INTO hospital(address, name, city) VALUES ("983/3, Opposite Sarasbagh, Friday Peth, " , "Harjeevan Hospital", "Pune")
INSERT INTO hospital(address, name, city) VALUES ("25 Hackett Boulevard" ,"AlbanyMedicalCenter", "Albany")
INSERT INTO hospital(address, name, city) VALUES ("600NorthernBoulevard" ,"AlbanyMedicalCenter", "Albany")
INSERT INTO hospital(address, name, city) VALUES ("Cuba Memorial Hospital", "140WestMainStreet", "Cuba" )

INSERT INTO staff(first_name, last_name, sex) VALUES ("Diane", "Sobkowicz", "F")
INSERT INTO staff(first_name, last_name, sex) VALUES ("Alfred", "Petrocelli", "M")
INSERT INTO staff(first_name, last_name, sex) VALUES ("Malie", "Kalena", "F")
INSERT INTO staff(first_name, last_name, sex) VALUES ("Shane", "Diarmaid", "M")

INSERT INTO doctor(staff_id, salary, phone) VALUES (1, 250000, 8316471123)
INSERT INTO doctor(staff_id, salary, phone) VALUES (2, 250000, 7186488877)
INSERT INTO nurse(staff_id, salary, phone) VALUES (3, 75000, 8089494321);
INSERT INTO nurse(staff_id, salary, phone) VALUES (4, 100000, +525551305300)


INSERT INTO patient(first_name, last_name, address, phone, sex) VALUES ("Mohamad", "Abdelrahman", "Street name", "062555555", "M")

INSERT INTO registration(assurance, age, patient_id) VALUES (200, 50, 1);

UPDATE patient SET registration_id = 1 WHERE patient_id = 1;

DELETE FROM patient WHERE patient_id = 2;

INSERT INTO appointment(app_date, app_time, duration, reason, registration_id, doctor_id) VALUES ("2022-02-22", "10:22:00", "30", "Full Check up", 1, 1);

INSERT INTO med_record(record_date, diagnosis, drugs, doctor_id, registration_id)  
VALUES ("2022-01-22", "No issues in his health", "Vitamins", 1, 1) 

INSERT INTO administration(the_input, med_record_id) VALUES ("Nothing wrong to mention about the patient", 1)
INSERT INTO administration VALUES (1,"Nothing wrong to mention about the patient", 1)

INSERT INTO health_office(administration_letter_id) VALUES (1)


SELECT * FROM hospital;
SELECT * FROM staff;
SELECT * FROM nurse;
SELECT * FROM doctor;
SELECT * FROM appointment;
SELECT * FROM registration;
SELECT * FROM patient;
SELECT * FROM administration;
SELECT * FROM health_office;
SELECT * FROM med_record; 


