CREATE TABLE `hs_hr_education_type` (
`edu_type_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`edu_type_name` VARCHAR( 200 ) NULL DEFAULT NULL ,
`edu_type_name_si` VARCHAR( 200 ) NULL DEFAULT NULL ,
`edu_type_name_ta` VARCHAR( 200 ) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `hs_hr_edu_subject` (
`subj_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`edu_type_id` INT NULL DEFAULT NULL ,
`subj_name` VARCHAR( 200 ) NULL DEFAULT NULL ,
`subj_name_si` VARCHAR( 200 ) NULL DEFAULT NULL ,
`subj_name_ta` VARCHAR( 200 ) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

ALTER TABLE `hs_hr_edu_subject`
       	ADD CONSTRAINT `hs_hr_education_type_edu_type_id`
	FOREIGN KEY (`edu_type_id`)
        REFERENCES `hs_hr_education_type`(`edu_type_id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;

CREATE TABLE `hs_hr_edu_year_grade` (
`grd_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`edu_type_id` INT NULL DEFAULT NULL ,
`grd_year` INT NULL DEFAULT NULL ,
`grd_name` VARCHAR( 200 ) NULL DEFAULT NULL ,
`grd_desc` VARCHAR( 200 ) NULL DEFAULT NULL ,
`grd_mark` VARCHAR( 200 ) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

ALTER TABLE `hs_hr_edu_year_grade`
       	ADD CONSTRAINT `education_type_year_grade_type_id`
	FOREIGN KEY (`edu_type_id`)
        REFERENCES `hs_hr_education_type`(`edu_type_id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;

CREATE TABLE `hs_hr_edu_emp_head` (
`eduh_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`edu_type_id` INT NULL DEFAULT NULL ,
`emp_number` INT(7) NULL DEFAULT NULL ,
`grd_year` INT(4) NULL DEFAULT NULL ,
`eduh_indexno` VARCHAR( 200 ) NULL DEFAULT NULL ,
`eduh_institute` VARCHAR( 200 ) NULL DEFAULT NULL 
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

ALTER TABLE `hs_hr_edu_emp_head`
       	ADD CONSTRAINT `hs_hr_edu_emp_head_year_grade_type_id`
	FOREIGN KEY (`edu_type_id`)
        REFERENCES `hs_hr_education_type`(`edu_type_id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;
ALTER TABLE `hs_hr_edu_emp_head`
       	ADD CONSTRAINT `hs_hr_edu_emp_head_hs_hr_employee`
	FOREIGN KEY (`emp_number`)
        REFERENCES `hs_hr_employee`(`emp_number`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;

CREATE TABLE `hs_hr_edu_emp_detail` (
`edud_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`eduh_id` INT NULL DEFAULT NULL ,
`subj_id` INT NULL DEFAULT NULL ,
`grd_id` INT NULL DEFAULT NULL ,
`lang_code` VARCHAR( 13 ) NULL DEFAULT NULL ,
`edud_comment` VARCHAR( 200 ) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

ALTER TABLE `hs_hr_edu_emp_detail`
       	ADD CONSTRAINT `hs_hr_edu_emp_detail_hs_hr_edu_emp_head`
	FOREIGN KEY (`eduh_id`)
        REFERENCES `hs_hr_edu_emp_head`(`eduh_id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;

ALTER TABLE `hs_hr_edu_emp_detail`
       	ADD CONSTRAINT `hs_hr_edu_emp_detail_hs_hr_edu_subject`
	FOREIGN KEY (`subj_id`)
        REFERENCES `hs_hr_edu_subject`(`subj_id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;
ALTER TABLE `hs_hr_edu_emp_detail`
       	ADD CONSTRAINT `hs_hr_edu_year_grade_hs_hr_edu_emp_head`
	FOREIGN KEY (`grd_id`)
        REFERENCES `hs_hr_edu_year_grade`(`grd_id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;
ALTER TABLE `hs_hr_edu_emp_detail`
       	ADD CONSTRAINT `hs_hr_edu_year_grade_hs_hr_language`
	FOREIGN KEY (`lang_code`)
        REFERENCES `hs_hr_language`(`lang_code`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;

ALTER TABLE `hs_hr_edu_emp_head` ADD `eduh_zscorgdp` FLOAT NULL DEFAULT NULL ,
ADD `eduh_slrank` INT NULL DEFAULT NULL ;

UPDATE `hs_hr_sm_mnuitem` SET `sm_mnuitem_webpage_url` = './symfony/web/index.php/pim/EmpEducation' WHERE `hs_hr_sm_mnuitem`.`sm_mnuitem_id` =2015;

UPDATE `hs_hr_sm_mnuitem` SET `sm_mnuitem_dependency` = 'deleteEmpEducation,saveEmpEducation,LoadSubjects,LoadGrade' WHERE `hs_hr_sm_mnuitem`.`sm_mnuitem_id` =2015;

UPDATE `hs_hr_sm_mnuitem` SET `sm_mnuitem_webpage_url` = './symfony/web/index.php/admin/EducationType',
`sm_mnuitem_dependency` = 'SaveEducationType,DeleteEducationType' WHERE `hs_hr_sm_mnuitem`.`sm_mnuitem_id` =1010;

INSERT INTO  `hs_hr_sm_mnuitem` (`sm_mnuitem_id` ,`sm_mnuitem_name` ,`sm_mnuitem_name_si` ,`sm_mnuitem_name_ta` ,`sm_mnuitem_parent` ,`sm_mnuitem_level` ,`sm_mnuitem_webpage_url` ,`sm_mnuitem_position` ,`mod_id` ,
`sm_mnuitem_dependency`)
VALUES (null ,  'Education Subject',  'විෂයන්',  'Education Subject ta',  '1009',  '2',  './symfony/web/index.php/admin/EducationSubject',  '01.03.05',  'MOD001',  'SaveEducationSubject,DeleteEducationSubject,UpdateEducationSubject');

INSERT INTO `hs_hr_formlock_details` (`frmlock_id`, `mod_id`, `con_table_name`, `con_activity_id`, `frmlock_form_name`, `frmlock_form_name_si`, `frmlock_form_name_ta`) 
VALUES (NULL, 'MOD001', ' hs_hr_edu_subject', '1', 'Education Subject', 'Education Subject si', 'Education Subject ta');

INSERT INTO `hs_hr_formlock_details` (`frmlock_id`, `mod_id`, `con_table_name`, `con_activity_id`, `frmlock_form_name`, `frmlock_form_name_si`, `frmlock_form_name_ta`) 
VALUES (NULL, 'MOD001', ' hs_hr_edu_year_grade', '1', 'Education Year Grade', 'Education Year Grade si', 'Education Year Grade ta');

INSERT INTO  `hs_hr_sm_mnuitem` (`sm_mnuitem_id` ,`sm_mnuitem_name` ,`sm_mnuitem_name_si` ,`sm_mnuitem_name_ta` ,`sm_mnuitem_parent` ,`sm_mnuitem_level` ,`sm_mnuitem_webpage_url` ,`sm_mnuitem_position` ,`mod_id` ,
`sm_mnuitem_dependency`)
VALUES (null ,  'Education Grade Year',  'වාර්ෂික විෂයන්',  'Education Grade Year ta',  '1009',  '2',  './symfony/web/index.php/admin/EducationYearGrade',  '01.03.06',  'MOD001',  'SaveEducationYearGrade,DeleteEducationYearGrade,UpdateEducationYearGrade');

-- EB Exams 2012-12-11
CREATE TABLE `hs_hr_eb_subject` (
`ebs_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`ebs_name` VARCHAR( 200 ) NULL DEFAULT NULL ,
`ebs_name_si` VARCHAR( 200 ) NULL DEFAULT NULL ,
`ebs_name_ta` VARCHAR( 200 ) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `hs_hr_eb_master_head` (
`ebh_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`grade_code` INT(4) NULL DEFAULT NULL ,
`ebh_exp_year` INT NULL DEFAULT NULL ,
`ebh_exam_name` VARCHAR( 200 ) NULL DEFAULT NULL ,
`ebh_exam_name_si` VARCHAR( 200 ) NULL DEFAULT NULL ,
`ebh_exam_name_ta` VARCHAR( 200 ) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

ALTER TABLE `hs_hr_eb_master_head`
       	ADD CONSTRAINT `hs_hr_eb_master_head_edu_grade_code`
	FOREIGN KEY (`grade_code`)
        REFERENCES `hs_hr_grade`(`grade_code`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;

CREATE TABLE `hs_hr_eb_master_detail` (
`ebd_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`ebh_id` INT NULL DEFAULT NULL ,
`ebs_id` INT NULL DEFAULT NULL ,
`ebd_pass_mark` INT NULL DEFAULT NULL 
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

ALTER TABLE `hs_hr_eb_master_detail`
       	ADD CONSTRAINT `hs_hr_eb_master_head_ebh_id`
	FOREIGN KEY (`ebh_id`)
        REFERENCES `hs_hr_eb_master_head`(`ebh_id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;
ALTER TABLE `hs_hr_eb_master_detail`
       	ADD CONSTRAINT `hs_hr_eb_subject_ebs_id`
	FOREIGN KEY (`ebs_id`)
        REFERENCES `hs_hr_eb_subject`(`ebs_id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;

CREATE TABLE `hs_hr_eb_employee` (
`ebe_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`emp_number` INT(7) NULL DEFAULT NULL ,
`ebh_id` INT NULL DEFAULT NULL ,
`ebd_id` INT NULL DEFAULT NULL ,
`ebe_marks` INT NULL DEFAULT NULL ,
`ebe_start_date` date DEFAULT NULL,
`ebe_end_date` date DEFAULT NULL,
`ebe_complete_date` date DEFAULT NULL,
`ebe_flg_pass` INT NULL DEFAULT NULL ,
`ebe_attepmt` INT NULL DEFAULT NULL ,
`ebe_comment` VARCHAR( 200 ) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

ALTER TABLE `hs_hr_eb_employee`
       	ADD CONSTRAINT `hs_hr_eb_employee_hs_hr_employee`
	FOREIGN KEY (`emp_number`)
        REFERENCES `hs_hr_employee`(`emp_number`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;
ALTER TABLE `hs_hr_eb_employee`
       	ADD CONSTRAINT `hs_hr_eb_employee_ebh_id`
	FOREIGN KEY (`ebh_id`)
        REFERENCES `hs_hr_eb_master_head`(`ebh_id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;
ALTER TABLE `hs_hr_eb_employee`
       	ADD CONSTRAINT `hs_hr_eb_employee_ebd_id`
	FOREIGN KEY (`ebd_id`)
        REFERENCES `hs_hr_eb_master_detail`(`ebd_id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;

UPDATE `hs_hr_sm_mnuitem` SET `sm_mnuitem_webpage_url` = './symfony/web/index.php/pim/Emp_EB_Exam',
`sm_mnuitem_dependency` = 'loadEmp_EB_Exam,deleteEmp_EB_Exam,saveEmp_EB_Exam' WHERE `hs_hr_sm_mnuitem`.`sm_mnuitem_id` =2019;

UPDATE `hs_hr_sm_mnuitem` SET `sm_mnuitem_dependency` = 'loadEmp_EB_Exam,deleteEmp_EB_Exam,saveEmp_EB_Exam,LoadEMPEBSubjects,LoadEMPEBSubjectHistory' WHERE `hs_hr_sm_mnuitem`.`sm_mnuitem_id` = 2019;

INSERT INTO `hs_hr_formlock_details` (`frmlock_id`, `mod_id`, `con_table_name`, `con_activity_id`, `frmlock_form_name`, `frmlock_form_name_si`, `frmlock_form_name_ta`) 
VALUES (NULL, 'MOD002', 'hs_hr_eb_employee', '1', 'Employee EB Exam', 'Employee EB Exam si', 'Employee EB Exam ta');

INSERT INTO `hs_hr_formlock_details` (`frmlock_id`, `mod_id`, `con_table_name`, `con_activity_id`, `frmlock_form_name`, `frmlock_form_name_si`, `frmlock_form_name_ta`) 
VALUES (NULL, 'MOD001', 'hs_hr_eb_master_head', '1', 'EB Exam', 'EB Exam si', 'EB Exam ta');

INSERT INTO `hs_hr_formlock_details` (`frmlock_id`, `mod_id`, `con_table_name`, `con_activity_id`, `frmlock_form_name`, `frmlock_form_name_si`, `frmlock_form_name_ta`) 
VALUES (NULL, 'MOD001', 'hs_hr_eb_subject', '1', 'EB Exam Subject', 'EB Exam Subject si', 'EB Exam Subject ta');

INSERT INTO  `hs_hr_sm_mnuitem` (`sm_mnuitem_id` ,`sm_mnuitem_name` ,`sm_mnuitem_name_si` ,`sm_mnuitem_name_ta` ,`sm_mnuitem_parent` ,`sm_mnuitem_level` ,`sm_mnuitem_webpage_url` ,`sm_mnuitem_position` ,`mod_id` ,
`sm_mnuitem_dependency`)
VALUES (null ,  'EB Exam',  'ඊ.බී විභාග',  'EB Exam ta',  '1009',  '2',  './symfony/web/index.php/admin/EB_Exam',  '01.03.07',  'MOD001',  'SaveEB_Exam,DeleteEB_Exam');

INSERT INTO  `hs_hr_sm_mnuitem` (`sm_mnuitem_id` ,`sm_mnuitem_name` ,`sm_mnuitem_name_si` ,`sm_mnuitem_name_ta` ,`sm_mnuitem_parent` ,`sm_mnuitem_level` ,`sm_mnuitem_webpage_url` ,`sm_mnuitem_position` ,`mod_id` ,
`sm_mnuitem_dependency`)
VALUES (null ,  'EB Exam Subject',  'ඊ.බී විභාග',  'EB Exam Subject ta',  '1009',  '2',  './symfony/web/index.php/admin/EBSubject',  '01.03.08',  'MOD001',  'SaveEBSubject,DeleteEBSubject');

-- 2012-01-17
INSERT INTO `hs_hr_religion` (`rlg_code` ,`rlg_name` ,`rlg_name_si` ,`rlg_name_ta`)
VALUES (NULL , 'Christian', 'ක්‍රිස්තියානි', 'Christian_ta');

ALTER TABLE `hs_hr_rec_candidate` CHANGE `rec_can_candidate_name` `rec_can_candidate_name` VARCHAR( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

ALTER TABLE `hs_hr_rec_candidate` ADD `rec_can_candidate_name_si` VARCHAR( 200 ) NULL DEFAULT NULL AFTER `rec_can_candidate_name` ,
ADD `rec_can_candidate_name_ta` VARCHAR( 200 ) NULL DEFAULT NULL AFTER `rec_can_candidate_name_si` ;

ALTER TABLE `hs_hr_rec_candidate` ADD `rec_can_address_si` VARCHAR( 200 ) NULL DEFAULT NULL AFTER `rec_can_address` ,
ADD `rec_can_address_ta` VARCHAR( 200 ) NULL DEFAULT NULL AFTER `rec_can_address_si`; 





