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
-- Table structure for table `project_t1`
--

DROP TABLE IF EXISTS `project_t1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_t1` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_t1`
--

LOCK TABLES `project_t1` WRITE;
/*!40000 ALTER TABLE `project_t1` DISABLE KEYS */;
INSERT INTO `project_t1` VALUES (1000229,'三剑豪'),(1000230,'坦克大战'),(1000231,'水果忍者公版'),(1000232,'神庙逃亡2'),(1000233,'封神劫'),(1000234,'极品滑板跑酷'),(1000235,'卓游斗地主系列'),(1000236,'纪念碑谷'),(1000237,'地铁跑酷'),(1000238,'烈焰遮天'),(1000239,'bfrc小鸟爆破狂热'),(1000240,'暂用私有网络'),(1000241,'公司压力测试机'),(1000247,'战神奇迹'),(1000266,'霹雳台球8ball'),(1000293,'奔跑吧兄弟'),(1000314,'美人记'),(1000325,'三国球霸'),(1000330,'四驱三消'),(1000346,'水果特工'),(1000347,'坚守阵地2'),(1000363,'全民大消除'),(1000368,'圣斗士星矢'),(1000380,'Near2'),(1000404,'粉碎冠军'),(1000497,'Hero Never Die'),(1000498,'快乐点点消'),(1000499,'音乐酷跑'),(1000501,'空项目无资源5'),(1000685,'Ldlog'),(1000804,'资源池'),(1001182,'空项目无资源4'),(1001183,'部落英雄传'),(1001202,'调教三国'),(1001391,'果宝三国'),(1002100,'乱斗之王'),(1002220,'雷神之城'),(1002233,'苍穹变'),(1002286,'空项目无资源3'),(1002409,'赛尔号'),(1002453,'空项目无资源2'),(1002542,'buddyman'),(1002558,'虚幻战场'),(1002603,'北美SDK'),(1002669,'空项目无资源1'),(1002761,'xrpg'),(1002799,'审核环境'),(1002879,'MTel');
/*!40000 ALTER TABLE `project_t1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-16 15:41:31
