DROP DATABASE IF EXISTS  testing_system_1;
CREATE DATABASE testing_system_1 ;
USE testing_system_1;

CREATE TABLE department(
department_id 	 	INT UNSIGNED AUTO_INCREMENT ,
department_name 	VARCHAR(30),
PRIMARY KEY (department_id )
);
-- SELECT* FROM department ;
-- INSERT INTO department(department_id,department_name)VALUES(1,' Marketing'); 
-- INSERT INTO department(department_name)VALUES('Human Resources'); -- P.nhân sự
-- INSERT INTO department(department_name)VALUES('Chaiman'); -- chủ tịch
-- INSERT INTO department(department_name)VALUES('Accounting'); -- kế toán
-- INSERT INTO department(department_name)VALUES('Administation'); -- P hành chính 

CREATE TABLE `position`(
position_id			 INT UNSIGNED AUTO_INCREMENT,
position_name		 ENUM ('dev','test','Scrum Master','PM' ),
PRIMARY KEY (position_id)
);


CREATE TABLE `account`(
account_id			 INT UNSIGNED AUTO_INCREMENT,
email  				 VARCHAR(70) NOT NULL, 
user_name			 VARCHAR(50),
full_name			 VARCHAR (50),
department_id		 INT UNSIGNED NOT NULL,
position_id			 INT UNSIGNED NOT NULL,
create_date			 DATE,
FOREIGN KEY(department_id) REFERENCES department (department_id),
FOREIGN KEY(position_id) REFERENCES position (position_id),
PRIMARY KEY(account_id)	
);
SELECT* FROM `account` JOIN `position` ON account.position_id = position.position_id;
-- ALTER TABLE `account` MODIFY COLUMN email VARCHAR(70) NOT NULL ;
-- ALTER TABLE `account` ADD NOT NULL(email) ;


-- INSERT INTO `account`(email,user_name,full_name,department_id,position_id,crear_date) VALUES ('phamtvan2212@gmail.com','VÂN','Phạm Thị Thanh Vân',1,1,20220816);
-- INSERT INTO `account`(email,user_name,full_name,department_id,position_id,crear_date) VALUES ('hoang2109@mail.com','HOÀNG','Lê Văn Hoàng',2,3,20210918);
-- INSERT INTO `account`(email,user_name,full_name,department_id,position_id,crear_date) VALUES ('phamtvan2212@gmail.com','VÂN','Phạm Thị Thanh Vân',1,1,20220816);
-- INSERT INTO `account`(email,user_name,full_name,department_id,position_id,crear_date) VALUES ('phamtvan2212@gmail.com','VÂN','Phạm Thị Thanh Vân',1,1,20220816);
-- INSERT INTO `account`(email,user_name,full_name,department_id,position_id,crear_date) VALUES ('phamtvan2212@gmail.com','VÂN','Phạm Thị Thanh Vân',1,1,20220816);


CREATE TABLE `group`(
group_id			INT UNSIGNED AUTO_INCREMENT,
group_name			VARCHAR(50),
creator_id 			INT UNSIGNED NOT NULL,
create_date 		DATE,
PRIMARY KEY (group_id),
FOREIGN KEY(creator_id) REFERENCES `account` (account_id)
);

CREATE TABLE group_account (
group_id INT UNSIGNED,
account_id INT UNSIGNED,
join_date DATE,
FOREIGN KEY (group_id) REFERENCES `group` (group_id),
FOREIGN KEY (account_id) REFERENCES `account` (account_id)
);

CREATE TABLE type_question(
type_id  			INT UNSIGNED AUTO_INCREMENT,
type_name			ENUM( 'Essay', 'Multiple-Choice'),
PRIMARY KEY(type_id)
); 
CREATE TABLE category_question(
category_id 		INT UNSIGNED AUTO_INCREMENT,
category_name 		VARCHAR(50),
PRIMARY KEY(category_id)
);

CREATE TABLE question (
question_id 		INT UNSIGNED AUTO_INCREMENT,
content   			VARCHAR(1000),
category_id  		INT UNSIGNED NOT NULL,
type_id  			INT UNSIGNED,
creator_id 			INT UNSIGNED,
create_date 		DATE,
FOREIGN KEY (creator_id) REFERENCES `account`(account_id),
FOREIGN KEY (category_id) REFERENCES category_question (category_id),
FOREIGN KEY (type_id ) REFERENCES type_question(type_id),
PRIMARY KEY(question_id)
);

CREATE TABLE answer(
answer_id 			INT UNSIGNED AUTO_INCREMENT,
content 			VARCHAR(120),
question_id 		INT UNSIGNED ,
is_correct   		ENUM('ĐÚNG', 'SAI') ,-- BOOLEAR ,
FOREIGN KEY(question_id )REFERENCES question(question_id ),
PRIMARY KEY(answer_id)
);


CREATE TABLE exam (
exam_id 			INT UNSIGNED AUTO_INCREMENT,
code	     		VARCHAR(100),
title 				VARCHAR(100),
category_id  		INT UNSIGNED NOT NULL,
duration  			TIME,
creator_id 			INT UNSIGNED ,
create_date 		DATE,
FOREIGN KEY (category_id)REFERENCES category_question (category_id),
FOREIGN KEY (creator_id) REFERENCES  `account` (account_id),
PRIMARY KEY(exam_id)
);



CREATE TABLE exam_question(
exam_id  			INT UNSIGNED UNIQUE NOT NULL,
question_id  		INT UNSIGNED UNIQUE NOT NULL,
FOREIGN KEY (exam_id) REFERENCES  exam (exam_id),
FOREIGN KEY (question_id) REFERENCES  `question` (question_id)
);

-- INSERT INTO Department  ( department_name) 
-- VALUES(
--						(N'Marketing'		),
--						(N'Sale'				),
--						(N'Sercurity'		),
--						(N'Technical'		),
--						(N'Accounting '		),
--						(N'Director'			);)

