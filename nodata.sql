-- MySQL dump 10.13  Distrib 5.1.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: esm_nodata
-- ------------------------------------------------------
-- Server version	5.1.58-1ubuntu1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hs_hr_atn_clockdown`
--

DROP TABLE IF EXISTS `hs_hr_atn_clockdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_atn_clockdown` (
  `clk_no` varchar(20) NOT NULL,
  `clk_date` date NOT NULL DEFAULT '0000-00-00',
  `clk_time` time NOT NULL DEFAULT '00:00:00',
  `clk_status` varchar(2) DEFAULT NULL,
  `clk_move` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`clk_no`,`clk_date`,`clk_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_atn_clockdown`
--

LOCK TABLES `hs_hr_atn_clockdown` WRITE;
/*!40000 ALTER TABLE `hs_hr_atn_clockdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_atn_clockdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_atn_dailyattendance`
--

DROP TABLE IF EXISTS `hs_hr_atn_dailyattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_atn_dailyattendance` (
  `clk_no` varchar(20) NOT NULL,
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `atn_date` date NOT NULL DEFAULT '0000-00-00',
  `atn_intime` time DEFAULT NULL,
  `atn_outtime` time DEFAULT NULL,
  `atn_latetime` time DEFAULT NULL,
  `atn_earlydeptime` time DEFAULT NULL,
  `dt_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`clk_no`,`atn_date`,`emp_number`),
  KEY `xif1hs_hr_atn_dailyattendance` (`dt_id`),
  KEY `xif2hs_hr_atn_dailyattendance` (`emp_number`),
  KEY `xif3hs_hr_atn_dailyattendance` (`clk_no`),
  CONSTRAINT `hs_hr_atn_dailyattendance_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_atn_dailyattendance_ibfk_2` FOREIGN KEY (`dt_id`) REFERENCES `hs_hr_atn_day_type` (`dt_id`),
  CONSTRAINT `hs_hr_atn_dailyattendance_ibfk_3` FOREIGN KEY (`clk_no`) REFERENCES `hs_hr_atn_clockdown` (`clk_no`),
  CONSTRAINT `hs_hr_atn_dailyattendance_ibfk_4` FOREIGN KEY (`clk_no`) REFERENCES `hs_hr_employee` (`emp_attendance_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_atn_dailyattendance`
--

LOCK TABLES `hs_hr_atn_dailyattendance` WRITE;
/*!40000 ALTER TABLE `hs_hr_atn_dailyattendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_atn_dailyattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_atn_day`
--

DROP TABLE IF EXISTS `hs_hr_atn_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_atn_day` (
  `adt_day` varchar(10) NOT NULL,
  `dt_id` int(4) DEFAULT NULL,
  `adt_intime` time DEFAULT NULL,
  `adt_outtime` time DEFAULT NULL,
  PRIMARY KEY (`adt_day`),
  KEY `xif1hs_hr_atn_day` (`dt_id`),
  CONSTRAINT `hs_hr_atn_day_ibfk_1` FOREIGN KEY (`dt_id`) REFERENCES `hs_hr_atn_day_type` (`dt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_atn_day`
--

LOCK TABLES `hs_hr_atn_day` WRITE;
/*!40000 ALTER TABLE `hs_hr_atn_day` DISABLE KEYS */;
INSERT INTO `hs_hr_atn_day` VALUES ('Friday',1,NULL,NULL),('Monday',1,NULL,NULL),('Saturday',1,NULL,NULL),('Sunday',1,NULL,NULL),('Thursday',1,NULL,NULL),('Tuesday',1,NULL,NULL),('Wednesday',1,NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_atn_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_atn_day_type`
--

DROP TABLE IF EXISTS `hs_hr_atn_day_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_atn_day_type` (
  `dt_id` int(4) NOT NULL AUTO_INCREMENT,
  `dt_name` varchar(200) DEFAULT NULL,
  `dt_name_si` varchar(200) DEFAULT NULL,
  `dt_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`dt_id`),
  UNIQUE KEY `dt_name_ta` (`dt_name_ta`),
  UNIQUE KEY `dt_name_si` (`dt_name_si`),
  UNIQUE KEY `dt_name` (`dt_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_atn_day_type`
--

LOCK TABLES `hs_hr_atn_day_type` WRITE;
/*!40000 ALTER TABLE `hs_hr_atn_day_type` DISABLE KEYS */;
INSERT INTO `hs_hr_atn_day_type` VALUES (1,'--Select--','--‡∂≠‡∑ù‡∂ª‡∑è‡∂ú‡∂±‡∑ä‡∂±--','--Select--'),(2,'working','‡∑Ä‡∑ê‡∂© ‡∂Ø‡∑Ä‡∑É','‡Æµ‡Øä‡Æ∞‡Øç‡Æï‡Æø‡Æ®‡Øç‡Æï‡Øç'),(3,'holiday','‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î ‡∂Ø‡∑í‡∂±‡∂∫','‡Æµ‡Øä‡Æ∞‡Øç‡Æï‡Æí‡Æî‡Æî‡Æì‡Æø‡Æ®‡Øç‡Æï‡Øç'),(4,'halfday','‡∂ë‡∂ö‡∑ä‡∑Ä‡∂ª‡∑î‡∑Ä','‡Æµ‡Øä‡Æ£‡Æ∞‡Øç‡Æï‡Æø‡Æ®‡Øç‡Æï‡Øç');
/*!40000 ALTER TABLE `hs_hr_atn_day_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_atn_fieldformat`
--

DROP TABLE IF EXISTS `hs_hr_atn_fieldformat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_atn_fieldformat` (
  `aff_id` int(4) NOT NULL AUTO_INCREMENT,
  `aff_fieldname` varchar(200) DEFAULT NULL,
  `aff_fieldstartposition` varchar(3) DEFAULT NULL,
  `aff_fieldendposition` varchar(3) DEFAULT NULL,
  `aff_fielddatatype` varchar(20) DEFAULT NULL,
  `aff_fieldformat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`aff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_atn_fieldformat`
--

LOCK TABLES `hs_hr_atn_fieldformat` WRITE;
/*!40000 ALTER TABLE `hs_hr_atn_fieldformat` DISABLE KEYS */;
INSERT INTO `hs_hr_atn_fieldformat` VALUES (1,'Attendance No','0','4',NULL,NULL),(2,'(Date) Year','6','9',NULL,NULL),(3,'(Date) Month','11','12',NULL,NULL),(4,'(Date) Date','14','15',NULL,NULL),(5,'(Time) HH','17','18',NULL,NULL),(6,'(Time) MM','20','21',NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_atn_fieldformat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_attendance`
--

DROP TABLE IF EXISTS `hs_hr_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_attendance` (
  `attendance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `punchin_time` datetime DEFAULT NULL,
  `punchout_time` datetime DEFAULT NULL,
  `in_note` varchar(250) DEFAULT NULL,
  `out_note` varchar(250) DEFAULT NULL,
  `timestamp_diff` int(11) NOT NULL,
  `status` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_attendance`
--

LOCK TABLES `hs_hr_attendance` WRITE;
/*!40000 ALTER TABLE `hs_hr_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_audit`
--

DROP TABLE IF EXISTS `hs_hr_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_audit` (
  `audit_table_name` varchar(255) DEFAULT NULL,
  `audit_row_pk` varchar(50) DEFAULT NULL,
  `audit_field_name` varchar(255) DEFAULT NULL,
  `audit_old_value` blob,
  `audit_new_value` blob,
  `audit_datetime` datetime NOT NULL,
  `audit_user` varchar(255) DEFAULT NULL,
  `audit_description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_audit`
--

LOCK TABLES `hs_hr_audit` WRITE;
/*!40000 ALTER TABLE `hs_hr_audit` DISABLE KEYS */;
INSERT INTO `hs_hr_audit` VALUES ('hs_hr_employee','1',NULL,NULL,NULL,'2012-10-28 15:17:17','USR001','new record added'),('hs_hr_employee','1','emp_status ',NULL,'EST000','2012-10-28 15:42:37',NULL,'record updated'),('hs_hr_employee','1','job_title_code',NULL,'JOB001','2012-10-28 15:42:37',NULL,'record updated'),('hs_hr_employee','1','work_station ',NULL,'2','2012-10-28 15:42:37',NULL,'record updated'),('hs_hr_employee','1','service_code ',NULL,'1','2012-10-28 15:42:37',NULL,'record updated'),('hs_hr_employee','1','grade_code ',NULL,'1','2012-10-28 15:42:37',NULL,'record updated'),('hs_hr_employee','1','emp_active_hrm_flg ',NULL,'1','2012-10-28 15:42:37',NULL,'record updated'),('hs_hr_employee','1','class_code ',NULL,'1','2012-10-28 15:42:37',NULL,'record updated'),('hs_hr_employee','1','hie_code_1 ',NULL,'1','2012-10-28 15:42:37',NULL,'record updated'),('hs_hr_employee','1','hie_code_2 ',NULL,'2','2012-10-28 15:42:37',NULL,'record updated'),('hs_hr_employee','1','emp_attendance_no ',NULL,'A001','2012-10-28 15:50:20','USR002','record updated'),('hs_hr_employee','1','emp_public_app_date ',NULL,'2012-10-01','2012-10-28 15:50:20','USR002','record updated'),('hs_hr_employee','1','emp_public_com_date ',NULL,'2012-10-01','2012-10-28 15:50:20','USR002','record updated'),('hs_hr_employee','1','emp_app_date ',NULL,'2012-10-01','2012-10-28 15:50:20','USR002','record updated'),('hs_hr_employee','1','emp_com_date ',NULL,'2012-10-01','2012-10-28 15:50:20','USR002','record updated'),('hs_hr_employee','1','emp_rec_method ',NULL,'3','2012-10-28 15:50:20','USR002','record updated'),('hs_hr_employee','1','emp_rec_medium ',NULL,'1','2012-10-28 15:50:20','USR002','record updated'),('hs_hr_employee','1','emp_active_att_flg ',NULL,'1','2012-10-28 15:50:20','USR002','record updated'),('hs_hr_employee','1','emp_wop_no ',NULL,'','2012-10-28 15:50:20','USR002','record updated'),('hs_hr_employee','1','emp_confirm_flg ',NULL,'0','2012-10-28 15:50:20','USR002','record updated'),('hs_hr_employee','1','emp_prob_ext_flg ',NULL,'0','2012-10-28 15:50:20','USR002','record updated');
/*!40000 ALTER TABLE `hs_hr_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_bank`
--

DROP TABLE IF EXISTS `hs_hr_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_bank` (
  `bank_code` varchar(8) NOT NULL,
  `bank_user_code` varchar(200) DEFAULT NULL,
  `bank_name` varchar(200) DEFAULT NULL,
  `bank_name_si` varchar(200) DEFAULT NULL,
  `bank_name_ta` varchar(200) DEFAULT NULL,
  `bank_address` varchar(200) DEFAULT NULL,
  `bank_address_si` varchar(200) DEFAULT NULL,
  `bank_address_ta` varchar(200) DEFAULT NULL,
  `bnk_main` int(1) DEFAULT NULL,
  `bnk_mainbank` varchar(8) DEFAULT NULL,
  `acc_fmt_code` decimal(10,0) DEFAULT NULL,
  `acc_no_lng` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`bank_code`),
  UNIQUE KEY `bank_user_code` (`bank_user_code`,`bank_name`,`bank_address`),
  KEY `xif1hs_hr_bank` (`acc_fmt_code`),
  CONSTRAINT `hs_hr_bank_ibfk_1` FOREIGN KEY (`acc_fmt_code`) REFERENCES `hs_pr_bank_acc_format` (`acc_fmt_code`),
  CONSTRAINT `hs_hr_bank_ibfk_2` FOREIGN KEY (`acc_fmt_code`) REFERENCES `hs_pr_bank_acc_format` (`acc_fmt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_bank`
--

LOCK TABLES `hs_hr_bank` WRITE;
/*!40000 ALTER TABLE `hs_hr_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_bank_account_type`
--

DROP TABLE IF EXISTS `hs_hr_bank_account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_bank_account_type` (
  `acctype_id` int(6) NOT NULL,
  `acctype_name` varchar(200) DEFAULT NULL,
  `acctype_name_si` varchar(200) DEFAULT NULL,
  `acctype_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`acctype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_bank_account_type`
--

LOCK TABLES `hs_hr_bank_account_type` WRITE;
/*!40000 ALTER TABLE `hs_hr_bank_account_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_bank_account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_branch`
--

DROP TABLE IF EXISTS `hs_hr_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_branch` (
  `bbranch_sliptransfers_flg` int(1) DEFAULT NULL,
  `bbranch_auto_clr_house_code` varchar(20) DEFAULT NULL,
  `bbranch_address` varchar(200) DEFAULT NULL,
  `bbranch_address_si` varchar(200) DEFAULT NULL,
  `bbranch_address_ta` varchar(200) DEFAULT NULL,
  `bbranch_name` varchar(120) DEFAULT NULL,
  `bbranch_name_si` varchar(120) DEFAULT NULL,
  `bbranch_name_ta` varchar(120) DEFAULT NULL,
  `bbranch_code` varchar(6) NOT NULL,
  `bbranch_user_code` varchar(200) DEFAULT NULL,
  `bank_code` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`bbranch_code`),
  UNIQUE KEY `bbranch_user_code` (`bbranch_user_code`),
  KEY `xif1hs_hr_branch` (`bank_code`),
  CONSTRAINT `hs_hr_branch_ibfk_1` FOREIGN KEY (`bank_code`) REFERENCES `hs_hr_bank` (`bank_code`),
  CONSTRAINT `hs_hr_branch_ibfk_2` FOREIGN KEY (`bank_code`) REFERENCES `hs_hr_bank` (`bank_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_branch`
--

LOCK TABLES `hs_hr_branch` WRITE;
/*!40000 ALTER TABLE `hs_hr_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_carderplan`
--

DROP TABLE IF EXISTS `hs_hr_carderplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_carderplan` (
  `id` int(7) NOT NULL,
  `jobtit_code` varchar(13) NOT NULL,
  `carder_actual` int(10) DEFAULT NULL,
  `carder_approved` int(10) DEFAULT NULL,
  `carder_excess` int(10) DEFAULT NULL,
  `carder_vacancies` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`,`jobtit_code`),
  KEY `jobtit_code` (`jobtit_code`),
  KEY `xif1hs_hr_carderplan` (`jobtit_code`),
  CONSTRAINT `hs_hr_carderplan_ibfk_2` FOREIGN KEY (`jobtit_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_carderplan`
--

LOCK TABLES `hs_hr_carderplan` WRITE;
/*!40000 ALTER TABLE `hs_hr_carderplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_carderplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_ckecklist_detail`
--

DROP TABLE IF EXISTS `hs_hr_ckecklist_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_ckecklist_detail` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `prm_checklist_id` int(4) NOT NULL DEFAULT '0',
  `value` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`prm_checklist_id`),
  KEY `xif1hs_hr_ckecklist_detail` (`prm_checklist_id`),
  KEY `xif2hs_hr_ckecklist_detail` (`emp_number`),
  CONSTRAINT `hs_hr_ckecklist_detail_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_ckecklist_detail_ibfk_2` FOREIGN KEY (`prm_checklist_id`) REFERENCES `hs_hr_promotion_ckecklist` (`prm_checklist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_ckecklist_detail`
--

LOCK TABLES `hs_hr_ckecklist_detail` WRITE;
/*!40000 ALTER TABLE `hs_hr_ckecklist_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_ckecklist_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_class`
--

DROP TABLE IF EXISTS `hs_hr_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_class` (
  `class_code` int(4) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) NOT NULL,
  `class_name_si` varchar(100) DEFAULT NULL,
  `class_name_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`class_code`),
  UNIQUE KEY `class_name` (`class_name`),
  UNIQUE KEY `class_name_ta` (`class_name_ta`),
  UNIQUE KEY `class_name_si` (`class_name_si`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_class`
--

LOCK TABLES `hs_hr_class` WRITE;
/*!40000 ALTER TABLE `hs_hr_class` DISABLE KEYS */;
INSERT INTO `hs_hr_class` VALUES (1,'Class',NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_company_structure_def`
--

DROP TABLE IF EXISTS `hs_hr_company_structure_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_company_structure_def` (
  `def_level` int(4) NOT NULL,
  `def_name` varchar(100) NOT NULL,
  `def_name_si` varchar(100) DEFAULT NULL,
  `def_name_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`def_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_company_structure_def`
--

LOCK TABLES `hs_hr_company_structure_def` WRITE;
/*!40000 ALTER TABLE `hs_hr_company_structure_def` DISABLE KEYS */;
INSERT INTO `hs_hr_company_structure_def` VALUES (1,'Organization','‡∂Ü‡∂∫‡∂≠‡∂±‡∂∫',NULL),(2,'National Level','‡∂¢‡∑è‡∂≠‡∑í‡∂ö ‡∂∏‡∂ß‡∑ä‡∂ß‡∂∏',NULL),(3,'District Level','‡∂Ø‡∑í‡∑É‡∑ä‡∂≠‡∑ä‚Äç‡∂ª‡∑í‡∂ö‡∑ä ‡∂∏‡∂ß‡∑ä‡∂ß‡∂∏',NULL),(4,'Divisional Level','‡∂¥‡∑ä‚Äç‡∂ª‡∑è‡∂Ø‡∑ö‡∑Å‡∑ì‡∂∫ ‡∂∏‡∂ß‡∑ä‡∂ß‡∂∏',NULL),(5,'Zonal Level','‡∂ö‡∑ú‡∂ß‡∑ä‡∂®‡∑è‡∑Å ‡∂∏‡∂ß‡∑ä‡∂ß‡∂∏',NULL),(6,'Wasam Level','‡∑Ä‡∑É‡∂∏‡∑ä ‡∂∏‡∂ß‡∑ä‡∂ß‡∂∏',NULL),(7,'Level 07',NULL,NULL),(8,'Level 08',NULL,NULL),(9,'Level 09',NULL,NULL),(10,'Level 10',NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_company_structure_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_compstructtree`
--

DROP TABLE IF EXISTS `hs_hr_compstructtree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_compstructtree` (
  `comp_code` varchar(20) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `id` int(6) NOT NULL,
  `parnt` int(6) NOT NULL DEFAULT '0',
  `title_si` varchar(200) DEFAULT NULL,
  `title_ta` varchar(200) DEFAULT NULL,
  `comp_address` varchar(200) DEFAULT NULL,
  `comp_address_si` varchar(200) DEFAULT NULL,
  `comp_address_ta` varchar(200) DEFAULT NULL,
  `comp_fax` varchar(30) DEFAULT NULL,
  `comp_email` varchar(100) DEFAULT NULL,
  `emp_number` int(7) DEFAULT NULL,
  `comp_phone_intercom` varchar(30) DEFAULT NULL,
  `comp_phone_extension` varchar(30) DEFAULT NULL,
  `comp_phone_vip` varchar(30) DEFAULT NULL,
  `comp_phone_direct_line` varchar(30) DEFAULT NULL,
  `comp_url` varchar(200) DEFAULT NULL,
  `def_level` int(4) DEFAULT NULL,
  `comp_location_code` varchar(30) DEFAULT NULL,
  `comp_reference_code` varchar(20) DEFAULT NULL,
  `comp_isfunctional` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comp_code` (`comp_code`),
  UNIQUE KEY `comp_location_code` (`comp_location_code`),
  KEY `xif1hs_hr_compstructtree` (`emp_number`),
  KEY `xif2hs_hr_compstructtree` (`def_level`),
  CONSTRAINT `hs_hr_compstructtree_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_compstructtree_ibfk_2` FOREIGN KEY (`def_level`) REFERENCES `hs_hr_company_structure_def` (`def_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_compstructtree`
--

LOCK TABLES `hs_hr_compstructtree` WRITE;
/*!40000 ALTER TABLE `hs_hr_compstructtree` DISABLE KEYS */;
INSERT INTO `hs_hr_compstructtree` VALUES (NULL,'Test',1,0,'','','Test','','','','',NULL,'','','','','',1,NULL,NULL,0),('001','Head Office',2,1,NULL,NULL,'','','','','',NULL,'','','','','',2,NULL,NULL,1);
/*!40000 ALTER TABLE `hs_hr_compstructtree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_compstructtree_details`
--

DROP TABLE IF EXISTS `hs_hr_compstructtree_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_compstructtree_details` (
  `id` int(6) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `role_group_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`emp_number`),
  KEY `hs_hr_compstructtree_details2` (`emp_number`),
  KEY `hs_hr_compstructtree_details3` (`role_group_id`),
  CONSTRAINT `hs_hr_compstructtree_details` FOREIGN KEY (`id`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_hr_compstructtree_details2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_compstructtree_details3` FOREIGN KEY (`role_group_id`) REFERENCES `hs_hr_emp_role_group` (`role_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_compstructtree_details`
--

LOCK TABLES `hs_hr_compstructtree_details` WRITE;
/*!40000 ALTER TABLE `hs_hr_compstructtree_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_compstructtree_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_concurrency_control`
--

DROP TABLE IF EXISTS `hs_hr_concurrency_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_concurrency_control` (
  `con_table_name` varchar(100) NOT NULL,
  `con_table_key` varchar(100) NOT NULL,
  `con_activity_id` int(4) NOT NULL,
  `con_created_date` datetime DEFAULT NULL,
  `con_created_by` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`con_table_name`,`con_table_key`,`con_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_concurrency_control`
--

LOCK TABLES `hs_hr_concurrency_control` WRITE;
/*!40000 ALTER TABLE `hs_hr_concurrency_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_concurrency_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_config`
--

DROP TABLE IF EXISTS `hs_hr_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_config` (
  `key` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_config`
--

LOCK TABLES `hs_hr_config` WRITE;
/*!40000 ALTER TABLE `hs_hr_config` DISABLE KEYS */;
INSERT INTO `hs_hr_config` VALUES ('ldap_server',''),('ldap_domain_name',''),('ldap_port',''),('ldap_status',''),('hsp_current_plan','0'),('hsp_accrued_last_updated','0000-00-00'),('hsp_used_last_updated','0000-00-00'),('attendanceEmpChangeTime','No'),('attendanceEmpEditSubmitted','No'),('attendanceSupEditSubmitted','No');
/*!40000 ALTER TABLE `hs_hr_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_country`
--

DROP TABLE IF EXISTS `hs_hr_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_country` (
  `cou_code` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `cou_name` varchar(80) NOT NULL,
  `cou_name_si` varchar(80) DEFAULT NULL,
  `cou_name_ta` varchar(80) DEFAULT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`cou_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_country`
--

LOCK TABLES `hs_hr_country` WRITE;
/*!40000 ALTER TABLE `hs_hr_country` DISABLE KEYS */;
INSERT INTO `hs_hr_country` VALUES ('AD','ANDORRA','Andorra','‡∂Ö‡∂±‡∑ä‡∂Ø‡∑ù‡∂ª‡∑è','ANDORRA_ta','AND',20),('AE','UNITED ARAB EMIRATES','United Arab Emirates','‡∂ë‡∂ö‡∑ä‡∑É‡∂≠‡∑ä ‡∂Ö‡∂ª‡∑è‡∂∂‡∑í ‡∂ë‡∂∏‡∑ì‡∂ª‡∑ä ‡∂ª‡∑è‡∂¢‡∑ä‚Äç‡∂∫‡∂∫','UNITED ARAB EMIRATES_Ta','ARE',784),('AF','AFGHANISTAN','Afghanistan','‡∂á‡∑Ü‡∑ä‡∂ú‡∂±‡∑í‡∑É‡∑ä‡∂≠‡∑è‡∂±‡∂∫',NULL,'AFG',4),('AG','ANTIGUA AND BARBUDA','Antigua and Barbuda','‡∂á‡∂±‡∑ä‡∂ß‡∑í‡∂ú‡∑î‡∑Ä‡∑è',NULL,'ATG',28),('AI','ANGUILLA','Anguilla','‡∂á‡∂±‡∑ä‡∂ú‡∑î‡∂∫‡∑í‡∂Ω‡∑è‡∑Ä',NULL,'AIA',660),('AL','ALBANIA','Albania','‡∂á‡∂Ω‡∑ä‡∂∂‡∑ö‡∂±‡∑í‡∂∫‡∑è‡∑Ä',NULL,'ALB',8),('AM','ARMENIA','Armenia','‡∂Ü‡∂∏‡∑ö‡∂±‡∑í‡∂∫‡∑è',NULL,'ARM',51),('AN','NETHERLANDS ANTILLES','Netherlands Antilles','‡∂±‡∑ô‡∂Ø‡∂ª‡∑ä‡∂Ω‡∂±‡∑ä‡∂≠ ‡∂á‡∂±‡∑ä‡∂ß‡∑í‡∂Ω‡∑ä‡∂Ω‡∑ô‡∑É‡∑ä ',NULL,'ANT',530),('AO','ANGOLA','Angola','‡∂á‡∂±‡∑ä‡∂ú‡∑ù‡∂Ω‡∑è‡∑Ä',NULL,'AGO',24),('AQ','ANTARCTICA','Antarctica','‡∂á‡∂±‡∑ä‡∂ß‡∑è‡∂ö‡∑ä‡∂ß‡∑í‡∂ö‡∑è‡∑Ä',NULL,NULL,NULL),('AR','ARGENTINA','Argentina','‡∂Ü‡∂ª‡∑ä‡∂¢‡∑ô‡∂±‡∑ä‡∂ß‡∑í‡∂±‡∑è‡∑Ä',NULL,'ARG',32),('AS','AMERICAN SAMOA','American Samoa','‡∂á‡∂∏‡∑ô‡∂ª‡∑í‡∂ö‡∂±‡∑ä ‡∑É‡∑ê‡∂∏‡∑ù‡∑Ä‡∑è',NULL,'ASM',16),('AT','AUSTRIA','Austria','‡∂ï‡∑É‡∑ä‡∂ß‡∑ä‚Äç‡∂ª‡∑í‡∂∫‡∑è‡∑Ä',NULL,'AUT',40),('AU','AUSTRALIA','Australia','‡∂ï‡∑É‡∑ä‡∂ß‡∑ä‚Äç‡∂ª‡∑ö‡∂Ω‡∑í‡∂∫‡∑è‡∑Ä',NULL,'AUS',36),('AW','ARUBA','Aruba','‡∂Ö‡∂ª‡∑î‡∂∂‡∑è',NULL,'ABW',533),('AZ','AZERBAIJAN','Azerbaijan','‡∂Ö‡∂∫‡∑í‡∑É‡∑ä‡∂∂‡∂¢‡∑è‡∂±‡∑ä',NULL,'AZE',31),('BA','BOSNIA AND HERZEGOVINA','Bosnia and Herzegovina','‡∂∂‡∑ú‡∑É‡∑ä‡∂±‡∑í‡∂∫‡∑è ‡∑É‡∑Ñ ‡∑Ñ‡∂ª‡∑ä‡∑É‡∑ô‡∂ú‡∑ú‡∑Ä‡∑í‡∂±‡∑è',NULL,'BIH',70),('BB','BARBADOS','Barbados','‡∂∂‡∑è‡∂ª‡∑ä‡∂∂‡∂©‡∑ù‡∑É‡∑ä',NULL,'BRB',52),('BD','BANGLADESH','Bangladesh','‡∂∂‡∂Ç‡∂ú‡∂Ω‡∑è‡∂Ø‡∑ö‡∑Å‡∂∫',NULL,'BGD',50),('BE','BELGIUM','Belgium','‡∂∂‡∑ô‡∂Ω‡∑ä‡∂¢‡∑í‡∂∫‡∂∏‡∑ä',NULL,'BEL',56),('BF','BURKINA FASO','Burkina Faso','‡∂∂‡∂ª‡∑ä‡∂ö‡∑í‡∂±‡∑è ‡∑Ü‡∑è‡∑É‡∑ú',NULL,'BFA',854),('BG','BULGARIA','Bulgaria','‡∂∂‡∂Ω‡∑ä‡∂ú‡∑ö‡∂ª‡∑í‡∂∫‡∑è‡∑Ä',NULL,'BGR',100),('BH','BAHRAIN','Bahrain','‡∂∂‡∑Ñ‡∂ª‡∑ö‡∂±‡∑ä',NULL,'BHR',48),('BI','BURUNDI','Burundi','‡∂∂‡∑Ñ‡∂ª‡∑ö‡∂±‡∑ä',NULL,'BDI',108),('BJ','BENIN','Benin','‡∂∂‡∑ô‡∂±‡∑í‡∂±‡∑ä',NULL,'BEN',204),('BM','BERMUDA','Bermuda','‡∂∂‡∑ô‡∂±‡∑í‡∂±‡∑ä',NULL,'BMU',60),('BN','BRUNEI DARUSSALAM','Brunei Darussalam','‡∂∂‡∑≤‡∂±‡∑è‡∂∫‡∑í',NULL,'BRN',96),('BO','BOLIVIA','Bolivia','‡∂∂‡∑ú‡∂Ω‡∑í‡∑Ä‡∑í‡∂∫‡∑è‡∑Ä',NULL,'BOL',68),('BR','BRAZIL','Brazil','‡∂∂‡∑ä‚Äç‡∂ª‡∑É‡∑ì‡∂Ω‡∂∫',NULL,'BRA',76),('BS','BAHAMAS','Bahamas','‡∂∂‡∑Ñ‡∑è‡∂∏‡∑è‡∑É‡∑ä',NULL,'BHS',44),('BT','BHUTAN','Bhutan','‡∂∑‡∑ñ‡∂≠‡∑è‡∂±‡∂∫',NULL,'BTN',64),('BV','BOUVET ISLAND','Bouvet Island','‡∂∂‡∑ú‡∑Ä‡∑ö ‡∂Ø‡∑ñ‡∂¥‡∂≠',NULL,NULL,NULL),('BW','BOTSWANA','Botswana','‡∂∂‡∑ú‡∂ß‡∑ä‡∑É‡∑ä‡∑Ä‡∑è‡∂±‡∑è',NULL,'BWA',72),('BY','BELARUS','Belarus','‡∂∂‡∑ô‡∂Ω‡∂ª‡∑ñ‡∑É‡∑ä',NULL,'BLR',112),('BZ','BELIZE','Belize','‡∂∂‡∑ô‡∂Ω‡∑ì‡∑É‡∑ä',NULL,'BLZ',84),('CA','CANADA','Canada','‡∂ö‡∑ê‡∂±‡∂©‡∑è‡∑Ä',NULL,'CAN',124),('CC','COCOS (KEELING) ISLANDS','Cocos (Keeling) Islands','‡∂ö‡∑ú‡∂ö‡∑ù‡∑É‡∑ä ‡∂Ø‡∑ñ‡∂¥‡∂≠‡∑ä',NULL,NULL,NULL),('CD','CONGO, THE DEMOCRATIC REPUBLIC OF THE','Congo, the Democratic Republic of the','‡∂ö‡∑ú‡∂Ç‡∂ú‡∑ú',NULL,'COD',180),('CF','CENTRAL AFRICAN REPUBLIC','Central African Republic','‡∂∏‡∂∞‡∑ä‚Äç‡∂∫‡∂∏ ‡∂Ö‡∂¥‡∑ä‚Äç‡∂ª‡∑í‡∂ö‡∑è‡∂±‡∑î ‡∑É‡∂∏‡∑ñ‡∑Ñ‡∑è‡∂´‡∑ä‡∂©‡∑î‡∑Ä',NULL,'CAF',140),('CG','CONGO','Congo','‡∂ö‡∑ú‡∂Ç‡∂ú‡∑ú',NULL,'COG',178),('CH','SWITZERLAND','Switzerland','‡∑É‡∑ä‡∑Ä‡∑í‡∂ß‡∑ä‡∑É‡∂ª‡∑ä‡∂Ω‡∂±‡∑ä‡∂≠‡∂∫',NULL,'CHE',756),('CI','COTE D\'IVOIRE','Cote D\'Ivoire','‡∂Ö‡∂∫‡∑í‡∑Ä‡∂ª‡∑í ‡∂ö‡∑ú‡∑É‡∑ä‡∂ß‡∑ä',NULL,'CIV',384),('CK','COOK ISLANDS','Cook Islands','‡∂ö‡∑î‡∂ö‡∑ä ‡∂Ø‡∑ñ‡∂¥‡∂≠‡∑ä',NULL,'COK',184),('CL','CHILE','Chile','‡∂†‡∑í‡∂Ω‡∑ì',NULL,'CHL',152),('CM','CAMEROON','Cameroon','‡∂ö‡∑ê‡∂∏‡∂ª‡∑ñ‡∂±‡∑ä',NULL,'CMR',120),('CN','CHINA','China','‡∂†‡∑ì‡∂±‡∂∫',NULL,'CHN',156),('CO','COLOMBIA','Colombia','‡∂ö‡∑ú‡∑Ö‡∑ú‡∂∏‡∑ä‡∂∂‡∑í‡∂∫‡∑è‡∑Ä',NULL,'COL',170),('CR','COSTA RICA','Costa Rica','‡∂ö‡∑ú‡∑É‡∑ä‡∂ß‡∑è‡∂ª‡∑í‡∂ö‡∑è',NULL,'CRI',188),('CS','SERBIA AND MONTENEGRO','Serbia and Montenegro','‡∑É‡∂ª‡∑ä‡∂∂‡∑í‡∂∫‡∑è ‡∂∏‡∑ú‡∂±‡∑ä‡∂ß‡∑ö‡∂±‡∑ä‡∂ú‡∑ä‚Äç‡∂ª‡∑ú',NULL,NULL,NULL),('CU','CUBA','Cuba','‡∂ö‡∑í‡∂∫‡∑î‡∂∂‡∑è‡∑Ä',NULL,'CUB',192),('CV','CAPE VERDE','Cape Verde','‡∂ö‡∑ö‡∂¥‡∑ä ‡∑Ä‡∂ª‡∑ä‡∂©‡∑ä',NULL,'CPV',132),('CX','CHRISTMAS ISLAND','Christmas Island','‡∂ö‡∑ä‚Äç‡∂ª‡∑í‡∑É‡∑ä‡∂∏‡∑É‡∑ä ‡∂Ø‡∑ñ‡∂¥‡∂≠‡∑ä',NULL,NULL,NULL),('CY','CYPRUS','Cyprus','‡∑É‡∂∫‡∑í‡∂¥‡∑ä‚Äç‡∂ª‡∑É‡∑ä',NULL,'CYP',196),('CZ','CZECH REPUBLIC','Czech Republic','‡∂†‡∑ô‡∂ö‡∑ä ‡∑É‡∂∏‡∑ñ‡∑Ñ‡∑è‡∂´‡∑ä‡∂©‡∑î‡∑Ä',NULL,'CZE',203),('DE','GERMANY','Germany','‡∂¢‡∂ª‡∑ä‡∂∏‡∂±‡∑í‡∂∫',NULL,'DEU',276),('DJ','DJIBOUTI','Djibouti','‡∂¢‡∑í‡∂∂‡∑î‡∂ß‡∑í',NULL,'DJI',262),('DK','DENMARK','Denmark','‡∂©‡∑ô‡∂±‡∑ä‡∂∏‡∑è‡∂ª‡∑ä‡∂ö‡∑ä',NULL,'DNK',208),('DM','DOMINICA','Dominica','‡∂©‡∑ú‡∂∏‡∑í‡∂±‡∑í‡∂ö‡∑ä ‡∑É‡∂∏‡∑ñ‡∑Ñ‡∑è‡∂´‡∑ä‡∂©‡∑î‡∑Ä',NULL,'DMA',212),('DO','DOMINICAN REPUBLIC','Dominican Republic','‡∂©‡∑ú‡∂∏‡∑í‡∂±‡∑í‡∂ö‡∑ä ‡∑É‡∂∏‡∑ñ‡∑Ñ‡∑è‡∂´‡∑ä‡∂©‡∑î‡∑Ä',NULL,'DOM',214),('DZ','ALGERIA','Algeria','‡∂á‡∂Ω‡∑ä‡∂¢‡∑ì‡∂ª‡∑í‡∂∫‡∑è‡∑Ä',NULL,'DZA',12),('EC','ECUADOR','Ecuador','‡∂â‡∂ö‡∑ä‡∑Ä‡∂Ø‡∑ù‡∂ª‡∑ä',NULL,'ECU',218),('EE','ESTONIA','Estonia','‡∂ë‡∑É‡∑ä‡∂ß‡∑ù‡∂±‡∑í‡∂∫‡∑è‡∑Ä',NULL,'EST',233),('EG','EGYPT','Egypt','‡∂ä‡∂¢‡∑í‡∂¥‡∑ä‡∂≠‡∑î‡∑Ä',NULL,'EGY',818),('EH','WESTERN SAHARA','Western Sahara','‡∂∂‡∂ß‡∑Ñ‡∑í‡∂ª ‡∑É‡∑Ñ‡∂ª‡∑è‡∑Ä',NULL,'ESH',732),('ER','ERITREA','Eritrea','‡∂ë‡∂ª‡∑í‡∂≠‡∑ä‚Äç‡∂ª‡∑í‡∂∫‡∑è‡∑Ä',NULL,'ERI',232),('ES','SPAIN','Spain','‡∑É‡∑ä‡∂¥‡∑è‡∂§‡∑ä‡∂§‡∂∫',NULL,'ESP',724),('ET','ETHIOPIA','Ethiopia','‡∂â‡∂≠‡∑í‡∂∫‡∑ù‡∂¥‡∑í‡∂∫‡∑è‡∑Ä',NULL,'ETH',231),('FI','FINLAND','Finland','‡∑Ü‡∑í‡∂±‡∑ä‡∂Ω‡∂±‡∑ä‡∂≠‡∂∫',NULL,'FIN',246),('FJ','FIJI','Fiji','‡∑Ü‡∑ì‡∂¢‡∑í',NULL,'FJI',242),('FK','FALKLAND ISLANDS (MALVINAS)','Falkland Islands (Malvinas)','‡∑Ü‡∑ù‡∂ö‡∑ä‡∂Ω‡∂±‡∑ä‡∂©‡∑ä ‡∂Ø‡∑î‡∂¥‡∂≠‡∑ä',NULL,'FLK',238),('FM','MICRONESIA, FEDERATED STATES OF','Micronesia, Federated States of','‡∂∏‡∂∫‡∑í‡∂ö‡∑ä‚Äç‡∂ª‡∑ú‡∂±‡∑ì‡∑É‡∑í‡∂∫‡∑è',NULL,'FSM',583),('FO','FAROE ISLANDS','Faroe Islands','‡∑Ü‡∑ê‡∂ª‡∑ú‡∂â','','FRO',234),('FR','FRANCE','France','‡∂¥‡∑ä‚Äç‡∂ª‡∂Ç‡∑Å‡∂∫',NULL,'FRA',250),('GA','GABON','Gabon','‡∂ú‡∑ô‡∂∂‡∑ú‡∂±‡∑ä',NULL,'GAB',266),('GB','UNITED KINGDOM','United Kingdom','‡∂ë‡∂ö‡∑ä‡∑É‡∂≠‡∑ä ‡∂ª‡∑è‡∂¢‡∂∞‡∑è‡∂±‡∑í‡∂∫',NULL,'GBR',826),('GD','GRENADA','Grenada','‡∂ú‡∑ä‚Äç‡∂ª‡∑ô‡∂±‡∑ö‡∂©‡∑ä',NULL,'GRD',308),('GE','GEORGIA','Georgia','‡∂¢‡∑ù‡∂ª‡∑ä‡∂¢‡∑í‡∂∫‡∑è‡∑Ä',NULL,'GEO',268),('GF','FRENCH GUIANA','French Guiana','‡∂¥‡∑ä‚Äç‡∂ª‡∂Ç‡∑Å ‡∂ú‡∑í‡∂∫‡∑è‡∂±‡∑è',NULL,'GUF',254),('GH','GHANA','Ghana','‡∂ù‡∑è‡∂±‡∑è‡∑Ä',NULL,'GHA',288),('GI','GIBRALTAR','Gibraltar','‡∂¢‡∑í‡∂∂‡∑ä‚Äç‡∂ª‡∑ù‡∂Ω‡∑ä‡∂ß‡∑è',NULL,'GIB',292),('GL','GREENLAND','Greenland','‡∂ú‡∑ä‚Äç‡∂ª‡∑ì‡∂±‡∑ä‡∂Ω‡∂±‡∑ä‡∂≠‡∂∫',NULL,'GRL',304),('GM','GAMBIA','Gambia','‡∂ú‡∑ê‡∂∏‡∑ä‡∂∂‡∑í‡∂∫‡∑è‡∑Ä',NULL,'GMB',270),('GN','GUINEA','Guinea','‡∂ú‡∑í‡∂±‡∑í‡∂∫‡∑è ‡∂∂‡∑í‡∑É‡∑Ä‡∑ä',NULL,'GIN',324),('GP','GUADELOUPE','Guadeloupe','‡∂ú‡∑ö‡∂©‡∑ä‡∂Ω‡∑ñ‡∂¥‡∑ä',NULL,'GLP',312),('GQ','EQUATORIAL GUINEA','Equatorial Guinea','‡∂ú‡∑î‡∑Ä‡∑ô‡∂±‡∑è‡∑Ä',NULL,'GNQ',226),('GR','GREECE','Greece','‡∂ú‡∑ä‚Äç‡∂ª‡∑ì‡∑É‡∑í‡∂∫',NULL,'GRC',300),('GS','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS','South Georgia and the South Sandwich Islands','‡∂Ø‡∂ö‡∑î‡∂´‡∑î ‡∂¢‡∑ù‡∂ª‡∑ä‡∂¢‡∑í‡∂∫‡∑è‡∑Ä',NULL,NULL,NULL),('GT','GUATEMALA','Guatemala','‡∂ú‡∑ä‡∑Ä‡∑è‡∂≠‡∂∏‡∑è‡∂Ω‡∑è',NULL,'GTM',320),('GU','GUAM','Guam','‡∂ú‡∑î‡∑Ä‡∑è‡∂∏‡∑ä',NULL,'GUM',316),('GW','GUINEA-BISSAU','Guinea-Bissau','‡∂ú‡∑í‡∂±‡∑í‡∂∫‡∑è ‡∂∂‡∑í‡∑É‡∑Ä‡∑ä',NULL,'GNB',624),('GY','GUYANA','Guyana','‡∂ú‡∂∫‡∂±‡∑è',NULL,'GUY',328),('HK','HONG KONG','Hong Kong','‡∑Ñ‡∑ú‡∂Ç ‡∂ö‡∑ú‡∂Ç',NULL,'HKG',344),('HM','HEARD ISLAND AND MCDONALD ISLANDS','Heard Island and Mcdonald Islands','‡∂∏‡∑ê‡∂ö‡∑ä‡∂©‡∑ú‡∂±‡∂Ω‡∑ä‡∂©‡∑ä ‡∂Ø‡∑ñ‡∂¥‡∂≠‡∑ä',NULL,NULL,NULL),('HN','HONDURAS','Honduras','‡∑Ñ‡∑ú‡∂±‡∑ä‡∂©‡∑î‡∂ª‡∑è‡∑É‡∑ä',NULL,'HND',340),('HR','CROATIA','Croatia','‡∂ö‡∑ä‚Äç‡∂ª‡∑ú‡∂∫‡∑ö‡∑Ç‡∑í‡∂∫‡∑è',NULL,'HRV',191),('HT','HAITI','Haiti','‡∑Ñ‡∂∫‡∑í‡∂ß‡∑í',NULL,'HTI',332),('HU','HUNGARY','Hungary','‡∑Ñ‡∂Ç‡∂ú‡∑ö‡∂ª‡∑í‡∂∫‡∑è‡∑Ä',NULL,'HUN',348),('ID','INDONESIA','Indonesia','‡∂â‡∂±‡∑ä‡∂Ø‡∑î‡∂±‡∑ì‡∑É‡∑í‡∂∫‡∑è‡∑Ä',NULL,'IDN',360),('IE','IRELAND','Ireland','‡∂Ö‡∂∫‡∂ª‡∑ä‡∂Ω‡∂±‡∑ä‡∂≠‡∂∫',NULL,'IRL',372),('IL','ISRAEL','Israel','‡∂ä‡∑Å‡∑ä‚Äç‡∂ª‡∑è‡∂∫‡∂Ω‡∂∫',NULL,'ISR',376),('IN','INDIA','India','‡∂â‡∂±‡∑ä‡∂Ø‡∑í‡∂∫‡∑è‡∑Ä',NULL,'IND',356),('IQ','IRAQ','Iraq','‡∂â‡∂ª‡∑è‡∂ö‡∂∫',NULL,'IRQ',368),('IR','IRAN, ISLAMIC REPUBLIC OF','Iran, Islamic Republic of','‡∂â‡∂ª‡∑è‡∂±‡∂∫',NULL,'IRN',364),('IS','ICELAND','Iceland','‡∂Ö‡∂∫‡∑í‡∑É‡∑ä‡∂Ω‡∂±‡∑ä‡∂≠‡∂∫',NULL,'ISL',352),('IT','ITALY','Italy','‡∂â‡∂≠‡∑è‡∂Ω‡∑í‡∂∫',NULL,'ITA',380),('JM','JAMAICA','Jamaica','‡∂¢‡∑ê‡∂∏‡∑ô‡∂∫‡∑í‡∂ö‡∑è‡∑Ä',NULL,'JAM',388),('JO','JORDAN','Jordan','‡∂¢‡∑ù‡∂ª‡∑ä‡∂Ø‡∑è‡∂±‡∂∫',NULL,'JOR',400),('JP','JAPAN','Japan','‡∂¢‡∂¥‡∑è‡∂±‡∂∫',NULL,'JPN',392),('KE','KENYA','Kenya','‡∂ö‡∑ô‡∂±‡∑ä‡∂∫‡∑è‡∑Ä',NULL,'KEN',404),('KG','KYRGYZSTAN','Kyrgyzstan','‡∂ö‡∑í‡∂ª‡∑í‡∂ö‡∑í‡∑É‡∑ä‡∂≠‡∑è‡∂±‡∂∫',NULL,'KGZ',417),('KH','CAMBODIA','Cambodia','‡∂ö‡∑è‡∂∏‡∑ä‡∂∂‡∑ù‡∂¢‡∑í‡∂∫‡∑è‡∑Ä',NULL,'KHM',116),('KI','KIRIBATI','Kiribati','‡∂ö‡∑í‡∂ª‡∑í‡∂∂‡∑è‡∂ß‡∑í',NULL,'KIR',296),('KM','COMOROS','Comoros','‡∂ö‡∑ú‡∂∏‡∑ú‡∂ª‡∑ú‡∑É‡∑ä',NULL,'COM',174),('KN','SAINT KITTS AND NEVIS','Saint Kitts and Nevis','‡∑Å‡∑è‡∂±‡∑ä‡∂≠ ‡∂ö‡∑í‡∂ß‡∑ä‡∑É‡∑ä',NULL,'KNA',659),('KP','KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF','Korea, Democratic People\'s Republic of','‡∂ö‡∑ú‡∂ª‡∑í‡∂∫‡∑è‡∑Ä',NULL,'PRK',408),('KR','KOREA, REPUBLIC OF','Korea, Republic of','‡∂ö‡∑ú‡∂ª‡∑í‡∂∫‡∑è‡∑Ä',NULL,'KOR',410),('KW','KUWAIT','Kuwait','‡∂ö‡∑î‡∑Ä‡∑ö‡∂ß‡∂∫',NULL,'KWT',414),('KY','CAYMAN ISLANDS','Cayman Islands','‡∂ö‡∑ö‡∂∏‡∂±‡∑ä ‡∂Ø‡∑ñ‡∂¥‡∂≠‡∑ä',NULL,'CYM',136),('KZ','KAZAKHSTAN','Kazakhstan','‡∂ö‡∑É‡∂ö‡∑ä‡∑É‡∑ä‡∂≠‡∑è‡∂±‡∂∫',NULL,'KAZ',398),('LA','LAO PEOPLE\'S DEMOCRATIC REPUBLIC','Lao People\'s Democratic Republic','‡∂Ω‡∑è‡∂ï‡∑É‡∂∫',NULL,'LAO',418),('LB','LEBANON','Lebanon','‡∂Ω‡∑ô‡∂∂‡∂±‡∂±‡∑ä',NULL,'LBN',422),('LC','SAINT LUCIA','Saint Lucia','‡∑Å‡∑è‡∂±‡∑ä‡∂≠ ‡∂Ω‡∑î‡∑É‡∑í‡∂∫‡∑è',NULL,'LCA',662),('LI','LIECHTENSTEIN','Liechtenstein','‡∂Ω‡∂∫‡∑í‡∂ß‡∂±‡∑ä‡∑É‡∑ä‡∂ß‡∂∫‡∑í‡∂±‡∑ä',NULL,'LIE',438),('LK','SRI LANKA','Sri Lanka','‡∑Å‡∑ä‚Äç‡∂ª‡∑ì ‡∂Ω‡∂Ç‡∂ö‡∑è‡∑Ä',NULL,'LKA',144),('LR','LIBERIA','Liberia','‡∂Ω‡∂∫‡∑í‡∂∂‡∑ö‡∂ª‡∑í‡∂∫‡∑è',NULL,'LBR',430),('LS','LESOTHO','Lesotho','‡∂Ω‡∑ô‡∑É‡∑ù‡∂≠‡∑ú',NULL,'LSO',426),('LT','LITHUANIA','Lithuania','‡∂Ω‡∑í‡∂≠‡∑î‡∑Ä‡∑ö‡∂±‡∑í‡∂∫‡∑è',NULL,'LTU',440),('LU','LUXEMBOURG','Luxembourg','‡∂Ω‡∂ö‡∑ä‡∑Ç‡∂∏‡∑ä‡∂∂‡∂ª‡∑ä‡∂ú‡∑ä',NULL,'LUX',442),('LV','LATVIA','Latvia','‡∂Ω‡∑ê‡∂ß‡∑ä‡∑Ä‡∑í‡∂∫‡∑è',NULL,'LVA',428),('LY','LIBYAN ARAB JAMAHIRIYA','Libyan Arab Jamahiriya','‡∂Ω‡∑í‡∂∂‡∑í‡∂∫‡∑è‡∑Ä',NULL,'LBY',434),('MA','MOROCCO','Morocco','‡∂∏‡∑ú‡∂ª‡∑ú‡∂ö‡∑ä‡∂ö‡∑ù‡∑Ä',NULL,'MAR',504),('MC','MONACO','Monaco','‡∂∏‡∑ú‡∂±‡∑ë‡∂ö‡∑ù',NULL,'MCO',492),('MD','MOLDOVA, REPUBLIC OF','Moldova, Republic of','‡∂∏‡∑ù‡∂Ω‡∑ä‡∂©‡∑ù‡∑Ä‡∑è',NULL,'MDA',498),('MG','MADAGASCAR','Madagascar','‡∂∏‡∑ê‡∂©‡∂ú‡∑É‡∑ä‡∂ö‡∂ª‡∂∫',NULL,'MDG',450),('MH','MARSHALL ISLANDS','Marshall Islands','‡∂∏‡∑ê‡∂©‡∂ú‡∑É‡∑ä‡∂ö‡∂ª‡∂∫',NULL,'MHL',584),('MK','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','Macedonia, the Former Yugoslav Republic of','‡∂∏‡∑ê‡∑É‡∑í‡∂©‡∑ù‡∂±‡∑í‡∂∫‡∑è‡∑Ä',NULL,'MKD',807),('ML','MALI','Mali','‡∂∏‡∑è‡∂Ω‡∑ö',NULL,'MLI',466),('MM','MYANMAR','Myanmar','‡∂∏‡∑í‡∂∫‡∂±‡∑ä‡∂∏‡∑è‡∂ª‡∑ä',NULL,'MMR',104),('MN','MONGOLIA','Mongolia','‡∂∏‡∑ú‡∂±‡∑ä‡∂ú‡∑ù‡∂Ω‡∑í‡∂∫‡∑è‡∑Ä',NULL,'MNG',496),('MO','MACAO','Macao','‡∂∏‡∑ê‡∂ö‡∑è‡∑Ä‡∑ú',NULL,'MAC',446),('MP','NORTHERN MARIANA ISLANDS','Northern Mariana Islands','‡∂ã‡∂≠‡∑î‡∂ª‡∑î ‡∂∏‡∂ª‡∑î‡∂∫‡∑è‡∂±‡∑è ‡∂Ø‡∑ñ‡∂¥‡∂≠‡∑ä',NULL,'MNP',580),('MQ','MARTINIQUE','Martinique','‡∂±‡∑ù‡∂ª‡∑ä‡∑Ä‡∑ö',NULL,'MTQ',474),('MR','MAURITANIA','Mauritania','‡∂∏‡∑ú‡∂ª‡∑í‡∂ß‡∑è‡∂±‡∑í‡∂∫‡∑è',NULL,'MRT',478),('MS','MONTSERRAT','Montserrat','‡∂∏‡∑ú‡∂±‡∑ä‡∑É‡∑ô‡∂ª‡∑è‡∂ß‡∑ä',NULL,'MSR',500),('MT','MALTA','Malta','‡∂∏‡∑ù‡∂Ω‡∑ä‡∂ß‡∑è',NULL,'MLT',470),('MU','MAURITIUS','Mauritius','‡∂∏‡∑ú‡∂ª‡∑í‡∑Ç‡∑É‡∑ä',NULL,'MUS',480),('MV','MALDIVES','Maldives','‡∂∏‡∑è‡∂Ω‡∂Ø‡∑í‡∑Ä‡∂∫‡∑í‡∂±',NULL,'MDV',462),('MW','MALAWI','Malawi','‡∂∏‡∂Ω‡∑è‡∑Ä‡∑í',NULL,'MWI',454),('MX','MEXICO','Mexico','‡∂∏‡∑ô‡∂ö‡∑ä‡∑É‡∑í‡∂ö‡∑ù‡∑Ä',NULL,'MEX',484),('MY','MALAYSIA','Malaysia','‡∂∏‡∑ê‡∂Ω‡∑ö‡∑É‡∑í‡∂∫‡∑è‡∑Ä',NULL,'MYS',458),('MZ','MOZAMBIQUE','Mozambique','‡∂∏‡∑ú‡∑É‡∑ê‡∂∏‡∑ä‡∂∂‡∑í‡∂ö‡∑ä',NULL,'MOZ',508),('NA','NAMIBIA','Namibia','‡∂±‡∑ê‡∂∏‡∑í‡∂∂‡∑í‡∂∫‡∑è',NULL,'NAM',516),('NC','NEW CALEDONIA','New Caledonia','‡∂±‡∑Ä ‡∂ö‡∑ê‡∂Ω‡∑í‡∂©‡∑ù‡∂±‡∑í‡∂∫‡∑è‡∑Ä',NULL,'NCL',540),('NE','NIGER','Niger','‡∂±‡∂∫‡∑í‡∂¢‡∂ª‡∑ä',NULL,'NER',562),('NF','NORFOLK ISLAND','Norfolk Island','‡∂±‡∑ù‡∑Ü‡∑ù‡∂ö‡∑ä ‡∂Ø‡∑ñ‡∂¥‡∂≠‡∑ä',NULL,'NFK',574),('NG','NIGERIA','Nigeria','‡∂±‡∂∫‡∑í‡∂¢‡∑ì‡∂ª‡∑í‡∂∫‡∑è',NULL,'NGA',566),('NI','NICARAGUA','Nicaragua','‡∂±‡∑í‡∂ö‡∂ª‡∂ú‡∑î‡∑Ä‡∑è',NULL,'NIC',558),('NL','NETHERLANDS','Netherlands','‡∂±‡∑ô‡∂Ø‡∂ª‡∑ä‡∂Ω‡∂±‡∑ä‡∂≠‡∂∫',NULL,'NLD',528),('NO','NORWAY','Norway','‡∂±‡∑ù‡∂ª‡∑ä‡∑Ä‡∑ö',NULL,'NOR',578),('NP','NEPAL','Nepal','‡∂±‡∑ô‡∂¥‡∑è‡∂Ω‡∂∫',NULL,'NPL',524),('NR','NAURU','Nauru','‡∂±‡∑ù‡∂ª‡∑î',NULL,'NRU',520),('NU','NIUE','Niue','‡∂±‡∑í‡∂∫‡∑î',NULL,'NIU',570),('NZ','NEW ZEALAND','New Zealand','‡∂±‡∑Ä‡∑É‡∑ì‡∂Ω‡∂±‡∑ä‡∂≠‡∂∫',NULL,'NZL',554),('OM','OMAN','Oman','‡∂ï‡∂∏‡∑è‡∂±‡∂∫',NULL,'OMN',512),('PA','PANAMA','Panama','‡∂¥‡∑ê‡∂±‡∂∏‡∑è‡∑Ä',NULL,'PAN',591),('PE','PERU','Peru','‡∂¥‡∑ö‡∂ª‡∑î',NULL,'PER',604),('PF','FRENCH POLYNESIA','French Polynesia','‡∂¥‡∑ä‚Äç‡∂ª‡∂Ç‡∑Å ‡∂¥‡∑ú‡∂Ω‡∑í‡∂±‡∑ì‡∑É‡∑í‡∂∫‡∑è‡∑Ä',NULL,'PYF',258),('PG','PAPUA NEW GUINEA','Papua New Guinea','‡∂¥‡∑ê‡∂¥‡∑î‡∑Ä‡∑è ‡∂±‡∑í‡∑Ä‡∑ä‡∂ú‡∑í‡∂±‡∑í‡∂∫‡∑è‡∑Ä',NULL,'PNG',598),('PH','PHILIPPINES','Philippines','‡∂¥‡∑í‡∂Ω‡∑í‡∂¥‡∑ì‡∂±‡∂∫',NULL,'PHL',608),('PK','PAKISTAN','Pakistan','‡∂¥‡∂ö‡∑í‡∑É‡∑ä‡∂Æ‡∑è‡∂±‡∂∫',NULL,'PAK',586),('PL','POLAND','Poland','‡∂¥‡∑ù‡∂Ω‡∂±‡∑ä‡∂≠‡∂∫',NULL,'POL',616),('PM','SAINT PIERRE AND MIQUELON','Saint Pierre and Miquelon','‡∑Å‡∑è‡∂±‡∑ä‡∂≠ ‡∂¥‡∑í‡∂∫‡∂ª‡∑ö',NULL,'SPM',666),('PN','PITCAIRN','Pitcairn','‡∂¥‡∑í‡∂ß‡∑í‡∂ö‡∑ö‡∂±‡∑ä',NULL,'PCN',612),('PR','PUERTO RICO','Puerto Rico','‡∂¥‡∑î‡∑Ä‡∂ª‡∑ô‡∂ß‡∑í‡∂ö‡∑ù',NULL,'PRI',630),('PS','PALESTINIAN TERRITORY, OCCUPIED','Palestinian Territory, Occupied','‡∂¥‡∂Ω‡∑É‡∑ä‡∂≠‡∑ì‡∂±‡∂∫',NULL,NULL,NULL),('PT','PORTUGAL','Portugal','‡∂¥‡∑ò‡∂≠‡∑î‡∂ú‡∑è‡∂Ω‡∂∫',NULL,'PRT',620),('PW','PALAU','Palau','‡∂¥‡∂Ω‡∑Ä‡∑ä',NULL,'PLW',585),('PY','PARAGUAY','Paraguay','‡∂¥‡∑ê‡∂ª‡∂ú‡∑î‡∑Ä‡∑ö',NULL,'PRY',600),('QA','QATAR','Qatar','‡∂ö‡∂ß‡∑è‡∂ª‡∑ä',NULL,'QAT',634),('RE','REUNION','Reunion','‡∂ª‡∑ì‡∂∫‡∑î‡∂±‡∑í‡∂∫‡∂±‡∑ä',NULL,'REU',638),('RO','ROMANIA','Romania','‡∂ª‡∑î‡∂∏‡∑ö‡∂±‡∑í‡∂∫‡∑è‡∑Ä',NULL,'ROM',642),('RU','RUSSIAN FEDERATION','Russian Federation','‡∂ª‡∑î‡∑É‡∑í‡∂∫‡∑è‡∂±‡∑î ‡∑É‡∂∏‡∑ñ‡∑Ñ‡∑è‡∂´‡∑ä‡∂©‡∑î‡∑Ä',NULL,'RUS',643),('RW','RWANDA','Rwanda','‡∂ª‡∑î‡∑Ä‡∂±‡∑ä‡∂©‡∑è‡∑Ä',NULL,'RWA',646),('SA','SAUDI ARABIA','Saudi Arabia','‡∑É‡∑û‡∂Ø‡∑í ‡∂Ö‡∂ª‡∑è‡∂∂‡∑í‡∂∫',NULL,'SAU',682),('SB','SOLOMON ISLANDS','Solomon Islands','‡∑É‡∑ú‡∂Ω‡∂∏‡∂±‡∑ä ‡∂Ø‡∑ñ‡∂¥‡∂≠‡∑ä',NULL,'SLB',90),('SC','SEYCHELLES','Seychelles','‡∑É‡∑ì‡∑Ç‡∑ô‡∂Ω‡∑ä‡∑É‡∑ä',NULL,'SYC',690),('SD','SUDAN','Sudan','‡∑É‡∑î‡∂©‡∑è‡∂±‡∂∫',NULL,'SDN',736),('SE','SWEDEN','Sweden','‡∑É‡∑ä‡∑Ä‡∑í‡∂©‡∂±‡∂∫',NULL,'SWE',752),('SG','SINGAPORE','Singapore','‡∑É‡∑í‡∂Ç‡∂ú‡∂¥‡∑ä‡∂¥‡∑ñ‡∂ª‡∑î‡∑Ä',NULL,'SGP',702),('SH','SAINT HELENA','Saint Helena','‡∑Å‡∑è‡∂±‡∑ä‡∂≠ ‡∑Ñ‡∑ô‡∂Ω‡∑ö‡∂±‡∑è',NULL,'SHN',654),('SI','SLOVENIA','Slovenia','‡∑É‡∑ä‡∂Ω‡∑ú‡∑Ä‡∑ö‡∂±‡∑í‡∂∫‡∑è‡∑Ä',NULL,'SVN',705),('SJ','SVALBARD AND JAN MAYEN','Svalbard and Jan Mayen','‡∑É‡∑ä‡∑Ä‡∑ê‡∂Ω‡∑ä‡∂∂‡∂ª‡∑ä‡∂©‡∑ä',NULL,'SJM',744),('SK','SLOVAKIA','Slovakia','‡∑É‡∑ä‡∂Ω‡∑ú‡∑Ä‡∑ö‡∂ö‡∑í‡∂∫‡∑è‡∑Ä',NULL,'SVK',703),('SL','SIERRA LEONE','Sierra Leone','‡∑É‡∑í‡∂∫‡∑ô‡∂ª‡∑è ‡∂Ω‡∑í‡∂∫‡∑ú‡∂±‡∑ä',NULL,'SLE',694),('SM','SAN MARINO','San Marino','‡∑É‡∑ê‡∂±‡∑ä ‡∂∏‡∑ê‡∂ª‡∑ì‡∂±‡∑ù',NULL,'SMR',674),('SN','SENEGAL','Senegal','‡∑É‡∑ô‡∂±‡∂ú‡∑è‡∂Ω‡∂∫',NULL,'SEN',686),('SO','SOMALIA','Somalia','‡∑É‡∑ù‡∂∏‡∑è‡∂Ω‡∑í‡∂∫‡∑è‡∑Ä',NULL,'SOM',706),('SR','SURINAME','Suriname','‡∑É‡∑î‡∂ª‡∑í‡∂±‡∑ö‡∂∏‡∑ä',NULL,'SUR',740),('ST','SAO TOME AND PRINCIPE','Sao Tome and Principe','‡∑É‡∑ë‡∂ß‡∑ù‡∂∏‡∑ä',NULL,'STP',678),('SV','EL SALVADOR','El Salvador','‡∂ë‡∂Ω‡∑ä ‡∑É‡∑ê‡∂Ω‡∑ä‡∑Ä‡∂Ø‡∑ù‡∂ª‡∑ä',NULL,'SLV',222),('SY','SYRIAN ARAB REPUBLIC','Syrian Arab Republic','‡∑É‡∑í‡∂ª‡∑í‡∂∫‡∑è‡∑Ä',NULL,'SYR',760),('SZ','SWAZILAND','Swaziland','‡∑É‡∑ä‡∑Ä‡∑è‡∑É‡∑í‡∂Ω‡∂±‡∑ä‡∂≠‡∂∫',NULL,'SWZ',748),('TC','TURKS AND CAICOS ISLANDS','Turks and Caicos Islands','‡∂ß‡∂ª‡∑ä‡∂ö‡∑ä‡∑É‡∑ä ‡∂Ø‡∑ñ‡∂¥‡∂≠‡∑ä',NULL,'TCA',796),('TD','CHAD','Chad','‡∂†‡∑ê‡∂©‡∑ä',NULL,'TCD',148),('TF','FRENCH SOUTHERN TERRITORIES','French Southern Territories','‡∂Ø‡∂ö‡∑î‡∂´‡∑î ‡∂¥‡∑ä‚Äç‡∂ª‡∂Ç‡∑Å ‡∂¥‡∑è‡∂Ω‡∂± ‡∂¥‡∑ä‚Äç‡∂ª‡∂Ø‡∑ö‡∑Å',NULL,NULL,NULL),('TG','TOGO','Togo','‡∂ß‡∑ù‡∂ú‡∑ú',NULL,'TGO',768),('TH','THAILAND','Thailand','‡∂≠‡∑è‡∂∫‡∑í‡∂Ω‡∂±‡∑ä‡∂≠‡∂∫',NULL,'THA',764),('TJ','TAJIKISTAN','Tajikistan','‡∂ß‡∂¢‡∑í‡∂ö‡∑í‡∑É‡∑ä‡∂≠‡∑è‡∂±‡∂∫',NULL,'TJK',762),('TK','TOKELAU','Tokelau','‡∂ß‡∑ú‡∂ö‡∑ô‡∂Ω‡∑ù',NULL,'TKL',772),('TL','TIMOR-LESTE','Timor-Leste','‡∂ß‡∑í‡∂∏‡∑ù‡∂ª‡∑ä',NULL,NULL,NULL),('TM','TURKMENISTAN','Turkmenistan','‡∂®‡∑î‡∂ª‡∑ä‡∂ö‡∑ä‡∂∏‡∑ô‡∂±‡∑í‡∑É‡∑ä‡∂ß‡∂±‡∑ä',NULL,'TKM',795),('TN','TUNISIA','Tunisia','‡∂ß‡∑í‡∂∫‡∑î‡∂±‡∑ì‡∑É‡∑í‡∂∫‡∑è‡∑Ä',NULL,'TUN',788),('TO','TONGA','Tonga','‡∂ß‡∑ú‡∂Ç‡∂ú‡∑ú',NULL,'TON',776),('TR','TURKEY','Turkey','‡∂≠‡∑î‡∂ª‡∑ä‡∂ö‡∑í‡∂∫',NULL,'TUR',792),('TT','TRINIDAD AND TOBAGO','Trinidad and Tobago','‡∂ß‡∑ä‚Äç‡∂ª‡∑í‡∂±‡∑í‡∂©‡∑ë‡∂©‡∑ä ‡∂ß‡∑ú‡∂∂‡∑ë‡∂ú‡∑ú',NULL,'TTO',780),('TV','TUVALU','Tuvalu','‡∂ß‡∑î‡∑Ä‡∑è‡∂Ω‡∑î',NULL,'TUV',798),('TW','TAIWAN, PROVINCE OF CHINA','Taiwan','‡∂≠‡∑è‡∂∫‡∑í‡∑Ä‡∑è‡∂±‡∂∫',NULL,'TWN',158),('TZ','TANZANIA, UNITED REPUBLIC OF','Tanzania, United Republic of','‡∂ß‡∑ê‡∂±‡∑ä‡∑É‡∑è‡∂±‡∑í‡∂∫‡∑è‡∑Ä',NULL,'TZA',834),('UA','UKRAINE','Ukraine','‡∂∫‡∑ñ‡∂ö‡∑ä‡∂ª‡∑ö‡∂±‡∂∫',NULL,'UKR',804),('UG','UGANDA','Uganda','‡∂ã‡∂ú‡∂±‡∑ä‡∂©‡∑è‡∑Ä',NULL,'UGA',800),('US','UNITED STATES','United States','‡∂ë‡∂ö‡∑ä‡∑É‡∂≠‡∑ä ‡∂¢‡∂±‡∂¥‡∂Ø‡∂∫',NULL,'USA',840),('UY','URUGUAY','Uruguay','‡∂ã‡∂ª‡∑î‡∂ú‡∑î‡∑Ä‡∑ö',NULL,'URY',858),('UZ','UZBEKISTAN','Uzbekistan','‡∂ã‡∑É‡∑ä‡∂∂‡∑ô‡∂ö‡∑í‡∑É‡∑ä‡∂≠‡∑è‡∂±‡∂∫',NULL,'UZB',860),('VA','HOLY SEE (VATICAN CITY STATE)','Holy See (Vatican City State)','‡∑Ä‡∂≠‡∑í‡∂ö‡∑è‡∂±‡∑î‡∑Ä',NULL,'VAT',336),('VC','SAINT VINCENT AND THE GRENADINES','Saint Vincent and the Grenadines','‡∑Å‡∑è‡∂±‡∑ä‡∂≠ ‡∑Ä‡∑í‡∂±‡∑ä‡∑É‡∂±‡∑ä‡∂ß‡∑ä',NULL,'VCT',670),('VE','VENEZUELA','Venezuela','‡∑Ä‡∑ô‡∂±‡∑í‡∑É‡∑í‡∂∫‡∑î‡∂Ω‡∑è‡∑Ä',NULL,'VEN',862),('VG','VIRGIN ISLANDS, BRITISH','Virgin Islands, British','‡∑Ä‡∂ª‡∑ä‡∂¢‡∑í‡∂±‡∑í‡∂∫‡∑è ‡∂Ø‡∑ñ‡∂¥‡∂≠‡∑ä, ‡∂∂‡∑ä‚Äç‡∂ª‡∑í‡∂≠‡∑è‡∂±‡∑ä‚Äç‡∂∫‡∂∫',NULL,'VGB',92),('VI','VIRGIN ISLANDS, U.S.','Virgin Islands, U.s.','‡∑Ä‡∂ª‡∑ä‡∂¢‡∑í‡∂±‡∑í‡∂∫‡∑è ‡∂Ø‡∑ñ‡∂¥‡∂≠‡∑ä, ‡∂ë‡∂ö‡∑ä‡∑É‡∂≠‡∑ä ‡∂¢‡∂±‡∂¥‡∂Ø‡∂∫',NULL,'VIR',850),('VN','VIET NAM','Viet Nam','‡∑Ä‡∑í‡∂∫‡∂ß‡∑ä‡∂±‡∑è‡∂∏‡∂∫',NULL,'VNM',704),('VU','VANUATU','Vanuatu','‡∑Ä‡∑ê‡∂±‡∑î‡∂Ö‡∂ß‡∑î',NULL,'VUT',548),('WF','WALLIS AND FUTUNA','Wallis and Futuna','‡∑Ä‡∑ê‡∂Ω‡∑í‡∑É‡∑ä',NULL,'WLF',876),('WS','SAMOA','Samoa','‡∑É‡∑ê‡∂∏‡∑ñ‡∑Ä‡∑è',NULL,'WSM',882),('YE','YEMEN','Yemen','‡∂∫‡∑ö‡∂∏‡∂±‡∂∫',NULL,'YEM',887),('YT','MAYOTTE','Mayotte','‡∂∏‡∂∫‡∑ù‡∂ß‡∑í',NULL,NULL,NULL),('ZA','SOUTH AFRICA','South Africa','‡∂Ø‡∂ö‡∑î‡∂´‡∑î ‡∂Ö‡∂¥‡∑ä‚Äç‡∂ª‡∑í‡∂ö‡∑è‡∑Ä',NULL,'ZAF',710),('ZM','ZAMBIA','Zambia','‡∑É‡∑ê‡∂∏‡∑ä‡∂∂‡∑í‡∂∫‡∑è‡∑Ä',NULL,'ZMB',894),('ZW','ZIMBABWE','Zimbabwe','‡∑É‡∑í‡∂∏‡∑ä‡∂∂‡∑è‡∂∂‡∑ä‡∑Ä‡∑ö',NULL,'ZWE',716);
/*!40000 ALTER TABLE `hs_hr_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_currency_type`
--

DROP TABLE IF EXISTS `hs_hr_currency_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_currency_type` (
  `code` int(11) NOT NULL DEFAULT '0',
  `currency_id` char(3) NOT NULL,
  `currency_name` varchar(70) NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_currency_type`
--

LOCK TABLES `hs_hr_currency_type` WRITE;
/*!40000 ALTER TABLE `hs_hr_currency_type` DISABLE KEYS */;
INSERT INTO `hs_hr_currency_type` VALUES (3,'AED','Utd. Arab Emir. Dirham'),(4,'AFN','Afghanistan Afghani'),(5,'ALL','Albanian Lek'),(6,'ANG','NL Antillian Guilder'),(7,'AOR','Angolan New Kwanza'),(177,'ARP','Argentina Pesos'),(8,'ARS','Argentine Peso'),(10,'AUD','Australian Dollar'),(11,'AWG','Aruban Florin'),(12,'BBD','Barbados Dollar'),(13,'BDT','Bangladeshi Taka'),(15,'BGL','Bulgarian Lev'),(16,'BHD','Bahraini Dinar'),(17,'BIF','Burundi Franc'),(18,'BMD','Bermudian Dollar'),(19,'BND','Brunei Dollar'),(20,'BOB','Bolivian Boliviano'),(21,'BRL','Brazilian Real'),(22,'BSD','Bahamian Dollar'),(23,'BTN','Bhutan Ngultrum'),(24,'BWP','Botswana Pula'),(25,'BZD','Belize Dollar'),(26,'CAD','Canadian Dollar'),(27,'CHF','Swiss Franc'),(28,'CLP','Chilean Peso'),(29,'CNY','Chinese Yuan Renminbi'),(30,'COP','Colombian Peso'),(31,'CRC','Costa Rican Colon'),(32,'CUP','Cuban Peso'),(33,'CVE','Cape Verde Escudo'),(34,'CYP','Cyprus Pound'),(171,'CZK','Czech Koruna'),(37,'DJF','Djibouti Franc'),(38,'DKK','Danish Krona'),(39,'DOP','Dominican Peso'),(40,'DZD','Algerian Dinar'),(41,'ECS','Ecuador Sucre'),(43,'EEK','Estonian Krona'),(44,'EGP','Egyptian Pound'),(46,'ETB','Ethiopian Birr'),(42,'EUR','Euro'),(48,'FJD','Fiji Dollar'),(49,'FKP','Falkland Islands Pound'),(51,'GBP','Pound Sterling'),(52,'GHC','Ghanaian Cedi'),(53,'GIP','Gibraltar Pound'),(54,'GMD','Gambian Dalasi'),(55,'GNF','Guinea Franc'),(57,'GTQ','Guatemalan Quetzal'),(58,'GYD','Guyanan Dollar'),(59,'HKD','Hong Kong Dollar'),(60,'HNL','Honduran Lempira'),(61,'HRK','Croatian Kuna'),(62,'HTG','Haitian Gourde'),(63,'HUF','Hungarian Forint'),(64,'IDR','Indonesian Rupiah'),(66,'ILS','Israeli New Shekel'),(67,'INR','Indian Rupee'),(68,'IQD','Iraqi Dinar'),(69,'IRR','Iranian Rial'),(70,'ISK','Iceland Krona'),(72,'JMD','Jamaican Dollar'),(73,'JOD','Jordanian Dinar'),(74,'JPY','Japanese Yen'),(75,'KES','Kenyan Shilling'),(76,'KHR','Kampuchean Riel'),(77,'KMF','Comoros Franc'),(78,'KPW','North Korean Won'),(79,'KRW','Korean Won'),(80,'KWD','Kuwaiti Dinar'),(81,'KYD','Cayman Islands Dollar'),(82,'KZT','Kazakhstan Tenge'),(83,'LAK','Lao Kip'),(84,'LBP','Lebanese Pound'),(85,'LKR','Sri Lanka Rupee'),(86,'LRD','Liberian Dollar'),(87,'LSL','Lesotho Loti'),(88,'LTL','Lithuanian Litas'),(90,'LVL','Latvian Lats'),(91,'LYD','Libyan Dinar'),(92,'MAD','Moroccan Dirham'),(93,'MGF','Malagasy Franc'),(94,'MMK','Myanmar Kyat'),(95,'MNT','Mongolian Tugrik'),(96,'MOP','Macau Pataca'),(97,'MRO','Mauritanian Ouguiya'),(98,'MTL','Maltese Lira'),(99,'MUR','Mauritius Rupee'),(100,'MVR','Maldive Rufiyaa'),(101,'MWK','Malawi Kwacha'),(102,'MXN','Mexican New Peso'),(172,'MXP','Mexican Peso'),(103,'MYR','Malaysian Ringgit'),(104,'MZM','Mozambique Metical'),(105,'NAD','Namibia Dollar'),(106,'NGN','Nigerian Naira'),(107,'NIO','Nicaraguan Cordoba Oro'),(109,'NOK','Norwegian Krona'),(110,'NPR','Nepalese Rupee'),(111,'NZD','New Zealand Dollar'),(112,'OMR','Omani Rial'),(113,'PAB','Panamanian Balboa'),(114,'PEN','Peruvian Nuevo Sol'),(115,'PGK','Papua New Guinea Kina'),(116,'PHP','Philippine Peso'),(117,'PKR','Pakistan Rupee'),(118,'PLN','Polish Zloty'),(120,'PYG','Paraguay Guarani'),(121,'QAR','Qatari Rial'),(122,'ROL','Romanian Leu'),(123,'RUB','Russian Rouble'),(180,'RUR','Russia Rubles'),(124,'SAR','South African Rand'),(125,'SBD','Solomon Islands Dollar'),(126,'SCR','Seychelles Rupee'),(127,'SDD','Sudanese Dinar'),(128,'SDP','Sudanese Pound'),(129,'SEK','Swedish Krona'),(131,'SGD','Singapore Dollar'),(132,'SHP','St. Helena Pound'),(130,'SKK','Slovak Koruna'),(135,'SLL','Sierra Leone Leone'),(136,'SOS','Somali Shilling'),(137,'SRG','Suriname Guilder'),(138,'STD','Sao Tome/Principe Dobra'),(139,'SVC','El Salvador Colon'),(140,'SYP','Syrian Pound'),(141,'SZL','Swaziland Lilangeni'),(142,'THB','Thai Baht'),(143,'TND','Tunisian Dinar'),(144,'TOP','Tongan Pa\'anga'),(145,'TRL','Turkish Lira'),(146,'TTD','Trinidad/Tobago Dollar'),(147,'TWD','Taiwan Dollar'),(148,'TZS','Tanzanian Shilling'),(149,'UAH','Ukraine Hryvnia'),(150,'UGX','Uganda Shilling'),(151,'USD','United States Dollar'),(152,'UYP','Uruguayan Peso'),(153,'VEB','Venezuelan Bolivar'),(154,'VND','Vietnamese Dong'),(155,'VUV','Vanuatu Vatu'),(156,'WST','Samoan Tala'),(158,'XAF','CFA Franc BEAC'),(159,'XAG','Silver (oz.)'),(160,'XAU','Gold (oz.)'),(161,'XCD','Eastern Caribbean Dollars'),(179,'XDR','IMF Special Drawing Right'),(162,'XOF','CFA Franc BCEAO'),(163,'XPD','Palladium (oz.)'),(164,'XPF','Franc des Comptoirs fran√ßais du Pacifique'),(165,'XPT','Platinum (oz.)'),(166,'YER','Yemeni Riyal'),(167,'YUM','Yugoslavian Dinar'),(175,'YUN','Yugoslav Dinar'),(168,'ZAR','South African Rand'),(176,'ZMK','Zambian Kwacha'),(169,'ZRN','New Zaire'),(170,'ZWD','Zimbabwe Dollar');
/*!40000 ALTER TABLE `hs_hr_currency_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_customer`
--

DROP TABLE IF EXISTS `hs_hr_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_customer`
--

LOCK TABLES `hs_hr_customer` WRITE;
/*!40000 ALTER TABLE `hs_hr_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_db_version`
--

DROP TABLE IF EXISTS `hs_hr_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_db_version` (
  `id` varchar(36) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `entered_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `entered_by` varchar(36) DEFAULT NULL,
  `modified_by` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xif1hs_hr_db_version` (`entered_by`),
  KEY `xif2hs_hr_db_version` (`modified_by`),
  CONSTRAINT `hs_hr_db_version_ibfk_1` FOREIGN KEY (`entered_by`) REFERENCES `hs_hr_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hs_hr_db_version_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `hs_hr_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_db_version`
--

LOCK TABLES `hs_hr_db_version` WRITE;
/*!40000 ALTER TABLE `hs_hr_db_version` DISABLE KEYS */;
INSERT INTO `hs_hr_db_version` VALUES ('DVR001','mysql4.1','initial DB','2005-10-10 00:00:00','2005-12-20 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_dis_action_type`
--

DROP TABLE IF EXISTS `hs_hr_dis_action_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_dis_action_type` (
  `dis_acttype_id` int(8) NOT NULL AUTO_INCREMENT,
  `dis_acttype_name` varchar(100) DEFAULT NULL,
  `dis_acttype_name_si` varchar(100) DEFAULT NULL,
  `dis_acttype_name_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dis_acttype_id`),
  UNIQUE KEY `dis_acttype_name_ta` (`dis_acttype_name_ta`),
  UNIQUE KEY `dis_acttype_name_si` (`dis_acttype_name_si`),
  UNIQUE KEY `dis_acttype_name` (`dis_acttype_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_dis_action_type`
--

LOCK TABLES `hs_hr_dis_action_type` WRITE;
/*!40000 ALTER TABLE `hs_hr_dis_action_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_dis_action_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_dis_attachment`
--

DROP TABLE IF EXISTS `hs_hr_dis_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_dis_attachment` (
  `dis_attach_id` int(20) NOT NULL AUTO_INCREMENT,
  `dis_attach_name` varchar(50) DEFAULT NULL,
  `dis_attach_type` varchar(50) DEFAULT NULL,
  `dis_attach_content` mediumblob,
  `dis_inc_id` int(20) NOT NULL DEFAULT '0',
  `dis_attach_category` varchar(20) NOT NULL,
  PRIMARY KEY (`dis_attach_id`,`dis_inc_id`),
  KEY `xif1hs_hr_dis_attachment` (`dis_inc_id`),
  CONSTRAINT `hs_hr_dis_attachment_ibfk_1` FOREIGN KEY (`dis_inc_id`) REFERENCES `hs_hr_dis_incidents` (`dis_inc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_dis_attachment`
--

LOCK TABLES `hs_hr_dis_attachment` WRITE;
/*!40000 ALTER TABLE `hs_hr_dis_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_dis_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_dis_finalaction`
--

DROP TABLE IF EXISTS `hs_hr_dis_finalaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_dis_finalaction` (
  `dis_fna_code` int(10) NOT NULL AUTO_INCREMENT,
  `dis_fna_usercode` varchar(10) DEFAULT NULL,
  `dis_fna_name` varchar(200) DEFAULT NULL,
  `dis_fna_name_si` varchar(200) DEFAULT NULL,
  `dis_fna_name_ta` varchar(200) DEFAULT NULL,
  `dis_fna_type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`dis_fna_code`),
  UNIQUE KEY `dis_fna_usercode` (`dis_fna_usercode`),
  UNIQUE KEY `dis_fna_name` (`dis_fna_name`),
  UNIQUE KEY `dis_fna_name_si` (`dis_fna_name_si`),
  UNIQUE KEY `dis_fna_name_ta` (`dis_fna_name_ta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_dis_finalaction`
--

LOCK TABLES `hs_hr_dis_finalaction` WRITE;
/*!40000 ALTER TABLE `hs_hr_dis_finalaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_dis_finalaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_dis_incidents`
--

DROP TABLE IF EXISTS `hs_hr_dis_incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_dis_incidents` (
  `dis_inc_id` int(20) NOT NULL AUTO_INCREMENT,
  `dis_acttype_id` int(8) DEFAULT NULL,
  `dis_inc_level` int(6) DEFAULT NULL,
  `dis_inc_isclosed` int(4) DEFAULT NULL,
  `dis_inc_inq_officer` varchar(100) DEFAULT NULL,
  `dis_inc_pro_officer` varchar(100) DEFAULT NULL,
  `dis_inc_defe_officer` varchar(100) DEFAULT NULL,
  `dis_inc_filedate` date DEFAULT NULL,
  `dis_inc_date` date DEFAULT NULL,
  `dis_inc_time` time DEFAULT NULL,
  `dis_inc_incident` varchar(1000) DEFAULT NULL,
  `dis_inc_incident_si` varchar(200) DEFAULT NULL,
  `dis_inc_incident_ta` varchar(200) DEFAULT NULL,
  `dis_inc_reportedby` varchar(100) DEFAULT NULL,
  `dis_inc_prelim_com` varchar(200) DEFAULT NULL,
  `dis_inc_finact_tknby` varchar(100) DEFAULT NULL,
  `dis_inc_finact_tkn` varchar(100) DEFAULT NULL,
  `dis_inc_finact_tkndate` date DEFAULT NULL,
  `dis_inc_type` varchar(100) DEFAULT NULL,
  `dis_inc_prim_summary` varchar(200) DEFAULT NULL,
  `dis_inc_reporteddate` date DEFAULT NULL,
  `dis_inc_reportedtime` time DEFAULT NULL,
  `dis_inc_todate` date DEFAULT NULL,
  `dis_inc_totime` time DEFAULT NULL,
  `dis_inc_major_mionor_flg` varchar(1) DEFAULT NULL,
  `dis_inc_investigation_auditfb` varchar(200) DEFAULT NULL,
  `dis_inc_ifchargesheetissued_flg` varchar(1) DEFAULT NULL,
  `dis_inc_chargesheet_comment` varchar(200) DEFAULT NULL,
  `dis_inc_caseclosed_comment` varchar(10) DEFAULT NULL,
  `dis_inc_furtheraction_flg` varchar(10) DEFAULT NULL,
  `dis_inc_furtheraction_comment` varchar(200) DEFAULT NULL,
  `dis_inc_intedicted_flg` varchar(1) DEFAULT NULL,
  `dis_inc_intedicted_comment` varchar(200) DEFAULT NULL,
  `dis_inc_inquery_comment` varchar(200) DEFAULT NULL,
  `dis_fna_code` int(10) DEFAULT NULL,
  `dis_inc_finalaction_comment` varchar(200) DEFAULT NULL,
  `dis_inc_appeal_flg` varchar(1) DEFAULT NULL,
  `dis_inc_appeal_date` date DEFAULT NULL,
  `dis_inc_appeal_board_comment` varchar(200) DEFAULT NULL,
  `dis_inc_appeal_labour_comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`dis_inc_id`),
  KEY `xif1hs_hr_dis_incidents` (`dis_acttype_id`),
  KEY `hs_hr_dis_incidents_emp_dis_fna_code` (`dis_fna_code`),
  CONSTRAINT `hs_hr_dis_incidents_emp_dis_fna_code` FOREIGN KEY (`dis_fna_code`) REFERENCES `hs_hr_dis_finalaction` (`dis_fna_code`),
  CONSTRAINT `hs_hr_dis_incidents_ibfk_2` FOREIGN KEY (`dis_acttype_id`) REFERENCES `hs_hr_dis_action_type` (`dis_acttype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_dis_incidents`
--

LOCK TABLES `hs_hr_dis_incidents` WRITE;
/*!40000 ALTER TABLE `hs_hr_dis_incidents` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_dis_incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_dis_involved_emp`
--

DROP TABLE IF EXISTS `hs_hr_dis_involved_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_dis_involved_emp` (
  `emp_number` int(7) NOT NULL,
  `dis_inc_id` int(20) NOT NULL,
  `dis_inv_type` varchar(10) DEFAULT NULL,
  `dis_fna_code` int(10) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`dis_inc_id`),
  KEY `xif1hs_hr_dis_involved_emp` (`dis_inc_id`),
  KEY `hs_hr_dis_involved_emp_dis_fna_code` (`dis_fna_code`),
  CONSTRAINT `hs_hr_dis_involved_employee` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_dis_involved_emp_dis_fna_code` FOREIGN KEY (`dis_fna_code`) REFERENCES `hs_hr_dis_finalaction` (`dis_fna_code`),
  CONSTRAINT `hs_hr_dis_involved_emp_ibfk_1` FOREIGN KEY (`dis_inc_id`) REFERENCES `hs_hr_dis_incidents` (`dis_inc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_dis_involved_emp`
--

LOCK TABLES `hs_hr_dis_involved_emp` WRITE;
/*!40000 ALTER TABLE `hs_hr_dis_involved_emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_dis_involved_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_dis_offence`
--

DROP TABLE IF EXISTS `hs_hr_dis_offence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_dis_offence` (
  `dis_offence_id` int(8) NOT NULL AUTO_INCREMENT,
  `dis_acttype_id` int(8) NOT NULL,
  `dis_offence_name` varchar(100) NOT NULL,
  `dis_offence_name_si` varchar(100) DEFAULT NULL,
  `dis_offence_name_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dis_offence_id`),
  UNIQUE KEY `dis_offence_name` (`dis_offence_name`),
  UNIQUE KEY `dis_offence_name_ta` (`dis_offence_name_ta`),
  UNIQUE KEY `dis_offence_name_si` (`dis_offence_name_si`),
  KEY `xif1hs_hr_dis_offence` (`dis_acttype_id`),
  CONSTRAINT `hs_hr_dis_offence_ibfk_1` FOREIGN KEY (`dis_acttype_id`) REFERENCES `hs_hr_dis_action_type` (`dis_acttype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_dis_offence`
--

LOCK TABLES `hs_hr_dis_offence` WRITE;
/*!40000 ALTER TABLE `hs_hr_dis_offence` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_dis_offence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_dis_offence_list`
--

DROP TABLE IF EXISTS `hs_hr_dis_offence_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_dis_offence_list` (
  `dis_inc_id` int(20) NOT NULL DEFAULT '0',
  `dis_offence_id` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dis_inc_id`,`dis_offence_id`),
  KEY `xif1hs_hr_dis_offence_list` (`dis_offence_id`),
  KEY `xif2hs_hr_dis_offence_list` (`dis_inc_id`),
  CONSTRAINT `hs_hr_dis_offence_list_ibfk_1` FOREIGN KEY (`dis_inc_id`) REFERENCES `hs_hr_dis_incidents` (`dis_inc_id`),
  CONSTRAINT `hs_hr_dis_offence_list_ibfk_2` FOREIGN KEY (`dis_offence_id`) REFERENCES `hs_hr_dis_offence` (`dis_offence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_dis_offence_list`
--

LOCK TABLES `hs_hr_dis_offence_list` WRITE;
/*!40000 ALTER TABLE `hs_hr_dis_offence_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_dis_offence_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_district`
--

DROP TABLE IF EXISTS `hs_hr_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_district` (
  `district_id` int(20) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(100) DEFAULT NULL,
  `district_name_si` varchar(100) DEFAULT NULL,
  `district_name_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_district`
--

LOCK TABLES `hs_hr_district` WRITE;
/*!40000 ALTER TABLE `hs_hr_district` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_ebexam`
--

DROP TABLE IF EXISTS `hs_hr_ebexam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_ebexam` (
  `ebexam_id` int(25) NOT NULL AUTO_INCREMENT,
  `service_code` int(4) DEFAULT NULL,
  `grade_code` int(4) DEFAULT NULL,
  `ebexam_name` varchar(200) DEFAULT NULL,
  `ebexam_name_si` varchar(200) DEFAULT NULL,
  `ebexam_name_ta` varchar(200) DEFAULT NULL,
  `ebexam_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ebexam_id`),
  KEY `xif1hs_hr_ebexam` (`service_code`),
  KEY `xif2hs_hr_ebexam` (`grade_code`),
  CONSTRAINT `hs_hr_ebexam_ibfk_2` FOREIGN KEY (`service_code`) REFERENCES `hs_hr_service` (`service_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_ebexam`
--

LOCK TABLES `hs_hr_ebexam` WRITE;
/*!40000 ALTER TABLE `hs_hr_ebexam` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_ebexam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_education`
--

DROP TABLE IF EXISTS `hs_hr_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_education` (
  `edu_code` varchar(13) NOT NULL,
  `edu_name` varchar(100) DEFAULT NULL,
  `edu_name_si` varchar(100) DEFAULT NULL,
  `edu_name_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`edu_code`),
  UNIQUE KEY `edu_name_ta` (`edu_name_ta`),
  UNIQUE KEY `edu_name_si` (`edu_name_si`),
  UNIQUE KEY `edu_name` (`edu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_education`
--

LOCK TABLES `hs_hr_education` WRITE;
/*!40000 ALTER TABLE `hs_hr_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_eec`
--

DROP TABLE IF EXISTS `hs_hr_eec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_eec` (
  `eec_code` varchar(13) NOT NULL,
  `eec_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`eec_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_eec`
--

LOCK TABLES `hs_hr_eec` WRITE;
/*!40000 ALTER TABLE `hs_hr_eec` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_eec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_attachment`
--

DROP TABLE IF EXISTS `hs_hr_emp_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_attachment` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eattach_id` decimal(10,0) NOT NULL DEFAULT '0',
  `eattach_type_id` int(10) NOT NULL,
  `eattach_desc` varchar(200) DEFAULT NULL,
  `eattach_filename` varchar(100) DEFAULT NULL,
  `eattach_size` int(11) DEFAULT '0',
  `eattach_attachment` mediumblob,
  `eattach_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`eattach_id`),
  KEY `xif1hs_hr_emp_attachment` (`eattach_type_id`),
  KEY `xif2hs_hr_emp_attachment` (`emp_number`),
  CONSTRAINT `hs_hr_emp_attachment_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  CONSTRAINT `hs_hr_emp_attachment_ibfk_2` FOREIGN KEY (`eattach_type_id`) REFERENCES `hs_hr_emp_attachment_type` (`eattach_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_attachment`
--

LOCK TABLES `hs_hr_emp_attachment` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_attachment_type`
--

DROP TABLE IF EXISTS `hs_hr_emp_attachment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_attachment_type` (
  `eattach_type_id` int(10) NOT NULL,
  `eattach_type_name` varchar(100) NOT NULL,
  `eattach_type_name_si` varchar(100) NOT NULL,
  `eattach_type_name_ta` varchar(100) NOT NULL,
  PRIMARY KEY (`eattach_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_attachment_type`
--

LOCK TABLES `hs_hr_emp_attachment_type` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_attachment_type` DISABLE KEYS */;
INSERT INTO `hs_hr_emp_attachment_type` VALUES (0,'Document','‡∂Ω‡∑ö‡∂õ‡∂±','gsdfgsdfgdf'),(1,'sportsAttch','‡∂ö‡∑ô‡∑Ö‡∑í‡∂ö‡∑Ä‡∂ß','sportsAttch_ta'),(2,'test','‡∂¥‡∂ª‡∑ì‡∂ö‡∑ä‡∑Ç‡∂´','testTamil');
/*!40000 ALTER TABLE `hs_hr_emp_attachment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_bank`
--

DROP TABLE IF EXISTS `hs_hr_emp_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_bank` (
  `bbranch_code` varchar(6) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `ebank_acc_no` varchar(80) NOT NULL,
  `acctype_id` int(6) DEFAULT NULL,
  `ebank_amount` decimal(15,2) DEFAULT NULL,
  `ebank_order` int(4) DEFAULT NULL,
  `ebank_active_flag` int(1) DEFAULT NULL,
  `ebank_start_date` datetime DEFAULT NULL,
  `ebank_end_date` datetime DEFAULT NULL,
  `ebank_comment` varchar(200) DEFAULT NULL,
  KEY `xif1hs_hr_emp_bank` (`emp_number`),
  KEY `xif2hs_hr_emp_bank` (`bbranch_code`),
  KEY `hs_hr_bank_account_type_acctype_id` (`acctype_id`),
  CONSTRAINT `hs_hr_bank_account_type_acctype_id` FOREIGN KEY (`acctype_id`) REFERENCES `hs_hr_bank_account_type` (`acctype_id`),
  CONSTRAINT `hs_hr_emp_bank_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_emp_bank_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_bank`
--

LOCK TABLES `hs_hr_emp_bank` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_children`
--

DROP TABLE IF EXISTS `hs_hr_emp_children`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_children` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ec_name` varchar(100) DEFAULT NULL,
  `ec_date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`ec_seqno`),
  KEY `xif1hs_hr_emp_children` (`emp_number`),
  CONSTRAINT `hs_hr_emp_children_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_children`
--

LOCK TABLES `hs_hr_emp_children` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_children` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_children` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_contact`
--

DROP TABLE IF EXISTS `hs_hr_emp_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_contact` (
  `emp_number` int(7) NOT NULL,
  `con_off_addLine1` varchar(100) DEFAULT NULL,
  `con_off_addLine1_si` varchar(100) DEFAULT NULL,
  `con_off_addLine1_ta` varchar(100) DEFAULT NULL,
  `con_off_addLine2` varchar(100) DEFAULT NULL,
  `con_off_addLine2_si` varchar(100) DEFAULT NULL,
  `con_off_addLine2_ta` varchar(100) DEFAULT NULL,
  `con_off_del_postoffice` varchar(100) DEFAULT NULL,
  `con_off_del_postoffice_si` varchar(100) DEFAULT NULL,
  `con_off_del_postoffice_ta` varchar(100) DEFAULT NULL,
  `con_off_postal_code` varchar(50) DEFAULT NULL,
  `con_off_country` varchar(100) DEFAULT NULL,
  `con_off_intercom` varchar(20) DEFAULT NULL,
  `con_off_vip` varchar(20) DEFAULT NULL,
  `con_off_direct` varchar(20) DEFAULT NULL,
  `con_off_ext` varchar(20) DEFAULT NULL,
  `con_off_fax` varchar(20) DEFAULT NULL,
  `con_off_email` varchar(100) DEFAULT NULL,
  `con_off_url` varchar(100) DEFAULT NULL,
  `con_res_addLine1` varchar(100) DEFAULT NULL,
  `con_res_addLine1_si` varchar(100) DEFAULT NULL,
  `con_res_addLine1_ta` varchar(100) DEFAULT NULL,
  `con_res_addLine2` varchar(100) DEFAULT NULL,
  `con_res_addLine2_si` varchar(100) DEFAULT NULL,
  `con_res_addLine2_ta` varchar(100) DEFAULT NULL,
  `con_res_del_postoffice` varchar(100) DEFAULT NULL,
  `con_res_del_postoffice_si` varchar(100) DEFAULT NULL,
  `con_res_del_postoffice_ta` varchar(100) DEFAULT NULL,
  `con_res_postal_code` varchar(10) DEFAULT NULL,
  `con_res_div_sectretariat` varchar(100) DEFAULT NULL,
  `con_res_div_sectretariat_si` varchar(100) DEFAULT NULL,
  `con_res_div_sectretariat_ta` varchar(100) DEFAULT NULL,
  `con_res_policesation` varchar(100) DEFAULT NULL,
  `con_res_policesation_si` varchar(100) DEFAULT NULL,
  `con_res_policesation_ta` varchar(100) DEFAULT NULL,
  `con_res_district` varchar(100) DEFAULT NULL,
  `con_res_district_si` varchar(100) DEFAULT NULL,
  `con_res_district_ta` varchar(100) DEFAULT NULL,
  `con_res_phone` varchar(20) DEFAULT NULL,
  `con_res_fax` varchar(20) DEFAULT NULL,
  `con_res_mobile` varchar(20) DEFAULT NULL,
  `con_res_email` varchar(100) DEFAULT NULL,
  `con_per_addLine1` varchar(100) DEFAULT NULL,
  `con_per_addLine1_si` varchar(100) DEFAULT NULL,
  `con_per_addLine1_ta` varchar(100) DEFAULT NULL,
  `con_per_addLine2` varchar(100) DEFAULT NULL,
  `con_per_addLine2_si` varchar(100) DEFAULT NULL,
  `con_per_addLine2_ta` varchar(100) DEFAULT NULL,
  `con_per_del_postoffice` varchar(100) DEFAULT NULL,
  `con_per_del_postoffice_si` varchar(100) DEFAULT NULL,
  `con_per_del_postoffice_ta` varchar(100) DEFAULT NULL,
  `con_per_postal_code` varchar(10) DEFAULT NULL,
  `con_per_div_sectretariat` varchar(100) DEFAULT NULL,
  `con_per_div_sectretariat_si` varchar(100) DEFAULT NULL,
  `con_per_div_sectretariat_ta` varchar(100) DEFAULT NULL,
  `con_per_policesation` varchar(100) DEFAULT NULL,
  `con_per_policesation_si` varchar(100) DEFAULT NULL,
  `con_per_policesation_ta` varchar(100) DEFAULT NULL,
  `con_per_district` varchar(100) DEFAULT NULL,
  `con_per_district_si` varchar(100) DEFAULT NULL,
  `con_per_district_ta` varchar(100) DEFAULT NULL,
  `con_per_phone` varchar(20) DEFAULT NULL,
  `con_per_fax` varchar(20) DEFAULT NULL,
  `con_per_mobile` varchar(20) DEFAULT NULL,
  `con_per_email` varchar(100) DEFAULT NULL,
  `con_oth_addLine1` varchar(100) DEFAULT NULL,
  `con_oth_addLine2` varchar(100) DEFAULT NULL,
  `con_oth_addLine2_si` varchar(100) DEFAULT NULL,
  `con_oth_addLine2_ta` varchar(100) DEFAULT NULL,
  `con_oth_addLine1_si` varchar(100) DEFAULT NULL,
  `con_oth_addLine1_ta` varchar(100) DEFAULT NULL,
  `con_oth_postal_code` varchar(10) DEFAULT NULL,
  `con_oth_del_postoffice` varchar(100) DEFAULT NULL,
  `con_oth_del_postoffice_si` varchar(100) DEFAULT NULL,
  `con_oth_del_postoffice_ta` varchar(100) DEFAULT NULL,
  `con_oth_div_sectretariat` varchar(100) DEFAULT NULL,
  `con_oth_div_sectretariat_si` varchar(100) DEFAULT NULL,
  `con_oth_div_sectretariat_ta` varchar(100) DEFAULT NULL,
  `con_oth_policesation` varchar(100) DEFAULT NULL,
  `con_oth_phone` varchar(20) DEFAULT NULL,
  `con_oth_policesation_si` varchar(100) DEFAULT NULL,
  `con_oth_policesation_ta` varchar(100) DEFAULT NULL,
  `con_oth_district` varchar(100) DEFAULT NULL,
  `con_oth_district_si` varchar(100) DEFAULT NULL,
  `con_oth_district_ta` varchar(100) DEFAULT NULL,
  `con_oth_fax` varchar(20) DEFAULT NULL,
  `con_oth_mobile` varchar(20) DEFAULT NULL,
  `con_oth_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_number`),
  KEY `xif1hs_hr_emp_contact` (`emp_number`),
  CONSTRAINT `hs_hr_emp_contact_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_contact`
--

LOCK TABLES `hs_hr_emp_contact` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_contact` DISABLE KEYS */;
INSERT INTO `hs_hr_emp_contact` VALUES (1,'','','','','','','','','','','LK','','','0112879456','','','AmalKuree@gmail.com','','','','','','','','','','','','','','','','','','','','','','','','','789-A , Borella,','','','Colombo 08','','','Borella','','','58745','','','','','','','','','','0112871254','','','','','','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `hs_hr_emp_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_dependents`
--

DROP TABLE IF EXISTS `hs_hr_emp_dependents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_dependents` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ed_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ed_name` varchar(100) DEFAULT NULL,
  `ed_name_si` varchar(100) DEFAULT NULL,
  `ed_name_ta` varchar(100) DEFAULT NULL,
  `rel_code` int(4) DEFAULT NULL,
  `ed_birthday` date DEFAULT NULL,
  `ed_workplace` varchar(200) DEFAULT NULL,
  `ed_workplace_si` varchar(200) DEFAULT NULL,
  `ed_workplace_ta` varchar(200) DEFAULT NULL,
  `ed_education_center` varchar(100) DEFAULT NULL,
  `ed_education_center_si` varchar(100) DEFAULT NULL,
  `ed_education_center_ta` varchar(100) DEFAULT NULL,
  `ed_address` varchar(200) DEFAULT NULL,
  `ed_address_si` varchar(200) DEFAULT NULL,
  `ed_address_ta` varchar(200) DEFAULT NULL,
  `ed_comments` varchar(200) DEFAULT NULL,
  `ed_comments_si` varchar(200) DEFAULT NULL,
  `ed_comments_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`ed_seqno`),
  KEY `xif1hs_hr_emp_dependents` (`rel_code`),
  KEY `xif2hs_hr_emp_dependents` (`emp_number`),
  CONSTRAINT `hs_hr_emp_dependents_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  CONSTRAINT `hs_hr_emp_dependents_ibfk_2` FOREIGN KEY (`rel_code`) REFERENCES `hs_hr_relationship` (`rel_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_dependents`
--

LOCK TABLES `hs_hr_emp_dependents` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_dependents` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_dependents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_disciaction`
--

DROP TABLE IF EXISTS `hs_hr_emp_disciaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_disciaction` (
  `emp_dis_id` int(20) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `emp_dis_effectfrom` date DEFAULT NULL,
  `emp_dis_effectto` date DEFAULT NULL,
  `emp_dis_action` varchar(100) DEFAULT NULL,
  `emp_dis_comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`emp_dis_id`),
  KEY `xif1hs_hr_emp_disciaction` (`emp_number`),
  CONSTRAINT `hs_hr_emp_disciaction_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_disciaction`
--

LOCK TABLES `hs_hr_emp_disciaction` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_disciaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_disciaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_ebexam`
--

DROP TABLE IF EXISTS `hs_hr_emp_ebexam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_ebexam` (
  `ebexam_id` int(25) NOT NULL,
  `employee_id` int(7) NOT NULL DEFAULT '0',
  `emp_ebexam_duedate` date DEFAULT NULL,
  `emp_ebexam_completedate` date DEFAULT NULL,
  `emp_ebexam_status` varchar(10) DEFAULT NULL,
  `emp_ebexam_remarks` varchar(200) DEFAULT NULL,
  `emp_ebexam_genaralcomment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ebexam_id`,`employee_id`),
  KEY `xif1hs_hr_emp_ebexam` (`employee_id`),
  KEY `xif2hs_hr_emp_ebexam` (`ebexam_id`),
  CONSTRAINT `hs_hr_emp_ebexam_ibfk_1` FOREIGN KEY (`ebexam_id`) REFERENCES `hs_hr_ebexam` (`ebexam_id`),
  CONSTRAINT `hs_hr_emp_ebexam_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_ebexam`
--

LOCK TABLES `hs_hr_emp_ebexam` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_ebexam` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_ebexam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_education`
--

DROP TABLE IF EXISTS `hs_hr_emp_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_education` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `edu_code` varchar(13) NOT NULL,
  `edu_institute` varchar(100) DEFAULT NULL,
  `edu_institute_si` varchar(100) DEFAULT NULL,
  `edu_institute_ta` varchar(100) DEFAULT NULL,
  `edu_stream` varchar(100) DEFAULT NULL,
  `edu_stream_si` varchar(100) DEFAULT NULL,
  `edu_stream_ta` varchar(100) DEFAULT NULL,
  `edu_index_no` varchar(50) DEFAULT NULL,
  `edu_start_date` datetime DEFAULT NULL,
  `edu_end_date` datetime DEFAULT NULL,
  `edu_year` decimal(4,0) DEFAULT NULL,
  `edu_confirmed_flg` int(1) DEFAULT NULL,
  PRIMARY KEY (`edu_code`,`emp_number`),
  KEY `xif1hs_hr_emp_education` (`emp_number`),
  KEY `xif2hs_hr_emp_education` (`edu_code`),
  CONSTRAINT `hs_hr_emp_education_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_emp_education_ibfk_2` FOREIGN KEY (`edu_code`) REFERENCES `hs_hr_education` (`edu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_education`
--

LOCK TABLES `hs_hr_emp_education` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_emergency_contacts`
--

DROP TABLE IF EXISTS `hs_hr_emp_emergency_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_emergency_contacts` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `eec_name` varchar(100) DEFAULT NULL,
  `eec_name_si` varchar(100) DEFAULT NULL,
  `eec_name_ta` varchar(100) DEFAULT NULL,
  `eec_relationship` varchar(100) DEFAULT NULL,
  `eec_relationship_si` varchar(100) DEFAULT NULL,
  `eec_relationship_ta` varchar(100) DEFAULT NULL,
  `eec_address` varchar(200) DEFAULT NULL,
  `eec_address_si` varchar(200) DEFAULT NULL,
  `eec_address_ta` varchar(200) DEFAULT NULL,
  `eec_home_no` varchar(100) DEFAULT NULL,
  `eec_mobile_no` varchar(100) DEFAULT NULL,
  `eec_office_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`eec_seqno`),
  KEY `xif1hs_hr_emp_emergency_contacts` (`emp_number`),
  CONSTRAINT `hs_hr_emp_emergency_contacts_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_emergency_contacts`
--

LOCK TABLES `hs_hr_emp_emergency_contacts` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_emergency_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_emergency_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_history_of_ealier_pos`
--

DROP TABLE IF EXISTS `hs_hr_emp_history_of_ealier_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_history_of_ealier_pos` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `emp_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ehoep_job_title` varchar(100) DEFAULT NULL,
  `ehoep_years` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`emp_seqno`),
  KEY `xif1hs_hr_emp_history_of_ealier_pos` (`emp_number`),
  CONSTRAINT `hs_hr_emp_history_of_ealier_pos_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_history_of_ealier_pos`
--

LOCK TABLES `hs_hr_emp_history_of_ealier_pos` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_history_of_ealier_pos` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_history_of_ealier_pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_job_role`
--

DROP TABLE IF EXISTS `hs_hr_emp_job_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_job_role` (
  `jrl_id` int(4) NOT NULL AUTO_INCREMENT,
  `jobtit_code` varchar(13) DEFAULT NULL,
  `level_code` int(4) DEFAULT NULL,
  `service_code` int(4) DEFAULT NULL,
  `jrl_name` varchar(200) DEFAULT NULL,
  `jrl_name_si` varchar(200) DEFAULT NULL,
  `jrl_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`jrl_id`),
  KEY `hs_hr_emp_job_role_jobtit_code` (`jobtit_code`),
  KEY `hs_hr_emp_job_role_level_code` (`level_code`),
  KEY `hs_hr_emp_job_role_service_code` (`service_code`),
  CONSTRAINT `hs_hr_emp_job_role_jobtit_code` FOREIGN KEY (`jobtit_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`),
  CONSTRAINT `hs_hr_emp_job_role_level_code` FOREIGN KEY (`level_code`) REFERENCES `hs_hr_level` (`level_code`),
  CONSTRAINT `hs_hr_emp_job_role_service_code` FOREIGN KEY (`service_code`) REFERENCES `hs_hr_service` (`service_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_job_role`
--

LOCK TABLES `hs_hr_emp_job_role` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_job_role` DISABLE KEYS */;
INSERT INTO `hs_hr_emp_job_role` VALUES (1,'JOB001',1,1,'Job Role',NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_emp_job_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_jobtitle_history`
--

DROP TABLE IF EXISTS `hs_hr_emp_jobtitle_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_jobtitle_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `code` varchar(15) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xif1hs_hr_emp_jobtitle_history` (`emp_number`),
  CONSTRAINT `hs_hr_emp_jobtitle_history_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_jobtitle_history`
--

LOCK TABLES `hs_hr_emp_jobtitle_history` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_jobtitle_history` DISABLE KEYS */;
INSERT INTO `hs_hr_emp_jobtitle_history` VALUES (1,1,'JOB001','Designation','2012-10-28 15:50:20',NULL);
/*!40000 ALTER TABLE `hs_hr_emp_jobtitle_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_language`
--

DROP TABLE IF EXISTS `hs_hr_emp_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_language` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `lang_code` varchar(13) NOT NULL,
  `emplang_type` smallint(6) NOT NULL DEFAULT '0',
  `emplang_competency` smallint(6) DEFAULT '0',
  PRIMARY KEY (`emp_number`,`lang_code`,`emplang_type`),
  KEY `xif1hs_hr_emp_language` (`lang_code`),
  KEY `xif2hs_hr_emp_language` (`emp_number`),
  CONSTRAINT `hs_hr_emp_language_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_emp_language_ibfk_2` FOREIGN KEY (`lang_code`) REFERENCES `hs_hr_language` (`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_language`
--

LOCK TABLES `hs_hr_emp_language` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_level`
--

DROP TABLE IF EXISTS `hs_hr_emp_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_level` (
  `emp_number` int(50) NOT NULL,
  `hie_code_1` int(50) DEFAULT NULL,
  `hie_code_2` int(50) DEFAULT NULL,
  `hie_code_3` int(50) DEFAULT NULL,
  `hie_code_4` int(50) DEFAULT NULL,
  `hie_code_5` int(50) DEFAULT NULL,
  `hie_code_6` int(50) DEFAULT NULL,
  `hie_code_7` int(50) DEFAULT NULL,
  `hie_code_8` int(50) DEFAULT NULL,
  `hie_code_9` int(50) DEFAULT NULL,
  `hie_code_10` int(50) DEFAULT NULL,
  PRIMARY KEY (`emp_number`),
  KEY `emp_number` (`emp_number`),
  KEY `hie_code_1` (`hie_code_1`),
  KEY `hie_code_3` (`hie_code_3`),
  KEY `hie_code_4` (`hie_code_4`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_level`
--

LOCK TABLES `hs_hr_emp_level` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_level` DISABLE KEYS */;
INSERT INTO `hs_hr_emp_level` VALUES (1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_emp_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_licenses`
--

DROP TABLE IF EXISTS `hs_hr_emp_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_licenses` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `lic_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `lic_number` varchar(50) NOT NULL,
  `lic_type` varchar(100) DEFAULT NULL,
  `lic_type_si` varchar(100) DEFAULT NULL,
  `lic_type_ta` varchar(100) DEFAULT NULL,
  `lic_issue_date` date DEFAULT NULL,
  `lic_expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`lic_seqno`),
  KEY `xif1hs_hr_emp_licenses` (`emp_number`),
  CONSTRAINT `hs_hr_emp_licenses_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_licenses`
--

LOCK TABLES `hs_hr_emp_licenses` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_location_history`
--

DROP TABLE IF EXISTS `hs_hr_emp_location_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_location_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `code` varchar(15) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xif1hs_hr_emp_location_history` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_location_history`
--

LOCK TABLES `hs_hr_emp_location_history` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_location_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_location_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_locations`
--

DROP TABLE IF EXISTS `hs_hr_emp_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_locations` (
  `emp_number` int(7) NOT NULL,
  `loc_code` varchar(13) NOT NULL,
  PRIMARY KEY (`emp_number`,`loc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_locations`
--

LOCK TABLES `hs_hr_emp_locations` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_picture`
--

DROP TABLE IF EXISTS `hs_hr_emp_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_picture` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `epic_picture` mediumblob,
  `epic_filename` varchar(100) DEFAULT NULL,
  `epic_type` varchar(50) DEFAULT NULL,
  `epic_file_size` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`emp_number`),
  KEY `xif1hs_hr_emp_picture` (`emp_number`),
  CONSTRAINT `hs_hr_emp_picture_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_picture`
--

LOCK TABLES `hs_hr_emp_picture` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_picture` DISABLE KEYS */;
INSERT INTO `hs_hr_emp_picture` VALUES (1,'ˇÿˇ‡\0JFIF\0\0d\0d\0\0ˇ·¥Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j(\0\0\0\0\0\0\01\0\0\0\0\0\0\0r2\0\0\0\0\0\0\0éái\0\0\0\0\0\0\0§\0\0\0–\0B@\0\0\'\0B@\0\0\'Adobe Photoshop CS4 Windows\02011:07:07 10:32:52\0\0\0\0†\0\0\0\0\0\0\0†\0\0\0\0\0\0\0ƒ†\0\0\0\0\0\0\0»\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0&(\0\0\0\0\0\0\0\0\0\0\0\0\0.\0\0\0\0\0\0~\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ˇÿˇ‡\0JFIF\0\0\0H\0H\0\0ˇÌ\0Adobe_CM\0ˇÓ\0Adobe\0dÄ\0\0\0ˇ€\0Ñ\0			\n\r\r\rˇ¿\0\0†\0ù\"\0ˇ›\0\0\nˇƒ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"qÅ2ë°±B#$R¡b34rÇ—C%íS·Òcs5¢≤É&DìTdE¬£t6“U‚eÚ≥Ñ√”u„ÛF\'î§Ö¥ïƒ‘‰Ù•µ≈’ÂıVfvÜñ¶∂∆÷Êˆ7GWgwáóß∑«◊Á˜\05\0!1AQaq\"2Åë°±B#¡R—3$b·rÇíCScs4Ò%¢≤É&5¬“DìT£dEU6te‚Ú≥Ñ√”u„ÛFî§Ö¥ïƒ‘‰Ù•µ≈’ÂıVfvÜñ¶∂∆÷Êˆ\'7GWgwáóß∑«ˇ⁄\0\0\0?\0ı4íI%):dÈ)IíI%)\'/£vU¨¢°ÀÏph˚‹±˛µ˝m¿˙∑ÖÍ[eÿ	«≈ªoyˇ\0Kyxá_˙œ’∫ÊQ»ÍÊOßS}µ∞Ã™ø¢œ˙¥ì^ß@˙ÔUˇ\0ˇ\0W0w6áúÀ˚§1ß‡˜˚ø5œ€˛9âsΩƒ4=ƒô? n’Â.q\'˚”Âpñ´ák}s¸r„CV§{Õoàwokˇ\05lÙˇ\0Òßıg.∆◊k¨∆s∂Ä^76]ÙÅs?qxYÒ\0ÄRèˆ%™èb®12Òsq€ìâk/¢ÕYed9ßÊWŒøW~∂unÉx≥\nÚ\ZùÓaÇÔ—NÕ⁄/m˙´ıø¶˝d«\'€2È\r7„ªB$;_Ô”π$÷£PÓ§íI!I”$íóLù$îˇ\0ˇ–ı4íI%):díRïN≠‘Ò∫ONø®e™ÜÓ#ªè≠ø {˝™⁄‡∆ˇ\0Ptå\\@Ìo±œ,ê¡Ìˇ\0§Ùîö|ªÎ\\ÃÎ=V¸¸∑n∂«m\rEåÕ’_ÚX≥`¥¿Ë4SÆ´oºzBdÇOÊ˛+ÍÒ…,uö4q∂\'¡ﬂºõ)πl«•∂œ6c¥\0Î¿¯+-¿…u\"ˇ\0LÌyÄc˚ó{çık\0ªd9∫ÉÊØå¸»\r&wç¿É¸ë∑jàÁcÀÅπ∑ÃÆ≈,ƒç4 Ná˜=øúÄ@ «Ê∏ç!zmﬂVh{ùeèsúËp–\0Üµµ™9?VÒZ\r	!—	„±QÂÅÿ”¿ÄÀèkª—ˇ\0íZˇ\0V:’›¨„Ê¥êhxﬁﬂm’OÚÿ≠g}[mz‘ËpÇt”Eãu7cem¥{⁄CÉª9K∆[1O°æ∑•áÈl\\örÒ´…°€™π°Ï<hQW%˛,:ùùCÍ≠b◊?◊—=‡E¨ﬂ¸Ø“.µ8µ™ç.ñâì§•$íI)ˇ—ı4íI%)$íIJ^C˛8rMΩsË⁄©hüÎ∏ΩŒ^ººK¸k‹,˙ŸsZu•ï4«i`søÍí]ô@√¢º}¿{ûdò‘èÕï–„TÑ\0\0\\Á’Ïó[Pû\Z`û‰Æö≠∆\0Ó™Ê˘ù_+£è^·‰≠≤∞U±©¥5\\k,¸eDñ0K&∂A1˛ıyÌy<h™_]£Qﬂ¡%*°:˜¸ãó˙Àà“⁄¨!—Ú+Æ»iÉ?5Œ}a≠¬¶¿˚Çõ	ıôÖ≈Ïøƒ∆HFÍ›È Ûã÷ˇ\0’RÂËK»≈s©Îπ8;¶º œùï89éˇ\0∂Ì±zÚ¥\\ÈäëRt…–BíH%))ˇ“ı4íI%)$íIJ^˛2$}iÍØÈ¯≤≤’ÓÀƒˇ\0∆\rÃ˙„wŸú-™ÔF›Z]õ!ﬂ…sR_èv}	ò∏U…Óü∫\\új@Ç	„N ãÒÎköˆ≤°P/˙¡çN-ô4·?/ÕcÏs≈`÷∫Ω·÷ÿ∆πæ˚+´cyñ÷‹â5ŸÈÒ≥qé÷8ÓØ∞“Û24\\v&G⁄Ò‘+©òmµÓec‘.-”‘’¨{k¯7€Z“Èπ◊úócZ=’∆Ë‡Ç7…GÑÏºYª∂∫¶wx33©„R@píT:∂M≠s*`≠t{,[Æ∫úlú ≈wª°∆ß?ﬂdêﬂ–˝-˚>ì∂5(ã;(ÿmºå⁄≤\Z][üHiß‹±˙¶%y8Œ®{Ovª≤+>±€ìéÎÌ¡€é€\r\"⁄Ãí@üS—,ÆÊSˇ\0Í‘€Ëd7‘©“◊v¯ßÅ¬v•ÜÎw¸^ZÏ_ÆòŒKÏ•”‹∫ªˇ\0VΩ—xF)7Î¶5‰;m9uÿ‡Õ\\Z@uÅç˛£úΩ÷ªmm∂≥πèÃp‡Ç%•YÏ” 5∂I”\'AbíI$îˇ\0ˇ”ı4íI%)$íIHÚ£⁄êÔ»Wïu¨A_[È≈¢h}è`\0h”SwçïÙó¨9°Õ-<8~kÅÍ5R‹:Ô¥dn3Ÿ—kˇ\0ëLùÉ±üÃÁ?ÂC\02IÒEß‹h˜@oÄQq_≤\0‰≠◊Í	:¯*ƒõn¿h‘vCﬁKˆ≤˜ƒk[Z»˛^—ÔU∞√j…ıC≠{µ\r–\0?5≠¸÷≠ }\ZZ €∫ÎN÷√G.{ø™°“\\ÁXÌ÷<Û§\0; I;®pçêı79i\Zµﬁ~	™∫ˆë`∞»·ÕkL|YÂ°ùàIgwhÅA¿§ÄÍ2#s@uv\r%ß≥ˇ\0™ê$lØI›œ…¢‹«o\'óÏU€”é7∫§∂Ï†TL˜˛*ñIüoo$l¢CG7›c#:⁄Àû ®5øÛZ„ÍWcø„v3⁄ΩCF-\"\"+hèê\\†Wk_Ùån3€Ë∞ˇ\0úÂË`\0\0\rào/£O?À\"§Èì©íI$ßˇ‘ı4íI%)$íIJ\\[§3#!∞\\ÍrˆûÃˇ\0ﬂ˜Æ˘guèÖïVKÕSuµû	Ç?F˝øæ›©≤^~9à›ﬁ°·q»›=ñÆ5Õó…©¶5”≈,À,ÆàkàëÜ∞´H\\æ≠ËO—“Íyæøuõµ”™©Äk7:Í«£s£sò6á˘÷U¸ﬂø˝#}Î2úº*ΩŸs¨|4˚âÛµˆ´∏ùC|÷∆8wﬁÁi¸¶ç®àH&C@€œ»≥hk…sôÓÄ¨;ï~ù‘Í¨ëaÿ˜!‹˛ŸSÀÕ¨5æõ+f\\\\Ú|ø5dø3˝î˙N\0aÉVëÂ#sy€ÏUê/Ûzlã⁄˙Ñ‹¨ªü¨™ù9Ô/±ÇEB<¸Êrèf≥¯ #R•≤ï≈µ“kı/§9°ÌuÏÈr=ø‘^Ü≤~ÆbTŒëà˜V”l9Ìypﬁ‚Ôkø™µïê*¸ZY\'ƒ@˝›ù2H¨]$íIOˇ’ı4íI%)$íIJI$íSÁΩJè≤ı<¨hÄ◊íœÍªﬁœ˙.Uﬂk[Ikƒ¡*⁄˙ÎèÈÁcÂ¥is\rn˛µgpˇ\0£bÊr¨\"ØU†º3W0s‘3á™€xßË˙$À«´\'S®¨x»EÈƒb◊>ß∞°núõÌPØ&òiô/\ZGè+JæüãóXs€π§π0Hç?I¶∂anCKYuLl\0E`k T™«¶áÚy\'A„lõáçY-lIÁïõc®¥ñì\rJ&DËã$jQ„]Qieq„§˜?ù˝TBcôMb]cÉZ<‹v∑Ú†TÊ4é	üå-/´uåéπà◊p«:”ÒcK€ˇ\0I:1π0 U˙=-¢äËo—©°É‡—µM$îÕ5$íI%tì\'IOˇ÷ı4íI$)$íI*I$+Ú©«§t∏∆Í„jHp˛πR˚Ò±ŸX±é}°Ω»kNÊ∑˚+å-“csO#¥ÿfÊ¨ØX~åW\r¨ÚZZw∂œÛΩ˚Îk®·äÓı+he9≈c_N∆ò»«”Û\Zˇ\0“Sˇ\0ehdâ\0KÌg¡/—?Gò4d„⁄\Z∆õÒ…öˆ∆˙ˇ\0ìû≈ßâ÷ŸMP˝’4} ˆπ§~â.ú§˙_®êSå{^ÿk‰xFQ;Üq6-{æ∞2÷Ì≠∆–th`.ù~óµSÆ¨ã^⁄k™$πﬁ“u˙©≈±ÉWD¯CÙ$ûHÔ)	Dlc#πDÅ∑Ëçﬂ˙°Y´?Ìvçµö´\'âq˜ª˚>û≈C¶ø.Õ£s(d^—/%ﬂÕ—C]Ì~Eﬂ ˆS_ÈÆˆ-™ÎÆäkmA¢∂Ä+kIp€Ùô?›w¨Ì˜zø·+˝.œ÷ÎR‚âñßnåY¶\0·\ZûØZòΩç-p∆\Z	‘û}´û«ÍYò¿ø’a‘2√$|ÙøÈ-<^±ây\r≥Ù6p7p™ÙÛ\ZÌÙíëßü$‘©$íIOˇ◊ı4í@…Œ∆∆“«{˘∑WÏ£HN´‰ılmÌœ˝∆ÍÔ¸≈e‰u<¨á0˙5¯4˚èıﬂ˘ªï&Älm`˛êê\Z√ƒ6øw˛	˛g˝∏·Ë∂ˆGVæŸ˛Ç±%«óG«ÛUzÍqyüsà$ 4áV◊ÔçÆsΩÓLÜQ¿{™6∆í Öﬂ¯Rçn±ÿy˛r÷Z‡{˚ÌØo˝Rx\0)\rpmå’èÎ<K]ÔgÕŸ≥oˆˇ\0ÎËåÆª©u/nˆYµªd4Ó ˙>ùüFã˛õq,˛g˘ÃGˆ571≤C[Ì“DÍX€ú–œﬁ˜ª+ü·^≈ˇ\0†÷Äˇ\0Õ‘A·ÏámñΩ≥˙z.o¶Ô¯Z˝?§§uùö2∆“‚	º4i-iá˛è˝-ˆ¶èÁX®≤à÷ªë˜r∫+\\‡È@˜ó∫\"=ï∫ÀõÓˆ˝n®œ¸/‘+\\∑÷¨ÿπ√ß·“Ïû†“`—¨≠Œ˜\ZÚFÔ“∑È^Ãm¯ˇ\0·Èˇ\0BÇx/Xh{61Ûi=Gv◊¢ÁΩ˚â ¥rO—÷W1z}l∂˝¨cd¥;‹!ßcÔΩ¨˛r∂Ÿ˙|jˇ\0¶d˚?ôXÿ=x`]IÎòøb≤Ú·èk-T÷«”∫ˆ{±}I˝%Ïı.¢è>•æ≠}0hw7kö—æH˝ßWÛm…≤øoM√˛oıÏØ”%Fc^Åyã“OﬁX1∫∑Ü≤[≤¬G¯KÈµÕˆªoÛ›g#ËﬁmØΩ@π÷⁄KÀ›∂K∑}2L≥Û.≥s?E˛	ˆa‚ß¥¥èh\r`h<ÀC[66,?ˆöó1ˆzˇ\0O.⁄ÔÍÕ’âÍ¶∞∑˜´ÄN‚=Õÿ7>œOÛ>»À=OOˇ\0,r±®ˇ\0¥jq›Æ»8;x˘¢Ê8%∂QÎm˝Íˇ\0Y≤™ˇ\0‚“5lhüQÂç#ê\\Ê¸¶˚∑µ9ÙŒ„S6W¥\ZŸ˚≠-Èœc?≤‘‰∏o1axÜı∂?Ì¶¢•±≥2q@4æu\rv¨#«‹µhÎî:í√Kø{È7ˇ\0$≤√dö@‹[ÈÜ¥˛t6 õˇ\0ü1T\Zˆ5Ì3π•ﬁË„πÌ‰˛vW˛¸‚ià*∑®cŸcw1¡Õ<ô	◊-]ôŒ.«∞∞ÉÓ€£N•ûˆª€ÙòÂ{ˆÌ˛Åõ}Y\0?Ûc˙üæö`m6ˇ\0ˇ–Ó2z”Ó/f!ÿ÷4∏º˝2\Z◊ø€¶ ˜6ß™é≠µ⁄ZÛºÄ˜<ùd∞€˘«›Ón=ä`úÇˇ\0£e÷µ§i˙¥—ˇ\0Sˆß&`u≠}è“À7i·∫∂7o˘›A `\0ŸjB÷Wª”–œß\nóø˚Nu™∂¡c≤‹>ë7‰Yôí?ÍXâî˝œp‰€p˙æ∂UŒˇ\0¿±´Qk1}3Ùç\r¨¸M‘ˇ\0’fπàEí∫–9h∞|´nœ˝”WÀ\0∑”D¥5ø˜’R·ª◊≥±eŒˇ\0<u?ÔÌWcı»˛_Â ?˘	Ÿ(K´≠√vÁ1ªÉ>ìö⁄±¨\rØ˛Ï’˝\'˛øO¸2ãæ«ò¨n}Jª´∂∑[óãOÈˇ\0(Ù‰ã´µæ¿Ú∆Uºä˛ú∂åmØ´˛\Z∑~íØÂ¢:¢⁄√‹t{âΩ\Z‚N˚qﬁ„µø§ksÒòÔÊÔ˚^7¯Dé·ôˆk¨¡˘uµ«ó{=bkkü\'€fÍùÔ˛õâm^øÎ˙´Ãq˙çXπû≥é[’2l{-53m¨;∂<ŸO—≤◊ÿ>Ü’Í≠`ı©.\0;sXvÒÌ…˜m›Óm{ÎˆW˛˘µ«˝uË7;ØÙ‡kjcr„ÙÖèm›V≠ÙÏf˜Wc⁄ÔÊÏﬂ˛\r:=ª†πy›<‡c_ù“ÚWa#Ì∏ó√ùS„ÈeaèÈv±ﬂF÷Ï˚7¸*Èæ™cıÙ\n‘^˜>›ˆT€	›]6ﬁïπ>◊9èkl≥\'7Û0ˇ\0S«˝+◊ ]ÖN]8∏ï∫¨ÚÊ6ÏáI∆mDèQ¯9Í]âcì˙ÙûöÙ¨∂1÷9§\r¢Ê4\0‹ö6{O∑Ù~™tÕÄZµ\\\Z%Â·ÅæÁ=Õ0Õª,ué´_Êk˚=Æß˝/ÏŒó˛Â:™xsôÈ¥ÿ∆=év‚Hut<œΩÿÆ≥Ì9ñ˚˝nßÛü†E¢õms<çÕt,%Ã∞Ó€Í˝ôŒ~M∂˙¶Íy†MMBªãCv;mi.Ô˝®ú≥¸.Müüìmâãê≥˘ôˇ\0Çiü˙Œ+∫ˆ∑¿º}ˆu:ˇ\0Ô»M´?‡ˇ\0û0ˇ\0Ú*’m%Ω¶–?ˆg,ﬂ“Ë§—ÈY¡amáœkzmö°¥:¶ö[˚∂üÂl £o˘ÿ4©~Œq\\˝Ùa;ˇ\0E£X¿ÎKFü¶ˇ\0±Ylˇ\0ø§Ñ6ê€ÊÃ;Ì\Z7ô∂∆Üˇ\0÷Ú˝Ñf±Öœ|ççs⁄eïÏ˙,ÿÅI6cÇ?ÏÌfúá:üioı˛≈_˝∫é¬~Õh,çu8Wß“˛§ÍwËmbEVˇ\0ˇŸˇÌ\ZÇPhotoshop 3.0\08BIM%\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08BIMÌ\0\0\0\0\0\0d\0\0\0\0\0d\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?Ä\0\08BIM\r\0\0\0\0\0\0\0\0x8BIM\0\0\0\0\0\0\0\08BIMÛ\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMı\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0°ôö\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM¯\0\0\0\0\0p\0\0ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇË\0\0\0\0ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇË\0\0\0\0ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇË\0\0\0\0ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇË\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\08BIM-\0\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0I\0\0\0\0\0\0\0\0\0\0\0\0\0\0»\0\0\0ƒ\0\0\0\n\0U\0n\0t\0i\0t\0l\0e\0d\0-\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ƒ\0\0\0»\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0»\0\0\0\0Rghtlong\0\0\0ƒ\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0»\0\0\0\0Rghtlong\0\0\0ƒ\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0ö\0\0\0\0\0\0ù\0\0\0†\0\0ÿ\0\'\0\0\0~\0\0ˇÿˇ‡\0JFIF\0\0\0H\0H\0\0ˇÌ\0Adobe_CM\0ˇÓ\0Adobe\0dÄ\0\0\0ˇ€\0Ñ\0			\n\r\r\rˇ¿\0\0†\0ù\"\0ˇ›\0\0\nˇƒ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"qÅ2ë°±B#$R¡b34rÇ—C%íS·Òcs5¢≤É&DìTdE¬£t6“U‚eÚ≥Ñ√”u„ÛF\'î§Ö¥ïƒ‘‰Ù•µ≈’ÂıVfvÜñ¶∂∆÷Êˆ7GWgwáóß∑«◊Á˜\05\0!1AQaq\"2Åë°±B#¡R—3$b·rÇíCScs4Ò%¢≤É&5¬“DìT£dEU6te‚Ú≥Ñ√”u„ÛFî§Ö¥ïƒ‘‰Ù•µ≈’ÂıVfvÜñ¶∂∆÷Êˆ\'7GWgwáóß∑«ˇ⁄\0\0\0?\0ı4íI%):dÈ)IíI%)\'/£vU¨¢°ÀÏph˚‹±˛µ˝m¿˙∑ÖÍ[eÿ	«≈ªoyˇ\0Kyxá_˙œ’∫ÊQ»ÍÊOßS}µ∞Ã™ø¢œ˙¥ì^ß@˙ÔUˇ\0ˇ\0W0w6áúÀ˚§1ß‡˜˚ø5œ€˛9âsΩƒ4=ƒô? n’Â.q\'˚”Âpñ´ák}s¸r„CV§{Õoàwokˇ\05lÙˇ\0Òßıg.∆◊k¨∆s∂Ä^76]ÙÅs?qxYÒ\0ÄRèˆ%™èb®12Òsq€ìâk/¢ÕYed9ßÊWŒøW~∂unÉx≥\nÚ\ZùÓaÇÔ—NÕ⁄/m˙´ıø¶˝d«\'€2È\r7„ªB$;_Ô”π$÷£PÓ§íI!I”$íóLù$îˇ\0ˇ–ı4íI%):díRïN≠‘Ò∫ONø®e™ÜÓ#ªè≠ø {˝™⁄‡∆ˇ\0Ptå\\@Ìo±œ,ê¡Ìˇ\0§Ùîö|ªÎ\\ÃÎ=V¸¸∑n∂«m\rEåÕ’_ÚX≥`¥¿Ë4SÆ´oºzBdÇOÊ˛+ÍÒ…,uö4q∂\'¡ﬂºõ)πl«•∂œ6c¥\0Î¿¯+-¿…u\"ˇ\0LÌyÄc˚ó{çık\0ªd9∫ÉÊØå¸»\r&wç¿É¸ë∑jàÁcÀÅπ∑ÃÆ≈,ƒç4 Ná˜=øúÄ@ «Ê∏ç!zmﬂVh{ùeèsúËp–\0Üµµ™9?VÒZ\r	!—	„±QÂÅÿ”¿ÄÀèkª—ˇ\0íZˇ\0V:’›¨„Ê¥êhxﬁﬂm’OÚÿ≠g}[mz‘ËpÇt”Eãu7cem¥{⁄CÉª9K∆[1O°æ∑•áÈl\\örÒ´…°€™π°Ï<hQW%˛,:ùùCÍ≠b◊?◊—=‡E¨ﬂ¸Ø“.µ8µ™ç.ñâì§•$íI)ˇ—ı4íI%)$íIJ^C˛8rMΩsË⁄©hüÎ∏ΩŒ^ººK¸k‹,˙ŸsZu•ï4«i`søÍí]ô@√¢º}¿{ûdò‘èÕï–„TÑ\0\0\\Á’Ïó[Pû\Z`û‰Æö≠∆\0Ó™Ê˘ù_+£è^·‰≠≤∞U±©¥5\\k,¸eDñ0K&∂A1˛ıyÌy<h™_]£Qﬂ¡%*°:˜¸ãó˙Àà“⁄¨!—Ú+Æ»iÉ?5Œ}a≠¬¶¿˚Çõ	ıôÖ≈Ïøƒ∆HFÍ›È Ûã÷ˇ\0’RÂËK»≈s©Îπ8;¶º œùï89éˇ\0∂Ì±zÚ¥\\ÈäëRt…–BíH%))ˇ“ı4íI%)$íIJ^˛2$}iÍØÈ¯≤≤’ÓÀƒˇ\0∆\rÃ˙„wŸú-™ÔF›Z]õ!ﬂ…sR_èv}	ò∏U…Óü∫\\új@Ç	„N ãÒÎköˆ≤°P/˙¡çN-ô4·?/ÕcÏs≈`÷∫Ω·÷ÿ∆πæ˚+´cyñ÷‹â5ŸÈÒ≥qé÷8ÓØ∞“Û24\\v&G⁄Ò‘+©òmµÓec‘.-”‘’¨{k¯7€Z“Èπ◊úócZ=’∆Ë‡Ç7…GÑÏºYª∂∫¶wx33©„R@píT:∂M≠s*`≠t{,[Æ∫úlú ≈wª°∆ß?ﬂdêﬂ–˝-˚>ì∂5(ã;(ÿmºå⁄≤\Z][üHiß‹±˙¶%y8Œ®{Ovª≤+>±€ìéÎÌ¡€é€\r\"⁄Ãí@üS—,ÆÊSˇ\0Í‘€Ëd7‘©“◊v¯ßÅ¬v•ÜÎw¸^ZÏ_ÆòŒKÏ•”‹∫ªˇ\0VΩ—xF)7Î¶5‰;m9uÿ‡Õ\\Z@uÅç˛£úΩ÷ªmm∂≥πèÃp‡Ç%•YÏ” 5∂I”\'AbíI$îˇ\0ˇ”ı4íI%)$íIHÚ£⁄êÔ»Wïu¨A_[È≈¢h}è`\0h”SwçïÙó¨9°Õ-<8~kÅÍ5R‹:Ô¥dn3Ÿ—kˇ\0ëLùÉ±üÃÁ?ÂC\02IÒEß‹h˜@oÄQq_≤\0‰≠◊Í	:¯*ƒõn¿h‘vCﬁKˆ≤˜ƒk[Z»˛^—ÔU∞√j…ıC≠{µ\r–\0?5≠¸÷≠ }\ZZ €∫ÎN÷√G.{ø™°“\\ÁXÌ÷<Û§\0; I;®pçêı79i\Zµﬁ~	™∫ˆë`∞»·ÕkL|YÂ°ùàIgwhÅA¿§ÄÍ2#s@uv\r%ß≥ˇ\0™ê$lØI›œ…¢‹«o\'óÏU€”é7∫§∂Ï†TL˜˛*ñIüoo$l¢CG7›c#:⁄Àû ®5øÛZ„ÍWcø„v3⁄ΩCF-\"\"+hèê\\†Wk_Ùån3€Ë∞ˇ\0úÂË`\0\0\rào/£O?À\"§Èì©íI$ßˇ‘ı4íI%)$íIJ\\[§3#!∞\\ÍrˆûÃˇ\0ﬂ˜Æ˘guèÖïVKÕSuµû	Ç?F˝øæ›©≤^~9à›ﬁ°·q»›=ñÆ5Õó…©¶5”≈,À,ÆàkàëÜ∞´H\\æ≠ËO—“Íyæøuõµ”™©Äk7:Í«£s£sò6á˘÷U¸ﬂø˝#}Î2úº*ΩŸs¨|4˚âÛµˆ´∏ùC|÷∆8wﬁÁi¸¶ç®àH&C@€œ»≥hk…sôÓÄ¨;ï~ù‘Í¨ëaÿ˜!‹˛ŸSÀÕ¨5æõ+f\\\\Ú|ø5dø3˝î˙N\0aÉVëÂ#sy€ÏUê/Ûzlã⁄˙Ñ‹¨ªü¨™ù9Ô/±ÇEB<¸Êrèf≥¯ #R•≤ï≈µ“kı/§9°ÌuÏÈr=ø‘^Ü≤~ÆbTŒëà˜V”l9Ìypﬁ‚Ôkø™µïê*¸ZY\'ƒ@˝›ù2H¨]$íIOˇ’ı4íI%)$íIJI$íSÁΩJè≤ı<¨hÄ◊íœÍªﬁœ˙.Uﬂk[Ikƒ¡*⁄˙ÎèÈÁcÂ¥is\rn˛µgpˇ\0£bÊr¨\"ØU†º3W0s‘3á™€xßË˙$À«´\'S®¨x»EÈƒb◊>ß∞°núõÌPØ&òiô/\ZGè+JæüãóXs€π§π0Hç?I¶∂anCKYuLl\0E`k T™«¶áÚy\'A„lõáçY-lIÁïõc®¥ñì\rJ&DËã$jQ„]Qieq„§˜?ù˝TBcôMb]cÉZ<‹v∑Ú†TÊ4é	üå-/´uåéπà◊p«:”ÒcK€ˇ\0I:1π0 U˙=-¢äËo—©°É‡—µM$îÕ5$íI%tì\'IOˇ÷ı4íI$)$íI*I$+Ú©«§t∏∆Í„jHp˛πR˚Ò±ŸX±é}°Ω»kNÊ∑˚+å-“csO#¥ÿfÊ¨ØX~åW\r¨ÚZZw∂œÛΩ˚Îk®·äÓı+he9≈c_N∆ò»«”Û\Zˇ\0“Sˇ\0ehdâ\0KÌg¡/—?Gò4d„⁄\Z∆õÒ…öˆ∆˙ˇ\0ìû≈ßâ÷ŸMP˝’4} ˆπ§~â.ú§˙_®êSå{^ÿk‰xFQ;Üq6-{æ∞2÷Ì≠∆–th`.ù~óµSÆ¨ã^⁄k™$πﬁ“u˙©≈±ÉWD¯CÙ$ûHÔ)	Dlc#πDÅ∑Ëçﬂ˙°Y´?Ìvçµö´\'âq˜ª˚>û≈C¶ø.Õ£s(d^—/%ﬂÕ—C]Ì~Eﬂ ˆS_ÈÆˆ-™ÎÆäkmA¢∂Ä+kIp€Ùô?›w¨Ì˜zø·+˝.œ÷ÎR‚âñßnåY¶\0·\ZûØZòΩç-p∆\Z	‘û}´û«ÍYò¿ø’a‘2√$|ÙøÈ-<^±ây\r≥Ù6p7p™ÙÛ\ZÌÙíëßü$‘©$íIOˇ◊ı4í@…Œ∆∆“«{˘∑WÏ£HN´‰ılmÌœ˝∆ÍÔ¸≈e‰u<¨á0˙5¯4˚èıﬂ˘ªï&Älm`˛êê\Z√ƒ6øw˛	˛g˝∏·Ë∂ˆGVæŸ˛Ç±%«óG«ÛUzÍqyüsà$ 4áV◊ÔçÆsΩÓLÜQ¿{™6∆í Öﬂ¯Rçn±ÿy˛r÷Z‡{˚ÌØo˝Rx\0)\rpmå’èÎ<K]ÔgÕŸ≥oˆˇ\0ÎËåÆª©u/nˆYµªd4Ó ˙>ùüFã˛õq,˛g˘ÃGˆ571≤C[Ì“DÍX€ú–œﬁ˜ª+ü·^≈ˇ\0†÷Äˇ\0Õ‘A·ÏámñΩ≥˙z.o¶Ô¯Z˝?§§uùö2∆“‚	º4i-iá˛è˝-ˆ¶èÁX®≤à÷ªë˜r∫+\\‡È@˜ó∫\"=ï∫ÀõÓˆ˝n®œ¸/‘+\\∑÷¨ÿπ√ß·“Ïû†“`—¨≠Œ˜\ZÚFÔ“∑È^Ãm¯ˇ\0·Èˇ\0BÇx/Xh{61Ûi=Gv◊¢ÁΩ˚â ¥rO—÷W1z}l∂˝¨cd¥;‹!ßcÔΩ¨˛r∂Ÿ˙|jˇ\0¶d˚?ôXÿ=x`]IÎòøb≤Ú·èk-T÷«”∫ˆ{±}I˝%Ïı.¢è>•æ≠}0hw7kö—æH˝ßWÛm…≤øoM√˛oıÏØ”%Fc^Åyã“OﬁX1∫∑Ü≤[≤¬G¯KÈµÕˆªoÛ›g#ËﬁmØΩ@π÷⁄KÀ›∂K∑}2L≥Û.≥s?E˛	ˆa‚ß¥¥èh\r`h<ÀC[66,?ˆöó1ˆzˇ\0O.⁄ÔÍÕ’âÍ¶∞∑˜´ÄN‚=Õÿ7>œOÛ>»À=OOˇ\0,r±®ˇ\0¥jq›Æ»8;x˘¢Ê8%∂QÎm˝Íˇ\0Y≤™ˇ\0‚“5lhüQÂç#ê\\Ê¸¶˚∑µ9ÙŒ„S6W¥\ZŸ˚≠-Èœc?≤‘‰∏o1axÜı∂?Ì¶¢•±≥2q@4æu\rv¨#«‹µhÎî:í√Kø{È7ˇ\0$≤√dö@‹[ÈÜ¥˛t6 õˇ\0ü1T\Zˆ5Ì3π•ﬁË„πÌ‰˛vW˛¸‚ià*∑®cŸcw1¡Õ<ô	◊-]ôŒ.«∞∞ÉÓ€£N•ûˆª€ÙòÂ{ˆÌ˛Åõ}Y\0?Ûc˙üæö`m6ˇ\0ˇ–Ó2z”Ó/f!ÿ÷4∏º˝2\Z◊ø€¶ ˜6ß™é≠µ⁄ZÛºÄ˜<ùd∞€˘«›Ón=ä`úÇˇ\0£e÷µ§i˙¥—ˇ\0Sˆß&`u≠}è“À7i·∫∂7o˘›A `\0ŸjB÷Wª”–œß\nóø˚Nu™∂¡c≤‹>ë7‰Yôí?ÍXâî˝œp‰€p˙æ∂UŒˇ\0¿±´Qk1}3Ùç\r¨¸M‘ˇ\0’fπàEí∫–9h∞|´nœ˝”WÀ\0∑”D¥5ø˜’R·ª◊≥±eŒˇ\0<u?ÔÌWcı»˛_Â ?˘	Ÿ(K´≠√vÁ1ªÉ>ìö⁄±¨\rØ˛Ï’˝\'˛øO¸2ãæ«ò¨n}Jª´∂∑[óãOÈˇ\0(Ù‰ã´µæ¿Ú∆Uºä˛ú∂åmØ´˛\Z∑~íØÂ¢:¢⁄√‹t{âΩ\Z‚N˚qﬁ„µø§ksÒòÔÊÔ˚^7¯Dé·ôˆk¨¡˘uµ«ó{=bkkü\'€fÍùÔ˛õâm^øÎ˙´Ãq˙çXπû≥é[’2l{-53m¨;∂<ŸO—≤◊ÿ>Ü’Í≠`ı©.\0;sXvÒÌ…˜m›Óm{ÎˆW˛˘µ«˝uË7;ØÙ‡kjcr„ÙÖèm›V≠ÙÏf˜Wc⁄ÔÊÏﬂ˛\r:=ª†πy›<‡c_ù“ÚWa#Ì∏ó√ùS„ÈeaèÈv±ﬂF÷Ï˚7¸*Èæ™cıÙ\n‘^˜>›ˆT€	›]6ﬁïπ>◊9èkl≥\'7Û0ˇ\0S«˝+◊ ]ÖN]8∏ï∫¨ÚÊ6ÏáI∆mDèQ¯9Í]âcì˙ÙûöÙ¨∂1÷9§\r¢Ê4\0‹ö6{O∑Ù~™tÕÄZµ\\\Z%Â·ÅæÁ=Õ0Õª,ué´_Êk˚=Æß˝/ÏŒó˛Â:™xsôÈ¥ÿ∆=év‚Hut<œΩÿÆ≥Ì9ñ˚˝nßÛü†E¢õms<çÕt,%Ã∞Ó€Í˝ôŒ~M∂˙¶Íy†MMBªãCv;mi.Ô˝®ú≥¸.Müüìmâãê≥˘ôˇ\0Çiü˙Œ+∫ˆ∑¿º}ˆu:ˇ\0Ô»M´?‡ˇ\0û0ˇ\0Ú*’m%Ω¶–?ˆg,ﬂ“Ë§—ÈY¡amáœkzmö°¥:¶ö[˚∂üÂl £o˘ÿ4©~Œq\\˝Ùa;ˇ\0E£X¿ÎKFü¶ˇ\0±Ylˇ\0ø§Ñ6ê€ÊÃ;Ì\Z7ô∂∆Üˇ\0÷Ú˝Ñf±Öœ|ççs⁄eïÏ˙,ÿÅI6cÇ?ÏÌfúá:üioı˛≈_˝∫é¬~Õh,çu8Wß“˛§ÍwËmbEVˇ\0ˇŸ8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\04\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0ˇ·/http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"Ôªø\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 4.2.2-c063 53.352624, 2008/07/30-18:12:18        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\" xmlns:exif=\"http://ns.adobe.com/exif/1.0/\" xmp:CreatorTool=\"Adobe Photoshop CS4 Windows\" xmp:MetadataDate=\"2011-07-07T10:32:52+05:30\" xmp:ModifyDate=\"2011-07-07T10:32:52+05:30\" xmp:CreateDate=\"2011-07-07T10:32:52+05:30\" xmpMM:InstanceID=\"xmp.iid:8E6C595E56A8E011BF78ACBC9FBB9B39\" xmpMM:DocumentID=\"xmp.did:8D6C595E56A8E011BF78ACBC9FBB9B39\" xmpMM:OriginalDocumentID=\"xmp.did:8D6C595E56A8E011BF78ACBC9FBB9B39\" dc:format=\"image/jpeg\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" tiff:Orientation=\"1\" tiff:XResolution=\"1000000/10000\" tiff:YResolution=\"1000000/10000\" tiff:ResolutionUnit=\"2\" tiff:NativeDigest=\"256,257,258,259,262,274,277,284,530,531,282,283,296,301,318,319,529,532,306,270,271,272,305,315,33432;02305CDF1CA2FB3998B7639C6EF0F06C\" exif:PixelXDimension=\"196\" exif:PixelYDimension=\"200\" exif:ColorSpace=\"1\" exif:NativeDigest=\"36864,40960,40961,37121,37122,40962,40963,37510,40964,36867,36868,33434,33437,34850,34852,34855,34856,37377,37378,37379,37380,37381,37382,37383,37384,37385,37386,37396,41483,41484,41486,41487,41488,41492,41493,41495,41728,41729,41730,41985,41986,41987,41988,41989,41990,41991,41992,41993,41994,41995,41996,42016,0,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,22,23,24,25,26,27,28,30;AF1ED08CD80E77D5E45AFC2BB54AA1CF\"> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"created\" stEvt:instanceID=\"xmp.iid:8D6C595E56A8E011BF78ACBC9FBB9B39\" stEvt:when=\"2011-07-07T10:32:52+05:30\" stEvt:softwareAgent=\"Adobe Photoshop CS4 Windows\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:8E6C595E56A8E011BF78ACBC9FBB9B39\" stEvt:when=\"2011-07-07T10:32:52+05:30\" stEvt:softwareAgent=\"Adobe Photoshop CS4 Windows\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ˇ‚XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ Œ\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0ˆ÷\0\0\0\0\0”-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0Ñ\0\0\0lwtpt\0\0\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0ƒ\0\0\0àvued\0\0L\0\0\0Üview\0\0‘\0\0\0$lumi\0\0¯\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0ÛQ\0\0\0\0ÃXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08ı\0\0êXYZ \0\0\0\0\0\0bô\0\0∑Ö\0\0⁄XYZ \0\0\0\0\0\0$†\0\0Ñ\0\0∂œdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0§˛\0_.\0œ\0ÌÃ\0\0\\û\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0WÁmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0è\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0Å\0Ü\0ã\0ê\0ï\0ö\0ü\0§\0©\0Æ\0≤\0∑\0º\0¡\0∆\0À\0–\0’\0€\0‡\0Â\0Î\0\0ˆ\0˚\r%+28>ELRY`gnu|Éãíö°©±π¡…—Ÿ·ÈÚ˙&/8AKT]gqzÑéò¢¨∂¡À’‡Îı\0!-8COZfr~äñ¢Æ∫«”‡Ï˘ -;HUcq~åö®∂ƒ”·˛\r+:IXgwÜñ¶µ≈’Âˆ\'7HYj{åùØ¿—„ı+=OatÜô¨ø“Â¯2FZnÇñ™æ“Á˚		%	:	O	d	y	è	§	∫	œ	Â	˚\n\n\'\n=\nT\nj\nÅ\nò\nÆ\n≈\n‹\nÛ\"9QiÄò∞»·˘*C\\uéß¿ŸÛ\r\r\r&\r@\rZ\rt\ré\r©\r√\rﬁ\r¯.Idõ∂“Ó	%A^zñ≥œÏ	&Ca~õπ◊ı1Omå™…Ë&EdÑ£√„#CcÉ§≈Â\'Ijã≠Œ4VxõΩ‡&Ilè≤÷˙AeâÆ“˜@eäØ’˙ Ekë∑›\Z\Z*\ZQ\Zw\Zû\Z≈\ZÏ;cä≤⁄*R{£ÃıGpô√Ï@jîæÈ>iîøÍ  A l ò ƒ !!H!u!°!Œ!˚\"\'\"U\"Ç\"Ø\"›#\n#8#f#î#¬#$$M$|$´$⁄%	%8%h%ó%«%˜&\'&W&á&∑&Ë\'\'I\'z\'´\'‹(\r(?(q(¢(‘))8)k)ù)–**5*h*õ*œ++6+i+ù+—,,9,n,¢,◊--A-v-´-·..L.Ç.∑.Ó/$/Z/ë/«/˛050l0§0€11J1Ç1∫1Ú2*2c2õ2‘3\r3F33∏3Ò4+4e4û4ÿ55M5á5¬5˝676r6Æ6È7$7`7ú7◊88P8å8»99B99º9˘:6:t:≤:Ô;-;k;™;Ë<\'<e<§<„=\"=a=°=‡> >`>†>‡?!?a?¢?‚@#@d@¶@ÁA)AjA¨AÓB0BrBµB˜C:C}C¿DDGDäDŒEEUEöEﬁF\"FgF´FG5G{G¿HHKHëH◊IIcI©IJ7J}JƒKKSKöK‚L*LrL∫MMJMìM‹N%NnN∑O\0OIOìO›P\'PqPªQQPQõQÊR1R|R«SS_S™SˆTBTèT€U(UuU¬VV\\V©V˜WDWíW‡X/X}XÀY\ZYiY∏ZZVZ¶Zı[E[ï[Â\\5\\Ü\\÷]\']x]…^\Z^l^Ω__a_≥``W`™`¸aOa¢aıbIbúbcCcócÎd@dîdÈe=eíeÁf=fífËg=gìgÈh?hñhÏiCiöiÒjHjüj˜kOkßkˇlWlØmm`mπnnknƒooxo—p+pÜp‡q:qïqrKr¶ss]s∏ttptÃu(uÖu·v>võv¯wVw≥xxnxÃy*yâyÁzFz•{{c{¬|!|Å|·}A}°~~b~¬#ÑÂÄGÄ®Å\nÅkÅÕÇ0ÇíÇÙÉWÉ∫ÑÑÄÑ„ÖGÖ´ÜÜrÜ◊á;áüààiàŒâ3âôâ˛ädä ã0ãñã¸åcå ç1çòçˇéféŒè6èûêênê÷ë?ë®íízí„ìMì∂î îäîÙï_ï…ñ4ñüó\nóuó‡òLò∏ô$ôêô¸öhö’õBõØúúâú˜ùdù“û@ûÆüüãü˙†i†ÿ°G°∂¢&¢ñ££v£Ê§V§«•8•©¶\Z¶ã¶˝ßnß‡®R®ƒ©7©©™™è´´u´È¨\\¨–≠D≠∏Æ-Æ°ØØã∞\0∞u∞Í±`±÷≤K≤¬≥8≥Æ¥%¥úµµä∂∂y∂∑h∑‡∏Y∏—πJπ¬∫;∫µª.ªßº!ºõΩΩèæ\næÑæˇøzøı¿p¿Ï¡g¡„¬_¬€√X√‘ƒQƒŒ≈K≈»∆F∆√«A«ø»=»º…:…π 8 ∑À6À∂Ã5ÃµÕ5ÕµŒ6Œ∂œ7œ∏–9–∫—<—æ“?“¡”D”∆‘I‘À’N’—÷U÷ÿ◊\\◊‡ÿdÿËŸlŸÒ⁄v⁄˚€Ä‹‹ä››ñﬁﬁ¢ﬂ)ﬂØ‡6‡Ω·D·Ã‚S‚€„c„Î‰s‰¸ÂÑÊ\rÊñÁÁ©Ë2ËºÈFÈ–Í[ÍÂÎpÎ˚ÏÜÌÌúÓ(Ó¥Ô@ÔÃXÂÒrÒˇÚåÛÛßÙ4Ù¬ıPıﬁˆmˆ˚˜ä¯¯®˘8˘«˙W˙Á˚w¸¸ò˝)˝∫˛K˛‹ˇmˇˇˇÓ\0Adobe\0d@\0\0\0ˇ€\0Ñ\0		\n\n				\r\n	\n\rˇ¿\0\0»\0ƒ\0ˇ›\0\0ˇƒ¢\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"qÅ2ë°±B#¡R—·3b$rÇÒ%C4Sí¢≤cs¬5D\'ì£≥6Tdt√“‚&É	\nÑîEF§¥V”U(\ZÚ„Ûƒ‘‰ÙeuÖï•µ≈’ÂıfvÜñ¶∂∆÷Êˆ7GWgwáóß∑«◊Á˜8HXhxàò®∏»ÿË¯)9IYiyâô©π…ŸÈ˘*:JZjzäö™∫ ⁄Í˙\0m\0!1AQa\"qÅë2°±¡—·#BRbrÒ3$4CÇíS%¢c≤¬s“5‚DÉTì	\n&6E\Z\'dtU7Ú£≥√()”„ÛÑî§¥ƒ‘‰ÙeuÖï•µ≈’ÂıFVfvÜñ¶∂∆÷ÊˆGWgwáóß∑«◊Á˜8HXhxàò®∏»ÿË¯9IYiyâô©π…ŸÈ˘*:JZjzäö™∫ ⁄Í˙ˇ⁄\0\0\0?\0˚Ê\0†=Èä)ºRÏU∫v‚´ç(E)ä¥:´ä≠8´]Ò`yªëXÚ\")f`†nXöÛ90ÒÃ˘»ﬂ Àe∏_1˘ »_[äæóh‚‚z¯åêßÊp2ŸSó ¯ÀÕ_ÛÙø…Co£È:ñßsÃ¢õ¶éŸ\r:öÇ‰Ìæ.T{?);±]?˛~ø˘ku≠GauÂ+ãm?”˝ı⁄‹´»%∑‚>\Zâ8@7¶…”ßØyg˛~Sˇ\08ÒØ£∫øæ“&{ÖÖíhπ™£ö,•îÙÒ¶„í>m—fG˘\'˛rsÚKœÚ«kÂˇ\0>Èœ-«’b”Ó$J”Päúâ A4D°(Û˜òÂIQ^6é*é§A#\r1~Fí·ëgÒdÏUÿ´t\'†≈]CZSUƒÕ>x´X´ˇ–˚Ê:ñ*ﬁ*ÿ4ÌølU¨Uq≠#¶*∑v*÷,%Õ·ﬂûøÛê?óüÛèﬁRüÕ>y‘÷9Yt}VΩæî±DÉOÊc∞ÔìÿnNÀä,∏b˛tÁ\"ˇ\0Á„ﬂúö˙ïÕ∑óı)<ôÂE%-tm6fåÂ≥M(°ïàÎ–√*9IÚwXÙÒo-ﬂûæ`¸ƒÛN≥$“ﬂk∑≤K1&oﬁ∏ÂS‹˙Ú\0«6¢1L4jw,·ΩgfÎV5<ºkáÖ¶:…àÂzÈ‹\ZÔƒBiπﬂƒ|p∑Òdê⁄_‘ÔQÉ-ƒ†‘Ç¡è*wx\\ŒLeíË˛sÛç=Ω÷ô©‹⁄Õh¸°∏G!êü]âÒÎà7Hñ“˝<ˇ\0úQˇ\0üì~`˛VI°˘Cœ:ã˘ì…^ÚæÄÕ{ºÑÚKy¸&ßa”\'ù∫HeoË_Ú_Û∑…û>TÉÕ^P∫>ì±K≠6b¢‚ZT:Çvﬂ®€-ÿÚu3Ñ†jOb˘dHP[»∂;l”∂*’qWT‚≠çÎﬂlU’⁄û¯´ˇ—˚Ê:ñ(∂ÒK}7ÔäµäÆ!Äˆ≈V‚Æ≈”ƒˇ\0?;¸´˘˘s¨˘˜Õ7¢÷6ãG”ãÖíÚÒî˙q%HÔª√&n∆19%¬…ß¸‰¸‰Où=¸”wÊØ6j-s<“±≥.LPE»ïä&äÉnùNS2NÂËÒbéû ü{ÊoNÍˆBã:®-≈cêSæ‚ß¶áby7‡ó…on\r/	îÒ∞\'ÂVπ+≈ñ#WG≠¥m!π¥ãQ€âë”zâí.(W2Æ,ﬁ6a%}4‚¡y\'ê®˜ﬂ&œÀH\Z<êœ(WT1?>\"ù>ÒÑâF∑π-X\nƒ´>-ç{‚$ô·$ƒéEcπ≤ïΩA…Ä‘5€µOb2<‹Å‡&ﬂRŒ<ŒG˘ˇ\0Ú_ÕZøÂ≠fKf±∏Â5Ö√msSîä”ãéU=EvÀ!07-”Äœè~oÎgÚKÛ[H¸È¸¥Ú«ÊåÇuªÙª@¡Ωò˛‚P¨\r	‹äµ— & Ùz∆Bô	7Å €`∑|R‡	≈W( ”h/⁄Øaäªµ)µz˝´ˇ“˚Ê:ñ(¶ÒK±WW∂*∏± ä≠≈â+$uç\ZF<Ufcÿ\r…¬±»_À«¸¸˛r7Q¸Ÿ¸∆‘t]6‚eÚßìn€M–Ì‘~Âôfù´PZGpJ˘tv˙L>x∫ê¸¿Ü9Óßı]ó”$;»¿2rØG•iø∂Se»å%ñ[ÚD]Èwü[öŒ‡\"ª0ddVobµß^ÉKÖ#M,¶ç‰lG◊•é6[I‘a_ÄÌπiÿer |{uπˆO)~DkW33j„Í6ÓºÏ˝Nì\n∞i‚GÅÃyÍ£ ˜vZNÕé;$Ò~ÑÍÔÚ/ÃZ∑w⁄S]˙QX!U*üdªÚ&äΩÄ˜¶P5Äö∫s°•éÙ7/-÷|ã´€…ÿÈv˜6¸T-ÃR£óò©Z|≥69£√w≥ÆÀŸÚîΩ _&-uÂ/1€2Z…iÎ,äM∫q4¸D©4ƒfá{âì≤u\0÷ƒé⁄[€∏äÍŸÃ.\\F√‚~…¯Å¶Á2#1[uu∞é\\åë5Ê≠sÈ“⁄\\Z1Œû¥h’:(k◊€«\n¢Ã‹\r≈˚Ωˇ\0>•¸ˆ‘`ø‘+ı\'CÛüY”öéóäîfEq`ßóΩ3$Q˜∏°àXÍ˝Ë ãÇ¿⁄›Mk]ÒV√”q·ä∂â˛´u$6›z‚´w„”j◊≈_ˇ”˚Ê:ñ*ﬁ*ÏUæﬂ«kk≥o6¸·Û,>O¸ÆÛÁòÁú[¶ó¢› ≤ìJ9âï7˘ëíäƒqHÒ}˘âÊÊ2kSµf3C/⁄ıïH´∫ûô	ë{;˙\"<5Ω+˘»∫ÕÌ«◊	ñ…\nS·,d`ﬂbàƒbÂ‘«´›ÿvweœáäO±¸ó˘cwyﬁ°i∆`yI(TÃ\0®Rÿ€zå”ÍªJDÏ^áÜ#s≥Ï_.˛U˘h[@ìi6Ó@U·ÌJê\0‹ÊÆz…√ë˘qvıøÂ∆îäEæü|ê™ŒG\"µ®€óCL§Êî∑\r∞∆#≤…õB–⁄Îw7:Õôp¬Œ‡Üè·5\0\nèû]U{\n)\rˇ\0‰ØïÌZ_´È—€Äîç\"¯@@)≈xÔN˝iÇYfFÂî6/1Û?Â.êÌ\0Dåh»•ÿÑø_r{Â£Q [xçéoö<Ì˘¢4O¥..Hé§“°˜¶˘ùß◊N\'~V◊üKê›Ú\'ûˇ\0.ı)¡¸J˜ö{∑Ô√É57&õÌM≥{¶‘ÇûGµt#™GP^£ˇ\08´˘Åy‰ŒÀ]b ˛]=m5˚C=¬¸dA<®í©Bhj¨F„|Ÿc6ÍuƒÒ‹Ÿz8ë◊Ï∏~DTdN≈—E~¿ÏRº1Ï∏´U!´M¸1U k»ûùÒVÎ∑n8´ˇ‘˚Ê:ñ*ﬁ*ÏUÿ´±Vé,$¯s˛~ÊØ◊¸„Wö`F+6øqo`¶¥9øB”&\r›,x≤ÚÕÂ-√Êç~9&¯‡üP)È;/\ZQô¿M™M2©¬^ãV˝%Ú«ïÙ€[[{xmcB†C∂ŸÀÍçõÎﬁıöNOhÚÓû=U)¢ÆÀL’eÁœñŒa{>çl”(Ph™@5;¸≤û}S\Z˙€NTJù≈|:W«-13í~∂†¿B¸[Tv˚≤[w5ñ;yßé≠’†s◊ßmª‡<íÔ4◊ÙªuRR´&ºk€|cD”|yXxoô4ËÿªÄ9\n\ráCΩ=ÚËLƒ¸S\"ãÁœÃè*A®Ë\Z¨-4oí6ÿ”∂n4y\rãt˙Ë}ØÄ<úÕÂo5h7≤ƒ+¶jLTÇU÷	’ŸÎZ›≥•ƒÚí¿!Gó7ˆı£ﬂA©iZf°lC[ﬂZCs)™îñ5u°˘å˘º‰Em‹ô‰[A∑bñ≈{}8´®I°4>¯™ı0Ø”äµCJTRΩqWˇ’˚Ê:ñ*ﬁ*Ôû*ÏUÿ´é,$¸∆ˇ\0ü©j”ÚJ∑Á≈Ô5ízT§,i–¯‰á\'#E^%óÛï˘Y™≈eÆ“·Q\"ø]bygQ“º´–tÃ|§—E•‰i˙_‰´¥ΩµÜd%–®Ø_ñsZìOK§≥≥ÿÙÈÑ\\\0éz-+‘f§ŸªÔvCÕÍ˛]ºîD§ƒß⁄,\0ÔÂRŸeOH¥Ω,ö:ı¸rÊæ\rì3 HÀï≠\rUçjOﬂàbAc˜ó5çÀr£êN∆&ﬁu´\\o\"K?P¸˚dDõå;ûM≠F≥˙úæOÄ/zåú≤˙^ÁUxÙùH˘™D¡≈+PGJfﬂH,áUÆ‰¸Ÿ÷¢IuHJ°´^HÊZëxöl}¿’·çƒy<÷ßy?Ø˘ƒØ>√˘ëˇ\08Ô˘WÊhË&:,\Zu˙ÉZ\\X™…ﬂπéøNwºæhpLá—„*DCâ\0VÖ©π©˘bÕP4•wÎä≠†Âπ€«T\0\0Gﬂä≠¢◊Æﬁ´ˇ÷˚Ê:ñ,N€∑ã\'bÆ≈]]©·äµÖÖQ~;ˇ\0œ›5[•ÚWÂ∆â≠3‹ﬂ›Õ∆Ü•4\0èˆYtŒfà2K˘ÚŒóu}Ê{>’\Z5ñuÂBIåÀ<>¸¬ÕÈ∑£—«÷+ìı_»˙L÷ê[¡J,q™®È“ïÎúŒ®Ÿw¯2pí˙WÀûUñÏErH„’ç|;S5¶$9ë…•Ó⁄ñaH„‰Ñ‘\nWøæD¿î¢Ÿƒ^\\á–˝‹aòmÔñdÓÉò∫_/öÎD∏=6ÎÄb(BS?óïwR	n¶òN>Ö|P√5Ø+Cp*ÇÇ¨OQ^„ç∞j@xøô|µı%ê˙Åáed£˘Ä˘ˇ\0Ã÷\r=•Â§Ä#%_q Ω+·õ∆àpsÀèb¸≈Û‹rÈ~bº”\'GÇX‰i?ÚÊç∑\ZÙ#:Ω4Ó!—ja√\"˙*ˇ\0üRyçı˘«]SIfRæ]Û=‘PÖjêó1E8{n«Áñ‰Ú⁄ﬂÔΩÔ”Ã°†7ã0wÏqK∏ä“øF*∏çàb´v•j<+äøˇ◊˚‰:ñ-göÏYÏY;k≤)ÿSv_éÛ˜Vo.~W]\Z,26©k,ßˆ,êﬁÑåïn;ú˝‘_éÛåﬁ_˝+Ê›b˝‚}F 8ØÕJÉ∏ÆŸá®;Wyz,R‡ﬁ˝\n“nSÎIihAñ¥ñ@Eà_„ö=D\"9ª% kì’≠<«ÊM°Ç+Dû*ÉπÎCµ+«ä2vDÚN<Ö≥ÕÛÖ≈Ã6W∂≤D‡Ö24ıêæÉëÀŸãé@íÈ§y‚ŒÈ!^AîüçáJéù|kòƒW&·s&µê≥™V=ï©JPÔ_«,å‚éè0Ûù-¨ƒ—üÙzoÀb¨’Æÿ<@ŒãÁmÛÃzç¸êË|Ê∑\"á“ ûGaRz˛¨»≈(-ß6)êë›∑ùÔ-Ÿ5®•µàƒ¿]Hã…∂® !4©¶Nr«≠ÑÍﬁs©›´E%ù◊u∏ƒ—jrxƒzugìä¨æ!ˇ\0úÖÚ≤àm|√\ZÑ∏éakq(e˚$˝+õÕá\'UñDö~§ˇ\0œùµì/ñ?842h∂˜öMˇ\0§H®ibö\"iÚAôÛÂÒyÆ–ê{øKˆì(. o`6®§ö–Ò∂)p˚UÒ≈W)&µ˚±Wq˜Ô\\Uˇ–˚Ê:Xô7Ùbé\'bÕÿ†öv*M4Œ∏C_êˇ\0Ûˆ;ΩZ¸¥Ú¶áa|ó^g–µ°qß¿…≠Ãa9»EB‹N˚·„çﬁÂŸˆvü)&uÈÔ~pŒ-˘0iû_ÛØt•%ªΩ∞3\nU\"@ÃG“‘ﬂ√0usßyô\ZË˙Íæ[Ú*\\kwÏd‡Ω∏ÿöPQπØÄÕq,ï\\ùŒöÈ,OÕÛë?ò~[Úïèù4#ÈâÂ˚ÕHÈ≠´,Õ®B••Ã÷P\0R7°„V©ÔL∑Ç‰}Âàôàà◊õ:Úô|—˘è‰}GŒﬁjáD—Ì-µ\'≥±¥¥ıcºπâ)K§≤ú	\nèáó/\0s#U¢√Èù€F<ôá„—8˝/≠y^ÁIhØíÔO’•h£KÍÑ‰§‘Öﬁõ˜ÿÊûx≈–ÈÊÌ\0±∏‹>∫—u©¸∏Çí»ï7Æaƒê\Zå#)>_Û©®Îö∂≤≥›≈¶î»™ìHc[∏µÚØÜfcÑj6Yƒ¯ºˇ\0ÕóûkÚÁÂÓ©Á_(ÍñW:÷õsÂ6âﬁÂ·v§ì¢‚	óë>9µ“Èûr›¿Œrx¬&$É¸\\ﬁkÂœŒm{OÛ.±yÂÎ;ÕA∫Kh-˝	¨ı;’`y<6ìÂ¬üµ{·œ¢¬	©˚≠≤òüÉ’ìËﬁt“º‚œl÷wõ	≠§FF|\0s\Zx4fë7Û´Àq]~[˘íÈS’˙ä√p9Ø/±\"Ó)CZõ=K.èWèÄΩ;˛}_Á[o&~hy∑FøµóÍûn¥µ”E˙ÌK34+\"˜‰IPGJÊ„.A\"z∫MnñYAò˛ﬂ–æ˝Ú≤Èó\r±‰™6ØMÈ∂)wàì”lmÀﬂ¶*∑~UØnü√ˇ—˚‰:ñ,	]ã ÏRÏUÿ´º1a\'„á¸Ê/óZˆ?=ÍñhüX&˚Q‘ö˙ë[0¢≠’fíyÎPIÔ†˜⁄|?‡PàÊb0˛L⁄@ﬂñ˛_πWÙÄñÓe5gë∑˘PS“2‰}(Ó…n¸á}Ø›Izñ‰\"ˇ\0u,ïj\0{/jÊ¶9Ñ\0˚x®˜3ΩD‘¥ˇ\0AdÇﬁaT}f3Mø…‚j1…n˜nêïU=&ÔVçå3j∂ZRΩ≤™AkchäÚÄ(ó©©Vôó-h·‹ìÜ4§I?7òÍ÷gÃZÏWM•[ËZUì4©ß€\0úõªπÊØ&A)\0Ï1@¬<26{ﬁ˜Â˝R›të®íß∏)∂ooõ’∑◊ﬂR”§Pì±2ƒËÆ9Æ¿ïjéÜôpùcíN>1LÀM÷5KåøZ≤Ç‡˛≈Ã\n–8;Ç\r>ûô±«´±–|\\∫\":\Z˜±5ÿjZ€»};1<°á+.Ñ±©\0T“µ gí<Vœd6{ﬁ\\üñó÷”õ«∂>¥D07;v9aŒ§HÔvUºÁ§.©‰ø5i3F_h◊héDHëZ@f^Äû7M⁄≈á∫ˇ\0Œ\"y ˛RÀÀç˝2˚\\èN‘µ+∂íI‰*J”∞é¥~[ÛÀ®\0Ú]FèI3TL_≤C¶o¿«í·Å∂<õ*‚ñ¡ﬁª|±V◊ˆèjb≠TS¶ˇ\0Ÿäøˇ“˚Ê:ñ*ﬁ*ÏUÿ´±[wÜ,$¸Ú¸ Ú´Îòﬁm“ØÌD˙2«%µ‹o—„øCÛ™∞Œw_\n»iÙ« \'§ÓÚ|=Â?/«ÂÕ#N–-Ÿ}\r)•µC‹™O\"ÉÙÅé¥ô@K…é)öC•ΩÎCñ’\"ÙÄ´ÉB)æﬁ9§%ﬁcárgs£&¢KÖ`Ä(iS„”|èﬁÂDláè qiˆw:Ñ∆+h-TΩ≈‰ªÒP*I\'ØÀ	√)sc,∞åGıœ3Î÷ˆvJ,πñ·¿J«⁄´Ó{c∆eo§¥œ*Gegk¿ﬂ˝ºâk2Óx˜ùt)4mFÀKfñ˙Ò.≈{ÇµÈ\\∫!¬àﬁÅ°Ë6öˆá•`M’≥’gäQI#a’]{pF&€0,ÇÜÉÀÈßJJB>})–o”ıù\ZCÍ2,H≠F$ê8ç®NÿdFHÌO’,Õ‰Û[®∑™ˆÊN√’^üïkõéœéˆÛ›°UOØø$|´{Ú:B\"é\r&’„ÿµ∑<J®ÈÒ …h\"N£4ˆÃ¯tD|æ◊Ëñt%‡‚Å±p=Fﬁ8´©V⁄ò™˙«¬+ä≠Ì–V¥Ø—äøˇ”˚Ê:ñ*ﬁ(ÏTöv)kΩ√±R¯cÛ„Tª–?1oç∂Ô´È∂≤€≈CGñ0…CÏ@Îön“ç‰±‹ˆ]Öñ#LA˛qØã‡õfHø“mÕΩƒOˆƒÓÑL˛;‰3Gèn∆D3ÀﬁÙØ-?#LO∆ISæ∆æŸ¢…tÙ8%ΩΩ∑EÜ+÷Dj4$¯\n¯å(π2ë§7ÊD1ü/Mm\ZÚ≥Å„{∏¿£<h¿∞ßΩ2ﬁ*4„cÅ;ºe|…=î∂7∫ó-ı]>y7)kp¢˛\r¿–0PW∆ç_l2Rcñ∑¸{ËM\'Õ˙-›çøÔ‚G°‰å@*√fR‡É±¶>	q0w∑îyãÕ∂_^ºP3€¡JJÁÄc_≤õO·ÔÑani∂&S‰…|ÉwãP∏∑Si\r‰ﬁ§vo€·${‚eæ∆Ÿ¯DS*◊¢Ä€˙Ò¬¨((*;‡ë	œ◊/X∆¡hh‡“£¶ÿÅe9•√ùﬂ‹h@?é(\r6˜˙3y¢Ñóñ÷ÊO∞øÁ\Z‚’.ˇ\00tÂïÉ˛á”ng‘fZ≤ªLºÉ–àPdÙˇ\0yƒ;ãﬁ‘	È¯|≈?C3pÒ‚€≈êlbñ≈9nvˆ≈Wª“ùqWSjÚ≠~úUˇ‘˚Ê:ñ*ﬁ*ÏPEªªn8±ó7«_Ûì:]¿÷¸≠™ZY´œwgqb∑é§§lØ»T¯ÄÊôÆÌ\0\Z∞ÙáD£◊õÛÀY¥∏“µùN∆giû+Ü\r3¥XÜ≠{ıÃyKã\0%⁄}9»e:5Ô’}1P˙+tßNô°»yª¨Gw§ÿy¶&ñiB™-Y˝æc+Äﬂg>u√ø&5Ê?Õ6xÁÇ˝\'3EÃ√	µ4•NŸa¬d—˘òéO4∞æº\ZúWf ¬8≠˘ËÁp‘Zv¶ƒÂ¯±◊]⁄%©ñAVˆÈ^)Ïãëªö:´…wÒ©~ywåF÷“bKƒºÁ≥t∆YZHÂ2« Ö™•âR®Øáˆdg1*÷<X∆€ ¥üÃ=g ﬂVÉX≤rî-%Ã\'êøWæ kÙd,.¢›–⁄§Ÿg˘á•k˙i6WI)åtXnC)°© 2c1ÿπÚ	«à0-RÂdë»™É˝ô<CwS+ÿ1Ω\'JøÛª¶iv≠}{{rë[Z-;9Ÿh*sy¶Å1°÷ﬁU8¿ÒKê~ÜŒ7˘#\\Úﬂò5ÎÎõù;K˙¢⁄àÆëëö~a∏Ø 	\nÀ˚?„d+£ØÌΩN9∆˙æ≈ûË£…ÿ≤v*ÿ4•>úUzùòúU‹Ω∂Æ*ˇ\0ˇ’˚‰§ïZé&Ç´÷ò∞≥k±NÓ≈I¶±]›ã\"ÏT⁄˚O∞‘‡6∫ïú7ˆƒÜ0Nã\"‘t4`p–<ŸFrÅ∞hø:Á.º≥ïÁ=X≤µK[]GMHJƒ°PΩ≥≤“ÇÉe+òzË`Ó;\'1‚¢˘™÷›\0N_;l{|ÂåA∑≤« ßûûT¥6Æ%0Júò∆hç)]ÍN_¢«Ω≥÷d®ÄNèÊœ,˘Z8ÓµXdV∫åGcq±‰kV„»qÓNŸ∞Àß2êß€+”ˇ\05tÀãÑ˝æô9≈«§◊\ZÌVjp\nl0CD\"}F›∂üNg%Ï˙gÊ‹∂ä≤Oct·9€œ5°c]∑\n\ZW¶[.:‹µd≈ö\'”Úo7yÛYÇKÀì´˝jNhZÿ⁄@jç∏ä\0NCÚ&ÉtpœÜÂúIÁhº…ËG†˙:•¥Ee1È4u´≤r5¿t«ÚæÊÎ3GàvL|ô%›«ôgx≠ú[œ/Z®™å£ê<@,´S^ˆhÁ.:zΩ˘GêZ\0Ä´01õFYŸzﬂ¸„vé5_ÕÔ.»#ÊösMy&ı\n∞∆‹O¸Ë{><ûcµ≤˛ÏáÎÈõ\"Û`S≤≈∂=˜≈êlıÈOlRÂ4>8™Í)®‰qU‘ß„LUˇ÷˚Ê:ñ,l7ã\'b¥ÏU€b√gS.n≈eOîøÁ-¸ø˙GÚ˛«[D-.Å~¶B¢ß“πôØ∞`π–Ån—d0 Û∂)Lê∆»’eë{\Z˜ŒW6.A›Ó∞e„ΩNˆ¬m:œÎb?¨	\nÜcƒÖ]˙¯◊ï·ââ‰‰Âê Êﬂ/YkQòdQayCpã^}ácìÜyBVﬂzvc~QÚ¶•°j>Ωä[_BX1∂\'f o∆õèª6qÕ	ã;9:]t±_PŸﬁF⁄D yFÿ›¢:œu#HUôŒƒ\0E)⁄ôt%∑aó]ör>™‡è6˘O[÷•˝˚A<=5ä≈k^é€l+æFYa\Z)ÀÆú≈w•\ZOó¨4Eπõw∏ù>∂¿|áé`K4≤Kπ¬ë®îœAû¬ÿ4V™â,û§— ¨ºlƒÄH•F’ﬂ%î¿;ÛÎ\Z¥§HŸé˘T1Ò\Zß1Ãæ∆ˇ\0ú3–\ZÁVÛWö‰Z«ez}≥v2Lﬁ£”‰™3°”CÄèÌ\\Ñê{ÙædíÎ≤-Æ≈[©Î]ÒW\nˆÎäÆ®Oﬂäªë•iÌ\\Uˇ◊˚Ê:ñ\Za’º	âv)6ÏR÷,8KgÀõ±IOœ^^ÉÕ~OÛ\'óßNk™ÈÛ√àê°1∞˜…VÃbx$sÒF	¶µ∏û“S¬XãG\"”çMoÙÊóWä˝UfﬁÀCózËRvˆA5º2≈é(Kq¯´∞‹\nÊ4bhëªüíu±‰…Ï!GXÿKEëjàÏHjvú÷e;ÓÏ1KmŸR]b%∑;Y°eF*›w‹RÄúû &¡ªgó3Ó@è ø9z´O0Œ-˝^+í5DtÿlhI5°ÃﬂÃ¢x√líü]y2ÁNâM˝Ã≥ò–U•z©\Z{ü£1\'ñ|©»«_πÄÍ˙lí≤¶ûÂ8Ç“êzP2Xg\\◊8„∂!£È1⁄^À F@ºñ›kPÓ‘ˆÆlr¿¨I>ªΩNf8˛ †Ø—í”¿}T’™ê#Ñ?WøÁºº∫Âár Œø4˙îœ‹´øˇ\0·PfÓ\0ÓÚ\Z…âÂ5—Ùv%†7Å∞;ªv*πh{b≠oOlUˇ–˚Ê:ñK£YÊﬁEîC±I≈-b∆ãgó7b…Ølêj/≈oŒÕ-Û_œömøäNIaU ÖYÈ(_òÁö¸Á√…‰^ü≥…ÀÑwáãyä≈u˝\"k9=Ãtí‘∆í\'Mˇ\0^c««0A∞\\Û#(êy∞Ω3œ7WvM¶•œ•©È≈!ø¥-I#ea^ò3Ëâ<@lŸèW√±4~˜”ﬂñ^cÜ^Iz¿¿‘xôâ\'í‘ı5íƒc.Nt2ÿ{ƒæg“‚„Õî∆‡—@•8Åﬂ#«[6ê.˜xgÊ?ùm≈ïÃˆ”(Ñ≠ñ\0}™ëQZVù~¸ú`dES#ìÁıÛ›“-‚FûkÅÈ¿Í¡ã±≠ fn-üVŒ]wéi≠¨≤¡låÊóSÛrË•≈JÅÌó¯VlÚåàèõPÇX∆Æ@P?hûõ|Ú\\W∞k1·ıÓøÂæò∫7ê|ù•´ZE§l√°oIKSÈ\'6ıBã«dóC.å„C≤	vŒ‚ò≥.≈\0b…€‚ä6ﬁÙˆ≈/ˇ—˚Ê:ñK£YÊﬁEîC±IÏRÍb«Ñ∏‚≤ÊÏRV3Ff!UA,«∞NH5óÂwÁ/ïˇ\0ƒ⁄∑ö<Î¶FÔsÎ]_¬¢≠&ü3òñ`_FT‚ﬁ\nËz`◊ÈÅáénﬂ≤5|0ñ¿˝˝œö/4ŸU>±‚¿|j]˛y¶≈ú]ì&+‰Úè1˘&◊UΩèS”Á}\\Öæ»‘q–´≠7«2ÒÍ8GxqÚ·„»£Ù´;i≥<P]i˙çõ¢à§2Im$Jù∏∞ê1Î∏#|éIbòπ\nﬂ£pû1`¸—Züõ<˚$©`æ\\ô¢äVãÎ1‹¬WaEa»ÉF}é√*≈áslû]@z„OÛ˛≤◊~••[ê\0YfgzTr%6®Ãúc9Y!¢c,Õ»“g£˘^”H∏ö˛‚‰Í7íÔ‡8h)HîWMqûn!ªiƒkk=Ï WúsïJ/Ï°ÿÌø\\√ñ`Ïqb±ª—ø,º§æ`◊N°q8ãMÚ‰ˆój£ëgyAT˚Óﬁ s?≥∞x≥‚#`Í˚cR0√Ç<œ‹˝c¸∑Û~ùs£ÿË◊◊QZÍñüπé\\)öõ¸à©^Ñ{f”<\ríLWG≠‘\Zo◊1ô ﬁÍUΩÜ—,•í)#i%æDQë∞SSR[ÿdRå¿Ãn≈5≥±PÍW!∫m◊ˇ“˚Ê:ñH≥Õÿ\nÉM‡e\'bêm™‚¿\Zv*M†Øµ2û˛Ó;XîT¥å√¿u98¿ûH∑ÜyÁÛaWOª≥—-dXÆy[~ïî0ß·s\n®;ä–T˝óè\"X›Úxóu5åÎ*B∑œ\n»d”òı»$B∑6ÇΩ~≥\n0˝˘GˆÛ0@bΩh<œIèÀZŸµ±∏kÔ/j®∑˛Z‘r/epƒ›A‚k‹‰;WM‡ ‚œ≤u^>:ó‘>ﬂ7îjZ8∑õ’X√\n÷¥†\'ÒÕX kwq¿*–qh–ﬁ;s.¨√øNπts/£\0S4ÚK}ØVR\r*§ÙÔΩr>:8w>_∑µ®<§„∑ƒƒ‘¯–dé†’[cæh(4Ö~R,gà˝Ä<|0ú’\Z£à°˘?Ú„PÛñ¢∂ã!—¥M:1wÊO0JÑ«ef6®ÿÚñB8«©cÌôöLÙMà˝Óø¥;OöD‹˘SÈ˝;Àö^ÖËÌL˝¶È“™ZËÛ(i\ZˆXÎ‘g‹…7¶¶‚Êáå0™√±vØ]ápƒF/õQ,≤‚ë≤†Ö/`ı\ZTVS‹É‚v2*`•~\'ghFÁ,úA™iÑõÍÕt/Ãü5ËöC©˛ï”£√rKØ˙ºòÚZxÜ#+ûñ;⁄ok{ﬂïø7<øÆzv∫â˝\r®∂‹&?∫c”·ìj}9É<]6=U&éDI\"q,r}áC…H=Í;f9ç2ï2)2oËÍ‚ê[⁄û¯≤ˇ”˚Ê:ñL5n»ê≠‡e.N≈$“K´˘ÉF–bj⁄ÑVj~¬1´∑˙®*O›ñG•…Å!„û`¸ﬂíg6>Y≥/,§™]H§π D†ö“ΩzuÃúzj‹µÒ[»5k›V˝&’uânÌ„YÓ˘O5Ù¢Bƒ!≠öqHÎJflqéCfª∑^”°@`àÃRÉ\Z[À*ôﬁ%H‚öHëUB‹HëÏ)ø-ÜHDPÔe—ælnêídYq∏å˙a˝B\0ìX}B°ëø›n7˜-Ü∑fIe2h∫_ô¥;Õ+Uç‰∂·%ˇ\0È(O◊,KIG‘mmŒÌ §\\€èä)yê8∂bj∞G(1=[pÍgÇBq;˝˛O÷?+º«¶√wÃ1j–€⁄õ≈º≤\"QqcZ≠‰(wx»°n5(M\ZõÃj˚pp‹}°ÎtΩπÜt\'È?c∆œó›§XJÖd ™Æﬁ;¸ª”ícÃ=jA5Ü€]Ehp0Ø⁄v°ÔﬂÜø›Hº∑,¨›¬œ,§\"≈◊ëÏ†ß≤@ %¿YŸÎﬁH¸≥[õK}F˛Õ#kÿ§∫–Ù…ﬂÖªZBi6©®IZ•¨gÏ®<•;á|Ë{;≤D}YwÓo/⁄=πcÉ€˘ﬂ†=rÏ≠m≠-4€≥ßÿ⁄€ù[M∫h¬˝ZŸáº…©\'>´ä≠å|;ª|=é¿Â˚È/5)§€Û-◊¢â§⁄E4?ªé“◊C˚R[ZNÎ,p‹I–›ﬁπYÆ	‹/?o.≈œÒm$†Ìû”M∑áQù√E∂1∏ØZÊV∂≥ëq;<´·H›ûm†U¢˝%YÙÀ0dUºÁk4∆YXƒa’øGÃËÂãÖTëO≈k’p›n∆Ñ®-÷ñÍ¬⁄a π3™BÂ#ï=á∂`xÒByFwP6ÌëîÎÚ)áóº·Ê?+:ç6˙Dãï$”Á´£ºxûáÒ %àKõ wßæ˘sÛ´FæH·◊Ì§—Ó©ÒŒº$éΩ>!◊ßl¬ûÃ∏ÉÿluN›.¥˚∏Ø-‰—0a¯tÃsÒ\nFdSÒfˇ\0ˇ‘˚Ê:ñL5n¿ÑØV÷Ù≠ŸÆı[ÿÏ·gô¯òé»£v>¿d£y$õxWòø7ÔÆ’‡Ú›∏∞Év\Zç¿Á+∆¢¨È\n®ˆâ†˝¢πôèK|⁄ºGå\\ﬂ^_›≠JY§ıeé\'öR“L\ZiR‹Õ‘Z-~\"*Àé\Z\"Õ˚ìõlmÌ\ZÚÍ5π÷⁄}‹6ÛÏûî˜“F·‚áÂom$Éï@$mQR÷ı¯‰º“ªÜ∏}J∆H Ú™Í2ªˇ\0„ïK5IÙ“Ú5Ï2¡∞cW^Ù˚Wâo|›Æ\\1r˛]ÇÊ4¥Éwow},V„é·§@=3⁄EL‡e_\ZJ/¥Ã[Î)v%0∞∫ç@[§ª©µªN ó¥£≤\\ÜCÃqå∂£Õ ﬂ.HÔ/]=§ ”\\‹≈µ√]€ÍñÒñ∫¥ùWåóqGπö7@Ã$UîzîÊ≤Rº√fbÉ?∏∫kZGf⁄H\\Ív∂∂økp˚∂©¢u“YÌzÄM;Wo¯˚Ë) ù»xüû¸ù£KŒπemi§µÚI⁄t™4˚ÑQ [ª0≈ANÛ€í$å’”ò™ú]Gf‚‘m ];ˇ\0nœE⁄Ÿt∆Æ„‹_\\˛y˛ZYjÛhwﬁ~—-µH%œjn◊è®võ–+Ç{©¶ssÏ≠D%√¡eÌpvé,∏¸K°‹˙˜»^_ÄŸãŸ¢˝=u´∞∂∑∂≥ô\\0ﬂO≥í•MS‚ª∏≠\"è˜kV-NèAŸ±¡ï}œ⁄›¨uR·ç∆#óõ’E‘öπé&ç|¿5ãµHÙ˚@`∂÷f≥¯R⁄?cI”á˜íRíΩv5£gë√ø‡~“ÈÓÏ!5mA,¢ic∏KÈØn_S7ãìÙùÃ#\Zî—Âı+W§Vê˚È8∂˘<Q‚4∆d\ny…éYÎs®Kq%ºff∫ú»Í^rz7\nê%ûÊv ˝Æﬁü¡W(‘vÑπQ©È]iöÃ⁄ÄÄáÆ°y‡ÇûìÍ“Mm´˚≈¶¿V÷3M€‘=r∏ë.hïKuVkhı	‘”Íqy≤X©Ÿ°÷Ì§j˜√ww’<ë∑Où®jW)\ZΩ∆Éö.ÌU˙o}mwOoÜv#ÉØΩ±,KxÏ^œÍËd”¥õ?Åvd{}AÏÓœ/tí7ﬂaJäÚ%Æ[+ŸÀ,RGn˝!y‡*Gµ„Î‚+1…ìò˚‰®Ïnﬁô¨Î~^∏i:Ñ˙tﬂ\n…\Z(Œ)Uu5ˆ?∞ ßÑ‰⁄&iÓY¸ÛGí;_4Xz#°‘ÌwM∂%„ﬂø^\'0ß¶Óeojˇ\0˘sÙ_Èü”ﬂ£?Â´ò•ñùkÌJÊ?Ö+¶~ ‰ˇ\0ˇ’˚”wykam%›Ìƒv∂–Ø)gïÇ™ÅÓr`…™GwÉ˘ßÛês{*ƒ®m^·Oˇ\0SøÃè£31i∏∑;∞\'ky\r’Ê°≠›Ow™›=ÏﬁÑó2M#˝Õº©ä°:77U‡\nÇv‰(s?¿åK\'@´®È◊:òÿê…ß&≥4S≥i.tïÖ@ÅNÕ,¥ŸŸi≤öd¨;Õ01¥∑ÀqÀ{™AzÚ∏xµ)ﬂOµ5+Æùiy~âΩvı\Z+Zìπ¡)PI™¥?òÔ>≠ÃKR∂zEµπPj◊ÀWTˇ\0ë∑üé˜˘ñ]KXîEÁMî)∏≥Ω≤¥RN–ÿﬂi⁄r˘ r3@Û˝l§v˘\'óËÎ´˘ x•Ùgúﬂ&˛V≥◊- 7–^π\0=1c`FÕWïµé∆ŸÔ/l_@ï¯§wÚR˜G-⁄ÂXµŸp)MÜ@~óÎwÚs·äuæÇËJç‰z§åKËô}4ûÂñæì«-aùî~ÊjH√”ñAñt›è,¶ ‡C\r¥fâÌln%∏M6›\\≈uZYtÍ\Z€ﬁDômøªôj—\n5\r2Á›¯‰[$n¸’ˇ\0úŒ¸»◊¸Ì™ˇ\0 ¨¸±÷¥ÕVŒﬁ‰\\y˙€Mï≠•‘u(è+ví ]£x“ÜAüv˚\"ô⁄|gLö=6øÖ˛∂≥í&\\2çè}kÂK»?î∫óoÊü&CÁ-pqmg©5¡Kgzsí)òÚÑ6º⁄§≠7Ãå8Dçë∑øΩéML•»ÔÀªÏzÂ_ÊU◊Â°u˘ïiÊ›KÚãYi∆~Oï∂Ø4Pœü!ı\'∂*ÖVì®n£N%Û{©∆«©2êåá>Ω?˙Û°yèGÛoótø3˘{PÉÃöOô¨ÌÌíM©†íß©m°irP-`V≠‹ªA\rCP∫YDƒ˛>~˛Á<\ncØ$˜rÀ 7≤~Êgñ¿àÃ¬kh\r†4·2mtÿ˚±íÂ∫ÃúcÑ~?ˆ¢xπ¢Ù€)†ö≈lÌ‡MMnMΩé¶+o¨‚eöÊ O®ËñÂí2vív-ª\ZÂy%|œ„ª‚Ÿb%.æí9¨µΩ67áCo+;y~⁄F>£[[ÎPqπõz˙∑ŒfÆˇ\0|#o{˙˘ÿyëÇ|iù«≈∏¢ﬂ⁄À¸pç  ≈nã’U[XÛL4˛ˆ7∆@ˇ\0+L∞ü|I€‚?RIﬁÜ÷\"x$’ıZã≈ÄOÊ7^_µ‘c†Ì˚€b~gø¡–®‹p∫‘¸…•ƒÉÍ:ıÆ´%öö”’÷ÙXØ@ˇ\0dµ>G\Zﬂnˇ\0ÿ§Ñ^Ø$óã\r’°2>≠wj8ˆ∆°Â·4\0÷ºîM\r@\"ïÌëçäPD©#ö⁄“[çV	õ–âµ0”2rÉIé)RÎø\'ı(Üˆ#Ù˜§ÇAâ˝5~° ?_ÎøTÙy?ZÙ}_Nïß.”ï? Ìïxaxèsˇ÷˙/y≠yØŒ>d˙¶µêGs≤Zôx√Ω¯≥+Ë®ﬂeëÅ&ßàÏsw\r8«=Sç≈‹ÎõKw±[XbYYhÏ·f¯ÉGsÆàöı·mlh|2Ë∞È˚s¸lõÈ!Ôlbæ)G’≠4n\r±<µùzKóÁ\ZÉêî˜¯˝√ˆµìbòoû5Ÿ‰—÷;*µ∆∑°5∫ÉJçK_jÚKS˜·å{ºæÎc±∞ü«—¥_0∆ím\Z◊Œ>ì7Z[«e•ƒOœâ	z•}=?{)PòÓªn≥Í˙•ôßıΩB–P◊‡àË⁄5\r}ùÜ[(ˆLÍÀ∫â©Êˆ∫£Wóö#?<™œ¯}≈ú$NuxìÙÜΩZ£Ã≤∂˚´fˇ\0√J‚>(R•·”NßÊàníiä\\ÍâØ[¿{ç2Öùn-òW˝#MíUëG⁄‡∆ï€*\"®˘«≈ò4(›%ÎÀº÷ç´òL:ç⁄Õ®\\EÈ€]8Zè™Î6¿E(Ë≤è0¯˘èá5ô5ÊË>™Ç8ÂëÌaπ∂üÍœ=ªKÍEß«%ƒQºë»°nt«â·$ë…À#wÀÒ˚Tûè≈ø˘»»}K˛q◊Õæq¸ÀÚÏáÃñûqÇ	ººff≤º‘ÅªkYùÿ`0A%îq≠kôxo)°ÃyÛ¸w0ú„Që◊ı´~D˛j˙GìcõöóûmıäGÂõÿê^…éC\\\\ªÇ®¥RJx∆&h‹{œÏ˝-:¨0è“lsÆo?µK_¸ñ”?=ø0ºπ¨~Ryé˛-]º?_“µÒ^i—¬	t∑‰ºE≤*≤û ™Åƒrÿeß,±Fâ:éGﬂ‘&≠4à&2«^è◊+˘@¸æ–4?&ÈVê√°X[ÿ˘jœK“Ì•Fûõ_ØEßŸöª/◊›ã\\œ!O≤v\0äj2zÕπx¨W4 hbçÁíÚU≤â>≥sq™Y◊åi\Z}_P’!U‰B€«˛Éß®ﬁµe7¸~>jMsF[ZYÀ;≈´ƒt˚R˙}ÜßÂÿ¿©ÿV“ºπ62‹µ./)˚?|49\nó„º˛§›ê;íƒu”5œPI†kÍ«n±˘†ªS-&‰?ª—~gF6ﬁdRj^=‘ÅJR‚—Üﬁ√yÜ6:ß/?0˘É`¢]G\\∑A„Îyj›«_e»ﬂ!ÁΩBï£}iÙxH&÷|øœóB\'Ú√°˚Èàˆ˝Ë7lv “[òºø(oNv∂Ú=¡í¢ú•K€\'ÿ˚0…V}ˇ\0a\nN‡*Ë(c–%`Dö\\^_ûıA®Q§Íó\ZU∆Á≤Er§˚bc√cÃ˛∂cd•D˙vÅw¬~¶4≠fÕ†B˜≥∏•e5Ë©`•©„í·\'Êã›Í_R?ßæ±AıÒ˜<„èÈˇ\0ƒ≤Æ/∫—{?ˇ◊˙Yi«J◊¸Ÿ≠ ¸ÌÂÛ=Ì“9Ëêh˙dó,?‚˘æ¸ﬁÇe\ZÚ˚Õ8Ä–›(—“c®È≤‹∞⁄ú¡\"QP&—¥Wí‡öıˇ\0Hø?HÀrmuÃü”_°OVLãüóIãO‘Ù(ÊA∑ÓÙç\nK˜˚úä˚Â$ﬂ _iH”Õl≠$’µﬂ,iÏy¡§«‰´	öïº∑&ÚQ„–Ωr√Ë¸rb Æﬂi∑™µˇ\0sv≠;ı÷<◊È˝≈c˚≤´»˝√ˆ±à€/±\r¨Yﬁm[õ˘o)_˜∑ŒQ-~î¥Éµ∆÷Ã?≈‘+…!zñ7Cï({Ê§ÒM¸G‹R:\'Z—ÙÁ’ﬂß©õ™\0ØMJ‘\Z}√ê¯ røwﬁ’ﬁ°Æºl9˛éªøÛf∑>ïÆï/ïÌ∏µéqO˜DÎ)ÜOı«z\\≈ƒ »nvEÍöt\ZlvÀe%¨Wñó]ybH∆ù+£]X√)†-i#ããbOJ™”r‰w¸b$	ËÑ’U„≤∏kíì›[«Êò&ºXƒ/;[ŸEöUÖﬁÑ±rrÿU◊ªÔcø2ê~e˛[˘gÛ7 _õ~OÛ-Ñ767÷Zuç•„∆≤Ig)µ±T∏áóŸxÀ‘◊ßLôââÂw∂/≈(˘ÉÚgÕõVæ{∞áÛDÚ∂∑qßÈ˛D±œyë)-Âºã\"º6Ä®‚6j1 ≠Èµñi∆WÈóGXÒ‰êÑn2œ!øóÈ}=ˇ\08UÊÒ◊Á’ÔôÌ‚>\\Ú¸^[’,¥,ŒÆ§y-§g.Ò¢ƒåUß_ª=xt.â{ë(å≠˙(»óÂØR3\"_j~OIF·w¶Mjƒ0‹˙å∆ÎÛMÙEËê^Œö#Õe©<ñØ\rî!bÜymHÙ˝>,œıkâÆe\'Ì…ÙåÑÍ ìt?6`â√^“õHøÚÌ≥\\ì,ZŒûtªJÛ∫í[ÀËß©ﬁ…@ì(¡÷Å”ÃJÂÂ˝Åè	b˙¨,tˇ\00É†yòé˝|»•>Y(ÛéåInå◊aG}pqëÁ¿ÀﬂÏ⁄±ÎÚ…¬æ‰\níG¯â◊ß©Ø T¯ô|™†˛¨Æ˘!˜±∫;˘±≠3]ykØ3y‰ŸÕ;˙öe‘‹w„ñá¿˝Ïç®ÈFõÂ√ ‚—Ë˛JbÙ°¯uâc;Ù⁄∏¸BÇjòıƒ?UªΩàû˙Öèö¨n\0;!mY‚Ö«Ö%1eÄô¸ˇ\0Cvõjvó\Z∫È∞ÿ∆d:¶§@¸+o3X•„0Æƒ´$Ë+‚F.áπkgøY¢øLs˝«¸¨?Ø◊˛]?H˛é≠|8Ôî˙Æ∫’}ñœÉo\'ˇŸ','emp.jpeg','image/jpeg; charset=binary','34696');
/*!40000 ALTER TABLE `hs_hr_emp_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_quicklink`
--

DROP TABLE IF EXISTS `hs_hr_emp_quicklink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_quicklink` (
  `qlk_id` int(20) NOT NULL AUTO_INCREMENT,
  `qlk_name` varchar(200) DEFAULT NULL,
  `qlk_name_si` varchar(200) DEFAULT NULL,
  `qlk_name_ta` varchar(200) DEFAULT NULL,
  `qlk_link` varchar(500) DEFAULT NULL,
  `qlk_order` int(4) DEFAULT NULL,
  `qlk_active` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`qlk_id`),
  UNIQUE KEY `qlk_order` (`qlk_order`),
  UNIQUE KEY `qlk_name_ta` (`qlk_name_ta`),
  UNIQUE KEY `qlk_name_si` (`qlk_name_si`),
  UNIQUE KEY `qlk_name` (`qlk_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_quicklink`
--

LOCK TABLES `hs_hr_emp_quicklink` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_quicklink` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_quicklink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_reportto`
--

DROP TABLE IF EXISTS `hs_hr_emp_reportto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_reportto` (
  `erep_sup_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_sub_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_reporting_mode` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`erep_sup_emp_number`,`erep_sub_emp_number`,`erep_reporting_mode`),
  KEY `xif1hs_hr_emp_reportto` (`erep_sub_emp_number`),
  KEY `xif2hs_hr_emp_reportto` (`erep_sup_emp_number`),
  CONSTRAINT `hs_hr_emp_reportto_ibfk_1` FOREIGN KEY (`erep_sup_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  CONSTRAINT `hs_hr_emp_reportto_ibfk_2` FOREIGN KEY (`erep_sub_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_reportto`
--

LOCK TABLES `hs_hr_emp_reportto` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_reportto` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_reportto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_role_group`
--

DROP TABLE IF EXISTS `hs_hr_emp_role_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_role_group` (
  `role_group_id` int(4) NOT NULL AUTO_INCREMENT,
  `role_group_name` varchar(200) DEFAULT NULL,
  `role_group_name_si` varchar(200) DEFAULT NULL,
  `role_group_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`role_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_role_group`
--

LOCK TABLES `hs_hr_emp_role_group` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_role_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_role_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_service_history`
--

DROP TABLE IF EXISTS `hs_hr_emp_service_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_service_history` (
  `esh_code` int(11) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `esh_name` varchar(100) NOT NULL,
  `esh_name_si` varchar(100) DEFAULT NULL,
  `esh_name_ta` varchar(100) DEFAULT NULL,
  `esh_designation` varchar(100) NOT NULL,
  `esh_designation_si` varchar(100) DEFAULT NULL,
  `esh_designation_ta` varchar(100) DEFAULT NULL,
  `esh_district` varchar(50) NOT NULL,
  `esh_from_date` date NOT NULL,
  `esh_to_date` date NOT NULL,
  PRIMARY KEY (`esh_code`,`emp_number`),
  KEY `xif1hs_hr_emp_service_history` (`emp_number`),
  CONSTRAINT `hs_hr_emp_service_history_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_service_history`
--

LOCK TABLES `hs_hr_emp_service_history` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_service_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_service_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_skill`
--

DROP TABLE IF EXISTS `hs_hr_emp_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_skill` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `skill_code` varchar(13) NOT NULL,
  `eskill_years` varchar(150) NOT NULL,
  `eskill_comments` varchar(200) NOT NULL,
  `eskill_comments_si` varchar(200) NOT NULL,
  `eskill_comments_ta` varchar(200) NOT NULL,
  PRIMARY KEY (`emp_number`,`skill_code`),
  KEY `xif1hs_hr_emp_skill` (`skill_code`),
  KEY `xif2hs_hr_emp_skill` (`emp_number`),
  CONSTRAINT `hs_hr_emp_skill_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_emp_skill_ibfk_2` FOREIGN KEY (`skill_code`) REFERENCES `hs_hr_skill` (`skill_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_skill`
--

LOCK TABLES `hs_hr_emp_skill` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_subdivision_history`
--

DROP TABLE IF EXISTS `hs_hr_emp_subdivision_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_subdivision_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `code` varchar(15) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xif1hs_hr_emp_subdivision_history` (`emp_number`),
  CONSTRAINT `hs_hr_emp_subdivision_history_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_subdivision_history`
--

LOCK TABLES `hs_hr_emp_subdivision_history` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_subdivision_history` DISABLE KEYS */;
INSERT INTO `hs_hr_emp_subdivision_history` VALUES (1,1,'2','Head Office','2012-10-28 15:50:20',NULL);
/*!40000 ALTER TABLE `hs_hr_emp_subdivision_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_emp_work_experience`
--

DROP TABLE IF EXISTS `hs_hr_emp_work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_emp_work_experience` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eexp_seqno` decimal(10,0) NOT NULL DEFAULT '0',
  `eexp_company` varchar(100) DEFAULT NULL,
  `eexp_company_si` varchar(100) DEFAULT NULL,
  `eexp_company_ta` varchar(100) DEFAULT NULL,
  `eexp_jobtitle` varchar(100) DEFAULT NULL,
  `eexp_jobtitle_si` varchar(100) DEFAULT NULL,
  `eexp_jobtitle_ta` varchar(100) DEFAULT NULL,
  `eexp_from_date` datetime DEFAULT NULL,
  `eexp_to_date` datetime DEFAULT NULL,
  `eexp_comments` varchar(200) DEFAULT NULL,
  `eexp_comments_si` varchar(200) DEFAULT NULL,
  `eexp_comments_ta` varchar(200) DEFAULT NULL,
  `eexp_internal_flg` int(1) DEFAULT NULL,
  `eexp_years` int(3) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`eexp_seqno`),
  KEY `xif1hs_hr_emp_work_experience` (`emp_number`),
  CONSTRAINT `hs_hr_emp_work_experience_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_emp_work_experience`
--

LOCK TABLES `hs_hr_emp_work_experience` WRITE;
/*!40000 ALTER TABLE `hs_hr_emp_work_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_emp_work_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_empacting_workstation`
--

DROP TABLE IF EXISTS `hs_hr_empacting_workstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_empacting_workstation` (
  `emp_number` int(7) NOT NULL,
  `act_job_title_code` varchar(13) DEFAULT NULL,
  `act_workstation_no` int(7) NOT NULL DEFAULT '0',
  `act_hie_code_1` int(6) DEFAULT NULL,
  `act_hie_code_2` int(6) DEFAULT NULL,
  `act_hie_code_3` int(6) DEFAULT NULL,
  `act_hie_code_4` int(6) DEFAULT NULL,
  `act_hie_code_5` int(6) DEFAULT NULL,
  `act_hie_code_6` int(6) DEFAULT NULL,
  `act_hie_code_7` int(6) DEFAULT NULL,
  `act_hie_code_8` int(6) DEFAULT NULL,
  `act_hie_code_9` int(6) DEFAULT NULL,
  `act_hie_code_10` int(6) DEFAULT NULL,
  `act_work_satation` int(6) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`act_workstation_no`),
  KEY `hs_hr_empacting_workstation_job_title_code` (`act_job_title_code`),
  KEY `act_hie_code_1_id_1` (`act_hie_code_1`),
  KEY `act_hie_code_2_id_2` (`act_hie_code_2`),
  KEY `act_hie_code_3_id_3` (`act_hie_code_3`),
  KEY `act_hie_code_4_id_4` (`act_hie_code_4`),
  KEY `act_hie_code_5_id_5` (`act_hie_code_5`),
  KEY `act_hie_code_6_id_6` (`act_hie_code_6`),
  KEY `act_hie_code_7_id_7` (`act_hie_code_7`),
  KEY `act_hie_code_8_id_8` (`act_hie_code_8`),
  KEY `act_hie_code_9_id_9` (`act_hie_code_9`),
  KEY `act_hie_code_10_id_10` (`act_hie_code_10`),
  KEY `act_hie_code_hs_hr_empacting_workstation` (`act_work_satation`),
  CONSTRAINT `act_hie_code_10_id_10` FOREIGN KEY (`act_hie_code_10`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_1_id_1` FOREIGN KEY (`act_hie_code_1`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_2_id_2` FOREIGN KEY (`act_hie_code_2`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_3_id_3` FOREIGN KEY (`act_hie_code_3`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_4_id_4` FOREIGN KEY (`act_hie_code_4`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_5_id_5` FOREIGN KEY (`act_hie_code_5`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_6_id_6` FOREIGN KEY (`act_hie_code_6`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_7_id_7` FOREIGN KEY (`act_hie_code_7`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_8_id_8` FOREIGN KEY (`act_hie_code_8`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_9_id_9` FOREIGN KEY (`act_hie_code_9`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_hs_hr_empacting_workstation` FOREIGN KEY (`act_work_satation`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `employee_hs_hr_empacting_workstation` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_empacting_workstation_job_title_code` FOREIGN KEY (`act_job_title_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_empacting_workstation`
--

LOCK TABLES `hs_hr_empacting_workstation` WRITE;
/*!40000 ALTER TABLE `hs_hr_empacting_workstation` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_empacting_workstation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_employee`
--

DROP TABLE IF EXISTS `hs_hr_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_employee` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `employee_id` varchar(50) DEFAULT NULL,
  `emp_lastname` varchar(100) NOT NULL DEFAULT '',
  `emp_firstname` varchar(100) NOT NULL DEFAULT '',
  `ethnic_race_code` varchar(13) DEFAULT NULL,
  `emp_birthday` date DEFAULT NULL,
  `nation_code` varchar(13) DEFAULT NULL,
  `emp_status` varchar(13) DEFAULT NULL,
  `job_title_code` varchar(13) DEFAULT NULL,
  `act_job_title_code` varchar(13) DEFAULT NULL,
  `work_station` int(6) DEFAULT NULL,
  `act_work_station` int(6) DEFAULT NULL,
  `emp_work_station_hof_flg` int(2) DEFAULT NULL,
  `emp_act_work_station_hof_flg` int(2) DEFAULT NULL,
  `terminated_date` date DEFAULT NULL,
  `termination_reason` varchar(256) DEFAULT NULL,
  `service_code` int(4) DEFAULT NULL,
  `grade_code` int(4) DEFAULT NULL,
  `slt_scale_year` int(10) DEFAULT NULL,
  `level_code` int(4) DEFAULT NULL,
  `emp_app_letter_no` varchar(20) DEFAULT NULL,
  `emp_personal_file_no` varchar(20) DEFAULT NULL,
  `title_code` int(2) DEFAULT NULL,
  `emp_initials` varchar(30) DEFAULT NULL,
  `emp_initials_si` varchar(30) DEFAULT NULL,
  `emp_initials_ta` varchar(30) DEFAULT NULL,
  `emp_names_of_initials` varchar(120) DEFAULT NULL,
  `emp_names_of_initials_si` varchar(120) DEFAULT NULL,
  `emp_names_of_initials_ta` varchar(120) DEFAULT NULL,
  `emp_firstname_si` varchar(100) DEFAULT NULL,
  `emp_firstname_ta` varchar(100) DEFAULT NULL,
  `emp_lastname_si` varchar(100) DEFAULT NULL,
  `emp_lastname_ta` varchar(100) DEFAULT NULL,
  `gender_code` int(2) DEFAULT NULL,
  `emp_birth_location` varchar(50) DEFAULT NULL,
  `emp_birth_location_si` varchar(50) DEFAULT NULL,
  `emp_birth_location_ta` varchar(50) DEFAULT NULL,
  `marst_code` int(2) DEFAULT NULL,
  `emp_married_date` date DEFAULT NULL,
  `emp_nic_no` varchar(20) DEFAULT NULL,
  `emp_nic_date` date DEFAULT NULL,
  `rlg_code` int(2) DEFAULT NULL,
  `lang_code` varchar(13) DEFAULT NULL,
  `cou_code` char(2) DEFAULT NULL,
  `emp_passport_no` varchar(20) DEFAULT NULL,
  `emp_attendance_no` varchar(20) DEFAULT NULL,
  `emp_other_file_no` varchar(20) DEFAULT NULL,
  `emp_salary_no` varchar(20) DEFAULT NULL,
  `emp_barcode_no` varchar(20) DEFAULT NULL,
  `emp_public_app_date` date DEFAULT NULL,
  `emp_public_com_date` date DEFAULT NULL,
  `emp_app_date` date DEFAULT NULL,
  `emp_com_date` date DEFAULT NULL,
  `emp_rec_method` int(2) DEFAULT NULL,
  `emp_rec_method_desc` varchar(100) DEFAULT NULL,
  `emp_rec_method_desc_si` varchar(100) DEFAULT NULL,
  `emp_rec_method_desc_ta` varchar(100) DEFAULT NULL,
  `emp_rec_medium` int(2) DEFAULT NULL,
  `emp_active_hrm_flg` int(2) DEFAULT NULL,
  `emp_active_att_flg` int(2) DEFAULT NULL,
  `emp_active_pr_flg` int(2) DEFAULT NULL,
  `emp_wop_flg` int(2) DEFAULT NULL,
  `emp_wop_no` varchar(20) DEFAULT NULL,
  `emp_confirm_flg` int(2) DEFAULT NULL,
  `emp_confirm_date` date DEFAULT NULL,
  `emp_prob_ext_flg` int(2) DEFAULT NULL,
  `emp_prob_from_date` date DEFAULT NULL,
  `emp_prob_to_date` date DEFAULT NULL,
  `class_code` int(4) DEFAULT NULL,
  `emp_salary_scale` varchar(100) DEFAULT NULL,
  `emp_salary_scale_si` varchar(100) DEFAULT NULL,
  `emp_salary_scale_ta` varchar(100) DEFAULT NULL,
  `emp_basic_salary` double DEFAULT NULL,
  `emp_salary_inc_date` date DEFAULT NULL,
  `emp_display_name` varchar(200) DEFAULT NULL,
  `emp_display_name_si` varchar(200) DEFAULT NULL,
  `emp_display_name_ta` varchar(200) DEFAULT NULL,
  `emp_pension_no` varchar(25) DEFAULT NULL,
  `emp_resign_date` date DEFAULT NULL,
  `emp_retirement_date` date DEFAULT NULL,
  `emp_ldap_flag` int(2) DEFAULT NULL,
  `hie_code_1` int(6) DEFAULT NULL,
  `hie_code_2` int(6) DEFAULT NULL,
  `hie_code_3` int(6) DEFAULT NULL,
  `hie_code_4` int(6) DEFAULT NULL,
  `hie_code_5` int(6) DEFAULT NULL,
  `hie_code_6` int(6) DEFAULT NULL,
  `hie_code_7` int(6) DEFAULT NULL,
  `hie_code_8` int(6) DEFAULT NULL,
  `hie_code_9` int(6) DEFAULT NULL,
  `hie_code_10` int(6) DEFAULT NULL,
  `act_hie_code_1` int(6) DEFAULT NULL,
  `act_hie_code_2` int(6) DEFAULT NULL,
  `act_hie_code_3` int(6) DEFAULT NULL,
  `act_hie_code_4` int(6) DEFAULT NULL,
  `act_hie_code_5` int(6) DEFAULT NULL,
  `act_hie_code_6` int(6) DEFAULT NULL,
  `act_hie_code_7` int(6) DEFAULT NULL,
  `act_hie_code_8` int(6) DEFAULT NULL,
  `act_hie_code_9` int(6) DEFAULT NULL,
  `act_hie_code_10` int(6) DEFAULT NULL,
  `emp_ispaydownload` int(1) DEFAULT NULL,
  PRIMARY KEY (`emp_number`),
  UNIQUE KEY `employee_id` (`employee_id`),
  KEY `xif1hs_hr_employee` (`class_code`),
  KEY `xif2hs_hr_employee` (`cou_code`),
  KEY `xif3hs_hr_employee` (`emp_attendance_no`),
  KEY `xif4hs_hr_employee` (`emp_status`),
  KEY `xif5hs_hr_employee` (`ethnic_race_code`),
  KEY `xif6hs_hr_employee` (`gender_code`),
  KEY `xif7hs_hr_employee` (`grade_code`),
  KEY `xif8hs_hr_employee` (`job_title_code`),
  KEY `xif9hs_hr_employee` (`lang_code`),
  KEY `xif10hs_hr_employee` (`marst_code`),
  KEY `xif11hs_hr_employee` (`nation_code`),
  KEY `xif12hs_hr_employee` (`rlg_code`),
  KEY `xif13hs_hr_employee` (`service_code`),
  KEY `xif14hs_hr_employee` (`title_code`),
  KEY `xif15hs_hr_employee` (`work_station`),
  KEY `hie_code_1` (`hie_code_1`),
  KEY `hie_code_2` (`hie_code_2`),
  KEY `hie_code_3` (`hie_code_3`),
  KEY `hie_code_4` (`hie_code_4`),
  KEY `hie_code_5` (`hie_code_5`),
  KEY `hie_code_6` (`hie_code_6`),
  KEY `hie_code_7` (`hie_code_7`),
  KEY `hie_code_8` (`hie_code_8`),
  KEY `hie_code_9` (`hie_code_9`),
  KEY `hie_code_10` (`hie_code_10`),
  KEY `hs_hr_employee_ibfk_15` (`level_code`),
  KEY `hs_hr_employee_ibfk_16` (`act_work_station`),
  KEY `act_hie_code_1_ibfk_1` (`act_hie_code_1`),
  KEY `act_hie_code_2_ibfk_2` (`act_hie_code_2`),
  KEY `act_hie_code_3_ibfk_3` (`act_hie_code_3`),
  KEY `act_hie_code_4_ibfk_4` (`act_hie_code_4`),
  KEY `act_hie_code_5_ibfk_5` (`act_hie_code_5`),
  KEY `act_hie_code_6_ibfk_6` (`act_hie_code_6`),
  KEY `act_hie_code_7_ibfk_7` (`act_hie_code_7`),
  KEY `act_hie_code_8_ibfk_8` (`act_hie_code_8`),
  KEY `act_hie_code_9_ibfk_9` (`act_hie_code_9`),
  KEY `act_hie_code_10_ibfk_10` (`act_hie_code_10`),
  KEY `hs_hr_employee_act_job_title_code` (`act_job_title_code`),
  KEY `hs_hr_grade_year_slot_hs_hr_employee` (`slt_scale_year`),
  CONSTRAINT `act_hie_code_10_ibfk_10` FOREIGN KEY (`act_hie_code_10`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_1_ibfk_1` FOREIGN KEY (`act_hie_code_1`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_2_ibfk_2` FOREIGN KEY (`act_hie_code_2`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_3_ibfk_3` FOREIGN KEY (`act_hie_code_3`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_4_ibfk_4` FOREIGN KEY (`act_hie_code_4`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_5_ibfk_5` FOREIGN KEY (`act_hie_code_5`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_6_ibfk_6` FOREIGN KEY (`act_hie_code_6`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_7_ibfk_7` FOREIGN KEY (`act_hie_code_7`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_8_ibfk_8` FOREIGN KEY (`act_hie_code_8`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `act_hie_code_9_ibfk_9` FOREIGN KEY (`act_hie_code_9`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hie_code_10_ibfk_10` FOREIGN KEY (`hie_code_10`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hie_code_1_ibfk_1` FOREIGN KEY (`hie_code_1`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hie_code_2_ibfk_2` FOREIGN KEY (`hie_code_2`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hie_code_3_ibfk_3` FOREIGN KEY (`hie_code_3`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hie_code_4_ibfk_4` FOREIGN KEY (`hie_code_4`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hie_code_5_ibfk_5` FOREIGN KEY (`hie_code_5`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hie_code_6_ibfk_6` FOREIGN KEY (`hie_code_6`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hie_code_7_ibfk_7` FOREIGN KEY (`hie_code_7`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hie_code_8_ibfk_8` FOREIGN KEY (`hie_code_8`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hie_code_9_ibfk_9` FOREIGN KEY (`hie_code_9`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_hr_employee_act_job_title_code` FOREIGN KEY (`act_job_title_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`),
  CONSTRAINT `hs_hr_employee_ibfk_1` FOREIGN KEY (`work_station`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_hr_employee_ibfk_10` FOREIGN KEY (`lang_code`) REFERENCES `hs_hr_language` (`lang_code`),
  CONSTRAINT `hs_hr_employee_ibfk_11` FOREIGN KEY (`cou_code`) REFERENCES `hs_hr_country` (`cou_code`),
  CONSTRAINT `hs_hr_employee_ibfk_12` FOREIGN KEY (`class_code`) REFERENCES `hs_hr_class` (`class_code`),
  CONSTRAINT `hs_hr_employee_ibfk_13` FOREIGN KEY (`service_code`) REFERENCES `hs_hr_service` (`service_code`),
  CONSTRAINT `hs_hr_employee_ibfk_14` FOREIGN KEY (`grade_code`) REFERENCES `hs_hr_grade` (`grade_code`),
  CONSTRAINT `hs_hr_employee_ibfk_15` FOREIGN KEY (`level_code`) REFERENCES `hs_hr_level` (`level_code`),
  CONSTRAINT `hs_hr_employee_ibfk_16` FOREIGN KEY (`act_work_station`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_hr_employee_ibfk_2` FOREIGN KEY (`ethnic_race_code`) REFERENCES `hs_hr_ethnic_race` (`ethnic_race_code`),
  CONSTRAINT `hs_hr_employee_ibfk_3` FOREIGN KEY (`nation_code`) REFERENCES `hs_hr_nationality` (`nat_code`),
  CONSTRAINT `hs_hr_employee_ibfk_4` FOREIGN KEY (`job_title_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`),
  CONSTRAINT `hs_hr_employee_ibfk_5` FOREIGN KEY (`emp_status`) REFERENCES `hs_hr_empstat` (`estat_code`),
  CONSTRAINT `hs_hr_employee_ibfk_6` FOREIGN KEY (`title_code`) REFERENCES `hs_hr_title` (`title_code`),
  CONSTRAINT `hs_hr_employee_ibfk_7` FOREIGN KEY (`gender_code`) REFERENCES `hs_hr_gender` (`gender_code`),
  CONSTRAINT `hs_hr_employee_ibfk_8` FOREIGN KEY (`marst_code`) REFERENCES `hs_hr_marital_status` (`marst_code`),
  CONSTRAINT `hs_hr_employee_ibfk_9` FOREIGN KEY (`rlg_code`) REFERENCES `hs_hr_religion` (`rlg_code`),
  CONSTRAINT `hs_hr_grade_year_slot_hs_hr_employee` FOREIGN KEY (`slt_scale_year`) REFERENCES `hs_hr_grade_slot` (`slt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_employee`
--

LOCK TABLES `hs_hr_employee` WRITE;
/*!40000 ALTER TABLE `hs_hr_employee` DISABLE KEYS */;
INSERT INTO `hs_hr_employee` VALUES (1,'900010001V','Kuree','Amal','ETH1','1990-01-01','NAT1','EST000','JOB001','JOB001',2,NULL,NULL,NULL,NULL,NULL,1,1,1,1,'900010001V','900010001V',1,'A.B','‡∂í.‡∂∂‡∑ì','‡Æè.‡Æ™‡ØÄ','Amal Basnayake Kuree','‡∂Ö‡∂∏‡∂Ω‡∑ä ‡∂∂‡∑É‡∑ä‡∂±‡∑è‡∂∫‡∂ö ‡∂ö‡∑î‡∂ª‡∑ì','‡ÆÖ‡ÆÆ‡Æ≤‡Øç ‡Æ™‡Æö‡Øç‡Æ©‡Ææ‡ÆØ‡Æï ‡Æï‡ØÅ‡Æ∞‡ØÄ','‡∂Ö‡∂∏‡∂Ω‡∑ä','‡ÆÖ‡ÆÆ‡Æ≤‡Øç','‡∂ö‡∑î‡∂ª‡∑ì','‡Æï‡ØÅ‡Æ∞‡ØÄ',1,'','','',1,NULL,'900010001V','2012-10-01',1,'LAN001','LK','','A001','','','','2012-10-01','2012-10-01','2012-10-01','2012-10-01',3,NULL,NULL,NULL,1,1,1,1,NULL,'',0,NULL,0,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Amal Kuree','‡∂Ö‡∂∏‡∂Ω‡∑ä ‡∂ö‡∑î‡∂ª‡∑ì','‡ÆÖ‡ÆÆ‡Æ≤‡Øç ‡Æï‡ØÅ‡Æ∞‡ØÄ',NULL,NULL,'2045-01-01',0,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER emp_insert AFTER Insert ON hs_hr_employee FOR EACH ROW BEGIN
INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", NEW.emp_number, null, null, null,NOW(),@user,"new record added");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER emp_update AFTER UPDATE ON hs_hr_employee FOR EACH ROW BEGIN IF NOT( OLD.emp_number <=> NEW.emp_number) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_number", OLD.emp_number, NEW.emp_number,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.employee_id <=> NEW.employee_id) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "employee_id", OLD.employee_id, NEW.employee_id,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_lastname<=> NEW.emp_lastname) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_lastname", OLD.emp_lastname, NEW.emp_lastname,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_firstname <=> NEW.emp_firstname) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_firstname", OLD.emp_firstname, NEW.emp_firstname,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.ethnic_race_code <=> NEW.ethnic_race_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "ethnic_race_code", OLD.ethnic_race_code, NEW.ethnic_race_code,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_birthday <=> NEW.emp_birthday) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_birthday", OLD.emp_birthday, NEW.emp_birthday,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.nation_code <=> NEW.nation_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "nation_code", OLD.nation_code, NEW.nation_code,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_status <=> NEW.emp_status) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_status ", OLD.emp_status , NEW.emp_status ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.job_title_code <=> NEW.job_title_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "job_title_code", OLD.job_title_code , NEW.job_title_code ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.work_station <=> NEW.work_station) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "work_station ", OLD.work_station , NEW.work_station ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.terminated_date <=> NEW.terminated_date) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "terminated_date ", OLD.terminated_date , NEW.terminated_date ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.termination_reason <=> NEW.termination_reason) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "termination_reason ", OLD.termination_reason , NEW.termination_reason ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.service_code <=> NEW.service_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "service_code ", OLD.service_code , NEW.service_code ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.grade_code <=> NEW.grade_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "grade_code ", OLD.grade_code , NEW.grade_code ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_app_letter_no <=> NEW.emp_app_letter_no) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_app_letter_no ", OLD.emp_app_letter_no , NEW.emp_app_letter_no ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_personal_file_no <=> NEW.emp_personal_file_no) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_personal_file_no ", OLD.emp_personal_file_no , NEW.emp_personal_file_no ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.title_code <=> NEW.title_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "title_code ", OLD.title_code , NEW.title_code ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_initials <=> NEW.emp_initials) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_initials ", OLD.emp_initials , NEW.emp_initials ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_initials_si <=> NEW.emp_initials_si) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_initials_si ", OLD.emp_initials_si , NEW.emp_initials_si ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_initials_ta <=> NEW.emp_initials_ta) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_initials_ta ", OLD.emp_initials_ta , NEW.emp_initials_ta ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_names_of_initials <=> NEW.emp_names_of_initials) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_names_of_initials ", OLD.emp_names_of_initials , NEW.emp_names_of_initials ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_names_of_initials_si <=> NEW.emp_names_of_initials_si) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_names_of_initials_si ", OLD.emp_names_of_initials_si , NEW.emp_names_of_initials_si ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_names_of_initials_ta <=> NEW.emp_names_of_initials_ta) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_names_of_initials_ta ", OLD.emp_names_of_initials_ta , NEW.emp_names_of_initials_ta ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_firstname_si <=> NEW.emp_firstname_si) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_firstname_si ", OLD.emp_firstname_si , NEW.emp_firstname_si ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_firstname_ta <=> NEW.emp_firstname_ta) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_firstname_ta ", OLD.emp_firstname_ta , NEW.emp_firstname_ta ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_lastname_si <=> NEW.emp_lastname_si) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_lastname_si ", OLD.emp_lastname_si , NEW.emp_lastname_si ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_lastname_ta <=> NEW.emp_lastname_ta) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_lastname_ta ", OLD.emp_lastname_ta , NEW.emp_lastname_ta ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.gender_code<=> NEW.gender_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "gender_code ", OLD.gender_code , NEW.gender_code ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_birth_location <=> NEW.emp_birth_location) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_birth_location ", OLD.emp_birth_location , NEW.emp_birth_location ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_birth_location_si <=> NEW.emp_birth_location_si) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_birth_location_si ", OLD.emp_birth_location_si , NEW.emp_birth_location_si ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_birth_location_ta <=> NEW.emp_birth_location_ta) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_birth_location_ta ", OLD.emp_birth_location_ta , NEW.emp_birth_location_ta ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.marst_code <=> NEW.marst_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "marst_code ", OLD.marst_code , NEW.marst_code ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_married_date <=> NEW.emp_married_date) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_married_date ", OLD.emp_married_date , NEW.emp_married_date ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_nic_no <=> NEW.emp_nic_no) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_nic_no ", OLD.emp_nic_no , NEW.emp_nic_no ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_nic_date <=> NEW.emp_nic_date) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_nic_date ", OLD.emp_nic_date , NEW.emp_nic_date ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.rlg_code <=> NEW.rlg_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "rlg_code ", OLD.rlg_code , NEW.rlg_code ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.lang_code <=> NEW.lang_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "lang_code ", OLD.lang_code , NEW.lang_code ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.cou_code <=> NEW.cou_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "cou_code ", OLD.cou_code , NEW.cou_code ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_passport_no <=> NEW.emp_passport_no) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_passport_no ", OLD.emp_passport_no , NEW.emp_passport_no ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_attendance_no <=> NEW.emp_attendance_no) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_attendance_no ", OLD.emp_attendance_no , NEW.emp_attendance_no ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_other_file_no <=> NEW.emp_other_file_no) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_other_file_no ", OLD.emp_other_file_no , NEW.emp_other_file_no ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_salary_no <=> NEW.emp_salary_no) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_salary_no ", OLD.emp_salary_no , NEW.emp_salary_no ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_barcode_no <=> NEW.emp_barcode_no) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_barcode_no ", OLD.emp_barcode_no , NEW.emp_barcode_no ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_public_app_date <=> NEW.emp_public_app_date) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_public_app_date ", OLD.emp_public_app_date , NEW.emp_public_app_date ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_public_com_date <=> NEW.emp_public_com_date) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_public_com_date ", OLD.emp_public_com_date , NEW.emp_public_com_date ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_app_date <=> NEW.emp_app_date) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_app_date ", OLD.emp_app_date , NEW.emp_app_date ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_com_date <=> NEW.emp_com_date) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_com_date ", OLD.emp_com_date , NEW.emp_com_date ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_rec_method <=> NEW.emp_rec_method) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_rec_method ", OLD.emp_rec_method , NEW.emp_rec_method ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_rec_method_desc <=> NEW.emp_rec_method_desc) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_rec_method_desc ", OLD.emp_rec_method_desc , NEW.emp_rec_method_desc,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_rec_method_desc_si <=> NEW.emp_rec_method_desc_si) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_rec_method_desc_si ", OLD.emp_rec_method_desc_si , NEW.emp_rec_method_desc_si ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_rec_method_desc_ta <=> NEW.emp_rec_method_desc_ta) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_rec_method_desc_ta ", OLD.emp_rec_method_desc_ta , NEW.emp_rec_method_desc_ta ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_rec_medium <=> NEW.emp_rec_medium) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_rec_medium ", OLD.emp_rec_medium , NEW.emp_rec_medium ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_active_hrm_flg <=> NEW.emp_active_hrm_flg) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_active_hrm_flg ", OLD.emp_active_hrm_flg , NEW.emp_active_hrm_flg ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_active_att_flg <=> NEW.emp_active_att_flg) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_active_att_flg ", OLD.emp_active_att_flg , NEW.emp_active_att_flg ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_wop_flg <=> NEW.emp_wop_flg) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_wop_flg ", OLD.emp_wop_flg , NEW.emp_wop_flg ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_wop_no <=> NEW.emp_wop_no) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_wop_no ", OLD.emp_wop_no , NEW.emp_wop_no ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_confirm_flg <=> NEW.emp_confirm_flg) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_confirm_flg ", OLD.emp_confirm_flg , NEW.emp_confirm_flg ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_confirm_date <=> NEW.emp_confirm_date) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_confirm_date, "emp_confirm_date ", OLD.emp_confirm_date , NEW.emp_confirm_date ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_prob_ext_flg <=> NEW.emp_prob_ext_flg) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_prob_ext_flg ", OLD.emp_prob_ext_flg , NEW.emp_prob_ext_flg ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_prob_from_date <=> NEW.emp_prob_from_date) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_prob_from_date ", OLD.emp_prob_from_date , NEW.emp_prob_from_date ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_prob_to_date <=> NEW.emp_prob_to_date) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_prob_to_date ", OLD.emp_prob_to_date , NEW.emp_prob_to_date ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.class_code <=> NEW.class_code) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "class_code ", OLD.class_code , NEW.class_code ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_salary_scale <=> NEW.emp_salary_scale) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_salary_scale ", OLD.emp_salary_scale , NEW.emp_salary_scale ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_salary_scale_si <=> NEW.emp_salary_scale_si) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_salary_scale_si ", OLD.emp_salary_scale_si , NEW.emp_salary_scale_si ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_salary_scale_ta <=> NEW.emp_salary_scale_ta) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_salary_scale_ta ", OLD.emp_salary_scale_ta , NEW.emp_salary_scale_ta ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_basic_salary <=> NEW.emp_basic_salary) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_basic_salary ", OLD.emp_basic_salary , NEW.emp_basic_salary ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_salary_inc_date <=> NEW.emp_salary_inc_date) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_salary_inc_date ", OLD.emp_salary_inc_date , NEW.emp_salary_inc_date ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_display_name <=> NEW.emp_display_name) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_display_name ", OLD.emp_display_name , NEW.emp_display_name ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_display_name_si <=> NEW.emp_display_name_si) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_display_name_si ", OLD.emp_display_name_si , NEW.emp_display_name_si ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_display_name_ta <=> NEW.emp_display_name_ta) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_display_name_ta ", OLD.emp_display_name_ta , NEW.emp_display_name_ta ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.emp_pension_no <=> NEW.emp_pension_no) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "emp_pension_no ", OLD.emp_pension_no, NEW.emp_pension_no ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.hie_code_1 <=> NEW.hie_code_1) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "hie_code_1 ", OLD.hie_code_1 , NEW.hie_code_1 ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.hie_code_2 <=> NEW.hie_code_2) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "hie_code_2 ", OLD.hie_code_2 , NEW.hie_code_2 ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.hie_code_3 <=> NEW.hie_code_3) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "hie_code_3 ", OLD.hie_code_3 , NEW.hie_code_3 ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.hie_code_4 <=> NEW.hie_code_4) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "hie_code_4", OLD.hie_code_4 , NEW.hie_code_4 ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.hie_code_5 <=> NEW.hie_code_5) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "hie_code_5 ", OLD.hie_code_5 , NEW.hie_code_5 ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.hie_code_6 <=> NEW.hie_code_6) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "hie_code_6 ", OLD.hie_code_6 , NEW.hie_code_6 ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.hie_code_7 <=> NEW.hie_code_7) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "hie_code_7 ", OLD.hie_code_7 , NEW.hie_code_7 ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.hie_code_8 <=> NEW.hie_code_8) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "hie_code_8 ", OLD.hie_code_8 , NEW.hie_code_8 ,NOW(),@user,"record updated"); END IF;
IF NOT( OLD.hie_code_9 <=> NEW.hie_code_9) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "hie_code_9 ", OLD.hie_code_9 , NEW.hie_code_9, NOW(),@user,"record updated"); END IF;
IF NOT( OLD.hie_code_10 <=> NEW.hie_code_10) THEN INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, "hie_code_10 ", OLD.hie_code_10 , NEW.hie_code_10 ,NOW(),@user,"record updated"); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER emp_delete BEFORE Delete ON hs_hr_employee FOR EACH ROW BEGIN
INSERT INTO hs_hr_audit (audit_table_name, audit_row_pk, audit_field_name, audit_old_value, audit_new_value,audit_datetime,audit_user,audit_description) VALUES ( "hs_hr_employee", OLD.emp_number, null, null, null,NOW(),@user,"record deleted");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hs_hr_empstat`
--

DROP TABLE IF EXISTS `hs_hr_empstat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_empstat` (
  `estat_code` varchar(13) NOT NULL,
  `estat_name` varchar(100) DEFAULT NULL,
  `estat_name_si` varchar(100) DEFAULT NULL,
  `estat_name_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`estat_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_empstat`
--

LOCK TABLES `hs_hr_empstat` WRITE;
/*!40000 ALTER TABLE `hs_hr_empstat` DISABLE KEYS */;
INSERT INTO `hs_hr_empstat` VALUES ('EST000','Terminated','‡∂â‡∑Ä‡∂≠‡∑ä‡∂ö‡∂Ω','‡Æ®‡Æö‡Æ±‡Æô‡Æ®‡Æö'),('EST001','Full Time Contract','‡∑É‡∑ê‡∂∏‡∂Ø‡∑è ‡∂ö‡∑ú‡∂±‡∑ä‡∂≠‡∑ä‚Äç‡∂ª‡∑è‡∂≠‡∑ä','‡Æ±‡Æ®‡Æô‡Æö'),('EST002','Full Time Internship','‡∑É‡∑ê‡∂∏‡∂Ø‡∑è ‡∂Ö‡∂∑‡∑ä‚Äç‡∂∫‡∂±‡∑ä‡∂≠‡∂ª ‡∂ö‡∑è‡∂†‡∂∫',NULL),('EST003','Full Time Permanent','‡∑É‡∑ê‡∂∏‡∂Ø‡∑è ‡∑É‡∑ä‡∂Æ‡∑í‡∂ª',NULL),('EST004','Part Time Contract','‡∂Ö‡∂© ‡∂ö‡∑è‡∂Ω ‡∂ö‡∑ú‡∂±‡∑ä‡∂≠‡∑ä‚Äç‡∂ª‡∑è‡∂≠‡∑ä',NULL),('EST005','Part Time Internship','‡∂Ö‡∂© ‡∂ö‡∑è‡∂Ω ‡∂Ö‡∂∑‡∑ä‚Äç‡∂∫‡∂±‡∑ä‡∂≠‡∂ª ‡∂ö‡∑è‡∂†‡∂∫',NULL),('EST006','Part Time Permanent','‡∂Ö‡∂© ‡∂ö‡∑è‡∂Ω ‡∑É‡∑ä‡∂Æ‡∑í‡∂ª',NULL);
/*!40000 ALTER TABLE `hs_hr_empstat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_ethnic_race`
--

DROP TABLE IF EXISTS `hs_hr_ethnic_race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_ethnic_race` (
  `ethnic_race_code` varchar(13) NOT NULL,
  `ethnic_race_desc` varchar(50) DEFAULT NULL,
  `ethnic_race_desc_si` varchar(50) DEFAULT NULL,
  `ethnic_race_desc_ta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ethnic_race_code`),
  UNIQUE KEY `ethnic_race_desc_ta` (`ethnic_race_desc_ta`),
  UNIQUE KEY `ethnic_race_desc_si` (`ethnic_race_desc_si`),
  UNIQUE KEY `ethnic_race_desc` (`ethnic_race_desc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_ethnic_race`
--

LOCK TABLES `hs_hr_ethnic_race` WRITE;
/*!40000 ALTER TABLE `hs_hr_ethnic_race` DISABLE KEYS */;
INSERT INTO `hs_hr_ethnic_race` VALUES ('ETH1','Sinhala','‡∑É‡∑í‡∂Ç‡∑Ñ‡∂Ω','twert'),('ETH2','Sri Lankan Tamil','‡∑Å‡∑ä‚Äç‡∂ª‡∑ì ‡∂Ω‡∂Ç‡∂ö‡∑è ‡∂Ø‡∑ô‡∂∏‡∂Ω','twefrta'),('ETH3','Indian Tamil','‡∂â‡∂±‡∑ä‡∂Ø‡∑í‡∂∫‡∂±‡∑ä ‡∂Ø‡∑ô‡∂∏‡∂Ω','twegrta'),('ETH4','Sri Lankan Moor','‡∑Å‡∑ä‚Äç‡∂ª‡∑ì ‡∂Ω‡∂Ç‡∂ö‡∑è ‡∂∏‡∂ª‡∂ö‡∑ä‡∂ö','twehhrta'),('ETH5','Burgher','‡∂Ω‡∂±‡∑ä‡∑É‡∑í‡∂¢‡∑è‡∂≠‡∑í‡∂ö‡∂∫‡∑è','twedfrta'),('ETH6','Malay','‡∂∏‡∑ê‡∂Ω‡∑ö','twfferrta'),('ETH7','Other','‡∑Ä‡∑ô‡∂±‡∂≠‡∑ä','tweghrta');
/*!40000 ALTER TABLE `hs_hr_ethnic_race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_formlock_details`
--

DROP TABLE IF EXISTS `hs_hr_formlock_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_formlock_details` (
  `frmlock_id` int(255) NOT NULL AUTO_INCREMENT,
  `mod_id` varchar(36) NOT NULL,
  `con_table_name` varchar(200) NOT NULL,
  `con_activity_id` int(4) NOT NULL,
  `frmlock_form_name` varchar(200) DEFAULT NULL,
  `frmlock_form_name_si` varchar(200) DEFAULT NULL,
  `frmlock_form_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`frmlock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_formlock_details`
--

LOCK TABLES `hs_hr_formlock_details` WRITE;
/*!40000 ALTER TABLE `hs_hr_formlock_details` DISABLE KEYS */;
INSERT INTO `hs_hr_formlock_details` VALUES (1,'MOD001','hs_hr_compstructtree',1,'CompanyStructure',NULL,NULL),(2,'MOD001','hs_hr_compstructtree',1,'Organization Structure',NULL,NULL),(3,'MOD001','hs_hr_job_title',1,'Job Title',NULL,NULL),(4,'MOD001','hs_hr_education',1,'Education Admin',NULL,NULL),(5,'MOD001','hs_hr_skill',1,'Skills',NULL,NULL),(6,'MOD001','hs_hr_language',1,'Language',NULL,NULL),(7,'MOD001','hs_hr_service',1,'Services',NULL,NULL),(8,'MOD001','hs_hr_grade',1,'Grade',NULL,NULL),(9,'MOD001','hs_hr_class',1,'Classes',NULL,NULL),(10,'MOD002','hs_hr_employee',1,'Personal Details',NULL,NULL),(11,'MOD002','hs_hr_emp_contact',1,'Contact Details',NULL,NULL),(12,'MOD002','hs_hr_emp_emergency_contacts',1,'Emergency Contacts',NULL,NULL),(13,'MOD002','hs_hr_emp_dependents',1,'Dependents',NULL,NULL),(14,'MOD002','hs_hr_emp_picture',1,'Photograph',NULL,NULL),(15,'MOD002','hs_hr_employee',5,'Job',NULL,NULL),(16,'MOD002','hs_hr_emp_reportto',1,'Report To',NULL,NULL),(17,'MOD002','hs_hr_emp_work_experience',1,'Work Experience',NULL,NULL),(18,'MOD002','hs_hr_emp_education',1,'Education',NULL,NULL),(19,'MOD002','Skills',1,'CompanyStructure',NULL,NULL),(20,'MOD002','hs_hr_emp_language',1,'Languages',NULL,NULL),(21,'MOD002','hs_hr_emp_licenses',1,'License',NULL,NULL),(22,'MOD002','hs_hr_ebexam',1,'EB Exams',NULL,NULL),(23,'MOD002','hs_hr_emp_attachment',1,'Attachments',NULL,NULL),(24,'MOD003','hs_hr_wbm_benifit_type',1,'Edit Benefit Type',NULL,NULL),(25,'MOD003','hs_hr_wbm_benifit_sub_type',1,'Edit Benefit',NULL,NULL),(26,'MOD003','hs_hr_wbm_benifit',1,'Edit Benefit Disbursement',NULL,NULL),(27,'MOD004','hs_hr_dis_action_type',1,'New Disciplinary Action Type Define',NULL,NULL),(28,'MOD004','hs_hr_dis_offence',1,'Update Offence',NULL,NULL),(29,'MOD004','hs_hr_dis_incidents',1,'preliminary investigation ',NULL,NULL),(30,'MOD005','hs_hr_td_institute',1,'Update Institute Name',NULL,NULL),(31,'MOD005','hs_hr_td_course',1,'Training List',NULL,NULL),(33,'MOD005','hs_hr_td_assignlist',1,'Training',NULL,NULL),(34,'MOD005','hs_hr_td_assignlist',2,'Training',NULL,NULL),(35,'MOD005','hs_hr_td_assignlist',3,'Training Approval',NULL,NULL),(36,'MOD005','hs_hr_td_assignlist',4,'Training Participation',NULL,NULL),(37,'MOD005','hs_hr_td_assignlist',5,'Training Record',NULL,NULL),(38,'MOD006','hs_hr_promotion_method',1,'Edit Promotion Method',NULL,NULL),(39,'MOD006','hs_hr_promotion',1,'Edit Promotion',NULL,NULL),(40,'MOD006','hs_hr_promotion_ckecklist',1,'Edit Promotion Check List',NULL,NULL),(41,'MOD006','hs_hr_ckecklist_detail',1,'Check List',NULL,NULL),(42,'MOD007','hs_hr_ret_retirement',1,'Service Extension',NULL,NULL),(43,'MOD008','hs_hr_atn_day',1,'Define Day Types',NULL,NULL),(44,'MOD008','hs_hr_atn_dailyattendance',1,'Employee Attendance Summary',NULL,NULL),(45,'MOD009','hs_hr_knw_doctype',1,'Edit Document Type',NULL,NULL),(46,'MOD009','hs_hr_knw_attach_details',1,'Edit Attachment Documents',NULL,NULL),(47,'MOD010','hs_hr_trans_reason',1,'Update Transfer Reason',NULL,NULL),(48,'MOD010','hs_hr_transfer',1,'Update Transfer',NULL,NULL),(49,'MOD010','hs_hr_transfer_request',1,'Update Transfer Request',NULL,NULL),(50,'MOD011','hs_hr_emp_quicklink',1,'Edit Personal Files/Documents',NULL,NULL),(51,'MOD012','hs_hr_leave_type',1,'Edit Leave Type',NULL,NULL),(52,'MOD012','hs_hr_leave_holiday',1,'Edit HolyDay',NULL,NULL),(53,'MOD012','hs_hr_leave_type_config',1,'Leave Configuration',NULL,NULL),(54,'MOD012','hs_hr_leave_entitlement',1,'Edit Leave Entitlement',NULL,NULL),(55,'MOD012','hs_hr_leave_application',1,'Apply Leave',NULL,NULL),(56,'MOD013','hs_hr_users',2,'Users',NULL,NULL),(57,'MOD013','hs_hr_sm_capability',1,'Capability',NULL,NULL),(58,'MOD013','hs_hr_sm_mnucapability',1,'Menu Capabilities',NULL,NULL),(59,'MOD013','hs_hr_users',1,'Employee Capabilities',NULL,NULL),(60,'MOD001','hs_hr_carderplan',1,'Carder Plan',NULL,NULL),(61,'MOD002','hs_hr_emp_disciaction',1,'Disciplinary Action',NULL,NULL),(62,'MOD004','hs_hr_dis_incidents',2,'Inquery Summary',NULL,NULL),(63,'MOD005','hs_hr_td_tarining_plan',1,'Training Plan',NULL,NULL),(64,'MOD002','hs_hr_emp_ebexam',1,'Eb Exam',NULL,NULL),(65,'MOD013','hs_hr_sm_rpt_capability',1,'Report Capabilities',NULL,NULL),(66,'MOD008','hs_hr_atn_fieldformat',1,'Attendance Download Configuration',NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_formlock_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_gender`
--

DROP TABLE IF EXISTS `hs_hr_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_gender` (
  `gender_code` int(2) NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(30) NOT NULL,
  `gender_name_si` varchar(30) DEFAULT NULL,
  `gender_name_ta` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`gender_code`),
  UNIQUE KEY `gender_name` (`gender_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_gender`
--

LOCK TABLES `hs_hr_gender` WRITE;
/*!40000 ALTER TABLE `hs_hr_gender` DISABLE KEYS */;
INSERT INTO `hs_hr_gender` VALUES (1,'Male','‡∂¥‡∑î‡∂ª‡∑î‡∑Ç','mt'),(2,'Female','‡∂ú‡∑ê‡∑Ñ‡∑ê‡∂´‡∑î','fg'),(3,'Other','‡∑Ä‡∑ô‡∂±‡∂≠‡∑ä','mts');
/*!40000 ALTER TABLE `hs_hr_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_geninfo`
--

DROP TABLE IF EXISTS `hs_hr_geninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_geninfo` (
  `code` varchar(13) NOT NULL,
  `geninfo_keys` varchar(200) DEFAULT NULL,
  `geninfo_values` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_geninfo`
--

LOCK TABLES `hs_hr_geninfo` WRITE;
/*!40000 ALTER TABLE `hs_hr_geninfo` DISABLE KEYS */;
INSERT INTO `hs_hr_geninfo` VALUES ('001','','Test|LK');
/*!40000 ALTER TABLE `hs_hr_geninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_grade`
--

DROP TABLE IF EXISTS `hs_hr_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_grade` (
  `grade_code` int(4) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(100) NOT NULL,
  `grade_name_si` varchar(100) DEFAULT NULL,
  `grade_name_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`grade_code`),
  UNIQUE KEY `grade_name` (`grade_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_grade`
--

LOCK TABLES `hs_hr_grade` WRITE;
/*!40000 ALTER TABLE `hs_hr_grade` DISABLE KEYS */;
INSERT INTO `hs_hr_grade` VALUES (1,'Grade','','');
/*!40000 ALTER TABLE `hs_hr_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_grade_slot`
--

DROP TABLE IF EXISTS `hs_hr_grade_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_grade_slot` (
  `slt_id` int(10) NOT NULL AUTO_INCREMENT,
  `grade_code` int(4) NOT NULL,
  `slt_scale_year` int(10) DEFAULT NULL,
  `slt_amount` float(13,2) DEFAULT NULL,
  `emp_basic_salary` float(13,2) DEFAULT NULL,
  PRIMARY KEY (`slt_id`),
  KEY `hs_hr_grade_slot_grade_code` (`grade_code`),
  CONSTRAINT `hs_hr_grade_slot_grade_code` FOREIGN KEY (`grade_code`) REFERENCES `hs_hr_grade` (`grade_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_grade_slot`
--

LOCK TABLES `hs_hr_grade_slot` WRITE;
/*!40000 ALTER TABLE `hs_hr_grade_slot` DISABLE KEYS */;
INSERT INTO `hs_hr_grade_slot` VALUES (1,1,0,0.00,10000.00),(2,1,1,1000.00,11000.00);
/*!40000 ALTER TABLE `hs_hr_grade_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_job_application_events`
--

DROP TABLE IF EXISTS `hs_hr_job_application_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_job_application_events` (
  `id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `owner` int(7) DEFAULT NULL,
  `event_time` datetime DEFAULT NULL,
  `event_type` smallint(2) DEFAULT NULL,
  `status` smallint(2) DEFAULT '0',
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `xif1hs_hr_job_application_events` (`application_id`),
  KEY `xif2hs_hr_job_application_events` (`created_by`),
  KEY `xif3hs_hr_job_application_events` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_job_application_events`
--

LOCK TABLES `hs_hr_job_application_events` WRITE;
/*!40000 ALTER TABLE `hs_hr_job_application_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_job_application_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_job_spec`
--

DROP TABLE IF EXISTS `hs_hr_job_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_job_spec` (
  `jobspec_id` int(11) NOT NULL DEFAULT '0',
  `jobspec_name` varchar(50) DEFAULT NULL,
  `jobspec_desc` text,
  `jobspec_duties` text,
  PRIMARY KEY (`jobspec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_job_spec`
--

LOCK TABLES `hs_hr_job_spec` WRITE;
/*!40000 ALTER TABLE `hs_hr_job_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_job_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_job_title`
--

DROP TABLE IF EXISTS `hs_hr_job_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_job_title` (
  `jobtit_code` varchar(13) NOT NULL,
  `jobtit_name` varchar(100) DEFAULT NULL,
  `jobtit_name_si` varchar(100) DEFAULT NULL,
  `jobtit_name_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`jobtit_code`),
  UNIQUE KEY `jobtit_name_ta` (`jobtit_name_ta`),
  UNIQUE KEY `jobtit_name_si` (`jobtit_name_si`),
  UNIQUE KEY `jobtit_name` (`jobtit_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_job_title`
--

LOCK TABLES `hs_hr_job_title` WRITE;
/*!40000 ALTER TABLE `hs_hr_job_title` DISABLE KEYS */;
INSERT INTO `hs_hr_job_title` VALUES ('JOB001','Designation',NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_job_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_job_vacancy`
--

DROP TABLE IF EXISTS `hs_hr_job_vacancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_job_vacancy` (
  `vacancy_id` int(11) NOT NULL,
  `jobtit_code` varchar(13) DEFAULT NULL,
  `manager_id` int(7) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`vacancy_id`),
  KEY `xif1hs_hr_job_vacancy` (`jobtit_code`),
  KEY `xif2hs_hr_job_vacancy` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_job_vacancy`
--

LOCK TABLES `hs_hr_job_vacancy` WRITE;
/*!40000 ALTER TABLE `hs_hr_job_vacancy` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_job_vacancy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_jobtit_empstat`
--

DROP TABLE IF EXISTS `hs_hr_jobtit_empstat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_jobtit_empstat` (
  `jobtit_code` varchar(13) NOT NULL,
  `estat_code` varchar(13) NOT NULL,
  PRIMARY KEY (`jobtit_code`,`estat_code`),
  KEY `xif1hs_hr_jobtit_empstat` (`jobtit_code`),
  KEY `xif2hs_hr_jobtit_empstat` (`estat_code`),
  CONSTRAINT `hs_hr_jobtit_empstat_ibfk_1` FOREIGN KEY (`jobtit_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`) ON DELETE CASCADE,
  CONSTRAINT `hs_hr_jobtit_empstat_ibfk_2` FOREIGN KEY (`estat_code`) REFERENCES `hs_hr_empstat` (`estat_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_jobtit_empstat`
--

LOCK TABLES `hs_hr_jobtit_empstat` WRITE;
/*!40000 ALTER TABLE `hs_hr_jobtit_empstat` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_jobtit_empstat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_knw_attach_details`
--

DROP TABLE IF EXISTS `hs_hr_knw_attach_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_knw_attach_details` (
  `knw_atd_id` int(20) NOT NULL AUTO_INCREMENT,
  `knw_doc_id` int(20) NOT NULL,
  `knw_atd_title` varchar(100) DEFAULT NULL,
  `knw_atd_title_si` varchar(100) DEFAULT NULL,
  `knw_atd_title_ta` varchar(100) DEFAULT NULL,
  `knw_atd_keyword` varchar(1000) DEFAULT NULL,
  `knw_atd_keyword_si` varchar(1000) DEFAULT NULL,
  `knw_atd_keyword_ta` varchar(1000) DEFAULT NULL,
  `knw_atd_post_date` date DEFAULT NULL,
  `knw_atd_update_date` date DEFAULT NULL,
  PRIMARY KEY (`knw_atd_id`,`knw_doc_id`),
  UNIQUE KEY `knw_atd_title_ta` (`knw_atd_title_ta`),
  UNIQUE KEY `knw_atd_title_si` (`knw_atd_title_si`),
  UNIQUE KEY `knw_atd_title` (`knw_atd_title`),
  KEY `xif1hs_hr_knw_attach_details` (`knw_doc_id`),
  CONSTRAINT `hs_hr_knw_attach_details_ibfk_1` FOREIGN KEY (`knw_doc_id`) REFERENCES `hs_hr_knw_doctype` (`knw_doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_knw_attach_details`
--

LOCK TABLES `hs_hr_knw_attach_details` WRITE;
/*!40000 ALTER TABLE `hs_hr_knw_attach_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_knw_attach_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_knw_attachment`
--

DROP TABLE IF EXISTS `hs_hr_knw_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_knw_attachment` (
  `knw_atd_id` int(20) NOT NULL,
  `knw_doc_id` int(20) NOT NULL,
  `knw_att_filename` varchar(200) DEFAULT NULL,
  `knw_att_type` varchar(100) DEFAULT NULL,
  `knw_att_size` int(11) DEFAULT NULL,
  `knw_att_attachment` mediumblob,
  `knw_att_article` mediumblob,
  PRIMARY KEY (`knw_atd_id`),
  KEY `xif1hs_hr_knw_attachment` (`knw_atd_id`),
  CONSTRAINT `hs_hr_knw_attachment_ibfk_1` FOREIGN KEY (`knw_atd_id`) REFERENCES `hs_hr_knw_attach_details` (`knw_atd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_knw_attachment`
--

LOCK TABLES `hs_hr_knw_attachment` WRITE;
/*!40000 ALTER TABLE `hs_hr_knw_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_knw_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_knw_doctype`
--

DROP TABLE IF EXISTS `hs_hr_knw_doctype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_knw_doctype` (
  `knw_doc_id` int(20) NOT NULL AUTO_INCREMENT,
  `knw_doc_name` varchar(200) NOT NULL,
  `knw_doc_name_si` varchar(200) DEFAULT NULL,
  `knw_doc_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`knw_doc_id`),
  UNIQUE KEY `knw_doc_name` (`knw_doc_name`),
  UNIQUE KEY `knw_doc_name_ta` (`knw_doc_name_ta`),
  UNIQUE KEY `knw_doc_name_si` (`knw_doc_name_si`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_knw_doctype`
--

LOCK TABLES `hs_hr_knw_doctype` WRITE;
/*!40000 ALTER TABLE `hs_hr_knw_doctype` DISABLE KEYS */;
INSERT INTO `hs_hr_knw_doctype` VALUES (1,'Article','‡∂Ω‡∑í‡∂¥‡∑í‡∂∫','Article');
/*!40000 ALTER TABLE `hs_hr_knw_doctype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_language`
--

DROP TABLE IF EXISTS `hs_hr_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_language` (
  `lang_code` varchar(13) NOT NULL,
  `lang_name` varchar(120) DEFAULT NULL,
  `lang_name_si` varchar(120) DEFAULT NULL,
  `lang_name_ta` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`lang_code`),
  UNIQUE KEY `lang_name_ta` (`lang_name_ta`),
  UNIQUE KEY `lang_name_si` (`lang_name_si`),
  UNIQUE KEY `lang_name` (`lang_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_language`
--

LOCK TABLES `hs_hr_language` WRITE;
/*!40000 ALTER TABLE `hs_hr_language` DISABLE KEYS */;
INSERT INTO `hs_hr_language` VALUES ('LAN001','English','‡∂â‡∂Ç‡∂ú‡∑í‡∂ª‡∑í‡∑É‡∑í','‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï'),('LAN002','Sinhala','‡∑É‡∑í‡∂Ç‡∑Ñ‡∂Ω','‡Æ™‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï‡Æï'),('LAN003','Tamil','‡∂Ø‡∑ô‡∂∏‡∑Ö','‡Æô‡Æô‡Æô‡Æô‡Æô‡Æô‡Æô‡Æô‡Æô');
/*!40000 ALTER TABLE `hs_hr_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_leave_application`
--

DROP TABLE IF EXISTS `hs_hr_leave_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_leave_application` (
  `leave_app_id` int(20) NOT NULL AUTO_INCREMENT,
  `leave_app_applied_date` date DEFAULT NULL,
  `emp_number` int(7) DEFAULT NULL,
  `leave_app_start_date` date DEFAULT NULL,
  `leave_app_end_date` date DEFAULT NULL,
  `leave_app_status` varchar(1) DEFAULT NULL,
  `leave_type_id` int(4) DEFAULT NULL,
  `leave_app_reason` int(4) DEFAULT NULL,
  `leave_app_comment` varchar(200) DEFAULT NULL,
  `leave_app_covemp_number` int(7) DEFAULT NULL,
  `leave_type_wf_id` varchar(200) DEFAULT NULL,
  `leave_app_workdays` float DEFAULT NULL,
  PRIMARY KEY (`leave_app_id`),
  KEY `xif1hs_hr_leave_application` (`emp_number`),
  KEY `xif2hs_hr_leave_application` (`leave_app_covemp_number`),
  KEY `xif3hs_hr_leave_application` (`leave_type_id`),
  KEY `xif4hs_hr_leave_application` (`leave_type_wf_id`),
  CONSTRAINT `hs_hr_leave_application_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_leave_application_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `hs_hr_leave_type` (`leave_type_id`),
  CONSTRAINT `hs_hr_leave_application_ibfk_3` FOREIGN KEY (`leave_app_covemp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_leave_application_ibfk_4` FOREIGN KEY (`leave_type_wf_id`) REFERENCES `hs_hr_leave_type_config` (`leave_type_wf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_leave_application`
--

LOCK TABLES `hs_hr_leave_application` WRITE;
/*!40000 ALTER TABLE `hs_hr_leave_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_leave_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_leave_details`
--

DROP TABLE IF EXISTS `hs_hr_leave_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_leave_details` (
  `leave_app_id` int(20) NOT NULL,
  `leave_app_applied_date` date NOT NULL DEFAULT '0000-00-00',
  `leave_dtl_amount` float DEFAULT NULL,
  `leave_dtl_type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`leave_app_id`,`leave_app_applied_date`),
  CONSTRAINT `hs_hr_leave_details_ibfk_1` FOREIGN KEY (`leave_app_id`) REFERENCES `hs_hr_leave_application` (`leave_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_leave_details`
--

LOCK TABLES `hs_hr_leave_details` WRITE;
/*!40000 ALTER TABLE `hs_hr_leave_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_leave_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_leave_entitlement`
--

DROP TABLE IF EXISTS `hs_hr_leave_entitlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_leave_entitlement` (
  `emp_number` int(7) NOT NULL,
  `leave_type_id` int(4) NOT NULL DEFAULT '0',
  `leave_ent_day` float DEFAULT NULL,
  `leave_ent_taken` float DEFAULT NULL,
  `leave_ent_sheduled` float DEFAULT NULL,
  `leave_ent_remain` float DEFAULT NULL,
  `leave_ent_year` varchar(4) NOT NULL,
  PRIMARY KEY (`emp_number`,`leave_type_id`,`leave_ent_year`),
  KEY `xif1hs_hr_leave_entitlement` (`leave_type_id`),
  KEY `xif2hs_hr_leave_entitlement` (`emp_number`),
  CONSTRAINT `hs_hr_leave_entitlement_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_leave_entitlement_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `hs_hr_leave_type` (`leave_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_leave_entitlement`
--

LOCK TABLES `hs_hr_leave_entitlement` WRITE;
/*!40000 ALTER TABLE `hs_hr_leave_entitlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_leave_entitlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_leave_holiday`
--

DROP TABLE IF EXISTS `hs_hr_leave_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_leave_holiday` (
  `leave_holiday_id` int(4) NOT NULL AUTO_INCREMENT,
  `leave_holiday_name` varchar(200) DEFAULT NULL,
  `leave_holiday_name_si` varchar(200) DEFAULT NULL,
  `leave_holiday_name_ta` varchar(200) DEFAULT NULL,
  `leave_holiday_date` date DEFAULT NULL,
  `leave_holiday_annual` int(1) DEFAULT NULL,
  `leave_holiday_fulorhalf` int(1) DEFAULT NULL,
  PRIMARY KEY (`leave_holiday_id`),
  UNIQUE KEY `leave_holiday_name_ta` (`leave_holiday_name_ta`),
  UNIQUE KEY `leave_holiday_name_si` (`leave_holiday_name_si`),
  UNIQUE KEY `leave_holiday_name` (`leave_holiday_name`),
  UNIQUE KEY `leave_holiday_date` (`leave_holiday_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_leave_holiday`
--

LOCK TABLES `hs_hr_leave_holiday` WRITE;
/*!40000 ALTER TABLE `hs_hr_leave_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_leave_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_leave_type`
--

DROP TABLE IF EXISTS `hs_hr_leave_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_leave_type` (
  `leave_type_id` int(4) NOT NULL AUTO_INCREMENT,
  `leave_type_name` varchar(200) DEFAULT NULL,
  `leave_type_name_si` varchar(200) DEFAULT NULL,
  `leave_type_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`leave_type_id`),
  UNIQUE KEY `leave_type_name_ta` (`leave_type_name_ta`),
  UNIQUE KEY `leave_type_name_si` (`leave_type_name_si`),
  UNIQUE KEY `leave_type_name` (`leave_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_leave_type`
--

LOCK TABLES `hs_hr_leave_type` WRITE;
/*!40000 ALTER TABLE `hs_hr_leave_type` DISABLE KEYS */;
INSERT INTO `hs_hr_leave_type` VALUES (1,'Annual leave','‡∑Ä‡∑è‡∂ª‡∑ä‡∑Ç‡∑í‡∂ö ‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î','Annual leave_ta'),(2,'Casual leave','‡∑Ñ‡∂Ø‡∑í‡∑É‡∑í ‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î','Casual leave _TA'),(3,'Maternity leave','‡∂∏‡∑è‡∂≠‡∑ò ‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î','Maternity leave_ta'),(4,'Duty leave','‡∂ª‡∑è‡∂¢‡∂ö‡∑è‡∂ª‡∑í ‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î','Duty leave_ta'),(5,'Foreign leave','‡∑Ä‡∑í‡∂Ø‡∑ö‡∑Å ‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î','Foreign leave_ta'),(6,'Special leave','‡∑Ä‡∑í‡∑Å‡∑ö‡∑Ç ‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î','Special leave_ta'),(7,'Sick leave','‡∂Ω‡∑ô‡∂© ‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î','Sick leave_ta'),(8,'Short leave','‡∂ö‡∑ô‡∂ß‡∑í ‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î','Short leave_ta'),(9,'Half day leave','‡∂ë‡∂ö‡∑ä‡∑Ä‡∂ª‡∑î ‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î','Half day leave_ta');
/*!40000 ALTER TABLE `hs_hr_leave_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_leave_type_config`
--

DROP TABLE IF EXISTS `hs_hr_leave_type_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_leave_type_config` (
  `leave_type_id` int(4) NOT NULL DEFAULT '0',
  `leave_type_description` varchar(200) DEFAULT NULL,
  `leave_type_active_flg` varchar(1) DEFAULT NULL,
  `leave_type_covering_employee_flg` varchar(1) DEFAULT NULL,
  `leave_type_allow_halfday_flg` varchar(1) DEFAULT NULL,
  `leave_type_maternity_leave_flg` varchar(1) DEFAULT NULL,
  `leave_type_need_approval_flg` varchar(1) DEFAULT NULL,
  `leave_type_entitle_days` float DEFAULT NULL,
  `leave_type_max_days_without_medi` float DEFAULT NULL,
  `leave_type_need_to_apply_before` float DEFAULT NULL,
  `leave_type_wf_id` varchar(200) DEFAULT NULL,
  `leave_type_comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`leave_type_id`),
  KEY `xif1hs_hr_leave_type_config` (`leave_type_wf_id`),
  KEY `xif2hs_hr_leave_type_config` (`leave_type_id`),
  CONSTRAINT `hs_hr_leave_type_config_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `hs_hr_leave_type` (`leave_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_leave_type_config`
--

LOCK TABLES `hs_hr_leave_type_config` WRITE;
/*!40000 ALTER TABLE `hs_hr_leave_type_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_leave_type_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_leave_type_config_detail`
--

DROP TABLE IF EXISTS `hs_hr_leave_type_config_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_leave_type_config_detail` (
  `leave_type_id` int(4) NOT NULL DEFAULT '0',
  `estat_code` varchar(13) NOT NULL,
  PRIMARY KEY (`leave_type_id`,`estat_code`),
  KEY `xif1hs_hr_leave_type_config_detail` (`estat_code`),
  KEY `xif2hs_hr_leave_type_config_detail` (`leave_type_id`),
  CONSTRAINT `hs_hr_leave_type_config_detail_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `hs_hr_leave_type_config` (`leave_type_id`),
  CONSTRAINT `hs_hr_leave_type_config_detail_ibfk_2` FOREIGN KEY (`estat_code`) REFERENCES `hs_hr_empstat` (`estat_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_leave_type_config_detail`
--

LOCK TABLES `hs_hr_leave_type_config_detail` WRITE;
/*!40000 ALTER TABLE `hs_hr_leave_type_config_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_leave_type_config_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_level`
--

DROP TABLE IF EXISTS `hs_hr_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_level` (
  `level_code` int(4) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(100) NOT NULL,
  `level_name_si` varchar(100) DEFAULT NULL,
  `level_name_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`level_code`),
  UNIQUE KEY `level_name` (`level_name`),
  UNIQUE KEY `level_name_si` (`level_name_si`),
  UNIQUE KEY `level_name_ta` (`level_name_ta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_level`
--

LOCK TABLES `hs_hr_level` WRITE;
/*!40000 ALTER TABLE `hs_hr_level` DISABLE KEYS */;
INSERT INTO `hs_hr_level` VALUES (1,'Level',NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_licenses`
--

DROP TABLE IF EXISTS `hs_hr_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_licenses` (
  `licenses_code` varchar(13) NOT NULL,
  `licenses_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`licenses_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_licenses`
--

LOCK TABLES `hs_hr_licenses` WRITE;
/*!40000 ALTER TABLE `hs_hr_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_marital_status`
--

DROP TABLE IF EXISTS `hs_hr_marital_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_marital_status` (
  `marst_code` int(2) NOT NULL AUTO_INCREMENT,
  `marst_name` varchar(30) NOT NULL,
  `marst_name_si` varchar(30) DEFAULT NULL,
  `marst_name_ta` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`marst_code`),
  UNIQUE KEY `marst_name` (`marst_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_marital_status`
--

LOCK TABLES `hs_hr_marital_status` WRITE;
/*!40000 ALTER TABLE `hs_hr_marital_status` DISABLE KEYS */;
INSERT INTO `hs_hr_marital_status` VALUES (1,'Single','‡∂Ö‡∑Ä‡∑í‡∑Ä‡∑è‡∑Ñ‡∂ö','‡Øç‡Æïg‡Æø‡Æ®‡Øç‡Æï‡Øç'),(2,'Married Registered','‡∂Ω‡∑ö‡∂õ‡∂±‡∂ú‡∂≠ ‡∑Ä‡∑í‡∑Ä‡∑è‡∑Ñ ‡∑Ä‡∑ñ','‡Øç‡Æï‡Æø‡Æ®y‡Øç‡Æï‡Øç'),(3,'Married Customary','‡∑É‡∑í‡∂ª‡∑í‡∂≠‡∑ä ‡∂¥‡∂ª‡∑í‡∂Ø‡∑í ‡∑Ä‡∑í‡∑Ä‡∑è‡∑Ñ ‡∑Ä‡∑ñ','‡Øç‡Æïy‡Æø‡Æ®‡Øç‡Æï‡Øç'),(4,'Divorced','‡∂Ø‡∑í‡∂ö‡∑ä‡∂ö‡∑É‡∑è‡∂Ø ‡∑Ä‡∑ñ','‡Øç‡Æï‡Æø‡Æ®y‡Øç‡Æï‡Øç'),(5,'Separated','‡∑Ä‡∑ô‡∂±‡∑ä ‡∑Ä‡∑ñ','‡Øç‡Æïg‡Æø‡Æ®‡Øç‡Æï‡Øç'),(6,'Widowed','‡∑Ä‡∑ê‡∂±‡∑ä‡∂Ø‡∂π‡∑î‡∑Ä','‡Øç‡Æïy‡Æø‡Æ®‡Øç‡Æï‡Øç'),(7,'Other','‡∑Ä‡∑ô‡∂±‡∂≠‡∑ä','‡Øç‡Æï‡Æø‡Æ®h‡Øç‡Æï‡Øç');
/*!40000 ALTER TABLE `hs_hr_marital_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_module`
--

DROP TABLE IF EXISTS `hs_hr_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_module` (
  `mod_id` varchar(36) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `module_name_si` varchar(100) DEFAULT NULL,
  `module_name_ta` varchar(100) DEFAULT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `owner_email` varchar(100) DEFAULT NULL,
  `version` varchar(36) DEFAULT NULL,
  `description` text,
  `module_display_order` int(20) DEFAULT NULL,
  PRIMARY KEY (`mod_id`),
  KEY `xif1hs_hr_module` (`version`),
  CONSTRAINT `hs_hr_module_ibfk_1` FOREIGN KEY (`version`) REFERENCES `hs_hr_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_module`
--

LOCK TABLES `hs_hr_module` WRITE;
/*!40000 ALTER TABLE `hs_hr_module` DISABLE KEYS */;
INSERT INTO `hs_hr_module` VALUES ('MOD001','Admin','‡∂¥‡∂ª‡∑í‡∂¥‡∑è‡∂Ω‡∂±','‡Æ≤‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö','OrangeHRM','info@orangehrm.com','VER001','HR Admin',NULL),('MOD002','PIM','‡∂¥‡∑î‡∂Ø‡∑ä‡∂ú‡∂Ω ‡∂≠‡∑ú‡∂ª‡∂≠‡∑î‡∂ª‡∑î  ‡∂ö‡∑Ö‡∂∏‡∂±‡∑è‡∂ö‡∂ª‡∂´‡∂∫','‡Æ∞‡Æ≤‡Æ≤‡Æ≤‡Æ≤‡Æ≤‡Æ≤‡Æ≤‡Æ≤‡Æ≤‡Æ≤‡Æ≤‡Æ≤‡Æ≤‡Æ≤','OrangeHRM','info@orangehrm.com','VER001','HR Functions',NULL),('MOD003','welfare & Benefit','‡∂Ö‡∂ª‡∑ä‡∂Æ‡∑É‡∑è‡∂∞‡∂ö ‡∑Å‡∑î‡∂∑‡∑É‡∑è‡∂∞‡∂ö',NULL,NULL,NULL,'VER001',NULL,3),('MOD004','Disciplinary','‡∑Ä‡∑í‡∂±‡∂∫','‡ÆÆ‡Æ∞‡Æ∞‡Æ∞‡Æ∞‡Æ∞‡Æ∞‡Æ∞‡Æ∞‡Æ∞‡Æ∞‡Æ∞‡Æ∞‡Æ∞‡Æ∞','OrangeHRM','info@orangehrm.com','VER001','Reporting',NULL),('MOD005','Training & Development ','‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î‡∑Ä ‡∑Ñ‡∑è ‡∑É‡∂Ç‡∑Ä‡∂ª‡∑ä‡∂∞‡∂±‡∂∫','‡ÆØ‡ÆÆ‡ÆÆ‡ÆÆ‡ÆÆ‡ÆÆ‡ÆÆ‡ÆÆ‡ÆÆ‡ÆÆ‡ÆÆ‡ÆÆ','OrangeHRM','info@orangehrm.com','VER001','Leave Tracking',NULL),('MOD006','Promotion','‡∂ã‡∑É‡∑É‡∑ä ‡∑Ä‡∑ì‡∂∏','‡Æ≥‡ÆØ‡ÆØ‡ÆØ‡ÆØ‡ÆØ‡ÆØ‡ÆØ‡ÆØ‡ÆØ‡ÆØ‡ÆØ‡ÆØ‡ÆØ','OrangeHRM','info@orangehrm.com','VER001','Time Tracking',NULL),('MOD007','Retirement','‡∑Ä‡∑í‡∑Å‡∑ä‚Äç‡∂ª‡∑è‡∂∏','‡Æ©‡Æ≥‡Æ≥‡Æ≥‡Æ≥‡Æ≥‡Æ≥‡Æ≥‡Æ≥‡Æ≥','OrangeHRM','info@orangehrm.com','VER001','Benefits Tracking',NULL),('MOD008','Attendance','‡∂¥‡∑ê‡∂∏‡∑í‡∂´‡∑ì‡∂∏','‡Æ©‡Æ©‡Æ©‡Æ©‡Æ©‡Æ©‡Æ©‡Æ©‡Æ©‡Æ©‡Æ©‡Æ©','OrangeHRM','info@orangehrm.com','VER001','Recruitment',NULL),('MOD009','Knowledge Base','‡∂Ø‡∑ê‡∂±‡∑î‡∂∏‡∑ä ‡∂¥‡∂Ø‡∑ä‡∂∞‡∂≠‡∑í‡∂∫',NULL,NULL,NULL,NULL,NULL,NULL),('MOD010','Transfer','‡∂∏‡∑è‡∂ª‡∑î‡∑Ä‡∑ì‡∂∏',NULL,NULL,NULL,NULL,NULL,NULL),('MOD011','Personal File','‡∂¥‡∑û‡∂Ø‡∑ä‡∂ú‡∂Ω‡∑í‡∂ö ‡∂ú‡∑ú‡∂±‡∑î‡∑Ä',NULL,NULL,NULL,NULL,NULL,NULL),('MOD012','Leave','‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î','Leave_ta',NULL,NULL,NULL,NULL,NULL),('MOD013','Security','‡∂Ü‡∂ª‡∂ö‡∑Ç‡∂ö ‡∂¥‡∂≥‡∑ä‡∂∞‡∂≠‡∑í‡∂∫',NULL,NULL,NULL,NULL,NULL,NULL),('MOD014','ESS','‡∑É‡∑ö‡∑Ä‡∂ö ‡∑É‡∑ä‡∑Ä‡∂∫‡∂Ç ‡∑É‡∑ö‡∑Ä‡∑è‡∑Ä','ESS_ta','JBL',NULL,NULL,NULL,NULL),('MOD015','Reports','‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è',NULL,NULL,NULL,NULL,NULL,NULL),('MOD016','Performance',' ‡∂ö‡∑è‡∂ª‡∑ä‡∂∫ ‡∑É‡∑è‡∂∞‡∂±‡∂∫ ','Performance ta',NULL,NULL,NULL,NULL,NULL),('MOD017','Work Flow','‡∂ö‡∑è‡∂ª‡∑ä‡∂∫ ‡∑Å‡∑ä‚Äç‡∂ª‡∑í‡∂≠‡∂∫','Work Flow ta',NULL,NULL,NULL,NULL,NULL),('MOD018','Recruitment',' ‡∂Ö‡∂Ω‡∑î‡∂≠‡∑ô‡∂±‡∑ä ‡∂∂‡∂≥‡∑Ä‡∑è ‡∂ú‡∑ê‡∂±‡∑ì‡∂∏‡∑ä ','Recruitment ta',NULL,NULL,NULL,NULL,NULL),('MOD019','Payroll','‡∂¥‡∂©‡∑í‡∂¥‡∂≠ ',' Payroll ta',NULL,NULL,NULL,NULL,NULL),('MOD020','Loan','‡∂´‡∂∫','Loan_ta',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hs_hr_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_nationality`
--

DROP TABLE IF EXISTS `hs_hr_nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_nationality` (
  `nat_code` varchar(13) NOT NULL,
  `nat_name` varchar(120) DEFAULT NULL,
  `nat_name_si` varchar(120) DEFAULT NULL,
  `nat_name_ta` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`nat_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_nationality`
--

LOCK TABLES `hs_hr_nationality` WRITE;
/*!40000 ALTER TABLE `hs_hr_nationality` DISABLE KEYS */;
INSERT INTO `hs_hr_nationality` VALUES ('NAT1','Sri Lankan','‡∂Ω‡∑è‡∂Ç‡∂ö‡∑í‡∂ö','we2w'),('NAT2','Indian','‡∂â‡∂±‡∑ä‡∂Ø‡∑í‡∂∫‡∑è‡∂±‡∑î','wefw'),('NAT3','Australian','‡∂ï‡∑É‡∑ä‡∂ß‡∑ä‚Äç‡∂ª‡∑ö‡∂Ω‡∑í‡∂∫‡∑è‡∂±‡∑î','qwec');
/*!40000 ALTER TABLE `hs_hr_nationality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_notice`
--

DROP TABLE IF EXISTS `hs_hr_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_notice` (
  `notice_code` int(4) NOT NULL AUTO_INCREMENT,
  `notice_name` varchar(50) NOT NULL,
  `notice_name_si` varchar(50) DEFAULT NULL,
  `notice_name_ta` varchar(50) DEFAULT NULL,
  `notice_desc` varchar(250) NOT NULL,
  `notice_desc_si` varchar(250) DEFAULT NULL,
  `notice_desc_ta` varchar(250) DEFAULT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`notice_code`),
  UNIQUE KEY `notice_code` (`notice_code`),
  UNIQUE KEY `notice_name` (`notice_name`),
  UNIQUE KEY `notice_name_si` (`notice_name_si`),
  UNIQUE KEY `notice_name_ta` (`notice_name_ta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_notice`
--

LOCK TABLES `hs_hr_notice` WRITE;
/*!40000 ALTER TABLE `hs_hr_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_other_institute`
--

DROP TABLE IF EXISTS `hs_hr_other_institute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_other_institute` (
  `oth_inst_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `oth_institute_name` varchar(200) DEFAULT NULL,
  `oth_release_location` varchar(200) DEFAULT NULL,
  `oth_release_from` date DEFAULT NULL,
  `oth_release_to` date DEFAULT NULL,
  `oth_payroll_active_flg` int(1) DEFAULT NULL,
  `oth_reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`oth_inst_id`),
  KEY `hs_hr_employee_hs_hr_other_institute` (`emp_number`),
  CONSTRAINT `hs_hr_employee_hs_hr_other_institute` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_other_institute`
--

LOCK TABLES `hs_hr_other_institute` WRITE;
/*!40000 ALTER TABLE `hs_hr_other_institute` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_other_institute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_duty`
--

DROP TABLE IF EXISTS `hs_hr_perf_duty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_duty` (
  `dut_id` int(4) NOT NULL AUTO_INCREMENT,
  `dut_code` varchar(10) DEFAULT NULL,
  `dut_name` varchar(100) DEFAULT NULL,
  `dut_name_si` varchar(100) DEFAULT NULL,
  `dut_name_ta` varchar(100) DEFAULT NULL,
  `dut_desc` varchar(200) DEFAULT NULL,
  `dut_desc_si` varchar(200) DEFAULT NULL,
  `dut_desc_ta` varchar(200) DEFAULT NULL,
  `dtg_id` int(4) DEFAULT NULL,
  `rate_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`dut_id`),
  UNIQUE KEY `dut_name` (`dut_name`),
  UNIQUE KEY `dut_name_si` (`dut_name_si`),
  UNIQUE KEY `dut_name_ta` (`dut_name_ta`),
  UNIQUE KEY `dut_code` (`dut_code`),
  KEY `hs_hr_perf_duty_hs_hr_perf_rate` (`rate_id`),
  KEY `hs_hr_perf_duty_hs_hr_perf_duty_group` (`dtg_id`),
  CONSTRAINT `hs_hr_perf_duty_hs_hr_perf_duty_group` FOREIGN KEY (`dtg_id`) REFERENCES `hs_hr_perf_duty_group` (`dtg_id`),
  CONSTRAINT `hs_hr_perf_duty_hs_hr_perf_rate` FOREIGN KEY (`rate_id`) REFERENCES `hs_hr_perf_rate` (`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_duty`
--

LOCK TABLES `hs_hr_perf_duty` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_duty` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_duty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_duty_group`
--

DROP TABLE IF EXISTS `hs_hr_perf_duty_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_duty_group` (
  `dtg_id` int(4) NOT NULL AUTO_INCREMENT,
  `dtg_code` varchar(10) DEFAULT NULL,
  `dtg_name` varchar(100) DEFAULT NULL,
  `dtg_name_si` varchar(100) DEFAULT NULL,
  `dtg_name_ta` varchar(100) DEFAULT NULL,
  `dtg_desc` varchar(200) DEFAULT NULL,
  `dtg_desc_si` varchar(200) DEFAULT NULL,
  `dtg_desc_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`dtg_id`),
  UNIQUE KEY `dtg_name` (`dtg_name`),
  UNIQUE KEY `dtg_name_si` (`dtg_name_si`),
  UNIQUE KEY `dtg_name_ta` (`dtg_name_ta`),
  UNIQUE KEY `dtg_code` (`dtg_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_duty_group`
--

LOCK TABLES `hs_hr_perf_duty_group` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_duty_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_duty_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_eval_duty`
--

DROP TABLE IF EXISTS `hs_hr_perf_eval_duty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_eval_duty` (
  `eval_dtl_id` int(10) NOT NULL DEFAULT '0',
  `dut_id` int(4) NOT NULL DEFAULT '0',
  `dut_weightage` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`eval_dtl_id`,`dut_id`),
  KEY `hs_hr_perf_duty_hs_hr_perf_evaluation_detail` (`dut_id`),
  CONSTRAINT `hs_hr_emp_job_role_hs_hr_perf_evaluation_detail` FOREIGN KEY (`eval_dtl_id`) REFERENCES `hs_hr_perf_evaluation_detail` (`eval_dtl_id`),
  CONSTRAINT `hs_hr_perf_duty_hs_hr_perf_evaluation_detail` FOREIGN KEY (`dut_id`) REFERENCES `hs_hr_perf_duty` (`dut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_eval_duty`
--

LOCK TABLES `hs_hr_perf_eval_duty` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_eval_duty` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_eval_duty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_eval_employee`
--

DROP TABLE IF EXISTS `hs_hr_perf_eval_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_eval_employee` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eval_id` int(4) NOT NULL DEFAULT '0',
  `eval_dtl_id` int(10) DEFAULT NULL,
  `eval_emp_project_rate` varchar(10) DEFAULT NULL,
  `eval_emp_duty_rate` varchar(10) DEFAULT NULL,
  `eval_emp_duty_comment` varchar(200) DEFAULT NULL,
  `eval_emp_overall_rate` varchar(10) DEFAULT NULL,
  `eval_emp_overall_grade` varchar(10) DEFAULT NULL,
  `eval_emp_overall_comment` varchar(200) DEFAULT NULL,
  `eval_emp_sujested_overall_rate` varchar(10) DEFAULT NULL,
  `eval_emp_sujested_overall_rate_comment` varchar(200) DEFAULT NULL,
  `eval_emp_status` varchar(1) DEFAULT NULL,
  `sup_emp_number` int(7) DEFAULT NULL,
  `eval_type_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`eval_id`),
  KEY `hs_hr_perf_eval_employee_hs_hr_perf_evaluation` (`eval_id`),
  KEY `hs_hr_perf_evaluation_detail_hs_hr_perf_eval_employee` (`eval_dtl_id`),
  KEY `hs_hr_perf_evaluation_type_hs_hr_perf_eval_employee` (`eval_type_id`),
  KEY `sup_emp_number_hs_hr_perf_eval_employee` (`sup_emp_number`),
  CONSTRAINT `hs_hr_employee_hs_hr_perf_eval_employee` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_perf_evaluation_detail_hs_hr_perf_eval_employee` FOREIGN KEY (`eval_dtl_id`) REFERENCES `hs_hr_perf_evaluation_detail` (`eval_dtl_id`),
  CONSTRAINT `hs_hr_perf_evaluation_type_hs_hr_perf_eval_employee` FOREIGN KEY (`eval_type_id`) REFERENCES `hs_hr_perf_evaluation_type` (`eval_type_id`),
  CONSTRAINT `hs_hr_perf_eval_employee_hs_hr_perf_evaluation` FOREIGN KEY (`eval_id`) REFERENCES `hs_hr_perf_evaluation` (`eval_id`),
  CONSTRAINT `sup_emp_number_hs_hr_perf_eval_employee` FOREIGN KEY (`sup_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_eval_employee`
--

LOCK TABLES `hs_hr_perf_eval_employee` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_eval_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_eval_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_eval_employee_duty`
--

DROP TABLE IF EXISTS `hs_hr_perf_eval_employee_duty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_eval_employee_duty` (
  `eval_dtl_id` int(10) DEFAULT NULL,
  `emp_number` int(7) DEFAULT NULL,
  `dut_id` int(4) DEFAULT NULL,
  `eval_duty_rate` varchar(10) DEFAULT NULL,
  `eval_duty_comment` varchar(200) DEFAULT NULL,
  KEY `hs_hr_perf_eval_employee_duty_hs_hr_perf_eval_employee` (`emp_number`),
  KEY `hs_hr_perf_eval_employee_duty_hs_hr_perf_evaluation_detail` (`eval_dtl_id`),
  KEY `hs_hr_perf_duty_hs_hr_perf_evaluation_project` (`dut_id`),
  CONSTRAINT `hs_hr_perf_duty_hs_hr_perf_evaluation_project` FOREIGN KEY (`dut_id`) REFERENCES `hs_hr_perf_duty` (`dut_id`),
  CONSTRAINT `hs_hr_perf_eval_employee_duty_hs_hr_perf_evaluation_detail` FOREIGN KEY (`eval_dtl_id`) REFERENCES `hs_hr_perf_evaluation_detail` (`eval_dtl_id`),
  CONSTRAINT `hs_hr_perf_eval_employee_duty_hs_hr_perf_eval_employee` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_eval_employee_duty`
--

LOCK TABLES `hs_hr_perf_eval_employee_duty` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_eval_employee_duty` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_eval_employee_duty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_eval_employee_project`
--

DROP TABLE IF EXISTS `hs_hr_perf_eval_employee_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_eval_employee_project` (
  `eval_dtl_id` int(10) NOT NULL DEFAULT '0',
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eval_prj_id` int(10) NOT NULL DEFAULT '0',
  `eval_prj_weight` varchar(10) DEFAULT NULL,
  `eval_prj_comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`eval_dtl_id`,`emp_number`,`eval_prj_id`),
  KEY `hs_hr_perf_eval_employee_project_hs_hr_perf_eval_employee` (`emp_number`),
  KEY `hs_hr_perf_eval_employee_project_hs_hr_perf_evaluation_project` (`eval_prj_id`),
  CONSTRAINT `hs_hr_perf_eval_employee_project_hs_hr_perf_evaluation_detail` FOREIGN KEY (`eval_dtl_id`) REFERENCES `hs_hr_perf_evaluation_detail` (`eval_dtl_id`),
  CONSTRAINT `hs_hr_perf_eval_employee_project_hs_hr_perf_evaluation_project` FOREIGN KEY (`eval_prj_id`) REFERENCES `hs_hr_perf_evaluation_project` (`eval_prj_id`),
  CONSTRAINT `hs_hr_perf_eval_employee_project_hs_hr_perf_eval_employee` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_eval_employee_project`
--

LOCK TABLES `hs_hr_perf_eval_employee_project` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_eval_employee_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_eval_employee_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_eval_job_role`
--

DROP TABLE IF EXISTS `hs_hr_perf_eval_job_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_eval_job_role` (
  `eval_dtl_id` int(10) NOT NULL DEFAULT '0',
  `jrl_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eval_dtl_id`,`jrl_id`),
  KEY `hs_hr_perf_eval_job_role_hs_hr_perf_eval_job_role` (`jrl_id`),
  CONSTRAINT `hs_hr_perf_eval_job_role_hs_hr_perf_evaluation_detail` FOREIGN KEY (`eval_dtl_id`) REFERENCES `hs_hr_perf_evaluation_detail` (`eval_dtl_id`),
  CONSTRAINT `hs_hr_perf_eval_job_role_hs_hr_perf_eval_job_role` FOREIGN KEY (`jrl_id`) REFERENCES `hs_hr_emp_job_role` (`jrl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_eval_job_role`
--

LOCK TABLES `hs_hr_perf_eval_job_role` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_eval_job_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_eval_job_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_evaluation`
--

DROP TABLE IF EXISTS `hs_hr_perf_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_evaluation` (
  `eval_id` int(4) NOT NULL AUTO_INCREMENT,
  `eval_code` varchar(10) DEFAULT NULL,
  `eval_name` varchar(100) DEFAULT NULL,
  `eval_name_si` varchar(100) DEFAULT NULL,
  `eval_name_ta` varchar(100) DEFAULT NULL,
  `eval_desc` varchar(200) DEFAULT NULL,
  `eval_desc_si` varchar(200) DEFAULT NULL,
  `eval_desc_ta` varchar(200) DEFAULT NULL,
  `eval_year` varchar(4) DEFAULT NULL,
  `eval_active` varchar(1) DEFAULT NULL,
  `rate_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`eval_id`),
  UNIQUE KEY `eval_name` (`eval_name`),
  UNIQUE KEY `eval_name_si` (`eval_name_si`),
  UNIQUE KEY `eval_name_ta` (`eval_name_ta`),
  UNIQUE KEY `eval_code` (`eval_code`),
  KEY `hs_hr_perf_evaluation_hs_hr_perf_rate` (`rate_id`),
  CONSTRAINT `hs_hr_perf_evaluation_hs_hr_perf_rate` FOREIGN KEY (`rate_id`) REFERENCES `hs_hr_perf_rate` (`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_evaluation`
--

LOCK TABLES `hs_hr_perf_evaluation` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_evaluation_detail`
--

DROP TABLE IF EXISTS `hs_hr_perf_evaluation_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_evaluation_detail` (
  `eval_dtl_id` int(10) NOT NULL AUTO_INCREMENT,
  `eval_id` int(4) DEFAULT NULL,
  `jobtit_code` varchar(13) DEFAULT NULL,
  `level_code` int(4) DEFAULT NULL,
  `service_code` int(4) DEFAULT NULL,
  `eval_dtl_project_percentage` varchar(10) DEFAULT NULL,
  `eval_dtl_duty_percentage` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`eval_dtl_id`),
  KEY `hs_hr_perf_evaluation_detail_hs_hr_perf_evaluation` (`eval_id`),
  KEY `hs_hr_job_title_hs_hr_perf_evaluation` (`jobtit_code`),
  KEY `hs_hr_level_hs_hr_perf_evaluation` (`level_code`),
  KEY `hs_hr_service_hs_hr_perf_evaluation` (`service_code`),
  CONSTRAINT `hs_hr_job_title_hs_hr_perf_evaluation` FOREIGN KEY (`jobtit_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`),
  CONSTRAINT `hs_hr_level_hs_hr_perf_evaluation` FOREIGN KEY (`level_code`) REFERENCES `hs_hr_level` (`level_code`),
  CONSTRAINT `hs_hr_perf_evaluation_detail_hs_hr_perf_evaluation` FOREIGN KEY (`eval_id`) REFERENCES `hs_hr_perf_evaluation` (`eval_id`),
  CONSTRAINT `hs_hr_service_hs_hr_perf_evaluation` FOREIGN KEY (`service_code`) REFERENCES `hs_hr_service` (`service_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_evaluation_detail`
--

LOCK TABLES `hs_hr_perf_evaluation_detail` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_evaluation_project`
--

DROP TABLE IF EXISTS `hs_hr_perf_evaluation_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_evaluation_project` (
  `eval_prj_id` int(10) NOT NULL AUTO_INCREMENT,
  `eval_prj_name` varchar(200) DEFAULT NULL,
  `eval_prj_name_si` varchar(200) DEFAULT NULL,
  `eval_prj_name_ta` varchar(200) DEFAULT NULL,
  `eval_prj_completed` varchar(10) DEFAULT NULL,
  `eval_prj_user_code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`eval_prj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_evaluation_project`
--

LOCK TABLES `hs_hr_perf_evaluation_project` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_evaluation_project_employee`
--

DROP TABLE IF EXISTS `hs_hr_perf_evaluation_project_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_evaluation_project_employee` (
  `eval_prj_id` int(10) NOT NULL DEFAULT '0',
  `emp_number` int(7) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eval_prj_id`,`emp_number`),
  KEY `emp_number_employee_hs_hr_employee` (`emp_number`),
  CONSTRAINT `emp_number_employee_hs_hr_employee` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `eval_prj_id_hs_hr_perf_evaluation_project` FOREIGN KEY (`eval_prj_id`) REFERENCES `hs_hr_perf_evaluation_project` (`eval_prj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_evaluation_project_employee`
--

LOCK TABLES `hs_hr_perf_evaluation_project_employee` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation_project_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation_project_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_evaluation_supervisor`
--

DROP TABLE IF EXISTS `hs_hr_perf_evaluation_supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_evaluation_supervisor` (
  `eval_id` int(4) NOT NULL DEFAULT '0',
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `sup_num` int(7) DEFAULT NULL,
  `eval_sup_flag` varchar(1) DEFAULT NULL,
  `eval_type_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`eval_id`,`emp_number`),
  KEY `hs_hr_employee_hs_hr_perf_evaluation_supervisor` (`emp_number`),
  CONSTRAINT `hs_hr_employee_hs_hr_perf_evaluation_supervisor` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_perf_evaluation_supervisor_hs_hr_perf_evaluation` FOREIGN KEY (`eval_id`) REFERENCES `hs_hr_perf_evaluation` (`eval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_evaluation_supervisor`
--

LOCK TABLES `hs_hr_perf_evaluation_supervisor` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation_supervisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation_supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_evaluation_type`
--

DROP TABLE IF EXISTS `hs_hr_perf_evaluation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_evaluation_type` (
  `eval_type_id` int(4) NOT NULL AUTO_INCREMENT,
  `eval_type_name` varchar(200) DEFAULT NULL,
  `eval_type_name_si` varchar(200) DEFAULT NULL,
  `eval_type_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`eval_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_evaluation_type`
--

LOCK TABLES `hs_hr_perf_evaluation_type` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_evaluation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_rate`
--

DROP TABLE IF EXISTS `hs_hr_perf_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_rate` (
  `rate_id` int(4) NOT NULL AUTO_INCREMENT,
  `rate_code` varchar(10) DEFAULT NULL,
  `rate_name` varchar(100) DEFAULT NULL,
  `rate_name_si` varchar(100) DEFAULT NULL,
  `rate_name_ta` varchar(100) DEFAULT NULL,
  `rate_desc` varchar(200) DEFAULT NULL,
  `rate_desc_si` varchar(200) DEFAULT NULL,
  `rate_desc_ta` varchar(200) DEFAULT NULL,
  `rate_option` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  UNIQUE KEY `rate_name` (`rate_name`),
  UNIQUE KEY `rate_name_si` (`rate_name_si`),
  UNIQUE KEY `rate_name_ta` (`rate_name_ta`),
  UNIQUE KEY `rate_code` (`rate_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_rate`
--

LOCK TABLES `hs_hr_perf_rate` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_perf_rate_detail`
--

DROP TABLE IF EXISTS `hs_hr_perf_rate_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_perf_rate_detail` (
  `rate_id` int(4) NOT NULL DEFAULT '0',
  `rdt_grade` varchar(10) NOT NULL DEFAULT '',
  `rdt_mark` float NOT NULL DEFAULT '0',
  `rdt_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rate_id`,`rdt_grade`,`rdt_mark`),
  CONSTRAINT `hs_hr_perf_rate_detail_hs_hr_perf_rate` FOREIGN KEY (`rate_id`) REFERENCES `hs_hr_perf_rate` (`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_perf_rate_detail`
--

LOCK TABLES `hs_hr_perf_rate_detail` WRITE;
/*!40000 ALTER TABLE `hs_hr_perf_rate_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_perf_rate_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_prm_attachment`
--

DROP TABLE IF EXISTS `hs_hr_prm_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_prm_attachment` (
  `prm_attach_id` int(20) NOT NULL AUTO_INCREMENT,
  `prm_attach_filename` varchar(200) DEFAULT NULL,
  `prm_attach_size` int(11) DEFAULT NULL,
  `prm_attach_attachment` mediumblob,
  `prm_attach_type` varchar(50) DEFAULT NULL,
  `prm_id` int(20) NOT NULL,
  PRIMARY KEY (`prm_attach_id`,`prm_id`),
  KEY `xif1hs_hr_prm_attachment` (`prm_id`),
  CONSTRAINT `hs_hr_prm_attachment_ibfk_1` FOREIGN KEY (`prm_id`) REFERENCES `hs_hr_promotion` (`prm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_prm_attachment`
--

LOCK TABLES `hs_hr_prm_attachment` WRITE;
/*!40000 ALTER TABLE `hs_hr_prm_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_prm_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_prm_cnf_attachment`
--

DROP TABLE IF EXISTS `hs_hr_prm_cnf_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_prm_cnf_attachment` (
  `prm_cnf_attach_id` int(20) NOT NULL AUTO_INCREMENT,
  `prm_cnf_attach_filename` varchar(200) DEFAULT NULL,
  `prm_cnf_attach_size` int(11) DEFAULT NULL,
  `prm_cnf_attach_attachment` mediumblob,
  `prm_cnf_attach_type` varchar(50) DEFAULT NULL,
  `prm_id` int(20) NOT NULL,
  PRIMARY KEY (`prm_cnf_attach_id`,`prm_id`),
  KEY `xif1hs_hr_prm_cnf_attachment` (`prm_id`),
  CONSTRAINT `hs_hr_prm_cnf_attachment_ibfk_1` FOREIGN KEY (`prm_id`) REFERENCES `hs_hr_promotion` (`prm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_prm_cnf_attachment`
--

LOCK TABLES `hs_hr_prm_cnf_attachment` WRITE;
/*!40000 ALTER TABLE `hs_hr_prm_cnf_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_prm_cnf_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_prm_conf_method`
--

DROP TABLE IF EXISTS `hs_hr_prm_conf_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_prm_conf_method` (
  `prm_conf_method_id` int(4) NOT NULL AUTO_INCREMENT,
  `prm_conf_method_comment_en` varchar(200) DEFAULT NULL,
  `prm_conf_method_comment_si` varchar(200) DEFAULT NULL,
  `prm_conf_method_comment_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`prm_conf_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_prm_conf_method`
--

LOCK TABLES `hs_hr_prm_conf_method` WRITE;
/*!40000 ALTER TABLE `hs_hr_prm_conf_method` DISABLE KEYS */;
INSERT INTO `hs_hr_prm_conf_method` VALUES (1,'Qualified','‡∑É‡∑î‡∂Ø‡∑î‡∑É‡∑î‡∂ö‡∂∏‡∑ä ‡∂Ω‡∂≠‡∑ä','Q‡Æâ‡ÆÖf‡Æá‡Æé'),(2,'Exam','‡∂ß‡∂∫‡∑ô‡∂ß','‡Æï‡Øç‡Æπ‡Øç‡Æú‡Øç‡Æï‡Øç‡Æπ');
/*!40000 ALTER TABLE `hs_hr_prm_conf_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_project`
--

DROP TABLE IF EXISTS `hs_hr_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_project` (
  `project_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`project_id`,`customer_id`),
  KEY `xif1hs_hr_project` (`customer_id`),
  CONSTRAINT `hs_hr_project_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `hs_hr_customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_project`
--

LOCK TABLES `hs_hr_project` WRITE;
/*!40000 ALTER TABLE `hs_hr_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_project_activity`
--

DROP TABLE IF EXISTS `hs_hr_project_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_project_activity` (
  `activity_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`activity_id`),
  KEY `xif1hs_hr_project_activity` (`project_id`),
  CONSTRAINT `hs_hr_project_activity_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `hs_hr_project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_project_activity`
--

LOCK TABLES `hs_hr_project_activity` WRITE;
/*!40000 ALTER TABLE `hs_hr_project_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_project_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_project_admin`
--

DROP TABLE IF EXISTS `hs_hr_project_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_project_admin` (
  `project_id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`emp_number`),
  KEY `xif1hs_hr_project_admin` (`emp_number`),
  KEY `xif2hs_hr_project_admin` (`project_id`),
  CONSTRAINT `hs_hr_project_admin_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `hs_hr_project` (`project_id`) ON DELETE CASCADE,
  CONSTRAINT `hs_hr_project_admin_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_project_admin`
--

LOCK TABLES `hs_hr_project_admin` WRITE;
/*!40000 ALTER TABLE `hs_hr_project_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_project_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_promotion`
--

DROP TABLE IF EXISTS `hs_hr_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_promotion` (
  `prm_id` int(20) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `service_code` int(4) DEFAULT NULL,
  `grade_code` int(4) DEFAULT NULL,
  `jobtit_code` varchar(13) DEFAULT NULL,
  `estat_code` varchar(13) DEFAULT NULL,
  `prm_effective_date` date DEFAULT NULL,
  `prm_divition` int(6) DEFAULT NULL,
  `prm_prev_grade` int(4) DEFAULT NULL,
  `prm_prev_jobtit_code` varchar(13) DEFAULT NULL,
  `prm_prev_emp_status` varchar(13) DEFAULT NULL,
  `prm_prev_work_station` int(6) DEFAULT NULL,
  `prm_comment` varchar(200) DEFAULT NULL,
  `prm_method_id` int(4) DEFAULT NULL,
  `prm_conf_method_id` int(4) DEFAULT NULL,
  `class_code` int(4) DEFAULT NULL,
  `slt_id` int(10) DEFAULT NULL,
  `level_code` int(4) DEFAULT NULL,
  `prm_prev_class_code` int(4) DEFAULT NULL,
  `prm_prev_slt_id` int(10) DEFAULT NULL,
  `prm_prev_level_code` int(4) DEFAULT NULL,
  `emp_salary_inc_date` date DEFAULT NULL,
  `prm_prev_emp_salary_inc_date` date DEFAULT NULL,
  `prm_commencement_date` date DEFAULT NULL,
  `prm_prev_service_code` int(4) DEFAULT NULL,
  PRIMARY KEY (`prm_id`),
  KEY `xif1hs_hr_promotion` (`emp_number`),
  KEY `xif2hs_hr_promotion` (`estat_code`),
  KEY `xif3hs_hr_promotion` (`grade_code`),
  KEY `xif4hs_hr_promotion` (`jobtit_code`),
  KEY `xif5hs_hr_promotion` (`prm_conf_method_id`),
  KEY `xif6hs_hr_promotion` (`prm_divition`),
  KEY `xif7hs_hr_promotion` (`prm_method_id`),
  KEY `xif8hs_hr_promotion` (`prm_prev_emp_status`),
  KEY `xif9hs_hr_promotion` (`prm_prev_grade`),
  KEY `xif10hs_hr_promotion` (`prm_prev_jobtit_code`),
  KEY `xif11hs_hr_promotion` (`prm_prev_work_station`),
  KEY `xif12hs_hr_promotion` (`service_code`),
  KEY `hs_hr_promotion_hs_hr_class` (`class_code`),
  KEY `hs_hr_promotion_hs_hr_class1` (`prm_prev_class_code`),
  KEY `hs_hr_promotion_hs_hr_grade_slot` (`slt_id`),
  KEY `hs_hr_promotion_hs_hr_grade_slot1` (`prm_prev_slt_id`),
  KEY `hs_hr_promotion_hs_hr_level` (`level_code`),
  KEY `hs_hr_promotion_hs_hr_level1` (`prm_prev_level_code`),
  KEY `hs_hr_promotion_hs_hr_service` (`prm_prev_service_code`),
  CONSTRAINT `hs_hr_promotion_hs_hr_class` FOREIGN KEY (`class_code`) REFERENCES `hs_hr_class` (`class_code`),
  CONSTRAINT `hs_hr_promotion_hs_hr_class1` FOREIGN KEY (`prm_prev_class_code`) REFERENCES `hs_hr_class` (`class_code`),
  CONSTRAINT `hs_hr_promotion_hs_hr_grade_slot` FOREIGN KEY (`slt_id`) REFERENCES `hs_hr_grade_slot` (`slt_id`),
  CONSTRAINT `hs_hr_promotion_hs_hr_grade_slot1` FOREIGN KEY (`prm_prev_slt_id`) REFERENCES `hs_hr_grade_slot` (`slt_id`),
  CONSTRAINT `hs_hr_promotion_hs_hr_level` FOREIGN KEY (`level_code`) REFERENCES `hs_hr_level` (`level_code`),
  CONSTRAINT `hs_hr_promotion_hs_hr_level1` FOREIGN KEY (`prm_prev_level_code`) REFERENCES `hs_hr_level` (`level_code`),
  CONSTRAINT `hs_hr_promotion_hs_hr_service` FOREIGN KEY (`prm_prev_service_code`) REFERENCES `hs_hr_service` (`service_code`),
  CONSTRAINT `hs_hr_promotion_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_promotion_ibfk_10` FOREIGN KEY (`prm_prev_work_station`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_hr_promotion_ibfk_11` FOREIGN KEY (`prm_method_id`) REFERENCES `hs_hr_promotion_method` (`prm_method_id`),
  CONSTRAINT `hs_hr_promotion_ibfk_12` FOREIGN KEY (`prm_conf_method_id`) REFERENCES `hs_hr_prm_conf_method` (`prm_conf_method_id`),
  CONSTRAINT `hs_hr_promotion_ibfk_2` FOREIGN KEY (`service_code`) REFERENCES `hs_hr_service` (`service_code`),
  CONSTRAINT `hs_hr_promotion_ibfk_3` FOREIGN KEY (`grade_code`) REFERENCES `hs_hr_grade` (`grade_code`),
  CONSTRAINT `hs_hr_promotion_ibfk_4` FOREIGN KEY (`jobtit_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`),
  CONSTRAINT `hs_hr_promotion_ibfk_5` FOREIGN KEY (`estat_code`) REFERENCES `hs_hr_empstat` (`estat_code`),
  CONSTRAINT `hs_hr_promotion_ibfk_6` FOREIGN KEY (`prm_divition`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_hr_promotion_ibfk_7` FOREIGN KEY (`prm_prev_grade`) REFERENCES `hs_hr_grade` (`grade_code`),
  CONSTRAINT `hs_hr_promotion_ibfk_8` FOREIGN KEY (`prm_prev_jobtit_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`),
  CONSTRAINT `hs_hr_promotion_ibfk_9` FOREIGN KEY (`prm_prev_emp_status`) REFERENCES `hs_hr_empstat` (`estat_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_promotion`
--

LOCK TABLES `hs_hr_promotion` WRITE;
/*!40000 ALTER TABLE `hs_hr_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_promotion_ckecklist`
--

DROP TABLE IF EXISTS `hs_hr_promotion_ckecklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_promotion_ckecklist` (
  `prm_checklist_id` int(4) NOT NULL AUTO_INCREMENT,
  `prm_checklist_name_en` varchar(200) DEFAULT NULL,
  `prm_checklist_name_si` varchar(200) DEFAULT NULL,
  `prm_checklist_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`prm_checklist_id`),
  UNIQUE KEY `prm_checklist_name_ta` (`prm_checklist_name_ta`),
  UNIQUE KEY `prm_checklist_name_si` (`prm_checklist_name_si`),
  UNIQUE KEY `prm_checklist_name_en` (`prm_checklist_name_en`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_promotion_ckecklist`
--

LOCK TABLES `hs_hr_promotion_ckecklist` WRITE;
/*!40000 ALTER TABLE `hs_hr_promotion_ckecklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_promotion_ckecklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_promotion_ckecklist_detail`
--

DROP TABLE IF EXISTS `hs_hr_promotion_ckecklist_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_promotion_ckecklist_detail` (
  `emp_number` int(7) NOT NULL,
  `prm_checklist_id` int(4) NOT NULL,
  `prm_value` varchar(1) DEFAULT NULL,
  `prm_complete_date` date DEFAULT NULL,
  `prm_comment` varchar(200) DEFAULT NULL,
  `prm_ovr_comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`prm_checklist_id`),
  KEY `hs_hr_promotion_ckecklist_detail_ibfk_2` (`prm_checklist_id`),
  CONSTRAINT `hs_hr_promotion_ckecklist_detail_employee` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_promotion_ckecklist_detail_ibfk_2` FOREIGN KEY (`prm_checklist_id`) REFERENCES `hs_hr_promotion_ckecklist` (`prm_checklist_id`),
  CONSTRAINT `hs_hr_promotion_ckecklist_detail_prm_checklist_id` FOREIGN KEY (`prm_checklist_id`) REFERENCES `hs_hr_promotion_ckecklist` (`prm_checklist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_promotion_ckecklist_detail`
--

LOCK TABLES `hs_hr_promotion_ckecklist_detail` WRITE;
/*!40000 ALTER TABLE `hs_hr_promotion_ckecklist_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_promotion_ckecklist_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_promotion_method`
--

DROP TABLE IF EXISTS `hs_hr_promotion_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_promotion_method` (
  `prm_method_id` int(4) NOT NULL AUTO_INCREMENT,
  `prm_method_comment_en` varchar(200) DEFAULT NULL,
  `prm_method_comment_si` varchar(200) DEFAULT NULL,
  `prm_method_comment_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`prm_method_id`),
  UNIQUE KEY `prm_method_comment_ta` (`prm_method_comment_ta`),
  UNIQUE KEY `prm_method_comment_si` (`prm_method_comment_si`),
  UNIQUE KEY `prm_method_comment_en` (`prm_method_comment_en`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_promotion_method`
--

LOCK TABLES `hs_hr_promotion_method` WRITE;
/*!40000 ALTER TABLE `hs_hr_promotion_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_promotion_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_rec_adv_attachment`
--

DROP TABLE IF EXISTS `hs_hr_rec_adv_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_rec_adv_attachment` (
  `rec_adv_attach_id` int(20) NOT NULL AUTO_INCREMENT,
  `rec_adv_attach_filename` varchar(200) DEFAULT NULL,
  `rec_adv_attach_size` varchar(11) DEFAULT NULL,
  `rec_adv_attach_attachment` mediumblob,
  `rec_adv_attach_type` varchar(50) DEFAULT NULL,
  `rec_adv_id` int(4) NOT NULL,
  PRIMARY KEY (`rec_adv_attach_id`,`rec_adv_id`),
  KEY `hs_hr_rec_adv_attachment_ibfk` (`rec_adv_id`),
  CONSTRAINT `hs_hr_rec_adv_attachment_ibfk` FOREIGN KEY (`rec_adv_id`) REFERENCES `hs_hr_rec_advertisement` (`rec_adv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_rec_adv_attachment`
--

LOCK TABLES `hs_hr_rec_adv_attachment` WRITE;
/*!40000 ALTER TABLE `hs_hr_rec_adv_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_rec_adv_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_rec_advertisement`
--

DROP TABLE IF EXISTS `hs_hr_rec_advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_rec_advertisement` (
  `rec_adv_id` int(7) NOT NULL AUTO_INCREMENT,
  `rec_req_id` int(10) NOT NULL,
  `rec_adv_desc` varchar(400) NOT NULL,
  `rec_adv_desc_si` varchar(400) DEFAULT NULL,
  `rec_adv_desc_ta` varchar(400) DEFAULT NULL,
  `rec_adv_opening_date` date NOT NULL,
  `rec_adv_closing_date` date NOT NULL,
  PRIMARY KEY (`rec_adv_id`),
  KEY `hs_hr_rec_rec_advertisement_ibfk` (`rec_req_id`),
  KEY `xif1hs_hr_rec_advertisement` (`rec_adv_id`),
  CONSTRAINT `hs_hr_rec_rec_advertisement_ibfk` FOREIGN KEY (`rec_req_id`) REFERENCES `hs_hr_rec_vacancy_requisition` (`rec_req_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_rec_advertisement`
--

LOCK TABLES `hs_hr_rec_advertisement` WRITE;
/*!40000 ALTER TABLE `hs_hr_rec_advertisement` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_rec_advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_rec_candidate`
--

DROP TABLE IF EXISTS `hs_hr_rec_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_rec_candidate` (
  `rec_can_id` int(7) NOT NULL AUTO_INCREMENT,
  `rec_req_id` int(10) NOT NULL,
  `rec_can_reference_no` int(7) NOT NULL,
  `rec_can_nic_number` int(10) NOT NULL,
  `rec_can_candidate_name` varchar(100) NOT NULL,
  `rec_can_tel_number` varchar(20) NOT NULL,
  `rec_can_address` varchar(100) NOT NULL,
  `gender_code` int(2) NOT NULL,
  `rec_can_birthday` date NOT NULL,
  `rec_can_edu_qualification` varchar(200) NOT NULL,
  `rec_can_work_experiences` varchar(200) NOT NULL,
  `lang_code` varchar(13) NOT NULL,
  `rec_can_interview_marks` varchar(5) NOT NULL,
  `rec_can_interview_status` int(2) DEFAULT NULL,
  `rec_can_interview_status_hr` int(2) DEFAULT NULL,
  `rec_can_interview_status_dg` int(2) DEFAULT NULL,
  PRIMARY KEY (`rec_can_id`),
  UNIQUE KEY `rec_can_reference_no` (`rec_can_reference_no`),
  UNIQUE KEY `rec_can_nic_number` (`rec_can_nic_number`),
  UNIQUE KEY `rec_can_reference_no_2` (`rec_can_reference_no`),
  UNIQUE KEY `rec_can_nic_number_2` (`rec_can_nic_number`),
  KEY `hs_hr_rec_candidate_ibfk_1` (`gender_code`),
  KEY `hs_hr_rec_candidate_ibfk_2` (`lang_code`),
  CONSTRAINT `hs_hr_rec_candidate_ibfk_1` FOREIGN KEY (`gender_code`) REFERENCES `hs_hr_gender` (`gender_code`),
  CONSTRAINT `hs_hr_rec_candidate_ibfk_2` FOREIGN KEY (`lang_code`) REFERENCES `hs_hr_language` (`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_rec_candidate`
--

LOCK TABLES `hs_hr_rec_candidate` WRITE;
/*!40000 ALTER TABLE `hs_hr_rec_candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_rec_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_rec_cv_attachment`
--

DROP TABLE IF EXISTS `hs_hr_rec_cv_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_rec_cv_attachment` (
  `rec_cv_attach_id` int(20) NOT NULL AUTO_INCREMENT,
  `rec_cv_attach_filename` varchar(200) DEFAULT NULL,
  `rec_cv_attach_size` varchar(11) DEFAULT NULL,
  `rec_cv_attach_attachment` mediumblob,
  `rec_cv_attach_type` varchar(50) DEFAULT NULL,
  `rec_can_id` int(4) NOT NULL,
  PRIMARY KEY (`rec_cv_attach_id`,`rec_can_id`),
  KEY `hs_hr_rec_cv_attachment_ibfk` (`rec_can_id`),
  KEY `xif1hs_hr_rec_cv_attachment` (`rec_cv_attach_id`),
  CONSTRAINT `hs_hr_rec_cv_attachment_ibfk` FOREIGN KEY (`rec_can_id`) REFERENCES `hs_hr_rec_candidate` (`rec_can_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_rec_cv_attachment`
--

LOCK TABLES `hs_hr_rec_cv_attachment` WRITE;
/*!40000 ALTER TABLE `hs_hr_rec_cv_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_rec_cv_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_rec_vacancy_request`
--

DROP TABLE IF EXISTS `hs_hr_rec_vacancy_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_rec_vacancy_request` (
  `rec_vac_req_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `rec_vac_vacancy_title` varchar(100) NOT NULL,
  `rec_vac_vacancy_title_si` varchar(100) DEFAULT NULL,
  `rec_vac_vacancy_title_ta` varchar(100) DEFAULT NULL,
  `rec_vac_year` int(3) NOT NULL,
  `rec_vac_no_of_vacancies` int(7) NOT NULL,
  `rec_vac_no_of_vacancies_by_hr` int(7) DEFAULT NULL,
  `rec_vac_no_of_vacancies_by_dg` int(7) DEFAULT NULL,
  `rec_vac_is_submit` int(2) DEFAULT NULL,
  PRIMARY KEY (`rec_vac_req_id`),
  KEY `hs_hr_rec_vacancy_request_ibfk_1` (`emp_number`),
  CONSTRAINT `hs_hr_rec_vacancy_request_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_rec_vacancy_request`
--

LOCK TABLES `hs_hr_rec_vacancy_request` WRITE;
/*!40000 ALTER TABLE `hs_hr_rec_vacancy_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_rec_vacancy_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_rec_vacancy_requisition`
--

DROP TABLE IF EXISTS `hs_hr_rec_vacancy_requisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_rec_vacancy_requisition` (
  `rec_req_id` int(10) NOT NULL AUTO_INCREMENT,
  `rec_req_ref_number` varchar(15) NOT NULL,
  `rec_req_vacancy_title` varchar(100) NOT NULL,
  `rec_req_vacancy_title_si` varchar(100) DEFAULT NULL,
  `rec_req_vacancy_title_ta` varchar(100) DEFAULT NULL,
  `rec_req_year` int(3) NOT NULL,
  `cmp_stur_id` int(6) NOT NULL,
  `grade_code` int(4) NOT NULL,
  `jobtit_code` varchar(13) NOT NULL,
  `report_to` varchar(100) NOT NULL,
  `estat_code` varchar(13) NOT NULL,
  `rec_req_Recruitment_type` varchar(100) NOT NULL,
  `rec_req_qualification` varchar(300) NOT NULL,
  `rec_req_qualification_si` varchar(300) DEFAULT NULL,
  `rec_req_qualification_ta` varchar(300) DEFAULT NULL,
  `rec_req_opening_date` date NOT NULL,
  `rec_req_closing_date` date NOT NULL,
  `rec_req_requested_vacancies` int(4) NOT NULL,
  `rec_req_approved_vacancies` int(4) NOT NULL,
  PRIMARY KEY (`rec_req_id`),
  UNIQUE KEY `rec_req_ref_number` (`rec_req_ref_number`),
  UNIQUE KEY `rec_req_ref_number_2` (`rec_req_ref_number`),
  UNIQUE KEY `rec_req_ref_number_3` (`rec_req_ref_number`),
  KEY `xif1hs_hr_rec_vacancy_requisition` (`rec_req_id`),
  KEY `hs_hr_rec_vacancy_requisition_ibfk_1` (`cmp_stur_id`),
  KEY `hs_hr_rec_vacancy_requisition_ibfk_2` (`grade_code`),
  KEY `hs_hr_rec_vacancy_requisition_ibfk_3` (`jobtit_code`),
  KEY `hs_hr_rec_vacancy_requisition_ibfk_4` (`estat_code`),
  CONSTRAINT `hs_hr_rec_vacancy_requisition_ibfk_1` FOREIGN KEY (`cmp_stur_id`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_hr_rec_vacancy_requisition_ibfk_2` FOREIGN KEY (`grade_code`) REFERENCES `hs_hr_grade` (`grade_code`),
  CONSTRAINT `hs_hr_rec_vacancy_requisition_ibfk_3` FOREIGN KEY (`jobtit_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`),
  CONSTRAINT `hs_hr_rec_vacancy_requisition_ibfk_4` FOREIGN KEY (`estat_code`) REFERENCES `hs_hr_empstat` (`estat_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_rec_vacancy_requisition`
--

LOCK TABLES `hs_hr_rec_vacancy_requisition` WRITE;
/*!40000 ALTER TABLE `hs_hr_rec_vacancy_requisition` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_rec_vacancy_requisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_reinstatement`
--

DROP TABLE IF EXISTS `hs_hr_reinstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_reinstatement` (
  `rei_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) DEFAULT NULL,
  `emp_epf_number` varchar(25) DEFAULT NULL,
  `rei_date` date DEFAULT NULL,
  `job_title_code` varchar(13) DEFAULT NULL,
  `grade_code` int(4) DEFAULT NULL,
  `slt_id` int(10) DEFAULT NULL,
  `work_station` int(6) DEFAULT NULL,
  `rei_reason` varchar(200) DEFAULT NULL,
  `pre_emp_epf_number` varchar(25) DEFAULT NULL,
  `pre_job_title_code` varchar(13) DEFAULT NULL,
  `pre_grade_code` int(4) DEFAULT NULL,
  `pre_slt_id` int(10) DEFAULT NULL,
  `pre_work_station` int(6) DEFAULT NULL,
  PRIMARY KEY (`rei_id`),
  KEY `hs_hr_employee_hs_hr_reinstatement` (`emp_number`),
  KEY `hs_hr_reinstatement_jobtit_code` (`job_title_code`),
  KEY `hs_hr_reinstatement_grade_code` (`grade_code`),
  KEY `hs_hr_reinstatement_work_station` (`work_station`),
  KEY `hs_hr_reinstatement_hs_hr_grade_slot` (`slt_id`),
  KEY `hs_hr_reinstatement_pre_jobtit_code` (`pre_job_title_code`),
  KEY `hs_hr_reinstatement_pre_grade_code` (`pre_grade_code`),
  KEY `hs_hr_reinstatement_pre_work_station` (`pre_work_station`),
  KEY `hs_hr_reinstatement_pre_hs_hr_grade_slot` (`pre_slt_id`),
  CONSTRAINT `hs_hr_employee_hs_hr_reinstatement` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_reinstatement_grade_code` FOREIGN KEY (`grade_code`) REFERENCES `hs_hr_grade` (`grade_code`),
  CONSTRAINT `hs_hr_reinstatement_hs_hr_grade_slot` FOREIGN KEY (`slt_id`) REFERENCES `hs_hr_grade_slot` (`slt_id`),
  CONSTRAINT `hs_hr_reinstatement_jobtit_code` FOREIGN KEY (`job_title_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`),
  CONSTRAINT `hs_hr_reinstatement_pre_grade_code` FOREIGN KEY (`pre_grade_code`) REFERENCES `hs_hr_grade` (`grade_code`),
  CONSTRAINT `hs_hr_reinstatement_pre_hs_hr_grade_slot` FOREIGN KEY (`pre_slt_id`) REFERENCES `hs_hr_grade_slot` (`slt_id`),
  CONSTRAINT `hs_hr_reinstatement_pre_jobtit_code` FOREIGN KEY (`pre_job_title_code`) REFERENCES `hs_hr_job_title` (`jobtit_code`),
  CONSTRAINT `hs_hr_reinstatement_pre_work_station` FOREIGN KEY (`pre_work_station`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_hr_reinstatement_work_station` FOREIGN KEY (`work_station`) REFERENCES `hs_hr_compstructtree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_reinstatement`
--

LOCK TABLES `hs_hr_reinstatement` WRITE;
/*!40000 ALTER TABLE `hs_hr_reinstatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_reinstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_relationship`
--

DROP TABLE IF EXISTS `hs_hr_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_relationship` (
  `rel_code` int(4) NOT NULL AUTO_INCREMENT,
  `rel_name` varchar(50) NOT NULL,
  `rel_name_si` varchar(50) DEFAULT NULL,
  `rel_name_ta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rel_code`),
  UNIQUE KEY `rel_name` (`rel_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_relationship`
--

LOCK TABLES `hs_hr_relationship` WRITE;
/*!40000 ALTER TABLE `hs_hr_relationship` DISABLE KEYS */;
INSERT INTO `hs_hr_relationship` VALUES (1,'Brother','‡∑É‡∑Ñ‡∑ù‡∂Ø‡∂ª‡∂∫‡∑è',''),(2,'Daughter','‡∂Ø‡∑î‡∑Ä',''),(3,'Father','‡∂¥‡∑í‡∂∫‡∑è',''),(4,'Father-in-Law','‡∂∏‡∑è‡∂∏‡∑è',''),(5,'Mother','‡∂∏‡∑Ä',''),(6,'Mother-in-Law','‡∂±‡∑ê‡∂±‡∑ä‡∂Ø‡∂∏‡∑ä‡∂∏‡∑è',''),(7,'Sister','‡∑É‡∑Ñ‡∑ù‡∂Ø‡∂ª‡∑í‡∂∫',''),(8,'Son','‡∂¥‡∑î‡∂≠‡∑è',''),(9,'Spouse','‡∂∑‡∑è‡∂ª‡∑ä‡∂∫‡∑è‡∑Ä ‡∑Ñ‡∑ù ‡∂¥‡∑î‡∂ª‡∑î‡∑Ç‡∂∫‡∑è','');
/*!40000 ALTER TABLE `hs_hr_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_religion`
--

DROP TABLE IF EXISTS `hs_hr_religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_religion` (
  `rlg_code` int(2) NOT NULL AUTO_INCREMENT,
  `rlg_name` varchar(30) NOT NULL,
  `rlg_name_si` varchar(30) DEFAULT NULL,
  `rlg_name_ta` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rlg_code`),
  UNIQUE KEY `rlg_name` (`rlg_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_religion`
--

LOCK TABLES `hs_hr_religion` WRITE;
/*!40000 ALTER TABLE `hs_hr_religion` DISABLE KEYS */;
INSERT INTO `hs_hr_religion` VALUES (1,'Buddist','‡∂∂‡∑û‡∂Ø‡∑ä‡∂∞','hjf'),(2,'Hindu','‡∑Ñ‡∑í‡∂±‡∑ä‡∂Ø‡∑î','dfsd'),(3,'Muslim','‡∂∏‡∑î‡∑É‡∑ä‡∂Ω‡∑í‡∂∏‡∑ä','dfsd');
/*!40000 ALTER TABLE `hs_hr_religion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_ret_retirement`
--

DROP TABLE IF EXISTS `hs_hr_ret_retirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_ret_retirement` (
  `emp_number` int(7) NOT NULL,
  `ret_id` int(20) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `clause` varchar(20) NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`ret_id`),
  KEY `xif1hs_hr_ret_retirement` (`emp_number`),
  CONSTRAINT `hs_hr_ret_retirement_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_ret_retirement`
--

LOCK TABLES `hs_hr_ret_retirement` WRITE;
/*!40000 ALTER TABLE `hs_hr_ret_retirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_ret_retirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_rn_report`
--

DROP TABLE IF EXISTS `hs_hr_rn_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_rn_report` (
  `rn_rpt_id` int(10) NOT NULL AUTO_INCREMENT,
  `rn_rpt_name` varchar(100) NOT NULL,
  `rn_rpt_name_si` varchar(100) DEFAULT NULL,
  `rn_rpt_name_ta` varchar(100) DEFAULT NULL,
  `rn_rpt_path` varchar(100) DEFAULT NULL,
  `mod_id` varchar(36) NOT NULL,
  PRIMARY KEY (`rn_rpt_id`),
  UNIQUE KEY `rn_rpt_name` (`rn_rpt_name`),
  KEY `xif1hs_hr_rn_report` (`mod_id`),
  CONSTRAINT `hs_hr_rn_report_ibfk_1` FOREIGN KEY (`mod_id`) REFERENCES `hs_hr_module` (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_rn_report`
--

LOCK TABLES `hs_hr_rn_report` WRITE;
/*!40000 ALTER TABLE `hs_hr_rn_report` DISABLE KEYS */;
INSERT INTO `hs_hr_rn_report` VALUES (6,'Attendance Summary','‡∂¥‡∑ê‡∂∏‡∑í‡∂±‡∑ì‡∂∏‡∑ö ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä','Attendance Summary ta','Attendance_summary.rptdesign','MOD008'),(7,'Employee retirement notification','‡∑É‡∑ö‡∑Ä‡∂ö ‡∑Ä‡∑ä‡∑Å‡∑ä‚Äç‡∂ª‡∑è‡∂∏ ‡∂ú‡∑ê‡∂±‡∑ì‡∂∏‡∑ö ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Emp_retirement_notification.rptdesign','MOD002'),(9,'Service Extend','‡∑É‡∑ö‡∑Ä‡∑è‡∂∫ ‡∂Ø‡∑ì‡∂ª‡∑ä‡∂ù ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏',NULL,'Emp_service_extension_ori.rptdesign','MOD002'),(10,'Employee service extension search by period','‡∑Ä‡∂ö‡∑Ä‡∑è‡∂±‡∑î‡∑Ä ‡∂Ö‡∂±‡∑î‡∑Ä ‡∑É‡∑ö‡∑Ä‡∂ö ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Emp_service_extension_searchbyPeriod.rptdesign','MOD002'),(11,'Confirmation Report','‡∑É‡∑ö‡∑Ä‡∂∫ ‡∂≠‡∑Ñ‡∑Ä‡∑î‡∂ª‡∑î ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏‡∑ö ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Emp_confirmation.rptdesign','MOD002'),(12,'Employee detail report by Designation/Service ','‡∑É‡∑ö‡∑Ä‡∂∫/‡∂≠‡∂±‡∂≠‡∑î‡∂ª ‡∂Ö‡∂±‡∑î‡∑Ä ‡∑É‡∑ö‡∑Ä‡∂ö ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Emp_designationservice.rptdesign','MOD002'),(13,'Summary of disciplinary actions ','‡∑Ä‡∑í‡∂±‡∂∫ ‡∂ö‡∑ä‚Äç‡∂ª‡∑í‡∂∫‡∑è‡∂∏‡∑è‡∂ª‡∑ä‡∂ú ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Dis_action_summary.rptdesign','MOD004'),(15,'Summary of Employees who are charged for disciplinary action ','‡∑Ä‡∑í‡∂±‡∂∫ ‡∂ö‡∑ä‚Äç‡∂ª‡∑í‡∂∫‡∑è‡∂∏‡∑è‡∂ª‡∑ä‡∂ú ‡∂ú‡∂±‡∑î ‡∂Ω‡∑ê‡∂∂‡∑ñ ‡∑É‡∑ö‡∑Ä‡∂ö ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Dis_charge_emp.rptdesign','MOD004'),(16,'Training Summary','‡∂¥‡∑î‡∑Ñ‡∑î‡∂±‡∑î ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Training_summary.rptdesign','MOD005'),(17,'Training Summary By Employee','‡∂¥‡∑î‡∑Ñ‡∑î‡∂±‡∑î ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä ‡∑É‡∑ö‡∑Ä‡∂ö‡∂∫‡∑è ‡∂Ö‡∂±‡∑î‡∑Ä',NULL,'Train_summaryby_emp.rptdesign','MOD005'),(18,'Training Applicant List','‡∂¥‡∑î‡∑Ñ‡∑î‡∂±‡∑î‡∑Ä‡∑ì‡∂∏‡∑ä ‡∂Ö‡∂∫‡∂Ø‡∑î‡∂∏‡∑ä‡∂ö‡∂ª‡∑î‡∑Ä‡∂±‡∑ä‡∂ú‡∑ô ‡∂Ω‡∑ê‡∂∫‡∑í‡∑É‡∑ä‡∂≠‡∑î‡∑Ä',NULL,'Train_applicant_list.rptdesign','MOD005'),(19,'Training participation summary','‡∂¥‡∑î‡∑Ñ‡∑î‡∂±‡∑î ‡∑É‡∑Ñ‡∂∑‡∑è‡∂ú‡∑í ‡∑Ä‡∑ì‡∂∏‡∑ä ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Train_participation.rptdesign','MOD005'),(20,'Summary of Transfer Details ','‡∂∏‡∑è‡∂ª‡∑î‡∑Ä‡∑ì‡∂∏‡∑ä ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Transfer_details.rptdesign','MOD010'),(21,'Service wise Employee report (Promotion)','‡∑É‡∑ö‡∑Ä‡∑è‡∂∫ ‡∂Ö‡∂±‡∑î‡∑Ä ‡∂ã‡∑É‡∑É‡∑ä ‡∑Ä‡∑ì‡∂∏‡∑ä ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä (‡∂ã‡∑É‡∑É‡∑ä‡∑Ä‡∑ì‡∂∏‡∑ä)',NULL,'Promotion_servicewise.rptdesign','MOD006'),(22,'Upcoming Confirmation Employee list ','‡∂â‡∂Ø‡∑í‡∂ª‡∑í‡∂∫‡∂ß ‡∂≠‡∑í‡∂∂‡∑ô‡∂± ‡∂ã‡∑É‡∑É‡∑ä ‡∑Ä‡∑ì‡∂∏‡∑ä ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Promotion_upcoming.rptdesign','MOD006'),(23,'Summary of promoted list ','‡∂ã‡∑É‡∑É‡∑ä‡∑Ä‡∑ì‡∂∏‡∑ä ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'promotedlist.rptdesign','MOD006'),(24,'Leave Pending approval list','‡∂Ö‡∂±‡∑î‡∂∏‡∂≠ ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏‡∂ß ‡∂≠‡∑í‡∂∂‡∑ô‡∂± ‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Pending Approval Report.rptdesign','MOD012'),(25,'Leave - Leave summary report','‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'leavesummary.rptdesign','MOD012'),(26,'Leave - Leave entitlement report ','‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î ‡∑Ñ‡∑í‡∂∏‡∑í‡∂ö‡∂∏‡∑ä ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'leaveentitlementreport.rptdesign','MOD012'),(27,'Application for leave','‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î ‡∂â‡∂Ω‡∑ä‡∂Ω‡∑î‡∂∏‡∑ä ‡∂¥‡∂≠‡∑ä‚Äç‡∂ª‡∂∫',NULL,'leaveappllication.rptdesign','MOD012'),(28,'Employee Information report','‡∑É‡∑ö‡∑Ä‡∂ö ‡∂≠‡∑ú‡∂ª‡∂≠‡∑î‡∂ª‡∑î ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä',NULL,'Emp_information.rptdesign','MOD002');
/*!40000 ALTER TABLE `hs_hr_rn_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_service`
--

DROP TABLE IF EXISTS `hs_hr_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_service` (
  `service_code` int(4) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) NOT NULL,
  `service_name_si` varchar(100) DEFAULT NULL,
  `service_name_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`service_code`),
  UNIQUE KEY `service_name` (`service_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_service`
--

LOCK TABLES `hs_hr_service` WRITE;
/*!40000 ALTER TABLE `hs_hr_service` DISABLE KEYS */;
INSERT INTO `hs_hr_service` VALUES (1,'Service','','');
/*!40000 ALTER TABLE `hs_hr_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_skill`
--

DROP TABLE IF EXISTS `hs_hr_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_skill` (
  `skill_code` varchar(13) NOT NULL,
  `skill_name` varchar(120) DEFAULT NULL,
  `skill_name_si` varchar(120) DEFAULT NULL,
  `skill_name_ta` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`skill_code`),
  UNIQUE KEY `skill_name_ta` (`skill_name_ta`),
  UNIQUE KEY `skill_name_si` (`skill_name_si`),
  UNIQUE KEY `skill_name` (`skill_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_skill`
--

LOCK TABLES `hs_hr_skill` WRITE;
/*!40000 ALTER TABLE `hs_hr_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_sm_capability`
--

DROP TABLE IF EXISTS `hs_hr_sm_capability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_sm_capability` (
  `sm_capability_id` int(50) NOT NULL AUTO_INCREMENT,
  `sm_capability_name` varchar(100) NOT NULL,
  `sm_capability_name_si` varchar(100) DEFAULT NULL,
  `sm_capability_name_ta` varchar(100) DEFAULT NULL,
  `sm_capability_enable_flag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sm_capability_id`),
  UNIQUE KEY `sm_capability_name` (`sm_capability_name`),
  UNIQUE KEY `sm_capability_name_ta` (`sm_capability_name_ta`),
  UNIQUE KEY `sm_capability_name_si` (`sm_capability_name_si`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_sm_capability`
--

LOCK TABLES `hs_hr_sm_capability` WRITE;
/*!40000 ALTER TABLE `hs_hr_sm_capability` DISABLE KEYS */;
INSERT INTO `hs_hr_sm_capability` VALUES (1,'Default',NULL,NULL,'1');
/*!40000 ALTER TABLE `hs_hr_sm_capability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_sm_mnucapability`
--

DROP TABLE IF EXISTS `hs_hr_sm_mnucapability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_sm_mnucapability` (
  `sm_capability_id` int(50) NOT NULL,
  `sm_mnuitem_id` int(50) NOT NULL,
  `sm_mnucapa_save` varchar(25) DEFAULT NULL,
  `sm_mnucapa_add` varchar(25) DEFAULT NULL,
  `sm_mnucapa_edit` varchar(25) DEFAULT NULL,
  `sm_mnucapa_delete` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`sm_capability_id`,`sm_mnuitem_id`),
  KEY `sm_mnuitem_id` (`sm_mnuitem_id`),
  KEY `xif1hs_hr_sm_mnucapability` (`sm_mnuitem_id`),
  KEY `xif2hs_hr_sm_mnucapability` (`sm_capability_id`),
  CONSTRAINT `hs_hr_sm_mnucapability_ibfk_1` FOREIGN KEY (`sm_mnuitem_id`) REFERENCES `hs_hr_sm_mnuitem` (`sm_mnuitem_id`),
  CONSTRAINT `hs_hr_sm_mnucapability_ibfk_2` FOREIGN KEY (`sm_capability_id`) REFERENCES `hs_hr_sm_capability` (`sm_capability_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_sm_mnucapability`
--

LOCK TABLES `hs_hr_sm_mnucapability` WRITE;
/*!40000 ALTER TABLE `hs_hr_sm_mnucapability` DISABLE KEYS */;
INSERT INTO `hs_hr_sm_mnucapability` VALUES (1,1000,'1','1','1','1'),(1,1001,'1','1','1','1'),(1,1002,'1','1','1','1'),(1,1003,'1','1','1','1'),(1,1004,'1','1','1','1'),(1,1005,'1','1','1','1'),(1,1006,'1','1','1','1'),(1,1007,'1','1','1','1'),(1,1008,'1','1','1','1'),(1,1009,'1','1','1','1'),(1,1010,'1','1','1','1'),(1,1011,'1','1','1','1'),(1,1012,'1','1','1','1'),(1,1013,'1','1','1','1'),(1,1015,'1','1','1','1'),(1,1016,'1','1','1','1'),(1,2000,'1','1','1','1'),(1,2001,'1','1','1','1'),(1,2003,'1','1','1','1'),(1,2004,'1','1','1','1'),(1,2005,'1','1','1','1'),(1,2006,'1','1','1','1'),(1,2007,'1','1','1','1'),(1,2008,'1','1','1','1'),(1,2009,'1','1','1','1'),(1,2010,'1','1','1','1'),(1,2011,'1','1','1','1'),(1,2012,'1','1','1','1'),(1,2013,'1','1','1','1'),(1,2014,'1','1','1','1'),(1,2015,'1','1','1','1'),(1,2016,'1','1','1','1'),(1,2017,'1','1','1','1'),(1,2018,'1','1','1','1'),(1,2019,'1','1','1','1'),(1,2020,'1','1','1','1'),(1,2021,'1','1','1','1'),(1,2022,'1','1','1','1'),(1,3000,'1','1','1','1'),(1,3001,'1','1','1','1'),(1,3002,'1','1','1','1'),(1,3003,'1','1','1','1'),(1,4000,'1','1','1','1'),(1,4001,'1','1','1','1'),(1,4002,'1','1','1','1'),(1,4003,'1','1','1','1'),(1,4004,'1','1','1','1'),(1,4005,'1','1','1','1'),(1,4006,'1','1','1','1'),(1,4007,'1','1','1','1'),(1,4008,'1','1','1','1'),(1,5000,'1','1','1','1'),(1,5001,'1','1','1','1'),(1,5002,'1','1','1','1'),(1,5003,'1','1','1','1'),(1,5006,'1','1','1','1'),(1,5007,'1','1','1','1'),(1,5010,'1','1','1','1'),(1,5011,'1','1','1','1'),(1,5012,'1','1','1','1'),(1,5013,'1','1','1','1'),(1,5014,'1','1','1','1'),(1,5015,'1','1','1','1'),(1,6000,'1','1','1','1'),(1,6001,'1','1','1','1'),(1,6002,'1','1','1','1'),(1,6003,'1','1','1','1'),(1,6004,'1','1','1','1'),(1,6005,'1','1','1','1'),(1,6006,'1','1','1','1'),(1,7000,'1','1','1','1'),(1,7001,'1','1','1','1'),(1,8000,'1','1','1','1'),(1,8001,'1','1','1','1'),(1,8002,'1','1','1','1'),(1,8003,'1','1','1','1'),(1,8004,'1','1','1','1'),(1,9000,'1','1','1','1'),(1,9001,'1','1','1','1'),(1,9002,'1','1','1','1'),(1,9003,'1','1','1','1'),(1,9004,'1','1','1','1'),(1,10000,'1','1','1','1'),(1,10001,'1','1','1','1'),(1,10002,'1','1','1','1'),(1,10003,'1','1','1','1'),(1,10004,'1','1','1','1'),(1,12000,'1','1','1','1'),(1,12001,'1','1','1','1'),(1,12002,'1','1','1','1'),(1,12003,'1','1','1','1'),(1,12004,'1','1','1','1'),(1,12005,'1','1','1','1'),(1,12006,'1','1','1','1'),(1,12007,'1','1','1','1'),(1,13000,'1','1','1','1'),(1,13001,'1','1','1','1'),(1,13002,'1','1','1','1'),(1,13003,'1','1','1','1'),(1,13004,'1','1','1','1'),(1,13005,'1','1','1','1'),(1,13006,'1','1','1','1'),(1,13007,'1','1','1','1'),(1,14000,'1','1','1','1'),(1,15000,'1','1','1','1'),(1,15001,'1','1','1','1'),(1,15002,'1','1','1','1'),(1,15003,'1','1','1','1'),(1,16000,'1','1','1','1'),(1,16001,'1','1','1','1'),(1,16002,'1','1','1','1'),(1,16003,'1','1','1','1'),(1,16004,'1','1','1','1'),(1,16005,'1','1','1','1'),(1,16006,'1','1','1','1'),(1,16007,'1','1','1','1'),(1,16008,'1','1','1','1'),(1,17000,'1','1','1','1'),(1,17001,'1','1','1','1'),(1,17002,'1','1','1','1'),(1,17003,'1','1','1','1'),(1,18000,'1','1','1','1'),(1,18001,'1','1','1','1'),(1,18002,'1','1','1','1'),(1,18003,'1','1','1','1'),(1,18004,'1','1','1','1'),(1,18005,'1','1','1','1'),(1,18006,'1','1','1','1'),(1,18007,'1','1','1','1'),(1,18008,'1','1','1','1'),(1,18009,'1','1','1','1'),(1,18010,'1','1','1','1'),(1,18011,'1','1','1','1'),(1,19000,'1','1','1','1'),(1,19001,'1','1','1','1'),(1,19002,'1','1','1','1'),(1,19003,'1','1','1','1'),(1,19004,'1','1','1','1'),(1,19005,'1','1','1','1'),(1,19006,'1','1','1','1'),(1,19007,'1','1','1','1'),(1,19008,'1','1','1','1'),(1,19009,'1','1','1','1'),(1,19010,'1','1','1','1'),(1,19011,'1','1','1','1'),(1,19012,'1','1','1','1'),(1,19013,'1','1','1','1'),(1,19014,'1','1','1','1'),(1,19015,'1','1','1','1'),(1,19016,'1','1','1','1'),(1,19017,'1','1','1','1'),(1,19018,'1','1','1','1'),(1,19019,'1','1','1','1'),(1,20000,'1','1','1','1'),(1,20001,'1','1','1','1'),(1,20002,'1','1','1','1'),(1,20003,'1','1','1','1'),(1,20004,'1','1','1','1');
/*!40000 ALTER TABLE `hs_hr_sm_mnucapability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_sm_mnuitem`
--

DROP TABLE IF EXISTS `hs_hr_sm_mnuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_sm_mnuitem` (
  `sm_mnuitem_id` int(50) NOT NULL AUTO_INCREMENT,
  `sm_mnuitem_name` varchar(100) NOT NULL,
  `sm_mnuitem_name_si` varchar(100) DEFAULT NULL,
  `sm_mnuitem_name_ta` varchar(100) DEFAULT NULL,
  `sm_mnuitem_parent` int(20) NOT NULL,
  `sm_mnuitem_level` int(20) NOT NULL,
  `sm_mnuitem_webpage_url` varchar(300) NOT NULL,
  `sm_mnuitem_position` varchar(100) NOT NULL,
  `mod_id` varchar(36) NOT NULL,
  `sm_mnuitem_dependency` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`sm_mnuitem_id`),
  KEY `xif1hs_hr_sm_mnuitem` (`mod_id`),
  CONSTRAINT `hs_hr_sm_mnuitem_ibfk_1` FOREIGN KEY (`mod_id`) REFERENCES `hs_hr_module` (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_sm_mnuitem`
--

LOCK TABLES `hs_hr_sm_mnuitem` WRITE;
/*!40000 ALTER TABLE `hs_hr_sm_mnuitem` DISABLE KEYS */;
INSERT INTO `hs_hr_sm_mnuitem` VALUES (1000,'Admin','‡∂¥‡∂ª‡∑í‡∂¥‡∑è‡∂Ω‡∂±','Admin_ta',0,0,'#','01.00','MOD001',NULL),(1001,'Organization Info','‡∂Ü‡∂∫‡∂≠‡∂± ‡∂≠‡∑ú‡∂ª‡∂≠‡∑î‡∂ª‡∑î','Company Info_ta',1000,1,'#','01.01','MOD001',NULL),(1002,'General','‡∑É‡∑è‡∂∏‡∑è‡∂±‡∑ä‚Äç‡∂∫','General_ta',1001,2,'./symfony/web/index.php/admin/companygeninfo','01.01.01','MOD001','searchEmployee'),(1003,'Organization Structure','‡∂Ü‡∂∫‡∂≠‡∂± ‡∂∞‡∑ñ‡∂ª‡∑è‡∑Ä‡∂Ω‡∑í‡∂∫','Company Structure_ta',1001,2,'./symfony/web/index.php/admin/listCompanyStructure','01.01.02','MOD001','searchEmployee,saveCompanyStructure'),(1004,'Job','‡∂ª‡∑ê‡∂ö‡∑í‡∂∫‡∑è‡∑Ä','Job_ta',1000,1,'#','01.02','MOD001','updatejob,sort'),(1005,'Service','‡∑É‡∑ö‡∑Ä‡∑è','Service_ta',1004,2,'./symfony/web/index.php/admin/listJobService','01.02.01','MOD001','updateJobService,saveJobService,deleteJobService'),(1006,'Grade','‡∑Å‡∑ä‚Äç‡∂ª‡∑ö‡∂´‡∑í‡∂∫','Grade_ta',1004,2,'./symfony/web/index.php/admin/listGrade','01.02.02','MOD001','saveGrade,UpdateGrade,deleteGrade'),(1007,'Class','‡∂¥‡∂Ç‡∂≠‡∑í‡∂∫','Class_ta',1004,2,'./symfony/web/index.php/admin/listClass','01.02.03','MOD001','updateClass,saveClass,deleteClass'),(1008,'Designation','‡∂≠‡∂±‡∂≠‡∑î‡∂ª','Job Title_ta',1004,2,'./symfony/web/index.php/admin/listJobTitle','01.02.04','MOD001','updateJobTitle,saveJobTitle,jobTitle,deleteJobTitle'),(1009,'Qualifications','‡∑É‡∑î‡∂Ø‡∑î‡∑É‡∑î‡∂ö‡∂∏‡∑ä','Qualifications_ta',1000,1,'#','01.03','MOD001',NULL),(1010,'Education','‡∂Ö‡∂∞‡∑ä‚Äç‡∂∫‡∑è‡∂¥‡∂±‡∂∫','Education_ta',1009,2,'./symfony/web/index.php/admin/listEducation','01.03.01','MOD001','updateEducation,saveEducation,deleteEducation'),(1011,'EB Exam Define','‡∂ä.‡∂∂‡∑ì ‡∑Ä‡∑í‡∂∑‡∑è‡∂ú','EB Exam Define_ta',1009,2,'./symfony/web/index.php/admin/listDefineEbexam','01.03.02','MOD001','saveEbExam,deleteEbExam'),(1012,'Skills','‡∂ö‡∑î‡∑É‡∂Ω‡∂≠‡∑è','Skills_ta',1009,2,'./symfony/web/index.php/admin/listSkill','01.03.03','MOD001','updateSkill,saveSkill,deleteSkill'),(1013,'Languages','‡∂∑‡∑è‡∑Ç‡∑è','Languages_ta',1009,2,'./symfony/web/index.php/admin/listLanguage','01.03.04','MOD001','saveLanguage,updateLanguage,deleteLanguage'),(1015,'Carder Plan','‡∑É‡∑ö‡∑Ä‡∂ö ‡∑É‡∑ê‡∂Ω‡∑ê‡∑É‡∑ä‡∂∏','Carder Plan _ta',18000,1,'./symfony/web/index.php/admin/carderPlan','18.12','MOD018','listCompanyStructure'),(1016,'Notice ','‡∂Ø‡∑ê‡∂±‡∑ä‡∑Ä‡∑ì‡∂∏‡∑ä','‡Æ®‡Øã‡Æü‡Øç‡Æü‡ØÄ‡Æ∏‡Øç',1000,1,'./symfony/web/index.php/admin/listNotice','01.05','MOD001','listNotice,saveNotice,deleteNotice'),(2000,'PIM','‡∂¥‡∑î‡∂Ø‡∑ä‡∂ú‡∂Ω ‡∂≠‡∑ú‡∂ª‡∂≠‡∑î‡∂ª‡∑î  ‡∂ö‡∑Ö‡∂∏‡∂±‡∑è‡∂ö‡∂ª‡∂´‡∂∫','√†¬Æ¬™√†¬Æ¬Ø√†¬Æ¬Æ√†¬Ø¬ç',0,0,'#','02.00','MOD002',NULL),(2001,'Employee List','‡∑É‡∑ö‡∑Ä‡∂ö ‡∂Ω‡∑ö‡∂õ‡∂±‡∂∫','Employee List_ta',2000,1,'./symfony/web/index.php/pim/list','02.01','MOD002','personalDetail,addEmployee,personalDetails,employeeList,Delete,list,deleteEmployee,Jpagination'),(2003,'Personal','‡∂¥‡∑î‡∂Ø‡∑ä‡∂ú‡∂Ω‡∑í‡∂ö','Personal_ta',2000,1,'#','02.03','MOD002',NULL),(2004,'Personal Details','‡∂¥‡∑î‡∂Ø‡∑ä‡∂ú‡∂Ω‡∑í‡∂ö ‡∂≠‡∑ú‡∂ª‡∂≠‡∑î‡∂ª‡∑î','Personal Details_ta',2003,2,'./symfony/web/index.php/pim/personalDetail','02.03.01','MOD002','personalDetails'),(2005,'Contact Details','‡∑É‡∂∂‡∂≥‡∂≠‡∑è ‡∑Ä‡∑í‡∑É‡∑ä‡∂≠‡∂ª','Contact Details_ta',2003,2,'./symfony/web/index.php/pim/contactDetail','02.03.02','MOD002',NULL),(2006,'Emergency Contact(s)','‡∑Ñ‡∂Ø‡∑í‡∑É‡∑í ‡∂Ö‡∑Ä‡∑É‡∑ä‡∂Æ‡∑è ‡∑É‡∂∂‡∂≥‡∂≠‡∑è','Emergency Contact(s)_ta',2003,2,'./symfony/web/index.php/pim/emeregencyContacts','02.03.04','MOD002','deleteEmergencyContacts'),(2007,'Dependents','‡∂∫‡∑ê‡∂¥‡∑ô‡∂±‡∑ä‡∂±‡∂±‡∑ä','Dependents_ta',2003,2,'./symfony/web/index.php/pim/dependents','02.03.03','MOD002','deleteDependents,updateDependent'),(2008,'Photograph','‡∂°‡∑è‡∂∫‡∑è‡∂ª‡∑ñ‡∂¥‡∂∫','Photograph_ta',2003,2,'./symfony/web/index.php/pim/photoGraph','02.03.05','MOD002','UpdatePhoto,deletePhoto'),(2009,'Employment','‡∑É‡∑ö‡∑Ä‡∑è‡∂±‡∑í‡∂∫‡∑î‡∂ö‡∑ä‡∂≠‡∑í‡∂∫','Employment_ta',2000,1,'#','02.04','MOD002',NULL),(2010,'Job','‡∂ª‡∑ê‡∂ö‡∑í‡∂∫‡∑è‡∑Ä','Job_ta',2009,2,'./symfony/web/index.php/pim/jobandSal','02.04.01','MOD002','listCompanyStructure,ActingWorkStation'),(2011,'Report-to','‡∂ª‡∂¥‡∑ù‡∂ª‡∑ä‡∂≠‡∑î‡∑Ä','Report-to_ta',2009,2,'./symfony/web/index.php/pim/reportTo','02.04.02','MOD002','searchEmployee,reportTo,updateReportTo,deleteSubordinates,deleteSupervisors'),(2012,'Service Record','‡∑É‡∑ö‡∑Ä‡∑è ‡∑É‡∂ß‡∑Ñ‡∂±‡∑ä ','Service Record_ta',2009,2,'./symfony/web/index.php/pim/serviceRecord','02.04.03','MOD002','serviceRecord,UpdatServiceRec,DeleteServiceRecord,'),(2013,'Qualifications','‡∑É‡∑î‡∂Ø‡∑î‡∑É‡∑î‡∂ö‡∂∏‡∑ä','Qualifications_ta',2000,1,'#','02.05','MOD002',NULL),(2014,'Work experience','‡∂¥‡∑Ö‡∂¥‡∑î‡∂ª‡∑î‡∂Ø‡∑ä‡∂Ø','Work experience_ta',2013,2,'./symfony/web/index.php/pim/workexperience','02.05.01','MOD002',NULL),(2015,'Education','‡∂Ö‡∂∞‡∑ä‚Äç‡∂∫‡∑è‡∂¥‡∂±‡∂∫','Education_ta',2013,2,'./symfony/web/index.php/pim/education','02.05.02','MOD002','deleteEducation'),(2016,'Skills','‡∂ö‡∑î‡∑É‡∂Ω‡∂≠‡∑è','Skills_ta',2013,2,'./symfony/web/index.php/pim/skills','02.05.03','MOD002','deleteSkill'),(2017,'Languages','‡∂∑‡∑è‡∑Ç‡∑è','Languages_ta',2013,2,'./symfony/web/index.php/pim/SaveLanguages','02.05.04','MOD002','deleteLanguages'),(2018,'License','‡∂∂‡∂Ω‡∂¥‡∂≠‡∑ä‚Äç‡∂ª‡∂∫','License_ta',2013,2,'./symfony/web/index.php/pim/license','02.05.05','MOD002','deleteLicense'),(2019,'EB Exam','‡∂ä.‡∂∂‡∑ì ‡∑Ä‡∑í‡∂∑‡∑è‡∂ú','EB Exam_ta',2013,2,'./symfony/web/index.php/pim/empEbexam','02.05.06','MOD002','loadEbExamGrid,deleteEmpEbExams'),(2020,'Other','‡∑Ä‡∑ô‡∂±‡∂≠‡∑ä','Other_ta',2000,1,'#','02.06','MOD002',NULL),(2021,'Attachments','‡∂á‡∂∏‡∑í‡∂´‡∑î‡∂∏‡∑ä','Attachmentsn_ta',2020,2,'./symfony/web/index.php/pim/Attachment','02.06.01','MOD002','UpdateAttachment,viewAttachment,deleteAttachments,Attachment,GetAttachmentDetails,updateAttachment'),(2022,'Disciplinary Action','‡∑Ä‡∑í‡∂±‡∂∫','‡Æ≥‡Æï‡Æ≥‡Æ©‡Æï‡Æ≥',2020,2,'./symfony/web/index.php/pim/disciplinaryAction','02.06.02','MOD002','saveDisPlinaryaction,deleteDisAction'),(3000,'Welfare & Benefit','‡∂Ö‡∂ª‡∑ä‡∂Æ‡∑É‡∑è‡∂∞‡∂ö ‡∑Å‡∑î‡∂∑‡∑É‡∑è‡∂∞‡∂ö','welfare & Benefit_ta',0,0,'#','03.00','MOD003',NULL),(3001,'Define Type','‡∑Å‡∑î‡∂∑‡∑É‡∑è‡∂∞‡∂ö ‡∑Ä‡∂ª‡∑ä‡∂ú ‡∂±‡∑í‡∂ª‡∑ä‡∑Ä‡∂†‡∂±‡∂∫','Define Type_ta',3000,1,'./symfony/web/index.php/wbm/BenifitType','03.01','MOD003','UpdateBenifitType,SaveBenifitType,DeleteBeniftType,BenifitType'),(3002,'Define Benefit','‡∑Å‡∑î‡∂∑‡∑É‡∑è‡∂∞‡∂ö ‡∂±‡∑í‡∂ª‡∑ä‡∑Ä‡∂†‡∂±‡∂∫','Define Benefit_ta',3000,1,'./symfony/web/index.php/wbm/Benifit','03.02','MOD003','UpdateBenifit,SaveBenifit,DeleteBenift,Benifit'),(3003,'Benefit Disbursement','‡∑Å‡∑î‡∂∑‡∑É‡∑è‡∂∞‡∂ö ‡∑Ä‡∑í‡∂∫‡∂¥‡∑ê‡∑Ñ‡∑ê‡∂Ø‡∂∏','Benefit Disbursement_ta',3000,1,'./symfony/web/index.php/wbm/Disbusement','03.03','MOD003','UpdateDisbusement,SaveDisbusement,DeleteDisbusement,searchEmployee,Checkbtype,Disbusement'),(4000,'Disciplinary','‡∑Ä‡∑í‡∂±‡∂∫','Disciplinary_ta',0,0,'#','04.00','MOD004',NULL),(4001,'Disciplinary Type','‡∑Ä‡∑í‡∂±‡∂∫ ‡∂¥‡∑í‡∂Ω‡∑í‡∂∂‡∂≥ ‡∂ö‡∑ä‚Äç‡∂ª‡∑í‡∂∫‡∑è‡∂∏‡∑è‡∂ª‡∑ä‡∂ú ','Define type_ta',4000,1,'./symfony/web/index.php/disciplinary/actiontype','04.01','MOD004','saveActiontype,UpdateActiontype,DeleteActionType'),(4002,'Disciplinary Sub Type','‡∑Ä‡∂ª‡∂Ø ‡∂±‡∑í‡∂ª‡∑ä‡∑Ä‡∂†‡∂±‡∂∫ ','Define Offence_ta',4000,1,'./symfony/web/index.php/disciplinary/actions','04.02','MOD004','UpdateActions,SaveActions,DeleteActions'),(4003,'Incident Reporting','‡∑É‡∑í‡∂Ø‡∑ä‡∂∞‡∑í ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏','Incident Reporting_ta',4000,1,'./symfony/web/index.php/disciplinary/SaveInsident','4.04000','MOD004','SaveInsident,Loadoffence,searchEmployee,LoadGrid'),(4004,'Incident Summary','‡∑É‡∑í‡∂Ø‡∑ä‡∂∞‡∑í ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫','Incident Summary_ta',4000,1,'./symfony/web/index.php/disciplinary/IncidentSummary','4.05000','MOD004','UpdateInsident,searchEmployee,GetListedEmpids,LoadGrid,Loadoffence,ImagePopup,Deleteimage,empDisHistory,DeleteActionType,DeleteIncident'),(4005,'Pending Inquiry Summary',' ‡∑Ä‡∑í‡∑É‡∂Ø‡∑ì‡∂∏‡∂ß ‡∂≠‡∑í‡∂∂‡∑ô‡∂± ‡∑Ä‡∑í‡∂∏‡∂ª‡∑ä‡∑Å‡∂± ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫ ','‡Æ≥‡Æ©‡Æ≥ ‡Æ©‡Æï ‡Æ©',4000,1,'./symfony/web/index.php/disciplinary/PendingInqSummary','4.06000','MOD004','UpdateInsidentlevel2,searchEmployee,GetListedEmpids,LoadGrid,Loadoffence,ImagePopup,Deleteimage,UpdateInsidentlevel2,Deleteimage,DeleteimageInquery,empDisHistory,DeleteActionType'),(4006,'Closed Incident Summary','‡∂Ö‡∑Ä‡∑É‡∂±‡∑ä ‡∑É‡∑í‡∂Ø‡∑ä‡∂∞‡∑í ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫','Closed Incident Summary_ta',4000,1,'./symfony/web/index.php/disciplinary/ClosedIncidents','4.07000','MOD004','ClosedIncidents,SummeryDis'),(4007,'Final Action','‡∂Ö‡∑Ä‡∑É‡∂±‡∑ä ‡∂ö‡∑ä‚Äç‡∂ª‡∑í‡∂∫‡∑è‡∑Ä','Final Action_ta',4000,1,'./symfony/web/index.php/disciplinary/FinalAction','4.03000','MOD004','SaveFinalAction,UpdateFinalAction,DeleteFinalAction'),(4008,'Reinstatement','‡∂±‡∑ê‡∑Ä‡∂≠ ‡∑É‡∑ö‡∑Ä‡∂∫‡∑ö ‡∂¥‡∑í‡∑Ñ‡∑í‡∂ß‡∑î‡∑Ä‡∑ì‡∂∏','Reinstatement_ta',4000,1,'./symfony/web/index.php/disciplinary/Reinstatement','4.08000','MOD004','Reinstatement,UpdateReinstatement,DeleteReinstatement,AjaxCall,DisplayEmpHirache,LoadGradeSlot,SearchEmployee'),(5000,'Training & Development','‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î‡∑Ä ‡∑Ñ‡∑è ‡∑É‡∂Ç‡∑Ä‡∂ª‡∑ä‡∂∞‡∂±‡∂∫','Training & Development_ta',0,0,'#','05.00','MOD005',NULL),(5001,'Training Institutes','‡∂Ü‡∂∫‡∂≠‡∂± ‡∂±‡∑í‡∂ª‡∑ä‡∑Ä‡∂†‡∂±‡∂∫','Define Institute_ta',5000,1,'./symfony/web/index.php/training/defineinstitute','05.01','MOD005','Updateinstitute,Saveinstitute,error,Deleteinstitute'),(5002,'Training Courses','‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î‡∑Ä ‡∂±‡∑í‡∂ª‡∑ä‡∑Ä‡∂†‡∂±‡∂∫','Define Training_ta',5000,1,'./symfony/web/index.php/training/CourseList','05.02','MOD005','UpdateCourse,SaveCourse,DeleteCourse'),(5003,'Assign For Training','‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î‡∑Ä ‡∑Ä‡∑ô‡∂±‡∑ä ‡∂ö‡∂ª‡∂±‡∑Ä‡∑è','Assign For Training_ta',5000,1,'./symfony/web/index.php/training/assigntrain','05.03','MOD005','assigntrain,ajaxloadcourse,checkcourse,trainingHistory,deleteSavedTrain,GetListedEmpids,searchEmployee,LoadGrid'),(5006,'Training Participation Summary','‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î‡∑Ä‡∂ß ‡∑É‡∑Ñ‡∂∑‡∑è‡∂ú‡∑ì ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫','Training Participation Summary_ta',5000,1,'./symfony/web/index.php/training/participateSummery','05.06','MOD005','trainingHistory,Deletetrainassiged,participations'),(5007,'Training summary','‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫','Training summary_ta',5000,1,'./symfony/web/index.php/training/trainsummery','05.07','MOD005','trainsummery,trainingHistory,Deletetrainassiged'),(5010,'Training Record','‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î ‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è‡∑Ä','Training Record_ta',5000,1,'./symfony/web/index.php/training/SummeryTrainRecord/user/Ess','05.10','MOD005','SummeryTrainRecord,UpdateTrainRecord,NewEmpTrainRecord,ajaxloadcourse,CheckUserthere,DeleteTrainRecord'),(5011,'Training Record FeedBack','‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î ‡∂¥‡∑ä‚Äç‡∂ª‡∂≠‡∑í‡∂†‡∑è‡∂ª‡∂∫','Training Record FeedBack_ta',5000,1,'./symfony/web/index.php/training/SummeryTrainRecordAdmin','05.11','MOD005','UpdateTrainRecord,NewEmpTrainRecord,ajaxloadcourse,CheckUserthere,DeleteTrainRecord'),(5012,'Training Directory','‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î ‡∂±‡∑è‡∂∏‡∑è‡∑Ä‡∂Ω‡∑í‡∂∫','Training Directory_ta',5000,1,'./symfony/web/index.php/training/TraininDirectory','05.12','MOD005','TraininDirectory,SaveTrainRequest,ajaxloadcourse,LoadEmployeeDetails,CheckTrainAssign'),(5013,'Training Plan','‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î ‡∑É‡∑ê‡∂Ω‡∑ê‡∑É‡∑ä‡∂∏','‡Æ©‡Æï‡Æï‡Æ© ‡Æ™‡Æï‡Æ™‡Æï ‡Æ™‡Æï',5000,1,'./symfony/web/index.php/training/TrainingPlanList','05.13','MOD005','TraininPlan,DeleteTrainingPlan,DeleteTrainingPlan'),(5014,'My Training History','‡∂∏‡∑è‡∂ú‡∑ô ‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î ‡∑Ä‡∑í‡∑É‡∑ä‡∂≠‡∂ª','‡Æ≥‡Æ©  ‡Æ≥‡Æ©  ‡Æ≥‡Æ© ',5000,1,'./symfony/web/index.php/training/trainingHistory','05.14','MOD005',NULL),(5015,'Training Calander ','‡∂¥‡∑î‡∑Ñ‡∑î‡∂´‡∑î ‡∂Ø‡∑í‡∂± ‡∂Ø‡∂ª‡∑ä‡∑Å‡∂±‡∂∫','Training Calander_ta',5000,1,'./symfony/web/index.php/training/Calander','05.15','MOD005','Calander'),(6000,'Promotion','‡∂ã‡∑É‡∑É‡∑ä ‡∑Ä‡∑ì‡∂∏','Promotion_ta',0,0,'#','06.00','MOD006',NULL),(6001,'Promotion Method','‡∂ã‡∑É‡∑É‡∑ä ‡∑Ä‡∑ì‡∂∏‡∑ä ‡∑Ä‡∂ª‡∑ä‡∂ú','Promotion Method_ta',6000,1,'./symfony/web/index.php/promotion/promotionMethod','06.01','MOD006','updatePromotionMethod,savePromotionMethod,DeletePromotionMethod'),(6002,'Promotion','‡∂ã‡∑É‡∑É‡∑ä ‡∑Ä‡∑ì‡∂∏','Promotion_ta',6000,1,'./symfony/web/index.php/promotion/listPromotion','06.02','MOD006','listPromotion,ListPromotion,savePromotion,updatePromotion,DeletePromotion,searchEmployee,AjaxCall,deletepop,DateValidation,empDisHistory'),(6003,'Probationers Check List','‡∂¥‡∑í‡∂ª‡∑í‡∂ö‡∑ä‡∑É‡∑î‡∂∏‡∑ä ‡∂Ω‡∑ê‡∂∫‡∑í‡∑É‡∑ä‡∂≠‡∑î‡∑Ä','Promotion Check List_ta',6000,1,'./symfony/web/index.php/promotion/promotioncklist','06.03','MOD006','promotioncklist,updatePromotioncklist,savePromotioncklist,DeletePromotioncklist'),(6004,'Probationers','‡∂¥‡∂ª‡∑í‡∑Ä‡∑è‡∑É‡∑í‡∂ö','Probationers_ta',6000,1,'./symfony/web/index.php/promotion/probationlist','06.04','MOD006','probationlist,checklist'),(6005,'Other Institutions','‡∑Ä‡∑ô‡∂±‡∂≠‡∑ä ‡∂Ü‡∂∫‡∂≠‡∂±','Other Institutions_ta',6000,1,'./symfony/web/index.php/promotion/OtherInstitution','06.05','MOD006','OtherInstitution,UpdateOtherInstitution,DeleteOtherInstitution'),(6006,'Promotion History','‡∂ã‡∑É‡∑É‡∑ä ‡∑Ä‡∑ì‡∂∏ ‡∂â‡∂≠‡∑í‡∑Ñ‡∑è‡∑É‡∂∫','Promotion History_ta',6000,1,'./symfony/web/index.php/promotion/HistoryPromotion','06.06','MOD006','HistoryPromotion,searchEmployee,EBExam'),(7000,'Retirement','‡∑Ä‡∑í‡∑Å‡∑ä‚Äç‡∂ª‡∑è‡∂∏','Retirement_ta',0,0,'#','07.00','MOD007',NULL),(7001,'Service Extension','‡∑É‡∑ö‡∑Ä‡∑è ‡∂Ø‡∑í‡∂ú‡∑î‡∑Ä','Service Extension_ta',7000,1,'./symfony/web/index.php/retirement/retirement','07.01','MOD007','retirement,retirementserviceextension,searchEmployee,AjaxCall,DeleteRetirement,AjaxCalllast,deleteRet'),(8000,'Attendance','‡∂¥‡∑ê‡∂∏‡∑í‡∂´‡∑ì‡∂∏','Attendance_ta',0,0,'#','08.00','MOD008',NULL),(8001,'Define Day Types','‡∂Ø‡∑í‡∂± ‡∑Ä‡∂ª‡∑ä‡∂ú','Define Day Types_ta',8000,1,'./symfony/web/index.php/attendance/AttendanceDay','08.01','MOD008','AttendanceDay'),(8002,'Download Configuration ','‡∂∑‡∑è‡∂ú‡∂≠ ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏ ‡∑Ñ‡∑ê‡∂©‡∂ú‡∑É‡∂±‡∑Ä‡∑è','Download Configuration_ta',8000,1,'./symfony/web/index.php/attendance/DownloadConfiguration','08.02','MOD008',NULL),(8003,'Data Upload ','‡∂Ø‡∂≠‡∑ä‡∂≠ ‡∂ã‡∂©‡∑î‡∂ú‡∂≠ ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏','Data Upload_ta',8000,1,'./symfony/web/index.php/attendance/Text','08.03','MOD008','process,dataProcess'),(8004,'Employee Attendance Summary','‡∑É‡∑ö‡∑Ä‡∂ö ‡∂¥‡∑ê‡∂∏‡∑í‡∂´‡∑ì‡∂∏‡∑ä ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫','Employee Attendance Summary_ta',8000,1,'./symfony/web/index.php/attendance/Process','08.04','MOD008','Process,ajaxTableLock,Savedata,searchEmployee'),(9000,'Knowledge Base','‡∂Ø‡∑ê‡∂±‡∑î‡∂∏‡∑ä ‡∂¥‡∂Ø‡∑ä‡∂∞‡∂≠‡∑í‡∂∫','Knowledge Base_ta',0,0,'#','09.00','MOD009',NULL),(9001,'Define Document Type/Group',' ‡∂Ω‡∑ö‡∂õ‡∂± ‡∂±‡∑í‡∂ª‡∑ä‡∑Ä‡∂†‡∂±‡∂∫ ','Define Document Type/Group_ta',9000,1,'./symfony/web/index.php/knw/DocumentType','09.01','MOD009','SaveDocumentType,UpdateDocumentType,DocumentType,DeleteDocumentType'),(9002,'Attach Document','‡∂Ö‡∂∏‡∑î‡∂´‡∂± ‡∂Ω‡∑ö‡∂õ‡∂±','Attach Document_ta',9000,1,'./symfony/web/index.php/knw/Attachment','09.02','MOD009','SaveAttachment,Attachment,UpdateAttachment,imagepop,readArticle,DeleteAttachment,deletepop'),(9003,'Use Knowledge Base','‡∂Ø‡∑ê‡∂±‡∑î‡∂∏‡∑ä ‡∂¥‡∑è‡∑Ä‡∑í‡∂†‡∑ä‡∂†‡∑í‡∂∫','Use Knowledge Base_ta',9000,1,'./symfony/web/index.php/knw/Knowledgebase','09.03','MOD009','Knowledgebase,imagepop,readArticle'),(9004,'Knowledge Share','‡∂Ø‡∑ê‡∂±‡∑î‡∂∏‡∑ä ‡∂∂‡∑ô‡∂Ø‡∑è‡∂ú‡∑ê‡∂±‡∑ì‡∂∏','Knowledge Share_ta',9000,1,'./symfony/web/index.php/knw/SaveArticle','09.04','MOD009','SaveArticle'),(10000,'Transfer','‡∂∏‡∑è‡∂ª‡∑î‡∑Ä‡∑ì‡∂∏','Transfer_ta',0,0,'#','10.00','MOD010',NULL),(10001,'Transfer Reason','‡∂∏‡∑è‡∂ª‡∑î‡∑Ä‡∑ì‡∂∏ ‡∑Ä‡∂ª‡∑ä‡∂ú','Trans Reason_ta',10000,1,'./symfony/web/index.php/transfer/TransferReason','10.01','MOD010','SaveTransferReason,DeleteTransferReason'),(10002,'Transfer Request Admin','‡∂∏‡∑è‡∂ª‡∑î‡∑Ä‡∑ì‡∂∏ ‡∂â‡∂Ω‡∑ä‡∂Ω‡∑ì‡∂∏ ‡∂¥‡∂ª‡∑í‡∂¥‡∑è‡∂Ω‡∂±','Transfer Request Admin_ta',10000,1,'./symfony/web/index.php/transfer/TransferRequestAdmin','10.02','MOD010','TransferRequestAdmin,SaveTransferRequestAdmin,listCompanyStructure,searchEmployee'),(10003,'Transfers Details','‡∂±‡∑Ä ‡∂∏‡∑è‡∂ª‡∑î‡∑Ä‡∑ì‡∂∏','New Transfer_ta',10000,1,'./symfony/web/index.php/transfer/TransferDetail','10.03','MOD010','TransferDetail,SaveTransferDetail,AjaxCall,DateValidation,imagepop,searchEmployee,listCompanyStructure,DeleteTransfer,RecordCheck,Imagepop,DeleteImage'),(10004,'Transfer Request','‡∂∏‡∑è‡∂ª‡∑î‡∑Ä‡∑ì‡∂∏‡∑ä ‡∂â‡∂Ω‡∑ä‡∂Ω‡∑ì‡∂∏','Transfer Request_ta',10000,1,'./symfony/web/index.php/transfer/TransferRequest','10.02','MOD010','TransferRequest,SaveTransferRequest,listCompanyStructure,searchEmployee'),(12000,'Leave','‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î','Leave_ta',0,0,'#','12.00','MOD012',NULL),(12001,'Deifne Leave Type','‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î ‡∂±‡∑í‡∂ª‡∑ä‡∑Ä‡∂†‡∂±‡∂∫','Deifne Leave Type_ta',12000,1,'./symfony/web/index.php/Leave/DocumentType','12.01','MOD012','UpdateDocumentType,SaveDocumentType,DeleteDocumentType'),(12002,'Define Holiday','‡∂ã‡∂≠‡∑ä‡∑É‡∑Ä ‡∂Ø‡∑í‡∂± ‡∂±‡∑í‡∂ª‡∑ä‡∑Ä‡∂†‡∂±‡∂∫','Define HolyDay Ta',12000,1,'./symfony/web/index.php/Leave/Holyday','12.02','MOD012','Holyday,UpdateHolyday,SaveHolyday,DeleteHolyday'),(12003,'Leave Configuration','‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î ‡∂ª‡∑ñ‡∂¥‡∂´‡∂∫','Leave Configuration_ta',12000,1,'./symfony/web/index.php/Leave/LeaveConfiguration','12.03','MOD012','LeaveConfiguration,DTConfig'),(12004,'Leave Entitlement','‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î ‡∑Ñ‡∑í‡∂∏‡∑í‡∂ö‡∂∏','Leave Entitlement_ta',12000,1,'./symfony/web/index.php/Leave/Entitlement','12.04','MOD012','UpdateEntitlement,SaveEntitlement,searchEmployee,AjaxDaysload,AjaxEmpType,LoadGrid,DeleteEntitlement'),(12005,'Apply Leave','‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î ‡∂â‡∂Ω‡∑ä‡∂Ω‡∑î‡∂∏‡∑ä ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏','Apply Leave_ta',12000,1,'./symfony/web/index.php/Leave/SaveLeave','12.05','MOD012','AjaxLeaveValidation,AjaxLeaveHolydayValidation,SaveLeave,Leave,searchEmployee,UpdateLeave'),(12006,'Leave Summary','‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫','Leave Summary_ta',12000,1,'./symfony/web/index.php/Leave/LeaveSearch','12.06','MOD012','searchEmployee'),(12007,'Team Leave Application','‡∂ö‡∂´‡∑ä‡∂©‡∑è‡∂∫‡∂∏‡∑ä ‡∂±‡∑í‡∑Ä‡∑è‡∂©‡∑î ‡∂â‡∂Ω‡∑ä‡∂Ω‡∑î‡∂∏‡∑ä ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏','Apply Leave User_ta',12000,1,'./symfony/web/index.php/Leave/SaveLeaveuser','12.07','MOD012','Dates,FormatDates,AjaxDaysload,EmpData,DefaultLeavedetails,AjaxEmpType,AjaxLeaveValidation,AjaxLeaveHolydayValidation,AjaxLeavecoveringEmployee,SaveLeaveuser,UpdateLeave,LeaveSearch,SaveLeaveApprove,searchEmployee,Leave'),(13000,'Security','‡∂Ü‡∂ª‡∂ö‡∑ä‡∑Ç‡∂ö ‡∂¥‡∂Ø‡∑ä‡∂∞‡∂≠‡∑í‡∂∫','Security_ta',0,0,'#','13.00','MOD013',NULL),(13001,'Users','‡∂¥‡∑è‡∑Ä‡∑í‡∂†‡∑ä‡∂†‡∑í‡∂∫','Users_ta',13000,1,'./symfony/web/index.php/admin/listUser/isAdmin/Yes','13.01','MOD013','saveUser,updateUser,listUser,deleteUser'),(13002,'Capability','‡∑Å‡∂ö‡∑ä‚Äç‡∂∫‡∂≠‡∑è‡∑Ä','Capability_ta',13000,1,'./symfony/web/index.php/security/capability','13.02','MOD013','saveCapability,DeleteCapabilities'),(13003,'Menu Capability','‡∂∏‡∑ô‡∂±‡∑î ‡∑Å‡∂ö‡∑ä‚Äç‡∂∫‡∂≠‡∑è‡∑Ä','Menu Capability_ta',13000,1,'./symfony/web/index.php/security/menucapability','13.03','MOD013','menucapability,checkOrderSet,LoadMenus'),(13004,'Employee Capability','‡∑É‡∑ö‡∑Ä‡∂ö ‡∑Å‡∂ö‡∑ä‚Äç‡∂∫‡∂≠‡∑è‡∑Ä','Employee Capability_ta',13000,1,'./symfony/web/index.php/security/employeecapability','13.04','MOD013','employeecapability,searchEmployee,GetListedEmpids,deleteSavedTrain,employeecapability,LoadGrid,ajaxloadcourse,GetListedEmpids,deleteAssignedCapability'),(13005,'Unlock Records','‡∂Ö‡∂ú‡∑î‡∑Ö‡∑î ‡∂â‡∑Ä‡∂≠‡∑ä‡∂ö‡∂ª‡∂±‡∑Ä‡∑è','Unlock Records_ta',13000,1,'./symfony/web/index.php/security/unlockRecords','13.05','MOD013','unlockRecords,capability,deleteLocks'),(13006,'Report Capability','‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è ‡∑Å‡∂ö‡∑ä‚Äç‡∂∫‡∂≠‡∑è‡∑Ä','Report Capability_TA',13000,1,'./symfony/web/index.php/security/reportCapability','13.06','MOD013',NULL),(13007,'Payroll process capability ','‡∂¥‡∂©‡∑í‡∂¥‡∂≠ ‡∑É‡∑ê‡∂ö‡∑É‡∑ì‡∂∏‡∑ö ‡∑Å‡∂ö‡∑ä‚Äç‡∂∫‡∂≠‡∑è‡∑Ä','Payroll process capability ',13000,1,'./symfony/web/index.php/security/PayprocessCapability','13.07','MOD013',NULL),(14000,'ESS','‡∑É‡∑ö‡∑Ä‡∂ö ‡∑É‡∑ä‡∑Ä‡∂∫‡∂Ç ‡∑É‡∑ö‡∑Ä‡∑è‡∑Ä','√†¬Æ≈Ω√†¬Æ¬∏√†¬Ø¬ç',0,0,'./symfony/web/index.php/ESS/index','14.00','MOD014',NULL),(15000,'Reports','‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è','Reports_TA',0,0,'#','15.00','MOD015',NULL),(15001,'View Reports','‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è ‡∂∂‡∑ê‡∂Ω‡∑ì‡∂∏','View Reports_TA',15000,1,'./symfony/web/index.php/report/viewReportList','15.01','MOD015','viewReportData'),(15002,'Level','‡∂≠‡∂ª‡∑è‡∂≠‡∑í‡∂ª‡∂∏','Level_ta',1004,2,'./symfony/web/index.php/admin/Level','01.02.05','MOD001','SaveLevel,DeleteLevel,UpdateLevel'),(15003,'Job Role','‡∂ö‡∑è‡∂ª‡∑ä‡∂∫‡∂∑‡∑è‡∂ª‡∂∫','Job Role_ta',1004,2,'./symfony/web/index.php/admin/JobRole','01.02.06','MOD001','SaveJobRole,DeleteJobRole'),(16000,'Performance ','‡∂ö‡∑è‡∂ª‡∑ä‡∂∫ ‡∑É‡∑è‡∂∞‡∂±‡∂∫ ','Performance_TA ',0,0,'#','16.00','MOD016',NULL),(16001,'Duty Group ','‡∑Ä‡∑è‡∂ª‡∑ä‡∂≠‡∑è ‡∂∂‡∑ê‡∂Ω‡∑ì‡∂∏ ','Duty Group_TA ',16000,1,'./symfony/web/index.php/performance/DutyGroup','16.01','MOD016','SaveDutyGroup,DeleteDutyGroup,UpdateDutyGroup'),(16002,'Duty ','‡∂ª‡∑è‡∂¢‡∂ö‡∑è‡∂ª‡∑í‡∂∫','Duty Group_TA ',16000,1,'./symfony/web/index.php/performance/Duty','16.02','MOD016','SaveDuty,DeleteDuty,UpdateDuty'),(16003,'Rating Method ','‡∑Ä‡∂ß‡∑í‡∂±‡∑è‡∂ö‡∂∏ ‡∂∏‡∑ê‡∂± ‡∂∂‡∑ê‡∂Ω‡∑ì‡∂∏ ','Rating Method TA ',16000,1,'./symfony/web/index.php/performance/Rate','16.02','MOD016','SaveRate,DeleteRate,UpdateRate'),(16004,'Company Evaluation ','‡∑É‡∂∏‡∑è‡∂ú‡∂∏‡∑ä ‡∂á‡∂ú‡∂∫‡∑ì‡∂∏‡∑ä','Company Evaluation TA ',16000,1,'./symfony/web/index.php/performance/CompanyEvaluationInfo','16.04','MOD016','SaveCompanyEvaluationInfo,DeleteCompanyEvaluationInfo,UpdateCompanyEvaluationInfo'),(16005,'Evaluation ','‡∂á‡∂ú‡∂∫‡∑ì‡∂∏‡∑ä','Evaluation TA ',16000,1,'./symfony/web/index.php/performance/Evaluation','16.05','MOD016','SaveEvaluation,DeleteEvaluation,UpdateEvaluation'),(16006,'Assign Employee ','‡∑É‡∑ö‡∑Ä‡∂ö‡∂∫‡∂±‡∑ä ‡∂ë‡∂ö‡∑ä ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏','Assign Employee TA ',16000,1,'./symfony/web/index.php/performance/SaveAssingEmployee','16.06','MOD016','SaveAssingEmployee,DeleteAssingEmployee,UpdateAssingEmployee,searchEmployee,LoadGrid'),(16007,'Assign Supervisor  ','‡∂Ö‡∂Ø‡∑ì‡∂ö‡∑ä‡∑Ç‡∂ö ‡∂ë‡∂ö‡∑ä ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏','Assign Supervisor TA ',16000,1,'./symfony/web/index.php/performance/SaveSupervisor','16.07','MOD016','SaveSupervisor,DeleteSupervisor,UpdateSupervisor,searchEmployee'),(16008,'Evaluate ','‡∂á‡∂ú‡∂∫‡∑î‡∂∏','Evaluation TA ',16000,1,'./symfony/web/index.php/performance/SDOEvaluation','16.08','MOD016','SaveSDOEvaluation,DeleteSDOEvaluation,UpdateSDOEvaluation'),(17000,'Work Flow','‡∂Ö‡∂±‡∑î‡∂∏‡∂≠ ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏‡∑ä','Work Flow',0,0,'#','17.00000','MOD017',NULL),(17001,'Approval Groups','‡∂Ö‡∂±‡∑î‡∂∏‡∂≠ ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏‡∑ö ‡∂ö‡∂´‡∑ä‡∂©‡∑è‡∂∫‡∂∏‡∑ä','Approval Groups_ta',17000,1,'./symfony/web/index.php/workflow/approvalGroupsSummary','17.01000','MOD017','SaveAppGroup,DeleteGrpApp'),(17002,'Approval Summary','‡∂Ö‡∂±‡∑î‡∂∏‡∂≠ ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏‡∑ö ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫.','Approval Summary',17000,1,'./symfony/web/index.php/workflow/ApprovalSummary','17.02000','MOD017',NULL),(17003,'Assign For Group','‡∂ö‡∂´‡∑ä‡∂©‡∑è‡∂∫‡∂∏‡∑ä ‡∑É‡∂Ø‡∑Ñ‡∑è ‡∂Ö‡∂±‡∑î‡∂∫‡∑î‡∂ö‡∑ä‡∂≠ ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏‡∑ä','Assign For Group',17000,1,'./symfony/web/index.php/workflow/AssignToGroup','17.03000','MOD017',NULL),(18000,'Recruitment ','‡∂Ö‡∂Ω‡∑î‡∂≠‡∑ô‡∂±‡∑ä ‡∂∂‡∂≥‡∑Ä‡∑è ‡∂ú‡∑ê‡∂±‡∑ì‡∂∏‡∑ä ','Recruitment_TA ',0,0,'#','16.00','MOD018',NULL),(18001,'Vacancy Request ','‡∂¥‡∑î‡∂ª‡∂¥‡∑ä‡∂¥‡∑è‡∂©‡∑î ‡∂â‡∂Ω‡∑ä‡∂Ω‡∑î‡∂∏‡∑ä ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏‡∑ö ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫ ','Request Summary - HR_TA ',18000,1,'./symfony/web/index.php/recruitment/VacancyRequestWork','18.01','MOD018','SaveVacancyRequest,DeleteVacancyRequest,UpdateVacancyRequest,UpdateVacancyRequestStatus'),(18002,'Vacancy Request Summary - HR ','‡∂¥‡∑î‡∂ª‡∂¥‡∑ä‡∂¥‡∑è‡∂©‡∑î ‡∂â‡∂Ω‡∑ä‡∂Ω‡∑î‡∂∏‡∑ä ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏‡∑ö ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫ - ‡∂∏‡∑è‡∂±‡∑Ä ‡∑É‡∂∏‡∑ä‡∂¥‡∂≠‡∑ä ','Request Summary - HR_TA ',18000,1,'./symfony/web/index.php/recruitment/HRVacancyRequest','18.02','MOD018','UpdateHRVacancyRequest,ajaxTableLockCandidate,UpdateHRInterviewRequest,SubmitHRVacancyRequest,ajaxTableLock'),(18003,'Vacancy Request Summary - DG ','‡∂¥‡∑î‡∂ª‡∂¥‡∑ä‡∂¥‡∑è‡∂©‡∑î ‡∂â‡∂Ω‡∑ä‡∂Ω‡∑î‡∂∏‡∑ä ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏‡∑ö ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫ - ‡∂Ö‡∂∞‡∑ä‚Äç‡∂∫‡∂ö‡∑ä‡∑Ç ‡∂¢‡∂±‡∂ª‡∑è‡∂Ω‡∑ä ','Request Summary - DG_TA ',18000,1,'./symfony/web/index.php/recruitment/DGVacancyRequest','18.03','MOD018','SubmitDGVacancyRequest,ajaxTableLockCandidate,UpdateDGVacancyRequest'),(18004,'Overall Vacancy Request Summary ','‡∂¥‡∑î‡∂ª‡∂¥‡∑ä‡∂¥‡∑è‡∂©‡∑î ‡∂â‡∂Ω‡∑ä‡∂Ω‡∑î‡∂∏‡∑ä ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏‡∑ö ‡∑É‡∂∏‡∑É‡∑ä‡∂≠ ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫ ','Overall Request Summary_TA ',18000,1,'./symfony/web/index.php/recruitment/OverallVacancyRequest','18.04','MOD018','UpdateOverallVacancyRequest,OverallVacancyRequest,SubmitOverallVacancyRequest'),(18005,'Vacancy Requisition ','‡∂¥‡∑î‡∂ª‡∂¥‡∑ä‡∂¥‡∑è‡∂©‡∑î ‡∂±‡∑í‡∂ª‡∑ä‡∑Ä‡∂†‡∂± ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫ ','Define Vacancy Requisition_TA ',18000,1,'./symfony/web/index.php/recruitment/VacancyRequisition','18.05','MOD018','SaveVacancyRequisition,DeleteVacancyRequisition'),(18006,'Advertisement ','‡∂Ø‡∑ê‡∂±‡∑ä‡∑Ä‡∑ì‡∂∏ ‡∂±‡∑í‡∂ª‡∑ä‡∑Ä‡∂†‡∂±‡∂∫ ','Define Advertisement_TA ',18000,1,'./symfony/web/index.php/recruitment/Advertisement','18.06','MOD018','SaveAdvertisement,DeleteAdvertisement'),(18007,'Finalized Vacancy Summary ','‡∂Ö‡∑Ä‡∑É‡∂±‡∑ä‡∑Ä‡∑ñ ‡∂Ø‡∑ê‡∂±‡∑ä‡∑Ä‡∑ì‡∂∏ ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫ ','Finalized Vacancy Summary_TA ',18000,1,'./symfony/web/index.php/recruitment/FinalizedVacancy','18.07','MOD018','Candidate,SaveCandidate,DeleteCandidate'),(18008,'Candidate Interview  ','‡∑É‡∂∏‡∑ä‡∂∏‡∑î‡∂õ ‡∂¥‡∂ª‡∑ì‡∂ö‡∑ä‡∑Ç‡∂´ ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫ ','Define Candidate Interview_TA ',18000,1,'./symfony/web/index.php/recruitment/CandidateInterview','18.08','MOD018','SaveCandidateInterview,DeleteCandidateInterview,UpdateCandidateInterview'),(18009,'Interview Summary ‚Äì HR ','‡∑É‡∂∏‡∑ä‡∂∏‡∑î‡∂õ ‡∂¥‡∂ª‡∑ì‡∂ö‡∑ä‡∑Ç‡∂´ ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫ - ‡∂∏‡∑è‡∂±‡∑Ä ‡∑É‡∂∏‡∑ä‡∂¥‡∂≠‡∑ä ','Interview Summary ‚Äì HR_TA ',18000,1,'./symfony/web/index.php/recruitment/HRCandidateInterview','18.09','MOD018','SaveCandidateInterview,DeleteCandidate,UpdateCandidateInterview'),(18010,'Selected Candidate Summary ‚Äì Approved by DG  ','‡∑É‡∂∏‡∑ä‡∂∏‡∑î‡∂õ ‡∂¥‡∂ª‡∑ì‡∂ö‡∑ä‡∑Ç‡∂´ ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫ - ‡∂Ö‡∂∞‡∑ä‚Äç‡∂∫‡∂ö‡∑ä‡∑Ç ‡∂¢‡∂±‡∂ª‡∑è‡∂Ω‡∑ä ','Selected Candidate Summary ‚Äì Approved by DG  ',18000,1,'./symfony/web/index.php/recruitment/DGCandidateInterview','18.10','MOD018','SaveCandidateInterview,DeleteCandidate,UpdateCandidateInterview,ajaxTableLockCandidate,UpdateDGCandidateRequest,UpdateDGInterviewRequest'),(18011,'Selected Candidate Summary ','‡∂≠‡∑ù‡∂ª‡∑è‡∂ú‡∂≠‡∑ä ‡∂â‡∂Ω‡∑ä‡∂Ω‡∑î‡∂∏‡∑ä‡∂ö‡∑è‡∂ª‡∑î‡∑Ä‡∂±‡∑ä ‡∑É‡∑è‡∂ª‡∑è‡∂Ç‡∑Å‡∂∫ ','Selected Candi date Summary_TA  ',18000,1,'./symfony/web/index.php/recruitment/CandidatePIMRegistation','18.11','MOD018','CandidatePIMRegistation'),(19000,'Payroll','‡∂¥‡∂©‡∑í‡∂¥‡∂≠','Payroll_ta',0,0,'#','19.00','MOD019',NULL),(19001,'Employee Payroll Information','‡∑É‡∑ö‡∑Ä‡∂ö ‡∂¥‡∂©‡∑í‡∂¥‡∂≠‡∑ä ‡∂≠‡∑ú‡∂ª‡∂≠‡∑î‡∂ª‡∑î','Employee Payroll Information_ta',19000,1,'./symfony/web/index.php/payroll/EmployeePayrollInformation','19.01','MOD019','UpdateEmployeePayrollInformation,EmployeePayrollInformation,DeletePayrollInformation'),(19002,'Administration','‡∂¥‡∂ª‡∑í‡∂¥‡∑è‡∂Ω‡∂±','Administration_ta',19000,1,'#','19.02','MOD019',''),(19003,'Transaction Type Information','‡∂ú‡∂±‡∑î‡∂Ø‡∑ô‡∂±‡∑î ‡∑Ä‡∂ª‡∑ä‡∂ú','Transaction Type Information',19002,2,'./symfony/web/index.php/payroll/TransActiontypeSummary','19.02.01','MOD019','DeleteTransactionType,TransActionTypeInfo'),(19004,'Transaction Detail Information','‡∂ú‡∂±‡∑î‡∂Ø‡∑ô‡∂±‡∑î ‡∑Ä‡∑í‡∑É‡∑ä‡∂≠‡∂ª','Transaction Detail Information',19002,2,'./symfony/web/index.php/payroll/TransActionDetailSummary','19.02.02','MOD019','TransActDetails,DeleteTransactionDetails'),(19005,'Configuration','‡∂ª‡∑ñ‡∂¥‡∂´‡∂∫','Configuration',19000,1,'./symfony/web/index.php/payroll/Configuration','19.03','MOD019',''),(19006,'Employee transaction details','‡∑É‡∑ö‡∑Ä‡∂ö‡∂∫ ‡∂Ö‡∂±‡∑î‡∑Ä ‡∂ú‡∂±‡∑î‡∂Ø‡∑ô‡∂±‡∑î ‡∑Ä‡∑í‡∑É‡∑ä‡∂≠‡∂ª‡∂∫','Employee transaction details',19000,1,'./symfony/web/index.php/payroll/SalarayIncrement','19.04','MOD019',''),(19007,'Employee Transaction Details By Transaction','‡∑É‡∑ö‡∑Ä‡∂ö‡∂∫ ‡∂Ö‡∂±‡∑î‡∑Ä ‡∂ú‡∂±‡∑î‡∂Ø‡∑ô‡∂±‡∑î ‡∑Ä‡∑í‡∑É‡∑ä‡∂≠‡∂ª‡∂∫','Employee Transaction Details By Transaction',19000,1,'./symfony/web/index.php/payroll/AssignEmployees','19.05','MOD019',''),(19008,'Employee Salary Increment','‡∑É‡∑ö‡∑Ä‡∂ö ‡∂¥‡∂©‡∑í ‡∑Ä‡∑ê‡∂©‡∑í‡∑Ä‡∑ì‡∂∏','Employee Salary Increment',19000,1,'#','19.06','MOD019',''),(19009,'Salary Increment Process','‡∑É‡∑ö‡∑Ä‡∂ö ‡∂¥‡∂©‡∑í ‡∑Ä‡∑ê‡∂©‡∑í‡∑Ä‡∑ì‡∂∏ ‡∑É‡∑ê‡∂ö‡∑É‡∑î‡∂∏','Salary Increment Process',19008,2,'./symfony/web/index.php/payroll/SalarayIncrement','19.06.01','MOD019','UpdateSalarayIncrement,DeleteSalarayIncrement,SalaryCancelTrue'),(19010,'Salary Increment Cancel Summary','‡∑É‡∑ö‡∑Ä‡∂ö ‡∂¥‡∂©‡∑í ‡∑Ä‡∑ê‡∂©‡∑í‡∑Ä‡∑ì‡∂∏ ‡∂Ö‡∑Ä‡∂Ω‡∂Ç‡∂ú‡∑î ‡∂ö‡∑í‡∂ª‡∑ì‡∂∏','Salary Increment Cancel Summary',19008,2,'./symfony/web/index.php/payroll/SalarayIncrementCancel','19.06.02','MOD019','UpdateSalarayIncrement,DeleteSalarayIncrement'),(19011,'Payroll process','‡∂¥‡∂©‡∑í‡∂¥‡∂≠ ‡∑É‡∑ê‡∂ö‡∑É‡∑î‡∂∏','Payroll process',19000,1,'#','19.07','MOD019',NULL),(19012,'Payroll process','‡∂¥‡∂©‡∑í‡∂¥‡∂≠ ‡∑É‡∑ê‡∂ö‡∑É‡∑î‡∂∏','Payroll process',19011,2,'./symfony/web/index.php/payroll/StartProcess1','19.07.01','MOD019','ViewProcessedEmp,ViewPaySlip'),(19013,'Bank Details','‡∂∂‡∑ê‡∂Ç‡∂ö‡∑î ‡∑Ä‡∑í‡∑É‡∑ä‡∂≠‡∂ª','Bank Details',19000,1,'#','19.08','MOD019',NULL),(19014,'Bank','‡∂∂‡∑ê‡∂Ç‡∂ö‡∑î ‡∑Ä‡∑í‡∑É‡∑ä‡∂≠‡∂ª','Bank',19013,2,'./symfony/web/index.php/payroll/BankDetails','19.08.01','MOD019','UpdateBankDetails,DeleteBankDetails,BankDetails'),(19015,'Branch','‡∂∂‡∑ê‡∂Ç‡∂ö‡∑î ‡∑Å‡∑è‡∂õ‡∑è','Branch',19013,2,'./symfony/web/index.php/payroll/BranchDetails','19.08.02','MOD019','UpdateBranchDetails,DeleteBranchDetails,BranchDetails'),(19016,'Employee Vote Information','‡∑É‡∑ö‡∑Ä‡∂ö ‡∂°‡∂±‡∑ä‡∂Ø ‡∂≠‡∑ú‡∂ª‡∂≠‡∑î‡∂ª‡∑î','Employee Vote Information',19002,2,'./symfony/web/index.php/payroll/VoteDetails','19.02.03','MOD019','UpdateVoteDetails,DeleteVoteDetails,VoteDetails,DeleteEmployeeBankDetails'),(19017,'Employee Bank Details','‡∑É‡∑ö‡∑Ä‡∂ö ‡∂∂‡∑ê‡∂Ç‡∂ö‡∑î ‡∑Ä‡∑í‡∑É‡∑ä‡∂≠‡∂ª','Employee Bank Details_ta',19013,2,'./symfony/web/index.php/payroll/EmployeeBankDetails','19.08.03','MOD019','EmployeeBankDetails,AjaxEmployeeBankDetails,UpdateBankDiskette'),(19018,'Bank Diskette','‡∂∂‡∑ê‡∂Ç‡∂ö‡∑î ‡∂≠‡∑ê‡∂ß‡∑í‡∂∫','Bank Diskette_ta',19013,2,'./symfony/web/index.php/payroll/BankDiskette','19.08.04','MOD019','EmployeeBankDetails,AjaxEmployeeBankDetails,UpdateBankDiskette,DeleteBankDiskette'),(19019,'Bank Diskette Process','‡∂∂‡∑ê‡∂Ç‡∂ö‡∑î ‡∂≠‡∑ê‡∂ß‡∑í‡∂∫ ‡∑É‡∑ê‡∂ö‡∑É‡∑ì‡∂∏','Bank Diskette Process_ta',19013,2,'./symfony/web/index.php/payroll/BankDisketteProcess','19.08.05','MOD019','BankDisketteProcess,AjaxBankDisketteProcess,UpdateBankDisketteProcess,BankDisketteCreation,DeleteBankDisketteProcess'),(20000,'Loan','‡∂´‡∂∫','Loan_ta',0,0,'#','20.00','MOD020',NULL),(20001,'Loan Type','‡∂´‡∂∫ ‡∑Ä‡∂ª‡∑ä‡∂ú ‡∂±‡∑í‡∂ª‡∑ä‡∂†‡∂´‡∂∫','Loan Type_ta',20000,1,'./symfony/web/index.php/loan/LoanType','20.01','MOD020','LoanType,SaveLoanType,DeleteLoanType'),(20002,'Application','‡∂â‡∂Ω‡∑ä‡∂Ω‡∑î‡∂∏‡∑ä ‡∂¥‡∂≠‡∑ä‚Äç‡∂ª‡∂∫','Application_ta',20000,1,'./symfony/web/index.php/loan/AppliedLoan','20.02','MOD020','AppliedLoan,SaveApplication,DeleteApplication,AjaxDeleteEmployeeGaranter'),(20003,'Loan Settlement','‡∂´‡∂∫ ‡∂¥‡∑í‡∂∫‡∑Ä‡∑ì‡∂∏','Loan Settlement_ta',20000,1,'./symfony/web/index.php/loan/LoanSettlement','20.04','MOD020','SaveLoanSettlement,LoanSettlement'),(20004,'Loan History and Status','‡∂´‡∂∫ ‡∂â‡∂≠‡∑í‡∑Ñ‡∑è‡∑É‡∂∫ ‡∑É‡∑Ñ ‡∂≠‡∂≠‡∑ä‡∑Ä‡∂∫','Loan History and Status_ta',20000,1,'./symfony/web/index.php/loan/LoanHistoryandStatus','20.05','MOD020','LoanHistoryandStatus');
/*!40000 ALTER TABLE `hs_hr_sm_mnuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_sm_payproccapbility`
--

DROP TABLE IF EXISTS `hs_hr_sm_payproccapbility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_sm_payproccapbility` (
  `emp_number` int(7) NOT NULL,
  `prl_type_code` int(4) NOT NULL,
  `prl_disc_code` int(10) NOT NULL DEFAULT '0',
  `prl_process_type` int(4) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`prl_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_sm_payproccapbility`
--

LOCK TABLES `hs_hr_sm_payproccapbility` WRITE;
/*!40000 ALTER TABLE `hs_hr_sm_payproccapbility` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_sm_payproccapbility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_sm_rpt_capability`
--

DROP TABLE IF EXISTS `hs_hr_sm_rpt_capability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_sm_rpt_capability` (
  `sm_capability_id` int(10) NOT NULL,
  `rn_rpt_id` int(10) NOT NULL,
  PRIMARY KEY (`sm_capability_id`,`rn_rpt_id`),
  KEY `xif1hs_hr_sm_rpt_capability` (`sm_capability_id`),
  KEY `xif2hs_hr_sm_rpt_capability` (`rn_rpt_id`),
  CONSTRAINT `hs_hr_sm_rpt_capability_ibfk_1` FOREIGN KEY (`rn_rpt_id`) REFERENCES `hs_hr_rn_report` (`rn_rpt_id`),
  CONSTRAINT `hs_hr_sm_rpt_capability_ibfk_2` FOREIGN KEY (`sm_capability_id`) REFERENCES `hs_hr_sm_capability` (`sm_capability_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_sm_rpt_capability`
--

LOCK TABLES `hs_hr_sm_rpt_capability` WRITE;
/*!40000 ALTER TABLE `hs_hr_sm_rpt_capability` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_sm_rpt_capability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_sm_rptcapability`
--

DROP TABLE IF EXISTS `hs_hr_sm_rptcapability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_sm_rptcapability` (
  `sm_rpt_capability_id` int(20) NOT NULL AUTO_INCREMENT,
  `sm_rpt_capability_name` varchar(100) DEFAULT NULL,
  `sm_rpt_capability_enable_flg` int(20) DEFAULT NULL,
  PRIMARY KEY (`sm_rpt_capability_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_sm_rptcapability`
--

LOCK TABLES `hs_hr_sm_rptcapability` WRITE;
/*!40000 ALTER TABLE `hs_hr_sm_rptcapability` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_sm_rptcapability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_td_assignlist`
--

DROP TABLE IF EXISTS `hs_hr_td_assignlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_td_assignlist` (
  `emp_number` int(7) NOT NULL,
  `td_course_id` int(7) NOT NULL DEFAULT '0',
  `td_asl_isattend` varchar(10) DEFAULT NULL,
  `td_asl_isapproved` varchar(10) DEFAULT NULL,
  `td_asl_ispending` varchar(10) DEFAULT NULL,
  `td_asl_conductperson` varchar(75) DEFAULT NULL,
  `td_asl_duration` varchar(50) DEFAULT NULL,
  `td_asl_conductdate` varchar(50) DEFAULT NULL,
  `td_asl_remarks` varchar(200) DEFAULT NULL,
  `td_asl_effectiveness` varchar(200) DEFAULT NULL,
  `td_asl_adminremarks` varchar(200) DEFAULT NULL,
  `td_asl_isempfb` varchar(10) DEFAULT NULL,
  `td_asl_isadcommented` varchar(10) DEFAULT NULL,
  `td_asl_content` varchar(200) DEFAULT NULL,
  `td_asl_comment` varchar(200) DEFAULT NULL,
  `td_asl_year` varchar(20) DEFAULT NULL,
  `td_asl_admincomment` varchar(200) DEFAULT NULL,
  `td_asl_status` varchar(1) DEFAULT NULL,
  `wfmain_id` int(50) DEFAULT NULL,
  `wfmain_sequence` int(50) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`td_course_id`),
  KEY `xif1hs_hr_td_assignlist` (`td_course_id`),
  KEY `xif2hs_hr_td_assignlist` (`emp_number`),
  KEY `hs_hr_td_assignlist_hs_hr_wf_main` (`wfmain_id`),
  CONSTRAINT `hs_hr_td_assignlist_hs_hr_wf_main` FOREIGN KEY (`wfmain_id`) REFERENCES `hs_hr_wf_main` (`wfmain_id`),
  CONSTRAINT `hs_hr_td_assignlist_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_td_assignlist_ibfk_2` FOREIGN KEY (`td_course_id`) REFERENCES `hs_hr_td_course` (`td_course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_td_assignlist`
--

LOCK TABLES `hs_hr_td_assignlist` WRITE;
/*!40000 ALTER TABLE `hs_hr_td_assignlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_td_assignlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_td_course`
--

DROP TABLE IF EXISTS `hs_hr_td_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_td_course` (
  `td_course_id` int(6) NOT NULL AUTO_INCREMENT,
  `td_inst_id` int(6) NOT NULL,
  `td_course_code` varchar(10) NOT NULL,
  `td_course_year` int(10) NOT NULL,
  `td_course_name_en` varchar(100) DEFAULT NULL,
  `td_course_name_si` varchar(100) DEFAULT NULL,
  `td_course_name_ta` varchar(100) DEFAULT NULL,
  `lang_code` varchar(13) DEFAULT NULL,
  `td_course_venue_en` varchar(200) DEFAULT NULL,
  `td_course_venue_si` varchar(200) DEFAULT NULL,
  `td_course_venue_ta` varchar(200) DEFAULT NULL,
  `td_course_fromdate` date DEFAULT NULL,
  `td_course_todate` date DEFAULT NULL,
  `td_course_fromtime` time DEFAULT NULL,
  `td_course_totime` time DEFAULT NULL,
  `td_course_objective_en` varchar(200) DEFAULT NULL,
  `td_course_objective_si` varchar(200) DEFAULT NULL,
  `td_course_objective_ta` varchar(200) DEFAULT NULL,
  `td_course_whom_en` varchar(200) DEFAULT NULL,
  `td_course_whom_si` varchar(200) DEFAULT NULL,
  `td_course_whom_ta` varchar(200) DEFAULT NULL,
  `td_course_content_en` varchar(200) DEFAULT NULL,
  `td_course_content_si` varchar(200) DEFAULT NULL,
  `td_course_content_ta` varchar(200) DEFAULT NULL,
  `td_course_gencom_en` varchar(200) DEFAULT NULL,
  `td_course_gencom_si` varchar(200) DEFAULT NULL,
  `td_course_gencom_ta` varchar(200) DEFAULT NULL,
  `td_course_fees` varchar(20) DEFAULT NULL,
  `td_course_fees_per_head` varchar(20) DEFAULT NULL,
  `td_course_fees_additional` varchar(20) DEFAULT NULL,
  `level_code` int(4) DEFAULT NULL,
  `td_course_resouse_person` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`td_course_id`),
  UNIQUE KEY `td_course_name_ta` (`td_course_name_ta`),
  UNIQUE KEY `td_course_name_si` (`td_course_name_si`),
  UNIQUE KEY `td_course_name_en` (`td_course_name_en`),
  KEY `xif1hs_hr_td_course` (`lang_code`),
  KEY `xif2hs_hr_td_course` (`td_inst_id`),
  KEY `hs_hr_td_course_level_code` (`level_code`),
  CONSTRAINT `hs_hr_td_course_ibfk_1` FOREIGN KEY (`td_inst_id`) REFERENCES `hs_hr_td_institute` (`td_inst_id`),
  CONSTRAINT `hs_hr_td_course_ibfk_2` FOREIGN KEY (`lang_code`) REFERENCES `hs_hr_language` (`lang_code`),
  CONSTRAINT `hs_hr_td_course_level_code` FOREIGN KEY (`level_code`) REFERENCES `hs_hr_level` (`level_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_td_course`
--

LOCK TABLES `hs_hr_td_course` WRITE;
/*!40000 ALTER TABLE `hs_hr_td_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_td_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_td_institute`
--

DROP TABLE IF EXISTS `hs_hr_td_institute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_td_institute` (
  `td_inst_id` int(6) NOT NULL AUTO_INCREMENT,
  `td_inst_name_en` varchar(75) DEFAULT NULL,
  `td_inst_name_si` varchar(75) DEFAULT NULL,
  `td_inst_name_ta` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`td_inst_id`),
  UNIQUE KEY `td_inst_name_ta` (`td_inst_name_ta`),
  UNIQUE KEY `td_inst_name_si` (`td_inst_name_si`),
  UNIQUE KEY `td_inst_name_en` (`td_inst_name_en`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_td_institute`
--

LOCK TABLES `hs_hr_td_institute` WRITE;
/*!40000 ALTER TABLE `hs_hr_td_institute` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_td_institute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_td_tarining_plan`
--

DROP TABLE IF EXISTS `hs_hr_td_tarining_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_td_tarining_plan` (
  `td_plan_id` int(25) NOT NULL AUTO_INCREMENT,
  `td_plan_month` varchar(50) DEFAULT NULL,
  `td_plan_year` varchar(4) DEFAULT NULL,
  `td_inst_id` int(6) DEFAULT NULL,
  `td_course_id` int(6) DEFAULT NULL,
  `td_plan_training_summery` varchar(200) DEFAULT NULL,
  `td_plan_training_frowhom` varchar(200) DEFAULT NULL,
  `td_plan_resource_person` varchar(200) DEFAULT NULL,
  `level_code` int(4) DEFAULT NULL,
  PRIMARY KEY (`td_plan_id`),
  KEY `hs_hr_td_tarining_plan_level_code` (`level_code`),
  KEY `hs_hr_td_tarining_plan_td_inst_id` (`td_inst_id`),
  CONSTRAINT `hs_hr_td_tarining_plan_level_code` FOREIGN KEY (`level_code`) REFERENCES `hs_hr_level` (`level_code`),
  CONSTRAINT `hs_hr_td_tarining_plan_td_inst_id` FOREIGN KEY (`td_inst_id`) REFERENCES `hs_hr_td_institute` (`td_inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_td_tarining_plan`
--

LOCK TABLES `hs_hr_td_tarining_plan` WRITE;
/*!40000 ALTER TABLE `hs_hr_td_tarining_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_td_tarining_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_title`
--

DROP TABLE IF EXISTS `hs_hr_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_title` (
  `title_code` int(2) NOT NULL AUTO_INCREMENT,
  `title_name` varchar(30) NOT NULL,
  `title_name_si` varchar(30) DEFAULT NULL,
  `title_name_ta` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`title_code`),
  UNIQUE KEY `title_name` (`title_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_title`
--

LOCK TABLES `hs_hr_title` WRITE;
/*!40000 ALTER TABLE `hs_hr_title` DISABLE KEYS */;
INSERT INTO `hs_hr_title` VALUES (1,'Mr','‡∂∏‡∑Ñ‡∂≠‡∑è','mr_ta'),(2,'Miss','‡∂∏‡∑ô‡∂±‡∑Ä‡∑í‡∂∫','mrs_tgfa'),(3,'Mrs','‡∂∏‡∑Ñ‡∂≠‡∑ä‡∂∏‡∑í‡∂∫','mr_fta'),(4,'Ms','‡∂∏‡∑ô‡∂±‡∑Ä‡∑í‡∂∫','mrs_tda'),(5,'Most Venerable','‡∂¥‡∑ñ‡∂¢‡∑ä‚Äç‡∂∫','mrg_ta'),(6,'Venerable','‡∂Ö‡∂≠‡∑í‡∂ú‡∂ª‡∑î','mrs_dta'),(7,'Revered Priest','‡∂¥‡∑ñ‡∂¢‡∂ö‡∂∫‡∑è','mvr_ta'),(8,'Revered Swamy','‡∂Ü‡∂†‡∑è‡∂ª‡∑ä‡∂∫‡∑Ä‡∂ª‡∂∫‡∑è','mbr_ta'),(9,'Rev','‡∂ú‡∑û‡∂ª‡∑Ä‡∑è‡∂ª‡∑ä‡∑Ñ','mrs_tna'),(10,'Most Rev.Rev','‡∂Ö‡∂≠‡∑í ‡∂ú‡∑û‡∂ª‡∑Ä‡∑è‡∂ª‡∑ä‡∑Ñ','mrs_tna'),(11,'Other','‡∑Ä‡∑ô‡∂±‡∂≠‡∑ä','mr_ta');
/*!40000 ALTER TABLE `hs_hr_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_trans_attach`
--

DROP TABLE IF EXISTS `hs_hr_trans_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_trans_attach` (
  `trans_attach_id` int(10) NOT NULL AUTO_INCREMENT,
  `trans_attach_name` varchar(50) NOT NULL,
  `trans_attach_type` varchar(50) NOT NULL,
  `trans_attach_content` mediumblob,
  `trans_id` int(8) NOT NULL,
  PRIMARY KEY (`trans_attach_id`,`trans_id`),
  KEY `xif1hs_hr_trans_attach` (`trans_id`),
  CONSTRAINT `hs_hr_trans_attach_ibfk_1` FOREIGN KEY (`trans_id`) REFERENCES `hs_hr_transfer` (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_trans_attach`
--

LOCK TABLES `hs_hr_trans_attach` WRITE;
/*!40000 ALTER TABLE `hs_hr_trans_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_trans_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_trans_reason`
--

DROP TABLE IF EXISTS `hs_hr_trans_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_trans_reason` (
  `trans_reason_id` int(8) NOT NULL AUTO_INCREMENT,
  `trans_reason_en` varchar(100) DEFAULT NULL,
  `trans_reason_si` varchar(100) DEFAULT NULL,
  `trans_reason_ta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`trans_reason_id`),
  UNIQUE KEY `trans_reason_ta` (`trans_reason_ta`),
  UNIQUE KEY `trans_reason_si` (`trans_reason_si`),
  UNIQUE KEY `trans_reason_en` (`trans_reason_en`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_trans_reason`
--

LOCK TABLES `hs_hr_trans_reason` WRITE;
/*!40000 ALTER TABLE `hs_hr_trans_reason` DISABLE KEYS */;
INSERT INTO `hs_hr_trans_reason` VALUES (1,'Internal','‡∂Ö‡∂∑‡∑ä‚Äç‡∂∫‡∂±‡∑ä‡∂≠‡∂ª','‡Æö‡Æö‡Æö‡Æ§‡Ææ‡Ææ‡Æö‡Æö‡Æö‡Æö‡Æö‡Æö'),(2,'Inter Institutional','‡∂Ö‡∂∑‡∑ä‚Äç‡∂∫‡∂±‡∑ä‡∂≠‡∂ª ‡∑É‡∂Ç‡∑É‡∑ä‡∂Æ‡∑è‡∂∫‡∑í‡∂ö','‡Æ≥‡Æ≥‡Æ≥‡Æ§‡Æ≥‡Æ≥‡Æ≥‡Æ≥‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ≥‡Æ≥‡Æ≥'),(3,'Disciplinary Actions','‡∑Ä‡∑í‡∂±‡∂∫ ‡∂ö‡∂ß‡∂∫‡∑î‡∂≠‡∑ä‡∂≠','‡Æ±‡Æ±‡Æ±‡Æ§‡ÆÆ‡ÆÆ‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±'),(4,'Need of Service','‡∑É‡∑ö‡∑Ä‡∑è ‡∑Ä‡∑î‡∑Ä‡∂∏‡∂±‡∑è','‡Æ±‡Æ±‡Æ±‡Æ±‡Æ§‡ÆÆ‡Æ§‡Ææ‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±'),(5,'Promotion','‡∂ã‡∑É‡∑É‡∑ä‡∂ö‡∑í‡∂ª‡∑ì‡∂∏','‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡ÆÆ‡Æ§‡Ææ‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±'),(6,'Others','‡∑Ä‡∑ô‡∂±‡∂≠‡∑ä','‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ§‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±‡Æ±');
/*!40000 ALTER TABLE `hs_hr_trans_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_transfer`
--

DROP TABLE IF EXISTS `hs_hr_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_transfer` (
  `trans_id` int(8) NOT NULL AUTO_INCREMENT,
  `trans_letter_ld` varchar(100) DEFAULT '0',
  `trans_emp_number` int(7) DEFAULT NULL,
  `trans_currentdiv_id` int(6) NOT NULL,
  `trans_div_id` int(4) DEFAULT NULL,
  `trans_location` varchar(100) DEFAULT NULL,
  `trans_mutual` varchar(10) DEFAULT NULL,
  `trans_mu_name` int(6) DEFAULT NULL,
  `trans_effect_date` date DEFAULT NULL,
  `trans_reason_id` int(4) DEFAULT NULL,
  `trans_comment` varchar(200) DEFAULT NULL,
  `trans_prefer_div_id` int(6) DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `xif1hs_hr_transfer` (`trans_currentdiv_id`),
  KEY `xif2hs_hr_transfer` (`trans_div_id`),
  KEY `xif3hs_hr_transfer` (`trans_emp_number`),
  KEY `xif4hs_hr_transfer` (`trans_reason_id`),
  KEY `hs_hr_transfer_prefer_div_id` (`trans_prefer_div_id`),
  CONSTRAINT `hs_hr_transfer_ibfk_1` FOREIGN KEY (`trans_currentdiv_id`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_hr_transfer_ibfk_2` FOREIGN KEY (`trans_div_id`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_hr_transfer_ibfk_3` FOREIGN KEY (`trans_reason_id`) REFERENCES `hs_hr_trans_reason` (`trans_reason_id`),
  CONSTRAINT `hs_hr_transfer_ibfk_4` FOREIGN KEY (`trans_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_transfer_prefer_div_id` FOREIGN KEY (`trans_prefer_div_id`) REFERENCES `hs_hr_compstructtree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_transfer`
--

LOCK TABLES `hs_hr_transfer` WRITE;
/*!40000 ALTER TABLE `hs_hr_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_transfer_request`
--

DROP TABLE IF EXISTS `hs_hr_transfer_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_transfer_request` (
  `trans_req_id` int(6) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) DEFAULT NULL,
  `trans_req_location_pref1` varchar(75) DEFAULT NULL,
  `trans_req_location_pref2` varchar(75) DEFAULT NULL,
  `trans_req_location_pref3` varchar(75) DEFAULT NULL,
  `trans_req_admincommnet` varchar(200) DEFAULT NULL,
  `trans_req_usercommnet` varchar(200) DEFAULT NULL,
  `trans_req_adminiscomment` varchar(8) NOT NULL,
  `id` int(7) DEFAULT NULL,
  `trans_req_status` varchar(1) DEFAULT NULL,
  `def_level` int(4) DEFAULT NULL,
  `wfmain_id` int(50) DEFAULT NULL,
  `wfmain_sequence` int(50) DEFAULT NULL,
  `trans_req_isapproved` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`trans_req_id`),
  KEY `xif1hs_hr_transfer_request` (`emp_number`),
  KEY `hs_hr_transfer_request_ibfk_1` (`id`),
  KEY `hs_hr_transfer_request_ibfk_2` (`wfmain_id`),
  KEY `hs_hr_transfer_request_ibfk_3` (`def_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_transfer_request`
--

LOCK TABLES `hs_hr_transfer_request` WRITE;
/*!40000 ALTER TABLE `hs_hr_transfer_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_transfer_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_unique_id`
--

DROP TABLE IF EXISTS `hs_hr_unique_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_unique_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_id` int(10) unsigned NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_field` (`table_name`,`field_name`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_unique_id`
--

LOCK TABLES `hs_hr_unique_id` WRITE;
/*!40000 ALTER TABLE `hs_hr_unique_id` DISABLE KEYS */;
INSERT INTO `hs_hr_unique_id` VALUES (38,0,'hs_hr_nationality','nat_code'),(39,0,'hs_hr_language','lang_code'),(40,0,'hs_hr_customer','customer_id'),(41,1,'hs_hr_job_title','jobtit_code'),(42,6,'hs_hr_empstat','estat_code'),(43,8,'hs_hr_eec','eec_code'),(44,0,'hs_hr_licenses','licenses_code'),(45,1,'hs_hr_employee','emp_number'),(46,0,'hs_hr_location','loc_code'),(47,0,'hs_hr_membership','membship_code'),(48,0,'hs_hr_membership_type','membtype_code'),(49,6,'hs_hr_module','mod_id'),(50,0,'hs_hr_education','edu_code'),(51,0,'hs_hr_ethnic_race','ethnic_race_code'),(52,0,'hs_hr_skill','skill_code'),(53,1,'hs_hr_user_group','userg_id'),(54,2,'hs_hr_users','id'),(55,0,'hs_pr_salary_grade','sal_grd_code'),(56,0,'hs_hr_empreport','rep_code'),(57,0,'hs_hr_holidays','holiday_id'),(58,0,'hs_hr_project','project_id'),(59,0,'hs_hr_timesheet','timesheet_id'),(60,0,'hs_hr_timesheet_submission_period','timesheet_period_id'),(61,0,'hs_hr_time_event','time_event_id'),(62,1,'hs_hr_compstructtree','id'),(63,0,'hs_hr_project_activity','activity_id'),(64,0,'hs_hr_workshift','workshift_id'),(65,0,'hs_hr_custom_export','export_id'),(66,0,'hs_hr_custom_import','import_id'),(67,0,'hs_hr_pay_period','id'),(68,0,'hs_hr_hsp_summary','summary_id'),(69,0,'hs_hr_hsp_payment_request','id'),(70,0,'hs_hr_job_spec','jobspec_id'),(71,0,'hs_hr_job_vacancy','vacancy_id'),(72,0,'hs_hr_job_application','application_id'),(73,0,'hs_hr_job_application_events','id'),(74,0,'hs_hr_attendance','attendance_id');
/*!40000 ALTER TABLE `hs_hr_unique_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_user_group`
--

DROP TABLE IF EXISTS `hs_hr_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_user_group` (
  `userg_id` varchar(36) NOT NULL,
  `userg_name` varchar(45) DEFAULT NULL,
  `userg_repdef` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`userg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_user_group`
--

LOCK TABLES `hs_hr_user_group` WRITE;
/*!40000 ALTER TABLE `hs_hr_user_group` DISABLE KEYS */;
INSERT INTO `hs_hr_user_group` VALUES ('USG001','Admin',1);
/*!40000 ALTER TABLE `hs_hr_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_users`
--

DROP TABLE IF EXISTS `hs_hr_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_users` (
  `id` varchar(36) NOT NULL DEFAULT '',
  `user_name` varchar(40) DEFAULT '',
  `user_password` varchar(40) DEFAULT NULL,
  `emp_number` int(7) DEFAULT NULL,
  `is_admin` char(3) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` varchar(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `userg_id` varchar(36) DEFAULT NULL,
  `sm_capability_id` int(50) DEFAULT NULL,
  `sm_rpt_capability_id` int(20) DEFAULT NULL,
  `user_prefered_language` varchar(25) DEFAULT NULL,
  `def_level` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `xif1hs_hr_users` (`created_by`),
  KEY `xif2hs_hr_users` (`emp_number`),
  KEY `xif3hs_hr_users` (`modified_user_id`),
  KEY `xif4hs_hr_users` (`sm_capability_id`),
  KEY `xif5hs_hr_users` (`sm_rpt_capability_id`),
  KEY `xif6hs_hr_users` (`userg_id`),
  CONSTRAINT `hs_hr_users_ibfk_3` FOREIGN KEY (`userg_id`) REFERENCES `hs_hr_user_group` (`userg_id`),
  CONSTRAINT `hs_hr_users_ibfk_4` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_users_ibfk_5` FOREIGN KEY (`sm_capability_id`) REFERENCES `hs_hr_sm_capability` (`sm_capability_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_users`
--

LOCK TABLES `hs_hr_users` WRITE;
/*!40000 ALTER TABLE `hs_hr_users` DISABLE KEYS */;
INSERT INTO `hs_hr_users` VALUES ('USR001','admin','21232f297a57a5a743894a0e4a801fc3',NULL,'Yes',NULL,NULL,NULL,NULL,'Enabled','USG001',NULL,NULL,'en',NULL),('USR002','900010001V','c7b42bf3bf6e4975fb5c53a50576ab1c',1,'No','2012-10-28 00:00:00','2012-10-28 00:00:00','USR002','USR001','Enabled',NULL,1,NULL,'en',1);
/*!40000 ALTER TABLE `hs_hr_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_versions`
--

DROP TABLE IF EXISTS `hs_hr_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_versions` (
  `id` varchar(36) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `entered_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `db_version` varchar(36) DEFAULT NULL,
  `file_version` varchar(36) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `xif1hs_hr_versions` (`created_by`),
  KEY `xif2hs_hr_versions` (`db_version`),
  KEY `xif3hs_hr_versions` (`modified_by`),
  CONSTRAINT `hs_hr_versions_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `hs_hr_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hs_hr_versions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `hs_hr_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hs_hr_versions_ibfk_3` FOREIGN KEY (`db_version`) REFERENCES `hs_hr_db_version` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_versions`
--

LOCK TABLES `hs_hr_versions` WRITE;
/*!40000 ALTER TABLE `hs_hr_versions` DISABLE KEYS */;
INSERT INTO `hs_hr_versions` VALUES ('VER001','Release 1','2006-03-15 00:00:00','2006-03-15 00:00:00',NULL,NULL,0,'DVR001','FVR001','version 1.0');
/*!40000 ALTER TABLE `hs_hr_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wbm_benifit`
--

DROP TABLE IF EXISTS `hs_hr_wbm_benifit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wbm_benifit` (
  `ben_id` int(20) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL,
  `bt_id` int(4) NOT NULL,
  `bst_id` int(4) NOT NULL,
  `ben_date` date DEFAULT NULL,
  `ben_comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ben_id`),
  KEY `xif1hs_hr_wbm_benifit` (`bst_id`),
  KEY `xif2hs_hr_wbm_benifit` (`bt_id`),
  KEY `xif3hs_hr_wbm_benifit` (`emp_number`),
  CONSTRAINT `hs_hr_wbm_benifit_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_hr_wbm_benifit_ibfk_2` FOREIGN KEY (`bt_id`) REFERENCES `hs_hr_wbm_benifit_type` (`bt_id`),
  CONSTRAINT `hs_hr_wbm_benifit_ibfk_3` FOREIGN KEY (`bst_id`) REFERENCES `hs_hr_wbm_benifit_sub_type` (`bst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wbm_benifit`
--

LOCK TABLES `hs_hr_wbm_benifit` WRITE;
/*!40000 ALTER TABLE `hs_hr_wbm_benifit` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wbm_benifit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wbm_benifit_sub_type`
--

DROP TABLE IF EXISTS `hs_hr_wbm_benifit_sub_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wbm_benifit_sub_type` (
  `bst_id` int(4) NOT NULL AUTO_INCREMENT,
  `bt_id` int(4) NOT NULL,
  `bst_name` varchar(200) DEFAULT NULL,
  `bst_name_si` varchar(200) DEFAULT NULL,
  `bst_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bst_id`),
  KEY `xif1hs_hr_wbm_benifit_sub_type` (`bt_id`),
  CONSTRAINT `hs_hr_wbm_benifit_sub_type_ibfk_1` FOREIGN KEY (`bt_id`) REFERENCES `hs_hr_wbm_benifit_type` (`bt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wbm_benifit_sub_type`
--

LOCK TABLES `hs_hr_wbm_benifit_sub_type` WRITE;
/*!40000 ALTER TABLE `hs_hr_wbm_benifit_sub_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wbm_benifit_sub_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wbm_benifit_type`
--

DROP TABLE IF EXISTS `hs_hr_wbm_benifit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wbm_benifit_type` (
  `bt_id` int(4) NOT NULL AUTO_INCREMENT,
  `bt_name` varchar(200) DEFAULT NULL,
  `bt_name_si` varchar(200) DEFAULT NULL,
  `bt_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bt_id`),
  UNIQUE KEY `bt_name_ta` (`bt_name_ta`),
  UNIQUE KEY `bt_name_si` (`bt_name_si`),
  UNIQUE KEY `bt_name` (`bt_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wbm_benifit_type`
--

LOCK TABLES `hs_hr_wbm_benifit_type` WRITE;
/*!40000 ALTER TABLE `hs_hr_wbm_benifit_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wbm_benifit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wf_actingperson_approval`
--

DROP TABLE IF EXISTS `hs_hr_wf_actingperson_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wf_actingperson_approval` (
  `actapp_id` int(50) NOT NULL,
  `actapp_date` date DEFAULT NULL,
  `actapp_time` time DEFAULT NULL,
  `emp_number` int(7) DEFAULT NULL,
  `actapp_empnumber` int(7) DEFAULT NULL,
  PRIMARY KEY (`actapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wf_actingperson_approval`
--

LOCK TABLES `hs_hr_wf_actingperson_approval` WRITE;
/*!40000 ALTER TABLE `hs_hr_wf_actingperson_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wf_actingperson_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wf_approval_group`
--

DROP TABLE IF EXISTS `hs_hr_wf_approval_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wf_approval_group` (
  `wfappgrp_code` int(50) NOT NULL AUTO_INCREMENT,
  `wfappgrp_description` varchar(200) NOT NULL,
  `wfappgrp_description_si` varchar(200) DEFAULT NULL,
  `wfappgrp_description_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`wfappgrp_code`),
  KEY `wfappgrp_code` (`wfappgrp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wf_approval_group`
--

LOCK TABLES `hs_hr_wf_approval_group` WRITE;
/*!40000 ALTER TABLE `hs_hr_wf_approval_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wf_approval_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wf_approval_person`
--

DROP TABLE IF EXISTS `hs_hr_wf_approval_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wf_approval_person` (
  `wfapper_decription` varchar(200) NOT NULL,
  `wfapper_code` varchar(20) NOT NULL,
  `wfapper_sqlquery` varchar(2000) NOT NULL,
  `wfapper_is_group_flg` int(10) NOT NULL,
  PRIMARY KEY (`wfapper_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wf_approval_person`
--

LOCK TABLES `hs_hr_wf_approval_person` WRITE;
/*!40000 ALTER TABLE `hs_hr_wf_approval_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wf_approval_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wf_approvel`
--

DROP TABLE IF EXISTS `hs_hr_wf_approvel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wf_approvel` (
  `wftype_code` int(20) NOT NULL,
  `wfa_sequence` int(20) NOT NULL,
  `wfapper_code` varchar(20) NOT NULL,
  `wfapper_iscompulsory_flg` int(10) NOT NULL,
  `wfapper_lastlevel` int(10) NOT NULL,
  `wfapper_allowchange` varchar(10) NOT NULL,
  PRIMARY KEY (`wftype_code`,`wfa_sequence`),
  KEY `wfapper_code` (`wfapper_code`),
  CONSTRAINT `hs_hr_wf_approvel_ibfk_1` FOREIGN KEY (`wftype_code`) REFERENCES `hs_hr_wf_type` (`wftype_code`),
  CONSTRAINT `hs_hr_wf_approvel_ibfk_2` FOREIGN KEY (`wfapper_code`) REFERENCES `hs_hr_wf_approval_person` (`wfapper_code`),
  CONSTRAINT `hs_hr_wf_approvel_ibfk_3` FOREIGN KEY (`wftype_code`) REFERENCES `hs_hr_wf_type` (`wftype_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wf_approvel`
--

LOCK TABLES `hs_hr_wf_approvel` WRITE;
/*!40000 ALTER TABLE `hs_hr_wf_approvel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wf_approvel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wf_group_app_person`
--

DROP TABLE IF EXISTS `hs_hr_wf_group_app_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wf_group_app_person` (
  `wfappgrp_code` int(50) NOT NULL,
  `wf_main_app_employee` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`wfappgrp_code`,`wf_main_app_employee`),
  KEY `wfappgrp_code` (`wfappgrp_code`),
  CONSTRAINT `hs_hr_wf_group_app_person_ibfk_1` FOREIGN KEY (`wfappgrp_code`) REFERENCES `hs_hr_wf_approval_group` (`wfappgrp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wf_group_app_person`
--

LOCK TABLES `hs_hr_wf_group_app_person` WRITE;
/*!40000 ALTER TABLE `hs_hr_wf_group_app_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wf_group_app_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wf_main`
--

DROP TABLE IF EXISTS `hs_hr_wf_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wf_main` (
  `wfmain_sequence` int(50) NOT NULL,
  `wfmain_app_date` date DEFAULT NULL,
  `wfmain_comments` varchar(200) DEFAULT NULL,
  `wfmain_flow_id` int(50) DEFAULT NULL,
  `wfmain_iscomplete_flg` int(10) DEFAULT NULL,
  `wfmain_id` int(50) NOT NULL,
  `wftype_code` int(50) DEFAULT NULL,
  `wfmain_approving_emp_number` int(7) DEFAULT NULL,
  `wfmain_orderid` int(50) DEFAULT NULL,
  `wfmain_application_date` date DEFAULT NULL,
  `wfmain_current_date` date DEFAULT NULL,
  `wfmain_is_hr_approved` int(10) DEFAULT NULL,
  `wfmain_previous_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`wfmain_sequence`,`wfmain_id`),
  KEY `wfmain_id` (`wfmain_id`),
  KEY `hs_hr_wf_main_ibfk_1` (`wftype_code`),
  KEY `wfmain_id_2` (`wfmain_id`),
  KEY `wfmain_sequence` (`wfmain_sequence`),
  CONSTRAINT `hs_hr_wf_main_ibfk_1` FOREIGN KEY (`wftype_code`) REFERENCES `hs_hr_wf_type` (`wftype_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wf_main`
--

LOCK TABLES `hs_hr_wf_main` WRITE;
/*!40000 ALTER TABLE `hs_hr_wf_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wf_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wf_main_app_person`
--

DROP TABLE IF EXISTS `hs_hr_wf_main_app_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wf_main_app_person` (
  `wfmain_id` int(50) NOT NULL,
  `wfmain_sequence` varchar(25) NOT NULL,
  `wf_main_app_employee` varchar(200) NOT NULL,
  PRIMARY KEY (`wfmain_id`,`wfmain_sequence`,`wf_main_app_employee`),
  CONSTRAINT `hs_hr_wf_main_app_person_ibfk_1` FOREIGN KEY (`wfmain_id`) REFERENCES `hs_hr_wf_main` (`wfmain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wf_main_app_person`
--

LOCK TABLES `hs_hr_wf_main_app_person` WRITE;
/*!40000 ALTER TABLE `hs_hr_wf_main_app_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wf_main_app_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wf_module`
--

DROP TABLE IF EXISTS `hs_hr_wf_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wf_module` (
  `wfmod_id` varchar(36) NOT NULL,
  `wfmod_name` varchar(100) NOT NULL,
  `wfmod_name_si` varchar(100) CHARACTER SET utf8 NOT NULL,
  `wfmod_name_ta` varchar(100) CHARACTER SET utf8 NOT NULL,
  `wfmod_view_name` varchar(100) NOT NULL,
  `wfmod_approve_reject` varchar(100) NOT NULL,
  PRIMARY KEY (`wfmod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wf_module`
--

LOCK TABLES `hs_hr_wf_module` WRITE;
/*!40000 ALTER TABLE `hs_hr_wf_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wf_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_hr_wf_type`
--

DROP TABLE IF EXISTS `hs_hr_wf_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_hr_wf_type` (
  `wftype_description` varchar(200) NOT NULL,
  `wftype_code` int(11) NOT NULL DEFAULT '0',
  `wftype_table_name` varchar(100) DEFAULT NULL,
  `wftype_view_name` varchar(100) DEFAULT NULL,
  `wfmod_id` varchar(20) DEFAULT NULL,
  `wftype_update_field` varchar(20) DEFAULT NULL,
  `wftype_class` varchar(20) DEFAULT NULL,
  `wftype_method_name` varchar(20) DEFAULT NULL,
  `wftype_redirect_url` varchar(100) DEFAULT NULL,
  `wftype_canclemain_field` varchar(20) DEFAULT NULL,
  `wftype_canclestatus_field` varchar(20) DEFAULT NULL,
  `wftype_appmain_field` varchar(20) DEFAULT NULL,
  `wftype_bulk_app_flg` varchar(20) DEFAULT NULL,
  `wftype_sort_field_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`wftype_code`),
  KEY `wfmod_id` (`wfmod_id`),
  CONSTRAINT `hs_hr_wf_type_ibfk_1` FOREIGN KEY (`wfmod_id`) REFERENCES `hs_hr_wf_module` (`wfmod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_hr_wf_type`
--

LOCK TABLES `hs_hr_wf_type` WRITE;
/*!40000 ALTER TABLE `hs_hr_wf_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_hr_wf_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_ln_application`
--

DROP TABLE IF EXISTS `hs_ln_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_ln_application` (
  `ln_app_number` decimal(10,0) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `ln_ty_number` int(10) NOT NULL,
  `ln_app_date` date DEFAULT NULL,
  `ln_app_amount` decimal(18,2) DEFAULT NULL,
  `ln_app_installment` decimal(10,0) DEFAULT NULL,
  `ln_app_no_of_Installments` int(2) DEFAULT NULL,
  `ln_app_elg_amount` decimal(18,2) DEFAULT NULL,
  `ln_app_install_amount` decimal(13,2) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `ln_app_effective_date` date DEFAULT NULL,
  `ln_app_user_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ln_app_number`,`ln_ty_number`),
  UNIQUE KEY `ln_app_number` (`ln_app_number`),
  UNIQUE KEY `ln_app_user_number` (`ln_app_user_number`),
  KEY `xif1hs_ln_application` (`ln_ty_number`),
  KEY `emp_number` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_ln_application`
--

LOCK TABLES `hs_ln_application` WRITE;
/*!40000 ALTER TABLE `hs_ln_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_ln_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_ln_checklist`
--

DROP TABLE IF EXISTS `hs_ln_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_ln_checklist` (
  `ln_chk_cat_number` decimal(10,0) NOT NULL,
  `ln_chk_number` decimal(10,0) NOT NULL,
  `ln_chk_description` varchar(200) DEFAULT NULL,
  `ln_chk_is_mandatory_flg` decimal(1,0) DEFAULT NULL,
  `ln_chk_type_flg` decimal(1,0) DEFAULT NULL,
  `ln_chk_no_of_gurantee` decimal(10,0) DEFAULT NULL,
  `module_code` varchar(20) DEFAULT NULL,
  `formula_name` varchar(100) DEFAULT NULL,
  `ln_chk_validate_req_flg` decimal(1,0) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ln_chk_number`,`ln_chk_cat_number`),
  KEY `xif1hs_ln_checklist` (`ln_chk_cat_number`),
  CONSTRAINT `hs_ln_checklist_ibfk_1` FOREIGN KEY (`ln_chk_cat_number`) REFERENCES `hs_ln_checklist_catagory` (`ln_chk_cat_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_ln_checklist`
--

LOCK TABLES `hs_ln_checklist` WRITE;
/*!40000 ALTER TABLE `hs_ln_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_ln_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_ln_checklist_catagory`
--

DROP TABLE IF EXISTS `hs_ln_checklist_catagory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_ln_checklist_catagory` (
  `ln_chk_cat_number` decimal(10,0) NOT NULL,
  `ln_chk_cat_name` varchar(100) DEFAULT NULL,
  `ln_chk_cat_type` decimal(10,0) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ln_chk_cat_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_ln_checklist_catagory`
--

LOCK TABLES `hs_ln_checklist_catagory` WRITE;
/*!40000 ALTER TABLE `hs_ln_checklist_catagory` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_ln_checklist_catagory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_ln_document`
--

DROP TABLE IF EXISTS `hs_ln_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_ln_document` (
  `ln_doc_number` decimal(10,0) NOT NULL,
  `ln_app_number` decimal(10,0) NOT NULL,
  `ln_ty_number` int(10) NOT NULL,
  `ln_doc_source` mediumblob,
  `ln_doc_ext` varchar(10) DEFAULT NULL,
  `ln_chk_number` decimal(10,0) DEFAULT NULL,
  `ln_chk_cat_number` decimal(10,0) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ln_doc_number`),
  KEY `xif1hs_ln_document` (`ln_chk_number`,`ln_chk_cat_number`),
  KEY `xif2hs_ln_document` (`ln_app_number`,`ln_ty_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_ln_document`
--

LOCK TABLES `hs_ln_document` WRITE;
/*!40000 ALTER TABLE `hs_ln_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_ln_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_ln_entitlement_detail`
--

DROP TABLE IF EXISTS `hs_ln_entitlement_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_ln_entitlement_detail` (
  `ln_ent_group_number` decimal(10,0) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ln_ent_group_number`,`emp_number`),
  KEY `xif2hs_ln_entitlement_detail` (`ln_ent_group_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_ln_entitlement_detail`
--

LOCK TABLES `hs_ln_entitlement_detail` WRITE;
/*!40000 ALTER TABLE `hs_ln_entitlement_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_ln_entitlement_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_ln_entitlement_group`
--

DROP TABLE IF EXISTS `hs_ln_entitlement_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_ln_entitlement_group` (
  `ln_ent_group_number` decimal(10,0) NOT NULL,
  `ln_ent_description` varchar(200) DEFAULT NULL,
  `elgrp_id` decimal(10,0) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ln_ent_group_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_ln_entitlement_group`
--

LOCK TABLES `hs_ln_entitlement_group` WRITE;
/*!40000 ALTER TABLE `hs_ln_entitlement_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_ln_entitlement_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_ln_guarantee`
--

DROP TABLE IF EXISTS `hs_ln_guarantee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_ln_guarantee` (
  `ln_gura_number` int(10) NOT NULL AUTO_INCREMENT,
  `ln_app_number` decimal(10,0) NOT NULL,
  `ln_ty_number` int(10) NOT NULL,
  `ln_gura_external_flg` int(1) DEFAULT NULL,
  `emp_number` int(7) DEFAULT NULL,
  `gura_nic_no` varchar(20) DEFAULT NULL,
  `ln_gura_firstname` varchar(200) DEFAULT NULL,
  `ln_gura_middle_name` varchar(200) DEFAULT NULL,
  `ln_gura_surname` varchar(200) DEFAULT NULL,
  `ln_gura_tel` varchar(20) DEFAULT NULL,
  `ln_gura_address1` varchar(200) DEFAULT NULL,
  `ln_gura_address2` varchar(200) DEFAULT NULL,
  `ln_gura_address3` varchar(200) DEFAULT NULL,
  `ln_gura_comment` varchar(400) DEFAULT NULL,
  `ln_chk_number` decimal(10,0) DEFAULT NULL,
  `ln_chk_cat_number` decimal(10,0) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ln_gura_number`),
  KEY `xif1hs_ln_guarantee` (`ln_app_number`,`ln_ty_number`),
  KEY `xif3hs_ln_guarantee` (`ln_chk_number`,`ln_chk_cat_number`),
  KEY `emp_number` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_ln_guarantee`
--

LOCK TABLES `hs_ln_guarantee` WRITE;
/*!40000 ALTER TABLE `hs_ln_guarantee` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_ln_guarantee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_ln_header`
--

DROP TABLE IF EXISTS `hs_ln_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_ln_header` (
  `emp_number` int(7) NOT NULL,
  `ln_app_number` decimal(10,0) DEFAULT NULL,
  `ln_ty_number` int(10) NOT NULL,
  `ln_hd_sequence` decimal(10,0) NOT NULL,
  `ln_hd_amount` decimal(18,2) DEFAULT NULL,
  `ln_hd_bal_amount` decimal(18,2) DEFAULT NULL,
  `ln_hd_installment` decimal(10,0) DEFAULT NULL,
  `ln_hd_is_active_flg` int(1) DEFAULT NULL,
  `ln_hd_settled_flg` int(1) DEFAULT NULL,
  `ln_hd_user` varchar(100) DEFAULT NULL,
  `ln_hd_apply_date` date DEFAULT NULL,
  `ln_hd_bal_installment` decimal(10,0) DEFAULT NULL,
  `app_approved` decimal(1,0) DEFAULT NULL,
  `wfmain_id` varchar(6) DEFAULT NULL,
  `ln_hd_lst_proc_to_date` datetime DEFAULT NULL,
  `wfmain_sequence` decimal(10,0) DEFAULT NULL,
  `ln_hd_lst_proc_from_date` date DEFAULT NULL,
  `ln_hd_effective_date` date DEFAULT NULL,
  `ln_hd_inactive_period` int(10) DEFAULT NULL,
  `ln_hd_install_amount` decimal(13,2) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `ln_hd_app_date` date DEFAULT NULL,
  `cancel_approved` decimal(5,0) DEFAULT NULL,
  `cancel_main_id` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`ln_hd_sequence`,`ln_ty_number`),
  KEY `xif2hs_ln_header` (`ln_ty_number`),
  KEY `xif4hs_ln_header` (`ln_app_number`,`ln_ty_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_ln_header`
--

LOCK TABLES `hs_ln_header` WRITE;
/*!40000 ALTER TABLE `hs_ln_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_ln_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_ln_schedule`
--

DROP TABLE IF EXISTS `hs_ln_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_ln_schedule` (
  `emp_number` int(7) NOT NULL,
  `ln_hd_sequence` decimal(10,0) NOT NULL,
  `ln_sch_ins_no` decimal(10,0) NOT NULL,
  `ln_ty_number` decimal(10,0) NOT NULL,
  `ln_sch_cap_amt` decimal(18,2) DEFAULT NULL,
  `ln_sch_inst_amount` decimal(13,2) DEFAULT NULL,
  `ln_st_number` decimal(10,0) DEFAULT NULL,
  `ln_sch_is_processed` decimal(1,0) DEFAULT NULL,
  `ln_sch_inst_rate` decimal(5,2) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `ln_sch_proc_to_date` datetime DEFAULT NULL,
  `ln_sch_proc_from_date` datetime DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`ln_hd_sequence`,`ln_sch_ins_no`,`ln_ty_number`),
  KEY `xif1hs_ln_schedule` (`emp_number`,`ln_hd_sequence`,`ln_ty_number`),
  KEY `xif2hs_ln_schedule` (`ln_st_number`),
  CONSTRAINT `hs_ln_schedule_ibfk_1` FOREIGN KEY (`ln_st_number`) REFERENCES `hs_ln_settlement` (`ln_st_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_ln_schedule`
--

LOCK TABLES `hs_ln_schedule` WRITE;
/*!40000 ALTER TABLE `hs_ln_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_ln_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_ln_settlement`
--

DROP TABLE IF EXISTS `hs_ln_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_ln_settlement` (
  `ln_st_number` decimal(10,0) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `ln_hd_sequence` decimal(10,0) NOT NULL,
  `ln_st_date` datetime DEFAULT NULL,
  `ln_st_user` varchar(100) DEFAULT NULL,
  `ln_st_amount` decimal(18,2) DEFAULT NULL,
  `ln_st_installment` decimal(10,0) DEFAULT NULL,
  `ln_st_mode` decimal(1,0) DEFAULT NULL,
  `ln_st_last_installment_number` decimal(10,0) DEFAULT NULL,
  `ln_ty_number` decimal(10,0) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `ln_st_interest_amount` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`ln_st_number`),
  KEY `xif1hs_ln_settlement` (`emp_number`,`ln_hd_sequence`,`ln_ty_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_ln_settlement`
--

LOCK TABLES `hs_ln_settlement` WRITE;
/*!40000 ALTER TABLE `hs_ln_settlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_ln_settlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_ln_type`
--

DROP TABLE IF EXISTS `hs_ln_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_ln_type` (
  `ln_ty_number` int(10) NOT NULL AUTO_INCREMENT,
  `elgrp_id` decimal(10,0) DEFAULT NULL,
  `ln_ty_code` varchar(13) DEFAULT NULL,
  `ln_ty_name` varchar(20) DEFAULT NULL,
  `ln_ty_name_si` varchar(20) DEFAULT NULL,
  `ln_ty_name_ta` varchar(20) DEFAULT NULL,
  `ln_ty_description` varchar(100) DEFAULT NULL,
  `ln_ty_description_si` varchar(100) DEFAULT NULL,
  `ln_ty_description_ta` varchar(100) DEFAULT NULL,
  `ln_ty_max_installment` decimal(10,0) DEFAULT NULL,
  `ln_ty_interest_rate` decimal(5,2) DEFAULT NULL,
  `ln_ty_modified_date` date DEFAULT NULL,
  `ln_ty_modified_user` varchar(100) DEFAULT NULL,
  `ln_ty_amount` decimal(18,2) DEFAULT NULL,
  `ln_ty_app_req_flg` decimal(1,0) DEFAULT NULL,
  `wftype_code` decimal(10,0) DEFAULT NULL,
  `ln_ent_group_number` decimal(10,0) DEFAULT NULL,
  `ln_ty_entitlement_type_flg` decimal(1,0) DEFAULT NULL,
  `ln_ty_interest_fixed_amt` decimal(13,2) DEFAULT NULL,
  `ln_ty_interest_type` decimal(1,0) DEFAULT NULL,
  `ln_ty_user_code` varchar(10) DEFAULT NULL,
  `ln_ty_takehm_req_flg` decimal(1,0) DEFAULT NULL,
  `ln_ty_takehm_ptg` decimal(5,2) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `ln_ty_inactive_type_flg` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`ln_ty_number`),
  KEY `xif1hs_ln_type` (`ln_ent_group_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_ln_type`
--

LOCK TABLES `hs_ln_type` WRITE;
/*!40000 ALTER TABLE `hs_ln_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_ln_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_bank_acc_format`
--

DROP TABLE IF EXISTS `hs_pr_bank_acc_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_bank_acc_format` (
  `acc_fmt_code` decimal(10,0) NOT NULL,
  `acc_fmt_exprs` varchar(100) NOT NULL,
  `acc_fmt_desc` varchar(200) DEFAULT NULL,
  `acc_fmt_errmsg` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`acc_fmt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_bank_acc_format`
--

LOCK TABLES `hs_pr_bank_acc_format` WRITE;
/*!40000 ALTER TABLE `hs_pr_bank_acc_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_bank_acc_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_bank_diskette`
--

DROP TABLE IF EXISTS `hs_pr_bank_diskette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_bank_diskette` (
  `dsk_id` int(4) NOT NULL AUTO_INCREMENT,
  `dsk_name` varchar(200) DEFAULT NULL,
  `dsk_name_si` varchar(200) DEFAULT NULL,
  `dsk_name_ta` varchar(200) DEFAULT NULL,
  `dsk_start_date` date DEFAULT NULL,
  `dsk_end_date` date DEFAULT NULL,
  `dsk_view` varchar(200) DEFAULT NULL,
  `dsk_detail_type` varchar(100) DEFAULT NULL,
  `bank_code` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`dsk_id`),
  KEY `hs_pr_bank_diskette_bank_code` (`bank_code`),
  CONSTRAINT `hs_pr_bank_diskette_bank_code` FOREIGN KEY (`bank_code`) REFERENCES `hs_hr_bank` (`bank_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_bank_diskette`
--

LOCK TABLES `hs_pr_bank_diskette` WRITE;
/*!40000 ALTER TABLE `hs_pr_bank_diskette` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_bank_diskette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_bank_diskette_detail`
--

DROP TABLE IF EXISTS `hs_pr_bank_diskette_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_bank_diskette_detail` (
  `dskd_id` int(4) NOT NULL AUTO_INCREMENT,
  `dsk_id` int(4) DEFAULT NULL,
  `dskd_column` varchar(200) DEFAULT NULL,
  `dskd_length` varchar(4) DEFAULT NULL,
  `dskd_type` varchar(1) DEFAULT NULL,
  `dskd_alignment` varchar(1) DEFAULT NULL,
  `dskd_fillwith` varchar(1) DEFAULT NULL,
  `dskd_value` varchar(200) DEFAULT NULL,
  `dskd_order` varchar(100) DEFAULT NULL,
  `dskd_active` varchar(1) DEFAULT NULL,
  `dsk_detail_type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`dskd_id`),
  KEY `hs_pr_bank_diskette_detail_dsk_id` (`dsk_id`),
  CONSTRAINT `hs_pr_bank_diskette_detail_dsk_id` FOREIGN KEY (`dsk_id`) REFERENCES `hs_pr_bank_diskette` (`dsk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_bank_diskette_detail`
--

LOCK TABLES `hs_pr_bank_diskette_detail` WRITE;
/*!40000 ALTER TABLE `hs_pr_bank_diskette_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_bank_diskette_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_bank_diskette_process`
--

DROP TABLE IF EXISTS `hs_pr_bank_diskette_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_bank_diskette_process` (
  `bdp_id` int(4) NOT NULL AUTO_INCREMENT,
  `dsk_id` int(4) DEFAULT NULL,
  `id` int(6) DEFAULT NULL,
  `bdp_start_date` date DEFAULT NULL,
  `bdp_end_date` date DEFAULT NULL,
  `bdp_payment_date` date DEFAULT NULL,
  `bdp_processed` varchar(1) DEFAULT NULL,
  `bdp_flg` varchar(1) DEFAULT NULL,
  `bdp_payment_total` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`bdp_id`),
  KEY `hs_hr_bank_diskette_process_id` (`id`),
  KEY `hs_pr_bank_diskette_dsk_id` (`dsk_id`),
  CONSTRAINT `hs_hr_bank_diskette_process_id` FOREIGN KEY (`id`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_pr_bank_diskette_dsk_id` FOREIGN KEY (`dsk_id`) REFERENCES `hs_pr_bank_diskette` (`dsk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_bank_diskette_process`
--

LOCK TABLES `hs_pr_bank_diskette_process` WRITE;
/*!40000 ALTER TABLE `hs_pr_bank_diskette_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_bank_diskette_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_bank_diskette_process_employee`
--

DROP TABLE IF EXISTS `hs_pr_bank_diskette_process_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_bank_diskette_process_employee` (
  `bdp_id` int(4) NOT NULL AUTO_INCREMENT,
  `emp_number` int(7) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bdp_id`,`emp_number`),
  KEY `hs_hr_bank_diskette_process_emp_number` (`emp_number`),
  CONSTRAINT `hs_hr_bank_diskette_process_emp_number` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_bank_diskette_process_employee`
--

LOCK TABLES `hs_pr_bank_diskette_process_employee` WRITE;
/*!40000 ALTER TABLE `hs_pr_bank_diskette_process_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_bank_diskette_process_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_bank_transfers`
--

DROP TABLE IF EXISTS `hs_pr_bank_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_bank_transfers` (
  `emp_number` int(7) NOT NULL,
  `bank_code` varchar(8) NOT NULL,
  `bbranch_code` varchar(6) NOT NULL,
  `ebank_acc_no` varchar(80) NOT NULL,
  `ebt_start_date` datetime NOT NULL,
  `ebt_end_date` datetime NOT NULL,
  `ebt_amount` decimal(15,2) DEFAULT NULL,
  `ebank_acc_type_flg` smallint(6) NOT NULL,
  `ebt_cur_base_amount` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`bank_code`,`bbranch_code`,`ebank_acc_no`,`ebt_start_date`,`ebt_end_date`,`ebank_acc_type_flg`),
  KEY `xif1hs_pr_bank_transfers` (`emp_number`),
  KEY `xif2hs_pr_bank_transfers` (`bank_code`),
  KEY `xif3hs_pr_bank_transfers` (`bbranch_code`),
  KEY `xif5hs_pr_bank_transfers` (`ebank_acc_type_flg`),
  CONSTRAINT `hs_pr_bank_transfers_ibfk_1` FOREIGN KEY (`bbranch_code`) REFERENCES `hs_hr_branch` (`bbranch_code`),
  CONSTRAINT `hs_pr_bank_transfers_ibfk_2` FOREIGN KEY (`bank_code`) REFERENCES `hs_hr_bank` (`bank_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_bank_transfers`
--

LOCK TABLES `hs_pr_bank_transfers` WRITE;
/*!40000 ALTER TABLE `hs_pr_bank_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_bank_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_contribution_base`
--

DROP TABLE IF EXISTS `hs_pr_contribution_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_contribution_base` (
  `trn_dtl_code` int(6) NOT NULL,
  `trn_dtl_base_code` int(11) NOT NULL,
  `trn_contribute_code` int(10) DEFAULT NULL,
  `dbgroup_user_id` varchar(30) NOT NULL,
  PRIMARY KEY (`trn_dtl_code`,`trn_dtl_base_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_contribution_base`
--

LOCK TABLES `hs_pr_contribution_base` WRITE;
/*!40000 ALTER TABLE `hs_pr_contribution_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_contribution_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_cost_centre`
--

DROP TABLE IF EXISTS `hs_pr_cost_centre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_cost_centre` (
  `centre_code` varchar(6) NOT NULL,
  `centre_name` varchar(120) DEFAULT NULL,
  `hie_code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`centre_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_cost_centre`
--

LOCK TABLES `hs_pr_cost_centre` WRITE;
/*!40000 ALTER TABLE `hs_pr_cost_centre` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_cost_centre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_employee`
--

DROP TABLE IF EXISTS `hs_pr_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_employee` (
  `emp_number` int(7) NOT NULL,
  `emp_name_on_cheque` varchar(500) DEFAULT NULL,
  `sal_dtl_year` decimal(10,0) DEFAULT NULL,
  `sal_grd_code` varchar(6) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `emp_update_status` decimal(2,0) DEFAULT NULL,
  `emp_pf_code` int(11) DEFAULT NULL,
  `vt_sal_code` int(11) DEFAULT NULL,
  `vt_epf_code` int(11) DEFAULT NULL,
  `vt_etf_code` int(11) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `applied_default_txn` decimal(1,0) DEFAULT NULL,
  `prl_type_code` int(11) DEFAULT NULL,
  `emp_epf_number` varchar(25) DEFAULT NULL,
  `emp_etf_number` varchar(25) DEFAULT NULL,
  `sal_cash_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`emp_number`),
  UNIQUE KEY `emp_epf_number` (`emp_epf_number`),
  UNIQUE KEY `emp_etf_number` (`emp_etf_number`),
  KEY `xif2hs_pr_employee` (`vt_sal_code`),
  KEY `xif3hs_pr_employee` (`vt_epf_code`),
  KEY `xif4hs_pr_employee` (`vt_etf_code`),
  KEY `hs_pr_employee_hs_pr_payroll_type` (`prl_type_code`),
  CONSTRAINT `hs_pr_employee_hs_pr_payroll_type` FOREIGN KEY (`prl_type_code`) REFERENCES `hs_pr_payroll_type` (`prl_type_code`),
  CONSTRAINT `hs_pr_employee_ibfk_1` FOREIGN KEY (`vt_epf_code`) REFERENCES `hs_pr_vote_info` (`vt_typ_code`),
  CONSTRAINT `hs_pr_employee_ibfk_2` FOREIGN KEY (`vt_etf_code`) REFERENCES `hs_pr_vote_info` (`vt_typ_code`),
  CONSTRAINT `hs_pr_employee_ibfk_3` FOREIGN KEY (`vt_epf_code`) REFERENCES `hs_pr_vote_info` (`vt_typ_code`),
  CONSTRAINT `hs_pr_employee_ibfk_4` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`),
  CONSTRAINT `hs_pr_vote_info_vt_epf_code` FOREIGN KEY (`vt_epf_code`) REFERENCES `hs_pr_vote_info_type` (`vt_inf_type_code`),
  CONSTRAINT `hs_pr_vote_info_vt_etf_code` FOREIGN KEY (`vt_etf_code`) REFERENCES `hs_pr_vote_info_type` (`vt_inf_type_code`),
  CONSTRAINT `hs_pr_vote_info_vt_sal_code` FOREIGN KEY (`vt_sal_code`) REFERENCES `hs_pr_vote_info_type` (`vt_inf_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_employee`
--

LOCK TABLES `hs_pr_employee` WRITE;
/*!40000 ALTER TABLE `hs_pr_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_emptaxes`
--

DROP TABLE IF EXISTS `hs_pr_emptaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_emptaxes` (
  `tax_code` varchar(5) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `is_active` decimal(1,0) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tax_code`,`emp_number`),
  KEY `xif1hs_pr_emptaxes` (`tax_code`),
  KEY `xif2hs_pr_emptaxes` (`emp_number`),
  CONSTRAINT `hs_pr_emptaxes_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_pr_employee` (`emp_number`),
  CONSTRAINT `hs_pr_emptaxes_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_pr_employee` (`emp_number`),
  CONSTRAINT `hs_pr_emptaxes_ibfk_3` FOREIGN KEY (`tax_code`) REFERENCES `hs_pr_tax_defn` (`tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_emptaxes`
--

LOCK TABLES `hs_pr_emptaxes` WRITE;
/*!40000 ALTER TABLE `hs_pr_emptaxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_emptaxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_exceptions`
--

DROP TABLE IF EXISTS `hs_pr_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_exceptions` (
  `pro_startdate` date NOT NULL,
  `pro_enddate` date NOT NULL,
  `emp_number` int(10) NOT NULL,
  `pro_batch_id` varchar(100) CHARACTER SET latin1 NOT NULL,
  `exception_id` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`pro_startdate`,`pro_enddate`,`emp_number`,`pro_batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_exceptions`
--

LOCK TABLES `hs_pr_exceptions` WRITE;
/*!40000 ALTER TABLE `hs_pr_exceptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_exceptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_exceptions_def`
--

DROP TABLE IF EXISTS `hs_pr_exceptions_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_exceptions_def` (
  `exception_id` int(11) NOT NULL AUTO_INCREMENT,
  `exception_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `exception_name_si` varchar(100) NOT NULL,
  `exception_name_ta` varchar(100) NOT NULL,
  PRIMARY KEY (`exception_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_exceptions_def`
--

LOCK TABLES `hs_pr_exceptions_def` WRITE;
/*!40000 ALTER TABLE `hs_pr_exceptions_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_exceptions_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_increment`
--

DROP TABLE IF EXISTS `hs_pr_increment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_increment` (
  `emp_number` int(7) NOT NULL,
  `inc_amount` decimal(13,2) DEFAULT NULL,
  `inc_previous_salary` decimal(13,2) DEFAULT NULL,
  `inc_new_salary` decimal(13,2) DEFAULT NULL,
  `app_approved` decimal(1,0) DEFAULT NULL,
  `inc_sal_grd_code` varchar(6) DEFAULT NULL,
  `wfmain_id` varchar(6) DEFAULT NULL,
  `inc_previous_point` decimal(10,0) DEFAULT NULL,
  `wfmain_sequence` decimal(10,0) DEFAULT NULL,
  `inc_new_point` decimal(10,0) DEFAULT NULL,
  `inc_isprocessed` smallint(6) DEFAULT NULL,
  `inc_points_increased` decimal(10,0) DEFAULT NULL,
  `wftype_code` decimal(10,0) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `inc_previous_grade_code` int(4) DEFAULT NULL,
  `inc_previous_slt_scale_year` int(10) DEFAULT NULL,
  `inc_new_grade_code` int(4) DEFAULT NULL,
  `inc_new_slt_scale_year` int(10) DEFAULT NULL,
  `inc_comment` varchar(200) DEFAULT NULL,
  `inc_confirm_flag` int(1) DEFAULT NULL,
  `inc_effective_date` date DEFAULT NULL,
  `inc_cancel_flag` int(1) DEFAULT NULL,
  `inc_cancel_comment` varchar(200) DEFAULT NULL,
  KEY `xif5hs_pr_increment` (`emp_number`),
  KEY `hs_hr_grade_inc_new_slt_scale_year` (`inc_new_slt_scale_year`),
  KEY `hs_hr_grade_inc_new_grade_code` (`inc_new_grade_code`),
  KEY `hs_hr_grade_slot_inc_previous_slt_scale_year` (`inc_previous_slt_scale_year`),
  KEY `hs_hr_grade_inc_previous_grade_code` (`inc_previous_grade_code`),
  CONSTRAINT `hs_hr_grade_inc_new_grade_code` FOREIGN KEY (`inc_new_grade_code`) REFERENCES `hs_hr_grade` (`grade_code`),
  CONSTRAINT `hs_hr_grade_inc_new_slt_scale_year` FOREIGN KEY (`inc_new_slt_scale_year`) REFERENCES `hs_hr_grade_slot` (`slt_id`),
  CONSTRAINT `hs_hr_grade_inc_previous_grade_code` FOREIGN KEY (`inc_previous_grade_code`) REFERENCES `hs_hr_grade` (`grade_code`),
  CONSTRAINT `hs_hr_grade_slot_inc_previous_slt_scale_year` FOREIGN KEY (`inc_previous_slt_scale_year`) REFERENCES `hs_hr_grade_slot` (`slt_id`),
  CONSTRAINT `hs_pr_increment_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_pr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_increment`
--

LOCK TABLES `hs_pr_increment` WRITE;
/*!40000 ALTER TABLE `hs_pr_increment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_increment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_increment_cancel`
--

DROP TABLE IF EXISTS `hs_pr_increment_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_increment_cancel` (
  `emp_number` int(7) NOT NULL,
  `inc_amount` decimal(13,2) DEFAULT NULL,
  `inc_previous_salary` decimal(13,2) DEFAULT NULL,
  `inc_new_salary` decimal(13,2) DEFAULT NULL,
  `app_approved` decimal(1,0) DEFAULT NULL,
  `inc_sal_grd_code` varchar(6) DEFAULT NULL,
  `wfmain_id` varchar(6) DEFAULT NULL,
  `inc_previous_point` decimal(10,0) DEFAULT NULL,
  `wfmain_sequence` decimal(10,0) DEFAULT NULL,
  `inc_new_point` decimal(10,0) DEFAULT NULL,
  `inc_isprocessed` smallint(6) DEFAULT NULL,
  `inc_points_increased` decimal(10,0) DEFAULT NULL,
  `wftype_code` decimal(10,0) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `inc_previous_grade_code` int(4) DEFAULT NULL,
  `inc_previous_slt_scale_year` int(10) DEFAULT NULL,
  `inc_new_grade_code` int(4) NOT NULL DEFAULT '0',
  `inc_new_slt_scale_year` int(10) NOT NULL DEFAULT '0',
  `inc_comment` varchar(200) DEFAULT NULL,
  `inc_confirm_flag` int(1) DEFAULT NULL,
  `inc_effective_date` date DEFAULT NULL,
  `inc_cancel_flag` int(1) DEFAULT NULL,
  `inc_cancel_comment` varchar(200) DEFAULT NULL,
  `inc_cancel_oder` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc_cancel_oder`),
  KEY `xif5hs_pr_increment_can` (`emp_number`),
  KEY `hs_hr_grade_inc_new_slt_scale_year_can` (`inc_new_slt_scale_year`),
  KEY `hs_hr_grade_inc_new_grade_code_can` (`inc_new_grade_code`),
  KEY `hs_hr_grade_slot_inc_previous_slt_scale_year_can` (`inc_previous_slt_scale_year`),
  KEY `hs_hr_grade_inc_previous_grade_code_can` (`inc_previous_grade_code`),
  CONSTRAINT `hs_hr_grade_inc_new_grade_code_can` FOREIGN KEY (`inc_new_grade_code`) REFERENCES `hs_hr_grade` (`grade_code`),
  CONSTRAINT `hs_hr_grade_inc_new_slt_scale_year_can` FOREIGN KEY (`inc_new_slt_scale_year`) REFERENCES `hs_hr_grade_slot` (`slt_id`),
  CONSTRAINT `hs_hr_grade_inc_previous_grade_code_can` FOREIGN KEY (`inc_previous_grade_code`) REFERENCES `hs_hr_grade` (`grade_code`),
  CONSTRAINT `hs_hr_grade_slot_inc_previous_slt_scale_year_can` FOREIGN KEY (`inc_previous_slt_scale_year`) REFERENCES `hs_hr_grade_slot` (`slt_id`),
  CONSTRAINT `hs_pr_increment_cancel_emp_number` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_increment_cancel`
--

LOCK TABLES `hs_pr_increment_cancel` WRITE;
/*!40000 ALTER TABLE `hs_pr_increment_cancel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_increment_cancel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_increment_def`
--

DROP TABLE IF EXISTS `hs_pr_increment_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_increment_def` (
  `inc_def_id` decimal(10,0) NOT NULL,
  `inc_def_from_date` datetime NOT NULL,
  `inc_def_to_date` datetime DEFAULT NULL,
  `inc_def_description` varchar(500) DEFAULT NULL,
  `inc_def_posted_year` decimal(2,0) DEFAULT NULL,
  `inc_def_posted_month` decimal(2,0) DEFAULT NULL,
  `inc_def_user_id` varchar(50) DEFAULT NULL,
  `inc_def_modified_date` datetime DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`inc_def_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_increment_def`
--

LOCK TABLES `hs_pr_increment_def` WRITE;
/*!40000 ALTER TABLE `hs_pr_increment_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_increment_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_pay_freq_type`
--

DROP TABLE IF EXISTS `hs_pr_pay_freq_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_pay_freq_type` (
  `pf_code` int(11) NOT NULL,
  `pf_name` varchar(20) DEFAULT NULL,
  `pf_description` varchar(100) DEFAULT NULL,
  `pf_enabled_flg` decimal(1,0) DEFAULT NULL,
  `pf_sort_order` decimal(2,0) DEFAULT NULL,
  `udf_code` varchar(5) DEFAULT NULL,
  `pf_abbrivation` varchar(100) DEFAULT NULL,
  `populate_schedule` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`pf_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_pay_freq_type`
--

LOCK TABLES `hs_pr_pay_freq_type` WRITE;
/*!40000 ALTER TABLE `hs_pr_pay_freq_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_pay_freq_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_pay_schedule`
--

DROP TABLE IF EXISTS `hs_pr_pay_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_pay_schedule` (
  `pay_sch_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_sch_st_date` date NOT NULL,
  `pay_sch_end_date` date DEFAULT NULL,
  `pay_sch_processed_flg` int(1) DEFAULT NULL,
  `pay_sch_disabled_flg` int(1) DEFAULT NULL,
  `pay_sch_year` int(4) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `pay_sch_month` int(2) DEFAULT NULL,
  `pay_hie_code` int(6) DEFAULT NULL,
  PRIMARY KEY (`pay_sch_id`),
  KEY `hs_pr_pay_schedule_hs_hr_compstructtree` (`pay_hie_code`),
  CONSTRAINT `hs_pr_pay_schedule_hs_hr_compstructtree` FOREIGN KEY (`pay_hie_code`) REFERENCES `hs_hr_compstructtree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_pay_schedule`
--

LOCK TABLES `hs_pr_pay_schedule` WRITE;
/*!40000 ALTER TABLE `hs_pr_pay_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_pay_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_payprocess`
--

DROP TABLE IF EXISTS `hs_pr_payprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_payprocess` (
  `pay_startdate` datetime NOT NULL,
  `emp_number` int(7) NOT NULL,
  `pay_enddate` datetime NOT NULL,
  `pay_gross_salary` decimal(13,2) NOT NULL,
  `pay_netpay` decimal(13,2) NOT NULL,
  `pay_gross_salary_ytd` decimal(13,2) DEFAULT NULL,
  `pay_netpay_ytd` decimal(13,2) DEFAULT NULL,
  `pay_dsg_code` varchar(13) DEFAULT NULL,
  `pay_last_level_hie_code` int(6) DEFAULT NULL,
  `pay_cash_paid_amt` decimal(13,2) DEFAULT NULL,
  `pay_bank_paid_amt` decimal(13,2) DEFAULT NULL,
  `pay_paid_salary` decimal(13,2) DEFAULT NULL,
  `pay_grossnet_amt` decimal(13,2) DEFAULT NULL,
  `pay_cf_amt` decimal(13,2) DEFAULT NULL,
  `pay_bf_amt` decimal(13,2) DEFAULT NULL,
  `pay_emp_comnt` varchar(500) DEFAULT NULL,
  `pay_hie_code_1` int(6) DEFAULT NULL,
  `pay_salary_point` decimal(10,0) DEFAULT NULL,
  `pay_hie_code_2` int(6) DEFAULT NULL,
  `pay_hie_code_6` int(6) DEFAULT NULL,
  `pay_hie_code_4` int(6) DEFAULT NULL,
  `pay_hie_code_3` int(6) DEFAULT NULL,
  `pay_hie_code_5` int(6) DEFAULT NULL,
  `pay_costcenter` varchar(6) DEFAULT NULL,
  `emp_epf_number` varchar(25) DEFAULT NULL,
  `pay_emp_type` varchar(13) DEFAULT NULL,
  `pay_salarygrade` varchar(6) DEFAULT NULL,
  `pay_processed_date` datetime DEFAULT NULL,
  `pay_proc_user` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`pay_startdate`,`emp_number`,`pay_enddate`),
  KEY `xif1hs_pr_payprocess` (`emp_number`),
  KEY `xif14hs_pr_payprocess` (`pay_emp_type`),
  KEY `xif16hs_pr_payprocess` (`pay_salarygrade`),
  KEY `xif17hs_pr_payprocess` (`pay_costcenter`),
  KEY `xif2hs_pr_payprocess` (`pay_last_level_hie_code`),
  KEY `xif3hs_pr_payprocess` (`pay_dsg_code`),
  KEY `xif4hs_pr_payprocess` (`pay_hie_code_1`),
  KEY `xif5hs_pr_payprocess` (`pay_hie_code_2`),
  KEY `xif6hs_pr_payprocess` (`pay_hie_code_3`),
  KEY `xif7hs_pr_payprocess` (`pay_hie_code_4`),
  KEY `xif8hs_pr_payprocess` (`pay_hie_code_5`),
  KEY `xif9hs_pr_payprocess` (`pay_hie_code_6`),
  CONSTRAINT `hs_pr_payprocess_ibfk_1` FOREIGN KEY (`pay_costcenter`) REFERENCES `hs_pr_cost_centre` (`centre_code`),
  CONSTRAINT `hs_pr_payprocess_ibfk_2` FOREIGN KEY (`pay_emp_type`) REFERENCES `hs_hr_empstat` (`estat_code`),
  CONSTRAINT `hs_pr_payprocess_ibfk_3` FOREIGN KEY (`pay_hie_code_5`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_pr_payprocess_ibfk_4` FOREIGN KEY (`pay_hie_code_4`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_pr_payprocess_ibfk_5` FOREIGN KEY (`pay_hie_code_3`) REFERENCES `hs_hr_compstructtree` (`id`),
  CONSTRAINT `hs_pr_payprocess_ibfk_6` FOREIGN KEY (`pay_hie_code_2`) REFERENCES `hs_hr_compstructtree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_payprocess`
--

LOCK TABLES `hs_pr_payprocess` WRITE;
/*!40000 ALTER TABLE `hs_pr_payprocess` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_payprocess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_payroll_type`
--

DROP TABLE IF EXISTS `hs_pr_payroll_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_payroll_type` (
  `prl_type_code` int(11) NOT NULL AUTO_INCREMENT,
  `prl_type_name` varchar(200) DEFAULT NULL,
  `prl_type_name_si` varchar(200) DEFAULT NULL,
  `prl_type_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`prl_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_payroll_type`
--

LOCK TABLES `hs_pr_payroll_type` WRITE;
/*!40000 ALTER TABLE `hs_pr_payroll_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_payroll_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_processedemp`
--

DROP TABLE IF EXISTS `hs_pr_processedemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_processedemp` (
  `pro_payfrequency` int(10) NOT NULL,
  `pro_startdate` datetime NOT NULL,
  `pro_enddate` datetime NOT NULL,
  `emp_number` int(7) NOT NULL,
  `pro_processed` int(1) DEFAULT NULL,
  `pro_inserttime` datetime DEFAULT NULL,
  `pro_batch_id` varchar(100) DEFAULT NULL,
  `pro_user` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`pro_payfrequency`,`pro_startdate`,`pro_enddate`,`emp_number`),
  KEY `xif1hs_pr_processedemp` (`emp_number`),
  CONSTRAINT `hs_pr_processedemp_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_pr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_processedemp`
--

LOCK TABLES `hs_pr_processedemp` WRITE;
/*!40000 ALTER TABLE `hs_pr_processedemp` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_processedemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_processedtaxes`
--

DROP TABLE IF EXISTS `hs_pr_processedtaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_processedtaxes` (
  `txp_startdate` datetime NOT NULL,
  `txp_enddate` datetime NOT NULL,
  `tax_code` varchar(5) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `txp_proc_emp_amt` decimal(13,2) DEFAULT NULL,
  `txp_proc_eyr_amt` decimal(13,2) DEFAULT NULL,
  `txp_eyr_ytd_amt` decimal(13,2) DEFAULT NULL,
  `txp_tot_for_tax` decimal(13,2) DEFAULT NULL,
  `txp_emp_ytd_amt` decimal(13,2) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `com_tax_from_date` datetime DEFAULT NULL,
  `com_tax_to_date` datetime DEFAULT NULL,
  PRIMARY KEY (`txp_startdate`,`txp_enddate`,`tax_code`,`emp_number`),
  KEY `xif1hs_pr_processedtaxes` (`tax_code`,`emp_number`),
  CONSTRAINT `hs_pr_processedtaxes_ibfk_1` FOREIGN KEY (`tax_code`, `emp_number`) REFERENCES `hs_pr_emptaxes` (`tax_code`, `emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_processedtaxes`
--

LOCK TABLES `hs_pr_processedtaxes` WRITE;
/*!40000 ALTER TABLE `hs_pr_processedtaxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_processedtaxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_processedtxn`
--

DROP TABLE IF EXISTS `hs_pr_processedtxn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_processedtxn` (
  `trn_startdate` datetime NOT NULL,
  `trn_enddate` datetime NOT NULL,
  `trn_dtl_code` int(6) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `trn_proc_emp_amt` decimal(13,2) DEFAULT NULL,
  `trn_proc_eyr_amt` decimal(13,2) DEFAULT NULL,
  `trn_ytd_amount` decimal(13,2) DEFAULT NULL,
  `trn_contribution` decimal(13,2) DEFAULT NULL,
  `trn_hourswkd` decimal(13,2) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `trn_proc_emp_fullamt` decimal(13,2) DEFAULT NULL,
  `trn_ytd_eyr_amount` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`trn_startdate`,`trn_enddate`,`trn_dtl_code`,`emp_number`),
  KEY `xif1hs_pr_processedtxn` (`trn_dtl_code`),
  KEY `xif2hs_pr_processedtxn` (`emp_number`),
  CONSTRAINT `hs_pr_processedtxn_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_pr_employee` (`emp_number`),
  CONSTRAINT `hs_pr_processedtxn_ibfk_2` FOREIGN KEY (`trn_dtl_code`) REFERENCES `hs_pr_transaction_details` (`trn_dtl_code`),
  CONSTRAINT `hs_pr_processedtxn_ibfk_3` FOREIGN KEY (`emp_number`) REFERENCES `hs_pr_employee` (`emp_number`),
  CONSTRAINT `hs_pr_processedtxn_ibfk_4` FOREIGN KEY (`trn_dtl_code`) REFERENCES `hs_pr_transaction_details` (`trn_dtl_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_processedtxn`
--

LOCK TABLES `hs_pr_processedtxn` WRITE;
/*!40000 ALTER TABLE `hs_pr_processedtxn` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_processedtxn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_profile`
--

DROP TABLE IF EXISTS `hs_pr_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_profile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `takehome_ptg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_profile`
--

LOCK TABLES `hs_pr_profile` WRITE;
/*!40000 ALTER TABLE `hs_pr_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_salary_grade`
--

DROP TABLE IF EXISTS `hs_pr_salary_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_salary_grade` (
  `sal_grd_code` varchar(6) NOT NULL,
  `sal_grd_name` varchar(60) DEFAULT NULL,
  `hie_code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`sal_grd_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_salary_grade`
--

LOCK TABLES `hs_pr_salary_grade` WRITE;
/*!40000 ALTER TABLE `hs_pr_salary_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_salary_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_tax_defn`
--

DROP TABLE IF EXISTS `hs_pr_tax_defn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_tax_defn` (
  `tax_code` varchar(5) NOT NULL,
  `tax_name` varchar(20) NOT NULL,
  `tax_description` varchar(50) NOT NULL,
  `tax_com_rate` decimal(5,2) DEFAULT NULL,
  `tax_emp_rate` decimal(5,2) DEFAULT NULL,
  `tax_user_code` varchar(10) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_tax_defn`
--

LOCK TABLES `hs_pr_tax_defn` WRITE;
/*!40000 ALTER TABLE `hs_pr_tax_defn` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_tax_defn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_taxapplicable`
--

DROP TABLE IF EXISTS `hs_pr_taxapplicable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_taxapplicable` (
  `trn_dtl_code` int(6) NOT NULL,
  `tax_code` varchar(5) NOT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`trn_dtl_code`,`tax_code`),
  KEY `xif1hs_pr_taxapplicable` (`trn_dtl_code`),
  KEY `xif2hs_pr_taxapplicable` (`tax_code`),
  CONSTRAINT `hs_pr_taxapplicable_ibfk_1` FOREIGN KEY (`trn_dtl_code`) REFERENCES `hs_pr_transaction_details` (`trn_dtl_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_taxapplicable`
--

LOCK TABLES `hs_pr_taxapplicable` WRITE;
/*!40000 ALTER TABLE `hs_pr_taxapplicable` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_taxapplicable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_tempprocessemp`
--

DROP TABLE IF EXISTS `hs_pr_tempprocessemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_tempprocessemp` (
  `batch_id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL,
  `payroll_type` int(11) NOT NULL,
  PRIMARY KEY (`batch_id`,`emp_number`,`payroll_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_tempprocessemp`
--

LOCK TABLES `hs_pr_tempprocessemp` WRITE;
/*!40000 ALTER TABLE `hs_pr_tempprocessemp` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_tempprocessemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_transaction_base`
--

DROP TABLE IF EXISTS `hs_pr_transaction_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_transaction_base` (
  `trn_dtl_code` int(6) NOT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `trn_dtl_base_code` int(6) NOT NULL,
  `trn_base_prev_flg` int(1) DEFAULT NULL,
  `trn_base_use_prorate_flg` int(1) DEFAULT NULL,
  `trn_base_dyn_order` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`trn_dtl_base_code`,`trn_dtl_code`),
  KEY `xif2hs_pr_transaction_base` (`trn_dtl_code`),
  KEY `xif1hs_pr_transaction_base` (`trn_dtl_base_code`),
  CONSTRAINT `hs_pr_transaction_base_ibfk_1` FOREIGN KEY (`trn_dtl_base_code`) REFERENCES `hs_pr_transaction_details` (`trn_dtl_code`),
  CONSTRAINT `hs_pr_transaction_base_ibfk_2` FOREIGN KEY (`trn_dtl_code`) REFERENCES `hs_pr_transaction_details` (`trn_dtl_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_transaction_base`
--

LOCK TABLES `hs_pr_transaction_base` WRITE;
/*!40000 ALTER TABLE `hs_pr_transaction_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_transaction_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_transaction_details`
--

DROP TABLE IF EXISTS `hs_pr_transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_transaction_details` (
  `trn_dtl_code` int(6) NOT NULL,
  `trn_dtl_name` varchar(100) DEFAULT NULL,
  `trn_dtl_name_si` varchar(100) DEFAULT NULL,
  `trn_dtl_name_ta` varchar(100) DEFAULT NULL,
  `trn_disable_flg` int(1) DEFAULT NULL,
  `trn_ishourly` int(1) DEFAULT NULL,
  `trn_typ_code` int(6) DEFAULT NULL,
  `trn_dtl_payslipnarration` varchar(100) DEFAULT NULL,
  `trn_dtl_payslipnarration_si` varchar(100) DEFAULT NULL,
  `trn_dtl_payslipnarration_ta` varchar(100) DEFAULT NULL,
  `trn_dtl_addtonetpay` int(1) DEFAULT NULL,
  `trn_dtl_display_order` decimal(4,0) DEFAULT NULL,
  `trn_dtl_isdefault_flg` int(1) DEFAULT NULL,
  `trn_dtl_comment` varchar(200) DEFAULT NULL,
  `trn_dtl_isprorate_flg` int(1) DEFAULT NULL,
  `trn_dtl_user_code` varchar(10) DEFAULT NULL,
  `trn_dtl_formula` varchar(100) DEFAULT NULL,
  `trn_dtl_isbasetxn_flg` int(1) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  `trn_dtl_empcont` decimal(13,2) DEFAULT NULL,
  `trn_dtl_eyrcont` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`trn_dtl_code`),
  KEY `xif1hs_pr_transaction_details` (`trn_typ_code`),
  CONSTRAINT `hs_pr_transaction_details_ibfk_1` FOREIGN KEY (`trn_typ_code`) REFERENCES `hs_pr_transaction_type` (`trn_typ_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_transaction_details`
--

LOCK TABLES `hs_pr_transaction_details` WRITE;
/*!40000 ALTER TABLE `hs_pr_transaction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_transaction_group`
--

DROP TABLE IF EXISTS `hs_pr_transaction_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_transaction_group` (
  `trn_grp_code` int(11) NOT NULL,
  `trn_grp_name` varchar(20) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`trn_grp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_transaction_group`
--

LOCK TABLES `hs_pr_transaction_group` WRITE;
/*!40000 ALTER TABLE `hs_pr_transaction_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_transaction_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_transaction_type`
--

DROP TABLE IF EXISTS `hs_pr_transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_transaction_type` (
  `trn_typ_code` int(6) NOT NULL AUTO_INCREMENT,
  `trn_typ_name` varchar(100) DEFAULT NULL,
  `trn_typ_name_si` varchar(100) DEFAULT NULL,
  `trn_typ_name_ta` varchar(100) DEFAULT NULL,
  `trn_typ_type` int(1) DEFAULT NULL,
  `erndedcon` int(1) DEFAULT NULL,
  `trn_typ_user_code` varchar(10) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`trn_typ_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_transaction_type`
--

LOCK TABLES `hs_pr_transaction_type` WRITE;
/*!40000 ALTER TABLE `hs_pr_transaction_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_transaction_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_txn_eligibility`
--

DROP TABLE IF EXISTS `hs_pr_txn_eligibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_txn_eligibility` (
  `emp_number` int(7) NOT NULL,
  `trn_dtl_code` int(6) NOT NULL,
  `trn_dtl_startdate` date NOT NULL,
  `trn_dtl_enddate` date NOT NULL,
  `tre_amount` decimal(13,2) DEFAULT NULL,
  `tre_last_modified_date` date DEFAULT NULL,
  `tre_user_id` varchar(150) DEFAULT NULL,
  `tre_stop_flag` varchar(1) DEFAULT NULL,
  `tre_empcon` decimal(13,2) DEFAULT NULL,
  `tre_eyrcon` decimal(13,2) DEFAULT NULL,
  `tre_hours` decimal(8,2) DEFAULT NULL,
  `dbgroup_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`emp_number`,`trn_dtl_code`),
  KEY `xif3hs_pr_txn_eligibility` (`emp_number`),
  KEY `xif4hs_pr_txn_eligibility` (`trn_dtl_code`),
  CONSTRAINT `hs_pr_txn_eligibility_ibfk_1` FOREIGN KEY (`trn_dtl_code`) REFERENCES `hs_pr_transaction_details` (`trn_dtl_code`),
  CONSTRAINT `hs_pr_txn_eligibility_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_pr_employee` (`emp_number`),
  CONSTRAINT `hs_pr_txn_eligibility_ibfk_3` FOREIGN KEY (`emp_number`) REFERENCES `hs_pr_employee` (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_txn_eligibility`
--

LOCK TABLES `hs_pr_txn_eligibility` WRITE;
/*!40000 ALTER TABLE `hs_pr_txn_eligibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_txn_eligibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_vote_info`
--

DROP TABLE IF EXISTS `hs_pr_vote_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_vote_info` (
  `vt_typ_code` int(11) NOT NULL AUTO_INCREMENT,
  `vt_typ_category` decimal(2,0) DEFAULT NULL,
  `vt_typ_user_code` varchar(20) DEFAULT NULL,
  `vt_typ_name` varchar(200) DEFAULT NULL,
  `vt_typ_name_si` varchar(200) DEFAULT NULL,
  `vt_typ_name_ta` varchar(200) DEFAULT NULL,
  `vt_inf_type_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`vt_typ_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_vote_info`
--

LOCK TABLES `hs_pr_vote_info` WRITE;
/*!40000 ALTER TABLE `hs_pr_vote_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_vote_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_pr_vote_info_type`
--

DROP TABLE IF EXISTS `hs_pr_vote_info_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hs_pr_vote_info_type` (
  `vt_inf_type_code` int(11) NOT NULL AUTO_INCREMENT,
  `vt_inf_type_name` varchar(200) DEFAULT NULL,
  `vt_inf_type_name_si` varchar(200) DEFAULT NULL,
  `vt_inf_type_name_ta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`vt_inf_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_pr_vote_info_type`
--

LOCK TABLES `hs_pr_vote_info_type` WRITE;
/*!40000 ALTER TABLE `hs_pr_vote_info_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_pr_vote_info_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_hs_hr_employee`
--

DROP TABLE IF EXISTS `vw_hs_hr_employee`;
/*!50001 DROP VIEW IF EXISTS `vw_hs_hr_employee`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_hs_hr_employee` (
  `emp_number` int(7),
  `employee_id` varchar(50),
  `emp_lastname` varchar(100),
  `emp_firstname` varchar(100),
  `ethnic_race_code` varchar(13),
  `emp_birthday` date,
  `nation_code` varchar(13),
  `emp_status` varchar(13),
  `job_title_code` varchar(13),
  `act_job_title_code` varchar(13),
  `work_station` int(6),
  `act_work_station` int(6),
  `emp_work_station_hof_flg` int(2),
  `emp_act_work_station_hof_flg` int(2),
  `terminated_date` date,
  `termination_reason` varchar(256),
  `service_code` int(4),
  `grade_code` int(4),
  `slt_scale_year` int(10),
  `level_code` int(4),
  `emp_app_letter_no` varchar(20),
  `emp_personal_file_no` varchar(20),
  `title_code` int(2),
  `emp_initials` varchar(30),
  `emp_initials_si` varchar(30),
  `emp_initials_ta` varchar(30),
  `emp_names_of_initials` varchar(120),
  `emp_names_of_initials_si` varchar(120),
  `emp_names_of_initials_ta` varchar(120),
  `emp_firstname_si` varchar(100),
  `emp_firstname_ta` varchar(100),
  `emp_lastname_si` varchar(100),
  `emp_lastname_ta` varchar(100),
  `gender_code` int(2),
  `emp_birth_location` varchar(50),
  `emp_birth_location_si` varchar(50),
  `emp_birth_location_ta` varchar(50),
  `marst_code` int(2),
  `emp_married_date` date,
  `emp_nic_no` varchar(20),
  `emp_nic_date` date,
  `rlg_code` int(2),
  `lang_code` varchar(13),
  `cou_code` char(2),
  `emp_passport_no` varchar(20),
  `emp_attendance_no` varchar(20),
  `emp_other_file_no` varchar(20),
  `emp_salary_no` varchar(20),
  `emp_barcode_no` varchar(20),
  `emp_public_app_date` date,
  `emp_public_com_date` date,
  `emp_app_date` date,
  `emp_com_date` date,
  `emp_rec_method` int(2),
  `emp_rec_method_desc` varchar(100),
  `emp_rec_method_desc_si` varchar(100),
  `emp_rec_method_desc_ta` varchar(100),
  `emp_rec_medium` int(2),
  `emp_active_hrm_flg` int(2),
  `emp_active_att_flg` int(2),
  `emp_active_pr_flg` int(2),
  `emp_wop_flg` int(2),
  `emp_wop_no` varchar(20),
  `emp_confirm_flg` int(2),
  `emp_confirm_date` date,
  `emp_prob_ext_flg` int(2),
  `emp_prob_from_date` date,
  `emp_prob_to_date` date,
  `class_code` int(4),
  `emp_salary_scale` varchar(100),
  `emp_salary_scale_si` varchar(100),
  `emp_salary_scale_ta` varchar(100),
  `emp_basic_salary` double,
  `emp_salary_inc_date` date,
  `emp_display_name` varchar(200),
  `emp_display_name_si` varchar(200),
  `emp_display_name_ta` varchar(200),
  `emp_pension_no` varchar(25),
  `emp_resign_date` date,
  `emp_retirement_date` date,
  `emp_ldap_flag` int(2),
  `hie_code_1` int(6),
  `hie_code_2` int(6),
  `hie_code_3` int(6),
  `hie_code_4` int(6),
  `hie_code_5` int(6),
  `hie_code_6` int(6),
  `hie_code_7` int(6),
  `hie_code_8` int(6),
  `hie_code_9` int(6),
  `hie_code_10` int(6),
  `act_hie_code_1` int(6),
  `act_hie_code_2` int(6),
  `act_hie_code_3` int(6),
  `act_hie_code_4` int(6),
  `act_hie_code_5` int(6),
  `act_hie_code_6` int(6),
  `act_hie_code_7` int(6),
  `act_hie_code_8` int(6),
  `act_hie_code_9` int(6),
  `act_hie_code_10` int(6),
  `emp_ispaydownload` int(1)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_hs_hr_employee2`
--

DROP TABLE IF EXISTS `vw_hs_hr_employee2`;
/*!50001 DROP VIEW IF EXISTS `vw_hs_hr_employee2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_hs_hr_employee2` (
  `emp_number` int(7),
  `employee_id` varchar(50),
  `emp_lastname` varchar(100),
  `emp_firstname` varchar(100),
  `ethnic_race_code` varchar(13),
  `emp_birthday` date,
  `nation_code` varchar(13),
  `emp_status` varchar(13),
  `job_title_code` varchar(13),
  `act_job_title_code` varchar(13),
  `work_station` int(6),
  `act_work_station` int(6),
  `emp_work_station_hof_flg` int(2),
  `emp_act_work_station_hof_flg` int(2),
  `terminated_date` date,
  `termination_reason` varchar(256),
  `service_code` int(4),
  `grade_code` int(4),
  `slt_scale_year` int(10),
  `level_code` int(4),
  `emp_app_letter_no` varchar(20),
  `emp_personal_file_no` varchar(20),
  `title_code` int(2),
  `emp_initials` varchar(30),
  `emp_initials_si` varchar(30),
  `emp_initials_ta` varchar(30),
  `emp_names_of_initials` varchar(120),
  `emp_names_of_initials_si` varchar(120),
  `emp_names_of_initials_ta` varchar(120),
  `emp_firstname_si` varchar(100),
  `emp_firstname_ta` varchar(100),
  `emp_lastname_si` varchar(100),
  `emp_lastname_ta` varchar(100),
  `gender_code` int(2),
  `emp_birth_location` varchar(50),
  `emp_birth_location_si` varchar(50),
  `emp_birth_location_ta` varchar(50),
  `marst_code` int(2),
  `emp_married_date` date,
  `emp_nic_no` varchar(20),
  `emp_nic_date` date,
  `rlg_code` int(2),
  `lang_code` varchar(13),
  `cou_code` char(2),
  `emp_passport_no` varchar(20),
  `emp_attendance_no` varchar(20),
  `emp_other_file_no` varchar(20),
  `emp_salary_no` varchar(20),
  `emp_barcode_no` varchar(20),
  `emp_public_app_date` date,
  `emp_public_com_date` date,
  `emp_app_date` date,
  `emp_com_date` date,
  `emp_rec_method` int(2),
  `emp_rec_method_desc` varchar(100),
  `emp_rec_method_desc_si` varchar(100),
  `emp_rec_method_desc_ta` varchar(100),
  `emp_rec_medium` int(2),
  `emp_active_hrm_flg` int(2),
  `emp_active_att_flg` int(2),
  `emp_active_pr_flg` int(2),
  `emp_wop_flg` int(2),
  `emp_wop_no` varchar(20),
  `emp_confirm_flg` int(2),
  `emp_confirm_date` date,
  `emp_prob_ext_flg` int(2),
  `emp_prob_from_date` date,
  `emp_prob_to_date` date,
  `class_code` int(4),
  `emp_salary_scale` varchar(100),
  `emp_salary_scale_si` varchar(100),
  `emp_salary_scale_ta` varchar(100),
  `emp_basic_salary` double,
  `emp_salary_inc_date` date,
  `emp_display_name` varchar(200),
  `emp_display_name_si` varchar(200),
  `emp_display_name_ta` varchar(200),
  `emp_pension_no` varchar(25),
  `emp_resign_date` date,
  `emp_retirement_date` date,
  `emp_ldap_flag` int(2),
  `hie_code_1` int(6),
  `hie_code_2` int(6),
  `hie_code_3` int(6),
  `hie_code_4` int(6),
  `hie_code_5` int(6),
  `hie_code_6` int(6),
  `hie_code_7` int(6),
  `hie_code_8` int(6),
  `hie_code_9` int(6),
  `hie_code_10` int(6),
  `act_hie_code_1` int(6),
  `act_hie_code_2` int(6),
  `act_hie_code_3` int(6),
  `act_hie_code_4` int(6),
  `act_hie_code_5` int(6),
  `act_hie_code_6` int(6),
  `act_hie_code_7` int(6),
  `act_hie_code_8` int(6),
  `act_hie_code_9` int(6),
  `act_hie_code_10` int(6),
  `emp_ispaydownload` int(1)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_hs_hr_wf_main_data`
--

DROP TABLE IF EXISTS `vw_hs_hr_wf_main_data`;
/*!50001 DROP VIEW IF EXISTS `vw_hs_hr_wf_main_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_hs_hr_wf_main_data` (
  `wfmod_id` varchar(36),
  `wfmod_name` varchar(100),
  `wfmod_name_si` varchar(100),
  `wfmod_name_ta` varchar(100),
  `wfmod_view_name` varchar(100),
  `wftype_code` int(11),
  `wfmain_iscomplete_flg` int(10),
  `wftype_description` varchar(200),
  `wftype_table_name` varchar(100),
  `wftype_view_name` varchar(100),
  `wfmain_id` int(50),
  `wfmain_sequence` int(50),
  `wfmain_approving_emp_number` varbinary(200),
  `wfmain_flow_id` int(50),
  `wftype_update_field` varchar(20),
  `wftype_class` varchar(20),
  `wftype_method_name` varchar(20),
  `wfmain_previous_id` varchar(50),
  `wfmain_application_date` date,
  `wftype_appmain_field` varchar(20),
  `wftype_bulk_app_flg` varchar(20),
  `wftype_sort_field_name` varchar(20)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_hs_hr_wf_traning_data`
--

DROP TABLE IF EXISTS `vw_hs_hr_wf_traning_data`;
/*!50001 DROP VIEW IF EXISTS `vw_hs_hr_wf_traning_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_hs_hr_wf_traning_data` (
  `ID` int(11),
  `Module ID` varchar(20),
  `APPROVAL LEVEL` int(11),
  `WorkFlow Type Code` int(11),
  `Approving_Employee` varbinary(200),
  `Employee Number` int(11),
  `Employee ID` varchar(50),
  `Employee Name` varchar(200),
  `Traning Year` varchar(20),
  `Course` varchar(100),
  `Institute` varchar(75)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_hs_hr_wf_transfer_data`
--

DROP TABLE IF EXISTS `vw_hs_hr_wf_transfer_data`;
/*!50001 DROP VIEW IF EXISTS `vw_hs_hr_wf_transfer_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_hs_hr_wf_transfer_data` (
  `ID` int(11),
  `Module ID` varchar(20),
  `APPROVAL LEVEL` int(11),
  `WorkFlow Type Code` int(11),
  `Approving_Employee` varbinary(200),
  `Employee Number` int(11),
  `Employee Name` varchar(200)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_pr_bd_bankdata`
--

DROP TABLE IF EXISTS `vw_pr_bd_bankdata`;
/*!50001 DROP VIEW IF EXISTS `vw_pr_bd_bankdata`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_pr_bd_bankdata` (
  `EmployeeNo` int(7),
  `EmployeeName` varchar(200),
  `EmployeeNIC` varchar(20),
  `EmployeeWorkStation` int(6),
  `BranchCode` varchar(6),
  `BankCode` varchar(8),
  `BranchUCode` varchar(200),
  `BankUCode` varchar(200),
  `AccountNo` varchar(80),
  `StartDate` datetime,
  `EndDate` datetime,
  `Amount` decimal(15,2),
  `BaseAmount` decimal(13,2),
  `TotalAmount` decimal(13,2),
  `BankWorkStation` varchar(8)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'esm_nodata'
--
/*!50003 DROP FUNCTION IF EXISTS `getBaseTransGross` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `getBaseTransGross`(detailCode int(6),fromdate datetime,todate datetime,empno int(6)) RETURNS decimal(13,2)
begin


declare totPrevious numeric(13,8);
declare totCurrent numeric(13,8);       
declare totGross numeric(13,8);       

 declare curcrosssumPrvious cursor for                                    
 select   coalesce(sum(trn_proc_emp_amt),0)  
 from hs_pr_processedtxn e
 left join hs_pr_transaction_details d on e.trn_dtl_code=d.trn_dtl_code
 where e.trn_dtl_code in (select trn_dtl_base_code
 from hs_pr_transaction_base b
 where trn_dtl_code=detailCode and trn_base_prev_flg=1) and e.emp_number=empno and trn_startdate=fromdate and 		trn_enddate=todate;

 open curcrosssumPrvious;                                    
   fetch curcrosssumPrvious
   into  totPrevious;
   close curcrosssumPrvious; 




return totPrevious;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getBaseTransGrossPrev` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `getBaseTransGrossPrev`(detailCode int(6),fromdate datetime,todate datetime,empno int(6)) RETURNS decimal(13,2)
begin


declare totPrevious numeric(13,8);
declare totCurrent numeric(13,8);       
declare totGross numeric(13,8);       

declare curcrosssumCurrent cursor for
   select coalesce(sum(tre_amount),0)
   from hs_pr_txn_eligibility e
   left join hs_pr_transaction_details d on e.trn_dtl_code=d.trn_dtl_code
   where e.trn_dtl_code in (select trn_dtl_base_code
   from hs_pr_transaction_base b
   where trn_dtl_code=detailCode and trn_base_prev_flg!=1) and e.emp_number=empno;    

 
  open curcrosssumCurrent;                                    
   fetch curcrosssumCurrent
   into  totCurrent;
   close curcrosssumCurrent;  




return totCurrent;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `getUser`() RETURNS char(7) CHARSET utf8
    DETERMINISTIC
RETURN @empNumber */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getUser2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `getUser2`() RETURNS int(7)
RETURN (2012) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getUser3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `getUser3`() RETURNS int(11)
BEGIN

 RETURN (@empNumber);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getUserTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `getUserTest`() RETURNS int(7)
RETURN  2012 */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `hello` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `hello`() RETURNS int(7)
    DETERMINISTIC
RETURN @empNumber */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `p1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `p1`() RETURNS int(11)
    NO SQL
    DETERMINISTIC
return @user */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `prorate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `prorate`(empno varchar(6),fromdate datetime,todate datetime,amount numeric(13,2)) RETURNS decimal(25,12)
begin

   declare workingdays numeric(13,8);                  
   declare joindate datetime;                   
   declare resigndate datetime;                         
   declare prtdays numeric; 
   declare notworkingdays numeric;                   
   declare prtamount numeric(25,12);                   
   declare prbase numeric(25,12);                   
   declare calcsundays numeric(1,0);   
   declare calcsaturdays numeric(1,0);                  
   declare nsundays numeric;   
   declare nsaturdays numeric;                   
   declare isconsiderholiday varchar(50);   
   declare isconsiderholidaysat varchar(50);               
   declare isrosterbasedproration numeric;   
                
                
  
  
              
   declare curcrossdate cursor for                                    
   select ifnull(terminated_date,timestampadd(year,1,todate)),emp_com_date                   
   from hs_hr_employee                    
   where emp_number =  empno;                  
      
             
               
      
   set prtamount = 0;   
                                                      
   open curcrossdate;                                    
   fetch curcrossdate
   into  resigndate,joindate;           
   close curcrossdate;  
     
                        
   set calcsundays   = 0;    
   set calcsaturdays = 0;   
   set nsundays = 0;  
   set nsaturdays = 0;   
                    
  
            




                          




                  




  
  
  
         




                        
   if (isrosterbasedproration = 1) then
  
      set prtdays = getrosterbasedworkingdays2(empno,joindate,resigndate);
      set workingdays = getrosterbasedworkingdays2(empno,fromdate,todate);
      set calcsundays =  isconsiderholiday;
   else          
        
  
      set calcsundays   =  isconsiderholiday;
      set calcsaturdays =  isconsiderholidaysat;



     
      if (prbase = 0) then
   
         if (calcsundays = 0) then
     
            set workingdays = timestampdiff(day,fromdate,todate) -nsundays+1;
         else 
            if (calcsundays = 1) then
     
               set nsundays = sundaysbetween(fromdate,todate);
               set workingdays = timestampdiff(day,fromdate,todate) -nsundays+1;
            end if;
         end if;  
     
       
         if (calcsaturdays = 0 ) then
     
            set workingdays = workingdays -nsaturdays;
         else 
            if (calcsaturdays = 1) then
     
               set nsaturdays = saturdaysbetween(fromdate,todate);
               set workingdays = workingdays -nsaturdays;
            end if;
         end if;
      else
         set workingdays =  prbase;
      end if;
   end if;   
            
  
  
   if ((fromdate <  joindate and  (joindate <= todate)) and ( (fromdate <=  resigndate) and  (resigndate <  todate))) then
    
      if (calcsundays = 0) then
     
         if (isrosterbasedproration = 0) then
       
            set prtdays = timestampdiff(day,joindate,resigndate)+1;
         end if;
      else 
         if (calcsundays = 1)  then
     
            set nsundays = sundaysbetween(joindate,resigndate);
            if (isrosterbasedproration = 0) then
       
               set prtdays = timestampdiff(day,joindate,resigndate) -nsundays+1;
            end if;
         end if;
      end if;   

  
      if (calcsaturdays = 0) then
     
         if (isrosterbasedproration = 0) then
       
            set prtdays = prtdays;
         end if;
         if (workingdays > 0 and  workingdays < 1) then  
       
            set prtamount =(amount*workingdays)*prtdays;
         else
            set prtamount  =(amount/workingdays)*prtdays;
         end if;
      else 
         if (calcsaturdays = 1) then
     
            set nsaturdays = saturdaysbetween(joindate,resigndate);
            if (isrosterbasedproration = 0)  then
       
               set prtdays = prtdays -nsaturdays;
            end if;
            if (workingdays > 0 and  workingdays < 1) then
       
               set prtamount =(amount*workingdays)*prtdays;
            else
               set prtamount =(amount/workingdays)*prtdays;
            end if;
         end if;
      end if;  
                  
  
    

  
   else 
      if (((fromdate <  joindate) and  ((joindate <= todate) and (resigndate >=  todate)))) then

         if (calcsundays = 0) then
    
            if (isrosterbasedproration = 0) then
                   
			
             
               set notworkingdays = timestampdiff(day,fromdate,joindate);
               set prtdays =(workingdays -notworkingdays);
            end if;
         else 
            if (calcsundays = 1)  then
    
               set nsundays  = sundaysbetween(joindate,todate);
               if (isrosterbasedproration = 0) then
              
             
                  set notworkingdays = timestampdiff(day,fromdate,joindate); 	
			 
                  set prtdays =(workingdays -notworkingdays) -nsundays+1;
               else
                  set prtdays  =  prtdays -nsundays;
               end if;
            end if;
         end if;  

         if (calcsaturdays = 0) then
    
            if (isrosterbasedproration = 0)  then
          
               set prtdays = prtdays;
            end if;
            if (workingdays > 0 and  workingdays < 1) then  
               
               begin
                  set prtamount  =(amount*workingdays)*prtdays;
               end;
            else
               
               begin
                  set prtamount  =(amount/workingdays)*prtdays;
               end;
            end if;
         else 
            if (calcsaturdays = 1) then
    
               set nsaturdays  = saturdaysbetween(joindate,todate);
               if (isrosterbasedproration = 0) then
          
                  set prtdays = prtdays -nsaturdays;
               else
                  set prtdays  =  prtdays -nsaturdays;
               end if;
               if (workingdays > 0 and  workingdays < 1) then 
          
                  set prtamount =(amount*workingdays)*prtdays;
               else
                  set prtamount =(amount/workingdays)*prtdays;
               end if;
            end if;
         end if;  

  
  
      else 
         if ((fromdate >=  joindate) and ((fromdate <=  resigndate) and  (resigndate <  todate))) then

            if (calcsundays = 0 ) then
          
               if (isrosterbasedproration = 0) then
            
                  set prtdays  = timestampdiff(day,fromdate,resigndate)+1;
               end if;
            else 
               if (calcsundays = 1)  then
          
                  set nsundays  = sundaysbetween(fromdate,resigndate);
                  if (isrosterbasedproration = 0)  then
              
                     set prtdays  = timestampdiff(day,fromdate,resigndate) -nsundays+1;
                  end if;
               end if;
            end if;  
  

  
            if (calcsaturdays = 0 ) then
          
               if (isrosterbasedproration = 0) then
             
                  set prtdays  = prtdays;
               end if;
               if ( (workingdays > 0) and  (workingdays < 1))  then
             
                  set prtamount  =(amount*workingdays)*prtdays;
               else
                  set prtamount  =(amount/workingdays)*prtdays;
               end if;
            else 
               if (calcsaturdays = 1) then
          
                  set nsaturdays  = saturdaysbetween(fromdate,resigndate);
                  if (isrosterbasedproration = 0) then
             
                     set prtdays  = prtdays -nsaturdays;
                  end if;
                  if (workingdays > 0 and  workingdays < 1)  then 
             
                     set prtamount  =(amount*workingdays)*prtdays;
                  else
                     set prtamount  =(amount/workingdays)*prtdays;
                  end if;
               end if;
            end if;  


         else 
            if (fromdate >=  joindate) and (resigndate >=  todate) then

               if (calcsundays = 0)  then
          
                  if (isrosterbasedproration = 0) then
              
                     set prtdays  = timestampdiff(day,fromdate,todate)+1;
                  end if;
               else 
                  if (calcsundays = 1)  then
          
                     set nsundays  = sundaysbetween(fromdate,todate);
                     if (isrosterbasedproration = 0)  then
             
                        set prtdays  =(timestampdiff(day,fromdate,todate) -nsundays)+1;
                     end if;
                  end if;
               end if;  
  

               if (calcsaturdays = 0) then
          
                  if (isrosterbasedproration = 0)  then
             
                     set prtdays  = prtdays;
                     set prtamount  =  amount;
                  end if;
               else 
                  if (calcsaturdays = 1) then
          
                     set nsaturdays  = saturdaysbetween(fromdate,todate);
                     if (isrosterbasedproration = 0) then
             
                        set prtdays  =(prtdays -nsaturdays);
                     end if;
                     set prtamount  =  amount;
                  end if;
               end if;
            end if;
         end if;
      end if;
   end if;                                 
             
   if  (prtamount >  amount) then
 
      set prtamount  =  amount;
   end if;       
   return  prtamount;     
    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `prorateempincrement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `prorateempincrement`(empno varchar(6),fromdate datetime,todate datetime,nbsal numeric(13,2)) RETURNS decimal(13,2)
begin

    
    
   declare nprtbsal numeric(13,2);    
   declare nprobase numeric(13,4);    
   declare nconsunday boolean;    
   declare nconsaturday boolean;    
   declare nconroster boolean;     
   declare nprvsalary numeric(13,2);    
   declare nnewsalary numeric(13,2);    
   declare nincamount numeric(13,2);    
   declare dinceffdate datetime;    
   declare nworkdays numeric(13,2);    
   declare nnoteffectdays numeric(13,2);
   declare no_data int default 0;

   


   declare curincdata cursor  for     
    
   select coalesce(inc_previous_salary,0),coalesce(inc_new_salary,0),inc_effective_date,coalesce(inc_amount,0)    
   from  hs_pr_increment i    
   where emp_number = empno and coalesce(i.inc_confirm_flag,0) = 1 and fromdate < i.inc_effective_date and i.inc_effective_date <= todate;

 

   declare continue handler for sqlexception
   begin
      set no_data = -2;
   end;
   declare continue handler for not found set no_data = -1;
  

   set nprtbsal  = nbsal;    
   set nprobase  = 0;    
   set nconsunday  = 1;    
   set nconsaturday = 1;    
   set nconroster  = 0;    
   set nprvsalary     = 0;    
   set nnewsalary     = 0;    
   set nincamount     = 0;    
   set nworkdays     = 0;    
   set nnoteffectdays = 0;

    
    
    
    
   
    
   
    
   if (nprobase = 0)  then
          
      set nprobase  = timestampdiff(day,fromdate,todate)+1;
   end if;    
  
   
   open  curincdata;    
   set no_data = 0;
   fetch curincdata into nprvsalary,nnewsalary,dinceffdate,nincamount;    
    	
         
   while (no_data = 0) do
      set nnoteffectdays = timestampdiff(day,fromdate,dinceffdate); 

	
      set nworkdays = nprobase -nnoteffectdays;
    
    
         
     
     
         
         
      
         

     
     
    
    
       
    
    
    
         set nprtbsal = nnewsalary;
    
    
    
	
      if nprtbsal < 0  then
   
         set nprtbsal = 0;
      end if;
	if nprtbsal= 0 then
	
		set nprtbsal = nbsal;
	end if; 
     
   
      
    
      set no_data = 0;
      fetch curincdata into nprvsalary,nnewsalary,dinceffdate,nincamount;
  end while;     
   close curincdata;    
 
    
     return nprtbsal;    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `saturdaysbetween` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `saturdaysbetween`(paystartdate datetime,payenddate datetime) RETURNS decimal(10,0)
begin

        
   declare dresult numeric;             
   declare curdate datetime;       
   declare dayofweek varchar(10);    
     
   set dresult = 0;     
   set curdate = paystartdate;    
   while (paystartdate <= curdate) and (curdate <= payenddate) do
      set dayofweek = dayname(curdate);
      if  dayofweek = 'saturday' then
                          
         set dresult = dresult+1;
      end if;
      set curdate = timestampadd(day,1,curdate);
   end while;    
   
   return  dresult;    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sundaysbetween` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `sundaysbetween`(paystartdate datetime,payenddate datetime) RETURNS decimal(10,0)
begin
      
   declare dresult numeric;           
   declare curdate datetime;     
   declare dayofweek varchar(10);  
   
 
   set dresult = 0;   
   set curdate = paystartdate;  
  
   while (paystartdate <= curdate) and (curdate <= payenddate) do
      
      set dayofweek = dayname(curdate);
      if  dayofweek = 'sunday'  then
                          
         set dresult = dresult+1;
      end if;
      
      set curdate = timestampadd(day,1,curdate);
   end while;  
   return  dresult;  
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rpt_emp_master` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `rpt_emp_master`(param VARCHAR(255))
BEGIN
  SET @empNumber=param;
SELECT e.emp_display_name,e.emp_display_name_si,e.emp_display_name_ta,j.jobtit_name, j.jobtit_name_si, j.jobtit_name_ta, g.grade_name, g.grade_name_si,co.title,co.title_si,co.title_ta,g.grade_name_ta,s.service_name, s.service_name_si, s.service_name_ta, e.emp_birthday,e.work_station,e.emp_app_date, e.emp_confirm_date, e.emp_com_date, e.emp_app_letter_no, c.title_si, c.title_ta, e.emp_lastname_si, e.emp_lastname_ta, e.emp_initials, e.emp_initials_si, e.emp_initials_ta, e.employee_id, e.emp_lastname, e.emp_nic_no, c.title, s.service_code, g.grade_code, j.jobtit_code, DATEDIFF( CURRENT_DATE( ) , e.emp_com_date ) AS DiffDate
  FROM hs_hr_employee e
  LEFT JOIN hs_hr_compstructtree c ON e.work_station = c.id
  LEFT JOIN hs_hr_service s ON s.service_code = e.service_code
  LEFT JOIN hs_hr_grade g ON g.grade_code = e.grade_code
  LEFT JOIN hs_hr_job_title j ON j.jobtit_code = e.job_title_code
  LEFT JOIN hs_hr_compstructtree co ON co.id = e.work_station
  LEFT JOIN hs_hr_users u ON e.emp_number=u.emp_number
  ORDER BY e.work_station ASC;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spaddpayprocess` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `spaddpayprocess`(start_date datetime,                                              
end_date datetime,                                              
empnumber varchar(6),                                              
grosssalary numeric(13,2),                                              
netpay numeric(13,2),                              
out ioutput int)
begin

   declare roundby numeric;                                      
   declare roundtype numeric;                                                         
   declare fixedearnamt numeric;                                  
   declare loanamt numeric;                                   
   declare totearnings numeric;                                    
   declare fixeddeductions numeric;                                  
   declare takehomeper numeric;                                  
   declare intstatus numeric;                              
   declare ipaymode numeric;                              
   declare bnkcode varchar(8);                               
   declare brnchcode varchar(6);                                 
   declare baccnumber varchar(80);                              
   declare cashamount numeric(13,2);                            
   declare bankamount numeric(13,2);                             
   declare ibankentered numeric;                                
   declare nbankamount numeric(13,2);                                
   declare nbanktotalamount numeric(13,2);                             
   declare nbanktrnamount numeric(13,2);                             
   declare nbanktrntotal numeric(13,2);                             
   declare npaidsalary numeric(13,2);                             
   declare nbfamt numeric(13,2);                            
   declare ncfamt numeric(13,2);                            
   declare npfyear numeric;                            
   declare nschid numeric;                            
   declare nnewschid numeric;                            
   declare dprevdate datetime;                            
   declare dnextdate datetime;                            
   declare nbanktempamt numeric(13,2);                            
   declare ntemppaidsal numeric(13,2);                        
   declare ntempcfamt numeric(13,2);                
                

   declare sdsgcode varchar(6);                 
   declare shiecode1 int(6);                
   declare shiecode2 int(6);                
   declare shiecode3 int(6);                
   declare shiecode4 int(6);                
   declare shiecode5 int(6);                
   declare shiecode6 int(6);                
   declare sloccode varchar(6);                
   declare sctcode varchar(6);                
   declare scatcode varchar(6);                
   declare sgpcode varchar(6);                
   declare semptype varchar(6);                
   declare sstaffcatcode varchar(6);                
   declare salgrd varchar(20);                
   declare scostcenter varchar(20);            
   declare nsalarypoint numeric;            
   declare sempepfnumber varchar(25);             
   declare snatvcurrency varchar(6);            
   declare sempnatvcurrency varchar(6);               
   declare nismultinet numeric;               
            

                                    
  
   
  
                      
   declare curempdetail cursor for                                     
   select              
   hie_code_1,                
   hie_code_2,                
   hie_code_3,                
   hie_code_4,                
   hie_code_5,                
   hie_code_6,                                                      
   job_title_code,                                                  
   emp_status,                                  
   slt_scale_year                                   
   from             
   hs_hr_employee e            
   where             
   e.emp_number =  empnumber;                                   
                                    
                                    
    declare curtakehome cursor for                                     
    select takehome_ptg                         
    from hs_pr_profile;                                  
                                      
   declare curfixedearnamt cursor for                                  
   select             
   ifnull(sum(trn_proc_emp_amt),0) as trn_proc_emp_amt                           
   from                        
   hs_pr_transaction_type t,hs_pr_transaction_details d,hs_pr_processedtxn p                        
   where             
   t.trn_typ_code = d.trn_typ_code and                         
   d.trn_dtl_code = p.trn_dtl_code and                          
  (t.erndedcon = 2 or t.erndedcon = 1)  and ifnull(trn_typ_type,0) = 1 and                        
   emp_number = empnumber and trn_startdate >= start_date and trn_startdate <= end_date; 
   
  
  
  
 
  
 
  
  
  
                                 
   declare curfixeddeductions cursor for                                  
   select ifnull(sum(trn_proc_emp_amt),0) as trn_proc_emp_amt                  
   from                        
   hs_pr_transaction_type t,hs_pr_transaction_details d,hs_pr_processedtxn p                        
   where             
   t.trn_typ_code = d.trn_typ_code and                         
   d.trn_dtl_code = p.trn_dtl_code and                          
  (t.erndedcon = -1)  and (ifnull(trn_typ_type,0) = 1 or ifnull(trn_typ_type,0) = 0) and                        
   emp_number = empnumber and trn_startdate >= start_date  and trn_startdate <= end_date;
   
  
   set intstatus = 0;                              
   set cashamount = netpay;                             
   set bankamount = 0;                              
   set ibankentered = 0;                            
   set brnchcode = '';                            
   set baccnumber = '';                            
   set baccnumber = '';                            
   set nbanktrntotal = 0;         
   set ncfamt = 0;                            
   set nbanktrnamount =  0;                               
   set fixedearnamt  = 0;                        
   set fixeddeductions  = 0;                        
   set loanamt = 0;                 
   set ntemppaidsal = 0;                
   set ntempcfamt = 0;                
                

                
   set sdsgcode  = '';                 






   set sloccode  = '';                
   set sctcode  = '';                
   set scatcode  = '';                
   set sgpcode  = '';                
   set semptype  = '';                
   set sstaffcatcode = '';                
   set salgrd   = '';                
   set scostcenter = '';            
   set sempepfnumber = '';              
            
            
               
             


  
  
  
                               
                                    

                
   open curempdetail;                                    
   fetch curempdetail into shiecode1,shiecode2,shiecode3,shiecode4,shiecode5,shiecode6,
   sdsgcode,semptype,salgrd;
   close curempdetail;                                    
                                    


                              
   open curtakehome;                           
   fetch curtakehome into takehomeper;                                  
   close curtakehome;                                             
                                  
                                  
                                  

   open curfixedearnamt;                                  
   fetch curfixedearnamt into fixedearnamt;                       
   close curfixedearnamt;                                  
                                   
                         

                        

                                  
  
 
 
                                      
                           

            
            
            
            
   open curfixeddeductions;                                  
   fetch curfixeddeductions into fixeddeductions;                                  
   close curfixeddeductions;                                  
                        
                           
   if   ifnull(takehomeper,0) > 0 then
    
      if(fixedearnamt*(takehomeper/100)) > fixedearnamt -((fixeddeductions+loanamt)) then
            
         set  intstatus = 1;
      else
         set  intstatus=-1;
      end if;
   end if;    
            

   if ifnull(netpay,0) < 0 then        
      set  intstatus = 4;
   end if;                 

                    
   
         
         insert into
         hs_pr_payprocess(emp_number,pay_startdate,pay_enddate,pay_gross_salary,pay_netpay,
  pay_dsg_code, pay_hie_code_1,
        pay_hie_code_2,
        pay_hie_code_3,
        pay_hie_code_4,
        pay_hie_code_5,
        pay_hie_code_6,
        pay_emp_type,                         
 pay_processed_date,pay_proc_user)
values(empnumber,start_date,end_date,
  grosssalary,
  netpay,    
  sdsgcode,
  shiecode1,shiecode2,shiecode3, shiecode4, shiecode5, shiecode6,
  semptype,
  current_timestamp,getUser());
     
                
            
   set ioutput = intstatus;
   
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spbanktransfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `spbanktransfer`(start_date datetime,                                      
end_date datetime,                                      
empnumber varchar(6))
begin
   
   declare snatvcurrency varchar(6);    
   declare sempnatvcurrency varchar(6);    
   declare brnchcode varchar(6);    
   declare bnkcode varchar(6);    
   declare baccnumber varchar(80);    
   declare bacccurrcode varchar(6);    
   declare strncurrency varchar(6);    
    
   declare roundby numeric;                               
   declare roundtype numeric;     
   declare ipaymode numeric;    
   declare nismultinet numeric;    
   declare intstatus numeric;    
   declare inatorder numeric;    
   declare ncash_bkt numeric(13,2);    
   declare nmain_bkt numeric(13,2);    
   declare nbanktrans_bkt numeric(13,2);    
   declare nbankamount numeric(13,2);    
   declare nnatamt numeric(13,2);    
   declare ntransfering numeric(13,2);    
   declare ntotbnktrans numeric(13,2);    
   declare nbasecurrencynetsum numeric(13,2);    
   declare ncfamt numeric(13,2);    
   declare ntemppaidsal numeric(13,2);    
   declare npaidsalary numeric(13,2);    
   declare ntempcfamt numeric(13,2);    
   declare cashamount numeric(13,2);    
   declare ncftotal numeric(13,2);    
   declare nnetpay numeric(13,2);   
   declare nbasenetpay numeric(13,2);   
   declare ntempnetpay numeric(13,2);    
   declare ntempbasenetpay numeric(13,2); 
   declare nbasecfamt numeric(13,2); 
    
   declare no_data int default 0;
   
    
   declare curnetsal cursor for    
   select  pay_netpay    
   from    hs_pr_payprocess     
   where   pay_startdate = start_date and       
   pay_enddate = end_date  and     
   emp_number = empnumber;

   declare curempbankdetail cursor for                             
   select     
   eb.bbranch_code,  b.bank_code,eb.ebank_acc_no,    
                ifnull(eb.ebank_amount,0) as ebank_amount

   from                    
   hs_hr_emp_bank eb,hs_hr_bank b,hs_hr_branch  br,hs_pr_payprocess p                
   where                      
   b.bank_code = br.bank_code and                 
   br.bbranch_code = eb.bbranch_code and                   
   ebank_active_flag = 1 and    
   p.emp_number = eb.emp_number and      
   eb.emp_number = empnumber and           
   coalesce(eb.ebank_start_date,start_date) <= start_date and      
   coalesce(eb.ebank_end_date,end_date) >= end_date    
   and    
   p.pay_startdate = start_date and p.pay_enddate = end_date    
   group by eb.bbranch_code,b.bank_code,eb.ebank_acc_no,eb.ebank_amount,
   eb.ebank_order                             
   order by  eb.ebank_order;

 
  declare continue handler for sqlexception
   begin
      set no_data = -2;
   end;
   declare continue handler for not found set no_data = -1;
   set ncash_bkt = 0;    
   set nmain_bkt = 0;    
   set nnatamt = 0;    
   set nbanktrans_bkt = 0;    
   set ntransfering = 0;    
   set ntotbnktrans = 0;    
   set nbasecurrencynetsum = 0;    
   set ncfamt = 0;     
   set npaidsalary = 0;    
   set ntempcfamt = 0;     
   set cashamount = 0;    
   set intstatus = 0;    
   set inatorder = 0;    
   set ncftotal = 0;    
   set strncurrency = 0;    
   set nnetpay = 0;    
   set ntempnetpay = 0;   
   set nbasenetpay = 0;   
   set ntempbasenetpay = 0;  
   set nbasecfamt = 0;
    
    
    
      
    
    

       
    


 














    
  set ipaymode =(select coalesce(sal_cash_flag) from hs_pr_employee  where emp_number = empnumber);    
  
   

   open curnetsal;    
   set no_data = 0;
   fetch curnetsal into nnetpay;    
	
   while (no_data = 0) do      
        
      select   coalesce(sum(pay_cf_amt),0) into ncfamt from hs_pr_payprocess p,
         (select max(pay_startdate) as prev_date
         from hs_pr_payprocess
         where pay_startdate < start_date   and
         emp_number = empnumber ) a where a.prev_date = p.pay_startdate  and
      p.emp_number = empnumber;
      set ntempnetpay = nnetpay+coalesce(ncfamt,0);

      set npaidsalary =(select ntempnetpay); 

      
      set ncftotal = ncftotal+coalesce(ncfamt,0); 

      if  ipaymode = 1  then  
                
         set ntempcfamt = ntempnetpay -npaidsalary;
	
         set cashamount =  npaidsalary;

         set nmain_bkt = 0;       
                       
         update  hs_pr_payprocess
         set pay_netpay = ntempnetpay,pay_cash_paid_amt = cashamount,
         pay_bank_paid_amt = 0,         
         pay_cf_amt = ntempcfamt,pay_bf_amt = ncfamt,
         pay_grossnet_amt =  nnetpay    
              
         where pay_startdate = start_date and pay_enddate = end_date
         and emp_number = empnumber;
      else
         update  hs_pr_payprocess
         set pay_netpay = ntempnetpay,pay_cash_paid_amt = 0,
         pay_paid_salary = npaidsalary,
         pay_cf_amt = 0,pay_bf_amt = 0,
         pay_grossnet_amt =  nnetpay
         where pay_startdate = start_date and pay_enddate = end_date
         and emp_number = empnumber;
      end if;
      set no_data = 0;
      fetch curnetsal into nnetpay;
	
   end while; 
   set ntemppaidsal =  nbasecurrencynetsum+coalesce(ncftotal,0);   

   set nmain_bkt =  ntemppaidsal -ncash_bkt;      
   	      	    	
	     
  
    
   close curnetsal;          
        

 
    
   if  ipaymode = 0  then                  


















             
  
   
      open curempbankdetail;
      set no_data = 0;
      fetch curempbankdetail into brnchcode,bnkcode,baccnumber,nbankamount;
      while (no_data = 0) do  
	  
         set nbanktrans_bkt = 0; 
         set nbankamount = nbankamount; 
         if nbankamount=0 then
          
           set no_data = 1;
            set   ntotbnktrans=nnetpay;
           if ncash_bkt>0 then

            set   ntempnetpay=ncash_bkt;
            
           end if;
          
          insert into
               hs_pr_bank_transfers(emp_number,bank_code,bbranch_code,ebank_acc_no,
               ebt_start_date,ebt_end_date,ebt_amount,ebt_cur_base_amount)
               values(empnumber,bnkcode,brnchcode,baccnumber,start_date,end_date,
               ntempnetpay ,ntempnetpay);
         else
	 set ncash_bkt = (nnetpay -nbankamount);
	
	 
 	
        
       
      
                
          
         
               
            
		

           
            
            
             
		
	
          
        
       
       
           
       

         if ncash_bkt < 0 then
        
            set ncash_bkt = ncash_bkt -abs(nbanktrans_bkt);
            set nbanktrans_bkt = 0;
            set ntotbnktrans = nnetpay;
         else 
            if nnetpay > 0 then

           
               
                

             

              if nnetpay >= nbankamount  then
               insert into
               hs_pr_bank_transfers(emp_number,bank_code,bbranch_code,ebank_acc_no,
               ebt_start_date,ebt_end_date,ebt_amount,ebt_cur_base_amount)
               values(empnumber,bnkcode,brnchcode,baccnumber,start_date,end_date,
               nbankamount ,nbankamount);
                 set ntotbnktrans = ntotbnktrans+nbankamount;
              else
               if nbankamount >= nnetpay  then
                insert into
               hs_pr_bank_transfers(emp_number,bank_code,bbranch_code,ebank_acc_no,
               ebt_start_date,ebt_end_date,ebt_amount,ebt_cur_base_amount)
               values(empnumber,bnkcode,brnchcode,baccnumber,start_date,end_date,
               nnetpay ,nnetpay);
                set ntotbnktrans = ntotbnktrans+nnetpay;
               
               end if;
             end if;

            end if;
         end if;
        end if;
          
          
         update  hs_pr_payprocess
         set  pay_cash_paid_amt = 0,pay_bank_paid_amt = 0
         where
         pay_startdate = start_date and pay_enddate = end_date and
         emp_number = empnumber;     
  
         set no_data = 0;
         fetch curempbankdetail into  brnchcode,bnkcode,baccnumber,nbankamount;
      end while;

    
      set ncash_bkt = ncash_bkt;
      close curempbankdetail;
  
      set cashamount = 0;
      set ntempcfamt = 0;
      if ncash_bkt > 0  then
      
         set cashamount = ncash_bkt;
         set ntempcfamt = ncash_bkt - cashamount;
         set intstatus  = 2;
      else
         
                     set intstatus = 0;
         
      end if;
      set npaidsalary = cashamount+ntotbnktrans;      

      set cashamount= nnetpay-ntotbnktrans;
     
      update
      hs_pr_payprocess
      set
      pay_cash_paid_amt = cashamount,pay_bank_paid_amt = ntotbnktrans,pay_paid_salary = npaidsalary,
          
      
      pay_cf_amt = ntempcfamt,pay_bf_amt = ncfamt
            where
      pay_startdate = start_date and pay_enddate = end_date  and
      emp_number = empnumber;
   end if;              
 


end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDefaultTransAssign` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `spDefaultTransAssign`(empnumber varchar(6),amount numeric(13,2))
begin

 Delete e.* from hs_pr_txn_eligibility e left join hs_pr_transaction_details p on e.trn_dtl_code=p.trn_dtl_code  where emp_number=empnumber and  p.trn_dtl_isdefault_flg=1;

 insert into hs_pr_txn_eligibility             
  (emp_number,trn_dtl_code,trn_dtl_startdate,trn_dtl_enddate,tre_amount,tre_stop_flag,tre_empcon,
   tre_eyrcon,dbgroup_user_id)
	select emp_number,trn_dtl_code,NOW(),NOW(),
	(case erndedcon	when 1 then amount else 0 end) as totAmount,
	0,trn_dtl_empcont,trn_dtl_eyrcont,getuser()
	From hs_pr_employee e,hs_pr_transaction_details d,hs_pr_transaction_type t 
	where trn_dtl_isdefault_flg=1 and emp_number=empnumber and t.trn_typ_code=d.trn_typ_code;
		
  


end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spgetUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `spgetUser`()
begin

select @empNumber;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spinitaliseemployeepaydetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `spinitaliseemployeepaydetails`(start_date datetime,          
end_date datetime,          
empnumber varchar(6))
begin
   
   
   


 delete from
  hs_pr_exceptions
   where
  
   pro_startdate = start_date and
   pro_enddate = end_date and
   emp_number = empnumber;

 delete from
   hs_pr_processedemp
   where
   pro_payfrequency = 1 and
   pro_startdate = start_date and
   pro_enddate = end_date and
   emp_number = empnumber;            
   delete from hs_pr_processedtxn  where emp_number = empnumber and trn_startdate = start_date and  trn_enddate = end_date ;         
    delete from hs_pr_bank_transfers where emp_number = empnumber and ebt_start_date = start_date and ebt_end_date = end_date;         
   delete from hs_pr_payprocess where emp_number = empnumber  and pay_startdate = start_date and pay_enddate = end_date ;      
   
   
   

      

      

   
   update  hs_ln_header
   set ln_hd_inactive_period = ln_hd_inactive_period+1
   where emp_number = empnumber and exists(select * from(select p.emp_number,p.ln_hd_sequence,p.ln_ty_number,ln_processed_from_date
      from   hs_ln_header h,hs_ln_processed_loan p
      where	h.ln_ty_number = p.ln_ty_number and
      h.emp_number = p.emp_number and
      h.ln_hd_sequence = p.ln_hd_sequence and p.emp_number = empnumber and
      p.ln_processed_from_date = start_date and p.ln_processed_to_date = end_date and
      coalesce(p.ln_processed_capital,0)+coalesce(p.ln_processed_interest,0) = 0) act_loan
   where hs_ln_header.emp_number = act_loan.emp_number and
   hs_ln_header.ln_hd_sequence = act_loan.ln_hd_sequence and
   hs_ln_header.ln_ty_number = act_loan.ln_ty_number) ;



   update hs_ln_header
   set ln_hd_is_active_flg = 1,ln_hd_settled_flg = 0
   where emp_number = empnumber and exists(select * from(select p.emp_number,p.ln_hd_sequence,p.ln_ty_number,ln_processed_from_date
      from	hs_ln_header h,hs_ln_processed_loan p
      where	h.ln_ty_number = p.ln_ty_number and
      h.emp_number = p.emp_number and
      h.ln_hd_sequence = p.ln_hd_sequence and p.emp_number = empnumber and coalesce(h.ln_hd_bal_amount,0) = 0  
	  and  p.ln_processed_from_date = start_date and p.ln_processed_to_date = end_date) act_loan
   where hs_ln_header.emp_number = act_loan.emp_number and
   hs_ln_header.ln_hd_sequence = act_loan.ln_hd_sequence and
   hs_ln_header.ln_ty_number = act_loan.ln_ty_number);


   
   update hs_ln_header, hs_ln_schedule
   set  hs_ln_header.ln_hd_bal_amount =  ln_hd_bal_amount+ln_sch_cap_amt,hs_ln_header.ln_hd_bal_installment = ln_hd_bal_installment+1
   where hs_ln_header.ln_ty_number = hs_ln_schedule.ln_ty_number and
   hs_ln_header.ln_hd_sequence = hs_ln_schedule.ln_hd_sequence and
   hs_ln_header.emp_number = hs_ln_schedule.emp_number and
   ln_sch_proc_from_date =  start_date and
   ln_sch_proc_to_date = end_date and
   hs_ln_header.emp_number = empnumber;    



   delete from hs_ln_processed_loan where emp_number = empnumber  and ln_processed_from_date = start_date and ln_processed_to_date = end_date;    
    

      

   update  hs_ln_schedule
   set ln_sch_is_processed = 0,ln_sch_proc_from_date = null,ln_sch_proc_to_date = null
   where   emp_number = empnumber and
   ln_sch_is_processed = 1 and
   ln_sch_proc_from_date = start_date  and
   ln_sch_proc_to_date = end_date;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPrException` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `spPrException`(start_date datetime,          
end_date datetime,          
empnumber varchar(6),batchId varchar(100),errortype varchar(4))
begin
	
	      
              		
		insert into
  			hs_pr_exceptions(pro_startdate,pro_enddate,
			emp_number,pro_batch_id,exception_id) 
			VALUES(start_date,end_date,empnumber,batchId,errortype);
             	
               



end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spprocessgrosssalary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `spprocessgrosssalary`(start_date datetime,    
end_date datetime,    
empnumber varchar(6))
begin

   select
   e.emp_number,ifnull(ag.trn_proc_emp_amt,0) -ifnull(dg.trn_proc_emp_amt,0) as grosssalary
   from(hs_pr_employee e
   left join(select
      p.emp_number,ifnull(sum(trn_proc_emp_amt),0) as trn_proc_emp_amt
      from
      hs_pr_processedtxn p,hs_pr_transaction_details d,hs_pr_transaction_type t
      where
      p.trn_dtl_code = d.trn_dtl_code and t.trn_typ_code = d.trn_typ_code
      and  p.trn_startdate  = start_date and p.trn_enddate  = end_date
      and  p.emp_number = empnumber and (erndedcon = 1 or erndedcon = 2)
      and trn_dtl_addtonetpay = 0 
      group by p.emp_number) ag
   on e.emp_number = ag.emp_number) left join(select
      p.emp_number,ifnull(sum(trn_proc_emp_amt),0) as trn_proc_emp_amt
      from
      hs_pr_processedtxn p,hs_pr_transaction_details d,hs_pr_transaction_type t
      where
      p.trn_dtl_code = d.trn_dtl_code and t.trn_typ_code = d.trn_typ_code
      and  p.trn_startdate  = start_date and p.trn_enddate  = end_date
      and  p.emp_number = empnumber and (erndedcon = -1 or erndedcon = 0) and
      trn_dtl_addtonetpay = 0
      group by p.emp_number) dg
   on e.emp_number = dg.emp_number where e.emp_number=empnumber;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spprocessloans` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `spprocessloans`(start_date datetime,end_date datetime,empnumber varchar(6))
begin
   declare scurrency varchar(6);
   declare snatvecur varchar(6);

  
   update hs_ln_schedule
   set     hs_ln_schedule.ln_sch_is_processed = 1,hs_ln_schedule.ln_sch_proc_from_date = start_date,
   hs_ln_schedule.ln_sch_proc_to_date = end_date   
   where   hs_ln_schedule.emp_number = empnumber and
   exists(select * from(select  hs_ln_schedule.emp_number,hs_ln_schedule.ln_hd_sequence,hs_ln_schedule.ln_ty_number,min(hs_ln_schedule.ln_sch_ins_no) ln_sch_ins_no
      from hs_ln_type, hs_ln_header, hs_ln_schedule
      where   hs_ln_type.ln_ty_number = hs_ln_header.ln_ty_number and
      coalesce(hs_ln_type.ln_ty_inactive_type_flg,0) = 1 and
      coalesce(hs_ln_header.ln_hd_is_active_flg,0) = 1  and
       coalesce(case hs_ln_header.ln_hd_inactive_period when -1 then 0 else hs_ln_header.ln_hd_inactive_period end,0) = 0  and
       coalesce(hs_ln_header.ln_hd_settled_flg,0) = 0  and     
       coalesce(hs_ln_header.ln_hd_bal_amount,0) > 0  and
       coalesce(hs_ln_schedule.ln_sch_is_processed,0) = 0  and
       coalesce(hs_ln_schedule.ln_st_number,0) = 0  and
	 
       hs_ln_header.ln_hd_apply_date <= end_date    and
       hs_ln_header.ln_hd_effective_date <= end_date   and
       hs_ln_header.ln_ty_number = hs_ln_schedule.ln_ty_number and
       hs_ln_header.emp_number = hs_ln_schedule.emp_number and
       hs_ln_header.ln_hd_sequence = hs_ln_schedule.ln_hd_sequence and
       hs_ln_schedule.emp_number = empnumber
      group by hs_ln_schedule.emp_number,hs_ln_schedule.ln_hd_sequence,hs_ln_schedule.ln_ty_number) res
   where
   hs_ln_schedule.emp_number = res.emp_number and
   hs_ln_schedule.ln_hd_sequence = res.ln_hd_sequence and
   hs_ln_schedule.ln_ty_number = res.ln_ty_number  and
   hs_ln_schedule.ln_sch_ins_no = res.ln_sch_ins_no);      
  
      
 
   update hs_ln_header
   set
   hs_ln_header.ln_hd_lst_proc_from_date = start_date,hs_ln_header.ln_hd_lst_proc_to_date = end_date,
   hs_ln_header.ln_hd_bal_installment = hs_ln_header.ln_hd_bal_installment -1,hs_ln_header.ln_hd_bal_amount = hs_ln_header.ln_hd_bal_amount -(select ln_sch_cap_amt
   from(select  hs_ln_schedule.emp_number,hs_ln_schedule.ln_hd_sequence,hs_ln_schedule.ln_ty_number,hs_ln_schedule.ln_sch_cap_amt
      from hs_ln_schedule
      where
      coalesce(hs_ln_schedule.ln_sch_is_processed,0) = 1 and
      hs_ln_schedule.ln_sch_proc_from_date = start_date and
      hs_ln_schedule.ln_sch_proc_to_date = end_date and
      hs_ln_schedule.emp_number = empnumber ) res
   where
   hs_ln_header.emp_number = res.emp_number and
   hs_ln_header.ln_hd_sequence = res.ln_hd_sequence and
   hs_ln_header.ln_ty_number = res.ln_ty_number)
   where exists(select  hs_ln_schedule.emp_number,hs_ln_schedule.ln_hd_sequence,hs_ln_schedule.ln_ty_number,hs_ln_schedule.ln_sch_cap_amt
   from hs_ln_schedule
   where
   coalesce(hs_ln_schedule.ln_sch_is_processed,0) = 1 and
   hs_ln_schedule.ln_sch_proc_from_date = start_date and
   hs_ln_schedule.ln_sch_proc_to_date = end_date and
   hs_ln_schedule.emp_number = empnumber and
   hs_ln_header.ln_ty_number = hs_ln_schedule.ln_ty_number and
   hs_ln_header.emp_number = hs_ln_schedule.emp_number and
   hs_ln_header.ln_hd_sequence = hs_ln_schedule.ln_hd_sequence);        
  

  
   update hs_ln_header
   set ln_hd_settled_flg = 3,ln_hd_is_active_flg = 0
   where emp_number = empnumber and
   coalesce(ln_hd_inactive_period,0) = 0 and coalesce(ln_hd_is_active_flg,0) = 1 and
   coalesce(ln_hd_bal_amount,0) = 0;      
       
 
       
   insert into hs_ln_processed_loan(emp_number,ln_hd_sequence,ln_sch_ins_no,ln_ty_number,
                                  ln_processed_from_date,ln_processed_to_date,
                ln_processed_capital,ln_processed_interest,ln_interest_rate,
				ln_bal_installment,ln_bal_amount)
   select s.emp_number,s.ln_hd_sequence,ln_sch_ins_no,s.ln_ty_number,
        start_date,end_date,ln_sch_cap_amt,ln_sch_inst_amount,ln_sch_inst_rate,
        ln_hd_bal_installment,
        ln_hd_bal_amount
   from hs_ln_header h,hs_ln_schedule s
   where	h.ln_hd_sequence = s.ln_hd_sequence and
   h.emp_number = s.emp_number and
   h.ln_ty_number = s.ln_ty_number and
   s.emp_number = empnumber and
   s.ln_sch_is_processed = 1 and
   s.ln_sch_proc_from_date = start_date  and
   s.ln_sch_proc_to_date = end_date
   union all
   select h.emp_number,h.ln_hd_sequence,1 ln_hd_installment,h.ln_ty_number,start_date from_date,end_date to_date,
		0 processed_capital,0 processed_interest,t.ln_ty_interest_rate,
        0 ln_bal_installment,0 ln_bal_amount
   from   hs_ln_type t,hs_ln_header h
   where coalesce(t.ln_ty_inactive_type_flg,0) = 1 and
   t.ln_ty_number = h.ln_ty_number and
   h.emp_number = empnumber  and ln_hd_inactive_period > 0;   
   
   

  
 
   update hs_ln_header
   set ln_hd_inactive_period = coalesce(ln_hd_inactive_period,0) -1
   where emp_number = empnumber and coalesce(ln_hd_inactive_period,0) > 0 and
   exists(select * from(select h.emp_number,h.ln_hd_sequence,h.ln_ty_number
      from   hs_ln_type t,hs_ln_header h
      where coalesce(t.ln_ty_inactive_type_flg,0) = 1 and
      t.ln_ty_number = h.ln_ty_number and
      h.emp_number = empnumber) act_loan
   where hs_ln_header.emp_number = act_loan.emp_number and 
   hs_ln_header.ln_hd_sequence = act_loan.ln_hd_sequence and
   hs_ln_header.ln_ty_number = act_loan.ln_ty_number);

   update hs_ln_header
   set ln_hd_is_active_flg = 1
   where emp_number = empnumber and ln_hd_inactive_period=0 and ln_hd_settled_flg!=1; 
   
   
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spprocessnetpay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `spprocessnetpay`(start_date datetime,            
end_date datetime,           
empnumber varchar(6),        
grosssalary numeric(13,2))
begin

   declare sbasecurr varchar(6);
   
  
   select
   gn.emp_number, grosssalary+(grossnet -ifnull(totwebloan,0)) as netpay
   from(select
      e.emp_number,ifnull(ag.trn_proc_emp_amt,0) -ifnull(dg.trn_proc_emp_amt,0) as grossnet
      from(hs_pr_employee e
      left join(select
         p.emp_number,ifnull(sum(trn_proc_emp_amt),0) as trn_proc_emp_amt
         from
         hs_pr_processedtxn p,hs_pr_transaction_details d,hs_pr_transaction_type t
         where p.trn_dtl_code = d.trn_dtl_code and t.trn_typ_code = d.trn_typ_code 
         and  p.trn_startdate  = start_date and p.trn_enddate = end_date
         and  p.emp_number = empnumber and (erndedcon = 1 or erndedcon = 2 )
         and trn_dtl_addtonetpay = 1
         group by p.emp_number) ag
      on e.emp_number = ag.emp_number )
      left join(select p.emp_number,ifnull(sum(trn_proc_emp_amt),0) as trn_proc_emp_amt
         from hs_pr_processedtxn p,hs_pr_transaction_details d,hs_pr_transaction_type t
         where p.trn_dtl_code = d.trn_dtl_code and t.trn_typ_code = d.trn_typ_code
         and  p.trn_startdate  = start_date and p.trn_enddate  = end_date
         and  p.emp_number = empnumber and (erndedcon = -1 or erndedcon = 0) and trn_dtl_addtonetpay = 1
         group by p.emp_number) dg
      on e.emp_number = dg.emp_number where e.emp_number = empnumber) gn 
	   left join(select s.emp_number,
   sum(coalesce(s.ln_sch_inst_amount,0)) totwebloan
      from hs_ln_schedule s,hs_pr_employee e
      where s.emp_number = e.emp_number and
      ln_sch_is_processed = 1  and ln_sch_proc_from_date = start_date and ln_sch_proc_to_date = end_date and
      s.emp_number = empnumber
      group by s.emp_number) sl
   on gn.emp_number = sl.emp_number;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spprocesstransactions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `spprocesstransactions`(start_date datetime,end_date datetime,empnumber varchar(6))
begin

   declare snatvcurrency varchar(6);  
            
   insert into hs_pr_processedtxn             
   (emp_number,trn_dtl_code,trn_startdate,trn_enddate,trn_contribution,trn_proc_emp_amt,trn_proc_eyr_amt,
   trn_proc_emp_fullamt,trn_ytd_eyr_amount)
	select 
  emp_number,trn_dtl_code,startdate,enddate,contribution,
  emp_amount,eyr_amount,
  emp_amount as trn_proc_cur_base_emp_amt,
  eyr_amount as trn_proc_cur_base_eyr_amt
   from(select
      emp_number,e.trn_dtl_code,start_date as startdate,end_date as enddate,0 as contribution,
    (case when d.trn_dtl_isprorate_flg = 1  then(prorate(empnumber,start_date,end_date,(case t.erndedcon when 1  then prorateempincrement(empnumber,start_date,end_date,e.tre_amount)
         else e.tre_amount end))) else(case t.erndedcon when 1  then prorateempincrement(empnumber,start_date,end_date,e.tre_amount)
         else e.tre_amount end)
      end)
      as emp_amount,0 as eyr_amount   
     
      from
      hs_pr_transaction_details d,  
  hs_pr_transaction_type t,
  hs_pr_txn_eligibility e
      where
      e.trn_dtl_code = d.trn_dtl_code and
      t.trn_typ_code = d.trn_typ_code and
          
      erndedcon <> 0  and
     ((e.trn_dtl_startdate <= start_date  and end_date <= e.trn_dtl_enddate)
      or  trn_typ_type = 1) and coalesce(trn_dtl_isbasetxn_flg,0) = 0 and tre_stop_flag=0 
      and  emp_number = empnumber  ) tem ;
      
	  
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spprocesstxncontributions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `spprocesstxncontributions`(start_date datetime,        
end_date datetime,        
empnumber varchar(6))
begin

   
declare snatvcurrency varchar(6);



   
   insert into
   hs_pr_processedtxn(emp_number,trn_dtl_code,
			trn_startdate,trn_enddate,trn_contribution,trn_proc_emp_amt,trn_proc_eyr_amt,
			trn_proc_emp_fullamt)
   select a.* ,emp_amount
           
   from(select
      emp_number,e.trn_dtl_code,start_date as pay_startdate,end_date as pay_enddate,
		  case when sum(contribution) > 0 then sum(contribution) else 0 
      end as contribution,(case  when  sum(contribution*tre_empcon/100) > 0  then
         sum(contribution*tre_empcon/100)
      else 0
      end) as emp_amount,
		  case 
      when sum((contribution*tre_eyrcon/100)) > 0  then
         sum((contribution*tre_eyrcon/100))
      else 0
      end as eyr_amount
		  
      from
      hs_pr_txn_eligibility e,
          hs_pr_transaction_details d,
		  
      	  (select
         trn_dtl_base_code,b.trn_dtl_code,contribution
					
         from(select
            trn_dtl_base_code,a.trn_dtl_code,sum(trn_proc_emp_amt) as contribution
            from(select      trn_dtl_base_code,c.trn_dtl_code,
               case erndedcon
               when 1 then trn_proc_emp_amt*1
               when 2 then trn_proc_emp_amt*1
               when 0 then trn_proc_emp_amt*1
               when -1 then trn_proc_emp_amt*-1
               when 8 then trn_proc_emp_amt*-1
               end as trn_proc_emp_amt
               from
               hs_pr_transaction_type t,hs_pr_transaction_details d,hs_pr_processedtxn p,hs_pr_contribution_base c
               where
               t.trn_typ_code = d.trn_typ_code and
               d.trn_dtl_code = p.trn_dtl_code and
               
               p.trn_dtl_code = c.trn_dtl_base_code and p.trn_startdate  = start_date and
               p.trn_enddate = end_date and p.emp_number = empnumber group by trn_dtl_base_code) a
            group by trn_dtl_base_code)b )c
         
      where
      e.trn_dtl_code = c.trn_dtl_code and e.emp_number = empnumber   and
      e.trn_dtl_code = d.trn_dtl_code and trn_disable_flg = 0  and       
      d.trn_dtl_code = c.trn_dtl_code  and 
       coalesce(d.trn_dtl_isbasetxn_flg,0) = 0
      
      group by
      emp_number,e.trn_dtl_code,e.trn_dtl_startdate ) a;
      

      
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_hs_hr_employee`
--

/*!50001 DROP TABLE IF EXISTS `vw_hs_hr_employee`*/;
/*!50001 DROP VIEW IF EXISTS `vw_hs_hr_employee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_hs_hr_employee` AS select `e`.`emp_number` AS `emp_number`,`e`.`employee_id` AS `employee_id`,`e`.`emp_lastname` AS `emp_lastname`,`e`.`emp_firstname` AS `emp_firstname`,`e`.`ethnic_race_code` AS `ethnic_race_code`,`e`.`emp_birthday` AS `emp_birthday`,`e`.`nation_code` AS `nation_code`,`e`.`emp_status` AS `emp_status`,`e`.`job_title_code` AS `job_title_code`,`e`.`act_job_title_code` AS `act_job_title_code`,`e`.`work_station` AS `work_station`,`e`.`act_work_station` AS `act_work_station`,`e`.`emp_work_station_hof_flg` AS `emp_work_station_hof_flg`,`e`.`emp_act_work_station_hof_flg` AS `emp_act_work_station_hof_flg`,`e`.`terminated_date` AS `terminated_date`,`e`.`termination_reason` AS `termination_reason`,`e`.`service_code` AS `service_code`,`e`.`grade_code` AS `grade_code`,`e`.`slt_scale_year` AS `slt_scale_year`,`e`.`level_code` AS `level_code`,`e`.`emp_app_letter_no` AS `emp_app_letter_no`,`e`.`emp_personal_file_no` AS `emp_personal_file_no`,`e`.`title_code` AS `title_code`,`e`.`emp_initials` AS `emp_initials`,`e`.`emp_initials_si` AS `emp_initials_si`,`e`.`emp_initials_ta` AS `emp_initials_ta`,`e`.`emp_names_of_initials` AS `emp_names_of_initials`,`e`.`emp_names_of_initials_si` AS `emp_names_of_initials_si`,`e`.`emp_names_of_initials_ta` AS `emp_names_of_initials_ta`,`e`.`emp_firstname_si` AS `emp_firstname_si`,`e`.`emp_firstname_ta` AS `emp_firstname_ta`,`e`.`emp_lastname_si` AS `emp_lastname_si`,`e`.`emp_lastname_ta` AS `emp_lastname_ta`,`e`.`gender_code` AS `gender_code`,`e`.`emp_birth_location` AS `emp_birth_location`,`e`.`emp_birth_location_si` AS `emp_birth_location_si`,`e`.`emp_birth_location_ta` AS `emp_birth_location_ta`,`e`.`marst_code` AS `marst_code`,`e`.`emp_married_date` AS `emp_married_date`,`e`.`emp_nic_no` AS `emp_nic_no`,`e`.`emp_nic_date` AS `emp_nic_date`,`e`.`rlg_code` AS `rlg_code`,`e`.`lang_code` AS `lang_code`,`e`.`cou_code` AS `cou_code`,`e`.`emp_passport_no` AS `emp_passport_no`,`e`.`emp_attendance_no` AS `emp_attendance_no`,`e`.`emp_other_file_no` AS `emp_other_file_no`,`e`.`emp_salary_no` AS `emp_salary_no`,`e`.`emp_barcode_no` AS `emp_barcode_no`,`e`.`emp_public_app_date` AS `emp_public_app_date`,`e`.`emp_public_com_date` AS `emp_public_com_date`,`e`.`emp_app_date` AS `emp_app_date`,`e`.`emp_com_date` AS `emp_com_date`,`e`.`emp_rec_method` AS `emp_rec_method`,`e`.`emp_rec_method_desc` AS `emp_rec_method_desc`,`e`.`emp_rec_method_desc_si` AS `emp_rec_method_desc_si`,`e`.`emp_rec_method_desc_ta` AS `emp_rec_method_desc_ta`,`e`.`emp_rec_medium` AS `emp_rec_medium`,`e`.`emp_active_hrm_flg` AS `emp_active_hrm_flg`,`e`.`emp_active_att_flg` AS `emp_active_att_flg`,`e`.`emp_active_pr_flg` AS `emp_active_pr_flg`,`e`.`emp_wop_flg` AS `emp_wop_flg`,`e`.`emp_wop_no` AS `emp_wop_no`,`e`.`emp_confirm_flg` AS `emp_confirm_flg`,`e`.`emp_confirm_date` AS `emp_confirm_date`,`e`.`emp_prob_ext_flg` AS `emp_prob_ext_flg`,`e`.`emp_prob_from_date` AS `emp_prob_from_date`,`e`.`emp_prob_to_date` AS `emp_prob_to_date`,`e`.`class_code` AS `class_code`,`e`.`emp_salary_scale` AS `emp_salary_scale`,`e`.`emp_salary_scale_si` AS `emp_salary_scale_si`,`e`.`emp_salary_scale_ta` AS `emp_salary_scale_ta`,`e`.`emp_basic_salary` AS `emp_basic_salary`,`e`.`emp_salary_inc_date` AS `emp_salary_inc_date`,`e`.`emp_display_name` AS `emp_display_name`,`e`.`emp_display_name_si` AS `emp_display_name_si`,`e`.`emp_display_name_ta` AS `emp_display_name_ta`,`e`.`emp_pension_no` AS `emp_pension_no`,`e`.`emp_resign_date` AS `emp_resign_date`,`e`.`emp_retirement_date` AS `emp_retirement_date`,`e`.`emp_ldap_flag` AS `emp_ldap_flag`,`e`.`hie_code_1` AS `hie_code_1`,`e`.`hie_code_2` AS `hie_code_2`,`e`.`hie_code_3` AS `hie_code_3`,`e`.`hie_code_4` AS `hie_code_4`,`e`.`hie_code_5` AS `hie_code_5`,`e`.`hie_code_6` AS `hie_code_6`,`e`.`hie_code_7` AS `hie_code_7`,`e`.`hie_code_8` AS `hie_code_8`,`e`.`hie_code_9` AS `hie_code_9`,`e`.`hie_code_10` AS `hie_code_10`,`e`.`act_hie_code_1` AS `act_hie_code_1`,`e`.`act_hie_code_2` AS `act_hie_code_2`,`e`.`act_hie_code_3` AS `act_hie_code_3`,`e`.`act_hie_code_4` AS `act_hie_code_4`,`e`.`act_hie_code_5` AS `act_hie_code_5`,`e`.`act_hie_code_6` AS `act_hie_code_6`,`e`.`act_hie_code_7` AS `act_hie_code_7`,`e`.`act_hie_code_8` AS `act_hie_code_8`,`e`.`act_hie_code_9` AS `act_hie_code_9`,`e`.`act_hie_code_10` AS `act_hie_code_10`,`e`.`emp_ispaydownload` AS `emp_ispaydownload` from `hs_hr_employee` `e` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_hs_hr_employee2`
--

/*!50001 DROP TABLE IF EXISTS `vw_hs_hr_employee2`*/;
/*!50001 DROP VIEW IF EXISTS `vw_hs_hr_employee2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_hs_hr_employee2` AS select `e`.`emp_number` AS `emp_number`,`e`.`employee_id` AS `employee_id`,`e`.`emp_lastname` AS `emp_lastname`,`e`.`emp_firstname` AS `emp_firstname`,`e`.`ethnic_race_code` AS `ethnic_race_code`,`e`.`emp_birthday` AS `emp_birthday`,`e`.`nation_code` AS `nation_code`,`e`.`emp_status` AS `emp_status`,`e`.`job_title_code` AS `job_title_code`,`e`.`act_job_title_code` AS `act_job_title_code`,`e`.`work_station` AS `work_station`,`e`.`act_work_station` AS `act_work_station`,`e`.`emp_work_station_hof_flg` AS `emp_work_station_hof_flg`,`e`.`emp_act_work_station_hof_flg` AS `emp_act_work_station_hof_flg`,`e`.`terminated_date` AS `terminated_date`,`e`.`termination_reason` AS `termination_reason`,`e`.`service_code` AS `service_code`,`e`.`grade_code` AS `grade_code`,`e`.`slt_scale_year` AS `slt_scale_year`,`e`.`level_code` AS `level_code`,`e`.`emp_app_letter_no` AS `emp_app_letter_no`,`e`.`emp_personal_file_no` AS `emp_personal_file_no`,`e`.`title_code` AS `title_code`,`e`.`emp_initials` AS `emp_initials`,`e`.`emp_initials_si` AS `emp_initials_si`,`e`.`emp_initials_ta` AS `emp_initials_ta`,`e`.`emp_names_of_initials` AS `emp_names_of_initials`,`e`.`emp_names_of_initials_si` AS `emp_names_of_initials_si`,`e`.`emp_names_of_initials_ta` AS `emp_names_of_initials_ta`,`e`.`emp_firstname_si` AS `emp_firstname_si`,`e`.`emp_firstname_ta` AS `emp_firstname_ta`,`e`.`emp_lastname_si` AS `emp_lastname_si`,`e`.`emp_lastname_ta` AS `emp_lastname_ta`,`e`.`gender_code` AS `gender_code`,`e`.`emp_birth_location` AS `emp_birth_location`,`e`.`emp_birth_location_si` AS `emp_birth_location_si`,`e`.`emp_birth_location_ta` AS `emp_birth_location_ta`,`e`.`marst_code` AS `marst_code`,`e`.`emp_married_date` AS `emp_married_date`,`e`.`emp_nic_no` AS `emp_nic_no`,`e`.`emp_nic_date` AS `emp_nic_date`,`e`.`rlg_code` AS `rlg_code`,`e`.`lang_code` AS `lang_code`,`e`.`cou_code` AS `cou_code`,`e`.`emp_passport_no` AS `emp_passport_no`,`e`.`emp_attendance_no` AS `emp_attendance_no`,`e`.`emp_other_file_no` AS `emp_other_file_no`,`e`.`emp_salary_no` AS `emp_salary_no`,`e`.`emp_barcode_no` AS `emp_barcode_no`,`e`.`emp_public_app_date` AS `emp_public_app_date`,`e`.`emp_public_com_date` AS `emp_public_com_date`,`e`.`emp_app_date` AS `emp_app_date`,`e`.`emp_com_date` AS `emp_com_date`,`e`.`emp_rec_method` AS `emp_rec_method`,`e`.`emp_rec_method_desc` AS `emp_rec_method_desc`,`e`.`emp_rec_method_desc_si` AS `emp_rec_method_desc_si`,`e`.`emp_rec_method_desc_ta` AS `emp_rec_method_desc_ta`,`e`.`emp_rec_medium` AS `emp_rec_medium`,`e`.`emp_active_hrm_flg` AS `emp_active_hrm_flg`,`e`.`emp_active_att_flg` AS `emp_active_att_flg`,`e`.`emp_active_pr_flg` AS `emp_active_pr_flg`,`e`.`emp_wop_flg` AS `emp_wop_flg`,`e`.`emp_wop_no` AS `emp_wop_no`,`e`.`emp_confirm_flg` AS `emp_confirm_flg`,`e`.`emp_confirm_date` AS `emp_confirm_date`,`e`.`emp_prob_ext_flg` AS `emp_prob_ext_flg`,`e`.`emp_prob_from_date` AS `emp_prob_from_date`,`e`.`emp_prob_to_date` AS `emp_prob_to_date`,`e`.`class_code` AS `class_code`,`e`.`emp_salary_scale` AS `emp_salary_scale`,`e`.`emp_salary_scale_si` AS `emp_salary_scale_si`,`e`.`emp_salary_scale_ta` AS `emp_salary_scale_ta`,`e`.`emp_basic_salary` AS `emp_basic_salary`,`e`.`emp_salary_inc_date` AS `emp_salary_inc_date`,`e`.`emp_display_name` AS `emp_display_name`,`e`.`emp_display_name_si` AS `emp_display_name_si`,`e`.`emp_display_name_ta` AS `emp_display_name_ta`,`e`.`emp_pension_no` AS `emp_pension_no`,`e`.`emp_resign_date` AS `emp_resign_date`,`e`.`emp_retirement_date` AS `emp_retirement_date`,`e`.`emp_ldap_flag` AS `emp_ldap_flag`,`e`.`hie_code_1` AS `hie_code_1`,`e`.`hie_code_2` AS `hie_code_2`,`e`.`hie_code_3` AS `hie_code_3`,`e`.`hie_code_4` AS `hie_code_4`,`e`.`hie_code_5` AS `hie_code_5`,`e`.`hie_code_6` AS `hie_code_6`,`e`.`hie_code_7` AS `hie_code_7`,`e`.`hie_code_8` AS `hie_code_8`,`e`.`hie_code_9` AS `hie_code_9`,`e`.`hie_code_10` AS `hie_code_10`,`e`.`act_hie_code_1` AS `act_hie_code_1`,`e`.`act_hie_code_2` AS `act_hie_code_2`,`e`.`act_hie_code_3` AS `act_hie_code_3`,`e`.`act_hie_code_4` AS `act_hie_code_4`,`e`.`act_hie_code_5` AS `act_hie_code_5`,`e`.`act_hie_code_6` AS `act_hie_code_6`,`e`.`act_hie_code_7` AS `act_hie_code_7`,`e`.`act_hie_code_8` AS `act_hie_code_8`,`e`.`act_hie_code_9` AS `act_hie_code_9`,`e`.`act_hie_code_10` AS `act_hie_code_10`,`e`.`emp_ispaydownload` AS `emp_ispaydownload` from `hs_hr_employee` `e` where (`e`.`hie_code_1` in (select `l`.`hie_code_1` AS `hie_code_1` from (`hs_hr_emp_level` `l` join `hs_hr_users` `u`) where ((`l`.`emp_number` = `u`.`emp_number`) and (`l`.`emp_number` = 768) and ((`u`.`def_level` = 1) or (`u`.`def_level` = 4)))) or `e`.`hie_code_3` in (select `l`.`hie_code_3` AS `hie_code_3` from (`hs_hr_emp_level` `l` join `hs_hr_users` `u`) where ((`l`.`emp_number` = `u`.`emp_number`) and (`l`.`emp_number` = 768) and (`u`.`def_level` = 2))) or `e`.`hie_code_4` in (select `l`.`hie_code_4` AS `hie_code_4` from (`hs_hr_emp_level` `l` join `hs_hr_users` `u`) where ((`l`.`emp_number` = `u`.`emp_number`) and (`l`.`emp_number` = 768) and (`u`.`def_level` = 3)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_hs_hr_wf_main_data`
--

/*!50001 DROP TABLE IF EXISTS `vw_hs_hr_wf_main_data`*/;
/*!50001 DROP VIEW IF EXISTS `vw_hs_hr_wf_main_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_hs_hr_wf_main_data` AS select `mo`.`wfmod_id` AS `wfmod_id`,`mo`.`wfmod_name` AS `wfmod_name`,`mo`.`wfmod_name_si` AS `wfmod_name_si`,`mo`.`wfmod_name_ta` AS `wfmod_name_ta`,`mo`.`wfmod_view_name` AS `wfmod_view_name`,`ty`.`wftype_code` AS `wftype_code`,`ma`.`wfmain_iscomplete_flg` AS `wfmain_iscomplete_flg`,`ty`.`wftype_description` AS `wftype_description`,`ty`.`wftype_table_name` AS `wftype_table_name`,`ty`.`wftype_view_name` AS `wftype_view_name`,`ma`.`wfmain_id` AS `wfmain_id`,`ma`.`wfmain_sequence` AS `wfmain_sequence`,(case when isnull(`ap`.`wf_main_app_employee`) then `ma`.`wfmain_approving_emp_number` else `ap`.`wf_main_app_employee` end) AS `wfmain_approving_emp_number`,`ma`.`wfmain_flow_id` AS `wfmain_flow_id`,`ty`.`wftype_update_field` AS `wftype_update_field`,`ty`.`wftype_class` AS `wftype_class`,`ty`.`wftype_method_name` AS `wftype_method_name`,`ma`.`wfmain_previous_id` AS `wfmain_previous_id`,`ma`.`wfmain_application_date` AS `wfmain_application_date`,`ty`.`wftype_appmain_field` AS `wftype_appmain_field`,`ty`.`wftype_bulk_app_flg` AS `wftype_bulk_app_flg`,`ty`.`wftype_sort_field_name` AS `wftype_sort_field_name` from (((`hs_hr_wf_module` `mo` join `hs_hr_wf_type` `ty` on((`mo`.`wfmod_id` = `ty`.`wfmod_id`))) join `hs_hr_wf_main` `ma` on((`ty`.`wftype_code` = `ma`.`wftype_code`))) left join `hs_hr_wf_main_app_person` `ap` on(((`ma`.`wfmain_id` = `ap`.`wfmain_id`) and (`ma`.`wfmain_sequence` = `ap`.`wfmain_sequence`)))) where (`ma`.`wfmain_iscomplete_flg` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_hs_hr_wf_traning_data`
--

/*!50001 DROP TABLE IF EXISTS `vw_hs_hr_wf_traning_data`*/;
/*!50001 DROP VIEW IF EXISTS `vw_hs_hr_wf_traning_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_hs_hr_wf_traning_data` AS select `ma`.`wfmain_id` AS `ID`,`wtf`.`wfmod_id` AS `Module ID`,`ma`.`wfmain_flow_id` AS `APPROVAL LEVEL`,`ma`.`wftype_code` AS `WorkFlow Type Code`,`ma`.`wfmain_approving_emp_number` AS `Approving_Employee`,`e`.`emp_number` AS `Employee Number`,`e`.`employee_id` AS `Employee ID`,`e`.`emp_display_name` AS `Employee Name`,`td`.`td_asl_year` AS `Traning Year`,`c`.`td_course_name_en` AS `Course`,`i`.`td_inst_name_en` AS `Institute` from ((((((`hs_hr_td_assignlist` `td` join `vw_hs_hr_wf_main_data` `ma` on((`ma`.`wfmain_id` = `td`.`wfmain_id`))) left join `hs_hr_employee` `e` on((`e`.`emp_number` = `td`.`emp_number`))) left join `hs_hr_wf_type` `wtf` on((`ma`.`wftype_code` = `wtf`.`wftype_code`))) left join `hs_hr_module` `m` on((`m`.`mod_id` = convert(`wtf`.`wfmod_id` using utf8)))) left join `hs_hr_td_course` `c` on((`c`.`td_course_id` = `td`.`td_course_id`))) left join `hs_hr_td_institute` `i` on((`i`.`td_inst_id` = `c`.`td_inst_id`))) where ((`ma`.`wfmain_iscomplete_flg` = 0) and (`ma`.`wftype_code` = 6)) union all select `ma`.`wfmain_id` AS `ID`,`wtf`.`wfmod_id` AS `Module ID`,`ma`.`wfmain_flow_id` AS `APPROVAL LEVEL`,`ma`.`wftype_code` AS `WorkFlow Type Code`,`ma`.`wfmain_approving_emp_number` AS `Approving_Employee`,`e`.`emp_number` AS `Employee Number`,`e`.`employee_id` AS `Employee ID`,`e`.`emp_display_name` AS `Employee Name`,`td`.`td_asl_year` AS `Traning Year`,`c`.`td_course_name_en` AS `Course`,`i`.`td_inst_name_en` AS `Institute` from ((((((`hs_hr_td_assignlist` `td` join `vw_hs_hr_wf_main_data` `ma` on((`ma`.`wfmain_id` = `td`.`wfmain_id`))) left join `hs_hr_employee` `e` on((`e`.`emp_number` = `td`.`emp_number`))) left join `hs_hr_wf_type` `wtf` on((`ma`.`wftype_code` = `wtf`.`wftype_code`))) left join `hs_hr_module` `m` on((`m`.`mod_id` = convert(`wtf`.`wfmod_id` using utf8)))) left join `hs_hr_td_course` `c` on((`c`.`td_course_id` = `td`.`td_course_id`))) left join `hs_hr_td_institute` `i` on((`i`.`td_inst_id` = `c`.`td_inst_id`))) where ((`ma`.`wfmain_iscomplete_flg` = 0) and (`ma`.`wftype_code` = 5)) union all select `ma`.`wfmain_id` AS `ID`,`wtf`.`wfmod_id` AS `Module ID`,`ma`.`wfmain_flow_id` AS `APPROVAL LEVEL`,`ma`.`wftype_code` AS `WorkFlow Type Code`,`ma`.`wfmain_approving_emp_number` AS `Approving_Employee`,`e`.`emp_number` AS `Employee Number`,`e`.`employee_id` AS `Employee ID`,`e`.`emp_display_name` AS `Employee Name`,`td`.`td_asl_year` AS `Traning Year`,`c`.`td_course_name_en` AS `Course`,`i`.`td_inst_name_en` AS `Institute` from ((((((`hs_hr_td_assignlist` `td` join `vw_hs_hr_wf_main_data` `ma` on((`ma`.`wfmain_id` = `td`.`wfmain_id`))) left join `hs_hr_employee` `e` on((`e`.`emp_number` = `td`.`emp_number`))) left join `hs_hr_wf_type` `wtf` on((`ma`.`wftype_code` = `wtf`.`wftype_code`))) left join `hs_hr_td_course` `c` on((`c`.`td_course_id` = `td`.`td_course_id`))) left join `hs_hr_td_institute` `i` on((`i`.`td_inst_id` = `c`.`td_inst_id`))) left join `hs_hr_module` `m` on((`m`.`mod_id` = convert(`wtf`.`wfmod_id` using utf8)))) where ((`ma`.`wfmain_iscomplete_flg` = 0) and (`ma`.`wftype_code` = 4)) union all select `ma`.`wfmain_id` AS `ID`,`wtf`.`wfmod_id` AS `Module ID`,`ma`.`wfmain_flow_id` AS `APPROVAL LEVEL`,`ma`.`wftype_code` AS `WorkFlow Type Code`,`ma`.`wfmain_approving_emp_number` AS `Approving_Employee`,`e`.`emp_number` AS `Employee Number`,`e`.`employee_id` AS `Employee ID`,`e`.`emp_display_name` AS `Employee Name_en`,`td`.`td_asl_year` AS `Traning Year`,`c`.`td_course_name_en` AS `Course`,`i`.`td_inst_name_en` AS `Institute` from ((((((`hs_hr_td_assignlist` `td` join `vw_hs_hr_wf_main_data` `ma` on((`ma`.`wfmain_id` = `td`.`wfmain_id`))) left join `hs_hr_employee` `e` on((`e`.`emp_number` = `td`.`emp_number`))) left join `hs_hr_wf_type` `wtf` on((`ma`.`wftype_code` = `wtf`.`wftype_code`))) left join `hs_hr_td_course` `c` on((`c`.`td_course_id` = `td`.`td_course_id`))) left join `hs_hr_td_institute` `i` on((`i`.`td_inst_id` = `c`.`td_inst_id`))) left join `hs_hr_module` `m` on((`m`.`mod_id` = convert(`wtf`.`wfmod_id` using utf8)))) where ((`ma`.`wfmain_iscomplete_flg` = 0) and (`ma`.`wftype_code` = 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_hs_hr_wf_transfer_data`
--

/*!50001 DROP TABLE IF EXISTS `vw_hs_hr_wf_transfer_data`*/;
/*!50001 DROP VIEW IF EXISTS `vw_hs_hr_wf_transfer_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_hs_hr_wf_transfer_data` AS select `ma`.`wfmain_id` AS `ID`,`wtf`.`wfmod_id` AS `Module ID`,`ma`.`wfmain_flow_id` AS `APPROVAL LEVEL`,`ma`.`wftype_code` AS `WorkFlow Type Code`,`ma`.`wfmain_approving_emp_number` AS `Approving_Employee`,`e`.`emp_number` AS `Employee Number`,`e`.`emp_display_name` AS `Employee Name` from ((((`hs_hr_td_assignlist` `td` join `vw_hs_hr_wf_main_data` `ma` on((`ma`.`wfmain_id` = `td`.`wfmain_id`))) left join `hs_hr_employee` `e` on((`e`.`emp_number` = `td`.`emp_number`))) left join `hs_hr_wf_type` `wtf` on((`ma`.`wftype_code` = `wtf`.`wftype_code`))) left join `hs_hr_module` `m` on((`m`.`mod_id` = convert(`wtf`.`wfmod_id` using utf8)))) where ((`ma`.`wfmain_iscomplete_flg` = 0) and (`ma`.`wftype_code` = 7)) union all select `ma`.`wfmain_id` AS `ID`,`wtf`.`wfmod_id` AS `Module ID`,`ma`.`wfmain_flow_id` AS `APPROVAL LEVEL`,`ma`.`wftype_code` AS `WorkFlow Type Code`,`ma`.`wfmain_approving_emp_number` AS `Approving_Employee`,`e`.`emp_number` AS `Employee Number`,`e`.`emp_display_name` AS `Employee Name` from ((((`hs_hr_td_assignlist` `td` join `vw_hs_hr_wf_main_data` `ma` on((`ma`.`wfmain_id` = `td`.`wfmain_id`))) left join `hs_hr_employee` `e` on((`e`.`emp_number` = `td`.`emp_number`))) left join `hs_hr_wf_type` `wtf` on((`ma`.`wftype_code` = `wtf`.`wftype_code`))) left join `hs_hr_module` `m` on((`m`.`mod_id` = convert(`wtf`.`wfmod_id` using utf8)))) where ((`ma`.`wfmain_iscomplete_flg` = 0) and (`ma`.`wftype_code` = 5)) union all select `ma`.`wfmain_id` AS `ID`,`wtf`.`wfmod_id` AS `Module ID`,`ma`.`wfmain_flow_id` AS `APPROVAL LEVEL`,`ma`.`wftype_code` AS `WorkFlow Type Code`,`ma`.`wfmain_approving_emp_number` AS `Approving_Employee`,`e`.`emp_number` AS `Employee Number`,`e`.`emp_display_name` AS `Employee Name` from ((((`hs_hr_td_assignlist` `td` join `vw_hs_hr_wf_main_data` `ma` on((`ma`.`wfmain_id` = `td`.`wfmain_id`))) left join `hs_hr_employee` `e` on((`e`.`emp_number` = `td`.`emp_number`))) left join `hs_hr_wf_type` `wtf` on((`ma`.`wftype_code` = `wtf`.`wftype_code`))) left join `hs_hr_module` `m` on((`m`.`mod_id` = convert(`wtf`.`wfmod_id` using utf8)))) where ((`ma`.`wfmain_iscomplete_flg` = 0) and (`ma`.`wftype_code` = 4)) union all select `ma`.`wfmain_id` AS `ID`,`wtf`.`wfmod_id` AS `Module ID`,`ma`.`wfmain_flow_id` AS `APPROVAL LEVEL`,`ma`.`wftype_code` AS `WorkFlow Type Code`,`ma`.`wfmain_approving_emp_number` AS `Approving_Employee`,`e`.`emp_number` AS `Employee Number`,`e`.`emp_display_name` AS `Employee Name` from ((((`hs_hr_td_assignlist` `td` join `vw_hs_hr_wf_main_data` `ma` on((`ma`.`wfmain_id` = `td`.`wfmain_id`))) left join `hs_hr_employee` `e` on((`e`.`emp_number` = `td`.`emp_number`))) left join `hs_hr_wf_type` `wtf` on((`ma`.`wftype_code` = `wtf`.`wftype_code`))) left join `hs_hr_module` `m` on((`m`.`mod_id` = convert(`wtf`.`wfmod_id` using utf8)))) where (`ma`.`wfmain_iscomplete_flg` and (`ma`.`wftype_code` = 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pr_bd_bankdata`
--

/*!50001 DROP TABLE IF EXISTS `vw_pr_bd_bankdata`*/;
/*!50001 DROP VIEW IF EXISTS `vw_pr_bd_bankdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pr_bd_bankdata` AS select `de`.`emp_number` AS `EmployeeNo`,`e`.`emp_display_name` AS `EmployeeName`,`e`.`emp_nic_no` AS `EmployeeNIC`,`e`.`work_station` AS `EmployeeWorkStation`,`br`.`bbranch_code` AS `BranchCode`,`bn`.`bank_code` AS `BankCode`,`br`.`bbranch_user_code` AS `BranchUCode`,`bn`.`bank_user_code` AS `BankUCode`,`bt`.`ebank_acc_no` AS `AccountNo`,`bt`.`ebt_start_date` AS `StartDate`,`bt`.`ebt_end_date` AS `EndDate`,`bt`.`ebt_amount` AS `Amount`,`bt`.`ebt_cur_base_amount` AS `BaseAmount`,`dp`.`bdp_payment_total` AS `TotalAmount`,`bt`.`bank_code` AS `BankWorkStation` from ((((((`hs_pr_bank_diskette_process_employee` `de` left join `hs_pr_bank_diskette_process` `dp` on((`dp`.`bdp_id` = `de`.`bdp_id`))) left join `hs_hr_employee` `e` on((`e`.`emp_number` = `de`.`emp_number`))) left join `hs_pr_bank_diskette` `bd` on((`bd`.`dsk_id` = `dp`.`dsk_id`))) left join `hs_pr_bank_transfers` `bt` on((`bt`.`emp_number` = `de`.`emp_number`))) left join `hs_hr_branch` `br` on((`br`.`bbranch_code` = `bt`.`bbranch_code`))) left join `hs_hr_bank` `bn` on((`bn`.`bank_code` = `bt`.`bank_code`))) group by `de`.`emp_number`,`bn`.`bank_code`,`br`.`bbranch_code`,`bt`.`ebt_start_date`,`bt`.`ebt_end_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-28 17:04:51
