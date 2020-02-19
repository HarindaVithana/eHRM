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
INSERT INTO `hs_hr_atn_day_type` VALUES (1,'--Select--','--තෝරාගන්න--','--Select--'),(2,'working','වැඩ දවස','வொர்கிந்க்'),(3,'holiday','නිවාඩු දිනය','வொர்கஒஔஔஓிந்க்'),(4,'halfday','එක්වරුව','வொணர்கிந்க்');
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
INSERT INTO `hs_hr_company_structure_def` VALUES (1,'Organization','ආයතනය',NULL),(2,'National Level','ජාතික මට්ටම',NULL),(3,'District Level','දිස්ත්‍රික් මට්ටම',NULL),(4,'Divisional Level','ප්‍රාදේශීය මට්ටම',NULL),(5,'Zonal Level','කොට්ඨාශ මට්ටම',NULL),(6,'Wasam Level','වසම් මට්ටම',NULL),(7,'Level 07',NULL,NULL),(8,'Level 08',NULL,NULL),(9,'Level 09',NULL,NULL),(10,'Level 10',NULL,NULL);
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
INSERT INTO `hs_hr_country` VALUES ('AD','ANDORRA','Andorra','අන්දෝරා','ANDORRA_ta','AND',20),('AE','UNITED ARAB EMIRATES','United Arab Emirates','එක්සත් අරාබි එමීර් රාජ්‍යය','UNITED ARAB EMIRATES_Ta','ARE',784),('AF','AFGHANISTAN','Afghanistan','ඇෆ්ගනිස්තානය',NULL,'AFG',4),('AG','ANTIGUA AND BARBUDA','Antigua and Barbuda','ඇන්ටිගුවා',NULL,'ATG',28),('AI','ANGUILLA','Anguilla','ඇන්ගුයිලාව',NULL,'AIA',660),('AL','ALBANIA','Albania','ඇල්බේනියාව',NULL,'ALB',8),('AM','ARMENIA','Armenia','ආමේනියා',NULL,'ARM',51),('AN','NETHERLANDS ANTILLES','Netherlands Antilles','නෙදර්ලන්ත ඇන්ටිල්ලෙස් ',NULL,'ANT',530),('AO','ANGOLA','Angola','ඇන්ගෝලාව',NULL,'AGO',24),('AQ','ANTARCTICA','Antarctica','ඇන්ටාක්ටිකාව',NULL,NULL,NULL),('AR','ARGENTINA','Argentina','ආර්ජෙන්ටිනාව',NULL,'ARG',32),('AS','AMERICAN SAMOA','American Samoa','ඇමෙරිකන් සැමෝවා',NULL,'ASM',16),('AT','AUSTRIA','Austria','ඕස්ට්‍රියාව',NULL,'AUT',40),('AU','AUSTRALIA','Australia','ඕස්ට්‍රේලියාව',NULL,'AUS',36),('AW','ARUBA','Aruba','අරුබා',NULL,'ABW',533),('AZ','AZERBAIJAN','Azerbaijan','අයිස්බජාන්',NULL,'AZE',31),('BA','BOSNIA AND HERZEGOVINA','Bosnia and Herzegovina','බොස්නියා සහ හර්සෙගොවිනා',NULL,'BIH',70),('BB','BARBADOS','Barbados','බාර්බඩෝස්',NULL,'BRB',52),('BD','BANGLADESH','Bangladesh','බංගලාදේශය',NULL,'BGD',50),('BE','BELGIUM','Belgium','බෙල්ජියම්',NULL,'BEL',56),('BF','BURKINA FASO','Burkina Faso','බර්කිනා ෆාසො',NULL,'BFA',854),('BG','BULGARIA','Bulgaria','බල්ගේරියාව',NULL,'BGR',100),('BH','BAHRAIN','Bahrain','බහරේන්',NULL,'BHR',48),('BI','BURUNDI','Burundi','බහරේන්',NULL,'BDI',108),('BJ','BENIN','Benin','බෙනින්',NULL,'BEN',204),('BM','BERMUDA','Bermuda','බෙනින්',NULL,'BMU',60),('BN','BRUNEI DARUSSALAM','Brunei Darussalam','බෲනායි',NULL,'BRN',96),('BO','BOLIVIA','Bolivia','බොලිවියාව',NULL,'BOL',68),('BR','BRAZIL','Brazil','බ්‍රසීලය',NULL,'BRA',76),('BS','BAHAMAS','Bahamas','බහාමාස්',NULL,'BHS',44),('BT','BHUTAN','Bhutan','භූතානය',NULL,'BTN',64),('BV','BOUVET ISLAND','Bouvet Island','බොවේ දූපත',NULL,NULL,NULL),('BW','BOTSWANA','Botswana','බොට්ස්වානා',NULL,'BWA',72),('BY','BELARUS','Belarus','බෙලරූස්',NULL,'BLR',112),('BZ','BELIZE','Belize','බෙලීස්',NULL,'BLZ',84),('CA','CANADA','Canada','කැනඩාව',NULL,'CAN',124),('CC','COCOS (KEELING) ISLANDS','Cocos (Keeling) Islands','කොකෝස් දූපත්',NULL,NULL,NULL),('CD','CONGO, THE DEMOCRATIC REPUBLIC OF THE','Congo, the Democratic Republic of the','කොංගො',NULL,'COD',180),('CF','CENTRAL AFRICAN REPUBLIC','Central African Republic','මධ්‍යම අප්‍රිකානු සමූහාණ්ඩුව',NULL,'CAF',140),('CG','CONGO','Congo','කොංගො',NULL,'COG',178),('CH','SWITZERLAND','Switzerland','ස්විට්සර්ලන්තය',NULL,'CHE',756),('CI','COTE D\'IVOIRE','Cote D\'Ivoire','අයිවරි කොස්ට්',NULL,'CIV',384),('CK','COOK ISLANDS','Cook Islands','කුක් දූපත්',NULL,'COK',184),('CL','CHILE','Chile','චිලී',NULL,'CHL',152),('CM','CAMEROON','Cameroon','කැමරූන්',NULL,'CMR',120),('CN','CHINA','China','චීනය',NULL,'CHN',156),('CO','COLOMBIA','Colombia','කොළොම්බියාව',NULL,'COL',170),('CR','COSTA RICA','Costa Rica','කොස්ටාරිකා',NULL,'CRI',188),('CS','SERBIA AND MONTENEGRO','Serbia and Montenegro','සර්බියා මොන්ටේන්ග්‍රො',NULL,NULL,NULL),('CU','CUBA','Cuba','කියුබාව',NULL,'CUB',192),('CV','CAPE VERDE','Cape Verde','කේප් වර්ඩ්',NULL,'CPV',132),('CX','CHRISTMAS ISLAND','Christmas Island','ක්‍රිස්මස් දූපත්',NULL,NULL,NULL),('CY','CYPRUS','Cyprus','සයිප්‍රස්',NULL,'CYP',196),('CZ','CZECH REPUBLIC','Czech Republic','චෙක් සමූහාණ්ඩුව',NULL,'CZE',203),('DE','GERMANY','Germany','ජර්මනිය',NULL,'DEU',276),('DJ','DJIBOUTI','Djibouti','ජිබුටි',NULL,'DJI',262),('DK','DENMARK','Denmark','ඩෙන්මාර්ක්',NULL,'DNK',208),('DM','DOMINICA','Dominica','ඩොමිනික් සමූහාණ්ඩුව',NULL,'DMA',212),('DO','DOMINICAN REPUBLIC','Dominican Republic','ඩොමිනික් සමූහාණ්ඩුව',NULL,'DOM',214),('DZ','ALGERIA','Algeria','ඇල්ජීරියාව',NULL,'DZA',12),('EC','ECUADOR','Ecuador','ඉක්වදෝර්',NULL,'ECU',218),('EE','ESTONIA','Estonia','එස්ටෝනියාව',NULL,'EST',233),('EG','EGYPT','Egypt','ඊජිප්තුව',NULL,'EGY',818),('EH','WESTERN SAHARA','Western Sahara','බටහිර සහරාව',NULL,'ESH',732),('ER','ERITREA','Eritrea','එරිත්‍රියාව',NULL,'ERI',232),('ES','SPAIN','Spain','ස්පාඤ්ඤය',NULL,'ESP',724),('ET','ETHIOPIA','Ethiopia','ඉතියෝපියාව',NULL,'ETH',231),('FI','FINLAND','Finland','ෆින්ලන්තය',NULL,'FIN',246),('FJ','FIJI','Fiji','ෆීජි',NULL,'FJI',242),('FK','FALKLAND ISLANDS (MALVINAS)','Falkland Islands (Malvinas)','ෆෝක්ලන්ඩ් දුපත්',NULL,'FLK',238),('FM','MICRONESIA, FEDERATED STATES OF','Micronesia, Federated States of','මයික්‍රොනීසියා',NULL,'FSM',583),('FO','FAROE ISLANDS','Faroe Islands','ෆැරොඉ','','FRO',234),('FR','FRANCE','France','ප්‍රංශය',NULL,'FRA',250),('GA','GABON','Gabon','ගෙබොන්',NULL,'GAB',266),('GB','UNITED KINGDOM','United Kingdom','එක්සත් රාජධානිය',NULL,'GBR',826),('GD','GRENADA','Grenada','ග්‍රෙනේඩ්',NULL,'GRD',308),('GE','GEORGIA','Georgia','ජෝර්ජියාව',NULL,'GEO',268),('GF','FRENCH GUIANA','French Guiana','ප්‍රංශ ගියානා',NULL,'GUF',254),('GH','GHANA','Ghana','ඝානාව',NULL,'GHA',288),('GI','GIBRALTAR','Gibraltar','ජිබ්‍රෝල්ටා',NULL,'GIB',292),('GL','GREENLAND','Greenland','ග්‍රීන්ලන්තය',NULL,'GRL',304),('GM','GAMBIA','Gambia','ගැම්බියාව',NULL,'GMB',270),('GN','GUINEA','Guinea','ගිනියා බිසව්',NULL,'GIN',324),('GP','GUADELOUPE','Guadeloupe','ගේඩ්ලූප්',NULL,'GLP',312),('GQ','EQUATORIAL GUINEA','Equatorial Guinea','ගුවෙනාව',NULL,'GNQ',226),('GR','GREECE','Greece','ග්‍රීසිය',NULL,'GRC',300),('GS','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS','South Georgia and the South Sandwich Islands','දකුණු ජෝර්ජියාව',NULL,NULL,NULL),('GT','GUATEMALA','Guatemala','ග්වාතමාලා',NULL,'GTM',320),('GU','GUAM','Guam','ගුවාම්',NULL,'GUM',316),('GW','GUINEA-BISSAU','Guinea-Bissau','ගිනියා බිසව්',NULL,'GNB',624),('GY','GUYANA','Guyana','ගයනා',NULL,'GUY',328),('HK','HONG KONG','Hong Kong','හොං කොං',NULL,'HKG',344),('HM','HEARD ISLAND AND MCDONALD ISLANDS','Heard Island and Mcdonald Islands','මැක්ඩොනල්ඩ් දූපත්',NULL,NULL,NULL),('HN','HONDURAS','Honduras','හොන්ඩුරාස්',NULL,'HND',340),('HR','CROATIA','Croatia','ක්‍රොයේෂියා',NULL,'HRV',191),('HT','HAITI','Haiti','හයිටි',NULL,'HTI',332),('HU','HUNGARY','Hungary','හංගේරියාව',NULL,'HUN',348),('ID','INDONESIA','Indonesia','ඉන්දුනීසියාව',NULL,'IDN',360),('IE','IRELAND','Ireland','අයර්ලන්තය',NULL,'IRL',372),('IL','ISRAEL','Israel','ඊශ්‍රායලය',NULL,'ISR',376),('IN','INDIA','India','ඉන්දියාව',NULL,'IND',356),('IQ','IRAQ','Iraq','ඉරාකය',NULL,'IRQ',368),('IR','IRAN, ISLAMIC REPUBLIC OF','Iran, Islamic Republic of','ඉරානය',NULL,'IRN',364),('IS','ICELAND','Iceland','අයිස්ලන්තය',NULL,'ISL',352),('IT','ITALY','Italy','ඉතාලිය',NULL,'ITA',380),('JM','JAMAICA','Jamaica','ජැමෙයිකාව',NULL,'JAM',388),('JO','JORDAN','Jordan','ජෝර්දානය',NULL,'JOR',400),('JP','JAPAN','Japan','ජපානය',NULL,'JPN',392),('KE','KENYA','Kenya','කෙන්යාව',NULL,'KEN',404),('KG','KYRGYZSTAN','Kyrgyzstan','කිරිකිස්තානය',NULL,'KGZ',417),('KH','CAMBODIA','Cambodia','කාම්බෝජියාව',NULL,'KHM',116),('KI','KIRIBATI','Kiribati','කිරිබාටි',NULL,'KIR',296),('KM','COMOROS','Comoros','කොමොරොස්',NULL,'COM',174),('KN','SAINT KITTS AND NEVIS','Saint Kitts and Nevis','ශාන්ත කිට්ස්',NULL,'KNA',659),('KP','KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF','Korea, Democratic People\'s Republic of','කොරියාව',NULL,'PRK',408),('KR','KOREA, REPUBLIC OF','Korea, Republic of','කොරියාව',NULL,'KOR',410),('KW','KUWAIT','Kuwait','කුවේටය',NULL,'KWT',414),('KY','CAYMAN ISLANDS','Cayman Islands','කේමන් දූපත්',NULL,'CYM',136),('KZ','KAZAKHSTAN','Kazakhstan','කසක්ස්තානය',NULL,'KAZ',398),('LA','LAO PEOPLE\'S DEMOCRATIC REPUBLIC','Lao People\'s Democratic Republic','ලාඕසය',NULL,'LAO',418),('LB','LEBANON','Lebanon','ලෙබනන්',NULL,'LBN',422),('LC','SAINT LUCIA','Saint Lucia','ශාන්ත ලුසියා',NULL,'LCA',662),('LI','LIECHTENSTEIN','Liechtenstein','ලයිටන්ස්ටයින්',NULL,'LIE',438),('LK','SRI LANKA','Sri Lanka','ශ්‍රී ලංකාව',NULL,'LKA',144),('LR','LIBERIA','Liberia','ලයිබේරියා',NULL,'LBR',430),('LS','LESOTHO','Lesotho','ලෙසෝතො',NULL,'LSO',426),('LT','LITHUANIA','Lithuania','ලිතුවේනියා',NULL,'LTU',440),('LU','LUXEMBOURG','Luxembourg','ලක්ෂම්බර්ග්',NULL,'LUX',442),('LV','LATVIA','Latvia','ලැට්වියා',NULL,'LVA',428),('LY','LIBYAN ARAB JAMAHIRIYA','Libyan Arab Jamahiriya','ලිබියාව',NULL,'LBY',434),('MA','MOROCCO','Morocco','මොරොක්කෝව',NULL,'MAR',504),('MC','MONACO','Monaco','මොනෑකෝ',NULL,'MCO',492),('MD','MOLDOVA, REPUBLIC OF','Moldova, Republic of','මෝල්ඩෝවා',NULL,'MDA',498),('MG','MADAGASCAR','Madagascar','මැඩගස්කරය',NULL,'MDG',450),('MH','MARSHALL ISLANDS','Marshall Islands','මැඩගස්කරය',NULL,'MHL',584),('MK','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','Macedonia, the Former Yugoslav Republic of','මැසිඩෝනියාව',NULL,'MKD',807),('ML','MALI','Mali','මාලේ',NULL,'MLI',466),('MM','MYANMAR','Myanmar','මියන්මාර්',NULL,'MMR',104),('MN','MONGOLIA','Mongolia','මොන්ගෝලියාව',NULL,'MNG',496),('MO','MACAO','Macao','මැකාවො',NULL,'MAC',446),('MP','NORTHERN MARIANA ISLANDS','Northern Mariana Islands','උතුරු මරුයානා දූපත්',NULL,'MNP',580),('MQ','MARTINIQUE','Martinique','නෝර්වේ',NULL,'MTQ',474),('MR','MAURITANIA','Mauritania','මොරිටානියා',NULL,'MRT',478),('MS','MONTSERRAT','Montserrat','මොන්සෙරාට්',NULL,'MSR',500),('MT','MALTA','Malta','මෝල්ටා',NULL,'MLT',470),('MU','MAURITIUS','Mauritius','මොරිෂස්',NULL,'MUS',480),('MV','MALDIVES','Maldives','මාලදිවයින',NULL,'MDV',462),('MW','MALAWI','Malawi','මලාවි',NULL,'MWI',454),('MX','MEXICO','Mexico','මෙක්සිකෝව',NULL,'MEX',484),('MY','MALAYSIA','Malaysia','මැලේසියාව',NULL,'MYS',458),('MZ','MOZAMBIQUE','Mozambique','මොසැම්බික්',NULL,'MOZ',508),('NA','NAMIBIA','Namibia','නැමිබියා',NULL,'NAM',516),('NC','NEW CALEDONIA','New Caledonia','නව කැලිඩෝනියාව',NULL,'NCL',540),('NE','NIGER','Niger','නයිජර්',NULL,'NER',562),('NF','NORFOLK ISLAND','Norfolk Island','නෝෆෝක් දූපත්',NULL,'NFK',574),('NG','NIGERIA','Nigeria','නයිජීරියා',NULL,'NGA',566),('NI','NICARAGUA','Nicaragua','නිකරගුවා',NULL,'NIC',558),('NL','NETHERLANDS','Netherlands','නෙදර්ලන්තය',NULL,'NLD',528),('NO','NORWAY','Norway','නෝර්වේ',NULL,'NOR',578),('NP','NEPAL','Nepal','නෙපාලය',NULL,'NPL',524),('NR','NAURU','Nauru','නෝරු',NULL,'NRU',520),('NU','NIUE','Niue','නියු',NULL,'NIU',570),('NZ','NEW ZEALAND','New Zealand','නවසීලන්තය',NULL,'NZL',554),('OM','OMAN','Oman','ඕමානය',NULL,'OMN',512),('PA','PANAMA','Panama','පැනමාව',NULL,'PAN',591),('PE','PERU','Peru','පේරු',NULL,'PER',604),('PF','FRENCH POLYNESIA','French Polynesia','ප්‍රංශ පොලිනීසියාව',NULL,'PYF',258),('PG','PAPUA NEW GUINEA','Papua New Guinea','පැපුවා නිව්ගිනියාව',NULL,'PNG',598),('PH','PHILIPPINES','Philippines','පිලිපීනය',NULL,'PHL',608),('PK','PAKISTAN','Pakistan','පකිස්ථානය',NULL,'PAK',586),('PL','POLAND','Poland','පෝලන්තය',NULL,'POL',616),('PM','SAINT PIERRE AND MIQUELON','Saint Pierre and Miquelon','ශාන්ත පියරේ',NULL,'SPM',666),('PN','PITCAIRN','Pitcairn','පිටිකේන්',NULL,'PCN',612),('PR','PUERTO RICO','Puerto Rico','පුවරෙටිකෝ',NULL,'PRI',630),('PS','PALESTINIAN TERRITORY, OCCUPIED','Palestinian Territory, Occupied','පලස්තීනය',NULL,NULL,NULL),('PT','PORTUGAL','Portugal','පෘතුගාලය',NULL,'PRT',620),('PW','PALAU','Palau','පලව්',NULL,'PLW',585),('PY','PARAGUAY','Paraguay','පැරගුවේ',NULL,'PRY',600),('QA','QATAR','Qatar','කටාර්',NULL,'QAT',634),('RE','REUNION','Reunion','රීයුනියන්',NULL,'REU',638),('RO','ROMANIA','Romania','රුමේනියාව',NULL,'ROM',642),('RU','RUSSIAN FEDERATION','Russian Federation','රුසියානු සමූහාණ්ඩුව',NULL,'RUS',643),('RW','RWANDA','Rwanda','රුවන්ඩාව',NULL,'RWA',646),('SA','SAUDI ARABIA','Saudi Arabia','සෞදි අරාබිය',NULL,'SAU',682),('SB','SOLOMON ISLANDS','Solomon Islands','සොලමන් දූපත්',NULL,'SLB',90),('SC','SEYCHELLES','Seychelles','සීෂෙල්ස්',NULL,'SYC',690),('SD','SUDAN','Sudan','සුඩානය',NULL,'SDN',736),('SE','SWEDEN','Sweden','ස්විඩනය',NULL,'SWE',752),('SG','SINGAPORE','Singapore','සිංගප්පූරුව',NULL,'SGP',702),('SH','SAINT HELENA','Saint Helena','ශාන්ත හෙලේනා',NULL,'SHN',654),('SI','SLOVENIA','Slovenia','ස්ලොවේනියාව',NULL,'SVN',705),('SJ','SVALBARD AND JAN MAYEN','Svalbard and Jan Mayen','ස්වැල්බර්ඩ්',NULL,'SJM',744),('SK','SLOVAKIA','Slovakia','ස්ලොවේකියාව',NULL,'SVK',703),('SL','SIERRA LEONE','Sierra Leone','සියෙරා ලියොන්',NULL,'SLE',694),('SM','SAN MARINO','San Marino','සැන් මැරීනෝ',NULL,'SMR',674),('SN','SENEGAL','Senegal','සෙනගාලය',NULL,'SEN',686),('SO','SOMALIA','Somalia','සෝමාලියාව',NULL,'SOM',706),('SR','SURINAME','Suriname','සුරිනේම්',NULL,'SUR',740),('ST','SAO TOME AND PRINCIPE','Sao Tome and Principe','සෑටෝම්',NULL,'STP',678),('SV','EL SALVADOR','El Salvador','එල් සැල්වදෝර්',NULL,'SLV',222),('SY','SYRIAN ARAB REPUBLIC','Syrian Arab Republic','සිරියාව',NULL,'SYR',760),('SZ','SWAZILAND','Swaziland','ස්වාසිලන්තය',NULL,'SWZ',748),('TC','TURKS AND CAICOS ISLANDS','Turks and Caicos Islands','ටර්ක්ස් දූපත්',NULL,'TCA',796),('TD','CHAD','Chad','චැඩ්',NULL,'TCD',148),('TF','FRENCH SOUTHERN TERRITORIES','French Southern Territories','දකුණු ප්‍රංශ පාලන ප්‍රදේශ',NULL,NULL,NULL),('TG','TOGO','Togo','ටෝගො',NULL,'TGO',768),('TH','THAILAND','Thailand','තායිලන්තය',NULL,'THA',764),('TJ','TAJIKISTAN','Tajikistan','ටජිකිස්තානය',NULL,'TJK',762),('TK','TOKELAU','Tokelau','ටොකෙලෝ',NULL,'TKL',772),('TL','TIMOR-LESTE','Timor-Leste','ටිමෝර්',NULL,NULL,NULL),('TM','TURKMENISTAN','Turkmenistan','ඨුර්ක්මෙනිස්ටන්',NULL,'TKM',795),('TN','TUNISIA','Tunisia','ටියුනීසියාව',NULL,'TUN',788),('TO','TONGA','Tonga','ටොංගො',NULL,'TON',776),('TR','TURKEY','Turkey','තුර්කිය',NULL,'TUR',792),('TT','TRINIDAD AND TOBAGO','Trinidad and Tobago','ට්‍රිනිඩෑඩ් ටොබෑගො',NULL,'TTO',780),('TV','TUVALU','Tuvalu','ටුවාලු',NULL,'TUV',798),('TW','TAIWAN, PROVINCE OF CHINA','Taiwan','තායිවානය',NULL,'TWN',158),('TZ','TANZANIA, UNITED REPUBLIC OF','Tanzania, United Republic of','ටැන්සානියාව',NULL,'TZA',834),('UA','UKRAINE','Ukraine','යූක්රේනය',NULL,'UKR',804),('UG','UGANDA','Uganda','උගන්ඩාව',NULL,'UGA',800),('US','UNITED STATES','United States','එක්සත් ජනපදය',NULL,'USA',840),('UY','URUGUAY','Uruguay','උරුගුවේ',NULL,'URY',858),('UZ','UZBEKISTAN','Uzbekistan','උස්බෙකිස්තානය',NULL,'UZB',860),('VA','HOLY SEE (VATICAN CITY STATE)','Holy See (Vatican City State)','වතිකානුව',NULL,'VAT',336),('VC','SAINT VINCENT AND THE GRENADINES','Saint Vincent and the Grenadines','ශාන්ත වින්සන්ට්',NULL,'VCT',670),('VE','VENEZUELA','Venezuela','වෙනිසියුලාව',NULL,'VEN',862),('VG','VIRGIN ISLANDS, BRITISH','Virgin Islands, British','වර්ජිනියා දූපත්, බ්‍රිතාන්‍යය',NULL,'VGB',92),('VI','VIRGIN ISLANDS, U.S.','Virgin Islands, U.s.','වර්ජිනියා දූපත්, එක්සත් ජනපදය',NULL,'VIR',850),('VN','VIET NAM','Viet Nam','වියට්නාමය',NULL,'VNM',704),('VU','VANUATU','Vanuatu','වැනුඅටු',NULL,'VUT',548),('WF','WALLIS AND FUTUNA','Wallis and Futuna','වැලිස්',NULL,'WLF',876),('WS','SAMOA','Samoa','සැමූවා',NULL,'WSM',882),('YE','YEMEN','Yemen','යේමනය',NULL,'YEM',887),('YT','MAYOTTE','Mayotte','මයෝටි',NULL,NULL,NULL),('ZA','SOUTH AFRICA','South Africa','දකුණු අප්‍රිකාව',NULL,'ZAF',710),('ZM','ZAMBIA','Zambia','සැම්බියාව',NULL,'ZMB',894),('ZW','ZIMBABWE','Zimbabwe','සිම්බාබ්වේ',NULL,'ZWE',716);
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
INSERT INTO `hs_hr_currency_type` VALUES (3,'AED','Utd. Arab Emir. Dirham'),(4,'AFN','Afghanistan Afghani'),(5,'ALL','Albanian Lek'),(6,'ANG','NL Antillian Guilder'),(7,'AOR','Angolan New Kwanza'),(177,'ARP','Argentina Pesos'),(8,'ARS','Argentine Peso'),(10,'AUD','Australian Dollar'),(11,'AWG','Aruban Florin'),(12,'BBD','Barbados Dollar'),(13,'BDT','Bangladeshi Taka'),(15,'BGL','Bulgarian Lev'),(16,'BHD','Bahraini Dinar'),(17,'BIF','Burundi Franc'),(18,'BMD','Bermudian Dollar'),(19,'BND','Brunei Dollar'),(20,'BOB','Bolivian Boliviano'),(21,'BRL','Brazilian Real'),(22,'BSD','Bahamian Dollar'),(23,'BTN','Bhutan Ngultrum'),(24,'BWP','Botswana Pula'),(25,'BZD','Belize Dollar'),(26,'CAD','Canadian Dollar'),(27,'CHF','Swiss Franc'),(28,'CLP','Chilean Peso'),(29,'CNY','Chinese Yuan Renminbi'),(30,'COP','Colombian Peso'),(31,'CRC','Costa Rican Colon'),(32,'CUP','Cuban Peso'),(33,'CVE','Cape Verde Escudo'),(34,'CYP','Cyprus Pound'),(171,'CZK','Czech Koruna'),(37,'DJF','Djibouti Franc'),(38,'DKK','Danish Krona'),(39,'DOP','Dominican Peso'),(40,'DZD','Algerian Dinar'),(41,'ECS','Ecuador Sucre'),(43,'EEK','Estonian Krona'),(44,'EGP','Egyptian Pound'),(46,'ETB','Ethiopian Birr'),(42,'EUR','Euro'),(48,'FJD','Fiji Dollar'),(49,'FKP','Falkland Islands Pound'),(51,'GBP','Pound Sterling'),(52,'GHC','Ghanaian Cedi'),(53,'GIP','Gibraltar Pound'),(54,'GMD','Gambian Dalasi'),(55,'GNF','Guinea Franc'),(57,'GTQ','Guatemalan Quetzal'),(58,'GYD','Guyanan Dollar'),(59,'HKD','Hong Kong Dollar'),(60,'HNL','Honduran Lempira'),(61,'HRK','Croatian Kuna'),(62,'HTG','Haitian Gourde'),(63,'HUF','Hungarian Forint'),(64,'IDR','Indonesian Rupiah'),(66,'ILS','Israeli New Shekel'),(67,'INR','Indian Rupee'),(68,'IQD','Iraqi Dinar'),(69,'IRR','Iranian Rial'),(70,'ISK','Iceland Krona'),(72,'JMD','Jamaican Dollar'),(73,'JOD','Jordanian Dinar'),(74,'JPY','Japanese Yen'),(75,'KES','Kenyan Shilling'),(76,'KHR','Kampuchean Riel'),(77,'KMF','Comoros Franc'),(78,'KPW','North Korean Won'),(79,'KRW','Korean Won'),(80,'KWD','Kuwaiti Dinar'),(81,'KYD','Cayman Islands Dollar'),(82,'KZT','Kazakhstan Tenge'),(83,'LAK','Lao Kip'),(84,'LBP','Lebanese Pound'),(85,'LKR','Sri Lanka Rupee'),(86,'LRD','Liberian Dollar'),(87,'LSL','Lesotho Loti'),(88,'LTL','Lithuanian Litas'),(90,'LVL','Latvian Lats'),(91,'LYD','Libyan Dinar'),(92,'MAD','Moroccan Dirham'),(93,'MGF','Malagasy Franc'),(94,'MMK','Myanmar Kyat'),(95,'MNT','Mongolian Tugrik'),(96,'MOP','Macau Pataca'),(97,'MRO','Mauritanian Ouguiya'),(98,'MTL','Maltese Lira'),(99,'MUR','Mauritius Rupee'),(100,'MVR','Maldive Rufiyaa'),(101,'MWK','Malawi Kwacha'),(102,'MXN','Mexican New Peso'),(172,'MXP','Mexican Peso'),(103,'MYR','Malaysian Ringgit'),(104,'MZM','Mozambique Metical'),(105,'NAD','Namibia Dollar'),(106,'NGN','Nigerian Naira'),(107,'NIO','Nicaraguan Cordoba Oro'),(109,'NOK','Norwegian Krona'),(110,'NPR','Nepalese Rupee'),(111,'NZD','New Zealand Dollar'),(112,'OMR','Omani Rial'),(113,'PAB','Panamanian Balboa'),(114,'PEN','Peruvian Nuevo Sol'),(115,'PGK','Papua New Guinea Kina'),(116,'PHP','Philippine Peso'),(117,'PKR','Pakistan Rupee'),(118,'PLN','Polish Zloty'),(120,'PYG','Paraguay Guarani'),(121,'QAR','Qatari Rial'),(122,'ROL','Romanian Leu'),(123,'RUB','Russian Rouble'),(180,'RUR','Russia Rubles'),(124,'SAR','South African Rand'),(125,'SBD','Solomon Islands Dollar'),(126,'SCR','Seychelles Rupee'),(127,'SDD','Sudanese Dinar'),(128,'SDP','Sudanese Pound'),(129,'SEK','Swedish Krona'),(131,'SGD','Singapore Dollar'),(132,'SHP','St. Helena Pound'),(130,'SKK','Slovak Koruna'),(135,'SLL','Sierra Leone Leone'),(136,'SOS','Somali Shilling'),(137,'SRG','Suriname Guilder'),(138,'STD','Sao Tome/Principe Dobra'),(139,'SVC','El Salvador Colon'),(140,'SYP','Syrian Pound'),(141,'SZL','Swaziland Lilangeni'),(142,'THB','Thai Baht'),(143,'TND','Tunisian Dinar'),(144,'TOP','Tongan Pa\'anga'),(145,'TRL','Turkish Lira'),(146,'TTD','Trinidad/Tobago Dollar'),(147,'TWD','Taiwan Dollar'),(148,'TZS','Tanzanian Shilling'),(149,'UAH','Ukraine Hryvnia'),(150,'UGX','Uganda Shilling'),(151,'USD','United States Dollar'),(152,'UYP','Uruguayan Peso'),(153,'VEB','Venezuelan Bolivar'),(154,'VND','Vietnamese Dong'),(155,'VUV','Vanuatu Vatu'),(156,'WST','Samoan Tala'),(158,'XAF','CFA Franc BEAC'),(159,'XAG','Silver (oz.)'),(160,'XAU','Gold (oz.)'),(161,'XCD','Eastern Caribbean Dollars'),(179,'XDR','IMF Special Drawing Right'),(162,'XOF','CFA Franc BCEAO'),(163,'XPD','Palladium (oz.)'),(164,'XPF','Franc des Comptoirs français du Pacifique'),(165,'XPT','Platinum (oz.)'),(166,'YER','Yemeni Riyal'),(167,'YUM','Yugoslavian Dinar'),(175,'YUN','Yugoslav Dinar'),(168,'ZAR','South African Rand'),(176,'ZMK','Zambian Kwacha'),(169,'ZRN','New Zaire'),(170,'ZWD','Zimbabwe Dollar');
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
INSERT INTO `hs_hr_emp_attachment_type` VALUES (0,'Document','ලේඛන','gsdfgsdfgdf'),(1,'sportsAttch','කෙළිකවට','sportsAttch_ta'),(2,'test','පරීක්ෂණ','testTamil');
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
INSERT INTO `hs_hr_emp_picture` VALUES (1,'����\0JFIF\0\0d\0d\0\0���Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j(\0\0\0\0\0\0\01\0\0\0\0\0\0\0r2\0\0\0\0\0\0\0��i\0\0\0\0\0\0\0�\0\0\0�\0B@\0\0\'\0B@\0\0\'Adobe Photoshop CS4 Windows\02011:07:07 10:32:52\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0Ġ\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0&(\0\0\0\0\0\0\0\0\0\0\0\0\0.\0\0\0\0\0\0~\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0����\0JFIF\0\0\0H\0H\0\0��\0Adobe_CM\0��\0Adobe\0d�\0\0\0��\0�\0			\n\r\r\r��\0\0�\0�\"\0��\0\0\n��?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r��C%�S���cs5���&D�TdE£t6�U�e���u��F\'���������������Vfv��������7GWgw��������\05\0!1AQaq\"2����B#�R��3$b�r��CScs4�%���&5��D�T�dEU6te����u��F���������������Vfv��������\'7GWgw�������\0\0\0?\0�4�I%):d�)I�I%)\'/�vU�����ph�ܱ���m�����[e�	���oy�\0Kyx�_��պ�Q���O�S}��̪������^�@��U�\0�\0W0w6�����1������5���9�s��4=ę?�n��.q\'���p���k}s�r�CV�{�o�wok�\05l��\0��g.��k��s��^76]�s?qxY�\0�R��%��b�12�sqۓ�k/��Yed9��WοW~�un�x�\n�\Z��a���N��/m������d�\'�2�\r7�B$;_�ӹ$֣PI!I�$��L�$��\0���4�I%):d�R�N���ON��e���#�����{������\0Pt�\\@�o��,����\0����|��\\��=V���n��m\rE���_�X�`���4S��o�zBd�O��+���,u�4q�\'�߼�)�l����6c�\0���+-��u\"�\0L�y�c��{��k\0�d9������\r&w������j��cˁ��̮�,č4 N��=���@ �渍!zm�Vh{�e�s��p�\0����9?V�Z\r	!�	�Q�������k���\0�Z�\0V:����洐hx��m�O�حg}[mz��p�t�E�u7cem�{�C��9K�[1O������l\\�r�ɡ۪���<hQW%�,:��C�b�?��=�E�����.�8���.�����$�I)���4�I%)$�IJ^C�8rM�s�کh�븽�^��K�k�,��sZu��4�i`s��]�@â�}�{�d�ԏ͕��T�\0\0\\���[P�\Z`�䮚��\0����_+��^�䭲�U���5\\k,�eD�0K&�A1��y�y<h�_]�Q��%*�:�����ˈ�ڬ!��+��i�?5�}a�¦����	�������HF�������\0�R��K��s��8;���ϝ�89��\0��z�\\銑Rt��B�H%))���4�I%)$�IJ^�2$}i�����������\0�\r���wٜ-��F�Z]�!��sR_�v}	��U���\\�j@�	�Nʋ��k����P/���N-�4�?/�c�s�`ֺ����ƹ��+�cy��܉5���q��8��24\\v&G���+��m��ec�.-��լ{k�7�Z��ל�cZ=�����7�G��Y����wx33��R@p�T:�M�s*`�t{,[���l���w��Ƨ?�d����-�>��5(�;(�m��ڲ\Z][�Hi�ܱ��%y8Ψ{Ov��+>�ۓ����ێ�\r\"�̒@�S�,��S�\0����d7ԩ��v����v���w�^Z�_���K��ܺ��\0V��xF)7�5�;m9u���\\Z@u������ֻmm�����p��%�Y���5�I�\'Ab�I$��\0���4�I%)$�IH������W�u�A_[�Ţh}�`\0h�Sw�����9��-<8~k��5R�:�dn3��k�\0�L������?�C\02I�E��h�@o�Qq_�\0���	:�*ěn�h�vC�K����k[Z��^��U��j��C�{�\r�\0?5��֭�}\ZZ�ۺ�N��G.{�����\\�X��<�\0; I;�p���79i\Z��~	����`����kL|Y塝�Igwh�A����2#s@uv\r%���\0��$l�I��ɢ��o\'��U�ӎ7����TL��*�I�oo$l�CG7�c#:�˞ʨ5��Z��Wc��v3ڽCF-\"\"+h��\\�Wk_�n3���\0���`\0\0\r�o/�O?�\"�铩�I$����4�I%)$�IJ\\[�3#!�\\�r����\0����gu���VK�Su��	��?F���ݩ�^~9��ޡ�q��=��5��ɩ�5��,�,��k�����H\\���O���y��u��Ӫ��k7:�ǣs�s�6���U�߿�#}�2��*��s�|4�������C|��8w��i�����H&C@��ȳhk�s����;�~��ꬑa��!���S�ͬ5��+f\\\\�|�5d�3���N\0a�V��#sy��U�/�zl����ܬ�����9�/��EB<��r�f�� #R���ŵ�k�/�9��u��r=��^��~�bTΑ��V�l9�yp���k�����*�ZY\'�@���2H�]$�IO���4�I%)$�IJI$�S�J���<�h�ג�����.U�k[Ik��*�����c�is\rn��gp�\0�b�r�\"�U��3W0s�3���x���$�ǫ\'S��x�E��b�>���n���P�&�i�/\ZG�+J����Xs۹��0H�?I��anCKYuLl\0E`k�T�Ǧ��y\'A�l���Y-lI畛c����\rJ&D�$jQ�]Qieq��?��TBc�Mb]c�Z<�v��T�4�	��-/�u�����p�:��cK��\0I:1�0�U�=-���oѩ���ѵM$��5$�I%t�\'IO���4�I$)$�I*I$+���t������jHp��R���X��}���kN��+�-�csO#��f���X~�W\r��ZZw�����k����+he9�c_NƘ����\Z�\0�S�\0ehd�\0K�g�/�?G�4d��\Zƛ�ɚ����\0��ŧ���MP��4} ���~�.���_��S�{^�k�xFQ;�q6-{��2����th`.�~��S���^�k�$���u��ű�WD�C�$�H�)	Dlc#�D������Y�?�v����\'�q���>��C��.ͣs(d^�/%���C]�~E���S_��-�뮊kmA���+kIp���?�w���z��+�.���R≖�n�Y�\0�\Z��Z���-p�\Z	Ԟ}����Y����a�2�$|���-<^��y\r��6p7p���\Z������$ԩ$�IO���4�@������{��W�HN���lm��������e�u<��0�5�4�������&�lm`���\Z��6�w�	�g�����GV�����%ǗG��Uz�qy�s�$ 4�V�s��L�Q�{�6ƒʅ��R�n��y�r�Z�{��o�Rx\0)\rpm�Տ�<K]�g�ٳo��\0�茮��u/n�Y��d4� �>��F���q,�g��G�571�C[��D�Xۜ�����+��^��\0�ր�\0��A��m����z.o���Z�?��u��2���	�4i-i����-����X���ֻ��r�+\\��@���\"=��˛���n���/�+\\���عç��잠�`Ѭ���\Z�F�ҷ�^�m��\0���\0B�x/Xh{61�i=Gvע���� �rO��W1z}l���cd�;�!�cｬ�r���|j�\0�d�?�X�=x`]I똿b���k-T��Ӻ�{�}I�%��.���>���}0h�w7k�ѾH��W�mɲ�oM��o���%Fc^�y��O�X1����[��G�K����o��g#��m��@���K�ݶK�}2L��.�s?E�	�a⧴��h\r`h<�C[66,?���1�z�\0O.����Չꦰ����N�=��7>�O�>��=OO�\0,r���\0�jqݮ�8;x���8%�Q�m���\0Y���\0��5lh�Q�#�\\������9���S6W�\Z���-��c?���o1ax���?����2q@4�u\rv�#�ܵh�:��K�{�7�\0$��d�@�[醴�t6ʛ�\0�1T\Z�5�3��������vW���i�*��c�cw1��<�	�-]��.ǰ���ۣN��������{�����}Y\0?�c����`m6�\0���2z��/f!��4���2\Z׿ۦ��6������Z��<�d������n=�`���\0�eֵ�i����\0S��&`u�}���7iẶ7o��A�`\0�jB�W�����\n���Nu���c��>�7�Y��?�X����p��p���U��\0���Qk1}3�\r��M��\0�f��E���9h�|�n���W�\0��D�5���R�׳�e��\0<u?��Wc���_��?�	�(K���v�1��>��ڱ�\r�����\'��O�2��ǘ�n}J����[��O��\0(�䋫�����U������m���\Z�~���:����t{��\Z�N�q�㵿�ks�����^7�D���k���u���{=bkk�\'�f�����m^�����q��X����[�2l{-53m�;�<�OѲ��>���`��.\0;sXv����m��m{��W�����u�7;���kjcr��m�V���f�Wc������\r:=���y�<�c_���Wa#�ÝS��ea��v��F���7�*龪c��\n�^�>��T�	�]6ޕ�>�9�kl�\'7�0�\0S��+� ]�N]8������6�I�mD�Q�9�]�c��������1�9�\r��4\0ܚ6{O��~�t̀Z�\\\Z%�ၾ�=�0ͻ,u��_�k�=���/�Η��:�xs����=�v�Hut<Ͻخ��9���n��E��ms<��t,%̰������~M����y�MMB��Cv;mi.������.M���m�������\0�i���+�����}�u:�\0��M�?��\0�0�\0�*�m%���?�g,�����Y�am��kzm���:��[����lʣo��4�~�q\\��a;�\0E�X��KF���\0�Yl�\0���6����;�\Z7��Ɔ�\0����f���|��s�e���,؁I6c�?��f��:�io���_����~�h,�u8W�����w�mbEV�\0����\Z�Photoshop 3.0\08BIM%\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0\0d\0\0\0\0\0d\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?�\0\08BIM\r\0\0\0\0\0\0\0\0x8BIM\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0p\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\08BIM-\0\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0I\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0\0\n\0U\0n\0t\0i\0t\0l\0e\0d\0-\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0�\0\0\0\0Rghtlong\0\0\0�\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0�\0\0\0\0Rghtlong\0\0\0�\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?�\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0�\0\0\0\0\0\0�\0\0\0�\0\0�\0\'\0\0\0~\0\0����\0JFIF\0\0\0H\0H\0\0��\0Adobe_CM\0��\0Adobe\0d�\0\0\0��\0�\0			\n\r\r\r��\0\0�\0�\"\0��\0\0\n��?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r��C%�S���cs5���&D�TdE£t6�U�e���u��F\'���������������Vfv��������7GWgw��������\05\0!1AQaq\"2����B#�R��3$b�r��CScs4�%���&5��D�T�dEU6te����u��F���������������Vfv��������\'7GWgw�������\0\0\0?\0�4�I%):d�)I�I%)\'/�vU�����ph�ܱ���m�����[e�	���oy�\0Kyx�_��պ�Q���O�S}��̪������^�@��U�\0�\0W0w6�����1������5���9�s��4=ę?�n��.q\'���p���k}s�r�CV�{�o�wok�\05l��\0��g.��k��s��^76]�s?qxY�\0�R��%��b�12�sqۓ�k/��Yed9��WοW~�un�x�\n�\Z��a���N��/m������d�\'�2�\r7�B$;_�ӹ$֣PI!I�$��L�$��\0���4�I%):d�R�N���ON��e���#�����{������\0Pt�\\@�o��,����\0����|��\\��=V���n��m\rE���_�X�`���4S��o�zBd�O��+���,u�4q�\'�߼�)�l����6c�\0���+-��u\"�\0L�y�c��{��k\0�d9������\r&w������j��cˁ��̮�,č4 N��=���@ �渍!zm�Vh{�e�s��p�\0����9?V�Z\r	!�	�Q�������k���\0�Z�\0V:����洐hx��m�O�حg}[mz��p�t�E�u7cem�{�C��9K�[1O������l\\�r�ɡ۪���<hQW%�,:��C�b�?��=�E�����.�8���.�����$�I)���4�I%)$�IJ^C�8rM�s�کh�븽�^��K�k�,��sZu��4�i`s��]�@â�}�{�d�ԏ͕��T�\0\0\\���[P�\Z`�䮚��\0����_+��^�䭲�U���5\\k,�eD�0K&�A1��y�y<h�_]�Q��%*�:�����ˈ�ڬ!��+��i�?5�}a�¦����	�������HF�������\0�R��K��s��8;���ϝ�89��\0��z�\\銑Rt��B�H%))���4�I%)$�IJ^�2$}i�����������\0�\r���wٜ-��F�Z]�!��sR_�v}	��U���\\�j@�	�Nʋ��k����P/���N-�4�?/�c�s�`ֺ����ƹ��+�cy��܉5���q��8��24\\v&G���+��m��ec�.-��լ{k�7�Z��ל�cZ=�����7�G��Y����wx33��R@p�T:�M�s*`�t{,[���l���w��Ƨ?�d����-�>��5(�;(�m��ڲ\Z][�Hi�ܱ��%y8Ψ{Ov��+>�ۓ����ێ�\r\"�̒@�S�,��S�\0����d7ԩ��v����v���w�^Z�_���K��ܺ��\0V��xF)7�5�;m9u���\\Z@u������ֻmm�����p��%�Y���5�I�\'Ab�I$��\0���4�I%)$�IH������W�u�A_[�Ţh}�`\0h�Sw�����9��-<8~k��5R�:�dn3��k�\0�L������?�C\02I�E��h�@o�Qq_�\0���	:�*ěn�h�vC�K����k[Z��^��U��j��C�{�\r�\0?5��֭�}\ZZ�ۺ�N��G.{�����\\�X��<�\0; I;�p���79i\Z��~	����`����kL|Y塝�Igwh�A����2#s@uv\r%���\0��$l�I��ɢ��o\'��U�ӎ7����TL��*�I�oo$l�CG7�c#:�˞ʨ5��Z��Wc��v3ڽCF-\"\"+h��\\�Wk_�n3���\0���`\0\0\r�o/�O?�\"�铩�I$����4�I%)$�IJ\\[�3#!�\\�r����\0����gu���VK�Su��	��?F���ݩ�^~9��ޡ�q��=��5��ɩ�5��,�,��k�����H\\���O���y��u��Ӫ��k7:�ǣs�s�6���U�߿�#}�2��*��s�|4�������C|��8w��i�����H&C@��ȳhk�s����;�~��ꬑa��!���S�ͬ5��+f\\\\�|�5d�3���N\0a�V��#sy��U�/�zl����ܬ�����9�/��EB<��r�f�� #R���ŵ�k�/�9��u��r=��^��~�bTΑ��V�l9�yp���k�����*�ZY\'�@���2H�]$�IO���4�I%)$�IJI$�S�J���<�h�ג�����.U�k[Ik��*�����c�is\rn��gp�\0�b�r�\"�U��3W0s�3���x���$�ǫ\'S��x�E��b�>���n���P�&�i�/\ZG�+J����Xs۹��0H�?I��anCKYuLl\0E`k�T�Ǧ��y\'A�l���Y-lI畛c����\rJ&D�$jQ�]Qieq��?��TBc�Mb]c�Z<�v��T�4�	��-/�u�����p�:��cK��\0I:1�0�U�=-���oѩ���ѵM$��5$�I%t�\'IO���4�I$)$�I*I$+���t������jHp��R���X��}���kN��+�-�csO#��f���X~�W\r��ZZw�����k����+he9�c_NƘ����\Z�\0�S�\0ehd�\0K�g�/�?G�4d��\Zƛ�ɚ����\0��ŧ���MP��4} ���~�.���_��S�{^�k�xFQ;�q6-{��2����th`.�~��S���^�k�$���u��ű�WD�C�$�H�)	Dlc#�D������Y�?�v����\'�q���>��C��.ͣs(d^�/%���C]�~E���S_��-�뮊kmA���+kIp���?�w���z��+�.���R≖�n�Y�\0�\Z��Z���-p�\Z	Ԟ}����Y����a�2�$|���-<^��y\r��6p7p���\Z������$ԩ$�IO���4�@������{��W�HN���lm��������e�u<��0�5�4�������&�lm`���\Z��6�w�	�g�����GV�����%ǗG��Uz�qy�s�$ 4�V�s��L�Q�{�6ƒʅ��R�n��y�r�Z�{��o�Rx\0)\rpm�Տ�<K]�g�ٳo��\0�茮��u/n�Y��d4� �>��F���q,�g��G�571�C[��D�Xۜ�����+��^��\0�ր�\0��A��m����z.o���Z�?��u��2���	�4i-i����-����X���ֻ��r�+\\��@���\"=��˛���n���/�+\\���عç��잠�`Ѭ���\Z�F�ҷ�^�m��\0���\0B�x/Xh{61�i=Gvע���� �rO��W1z}l���cd�;�!�cｬ�r���|j�\0�d�?�X�=x`]I똿b���k-T��Ӻ�{�}I�%��.���>���}0h�w7k�ѾH��W�mɲ�oM��o���%Fc^�y��O�X1����[��G�K����o��g#��m��@���K�ݶK�}2L��.�s?E�	�a⧴��h\r`h<�C[66,?���1�z�\0O.����Չꦰ����N�=��7>�O�>��=OO�\0,r���\0�jqݮ�8;x���8%�Q�m���\0Y���\0��5lh�Q�#�\\������9���S6W�\Z���-��c?���o1ax���?����2q@4�u\rv�#�ܵh�:��K�{�7�\0$��d�@�[醴�t6ʛ�\0�1T\Z�5�3��������vW���i�*��c�cw1��<�	�-]��.ǰ���ۣN��������{�����}Y\0?�c����`m6�\0���2z��/f!��4���2\Z׿ۦ��6������Z��<�d������n=�`���\0�eֵ�i����\0S��&`u�}���7iẶ7o��A�`\0�jB�W�����\n���Nu���c��>�7�Y��?�X����p��p���U��\0���Qk1}3�\r��M��\0�f��E���9h�|�n���W�\0��D�5���R�׳�e��\0<u?��Wc���_��?�	�(K���v�1��>��ڱ�\r�����\'��O�2��ǘ�n}J����[��O��\0(�䋫�����U������m���\Z�~���:����t{��\Z�N�q�㵿�ks�����^7�D���k���u���{=bkk�\'�f�����m^�����q��X����[�2l{-53m�;�<�OѲ��>���`��.\0;sXv����m��m{��W�����u�7;���kjcr��m�V���f�Wc������\r:=���y�<�c_���Wa#�ÝS��ea��v��F���7�*龪c��\n�^�>��T�	�]6ޕ�>�9�kl�\'7�0�\0S��+� ]�N]8������6�I�mD�Q�9�]�c��������1�9�\r��4\0ܚ6{O��~�t̀Z�\\\Z%�ၾ�=�0ͻ,u��_�k�=���/�Η��:�xs����=�v�Hut<Ͻخ��9���n��E��ms<��t,%̰������~M����y�MMB��Cv;mi.������.M���m�������\0�i���+�����}�u:�\0��M�?��\0�0�\0�*�m%���?�g,�����Y�am��kzm���:��[����lʣo��4�~�q\\��a;�\0E�X��KF���\0�Yl�\0���6����;�\Z7��Ɔ�\0����f���|��s�e���,؁I6c�?��f��:�io���_����~�h,�u8W�����w�mbEV�\0��8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\04\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0��/http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 4.2.2-c063 53.352624, 2008/07/30-18:12:18        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\" xmlns:exif=\"http://ns.adobe.com/exif/1.0/\" xmp:CreatorTool=\"Adobe Photoshop CS4 Windows\" xmp:MetadataDate=\"2011-07-07T10:32:52+05:30\" xmp:ModifyDate=\"2011-07-07T10:32:52+05:30\" xmp:CreateDate=\"2011-07-07T10:32:52+05:30\" xmpMM:InstanceID=\"xmp.iid:8E6C595E56A8E011BF78ACBC9FBB9B39\" xmpMM:DocumentID=\"xmp.did:8D6C595E56A8E011BF78ACBC9FBB9B39\" xmpMM:OriginalDocumentID=\"xmp.did:8D6C595E56A8E011BF78ACBC9FBB9B39\" dc:format=\"image/jpeg\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" tiff:Orientation=\"1\" tiff:XResolution=\"1000000/10000\" tiff:YResolution=\"1000000/10000\" tiff:ResolutionUnit=\"2\" tiff:NativeDigest=\"256,257,258,259,262,274,277,284,530,531,282,283,296,301,318,319,529,532,306,270,271,272,305,315,33432;02305CDF1CA2FB3998B7639C6EF0F06C\" exif:PixelXDimension=\"196\" exif:PixelYDimension=\"200\" exif:ColorSpace=\"1\" exif:NativeDigest=\"36864,40960,40961,37121,37122,40962,40963,37510,40964,36867,36868,33434,33437,34850,34852,34855,34856,37377,37378,37379,37380,37381,37382,37383,37384,37385,37386,37396,41483,41484,41486,41487,41488,41492,41493,41495,41728,41729,41730,41985,41986,41987,41988,41989,41990,41991,41992,41993,41994,41995,41996,42016,0,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,22,23,24,25,26,27,28,30;AF1ED08CD80E77D5E45AFC2BB54AA1CF\"> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"created\" stEvt:instanceID=\"xmp.iid:8D6C595E56A8E011BF78ACBC9FBB9B39\" stEvt:when=\"2011-07-07T10:32:52+05:30\" stEvt:softwareAgent=\"Adobe Photoshop CS4 Windows\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:8E6C595E56A8E011BF78ACBC9FBB9B39\" stEvt:when=\"2011-07-07T10:32:52+05:30\" stEvt:softwareAgent=\"Adobe Photoshop CS4 Windows\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>��XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ �\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0�\0\0\0�vued\0\0L\0\0\0�view\0\0�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0�\0��\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\r%+28>ELRY`gnu|����������������&/8AKT]gqz������������\0!-8COZfr~���������� -;HUcq~���������\r+:IXgw��������\'7HYj{�������+=Oat�������2FZn�������		%	:	O	d	y	�	�	�	�	�	�\n\n\'\n=\nT\nj\n�\n�\n�\n�\n�\n�\"9Qi������*C\\u�����\r\r\r&\r@\rZ\rt\r�\r�\r�\r�\r�.Id����	%A^z����	&Ca~����1Om����&Ed����#Cc����\'Ij����4Vx���&Il����Ae����@e���� Ek���\Z\Z*\ZQ\Zw\Z�\Z�\Z�;c���*R{���Gp���@j���>i���  A l � � �!!H!u!�!�!�\"\'\"U\"�\"�\"�#\n#8#f#�#�#�$$M$|$�$�%	%8%h%�%�%�&\'&W&�&�&�\'\'I\'z\'�\'�(\r(?(q(�(�))8)k)�)�**5*h*�*�++6+i+�+�,,9,n,�,�--A-v-�-�..L.�.�.�/$/Z/�/�/�050l0�0�11J1�1�1�2*2c2�2�3\r3F33�3�4+4e4�4�55M5�5�5�676r6�6�7$7`7�7�88P8�8�99B99�9�:6:t:�:�;-;k;�;�<\'<e<�<�=\"=a=�=�> >`>�>�?!?a?�?�@#@d@�@�A)AjA�A�B0BrB�B�C:C}C�DDGD�D�EEUE�E�F\"FgF�F�G5G{G�HHKH�H�IIcI�I�J7J}J�KKSK�K�L*LrL�MMJM�M�N%NnN�O\0OIO�O�P\'PqP�QQPQ�Q�R1R|R�SS_S�S�TBT�T�U(UuU�VV\\V�V�WDW�W�X/X}X�Y\ZYiY�ZZVZ�Z�[E[�[�\\5\\�\\�]\']x]�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c�d@d�d�e=e�e�f=f�f�g=g�g�h?h�h�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn�ooxo�p+p�p�q:q�q�rKr�ss]s�ttpt�u(u�u�v>v�v�wVw�xxnx�y*y�y�zFz�{{c{�|!|�|�}A}�~~b~�#��G���\n�k�͂0����W�������G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z��M��� �����_�ɖ4���\n�u���L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v��V�ǥ8���\Z�����n��R�ĩ7�������u��\\�ЭD���-������\0�u��`�ֲK�³8���%�������y��h��Y�ѹJ�º;���.���!������\n�����z���p���g���_���X���Q���K���F���Aǿ�=ȼ�:ɹ�8ʷ�6˶�5̵�5͵�6ζ�7ϸ�9к�<Ѿ�?���D���I���N���U���\\���d���l���v��ۀ�܊�ݖ�ޢ�)߯�6��D���S���c���s����\r����2��F���[���p������(��@���X���r������4���P���m��������8���W���w����)���K���m����\0Adobe\0d@\0\0\0��\0�\0		\n\n				\r\n	\n\r��\0\0�\0�\0��\0\0���\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"q�2���B#�R��3b�$r��%C4S���cs�5D\'���6Tdt���&�	\n��EF��V�U(\Z�������eu��������fv��������7GWgw��������8HXhx��������)9IYiy��������*:JZjz��������\0m\0!1AQa\"q��2������#BRbr�3$4C��S%�c��s�5�D�T�	\n&6E\Z\'dtU7��()��󄔤�����eu��������FVfv��������GWgw��������8HXhx��������9IYiy��������*:JZjz����������\0\0\0?\0��\0�=�)�R�U�v⫍(E)��:���8�]�`y��X�\")f`�nX��90�������e�_1���_[���h��z�����p2�S� ���_����Co��:��s̢����\r:����.T{?);�]?�~��ku�Gau�+�m?����ܫ�%��>\Z�8@7��ӧ�yg�~S�\08������&{���h����,������>m�fG�\'�rs�K���k��\0>��-��b��$J�P��� A4D�(����IQ^6�*��A�#\r1~F��g�d�Uثt\'��]CZSU��>x�X�����:�*�*�4�lU�Uq�#�*�v*�,%��ߞ��?����R��>y��9Yt}V����D�O�c���nNˊ,�b�t�\"�\0��ߜ���ͷ��)<��E%-tm6f��M(������*9I�wX��o-ߞ�`���N�$��k��K1&o޸�S���\0�6�1L4jw,�gf�V5<�k���:���z���\Z��Bi���|�p��d��_��Q�-ĠԂ��*wx\\�Le���s��=�֙����h���G!��]���7H���<�\0�Q�\0��~`�VI��C�:����^���{���Ky�&�a�\'��Heo�_�_���>T��^P�>��K�6b��ZT:�vߨ�-��u3��jOb�dHP[ȶ;lӶ*�qWT⭍��lU�ڞ������:�(��K}7��!���V�����\0?;����s����7��6�GӋ�����q%H��&n�19%�ɧ����O�=��w�6j-s<���.LPEȕ�&��n�NS2N���b�� �{�oN��B�:�-�c��S�⧦�by7���on\r/	��\'�V�+Ŗ#WG��m!���Qۉ��z��.(W2�,�6a%}4��y\'����&��H\Z<��(WT1?>\"�>��F��-X\nī>-�{�$��$ĎEc����Aɀ�5۵Ob2<܁�&�R�<�G��\0�_�Z��fKf���5��msS��Ӌ�U=Ev�!07-ӀϏ~o�g�K�[H���������u���@�����P�\r	܊���& �z�B�	7� �`�|R�	�W( �h/گa���)�z������:�(��K�WW�*�� ��ŉ+$u�\ZF<Ufc�\r����_�����r7Q�����t]6�e�n�M���~�f��PZGpJ�tv�L>x�����9��]��$;��2r�G�i��SeȌ%�[�D]�w�[���\"�0ddVob��^�K�#M,���lGץ�6[I�a_��i�er�|{u��O)~DkW33j��6���N�\n�i�G��y���vZN͎;$�~����/�Z�w�S]�QX!U*�d��&�����P5���s����7/-�|������v�6�T-�R����Z|�69��w����� _&-u�/1�2Z�i�,�M�q4�D�4��f�{���u\0����[������.\\F��~�����2#1[uu��\\��5�s���\\Z1Ξ�h�:(k���\n���\r����\0>����`��+�\'C��Y������fEq`���3$Q����X���ʋ����Mk]�V��q኶���u$6�z�w��j���_����:�*�*�U���kk�o6���,>O�����[����ʲ�J9��7�����qH�}����2kS�f3C/���H����	�{;�\"<5�+�Ⱥ����	��\nS�,d`�b��b������vweχ�O����cwyޡi�`yI(T�\0�R��z���JD�^��#s��_.�U�h[@�i6�@U��J�\0��z�Ñ�qv���Ɣ�E��|���G\"��ۗCL�攷\r��#�ɛB���w7:͙p������5\0\n��]U{\n)\r�\0䯕�Z_���ۀ��\"�@@)�x�N�i�YfF�6/1�?�.��\0D�hȥ���_r{�Q [x��o�<���4O�..H��ҡ������N\'~VןK���\'��\0.�)��J��{��Ã�57&��M�{����G�t#�GP^��\08���y���]b��]=m5�C=��dA<���Bhj�F�|�c6�u����z8���~DTdN��E~��R�1츫U!�M�1U�kȞ��V�n8�����:�*�*�Uث�V�,$�s�~�����W�`F+6�qo`��9�B�&\r�,x����-��~9&���P)�;/\ZQ��M�M2��^�V�%�Ǖ��[[{xmcB�C���ꍛ����NOh��=U)���L�e�ϖ�a{>�l�(Ph�@5;���}S\Z��NTJ��|:W�-13�~���B�[Tv��[w5�;y���ՠsקm��<��4���uRR�&�k�|cD�|yXxo�4�ػ�9�\n\r�C�=��L��S\"���̏*A��\Z�-4o�6�Ӷn4y\r�t��}��<���o5h7��+�j�LT�U�	���Zݳ����!G�7����A�iZf�lC[�ZCs)���5u������Emܙ�[A�b��{}8��I�4>���0�ӊ�CJTR�qW����:�*�*�*�Uث�,$���\0��j��J����5�zT�,i���\'#E^%���Y��e���Q\"�]bygQҼ��t�|��E��i�_䫴���d%Ш�_�sZ�OK������\\\0�z-+�f�ٻ�vC���]��D�ħ�,\0��R�eOH��,�:��r�\r�3 H˕�\rU�jO߈bAc��5��r��N�&�u�\\o\"K?P��dD��;�M�F����O�/z����^�Ux��H��D��+PGJf�H,�U����֢IuHJ��^H�Z�x�l}����y<֧y?��į>����\08��W�h�&:,\Zu��Z\\X��߹��Nw��hpL���*DC�\0V�����b�P4�w늭����T\0\0Gߊ��׮������:�,N۷�\'b��]]�ኵ��Q~;�\0��5[��W�Ɖ�3����Ɔ�4\0��Yt�f�2K���Ηu}�{>�\Z5�u�BI��<>���鷣���+��_��L֐[�J,q���ҕ�Ψ�w�2p��W˞U��ErH�Ս|;S5�$9������aH���\nW��D�����^\\����a�m�d�_/��D�=6�b(BS?��wR	n��N>�|P�5�+Cp*���OQ^���j@x��|��%����ed�����\0��\r=�夀#%_qʽ+�ƈpsˏb����r�~b��\'G�X�i?�捷\Z�#:�4�!�ja�\"�*�\0�Ry����]SIfR�]�=�P�j��1E8{n���������̡�7�0w�qK��ҿF*���b�v�j<+������:�-g��Y�Y;k�)�Sv_���Vo.~W]\Z,26�k,��,�ބ��n;���_���_�+��b��}F 8��J���ه�;Wyz,R���\n�nS�IihA���@E�_�=D\"9�% k�խ<��M��+D�*���C�+Ǌ2vD�N<������6W��D��24������ً�@��y���!^A����J��|k��W&�s&����V=��JP�_�,���0��-��џ�zo�b�ծ�<@΋�m��z����|�\"�� �GaRz����(-�6)��ݷ��-�5������]H�ɶ� !4�Nr�����s�ݫE%���u���jrx�zug����!�\0���m|�\Z���akq(e�$�+���\'U�D�~��\0ϝ��/�?842h���M�\0�H�ib�\"i�A����y���{�K��(. o`6������)p�U��W)&���Wq��\\U����:X�7�b�\'b�ؠ�v*M4θC_��\0��;�Z���a|�^gе�q�����a9�EB�N��������v�)&u��~p�-�0i�_��t�%���3\nU\"@�G����0us�y�\Z���[�*\\kw�d���ؚPQ����q,�\\�Κ�,O��?�~[򕏝4#����H��,ͨB����P\0R7��V��L���}则��כ:��|����}G��j�D��-�\'�����c���)K���	\n���/\0s#U����F<����8�/�y^�Ih���Oեh�K���ԅޛ���x�����\0���>��u�������7�aĐ\Z�#)>_���뚶������Ȫ�Hc[���fc�j6Y����\0͗�k�����_(�W:֛s�6����v����	��>9����r���rx�&$��\\�k���m{O�.�y��;�A�Kh-�	��;�`y<6���{�Ϣ�	�������Փ��tҼ��l�w�	��FF|\0s\Zx4f�7��q]~[���S����p9�/�\"�)CZ�=K.�W���;�}_�[o&~hy�F����n���E��K34+\"��IPGJ��.A\"z�Mn�YA���о���\r��6�M�)w���lm�ߦ*�~U�n������:�,	]� �R�Uث�1a\'���/�Z�?=�h�X&�Q����[0���f�y�PI���|?�P��b0�L�@ߖ�_�W��e5g���PS�2�}(��n��}��Iz��\"�\0u,�j\0{/j�9�\0�x��3�DԴ�\0Ad��aT}f3M���j1�n�n��U=&�V��3j�ZR���Akch��(���V��-h����4�I?7���g�Z�WM�[�ZU�4���\0�����&A)\0�1@�<26{����R�t�����)�oo�շ��RӤP��2��9���j���p�c�N>1L�M�5K��Z������\n�8;�\r>���ǫ��|\\�\":\Z��5�jZ��};1<��+.���\0Tҵ�g�<V�d6{�\\����ӛǶ>�D07;v9a��H�vU��.��5i3F_h�h�DH�Z@f^��7M�Ň��\0�\"y��R�ˍ�2�\\�NԵ+��I�*JӰ��~[�˨\0�]F�I3TL_�C�o�ǒၶ<�*��޻|�V���jb�TS��\0ي�����:�*�*�Uث�[w�,$��������mү�D�2�%��o��C��w_\n�i���\'���|=�?/���#N�-�}\r)��CܪO\"�􁎴�@KɎ)�C���C��\"􀫃B)��9�%�c�rgs�&�K�`�(iS��|���Dl���qi�w:��+h-T����P*I\'��	�)sc,��G��3���vJ,����J�ګ�{c�eo���*Gegk�����k2�x��t)4mF�Kf���.�{���\\�!ށ��6����`Mճ�g�QI#a�]{pF&�0,�����JJB>})�o���\ZC�2,H�F$�8��N�dFH�O�,���[�����N��^��k��ώ��ݡUO��$|�{�:B\"�\r&�����<J��� �h\"N�4���tD|���t%����p=F�8��Vژ����+����V��ъ�����:�*�(�T�v)k�ñR�c��T��?1o���鶲��CG�0�C�@�nҍ���]��#LA�q����fH��mͽ�O���L�;�3G�n�D3����-?#LO�IS�ƾ٢�t�8%���E�+�Dj4$�\n��(�2��7�D1�/Mm\Z��{���<h����2�*4�c�;�e|�=��7��-�]>y7)kp��\r��0PWƍ_l2Rc���{�M\'��-ݍ���G��@*�fR����>	q0w��y�Ͷ_^�P3��JJ�c_��O��ani�&S��|�w�P��Si\r�ޤvo��${�e����DS*ע����¬((*;��	��/X��hh�ң�؁e9�����h@?�(\r6��3y������O���\Z��.�\00t啃���ng�fZ��L����Pd��\0y�;���	��|�?C3p���Őlb��9nv��W�ҝqWSj��~�U����:�*�*�PE��n8��7�_�:]�����ZY��wgqb����l��T��普�\0\Z���D�כ��Y��ҵ�N�gi�+�\r3�X��{��yK�\0%�}9�e:5��}1P�+t�N���y��Gw��y�&�iB�-Y��c+��g>uÿ&5�?�6x��\'3E��	�4�N�a�d����O4���\Z�Wf��8����p�Zv������]�%��AV��^)싑��:��w�~yw�F��bKļ��t�YZH�2�ʅ���R����dg1*�<X�� ���=g��V�X�r�-%�\'��W��k�d,.���ڤ�g���k�i6WI)�tXnC)���2c1ع�	ǈ0-R�d������<CwS+�1�\'J����iv�}{{r�[Z-;9�h*sy��1���U8��K�~��7�#\\�ߘ5���;K��ڈ����~a�� 	\n��?�d+���N9��������زv*�4�>�Uz���Uܽ��*�\0���䤕Z�&��֘��k�N��I��]݋\"�T��O���6���7�Ć0N�\"�t4`p�<�Fr��h�:�.����=X��K[]GMHJġP���҂�e+�z�`�;\'1�����\0N_;l{|�A��� ���T�6�%0J���h�)]�N_�ǽ��d��N���,�Z8�XdV��Gcq��kV��q�Nٰ˧2���+��\05tˋ����9�Ǥ�\Z�Vjp\nl0CD\"}Fݶ�Ng%��g�ܶ��Oct�9��5�c]�\n\ZW�[.:ܵdŚ\'��o7y�Y�K˓��jNhZ��@�j���\0NC��&�tpφ��I�h���G��:��Ee1�4u��r5�t����3G�vL|�%�Ǚgx��[�/Z�����<@,�S�^�h�.:z��G�Z\0��01�FY�z���v�5_��.�#�sMy&�\n���O��{><�c������\"�`S�Ŷ=�Ől��OlR�4>8��)��qU���LU����:�,l7�\'b��U�b�gS.n�eO���-���G���[D-.�~�B��ҹ���`���n�d0��)L����e�{\Z��W6.A��e��N��m:��b?�	\n�cą]��ו቉��� ��/YkQ�dQayCp�^}�c��yBV�zvc~Q򦥡j>��[_BX1�\'f oƛ��6q�	�;9:]t�_P��F�D yF�ݢ:�u#HU���\0E)ڙt%�a�]�r>����6�O[֥��A<=5��k^��l+�FYa\Z)ˮ��w�\ZO��4E��w��>��|��`K4�K����A���4V��,���ʬ�lĀH�F��%��;��\Z��H���T1�\Z�1̾��\0�3�\Z�V�W��Z�ez}�v2Lޣ��3��C���\\��{��d���-��[��]�W\n�늮�Oߊ���i�\\U����:�\Zaռ	�v)6�R�,8Kg˛�IO�^^��~O�\'��Nk�������1���V�bx$s�F	�����S�X�G\"ӍMo��W��Uf��C�z�Rv�A5�2��(Kq����\n�4bh����u����!GX�KE�j��Hjv��e;��1Km�R]b%�;Y�eF*�w�R����&��g�3�@�ʿ9z�O0�-�^+�5Dt�lhI5�����x�l��]y2�N�M�̳��U�z�\Z{��1\'�|���_����l�����8�ҐzP2Xg\\�8�!��1�^� F@���kP����lr��I>��Nf8� ��ђ��}Tժ�#�?W�������r�ο4���ܫ��\0�Pf�\0���\Zɉ�5��v%�7��;�v*�h{b�oOlU����:�K�Y��E�C�I�-bƋg�7bɯl�j/�o��-�_Ϛm��NIaU �Y�(_�������^���˄w��y��u�\"k9=�t��ƒ\'M�\0^c��0A�\\�#(�y��3�7WvM��ϥ���!��-I#ea^�3�<@lُWñ4~��ߖ^c�^Iz���x��\'���5��c.Nt2�{ľg���͔���@�8��#�[6�.�xg�?�mŕ���(���\0}��QZV�~��`dES#������-�F�k�������� fn-�V�]w��i����l��S�r��J���Vl�����P�XƮ@P?h��|�\\W�k1���徘�7�|���ZE�láoIKS�\'6�B��d�C.��C�	v�☳.�\0b���6����/����:�K�Y��E�C�I�R�bǄ����RV3Ff!UA,ǰNH5��w�/��\0�ڷ�<�F�s�]_¢�&�3��`_FT��\n�z`�遇�n߲5|0����Ϛ/4�U>���|j]�y�Ŝ]�&+��1�&�U��S��}\\����qЫ�7�2��8Gxq���ȣ��;i�<P]i������2Im$J����1�#|�Ib��\nߣp�1`��Z��<�$�`�\\���V��1��WaEaȃF}��*Ňsl�]@z�O����~��[�\0YfgzTr%6�̜c9Y!�c,���g��^�H������7���8h)H�WMq�n!�i�kk=��W�s�J/���\\Ö`�qb��ѿ,���`�N�q8�M����j��gyAT�����s?��x��#`��cR0Â<���c���~�s�����QZꖟ��\\)�����^�{f�<\r�LWG��\Zo�1� ��U���,��)#i%�DQ��SSR[�dR���n�5��P�W!�m�����:�H���\n�M�e\'b�m���\Zv*M���2���;X�T����u98��H��y��aWO���-dX�y[~��0��s\n�;��T���\"X��x�u5��*B��\n�dӘ��$B�6��~�\n0��G��0@b�h<�I��Zٵ��k�/j���Z�r/ep��A�k��;WM���ϲu^>:��>�7�jZ8���X�\nִ�\'���X�kwq�*�qh��;s.�ÿN�ts/�\0S4�K}�VR\r*���r>:8w>_���<�������d���[c�h(4�~R,g���<|0��\Z����?��P󖢶�!ѴM:1w�O0J��ef6���B8��c홚L�M��;O�D��S��;˚^���L���ҪZ��(i\Z�X��g��7���懌0�ñv�]�p�F/�Q,�⑲��/`�\ZTVS܃�v2*`�~\'ghF�,�A�i����t/̟5��C���ӣ�rK�����Zx�#+��;�ok{ߕ�7<��zv���\r���&?�c��j}9�<]6=U&�DI\"q,r}�C�H=�;f9�2�2)2o���[ڞ������:�L5nȐ��e.N�$�K���F�bjڄVj~�1����*OݖG�Ɂ!�`�ߒg6>Y�/,��]H���D��ҽzu̜zjܵ�[�5k�V�&�u�n��Y��O5��B�!��qH�Jflq�Cf��^ӡ@`��R�\Z[�*��%H�H�UB�H��)�-�HDP�eѾln��dYq���a�B\0�X}B����n7�-��fIe2h�_��;�+U���%�\0�(O�,KIG�mm��ʤ\\ۏ�)y�8�bj�G(1=[p�g�Bq;��O�?+�Ǧ�w�1j��ڛż�\"QqcZ��(wxȡn5(M\Z��j�pp�}��t���t\'�?c�ϗݤXJ�d ���;��Ӓc�=jA5��]Ehp0��v������H��,����,�\"�ב���@�%�Y���H��[�K}F��#kؤ����߅�ZBi6��IZ��g�<�;�|�{;�D}Yw�o/�=�c���ߠ=r�m�-4۳���۝[M�h��Zه�ɩ\'>����|;�|=�����/5)���-ע���E4?����C�R[ZN�,p�I��޹Y�	�/?o.���m$���M��Q��E�1��Z�V���q;<��H��m�U��%Y��0dU��k4�YX�aտG��勅T�O�k�p�nƄ�-֖���a �3�B�#�=��`x�ByFwP6푔��)�����?+:�6�D��$�竣�x����%�K� w���s�F�H��������$��>!קl̸��luN�.����-��0a�t�s�\nFdS�f�\0����:�L5n���V���ٮ�[���g����ȣv>�d�y$�xW��7����ݸ��v\Z���+Ƣ��\n���������K|ڼG�\\�^_��JY��e�\'�R�L\ZiR���Z-~\"*ˎ\Z\"����lm�\Z��5���}�6�잔��F����om$��@$mQR����һ��}J�H���2��\0��K5I���5�2��cW^��W�o|ݮ\\1r�]��4��wow},V��@=3�EL�e_\ZJ/���[�)v%0���@[�����Nʗ���\\�C��q���� �.H�/]=���\\����]��񖺴�W��qG��7@�$U�z��R��fb�?��kZGf�H\\�v���kp����u�Y�z�M;Wo���) ��x�����Kιemi���I�t�4��Q�[�0�AN�ے$��Ә��]Gf��m�];�\0n�E��tƮ��_\\�y�ZYj�hw�~�-�H%�jn׏�v��+�{��ss�D%��e�pv�,��K�����^_�ً٢�=u�������\\0�O���MS⻸�\"��kV-N�Aٱ��}��ݬuR��#���EԚ��&�|�5��H��@`��f��R�?cIӇ��R��v5�g�ÿ�~����!5mA,�ic�K�n_S7�����#\Z����+W�V���8��<Q�4�d\nyɎY�s�Kq%�ff����^rz7\n�%��v���ޟ�W(�v��Q��]i��ڀ����y������Mm��Ŧ�V�3M��=r��.h�KuVkh�	���qy�X�١��j��ww�<��O��jW)\Z�ƃ�.�U�o}mwOo�v#����,Kx�^���dӴ�?�vd{}A���/t�7�aJ��%�[+��,RGn�!y�*G����+1ɓ����nޙ��~^�i:��t�\n�\Z(�)Uu5�?�ʧ���&i�Y��G�;_4Xz#���wM�%�߿^\'0���eoj�\0�s�_��ߣ?嫘���k�J�?�+�~ ��\0����wykam%���v�Я)g�����r`ɪGw����s{*��m^�O�\0S�̏�31i��;�\'ky\r�桭�Ow��=�ބ�2M#�ͼ���:77U�\n�v�(s?��K\'@����:�ؐɧ&�4S�i.t��@�N�,���i�d�;�01���q�{�Az��x�)�O�5+��iy~��v�\Z+Z���)PI��?��>��KR�zE��Pj��WT�\0�������]KX�E�M�)�����RN���i�r� r3@��l�v�\'�����x��g��&�V��-�7�^�\0=1c`�F�W������/l_@���w�R�G-��X��p)M�@~��w�s�u���J��z���K�}4�喾��-a��~�jH�ӖA�tݏ,���C\r�f��ln%�M6�\\�uZYt�\Z��D�m���j�\n5\r2����[$n���\0��������\0ʬ��ִ�V���\\y��M����u(�+v��]�x҆A�v�\"��|gL�=6������&\\2��}k�K�?���o�&C�-pqmg�5�Kgzs�)��6�ڤ�7̌8D������ML���˻�z�_�U���u��i��K�Yi�~O���4P��!��\'�*�V��n�N%�{��ǩ2���>�?��y�G�o�t�3�{P�̚O����M�����m�irP-`V�ܻA\rCP�YD��>~��<\nc�$�r� 7�~�g�����kh\r�4�2mt�����̜c�~?��x����)���l��MMnM���+o��e�� O���2v�v-�\Z�y%|����b%.��9���67�Co+;y~�F>�[[�Pq��z���f��\0|#o{���y��|i��Ÿ�����p����n��U[X�L4��7�@�\0+L��|I��?RIކ�\"x$��Z�ŀO�7^_��c����b~g��Ш�p���ɥă�:���%������X�@�\0d�>G\Z�n�\0ؤ�^�$��\rա2>�wj8�ơ��4\0ּ�M\r@\"�푍�PD�#���[�V	�Љ�0�2r�I�)R�\'�(��#����A��5~��?_�T�y?Z�}_N��.ӕ?��xax�s���/y�y��>d����Gs�Z�x����+��e��&���sw\r8�=S����Kw�[XbYYh��f��Gs�����mlh|2����s�l��!�lb�)Gխ4n\r�<��zK��\Z����������b�o�5����;*�Ʒ�5��J�K_j�KS��{���c����Ѵ_0ƒm\Z��>�7Z[�e��Oω	z�}=?{)P��n��������B�P�����5\r}��[(�L�˺������W��#?<���}Ŝ$Nux��Z�̲���f�\0�J�>(R���N��n�i�\\ꉯ[�{�2��n-�W�#M�U�G��ƕ�*\"���Ř4(�%���֍��L:��ͨ\\E��]8Z���6�E(貏0����5�5��>��8��a�����=�K�E��%�Q��ȡntǉ�$���#w���T��ſ���}K�q�;q����̖�q�	��ff��ԁ�kY��`0A%�q�k�xo)��y��w0��Q����~D�j�G�c����m��G�ؐ^��C\\\\����RJx�&h�{���-:�0��ls�o?�K_���?=�0���~Ry��-]�?_ҵ�^i��	t��E�*�� ���r�e�,�F�:�G��&�4�&2�^��+�@���4?&�V�áX[��j�K��F��_�E�ٚ�/�݋\\�!O�v\0�j2z͹x�W4�hb���U��>�sq�Y׌i\Z}_P�!U�B������޵e7�~>jMsF[ZY�;ū�t�R�}�������VҼ�62ܵ./)�?|49\n����ݐ;��u�5�PI�k��n����S-&�?��~gF6�dRj^=ԁJR�ц��y�6:�/?0��`�]G\\�A��yj��_e��!��B��}i�xH&�|�ϗB\'�á�����7lv��[���(oNv��=�����K�\'��0�V}�\0a\nN�*�(c�%`D�\\^_��A�Q��\ZU��Er��bc�c���cd�D�v�w�~�4�f͠B����e5�`����\'���_R?���A���<���\0Ĳ�/��{?���Yi�J��٭�����=��9�h�d�,?����ނe\Z���8���(��c��ܰ���\"QP&ѴW�����\0H�?H�rmu̟�_�OVL���I�O��(�A���\nK������$��_iH��l�$յ�,i�y����	����&�Q�нr���rbʮ�i����\0sv�;��<����c����������/�\r�Y�m[��o)_���Q-~�������?��+�!z�7C�({���M�G�R:\'Z����ߧ���\0�MJ�\Z}Ð� r�w��ޡ��l9�����f�>���/���qO�D�)�O��z\\�� �nvE�t\Zlv�e%�W��]ybHƝ+�]X�)�-i#��bOJ��r�w�b$	��U㲸k���[��&�X�/;[�E�U�ބ�rr�U׻�c�2�~e�[�g�7�_�~O�-�767�Zu���ƲIg)��T����x��קL����w�/�(���g��V�{���D�q���D��y�)-弋\"�6����6j1 �鵖i�W�GX�䐄n2�!���}=�\08U��������>\\��^[�,�,���y-�g.���U�_�=xt.�{�(����(ȗ�R3\"_j~OIF�w�Mj�0������M�E�^Κ#�e�<��\r�!b�ymH��>,��k��e\'���� �t?6`��^қH���\\�,ZΞt�J�[������@�(�ց��J�����	b��,t�\00���y���|��>Y(���In��aG}pq������ڱ���¾�\n�G��ק���T��|������!���;���3]yk�3y���;��e��w����써�F��� ����Jb���u�c;�ڸ�B�j���?U���������n\0;!mY�ǅ%1e����\0Cv�jv�\Z����d:��@�+o3X��0�ī$�+�F.��kg�Y��Ls����?���]?H���|8�����}�σo\'��','emp.jpeg','image/jpeg; charset=binary','34696');
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
INSERT INTO `hs_hr_employee` VALUES (1,'900010001V','Kuree','Amal','ETH1','1990-01-01','NAT1','EST000','JOB001','JOB001',2,NULL,NULL,NULL,NULL,NULL,1,1,1,1,'900010001V','900010001V',1,'A.B','ඒ.බී','ஏ.பீ','Amal Basnayake Kuree','අමල් බස්නායක කුරී','அமல் பச்னாயக குரீ','අමල්','அமல்','කුරී','குரீ',1,'','','',1,NULL,'900010001V','2012-10-01',1,'LAN001','LK','','A001','','','','2012-10-01','2012-10-01','2012-10-01','2012-10-01',3,NULL,NULL,NULL,1,1,1,1,NULL,'',0,NULL,0,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Amal Kuree','අමල් කුරී','அமல் குரீ',NULL,NULL,'2045-01-01',0,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `hs_hr_empstat` VALUES ('EST000','Terminated','ඉවත්කල','நசறஙநச'),('EST001','Full Time Contract','සැමදා කොන්ත්‍රාත්','றநஙச'),('EST002','Full Time Internship','සැමදා අභ්‍යන්තර කාචය',NULL),('EST003','Full Time Permanent','සැමදා ස්ථිර',NULL),('EST004','Part Time Contract','අඩ කාල කොන්ත්‍රාත්',NULL),('EST005','Part Time Internship','අඩ කාල අභ්‍යන්තර කාචය',NULL),('EST006','Part Time Permanent','අඩ කාල ස්ථිර',NULL);
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
INSERT INTO `hs_hr_ethnic_race` VALUES ('ETH1','Sinhala','සිංහල','twert'),('ETH2','Sri Lankan Tamil','ශ්‍රී ලංකා දෙමල','twefrta'),('ETH3','Indian Tamil','ඉන්දියන් දෙමල','twegrta'),('ETH4','Sri Lankan Moor','ශ්‍රී ලංකා මරක්ක','twehhrta'),('ETH5','Burgher','ලන්සිජාතිකයා','twedfrta'),('ETH6','Malay','මැලේ','twfferrta'),('ETH7','Other','වෙනත්','tweghrta');
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
INSERT INTO `hs_hr_gender` VALUES (1,'Male','පුරුෂ','mt'),(2,'Female','ගැහැණු','fg'),(3,'Other','වෙනත්','mts');
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
INSERT INTO `hs_hr_knw_doctype` VALUES (1,'Article','ලිපිය','Article');
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
INSERT INTO `hs_hr_language` VALUES ('LAN001','English','ඉංගිරිසි','ககககககககககககக'),('LAN002','Sinhala','සිංහල','பககககககககககக'),('LAN003','Tamil','දෙමළ','ஙஙஙஙஙஙஙஙங');
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
INSERT INTO `hs_hr_leave_type` VALUES (1,'Annual leave','වාර්ෂික නිවාඩු','Annual leave_ta'),(2,'Casual leave','හදිසි නිවාඩු','Casual leave _TA'),(3,'Maternity leave','මාතෘ නිවාඩු','Maternity leave_ta'),(4,'Duty leave','රාජකාරි නිවාඩු','Duty leave_ta'),(5,'Foreign leave','විදේශ නිවාඩු','Foreign leave_ta'),(6,'Special leave','විශේෂ නිවාඩු','Special leave_ta'),(7,'Sick leave','ලෙඩ නිවාඩු','Sick leave_ta'),(8,'Short leave','කෙටි නිවාඩු','Short leave_ta'),(9,'Half day leave','එක්වරු නිවාඩු','Half day leave_ta');
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
INSERT INTO `hs_hr_marital_status` VALUES (1,'Single','අවිවාහක','்கgிந்க்'),(2,'Married Registered','ලේඛනගත විවාහ වූ','்கிநy்க்'),(3,'Married Customary','සිරිත් පරිදි විවාහ වූ','்கyிந்க்'),(4,'Divorced','දික්කසාද වූ','்கிநy்க்'),(5,'Separated','වෙන් වූ','்கgிந்க்'),(6,'Widowed','වැන්දඹුව','்கyிந்க்'),(7,'Other','වෙනත්','்கிநh்க்');
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
INSERT INTO `hs_hr_module` VALUES ('MOD001','Admin','පරිපාලන','லசசசசசசசசசசசசசசசசசச','OrangeHRM','info@orangehrm.com','VER001','HR Admin',NULL),('MOD002','PIM','පුද්ගල තොරතුරු  කළමනාකරණය','ரலலலலலலலலலலலலலல','OrangeHRM','info@orangehrm.com','VER001','HR Functions',NULL),('MOD003','welfare & Benefit','අර්ථසාධක ශුභසාධක',NULL,NULL,NULL,'VER001',NULL,3),('MOD004','Disciplinary','විනය','மரரரரரரரரரரரரரர','OrangeHRM','info@orangehrm.com','VER001','Reporting',NULL),('MOD005','Training & Development ','පුහුණුව හා සංවර්ධනය','யமமமமமமமமமமம','OrangeHRM','info@orangehrm.com','VER001','Leave Tracking',NULL),('MOD006','Promotion','උසස් වීම','ளயயயயயயயயயயயயய','OrangeHRM','info@orangehrm.com','VER001','Time Tracking',NULL),('MOD007','Retirement','විශ්‍රාම','னளளளளளளளளள','OrangeHRM','info@orangehrm.com','VER001','Benefits Tracking',NULL),('MOD008','Attendance','පැමිණීම','னனனனனனனனனனனன','OrangeHRM','info@orangehrm.com','VER001','Recruitment',NULL),('MOD009','Knowledge Base','දැනුම් පද්ධතිය',NULL,NULL,NULL,NULL,NULL,NULL),('MOD010','Transfer','මාරුවීම',NULL,NULL,NULL,NULL,NULL,NULL),('MOD011','Personal File','පෞද්ගලික ගොනුව',NULL,NULL,NULL,NULL,NULL,NULL),('MOD012','Leave','නිවාඩු','Leave_ta',NULL,NULL,NULL,NULL,NULL),('MOD013','Security','ආරකෂක පඳ්ධතිය',NULL,NULL,NULL,NULL,NULL,NULL),('MOD014','ESS','සේවක ස්වයං සේවාව','ESS_ta','JBL',NULL,NULL,NULL,NULL),('MOD015','Reports','වාර්තා',NULL,NULL,NULL,NULL,NULL,NULL),('MOD016','Performance',' කාර්ය සාධනය ','Performance ta',NULL,NULL,NULL,NULL,NULL),('MOD017','Work Flow','කාර්ය ශ්‍රිතය','Work Flow ta',NULL,NULL,NULL,NULL,NULL),('MOD018','Recruitment',' අලුතෙන් බඳවා ගැනීම් ','Recruitment ta',NULL,NULL,NULL,NULL,NULL),('MOD019','Payroll','පඩිපත ',' Payroll ta',NULL,NULL,NULL,NULL,NULL),('MOD020','Loan','ණය','Loan_ta',NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `hs_hr_nationality` VALUES ('NAT1','Sri Lankan','ලාංකික','we2w'),('NAT2','Indian','ඉන්දියානු','wefw'),('NAT3','Australian','ඕස්ට්‍රේලියානු','qwec');
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
INSERT INTO `hs_hr_prm_conf_method` VALUES (1,'Qualified','සුදුසුකම් ලත්','Qஉஅfஇஎ'),(2,'Exam','ටයෙට','க்ஹ்ஜ்க்ஹ');
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
INSERT INTO `hs_hr_relationship` VALUES (1,'Brother','සහෝදරයා',''),(2,'Daughter','දුව',''),(3,'Father','පියා',''),(4,'Father-in-Law','මාමා',''),(5,'Mother','මව',''),(6,'Mother-in-Law','නැන්දම්මා',''),(7,'Sister','සහෝදරිය',''),(8,'Son','පුතා',''),(9,'Spouse','භාර්යාව හෝ පුරුෂයා','');
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
INSERT INTO `hs_hr_religion` VALUES (1,'Buddist','බෞද්ධ','hjf'),(2,'Hindu','හින්දු','dfsd'),(3,'Muslim','මුස්ලිම්','dfsd');
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
INSERT INTO `hs_hr_rn_report` VALUES (6,'Attendance Summary','පැමිනීමේ වාර්තාව','Attendance Summary ta','Attendance_summary.rptdesign','MOD008'),(7,'Employee retirement notification','සේවක ව්ශ්‍රාම ගැනීමේ වාර්තාව',NULL,'Emp_retirement_notification.rptdesign','MOD002'),(9,'Service Extend','සේවාය දීර්ඝ කිරීම',NULL,'Emp_service_extension_ori.rptdesign','MOD002'),(10,'Employee service extension search by period','වකවානුව අනුව සේවක වාර්තාව',NULL,'Emp_service_extension_searchbyPeriod.rptdesign','MOD002'),(11,'Confirmation Report','සේවය තහවුරු කිරීමේ වාර්තාව',NULL,'Emp_confirmation.rptdesign','MOD002'),(12,'Employee detail report by Designation/Service ','සේවය/තනතුර අනුව සේවක වාර්තාව',NULL,'Emp_designationservice.rptdesign','MOD002'),(13,'Summary of disciplinary actions ','විනය ක්‍රියාමාර්ග වාර්තාව',NULL,'Dis_action_summary.rptdesign','MOD004'),(15,'Summary of Employees who are charged for disciplinary action ','විනය ක්‍රියාමාර්ග ගනු ලැබූ සේවක වාර්තාව',NULL,'Dis_charge_emp.rptdesign','MOD004'),(16,'Training Summary','පුහුනු වාර්තාව',NULL,'Training_summary.rptdesign','MOD005'),(17,'Training Summary By Employee','පුහුනු වාර්තාව සේවකයා අනුව',NULL,'Train_summaryby_emp.rptdesign','MOD005'),(18,'Training Applicant List','පුහුනුවීම් අයදුම්කරුවන්ගෙ ලැයිස්තුව',NULL,'Train_applicant_list.rptdesign','MOD005'),(19,'Training participation summary','පුහුනු සහභාගි වීම් වාර්තාව',NULL,'Train_participation.rptdesign','MOD005'),(20,'Summary of Transfer Details ','මාරුවීම් වාර්තාව',NULL,'Transfer_details.rptdesign','MOD010'),(21,'Service wise Employee report (Promotion)','සේවාය අනුව උසස් වීම් වාර්තාව (උසස්වීම්)',NULL,'Promotion_servicewise.rptdesign','MOD006'),(22,'Upcoming Confirmation Employee list ','ඉදිරියට තිබෙන උසස් වීම් වාර්තාව',NULL,'Promotion_upcoming.rptdesign','MOD006'),(23,'Summary of promoted list ','උසස්වීම් වාර්තාව',NULL,'promotedlist.rptdesign','MOD006'),(24,'Leave Pending approval list','අනුමත කිරීමට තිබෙන නිවාඩු වාර්තාව',NULL,'Pending Approval Report.rptdesign','MOD012'),(25,'Leave - Leave summary report','නිවාඩු වාර්තාව',NULL,'leavesummary.rptdesign','MOD012'),(26,'Leave - Leave entitlement report ','නිවාඩු හිමිකම් වාර්තාව',NULL,'leaveentitlementreport.rptdesign','MOD012'),(27,'Application for leave','නිවාඩු ඉල්ලුම් පත්‍රය',NULL,'leaveappllication.rptdesign','MOD012'),(28,'Employee Information report','සේවක තොරතුරු වාර්තාව',NULL,'Emp_information.rptdesign','MOD002');
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
INSERT INTO `hs_hr_sm_mnuitem` VALUES (1000,'Admin','පරිපාලන','Admin_ta',0,0,'#','01.00','MOD001',NULL),(1001,'Organization Info','ආයතන තොරතුරු','Company Info_ta',1000,1,'#','01.01','MOD001',NULL),(1002,'General','සාමාන්‍ය','General_ta',1001,2,'./symfony/web/index.php/admin/companygeninfo','01.01.01','MOD001','searchEmployee'),(1003,'Organization Structure','ආයතන ධූරාවලිය','Company Structure_ta',1001,2,'./symfony/web/index.php/admin/listCompanyStructure','01.01.02','MOD001','searchEmployee,saveCompanyStructure'),(1004,'Job','රැකියාව','Job_ta',1000,1,'#','01.02','MOD001','updatejob,sort'),(1005,'Service','සේවා','Service_ta',1004,2,'./symfony/web/index.php/admin/listJobService','01.02.01','MOD001','updateJobService,saveJobService,deleteJobService'),(1006,'Grade','ශ්‍රේණිය','Grade_ta',1004,2,'./symfony/web/index.php/admin/listGrade','01.02.02','MOD001','saveGrade,UpdateGrade,deleteGrade'),(1007,'Class','පංතිය','Class_ta',1004,2,'./symfony/web/index.php/admin/listClass','01.02.03','MOD001','updateClass,saveClass,deleteClass'),(1008,'Designation','තනතුර','Job Title_ta',1004,2,'./symfony/web/index.php/admin/listJobTitle','01.02.04','MOD001','updateJobTitle,saveJobTitle,jobTitle,deleteJobTitle'),(1009,'Qualifications','සුදුසුකම්','Qualifications_ta',1000,1,'#','01.03','MOD001',NULL),(1010,'Education','අධ්‍යාපනය','Education_ta',1009,2,'./symfony/web/index.php/admin/listEducation','01.03.01','MOD001','updateEducation,saveEducation,deleteEducation'),(1011,'EB Exam Define','ඊ.බී විභාග','EB Exam Define_ta',1009,2,'./symfony/web/index.php/admin/listDefineEbexam','01.03.02','MOD001','saveEbExam,deleteEbExam'),(1012,'Skills','කුසලතා','Skills_ta',1009,2,'./symfony/web/index.php/admin/listSkill','01.03.03','MOD001','updateSkill,saveSkill,deleteSkill'),(1013,'Languages','භාෂා','Languages_ta',1009,2,'./symfony/web/index.php/admin/listLanguage','01.03.04','MOD001','saveLanguage,updateLanguage,deleteLanguage'),(1015,'Carder Plan','සේවක සැලැස්ම','Carder Plan _ta',18000,1,'./symfony/web/index.php/admin/carderPlan','18.12','MOD018','listCompanyStructure'),(1016,'Notice ','දැන්වීම්','நோட்டீஸ்',1000,1,'./symfony/web/index.php/admin/listNotice','01.05','MOD001','listNotice,saveNotice,deleteNotice'),(2000,'PIM','පුද්ගල තොරතුරු  කළමනාකරණය','à®ªà®¯à®®à¯',0,0,'#','02.00','MOD002',NULL),(2001,'Employee List','සේවක ලේඛනය','Employee List_ta',2000,1,'./symfony/web/index.php/pim/list','02.01','MOD002','personalDetail,addEmployee,personalDetails,employeeList,Delete,list,deleteEmployee,Jpagination'),(2003,'Personal','පුද්ගලික','Personal_ta',2000,1,'#','02.03','MOD002',NULL),(2004,'Personal Details','පුද්ගලික තොරතුරු','Personal Details_ta',2003,2,'./symfony/web/index.php/pim/personalDetail','02.03.01','MOD002','personalDetails'),(2005,'Contact Details','සබඳතා විස්තර','Contact Details_ta',2003,2,'./symfony/web/index.php/pim/contactDetail','02.03.02','MOD002',NULL),(2006,'Emergency Contact(s)','හදිසි අවස්ථා සබඳතා','Emergency Contact(s)_ta',2003,2,'./symfony/web/index.php/pim/emeregencyContacts','02.03.04','MOD002','deleteEmergencyContacts'),(2007,'Dependents','යැපෙන්නන්','Dependents_ta',2003,2,'./symfony/web/index.php/pim/dependents','02.03.03','MOD002','deleteDependents,updateDependent'),(2008,'Photograph','ඡායාරූපය','Photograph_ta',2003,2,'./symfony/web/index.php/pim/photoGraph','02.03.05','MOD002','UpdatePhoto,deletePhoto'),(2009,'Employment','සේවානියුක්තිය','Employment_ta',2000,1,'#','02.04','MOD002',NULL),(2010,'Job','රැකියාව','Job_ta',2009,2,'./symfony/web/index.php/pim/jobandSal','02.04.01','MOD002','listCompanyStructure,ActingWorkStation'),(2011,'Report-to','රපෝර්තුව','Report-to_ta',2009,2,'./symfony/web/index.php/pim/reportTo','02.04.02','MOD002','searchEmployee,reportTo,updateReportTo,deleteSubordinates,deleteSupervisors'),(2012,'Service Record','සේවා සටහන් ','Service Record_ta',2009,2,'./symfony/web/index.php/pim/serviceRecord','02.04.03','MOD002','serviceRecord,UpdatServiceRec,DeleteServiceRecord,'),(2013,'Qualifications','සුදුසුකම්','Qualifications_ta',2000,1,'#','02.05','MOD002',NULL),(2014,'Work experience','පළපුරුද්ද','Work experience_ta',2013,2,'./symfony/web/index.php/pim/workexperience','02.05.01','MOD002',NULL),(2015,'Education','අධ්‍යාපනය','Education_ta',2013,2,'./symfony/web/index.php/pim/education','02.05.02','MOD002','deleteEducation'),(2016,'Skills','කුසලතා','Skills_ta',2013,2,'./symfony/web/index.php/pim/skills','02.05.03','MOD002','deleteSkill'),(2017,'Languages','භාෂා','Languages_ta',2013,2,'./symfony/web/index.php/pim/SaveLanguages','02.05.04','MOD002','deleteLanguages'),(2018,'License','බලපත්‍රය','License_ta',2013,2,'./symfony/web/index.php/pim/license','02.05.05','MOD002','deleteLicense'),(2019,'EB Exam','ඊ.බී විභාග','EB Exam_ta',2013,2,'./symfony/web/index.php/pim/empEbexam','02.05.06','MOD002','loadEbExamGrid,deleteEmpEbExams'),(2020,'Other','වෙනත්','Other_ta',2000,1,'#','02.06','MOD002',NULL),(2021,'Attachments','ඇමිණුම්','Attachmentsn_ta',2020,2,'./symfony/web/index.php/pim/Attachment','02.06.01','MOD002','UpdateAttachment,viewAttachment,deleteAttachments,Attachment,GetAttachmentDetails,updateAttachment'),(2022,'Disciplinary Action','විනය','ளகளனகள',2020,2,'./symfony/web/index.php/pim/disciplinaryAction','02.06.02','MOD002','saveDisPlinaryaction,deleteDisAction'),(3000,'Welfare & Benefit','අර්ථසාධක ශුභසාධක','welfare & Benefit_ta',0,0,'#','03.00','MOD003',NULL),(3001,'Define Type','ශුභසාධක වර්ග නිර්වචනය','Define Type_ta',3000,1,'./symfony/web/index.php/wbm/BenifitType','03.01','MOD003','UpdateBenifitType,SaveBenifitType,DeleteBeniftType,BenifitType'),(3002,'Define Benefit','ශුභසාධක නිර්වචනය','Define Benefit_ta',3000,1,'./symfony/web/index.php/wbm/Benifit','03.02','MOD003','UpdateBenifit,SaveBenifit,DeleteBenift,Benifit'),(3003,'Benefit Disbursement','ශුභසාධක වියපැහැදම','Benefit Disbursement_ta',3000,1,'./symfony/web/index.php/wbm/Disbusement','03.03','MOD003','UpdateDisbusement,SaveDisbusement,DeleteDisbusement,searchEmployee,Checkbtype,Disbusement'),(4000,'Disciplinary','විනය','Disciplinary_ta',0,0,'#','04.00','MOD004',NULL),(4001,'Disciplinary Type','විනය පිලිබඳ ක්‍රියාමාර්ග ','Define type_ta',4000,1,'./symfony/web/index.php/disciplinary/actiontype','04.01','MOD004','saveActiontype,UpdateActiontype,DeleteActionType'),(4002,'Disciplinary Sub Type','වරද නිර්වචනය ','Define Offence_ta',4000,1,'./symfony/web/index.php/disciplinary/actions','04.02','MOD004','UpdateActions,SaveActions,DeleteActions'),(4003,'Incident Reporting','සිද්ධි වාර්තා කිරීම','Incident Reporting_ta',4000,1,'./symfony/web/index.php/disciplinary/SaveInsident','4.04000','MOD004','SaveInsident,Loadoffence,searchEmployee,LoadGrid'),(4004,'Incident Summary','සිද්ධි සාරාංශය','Incident Summary_ta',4000,1,'./symfony/web/index.php/disciplinary/IncidentSummary','4.05000','MOD004','UpdateInsident,searchEmployee,GetListedEmpids,LoadGrid,Loadoffence,ImagePopup,Deleteimage,empDisHistory,DeleteActionType,DeleteIncident'),(4005,'Pending Inquiry Summary',' විසදීමට තිබෙන විමර්ශන සාරාංශය ','ளனள னக ன',4000,1,'./symfony/web/index.php/disciplinary/PendingInqSummary','4.06000','MOD004','UpdateInsidentlevel2,searchEmployee,GetListedEmpids,LoadGrid,Loadoffence,ImagePopup,Deleteimage,UpdateInsidentlevel2,Deleteimage,DeleteimageInquery,empDisHistory,DeleteActionType'),(4006,'Closed Incident Summary','අවසන් සිද්ධි සාරාංශය','Closed Incident Summary_ta',4000,1,'./symfony/web/index.php/disciplinary/ClosedIncidents','4.07000','MOD004','ClosedIncidents,SummeryDis'),(4007,'Final Action','අවසන් ක්‍රියාව','Final Action_ta',4000,1,'./symfony/web/index.php/disciplinary/FinalAction','4.03000','MOD004','SaveFinalAction,UpdateFinalAction,DeleteFinalAction'),(4008,'Reinstatement','නැවත සේවයේ පිහිටුවීම','Reinstatement_ta',4000,1,'./symfony/web/index.php/disciplinary/Reinstatement','4.08000','MOD004','Reinstatement,UpdateReinstatement,DeleteReinstatement,AjaxCall,DisplayEmpHirache,LoadGradeSlot,SearchEmployee'),(5000,'Training & Development','පුහුණුව හා සංවර්ධනය','Training & Development_ta',0,0,'#','05.00','MOD005',NULL),(5001,'Training Institutes','ආයතන නිර්වචනය','Define Institute_ta',5000,1,'./symfony/web/index.php/training/defineinstitute','05.01','MOD005','Updateinstitute,Saveinstitute,error,Deleteinstitute'),(5002,'Training Courses','පුහුණුව නිර්වචනය','Define Training_ta',5000,1,'./symfony/web/index.php/training/CourseList','05.02','MOD005','UpdateCourse,SaveCourse,DeleteCourse'),(5003,'Assign For Training','පුහුණුව වෙන් කරනවා','Assign For Training_ta',5000,1,'./symfony/web/index.php/training/assigntrain','05.03','MOD005','assigntrain,ajaxloadcourse,checkcourse,trainingHistory,deleteSavedTrain,GetListedEmpids,searchEmployee,LoadGrid'),(5006,'Training Participation Summary','පුහුණුවට සහභාගී සාරාංශය','Training Participation Summary_ta',5000,1,'./symfony/web/index.php/training/participateSummery','05.06','MOD005','trainingHistory,Deletetrainassiged,participations'),(5007,'Training summary','පුහුණු සාරාංශය','Training summary_ta',5000,1,'./symfony/web/index.php/training/trainsummery','05.07','MOD005','trainsummery,trainingHistory,Deletetrainassiged'),(5010,'Training Record','පුහුණු වාර්තාව','Training Record_ta',5000,1,'./symfony/web/index.php/training/SummeryTrainRecord/user/Ess','05.10','MOD005','SummeryTrainRecord,UpdateTrainRecord,NewEmpTrainRecord,ajaxloadcourse,CheckUserthere,DeleteTrainRecord'),(5011,'Training Record FeedBack','පුහුණු ප්‍රතිචාරය','Training Record FeedBack_ta',5000,1,'./symfony/web/index.php/training/SummeryTrainRecordAdmin','05.11','MOD005','UpdateTrainRecord,NewEmpTrainRecord,ajaxloadcourse,CheckUserthere,DeleteTrainRecord'),(5012,'Training Directory','පුහුණු නාමාවලිය','Training Directory_ta',5000,1,'./symfony/web/index.php/training/TraininDirectory','05.12','MOD005','TraininDirectory,SaveTrainRequest,ajaxloadcourse,LoadEmployeeDetails,CheckTrainAssign'),(5013,'Training Plan','පුහුණු සැලැස්ම','னககன பகபக பக',5000,1,'./symfony/web/index.php/training/TrainingPlanList','05.13','MOD005','TraininPlan,DeleteTrainingPlan,DeleteTrainingPlan'),(5014,'My Training History','මාගෙ පුහුණු විස්තර','ளன  ளன  ளன ',5000,1,'./symfony/web/index.php/training/trainingHistory','05.14','MOD005',NULL),(5015,'Training Calander ','පුහුණු දින දර්ශනය','Training Calander_ta',5000,1,'./symfony/web/index.php/training/Calander','05.15','MOD005','Calander'),(6000,'Promotion','උසස් වීම','Promotion_ta',0,0,'#','06.00','MOD006',NULL),(6001,'Promotion Method','උසස් වීම් වර්ග','Promotion Method_ta',6000,1,'./symfony/web/index.php/promotion/promotionMethod','06.01','MOD006','updatePromotionMethod,savePromotionMethod,DeletePromotionMethod'),(6002,'Promotion','උසස් වීම','Promotion_ta',6000,1,'./symfony/web/index.php/promotion/listPromotion','06.02','MOD006','listPromotion,ListPromotion,savePromotion,updatePromotion,DeletePromotion,searchEmployee,AjaxCall,deletepop,DateValidation,empDisHistory'),(6003,'Probationers Check List','පිරික්සුම් ලැයිස්තුව','Promotion Check List_ta',6000,1,'./symfony/web/index.php/promotion/promotioncklist','06.03','MOD006','promotioncklist,updatePromotioncklist,savePromotioncklist,DeletePromotioncklist'),(6004,'Probationers','පරිවාසික','Probationers_ta',6000,1,'./symfony/web/index.php/promotion/probationlist','06.04','MOD006','probationlist,checklist'),(6005,'Other Institutions','වෙනත් ආයතන','Other Institutions_ta',6000,1,'./symfony/web/index.php/promotion/OtherInstitution','06.05','MOD006','OtherInstitution,UpdateOtherInstitution,DeleteOtherInstitution'),(6006,'Promotion History','උසස් වීම ඉතිහාසය','Promotion History_ta',6000,1,'./symfony/web/index.php/promotion/HistoryPromotion','06.06','MOD006','HistoryPromotion,searchEmployee,EBExam'),(7000,'Retirement','විශ්‍රාම','Retirement_ta',0,0,'#','07.00','MOD007',NULL),(7001,'Service Extension','සේවා දිගුව','Service Extension_ta',7000,1,'./symfony/web/index.php/retirement/retirement','07.01','MOD007','retirement,retirementserviceextension,searchEmployee,AjaxCall,DeleteRetirement,AjaxCalllast,deleteRet'),(8000,'Attendance','පැමිණීම','Attendance_ta',0,0,'#','08.00','MOD008',NULL),(8001,'Define Day Types','දින වර්ග','Define Day Types_ta',8000,1,'./symfony/web/index.php/attendance/AttendanceDay','08.01','MOD008','AttendanceDay'),(8002,'Download Configuration ','භාගත කිරීම හැඩගසනවා','Download Configuration_ta',8000,1,'./symfony/web/index.php/attendance/DownloadConfiguration','08.02','MOD008',NULL),(8003,'Data Upload ','දත්ත උඩුගත කිරීම','Data Upload_ta',8000,1,'./symfony/web/index.php/attendance/Text','08.03','MOD008','process,dataProcess'),(8004,'Employee Attendance Summary','සේවක පැමිණීම් සාරාංශය','Employee Attendance Summary_ta',8000,1,'./symfony/web/index.php/attendance/Process','08.04','MOD008','Process,ajaxTableLock,Savedata,searchEmployee'),(9000,'Knowledge Base','දැනුම් පද්ධතිය','Knowledge Base_ta',0,0,'#','09.00','MOD009',NULL),(9001,'Define Document Type/Group',' ලේඛන නිර්වචනය ','Define Document Type/Group_ta',9000,1,'./symfony/web/index.php/knw/DocumentType','09.01','MOD009','SaveDocumentType,UpdateDocumentType,DocumentType,DeleteDocumentType'),(9002,'Attach Document','අමුණන ලේඛන','Attach Document_ta',9000,1,'./symfony/web/index.php/knw/Attachment','09.02','MOD009','SaveAttachment,Attachment,UpdateAttachment,imagepop,readArticle,DeleteAttachment,deletepop'),(9003,'Use Knowledge Base','දැනුම් පාවිච්චිය','Use Knowledge Base_ta',9000,1,'./symfony/web/index.php/knw/Knowledgebase','09.03','MOD009','Knowledgebase,imagepop,readArticle'),(9004,'Knowledge Share','දැනුම් බෙදාගැනීම','Knowledge Share_ta',9000,1,'./symfony/web/index.php/knw/SaveArticle','09.04','MOD009','SaveArticle'),(10000,'Transfer','මාරුවීම','Transfer_ta',0,0,'#','10.00','MOD010',NULL),(10001,'Transfer Reason','මාරුවීම වර්ග','Trans Reason_ta',10000,1,'./symfony/web/index.php/transfer/TransferReason','10.01','MOD010','SaveTransferReason,DeleteTransferReason'),(10002,'Transfer Request Admin','මාරුවීම ඉල්ලීම පරිපාලන','Transfer Request Admin_ta',10000,1,'./symfony/web/index.php/transfer/TransferRequestAdmin','10.02','MOD010','TransferRequestAdmin,SaveTransferRequestAdmin,listCompanyStructure,searchEmployee'),(10003,'Transfers Details','නව මාරුවීම','New Transfer_ta',10000,1,'./symfony/web/index.php/transfer/TransferDetail','10.03','MOD010','TransferDetail,SaveTransferDetail,AjaxCall,DateValidation,imagepop,searchEmployee,listCompanyStructure,DeleteTransfer,RecordCheck,Imagepop,DeleteImage'),(10004,'Transfer Request','මාරුවීම් ඉල්ලීම','Transfer Request_ta',10000,1,'./symfony/web/index.php/transfer/TransferRequest','10.02','MOD010','TransferRequest,SaveTransferRequest,listCompanyStructure,searchEmployee'),(12000,'Leave','නිවාඩු','Leave_ta',0,0,'#','12.00','MOD012',NULL),(12001,'Deifne Leave Type','නිවාඩු නිර්වචනය','Deifne Leave Type_ta',12000,1,'./symfony/web/index.php/Leave/DocumentType','12.01','MOD012','UpdateDocumentType,SaveDocumentType,DeleteDocumentType'),(12002,'Define Holiday','උත්සව දින නිර්වචනය','Define HolyDay Ta',12000,1,'./symfony/web/index.php/Leave/Holyday','12.02','MOD012','Holyday,UpdateHolyday,SaveHolyday,DeleteHolyday'),(12003,'Leave Configuration','නිවාඩු රූපණය','Leave Configuration_ta',12000,1,'./symfony/web/index.php/Leave/LeaveConfiguration','12.03','MOD012','LeaveConfiguration,DTConfig'),(12004,'Leave Entitlement','නිවාඩු හිමිකම','Leave Entitlement_ta',12000,1,'./symfony/web/index.php/Leave/Entitlement','12.04','MOD012','UpdateEntitlement,SaveEntitlement,searchEmployee,AjaxDaysload,AjaxEmpType,LoadGrid,DeleteEntitlement'),(12005,'Apply Leave','නිවාඩු ඉල්ලුම් කිරීම','Apply Leave_ta',12000,1,'./symfony/web/index.php/Leave/SaveLeave','12.05','MOD012','AjaxLeaveValidation,AjaxLeaveHolydayValidation,SaveLeave,Leave,searchEmployee,UpdateLeave'),(12006,'Leave Summary','නිවාඩු සාරාංශය','Leave Summary_ta',12000,1,'./symfony/web/index.php/Leave/LeaveSearch','12.06','MOD012','searchEmployee'),(12007,'Team Leave Application','කණ්ඩායම් නිවාඩු ඉල්ලුම් කිරීම','Apply Leave User_ta',12000,1,'./symfony/web/index.php/Leave/SaveLeaveuser','12.07','MOD012','Dates,FormatDates,AjaxDaysload,EmpData,DefaultLeavedetails,AjaxEmpType,AjaxLeaveValidation,AjaxLeaveHolydayValidation,AjaxLeavecoveringEmployee,SaveLeaveuser,UpdateLeave,LeaveSearch,SaveLeaveApprove,searchEmployee,Leave'),(13000,'Security','ආරක්ෂක පද්ධතිය','Security_ta',0,0,'#','13.00','MOD013',NULL),(13001,'Users','පාවිච්චිය','Users_ta',13000,1,'./symfony/web/index.php/admin/listUser/isAdmin/Yes','13.01','MOD013','saveUser,updateUser,listUser,deleteUser'),(13002,'Capability','ශක්‍යතාව','Capability_ta',13000,1,'./symfony/web/index.php/security/capability','13.02','MOD013','saveCapability,DeleteCapabilities'),(13003,'Menu Capability','මෙනු ශක්‍යතාව','Menu Capability_ta',13000,1,'./symfony/web/index.php/security/menucapability','13.03','MOD013','menucapability,checkOrderSet,LoadMenus'),(13004,'Employee Capability','සේවක ශක්‍යතාව','Employee Capability_ta',13000,1,'./symfony/web/index.php/security/employeecapability','13.04','MOD013','employeecapability,searchEmployee,GetListedEmpids,deleteSavedTrain,employeecapability,LoadGrid,ajaxloadcourse,GetListedEmpids,deleteAssignedCapability'),(13005,'Unlock Records','අගුළු ඉවත්කරනවා','Unlock Records_ta',13000,1,'./symfony/web/index.php/security/unlockRecords','13.05','MOD013','unlockRecords,capability,deleteLocks'),(13006,'Report Capability','වාර්තා ශක්‍යතාව','Report Capability_TA',13000,1,'./symfony/web/index.php/security/reportCapability','13.06','MOD013',NULL),(13007,'Payroll process capability ','පඩිපත සැකසීමේ ශක්‍යතාව','Payroll process capability ',13000,1,'./symfony/web/index.php/security/PayprocessCapability','13.07','MOD013',NULL),(14000,'ESS','සේවක ස්වයං සේවාව','à®Žà®¸à¯',0,0,'./symfony/web/index.php/ESS/index','14.00','MOD014',NULL),(15000,'Reports','වාර්තා','Reports_TA',0,0,'#','15.00','MOD015',NULL),(15001,'View Reports','වාර්තා බැලීම','View Reports_TA',15000,1,'./symfony/web/index.php/report/viewReportList','15.01','MOD015','viewReportData'),(15002,'Level','තරාතිරම','Level_ta',1004,2,'./symfony/web/index.php/admin/Level','01.02.05','MOD001','SaveLevel,DeleteLevel,UpdateLevel'),(15003,'Job Role','කාර්යභාරය','Job Role_ta',1004,2,'./symfony/web/index.php/admin/JobRole','01.02.06','MOD001','SaveJobRole,DeleteJobRole'),(16000,'Performance ','කාර්ය සාධනය ','Performance_TA ',0,0,'#','16.00','MOD016',NULL),(16001,'Duty Group ','වාර්තා බැලීම ','Duty Group_TA ',16000,1,'./symfony/web/index.php/performance/DutyGroup','16.01','MOD016','SaveDutyGroup,DeleteDutyGroup,UpdateDutyGroup'),(16002,'Duty ','රාජකාරිය','Duty Group_TA ',16000,1,'./symfony/web/index.php/performance/Duty','16.02','MOD016','SaveDuty,DeleteDuty,UpdateDuty'),(16003,'Rating Method ','වටිනාකම මැන බැලීම ','Rating Method TA ',16000,1,'./symfony/web/index.php/performance/Rate','16.02','MOD016','SaveRate,DeleteRate,UpdateRate'),(16004,'Company Evaluation ','සමාගම් ඇගයීම්','Company Evaluation TA ',16000,1,'./symfony/web/index.php/performance/CompanyEvaluationInfo','16.04','MOD016','SaveCompanyEvaluationInfo,DeleteCompanyEvaluationInfo,UpdateCompanyEvaluationInfo'),(16005,'Evaluation ','ඇගයීම්','Evaluation TA ',16000,1,'./symfony/web/index.php/performance/Evaluation','16.05','MOD016','SaveEvaluation,DeleteEvaluation,UpdateEvaluation'),(16006,'Assign Employee ','සේවකයන් එක් කිරීම','Assign Employee TA ',16000,1,'./symfony/web/index.php/performance/SaveAssingEmployee','16.06','MOD016','SaveAssingEmployee,DeleteAssingEmployee,UpdateAssingEmployee,searchEmployee,LoadGrid'),(16007,'Assign Supervisor  ','අදීක්ෂක එක් කිරීම','Assign Supervisor TA ',16000,1,'./symfony/web/index.php/performance/SaveSupervisor','16.07','MOD016','SaveSupervisor,DeleteSupervisor,UpdateSupervisor,searchEmployee'),(16008,'Evaluate ','ඇගයුම','Evaluation TA ',16000,1,'./symfony/web/index.php/performance/SDOEvaluation','16.08','MOD016','SaveSDOEvaluation,DeleteSDOEvaluation,UpdateSDOEvaluation'),(17000,'Work Flow','අනුමත කිරීම්','Work Flow',0,0,'#','17.00000','MOD017',NULL),(17001,'Approval Groups','අනුමත කිරීමේ කණ්ඩායම්','Approval Groups_ta',17000,1,'./symfony/web/index.php/workflow/approvalGroupsSummary','17.01000','MOD017','SaveAppGroup,DeleteGrpApp'),(17002,'Approval Summary','අනුමත කිරීමේ සාරාංශය.','Approval Summary',17000,1,'./symfony/web/index.php/workflow/ApprovalSummary','17.02000','MOD017',NULL),(17003,'Assign For Group','කණ්ඩායම් සදහා අනුයුක්ත කිරීම්','Assign For Group',17000,1,'./symfony/web/index.php/workflow/AssignToGroup','17.03000','MOD017',NULL),(18000,'Recruitment ','අලුතෙන් බඳවා ගැනීම් ','Recruitment_TA ',0,0,'#','16.00','MOD018',NULL),(18001,'Vacancy Request ','පුරප්පාඩු ඉල්ලුම් කිරීමේ සාරාංශය ','Request Summary - HR_TA ',18000,1,'./symfony/web/index.php/recruitment/VacancyRequestWork','18.01','MOD018','SaveVacancyRequest,DeleteVacancyRequest,UpdateVacancyRequest,UpdateVacancyRequestStatus'),(18002,'Vacancy Request Summary - HR ','පුරප්පාඩු ඉල්ලුම් කිරීමේ සාරාංශය - මානව සම්පත් ','Request Summary - HR_TA ',18000,1,'./symfony/web/index.php/recruitment/HRVacancyRequest','18.02','MOD018','UpdateHRVacancyRequest,ajaxTableLockCandidate,UpdateHRInterviewRequest,SubmitHRVacancyRequest,ajaxTableLock'),(18003,'Vacancy Request Summary - DG ','පුරප්පාඩු ඉල්ලුම් කිරීමේ සාරාංශය - අධ්‍යක්ෂ ජනරාල් ','Request Summary - DG_TA ',18000,1,'./symfony/web/index.php/recruitment/DGVacancyRequest','18.03','MOD018','SubmitDGVacancyRequest,ajaxTableLockCandidate,UpdateDGVacancyRequest'),(18004,'Overall Vacancy Request Summary ','පුරප්පාඩු ඉල්ලුම් කිරීමේ සමස්ත සාරාංශය ','Overall Request Summary_TA ',18000,1,'./symfony/web/index.php/recruitment/OverallVacancyRequest','18.04','MOD018','UpdateOverallVacancyRequest,OverallVacancyRequest,SubmitOverallVacancyRequest'),(18005,'Vacancy Requisition ','පුරප්පාඩු නිර්වචන සාරාංශය ','Define Vacancy Requisition_TA ',18000,1,'./symfony/web/index.php/recruitment/VacancyRequisition','18.05','MOD018','SaveVacancyRequisition,DeleteVacancyRequisition'),(18006,'Advertisement ','දැන්වීම නිර්වචනය ','Define Advertisement_TA ',18000,1,'./symfony/web/index.php/recruitment/Advertisement','18.06','MOD018','SaveAdvertisement,DeleteAdvertisement'),(18007,'Finalized Vacancy Summary ','අවසන්වූ දැන්වීම සාරාංශය ','Finalized Vacancy Summary_TA ',18000,1,'./symfony/web/index.php/recruitment/FinalizedVacancy','18.07','MOD018','Candidate,SaveCandidate,DeleteCandidate'),(18008,'Candidate Interview  ','සම්මුඛ පරීක්ෂණ සාරාංශය ','Define Candidate Interview_TA ',18000,1,'./symfony/web/index.php/recruitment/CandidateInterview','18.08','MOD018','SaveCandidateInterview,DeleteCandidateInterview,UpdateCandidateInterview'),(18009,'Interview Summary – HR ','සම්මුඛ පරීක්ෂණ සාරාංශය - මානව සම්පත් ','Interview Summary – HR_TA ',18000,1,'./symfony/web/index.php/recruitment/HRCandidateInterview','18.09','MOD018','SaveCandidateInterview,DeleteCandidate,UpdateCandidateInterview'),(18010,'Selected Candidate Summary – Approved by DG  ','සම්මුඛ පරීක්ෂණ සාරාංශය - අධ්‍යක්ෂ ජනරාල් ','Selected Candidate Summary – Approved by DG  ',18000,1,'./symfony/web/index.php/recruitment/DGCandidateInterview','18.10','MOD018','SaveCandidateInterview,DeleteCandidate,UpdateCandidateInterview,ajaxTableLockCandidate,UpdateDGCandidateRequest,UpdateDGInterviewRequest'),(18011,'Selected Candidate Summary ','තෝරාගත් ඉල්ලුම්කාරුවන් සාරාංශය ','Selected Candi date Summary_TA  ',18000,1,'./symfony/web/index.php/recruitment/CandidatePIMRegistation','18.11','MOD018','CandidatePIMRegistation'),(19000,'Payroll','පඩිපත','Payroll_ta',0,0,'#','19.00','MOD019',NULL),(19001,'Employee Payroll Information','සේවක පඩිපත් තොරතුරු','Employee Payroll Information_ta',19000,1,'./symfony/web/index.php/payroll/EmployeePayrollInformation','19.01','MOD019','UpdateEmployeePayrollInformation,EmployeePayrollInformation,DeletePayrollInformation'),(19002,'Administration','පරිපාලන','Administration_ta',19000,1,'#','19.02','MOD019',''),(19003,'Transaction Type Information','ගනුදෙනු වර්ග','Transaction Type Information',19002,2,'./symfony/web/index.php/payroll/TransActiontypeSummary','19.02.01','MOD019','DeleteTransactionType,TransActionTypeInfo'),(19004,'Transaction Detail Information','ගනුදෙනු විස්තර','Transaction Detail Information',19002,2,'./symfony/web/index.php/payroll/TransActionDetailSummary','19.02.02','MOD019','TransActDetails,DeleteTransactionDetails'),(19005,'Configuration','රූපණය','Configuration',19000,1,'./symfony/web/index.php/payroll/Configuration','19.03','MOD019',''),(19006,'Employee transaction details','සේවකය අනුව ගනුදෙනු විස්තරය','Employee transaction details',19000,1,'./symfony/web/index.php/payroll/SalarayIncrement','19.04','MOD019',''),(19007,'Employee Transaction Details By Transaction','සේවකය අනුව ගනුදෙනු විස්තරය','Employee Transaction Details By Transaction',19000,1,'./symfony/web/index.php/payroll/AssignEmployees','19.05','MOD019',''),(19008,'Employee Salary Increment','සේවක පඩි වැඩිවීම','Employee Salary Increment',19000,1,'#','19.06','MOD019',''),(19009,'Salary Increment Process','සේවක පඩි වැඩිවීම සැකසුම','Salary Increment Process',19008,2,'./symfony/web/index.php/payroll/SalarayIncrement','19.06.01','MOD019','UpdateSalarayIncrement,DeleteSalarayIncrement,SalaryCancelTrue'),(19010,'Salary Increment Cancel Summary','සේවක පඩි වැඩිවීම අවලංගු කිරීම','Salary Increment Cancel Summary',19008,2,'./symfony/web/index.php/payroll/SalarayIncrementCancel','19.06.02','MOD019','UpdateSalarayIncrement,DeleteSalarayIncrement'),(19011,'Payroll process','පඩිපත සැකසුම','Payroll process',19000,1,'#','19.07','MOD019',NULL),(19012,'Payroll process','පඩිපත සැකසුම','Payroll process',19011,2,'./symfony/web/index.php/payroll/StartProcess1','19.07.01','MOD019','ViewProcessedEmp,ViewPaySlip'),(19013,'Bank Details','බැංකු විස්තර','Bank Details',19000,1,'#','19.08','MOD019',NULL),(19014,'Bank','බැංකු විස්තර','Bank',19013,2,'./symfony/web/index.php/payroll/BankDetails','19.08.01','MOD019','UpdateBankDetails,DeleteBankDetails,BankDetails'),(19015,'Branch','බැංකු ශාඛා','Branch',19013,2,'./symfony/web/index.php/payroll/BranchDetails','19.08.02','MOD019','UpdateBranchDetails,DeleteBranchDetails,BranchDetails'),(19016,'Employee Vote Information','සේවක ඡන්ද තොරතුරු','Employee Vote Information',19002,2,'./symfony/web/index.php/payroll/VoteDetails','19.02.03','MOD019','UpdateVoteDetails,DeleteVoteDetails,VoteDetails,DeleteEmployeeBankDetails'),(19017,'Employee Bank Details','සේවක බැංකු විස්තර','Employee Bank Details_ta',19013,2,'./symfony/web/index.php/payroll/EmployeeBankDetails','19.08.03','MOD019','EmployeeBankDetails,AjaxEmployeeBankDetails,UpdateBankDiskette'),(19018,'Bank Diskette','බැංකු තැටිය','Bank Diskette_ta',19013,2,'./symfony/web/index.php/payroll/BankDiskette','19.08.04','MOD019','EmployeeBankDetails,AjaxEmployeeBankDetails,UpdateBankDiskette,DeleteBankDiskette'),(19019,'Bank Diskette Process','බැංකු තැටිය සැකසීම','Bank Diskette Process_ta',19013,2,'./symfony/web/index.php/payroll/BankDisketteProcess','19.08.05','MOD019','BankDisketteProcess,AjaxBankDisketteProcess,UpdateBankDisketteProcess,BankDisketteCreation,DeleteBankDisketteProcess'),(20000,'Loan','ණය','Loan_ta',0,0,'#','20.00','MOD020',NULL),(20001,'Loan Type','ණය වර්ග නිර්චණය','Loan Type_ta',20000,1,'./symfony/web/index.php/loan/LoanType','20.01','MOD020','LoanType,SaveLoanType,DeleteLoanType'),(20002,'Application','ඉල්ලුම් පත්‍රය','Application_ta',20000,1,'./symfony/web/index.php/loan/AppliedLoan','20.02','MOD020','AppliedLoan,SaveApplication,DeleteApplication,AjaxDeleteEmployeeGaranter'),(20003,'Loan Settlement','ණය පියවීම','Loan Settlement_ta',20000,1,'./symfony/web/index.php/loan/LoanSettlement','20.04','MOD020','SaveLoanSettlement,LoanSettlement'),(20004,'Loan History and Status','ණය ඉතිහාසය සහ තත්වය','Loan History and Status_ta',20000,1,'./symfony/web/index.php/loan/LoanHistoryandStatus','20.05','MOD020','LoanHistoryandStatus');
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
INSERT INTO `hs_hr_title` VALUES (1,'Mr','මහතා','mr_ta'),(2,'Miss','මෙනවිය','mrs_tgfa'),(3,'Mrs','මහත්මිය','mr_fta'),(4,'Ms','මෙනවිය','mrs_tda'),(5,'Most Venerable','පූජ්‍ය','mrg_ta'),(6,'Venerable','අතිගරු','mrs_dta'),(7,'Revered Priest','පූජකයා','mvr_ta'),(8,'Revered Swamy','ආචාර්යවරයා','mbr_ta'),(9,'Rev','ගෞරවාර්හ','mrs_tna'),(10,'Most Rev.Rev','අති ගෞරවාර්හ','mrs_tna'),(11,'Other','වෙනත්','mr_ta');
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
INSERT INTO `hs_hr_trans_reason` VALUES (1,'Internal','අභ්‍යන්තර','சசசதாாசசசசசச'),(2,'Inter Institutional','අභ්‍යන්තර සංස්ථායික','ளளளதளளளளறறறறறறறறறறறறறறறறறறளளள'),(3,'Disciplinary Actions','විනය කටයුත්ත','றறறதமமறறறறறறறறறறறறறறறறறறறற'),(4,'Need of Service','සේවා වුවමනා','றறறறதமதாறறறறறறறறறறறறறறறறறறறறறறறறறறறறறறறறற'),(5,'Promotion','උසස්කිරීම','றறறறறறறமதாறறறறறறறறறறறறறறறறற'),(6,'Others','වෙනත්','றறறறறறதறறறறறறறறறறற');
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
