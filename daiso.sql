CREATE DATABASE  IF NOT EXISTS `daiso` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `daiso`;
-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: daiso
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` char(18) NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `admin_password` varchar(45) NOT NULL,
  `admin_sex` varchar(5) DEFAULT NULL,
  `admin_location` varchar(100) DEFAULT NULL,
  `admin_telephone` char(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('150423199910274415','陈玉龙','123456','男',NULL,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate`
--

DROP TABLE IF EXISTS `certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `hospital_id` varchar(45) NOT NULL COMMENT '医院id',
  `certificate` varchar(45) NOT NULL COMMENT '医院证书照片链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院证书';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate`
--

LOCK TABLES `certificate` WRITE;
/*!40000 ALTER TABLE `certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` varchar(45) NOT NULL COMMENT '公司编号',
  `company_name` varchar(45) NOT NULL COMMENT '公司名',
  `company_link` varchar(45) DEFAULT NULL COMMENT '公司链接',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司情况';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultation` (
  `id` int(11) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `admin_id` varchar(45) NOT NULL,
  `information` varchar(200) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='咨询';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultation`
--

LOCK TABLES `consultation` WRITE;
/*!40000 ALTER TABLE `consultation` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert`
--

DROP TABLE IF EXISTS `expert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expert` (
  `expert_id` int(11) NOT NULL COMMENT '医生执业编号',
  `expert_name` varchar(45) NOT NULL COMMENT '专家姓名',
  `expert_address` varchar(45) NOT NULL COMMENT '专家姓名',
  `expert_excel` varchar(45) NOT NULL COMMENT '医院id',
  `expert_telephone` char(11) NOT NULL COMMENT '手机号',
  `expert_examine` varchar(5) NOT NULL DEFAULT '0' COMMENT '审核',
  `expert_examine_admin` char(18) DEFAULT NULL,
  PRIMARY KEY (`expert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专家';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert`
--

LOCK TABLES `expert` WRITE;
/*!40000 ALTER TABLE `expert` DISABLE KEYS */;
INSERT INTO `expert` VALUES (352648,'东方不败','黑木崖','针灸','138138138','0',NULL),(356984,'小青','内蒙古','针灸','13948633254','0',NULL),(3486156,'小风','黑龙江','针灸','13948633624','0',NULL);
/*!40000 ALTER TABLE `expert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `group_id` int(10) unsigned NOT NULL COMMENT '群id',
  `group_name` varchar(45) NOT NULL COMMENT '群名',
  `group_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `group_count` int(11) NOT NULL DEFAULT '0' COMMENT '群人数',
  `class` varchar(45) NOT NULL COMMENT '分类',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `hospital_id` int(11) NOT NULL COMMENT '医院id',
  `hospital_name` varchar(50) NOT NULL COMMENT '医院名',
  `hospital_link` varchar(100) NOT NULL COMMENT '医院链接',
  `hospital_level` varchar(20) NOT NULL COMMENT '医院等级',
  `hospital_address` varchar(100) NOT NULL COMMENT '医院地址',
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master`
--

DROP TABLE IF EXISTS `master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `hospital_id` int(11) NOT NULL COMMENT '医院id',
  `hospital_master` varchar(50) NOT NULL COMMENT '医院主治',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院主治';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master`
--

LOCK TABLES `master` WRITE;
/*!40000 ALTER TABLE `master` DISABLE KEYS */;
/*!40000 ALTER TABLE `master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_email` varchar(45) NOT NULL COMMENT '用户邮箱',
  `user_name` varchar(45) NOT NULL COMMENT '用户姓名/昵称',
  `user_description` varchar(200) DEFAULT NULL COMMENT '病情描述',
  `user_address` varchar(200) DEFAULT NULL COMMENT '住址',
  `user_telephone` varchar(45) DEFAULT NULL COMMENT '电话',
  `user_registration_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '注册时间',
  `user_examine` varchar(5) DEFAULT '0' COMMENT '审核',
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1470497018@qq.com','陈玉龙','没事','巴林左旗','13948633624','2020-05-06 13:49:45.326','1'),('cyl_466@163.com','小风','身体疲乏','','13948633670','2020-05-06 13:55:47.831','1'),('cyl_666@163.com','小贾','身体疲乏','','13948633678','2020-05-06 13:55:27.266','1'),('cyl_box1@126.com','小龙','浑身无力','内蒙古','13948863215','2020-05-06 16:08:05.414','0'),('cyl_box@163.com','小明','身体疲乏','','13948633666','2020-05-06 13:54:59.012','0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL COMMENT '用户id',
  `group_id` varchar(45) NOT NULL COMMENT '群id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人群组对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'daiso'
--

--
-- Dumping routines for database 'daiso'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-26 15:43:45
