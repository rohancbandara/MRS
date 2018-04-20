-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema sliate_project
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ sliate_project;
USE sliate_project;

--
-- Table structure for table `sliate_project`.`file_upload`
--

DROP TABLE IF EXISTS `file_upload`;
CREATE TABLE `file_upload` (
  `rollno` decimal(10,0) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `email_id` varchar(40) NOT NULL,
  `mobileno` varchar(40) NOT NULL,
  `filepath` varchar(100) NOT NULL,
  PRIMARY KEY  (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliate_project`.`file_upload`
--

/*!40000 ALTER TABLE `file_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_upload` ENABLE KEYS */;


--
-- Table structure for table `sliate_project`.`tbl_account_type`
--

DROP TABLE IF EXISTS `tbl_account_type`;
CREATE TABLE `tbl_account_type` (
  `type_id` int(10) NOT NULL default '0',
  `type_name` varchar(45) default NULL,
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliate_project`.`tbl_account_type`
--

/*!40000 ALTER TABLE `tbl_account_type` DISABLE KEYS */;
INSERT INTO `tbl_account_type` (`type_id`,`type_name`) VALUES 
 (1,'admin'),
 (2,'docter'),
 (3,'patient'),
 (4,'reception');
/*!40000 ALTER TABLE `tbl_account_type` ENABLE KEYS */;


--
-- Table structure for table `sliate_project`.`tbl_appoinment`
--

DROP TABLE IF EXISTS `tbl_appoinment`;
CREATE TABLE `tbl_appoinment` (
  `id` int(11) NOT NULL auto_increment,
  `tbl_id` varchar(15) default NULL,
  `intervels` varchar(15) default NULL,
  `patient` int(20) default NULL,
  `dsp` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sliate_project`.`tbl_appoinment`
--

/*!40000 ALTER TABLE `tbl_appoinment` DISABLE KEYS */;
INSERT INTO `tbl_appoinment` (`id`,`tbl_id`,`intervels`,`patient`,`dsp`) VALUES 
 (325,'2018-04-1881','08:00',11,'null'),
 (326,'2018-04-1881','08:10',1,'null'),
 (327,'2018-04-1881','08:20',1,'null'),
 (328,'2018-04-1881','08:30',1,'null'),
 (329,'2018-04-1881','08:40',1,'null'),
 (330,'2018-04-1881','08:50',1,'null'),
 (331,'2018-04-1881','09:00',1,'null'),
 (332,'2018-04-1881','09:10',1,'null'),
 (333,'2018-04-1881','09:20',1,'null'),
 (334,'2018-04-1881','09:30',1,'null'),
 (335,'2018-04-1881','09:40',1,'null'),
 (336,'2018-04-1881','09:50',1,'null'),
 (337,'2018-04-1881','10:00',1,'null'),
 (338,'2018-04-1881','10:10',1,'null'),
 (339,'2018-04-1881','10:20',1,'null'),
 (340,'2018-04-1881','10:30',1,'null'),
 (341,'2018-04-1881','10:40',1,'null'),
 (342,'2018-04-1881','10:50',1,'null'),
 (343,'2018-04-1881','11:00',1,'null'),
 (344,'2018-04-1881','11:10',1,'null'),
 (345,'2018-04-1881','11:20',1,'null'),
 (346,'2018-04-1881','11:30',1,'null'),
 (347,'2018-04-1881','11:40',1,'null'),
 (348,'2018-04-1881','11:50',1,'null');
INSERT INTO `tbl_appoinment` (`id`,`tbl_id`,`intervels`,`patient`,`dsp`) VALUES 
 (349,'2018-04-1881','12:00',1,'null'),
 (350,'2018-04-2781','00:00',1,'null'),
 (351,'2018-04-2781','00:10',1,'null'),
 (352,'2018-04-2781','00:20',1,'null'),
 (353,'2018-04-2781','00:30',1,'null'),
 (354,'2018-04-2781','00:40',1,'null'),
 (355,'2018-04-2781','00:50',1,'null'),
 (356,'2018-04-2781','01:00',1,'null'),
 (357,'2018-04-2781','01:10',1,'null'),
 (358,'2018-04-2781','01:20',1,'null'),
 (359,'2018-04-2781','01:30',1,'null'),
 (360,'2018-04-2781','01:40',1,'null'),
 (361,'2018-04-2781','01:50',1,'null'),
 (362,'2018-04-2781','02:00',1,'null'),
 (363,'2018-04-0885','18:00',18,'null'),
 (364,'2018-04-0885','18:10',20,'null'),
 (365,'2018-04-0885','18:20',18,'hhhhhhhhhhhhhhhhhhh\r\nasdjnjansjcasv\r\nascvjonajsv'),
 (366,'2018-04-0885','18:30',1,'null'),
 (367,'2018-04-0885','18:40',1,'null'),
 (368,'2018-04-0885','18:50',1,'null'),
 (369,'2018-04-0885','19:00',1,'null'),
 (370,'2018-04-0885','19:10',1,'null'),
 (371,'2018-04-0885','19:20',1,'null');
INSERT INTO `tbl_appoinment` (`id`,`tbl_id`,`intervels`,`patient`,`dsp`) VALUES 
 (372,'2018-04-0885','19:30',1,'null'),
 (373,'2018-04-0885','19:40',1,'null'),
 (374,'2018-04-0885','19:50',1,'null'),
 (375,'2018-04-0885','20:00',20,'leada'),
 (376,'2018-04-0885','20:10',1,'null'),
 (377,'2018-04-0885','20:20',1,'null'),
 (378,'2018-04-0885','20:30',1,'null'),
 (379,'2018-04-0885','20:40',1,'null'),
 (380,'2018-04-0885','20:50',1,'null'),
 (381,'2018-04-0885','21:00',1,'null'),
 (382,'2018-04-0885','21:10',1,'null'),
 (383,'2018-04-0885','21:20',1,'null'),
 (384,'2018-04-0885','21:30',1,'null'),
 (385,'2018-04-0885','21:40',1,'null'),
 (386,'2018-04-0885','21:50',1,'null'),
 (387,'2018-04-0885','22:00',1,'null'),
 (388,'2018-04-1086','19:00',19,'null'),
 (389,'2018-04-1086','19:10',19,'null'),
 (390,'2018-04-1086','19:20',1,'null'),
 (391,'2018-04-1086','19:30',1,'null'),
 (392,'2018-04-1086','19:40',1,'null'),
 (393,'2018-04-1086','19:50',1,'null'),
 (394,'2018-04-1086','20:00',1,'null'),
 (395,'2018-04-2785','06:00',18,'null');
INSERT INTO `tbl_appoinment` (`id`,`tbl_id`,`intervels`,`patient`,`dsp`) VALUES 
 (396,'2018-04-2785','06:10',1,'null'),
 (397,'2018-04-2785','06:20',1,'null'),
 (398,'2018-04-2785','06:30',1,'null'),
 (399,'2018-04-2785','06:40',1,'null'),
 (400,'2018-04-2785','06:50',1,'null'),
 (401,'2018-04-2785','07:00',1,'null'),
 (402,'2018-04-2785','07:10',1,'null'),
 (403,'2018-04-2785','07:20',1,'null'),
 (404,'2018-04-2785','07:30',1,'null'),
 (405,'2018-04-2785','07:40',1,'null'),
 (406,'2018-04-2785','07:50',1,'null'),
 (407,'2018-04-2785','08:00',1,'null'),
 (408,'2018-04-2686','07:00',1,'null'),
 (409,'2018-04-2686','07:15',1,'null'),
 (410,'2018-04-2686','07:30',1,'null'),
 (411,'2018-04-2686','07:45',18,'null'),
 (412,'2018-04-2686','08:00',19,'null'),
 (413,'2018-04-2686','08:15',20,'null'),
 (414,'2018-04-2686','08:30',1,'null'),
 (415,'2018-04-2686','08:45',1,'null'),
 (416,'2018-04-2686','09:00',1,'null'),
 (417,'2018-04-3085','00:00',1,'null'),
 (418,'2018-04-3085','00:10',1,'null'),
 (419,'2018-04-3085','00:20',1,'null');
INSERT INTO `tbl_appoinment` (`id`,`tbl_id`,`intervels`,`patient`,`dsp`) VALUES 
 (420,'2018-04-3085','00:30',1,'null'),
 (421,'2018-04-3085','00:40',1,'null'),
 (422,'2018-04-3085','00:50',1,'null'),
 (423,'2018-04-3085','01:00',1,'null'),
 (424,'2018-04-3085','01:10',1,'null'),
 (425,'2018-04-3085','01:20',1,'null'),
 (426,'2018-04-3085','01:30',1,'null'),
 (427,'2018-04-3085','01:40',1,'null'),
 (428,'2018-04-3085','01:50',1,'null'),
 (429,'2018-04-3085','02:00',1,'null'),
 (430,'2018-04-2687','18:00',19,'null'),
 (431,'2018-04-2687','18:10',1,'null'),
 (432,'2018-04-2687','18:20',1,'null'),
 (433,'2018-04-2687','18:30',1,'null'),
 (434,'2018-04-2687','18:40',1,'null'),
 (435,'2018-04-2687','18:50',1,'null'),
 (436,'2018-04-2687','19:00',1,'null'),
 (437,'2018-04-2687','19:10',1,'null'),
 (438,'2018-04-2687','19:20',1,'null'),
 (439,'2018-04-2687','19:30',1,'null'),
 (440,'2018-04-2687','19:40',1,'null'),
 (441,'2018-04-2687','19:50',1,'null'),
 (442,'2018-04-2687','20:00',1,'null');
/*!40000 ALTER TABLE `tbl_appoinment` ENABLE KEYS */;


--
-- Table structure for table `sliate_project`.`tbl_docters`
--

DROP TABLE IF EXISTS `tbl_docters`;
CREATE TABLE `tbl_docters` (
  `d_id` int(11) NOT NULL auto_increment,
  `d_fname` varchar(15) default NULL,
  `d_lname` varchar(15) default NULL,
  `d_dob` varchar(20) default NULL,
  `d_email` varchar(45) default NULL,
  `d_special` int(10) default NULL,
  `is_delete` int(25) default NULL,
  `create_date` varchar(45) default NULL,
  `edit_date` varchar(45) default NULL,
  `img_path` varchar(100) default NULL,
  `d_tel` varchar(15) default NULL,
  `type_id` int(11) default NULL,
  PRIMARY KEY  (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sliate_project`.`tbl_docters`
--

/*!40000 ALTER TABLE `tbl_docters` DISABLE KEYS */;
INSERT INTO `tbl_docters` (`d_id`,`d_fname`,`d_lname`,`d_dob`,`d_email`,`d_special`,`is_delete`,`create_date`,`edit_date`,`img_path`,`d_tel`,`type_id`) VALUES 
 (85,'Manoj','Sandaruwan','null','rohancbandara@gmail.com',1,1,NULL,NULL,'static/IMG/rcb_d1.jpg',NULL,2),
 (86,'Thusahn','Vmukthi','2018-04-11','rohancbandara@gmail.com',2,1,NULL,NULL,'static/IMG/rcb_d2.jpg','54551212',2),
 (87,'pushpa','amarasena','null','rohancbandara@gmail.com',3,1,NULL,NULL,'static/IMG/rcb_d3.jpg',NULL,2);
/*!40000 ALTER TABLE `tbl_docters` ENABLE KEYS */;


--
-- Table structure for table `sliate_project`.`tbl_patient`
--

DROP TABLE IF EXISTS `tbl_patient`;
CREATE TABLE `tbl_patient` (
  `p_id` int(11) NOT NULL auto_increment,
  `p_fname` varchar(15) default NULL,
  `p_lname` varchar(15) default NULL,
  `p_nic` varchar(20) default NULL,
  `p_email` varchar(45) default NULL,
  `p_gender` varchar(45) default NULL,
  `p_dob` varchar(25) default NULL,
  `p_blood_group` varchar(45) default NULL,
  `p_marital` varchar(45) default NULL,
  `p_haddress` varchar(45) default NULL,
  `p_tel` varchar(45) default NULL,
  `p_status` varchar(45) default NULL,
  `is_delete` int(45) default NULL,
  `create_date` varchar(45) default NULL,
  `img_path` varchar(150) default NULL,
  `type_id` int(11) default NULL,
  PRIMARY KEY  (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliate_project`.`tbl_patient`
--

/*!40000 ALTER TABLE `tbl_patient` DISABLE KEYS */;
INSERT INTO `tbl_patient` (`p_id`,`p_fname`,`p_lname`,`p_nic`,`p_email`,`p_gender`,`p_dob`,`p_blood_group`,`p_marital`,`p_haddress`,`p_tel`,`p_status`,`is_delete`,`create_date`,`img_path`,`type_id`) VALUES 
 (1,'Add','Patient',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (18,'Amesh','Senanayake','930930568v','rohancbandara@gmail.com','Male','1981-03-08','O Negative','Married','kandy','0717304113','null',NULL,NULL,'static/IMG/rcb_p2.jpg',3),
 (19,'Sajith','Pushpakumara','789456123v','rohancbandara@gmail.com','Male','1994-02-21','-Blood Group-','Single','nittabuwa','0707170165','null',NULL,NULL,'static/IMG/rcb_p2.jpg',3),
 (20,'kasun','prabath','958756412v','rohancbandara@gmail.com','Female','1986-06-04','O Positive','Married','','07894562','null',NULL,NULL,'static/IMG/rcb_p3.jpg',3);
/*!40000 ALTER TABLE `tbl_patient` ENABLE KEYS */;


--
-- Table structure for table `sliate_project`.`tbl_special`
--

DROP TABLE IF EXISTS `tbl_special`;
CREATE TABLE `tbl_special` (
  `sp_id` int(11) NOT NULL default '0',
  `sp_name` varchar(150) default NULL,
  PRIMARY KEY  (`sp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliate_project`.`tbl_special`
--

/*!40000 ALTER TABLE `tbl_special` DISABLE KEYS */;
INSERT INTO `tbl_special` (`sp_id`,`sp_name`) VALUES 
 (0,'Select Specialization '),
 (1,'Addiction Psychiatry Psychiatry'),
 (2,'Adolescent Medicine Pediatrics'),
 (3,'Orthopaedics Orthopaedic Surgery'),
 (4,'Heart Failure & Transplant Cardiology Internal Medicine'),
 (5,'Allergy & Immunology');
/*!40000 ALTER TABLE `tbl_special` ENABLE KEYS */;


--
-- Table structure for table `sliate_project`.`tbl_tables`
--

DROP TABLE IF EXISTS `tbl_tables`;
CREATE TABLE `tbl_tables` (
  `tbl_id` varchar(45) NOT NULL default '',
  `d_id` int(45) default NULL,
  `date` varchar(45) default NULL,
  `from` int(45) default NULL,
  `to` int(45) default NULL,
  `intervel` int(45) default NULL,
  PRIMARY KEY  (`tbl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliate_project`.`tbl_tables`
--

/*!40000 ALTER TABLE `tbl_tables` DISABLE KEYS */;
INSERT INTO `tbl_tables` (`tbl_id`,`d_id`,`date`,`from`,`to`,`intervel`) VALUES 
 ('2018-04-0885',85,'2018-04-08',1080,1320,10),
 ('2018-04-1086',86,'2018-04-10',1140,1200,10),
 ('2018-04-1881',81,'2018-04-18',480,720,10),
 ('2018-04-2686',86,'2018-04-26',420,540,15),
 ('2018-04-2687',87,'2018-04-26',1080,1200,10),
 ('2018-04-2781',81,'2018-04-27',0,120,10),
 ('2018-04-2785',85,'2018-04-27',360,480,10),
 ('2018-04-3085',85,'2018-04-30',0,120,10);
/*!40000 ALTER TABLE `tbl_tables` ENABLE KEYS */;


--
-- Table structure for table `sliate_project`.`tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `user_id` int(10) NOT NULL auto_increment,
  `user_name` varchar(45) NOT NULL default '',
  `user_password` varchar(45) default NULL,
  `type_id` int(10) default NULL,
  `reg_date` varchar(15) default NULL,
  `status` varchar(10) default NULL,
  `d_id` int(11) default NULL,
  `p_id` int(11) default NULL,
  `user_email` varchar(45) NOT NULL,
  `user_img_path` varchar(150) default NULL,
  PRIMARY KEY  (`user_id`,`user_name`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `tbl_account_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliate_project`.`tbl_user`
--

/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` (`user_id`,`user_name`,`user_password`,`type_id`,`reg_date`,`status`,`d_id`,`p_id`,`user_email`,`user_img_path`) VALUES 
 (1,'rohan','wJLPEyyDYzo/vhMMV6L7ng==',1,NULL,'active',NULL,NULL,'','static/IMG/rcb_wallpapers-mac-new-hd-wallpaper-mac-hd-1366x768-x-wallpapers.jpg'),
 (3,'',NULL,2,NULL,NULL,85,NULL,'rohancbandara@gmail.com','static/IMG/rcb_d1.jpg'),
 (4,'',NULL,2,NULL,NULL,86,NULL,'rohancbandara@gmail.com','static/IMG/rcb_d2.jpg'),
 (5,'amesh','QyidKMKgEGprY80l6KZkQA==',3,NULL,NULL,NULL,18,'rohancbandara@gmail.com','static/IMG/rcb_p2.jpg'),
 (6,'sajith','QyidKMKgEGprY80l6KZkQA==',3,NULL,NULL,NULL,19,'rohancbandara@gmail.com','static/IMG/rcb_p2.jpg'),
 (7,'pushpa','QyidKMKgEGprY80l6KZkQA==',3,NULL,NULL,NULL,20,'rohancbandara@gmail.com','static/IMG/rcb_p3.jpg'),
 (8,'',NULL,2,NULL,NULL,87,NULL,'rohancbandara@gmail.com','static/IMG/rcb_d3.jpg');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
