CREATE DATABASE IF NOT EXISTS shelter;

USE shelter;

-- Pets
-- DROP TABLE IF EXISTS shelter.pet;

--Create Table
CREATE TABLE pet
(
	 pet_ID		INT		NOT NULL	AUTO_INCREMENT	COMMENT 'identifying number for pet' 
	,pet_name	VARCHAR(35)     NOT NULL 			COMMENT 'name of the pet'
	,species        VARCHAR(15)     NOT NULL			COMMENT 'species of the animal'
	,breed          VARCHAR(25)     NOT NULL 			COMMENT 'Breed of the animal'
	,sex		VARCHAR(7)	NOT NULL			COMMENT 'Sex of the animal'
	,weight		DECIMAL(5,2)	NOT NULL			COMMENT 'Weight of the animal'
	,intake_date	DATE 		NOT NULL			COMMENT 'Date pet joined shelter'
	,age            SMALLINT        NOT NULL 			COMMENT 'animals age in terms of years'
	,pet_status     VARCHAR(15)     DEFAULT 'Not Adopted' 		COMMENT 'Animals adoption status' 
	,CONSTRAINT chk_pet_status CHECK (pet_status in ('Not Adopted', 'Adopted')) 
	,PRIMARY KEY (pet_ID) 						COMMENT 'Pet identification number that is the primary key'
)
COMMENT 'Pet'
;

-- Adopters
-- DROP  TABLE IF EXISTS shelter.adopter;

-- CREATE Table
CREATE TABLE adopter
(
	 adopter_ID	INT             NOT NULL	AUTO_INCREMENT 	COMMENT 'adopter identification number'
	,first_name     VARCHAR(35)     NOT NULL 			COMMENT 'the first name of the adopter'
	,last_name      VARCHAR(35)     NOT NULL 			COMMENT 'the last name of the adopter'
	,email          VARCHAR(128)    NOT NULL 			COMMENT 'the email of the adopter'
	,phone         	CHAR(10)	NOT NULL 			COMMENT 'the phone number of the adopter'

	,PRIMARY KEY (adopter_ID)					COMMENT 'the ID number of adopters is the primary key'
)
COMMENT 'Adopter'
;

-- Staff
-- DROP  TABLE IF EXISTS shelter.staff;

-- CREATE Table
CREATE TABLE staff
(
	 staff_ID       INT		NOT NULL	AUTO_INCREMENT	COMMENT 'Staff ID Number'
	,first_name     VARCHAR(35)     NOT NULL	 		COMMENT 'Staff First Name'
	,last_name      VARCHAR(35)     NOT NULL	 		COMMENT 'Staff Last Nam'
	,position       VARCHAR(50)     NOT NULL	 		COMMENT 'Staff Position'
	,phone          CHAR(10)        NOT NULL	 		COMMENT 'Staff Phone Number'

	,PRIMARY KEY (staff_ID)						COMMENT 'the ID number of staff is the primary key'
)
COMMENT 'Staff'
;

-- Adoption Application
--
DROP TABLE IF EXISTS shelter.adoption_application;

-- CREATE Table
-- CREATE Table
CREATE TABLE adoption_application
(
	  -- 
	 application_id	INT             NOT NULL	AUTO_INCREMENT 	--  'adopter identification number'
	,pet_ID               	INT     	NOT NULL					--  'Pet ID Number'
	,adopter_ID           	INT     	NOT NULL					--  'Adopter ID Number'
	,staff_ID             	INT     	NOT NULL					--  'Staff ID Number'
	,application_date                 	DATE 							--  'Date of Application'
	,application_status               	VARCHAR(15) 	DEFAULT 'Pending' 				--  'Status of Application'
	,CONSTRAINT chk_application_status CHECK (application_status in ('Pending', 'Approved', 'Rejected'))

	,PRIMARY KEY (application_ID)								--  'the ID number of the application is the primary key'
)
--  'Adoption Application'
;

ALTER TABLE adoption_application
	ADD CONSTRAINT	adoption_application_pet_fk	COMMENT 'Constraint for adoption_applications table'
	FOREIGN KEY	(pet_ID)			COMMENT 'pet_ID foreign key in adoptions_application'
	REFERENCES      pet (pet_ID) 			COMMENT 'reference to pets table primary key'
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE adoption_application
	ADD CONSTRAINT	adoption_application_adopter_fk	COMMENT 'Constraint for adoption_applications table'
	FOREIGN KEY     (adopter_ID)				COMMENT 'adopter_ID foreign key in adoption_applications table'
	REFERENCES      adopter (adopter_ID)			COMMENT 'reference to adopters table primary key'
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE adoption_application
	ADD CONSTRAINT	adoption_application_staff_fk	COMMENT 'Constraint for adoption_applications table'
	FOREIGN KEY     (staff_ID)			COMMENT 'staff_ID foreign key in adoption_applications'
	REFERENCES      staff (staff_ID)		COMMENT 'reference to staff table primary key'
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

		
