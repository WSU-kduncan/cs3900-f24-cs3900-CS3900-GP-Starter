CREATE DATABASE IF NOT EXISTS shelter;

USE shelter;

--Pets
--
DROP TABLE IF EXISTS shelter.pets;

--Create Table
CREATE TABLE pets
(
	 pet_ID		INT		NOT NULL	AUTO_INCREMENT	COMMENT 'identifying number for pet' 
	,name		VARCHAR(35)     NOT NULL 			COMMENT 'name of the pet'
	,species        VARCHAR(15)     NOT NULL			COMMENT 'species of the animal'
	,breed          VARCHAR(25)     NOT NULL 			COMMENT 'Breed of the animal'
	,age            SMALLINT        NOT NULL 			COMMENT 'animals age in terms of years'
	,status         VARCHAR(15)     DEFAULT 'Not Adopted' CONSTRAINT chk_pet_status CHECK (status IN ('Not Adopted', 'Adopted')) 	COMMENT 'Animals adoptions status'

	,PRIMARY KEY (pet_ID) 						COMMENT 'Pet identification number that is the primary key'
)
COMMENT 'Pets'
;

--Adopters
--
DROP  TABLE IF EXISTS shelter.adopter;

--CREATE Table
CREATE TABLE adopters
(
	 adopter_ID	INT             NOT NULL	AUTO_INCREMENT 	COMMENT 'adopter identification number'
	,first_name     VARCHAR(35)     NOT NULL 			COMMENT 'the first name of the adopter'
	,last_name      VARCHAR(35)     NOT NULL 			COMMENT 'the last name of the adopter'
	,email          VARCHAR(128)    NOT NULL 			COMMENT 'the email of the adopter'
	,phone         	CHAR(10)	NOT NULL 			COMMENT 'the phone number of the adopter'

	,PRIMARY KEY (adopter_ID)					COMMENT 'the ID number of adopters is the primary key'
)
COMMENT 'Adopters'
;

--Staff
--
DROP  TABLE IF EXISTS shelter.staff;

--CREATE Table
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

--Adoption Application
--
DROP TABLE IF EXISTS shelter.adoption_application;

--CREATE Table
CREATE TABLE adoption_applications
(
	 application_ID		INT     	NOT NULL	IDENTITY	AUTO_INCREMENT	COMMENT 'Application ID Number'
	,pet_ID               	INT     	NOT NULL					COMMENT 'Pet ID Number'
	,adopter_ID           	INT     	NOT NULL					COMMENT 'Adopter ID Number'
	,staff_ID             	INT     	NOT NULL					COMMENT 'Staff ID Number'
	,date                 	DATETIME 							COMMENT 'Date of Application'
	,status               	VARCHAR(15) 	DEFAULT 'Pending' CONSTRAINT chk_application_status CHECK (Status in ('Pending', 'Approved', 'Rejected'))	COMMENT 'Status of Application'

	,PRIMARY KEY (application_ID)								COMMENT 'the ID number of the application is the primary key'
)
COMMENT 'Adoption Application'
;

ALTER TABLE adoption_applications
	ADD CONSTRAINT	adoption_applications_pet_fk	COMMENT 'Constraint for adoption_applications table'
	FOREIGN KEY	(pet_ID)			COMMENT 'pet_ID foreign key in adoptions_application'
	REFERENCES      pets (pet_ID) 			COMMENT 'reference to pets table primary key'
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE adoption_applications
	ADD CONSTRAINT	adoption_applications_adopter_fk	COMMENT 'Constraint for adoption_applications table'
	FOREIGN KEY     (adopter_ID)				COMMENT 'adopter_ID foreign key in adoption_applications table'
	REFERENCES      adopters (adopter_ID)			COMMENT 'reference to adopters table primary key'
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE adoption_applications
	ADD CONSTRAINT	adoption_applications_staff_fk	COMMENT 'Constraint for adoption_applications table'
	FOREIGN KEY     (staff_ID)			COMMENT 'staff_ID foreign key in adoption_applications'
	REFERENCES      staff (staff_ID)		COMMENT 'reference to staff table primary key'
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

--Inventory
--
DROP TABLE IF EXISTS shelter.inventory;

--Create Table
CREATE TABLE Inventory
(
	 item_ID        INT		IDENTITY	AUTO_INCREMENT	COMMENT 'Item ID Number'
	,quantity       SMALLINT	 	 			COMMENT 'Quantity of Items'
	,locations      VARCHAR(50) 	 	 			COMMENT 'Location of Item'			
	,cost           DECIMAL(5,2)	 	 			COMMENT 'Cost of Item'
	,expiration     DATETIME	 	 			COMMENT 'Expiration Date of Item'
	,staff_ID	INT		NOT NULL	 		COMMENT 'Staff ID Number'
	,PRIMARY KEY (item_ID)
)
COMMENT 'Inventory'
;

ALTER TABLE inventory
	ADD CONSTRAINT	inventory_staff_fk	COMMENT 'constraint for inventory table'
	FOREIGN KEY     (staff_ID)		COMMENT 'staff_ID foreign key in inventory'
	REFERENCES      staff (staff_ID)	COMMENT 'reference to staff table primary key'
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;			
