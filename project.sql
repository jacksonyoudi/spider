-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: qcloud
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `qcloud_project`
--

DROP TABLE IF EXISTS `qcloud_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qcloud_project` (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(32) NOT NULL,
  `projectId` varchar(32) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creatorUin` varchar(32) NOT NULL,
  PRIMARY KEY (`number`),
  UNIQUE KEY `qpro_projectId` (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qcloud_project`
--

LOCK TABLES `qcloud_project` WRITE;
/*!40000 ALTER TABLE `qcloud_project` DISABLE KEYS */;
INSERT INTO `qcloud_project` VALUES (97,'三剑豪','1000229','2014-04-28 09:33:10','37172917'),(98,'坦克大战','1000230','2014-04-28 09:43:58','1739162173'),(99,'水果忍者公版','1000231','2014-04-28 09:46:23','1739162173'),(100,'神庙逃亡2','1000232','2014-04-28 09:46:57','37172917'),(101,'封神劫','1000233','2014-04-28 09:51:34','37172917'),(102,'极品滑板跑酷','1000234','2014-04-28 09:54:57','37172917'),(103,'卓游斗地主系列','1000235','2014-04-28 09:55:07','37172917'),(104,'纪念碑谷','1000236','2014-04-28 09:56:18','37172917'),(105,'地铁跑酷','1000237','2014-04-28 09:58:41','37172917'),(106,'烈焰遮天','1000238','2014-04-28 09:59:44','37172917'),(107,'bfrc小鸟爆破狂热','1000239','2014-04-28 13:54:54','2285267934'),(108,'暂用私有网络','1000240','2014-04-28 13:55:42','1739162173'),(109,'公司压力测试机','1000241','2014-04-28 14:07:29','2285267934'),(110,'战神奇迹','1000247','2014-05-04 03:00:50','2285267934'),(111,'霹雳台球8ball','1000266','2014-05-14 06:51:21','1739162173'),(112,'奔跑吧兄弟','1000293','2014-05-22 08:16:16','2285267934'),(113,'美人记','1000314','2014-06-04 10:14:00','1739162173'),(114,'三国球霸','1000325','2014-06-12 01:55:51','1739162173'),(115,'四驱三消','1000330','2014-06-16 05:48:28','1739162173'),(116,'水果特工','1000346','2014-06-19 09:24:11','1739162173'),(117,'坚守阵地2','1000347','2014-06-20 02:37:44','1739162173'),(118,'全民大消除','1000363','2014-06-27 02:15:45','1739162173'),(119,'圣斗士星矢','1000368','2014-06-27 09:18:57','1739162173'),(120,'Near2','1000380','2014-07-11 02:42:59','15464760'),(121,'粉碎冠军','1000404','2014-07-21 07:59:08','15464760'),(122,'Hero Never Die','1000497','2014-08-27 06:17:26','2285267934'),(123,'快乐点点消','1000498','2014-08-27 06:17:53','1739162173'),(124,'音乐酷跑','1000499','2014-08-27 06:18:02','1739162173'),(125,'空项目无资源5','1000501','2014-08-27 08:34:38','1739162173'),(126,'Ldlog','1000685','2014-09-28 10:17:47','2285267934'),(127,'资源池','1000804','2014-10-23 02:15:04','2285267934'),(128,'空项目无资源4','1001182','2014-12-09 06:01:50','1739162173'),(129,'部落英雄传','1001183','2014-12-09 06:26:27','2285267934'),(130,'调教三国','1001202','2014-12-11 02:31:48','2285267934'),(131,'果宝三国','1001391','2015-01-06 08:14:58','2285267934'),(132,'乱斗之王','1002100','2015-04-20 02:21:52','1739162173'),(133,'雷神之城','1002220','2015-05-01 01:38:36','2285267934'),(134,'苍穹变','1002233','2015-05-04 06:40:07','1739162173'),(135,'空项目无资源3','1002286','2015-05-08 02:36:21','1739162173'),(136,'赛尔号','1002409','2015-05-20 03:23:00','1739162173'),(137,'空项目无资源2','1002453','2015-05-25 06:48:59','1739162173'),(138,'buddyman','1002542','2015-06-03 08:38:17','1739162173'),(139,'虚幻战场','1002558','2015-06-04 09:22:39','1739162173'),(140,'北美SDK','1002603','2015-06-09 09:27:01','1739162173'),(141,'空项目无资源1','1002669','2015-06-17 06:36:09','1739162173'),(142,'xrpg','1002761','2015-06-29 01:49:20','1739162173'),(143,'审核环境','1002799','2015-07-01 10:12:13','1739162173'),(144,'MTel','1002879','2015-07-08 11:36:10','1739162173');
/*!40000 ALTER TABLE `qcloud_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-16 15:33:56
