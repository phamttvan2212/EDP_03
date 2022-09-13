DROP DATABASE IF exists testing_system_1;
CREATE DATABASE testing_system_1 ;
USE testing_system_1;

CREATE TABLE department (
department_id 	 	INT,
department_name 	VARCHAR(50)
);

CREATE TABLE `position` (
position_id			 INT,
position_name		 VARCHAR(50)
);
CREATE TABLE `account` (
account_id			 INT,
email  				 VARCHAR(50),
user_name			 VARCHAR(50),
full_name			 VARCHAR (50),
department_id		 INT,
position_id			 INT,
crear_date			 DATE
);
CREATE TABLE `group`(
group_id			INT,
group_name			VARCHAR(100),
creator_id 			INT,
create_date 		DATE
);

CREATE TABLE type_quesyion (
type_id  			INT,
type_name			VARCHAR(50)
); 
CREATE TABLE category_question (
category_id 		INT,
category_name 		VARCHAR(50)
);

CREATE TABLE question (
question_id 		INT,
content   			VARCHAR(1000),
category_id  		INT,
type_id  			INT,
creator_id 			VARCHAR(100),
create_date 		DATE
);

CREATE TABLE answer (
answer_id 			INT,
content 			VARCHAR(120),
question_id 		INT,
is_correct   		BOOLEAN
);

CREATE TABLE exam (
exam_id 			INT,
`code` 				VARCHAR(100),
title 				VARCHAR(100),
category_id  		INT,
duration  			TIME,
creator_id 			INT,
create_date DATE
);

CREATE TABLE ExamQuestion (
exam_id  			INT,
question_id  		INT
);

