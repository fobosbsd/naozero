-- MySQL dump 10.13  Distrib 5.6.26, for FreeBSD10.1 (amd64)
--
-- Host: localhost    Database: comitet24
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `api_application`
--

DROP TABLE IF EXISTS `api_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `private_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_application`
--

LOCK TABLES `api_application` WRITE;
/*!40000 ALTER TABLE `api_application` DISABLE KEYS */;
INSERT INTO `api_application` VALUES (1,'IPhone APP','wXI65zJa3hTQFJmudJIexx5gkUhLFvkzlU3IS5AhpfLofetlfouvYgbM5v5uNSXO'),(2,'Android APP','AMPfInLPhmfeYrWO88vWAL8MYJSBQ7Fu9dFQ9UHTaEyB5krxjhDOYBN3u1hKGCrp');
/*!40000 ALTER TABLE `api_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_session`
--

DROP TABLE IF EXISTS `api_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_key` varchar(255) NOT NULL,
  `date_expired` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_session`
--

LOCK TABLES `api_session` WRITE;
/*!40000 ALTER TABLE `api_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_comitet`
--

DROP TABLE IF EXISTS `comitet_comitet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_comitet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `logo_id` int(10) DEFAULT '0',
  `owner_votting` tinyint(1) DEFAULT '0',
  `chairman` int(10) DEFAULT '0',
  `secretary` int(10) DEFAULT '0',
  `archived` tinyint(1) DEFAULT '0',
  `instance_id` int(10) DEFAULT '0',
  `show_in_public` tinyint(1) DEFAULT '0',
  `date_create` datetime DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`),
  CONSTRAINT `fk_comitet2instance` FOREIGN KEY (`instance_id`) REFERENCES `instances_instance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_comitet`
--

LOCK TABLES `comitet_comitet` WRITE;
/*!40000 ALTER TABLE `comitet_comitet` DISABLE KEYS */;
INSERT INTO `comitet_comitet` VALUES (1,'Коллегиальный орган №1','Компания  №1',264,1,21,1,0,1,1,'2014-04-03 17:53:01','2014-06-04 17:15:49'),(2,'Коллегиальный орган №2','Компания № 2',0,2,1,2,1,1,0,'2014-04-03 17:53:00','2014-04-03 17:53:00'),(3,'Коллегиальный орган №3','Компания № 3',0,1,2,1,1,1,0,'2014-04-03 17:53:00','2014-04-03 17:53:00'),(4,'Коллегиальный орган №4','Компания № 4',0,1,2,1,1,1,0,'2014-04-03 17:53:00','2014-04-03 17:53:00'),(5,'Коллегиальный орган №5','Компания № 5',81,2,1,2,1,1,0,'2014-04-03 17:53:00','2014-04-15 19:12:21'),(7,'test2','test2',80,2,1,2,1,1,0,'2014-04-03 12:59:57','2014-04-03 13:22:30'),(8,'test1','tt',80,2,1,2,1,1,0,'2014-04-03 13:01:01','2014-04-03 13:06:51'),(9,'Новый орган','акывпвкпвкп',0,0,1,28,0,1,0,'2014-05-29 11:27:55','2014-05-29 11:27:55');
/*!40000 ALTER TABLE `comitet_comitet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_comment`
--

DROP TABLE IF EXISTS `comitet_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `comitet_id` int(11) DEFAULT NULL,
  `instance_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `description` text,
  `date_start` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`),
  KEY `comitet_id` (`comitet_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `fk_comment2comitet` FOREIGN KEY (`comitet_id`) REFERENCES `comitet_comitet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment2instance` FOREIGN KEY (`instance_id`) REFERENCES `instances_instance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment2question` FOREIGN KEY (`question_id`) REFERENCES `comitet_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_comment`
--

LOCK TABLES `comitet_comment` WRITE;
/*!40000 ALTER TABLE `comitet_comment` DISABLE KEYS */;
INSERT INTO `comitet_comment` VALUES (1,NULL,1,1,7,'Мороз и солнце, день чудесный, Еще ты дремлешь, друг прелестный? Вставай, красавица, проснись!!!Мороз и солнце, день чудесный, Еще ты дремлешь, друг прелестный? Вставай, красавица, проснись!!!','2014-04-02 18:10:56'),(2,NULL,1,1,7,'Мороз и солнце, день чудесный, Еще ты дремлешь, друг прелестный? Вставай, красавица, проснись!','2014-04-09 18:22:37'),(4,NULL,1,1,7,'n this case, jQuery serializes the successful controls within the form. Only form elements are examined for inputs they contain, in all other cases the input elements to be serialized should be part of the set passed to the .serialize() method. Selecting both the form and its children in a set will cause duplicates in the serialized string.','2014-04-09 20:12:24'),(18,NULL,1,1,18,'вамвмвам','2014-04-24 19:13:15'),(19,NULL,1,8,7,'ewdwedwed','2014-04-26 12:31:47'),(20,NULL,1,1,7,'ergreg','2014-05-04 16:42:43'),(21,NULL,1,1,7,'rtgrtgrtg','2014-05-04 16:42:59'),(22,NULL,1,1,7,'rgrtghttht','2014-05-04 17:05:06'),(23,NULL,1,1,7,'rtgrtgrt','2014-05-04 17:06:22'),(24,NULL,1,1,7,'rtgrtgrtgrtg','2014-05-04 17:07:28'),(25,NULL,1,1,23,'erverver','2014-05-04 17:11:34'),(26,NULL,1,22,18,'vxvx','2014-05-21 08:59:23'),(27,NULL,1,22,24,'fdrdgdg','2014-05-21 11:50:22'),(29,NULL,1,22,24,'fsegd','2014-05-21 11:59:45'),(30,NULL,1,1,26,'<p>fsefsdf</p>','2014-06-04 17:40:31'),(31,NULL,1,1,10,'<p>regergerg</p>','2014-06-20 10:47:01'),(32,NULL,1,1,15,'<p>esfsefse</p>','2014-06-30 12:38:23'),(33,NULL,1,1,25,'<p>gsdrg\r\nfthfthfth\r\ntfhfthfh</p>','2014-07-03 10:29:07'),(34,NULL,1,1,25,'<p>gdrg\r\nhf\r\nth\r\nf\r\nh</p>','2014-07-03 10:30:20'),(35,NULL,1,1,25,'<p>hughuyguyguyg</p>','2014-09-28 10:17:34'),(36,NULL,1,1,16,'<p>sefsefsefse</p>','2015-03-03 18:36:39'),(37,NULL,1,1,16,'<p>sefsefsefse</p>','2015-03-03 18:36:42'),(38,NULL,1,1,16,'<p>sefsefsefse</p>','2015-03-03 18:36:51'),(39,NULL,1,1,16,'<p>sefsefsefse</p>','2015-03-03 18:38:25'),(40,NULL,1,1,16,'<p>sefsefsefse</p>','2015-03-03 18:38:41'),(41,NULL,1,1,16,'<p>fsfs</p>','2015-03-03 18:38:50');
/*!40000 ALTER TABLE `comitet_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_comment_files2file`
--

DROP TABLE IF EXISTS `comitet_comment_files2file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_comment_files2file` (
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `file_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`,`file_id`),
  KEY `fk_comitet_comment_files2file_file_id` (`file_id`),
  CONSTRAINT `fk_comitet_comment_files2file_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comitet_comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comitet_comment_files2file_file_id` FOREIGN KEY (`file_id`) REFERENCES `files_file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_comment_files2file`
--

LOCK TABLES `comitet_comment_files2file` WRITE;
/*!40000 ALTER TABLE `comitet_comment_files2file` DISABLE KEYS */;
INSERT INTO `comitet_comment_files2file` VALUES (4,131),(4,132),(20,207),(24,236),(27,293),(27,294),(29,300),(30,309),(32,318);
/*!40000 ALTER TABLE `comitet_comment_files2file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_meeting`
--

DROP TABLE IF EXISTS `comitet_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comitet_id` int(11) DEFAULT NULL,
  `instance_id` int(11) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `notifications_sended` tinyint(1) DEFAULT '0',
  `time_start` time DEFAULT NULL,
  `successful` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`),
  KEY `comitet_id` (`comitet_id`),
  CONSTRAINT `fk_meeting2comitet` FOREIGN KEY (`comitet_id`) REFERENCES `comitet_comitet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_meeting2instance` FOREIGN KEY (`instance_id`) REFERENCES `instances_instance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_meeting`
--

LOCK TABLES `comitet_meeting` WRITE;
/*!40000 ALTER TABLE `comitet_meeting` DISABLE KEYS */;
INSERT INTO `comitet_meeting` VALUES (4,1,1,'2014-05-14 11:31:21','Киев',0,NULL,0),(5,1,1,'2014-05-13 00:00:00','Лондон',0,NULL,0),(6,9,1,'2014-06-03 00:00:00','feyhtujy',0,'15:00:00',0),(7,1,1,'2014-06-20 00:00:00','feyhtujy',0,'09:00:00',0),(9,1,1,'2014-06-20 00:00:00','uiguigiuh',0,'09:00:00',1),(10,1,1,'2014-06-20 00:00:00','екн',0,'09:00:00',1),(11,1,1,'2015-02-28 00:00:00','Принятие решений по вопросам',0,'04:00:00',1);
/*!40000 ALTER TABLE `comitet_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_participants2user`
--

DROP TABLE IF EXISTS `comitet_participants2user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_participants2user` (
  `comitet_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comitet_id`,`user_id`),
  KEY `fk_comitet_participants2user_user_id` (`user_id`),
  CONSTRAINT `fk_comitet_participants2user_comitet_id` FOREIGN KEY (`comitet_id`) REFERENCES `comitet_comitet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comitet_participants2user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_participants2user`
--

LOCK TABLES `comitet_participants2user` WRITE;
/*!40000 ALTER TABLE `comitet_participants2user` DISABLE KEYS */;
INSERT INTO `comitet_participants2user` VALUES (1,9),(1,10);
/*!40000 ALTER TABLE `comitet_participants2user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_project`
--

DROP TABLE IF EXISTS `comitet_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comitet_id` int(11) DEFAULT NULL,
  `instance_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `internal_id` int(11) DEFAULT NULL,
  `description` text,
  `percent` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`),
  KEY `comitet_id` (`comitet_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `fk_project2comitet` FOREIGN KEY (`comitet_id`) REFERENCES `comitet_comitet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_project2instance` FOREIGN KEY (`instance_id`) REFERENCES `instances_instance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_project2question` FOREIGN KEY (`question_id`) REFERENCES `comitet_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_project`
--

LOCK TABLES `comitet_project` WRITE;
/*!40000 ALTER TABLE `comitet_project` DISABLE KEYS */;
INSERT INTO `comitet_project` VALUES (9,1,1,8,8,'Мороз и солнце, день чудесный, Еще ты дремлешь, друг прелестный? Вставай, красавица, проснись!',0.00),(10,1,1,8,9,'Мороз и солнце, день чудесный, Еще ты дремлешь, друг прелестный? Вставай, красавица, проснись!',0.00),(11,1,1,7,1,'После очередной победы Днепра сегодняшнее противостояние Динамо и Шахтера превращается в ключевой матч сезона для обеих команд. Если Динамо планирует всерьез бороться за первое место, то его не устроит никакой другой результат кроме победы.',20.00),(13,1,1,7,3,'Правительство Германии поддержало решение Киева в проведении силовой операции против пророссийских боевиков и диверсантов на востоке Украины. ',20.00),(14,1,1,19,1,':)',0.00),(17,1,1,22,1,'ergergegergergerg',0.00),(18,1,1,23,1,'45t45tt',0.00),(19,1,1,23,2,'45t45t45t45t',0.00),(20,1,1,7,6,'После очередной победы Днепра сегодняшнее противостояние Динамо и Шахтера превращается в ключевой матч сезона для обеих команд. Если Динамо планирует всерьез бороться за первое место, то его не устроит никакой другой результат кроме победы.',60.00),(21,1,1,9,1,'цука',20.00),(27,1,22,24,1,'ferertgre',0.00),(28,1,22,24,2,'gedghrf',0.00),(33,1,22,12,5,'ferdyghrtfyh',0.00),(34,1,22,12,6,'rddrdrg',0.00),(35,1,1,26,1,'<p>gdrgtd</p>',0.00),(36,1,1,25,1,'<p>fersg</p>',0.00),(37,1,1,25,2,'<p>htrhrht</p>',0.00),(38,1,16,18,1,'<p>grtfhgyth</p>',0.00),(39,1,16,18,2,'<p>gry6ty</p>',0.00),(40,1,1,16,1,'<p>vfgyt</p>',0.00),(41,1,1,16,2,'<p>t6ut6u6t</p>',100.00),(42,1,1,10,1,'<p>fesferf</p>',100.00),(43,1,1,10,2,'<p>ergreg</p>',0.00),(44,1,1,15,1,'<p>drgdrg</p>',66.67),(45,1,1,15,2,'<p>rdgdrg</p>',0.00),(46,1,1,25,3,'<p>gerrtd\r\ng\r\ntrhtrhrt\r\nh</p>\r\n\r\n<p>\r\nrthrthrth</p>',0.00),(47,1,1,25,4,'<p>ferdgrfth\r\ntrhrth\r\nrthtrh</p>',0.00),(48,1,1,25,5,'<p>drgd\r\nghf\r\nth\r\nft\r\nhfth</p>',0.00),(49,1,3,25,6,'<p>xdfvxfvx</p>',0.00),(50,1,1,27,1,'Первый проект решения',83.33),(51,1,1,11,1,'<p>Новый проект решения</p>',83.33);
/*!40000 ALTER TABLE `comitet_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_project_files2file`
--

DROP TABLE IF EXISTS `comitet_project_files2file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_project_files2file` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `file_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`,`file_id`),
  KEY `FK_comitet_project_files2file_files_file_id` (`file_id`),
  CONSTRAINT `FK_comitet_project_files2file_comitet_project_id` FOREIGN KEY (`project_id`) REFERENCES `comitet_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_comitet_project_files2file_files_file_id` FOREIGN KEY (`file_id`) REFERENCES `files_file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_project_files2file`
--

LOCK TABLES `comitet_project_files2file` WRITE;
/*!40000 ALTER TABLE `comitet_project_files2file` DISABLE KEYS */;
INSERT INTO `comitet_project_files2file` VALUES (17,240),(18,246),(19,247),(19,248),(19,249),(20,258),(20,259),(20,260),(33,305),(35,310);
/*!40000 ALTER TABLE `comitet_project_files2file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_question`
--

DROP TABLE IF EXISTS `comitet_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comitet_id` int(11) DEFAULT NULL,
  `instance_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `internal_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `deflected` tinyint(1) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `meeting_id` int(11) NOT NULL DEFAULT '0',
  `was_meeting` int(11) NOT NULL DEFAULT '0' COMMENT 'ссылка meeting_id',
  `date_move` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`),
  KEY `comitet_id` (`comitet_id`),
  KEY `category_id` (`category_id`),
  KEY `meeting_id` (`meeting_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `fk_question2category` FOREIGN KEY (`category_id`) REFERENCES `comitet_questions_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_question2comitet` FOREIGN KEY (`comitet_id`) REFERENCES `comitet_comitet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_question2instance` FOREIGN KEY (`instance_id`) REFERENCES `instances_instance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_question`
--

LOCK TABLES `comitet_question` WRITE;
/*!40000 ALTER TABLE `comitet_question` DISABLE KEYS */;
INSERT INTO `comitet_question` VALUES (7,1,1,3,'2014-04-05 18:11:34',1,'Вопрос №1','Мороз и солнце, день чудесный, Еще ты дремлешь, друг прелестный? Вставай, красавица, проснись!',0,20,4,0,'2014-05-06 21:25:57'),(8,1,1,2,'2014-04-06 17:39:21',2,'Вопрос №2','Суть вопроса',0,0,0,0,'2014-05-06 12:51:02'),(9,1,1,2,'2014-04-06 18:44:18',3,'Вопрос №3','Вопрос №3',0,0,5,0,'2014-05-06 12:40:02'),(10,1,1,3,'2014-04-06 18:44:31',4,'Вопрос №4','Вопрос №4',0,42,9,0,'2014-06-20 10:47:13'),(11,1,1,1,'2014-04-06 18:44:43',5,'Вопрос №5','Вопрос №5',0,51,11,4,'2015-03-10 02:31:19'),(12,1,1,1,'2014-04-06 18:44:53',6,'Вопрос №6','Вопрос №6',1,0,0,8,'2015-02-26 14:40:03'),(13,1,1,1,'2014-04-12 15:57:25',7,'Вопрос №7','Вопрос №7',0,0,0,0,'2014-05-06 12:57:10'),(14,1,1,1,'2014-04-12 15:57:25',8,'Вопрос №8','Вопрос №8',0,0,0,0,'2014-05-04 17:41:33'),(15,1,1,1,'2014-04-12 15:57:25',9,'Вопрос №9','Вопрос №9',0,44,11,10,'2015-03-10 02:36:47'),(16,1,1,1,'2014-04-12 15:57:25',10,'Вопрос №10','Вопрос №10',0,41,11,0,'2015-03-10 02:48:14'),(17,1,1,1,'2014-04-12 15:57:25',11,'Вопрос №11','Вопрос №11',0,0,0,0,'2014-05-04 17:41:28'),(18,1,1,1,'2014-04-12 15:57:25',12,'Вопрос №12','Вопрос №12',0,0,7,0,'2014-06-20 10:32:40'),(19,1,1,1,'2014-04-12 15:57:25',13,'Вопрос №13','Вопрос №13',0,0,0,4,'2014-05-06 12:48:51'),(20,1,1,1,'2014-04-12 15:57:25',14,'Вопрос №14','Вопрос №14',0,0,0,0,'2014-05-04 17:41:30'),(21,1,1,1,'2014-04-12 15:57:25',15,'Вопрос №15','Вопрос №15',0,0,0,4,'2014-05-06 12:54:56'),(22,1,1,42,'2014-05-04 17:08:06',16,'rtgrtg','g54g54g',0,0,0,0,NULL),(23,1,1,2,'2014-05-04 17:11:17',17,'gggggggggggggggggggggggggggggggg','ggggggggggggggggggg',1,0,0,0,'2015-02-26 14:38:19'),(24,1,22,1,'2014-05-21 11:43:01',18,'Мой вопрос','ыуаыуаыуа',1,0,0,0,'2015-02-26 14:38:29'),(25,1,1,1,'2014-06-04 16:48:42',19,'edesfsef','sfgsrdg',1,0,0,7,'2015-02-26 14:39:58'),(26,1,1,2,'2014-06-04 17:31:17',20,'равкп','раереар',1,0,0,0,'2015-02-26 14:38:17'),(27,1,1,3,'2015-02-24 19:29:06',21,'Новый вопрос на голосование','акыакыак',0,50,11,0,'2015-03-03 18:35:38');
/*!40000 ALTER TABLE `comitet_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_question_experts2user`
--

DROP TABLE IF EXISTS `comitet_question_experts2user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_question_experts2user` (
  `question_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `instance_id` int(11) DEFAULT '0',
  PRIMARY KEY (`question_id`,`user_id`),
  KEY `fk_comitet_question_experts2user_user_id` (`user_id`),
  CONSTRAINT `fk_comitet_question_experts2user_question_id` FOREIGN KEY (`question_id`) REFERENCES `comitet_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comitet_question_experts2user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_question_experts2user`
--

LOCK TABLES `comitet_question_experts2user` WRITE;
/*!40000 ALTER TABLE `comitet_question_experts2user` DISABLE KEYS */;
INSERT INTO `comitet_question_experts2user` VALUES (7,11,1),(7,12,4),(20,11,1);
/*!40000 ALTER TABLE `comitet_question_experts2user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_question_files2file`
--

DROP TABLE IF EXISTS `comitet_question_files2file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_question_files2file` (
  `question_id` int(11) NOT NULL DEFAULT '0',
  `file_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`question_id`,`file_id`),
  KEY `fk_comitet_question_files2file_file_id` (`file_id`),
  KEY `IDX_comitet_question_files2file_question_id` (`question_id`),
  CONSTRAINT `fk_comitet_question_files2file_file_id` FOREIGN KEY (`file_id`) REFERENCES `files_file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comitet_question_files2file_question_id` FOREIGN KEY (`question_id`) REFERENCES `comitet_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_question_files2file`
--

LOCK TABLES `comitet_question_files2file` WRITE;
/*!40000 ALTER TABLE `comitet_question_files2file` DISABLE KEYS */;
INSERT INTO `comitet_question_files2file` VALUES (22,237),(7,269),(7,270),(7,271),(7,272);
/*!40000 ALTER TABLE `comitet_question_files2file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_questions_category`
--

DROP TABLE IF EXISTS `comitet_questions_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_questions_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `comitet_id` int(11) DEFAULT NULL,
  `instance_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`),
  CONSTRAINT `fk_questions_category2instance` FOREIGN KEY (`instance_id`) REFERENCES `instances_instance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_questions_category`
--

LOCK TABLES `comitet_questions_category` WRITE;
/*!40000 ALTER TABLE `comitet_questions_category` DISABLE KEYS */;
INSERT INTO `comitet_questions_category` VALUES (1,'Раздел вопроса #1',1,1),(2,'Раздел вопроса #2',1,1),(3,'Раздел вопроса #3',1,1),(4,'Новая категория',1,1),(5,'Тест раздел 1',1,1),(6,'Тест раздел 2',1,1),(7,'Тест раздел 3',1,1),(8,'Тест раздел 10',1,1),(9,'Новый супер пупер раздел',1,1),(10,'test 1',1,1),(11,'test 2',1,1),(12,'test 3',1,1),(13,'еуые 3',1,1),(14,'dgerg',1,1),(15,'gggggggggggggggggggggggggggg',1,1),(16,'regeergeg',1,1),(17,'ggggggdg',1,1),(18,'jjjjjjjjjjjjjjjjjj',1,1),(19,'kkkkk',1,1),(20,'wwwwwwwwww',1,1),(21,'llllllllllll',1,1),(22,'ghghghgh',1,1),(23,'ttgtgtgtg',1,1),(24,'ttgtgtgtg',1,1),(25,'rthrthrth',1,1),(26,'rthrthrth',1,1),(27,'45t45t45t',1,1),(28,'rthrh',1,1),(29,'ff',1,1),(30,'hh',1,1),(31,'ll',1,1),(32,'hh',1,1),(33,'pp',1,1),(34,'nn',1,1),(35,'mm',1,1),(36,'lllllllllllllllllllllllllllllllllllll',1,1),(37,'hhhh',1,1),(38,'tyhtyhtyhtyh',1,1),(39,'tyhtyhtyhtyhtyhtyh',1,1),(40,'ythth',1,1),(41,'jjjjjjjhjhjhj',1,1),(42,'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk000',1,1),(43,'7777',1,22),(44,'888',1,22),(45,'999',1,22),(46,'11111',1,22);
/*!40000 ALTER TABLE `comitet_questions_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_report`
--

DROP TABLE IF EXISTS `comitet_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comitet_id` int(11) DEFAULT NULL,
  `instance_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `report_text` text,
  `report_file_id` int(11) DEFAULT NULL,
  `chairman_signed` tinyint(1) NOT NULL DEFAULT '0',
  `secretary_signed` tinyint(1) NOT NULL DEFAULT '0',
  `date_create` datetime DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`),
  KEY `comitet_id` (`comitet_id`),
  KEY `meeting_id` (`meeting_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `fk_report2comitet` FOREIGN KEY (`comitet_id`) REFERENCES `comitet_comitet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_report2instance` FOREIGN KEY (`instance_id`) REFERENCES `instances_instance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_report2meeting` FOREIGN KEY (`meeting_id`) REFERENCES `comitet_meeting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_report2project` FOREIGN KEY (`project_id`) REFERENCES `comitet_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_report`
--

LOCK TABLES `comitet_report` WRITE;
/*!40000 ALTER TABLE `comitet_report` DISABLE KEYS */;
INSERT INTO `comitet_report` VALUES (1,1,16,NULL,4,'<p><img alt=\"ruxon_cms_logo.png\" src=\"http://personal.comitet24.loc/uploads/images/1/4418b32504b5b684928c49fbfc84fce9_137.png\" /></p>\r\n\r\n<p style=\"text-align: center;\">Компания №1</p>\r\n\r\n<h1 style=\"text-align: center\">ПРОТОКОЛ</h1>\r\n\r\n<p>Заседание Коллегиальный орган №1</p>\r\n\r\n<p>Дата заседания: 14.05.2014 Время заседания 00:00</p>\r\n\r\n<p>Место, форма проведения: Киев</p>\r\n\r\n<p>ПРИСУТСТВОВАЛИ / ПРИНЯЛИ УЧАСТИЕ:</p>\r\n\r\n<p>Председатель &ndash; Паламар yandex ;<br />\r\nГолосующий Член Органа 1;<br />\r\nГолосующий Член Органа 2;<br />\r\nСекретарь &ndash; Администратор Максим .</p>\r\n\r\n<p>ПОВЕСТКА ДНЯ ЗАСЕДАНИЯ:</p>\r\n\r\n<p>1. Вопрос №1</p>\r\n\r\n<p>2. Вопрос №5</p>\r\n\r\n<p>3. Вопрос №13</p>\r\n\r\n<p>4. Вопрос №15</p>\r\n\r\n<p><strong>1. По вопросу повестки дня номер 1.</strong></p>\r\n\r\n<p>Вопрос №1<br />\r\nМороз и солнце, день чудесный, Еще ты дремлешь, друг прелестный? Вставай, красавица, проснись!</p>\r\n\r\n<p><strong>1.1. Проект решения номер 1.</strong></p>\r\n\r\n<p>После очередной победы Днепра сегодняшнее противостояние Динамо и Шахтера превращается в ключевой матч сезона для обеих команд. Если Динамо планирует всерьез бороться за первое место, то его не устроит никакой другой результат кроме победы.<br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 1 голосов: Администратор Максим ;<br />\r\n&laquo;Против&raquo; - 0 голосов;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;</p>\r\n\r\n<p><strong>1.2. Проект решения номер 2.</strong></p>\r\n\r\n<p>Правительство Германии поддержало решение Киева в проведении силовой операции против пророссийских боевиков и диверсантов на востоке Украины.<br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 1 голосов: Голосующий Член Органа 1 ;<br />\r\n&laquo;Против&raquo; - 0 голосов;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;</p>\r\n\r\n<p><strong>1.3. Проект решения номер 3.</strong></p>\r\n\r\n<p>После очередной победы Днепра сегодняшнее противостояние Динамо и Шахтера превращается в ключевой матч сезона для обеих команд. Если Динамо планирует всерьез бороться за первое место, то его не устроит никакой другой результат кроме победы.<br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 3 голосов: Голосующий Член Органа 2 Паламар yandex Пупкин Василий ;<br />\r\n&laquo;Против&raquo; - 0 голосов;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;<br />\r\n<br />\r\nПо итогам голосования ПРИНЯТО РЕШЕНИЕ: После очередной победы Днепра сегодняшнее противостояние Динамо и Шахтера превращается в ключевой матч сезона для обеих команд. Если Динамо планирует всерьез бороться за первое место, то его не устроит никакой другой результат кроме победы.</p>\r\n\r\n<p><strong>2. По вопросу повестки дня номер 2.</strong></p>\r\n\r\n<p>Вопрос №5<br />\r\nВопрос №5<br />\r\n<br />\r\nПо итогам голосования решение не принято, т.к. в голосовании приняло менее 50% членов или ни один проект решения не набрал более 50% голосов</p>\r\n\r\n<p><strong>3. По вопросу повестки дня номер 3.</strong></p>\r\n\r\n<p>Вопрос №13<br />\r\nВопрос №13<br />\r\n<br />\r\nПо итогам голосования решение не принято, т.к. в голосовании приняло менее 50% членов или ни один проект решения не набрал более 50% голосов</p>\r\n\r\n<p><strong>4. По вопросу повестки дня номер 4.</strong></p>\r\n\r\n<p>Вопрос №15<br />\r\nВопрос №15<br />\r\n<br />\r\nПо итогам голосования решение не принято, т.к. в голосовании приняло менее 50% членов или ни один проект решения не набрал более 50% голосов</p>\r\n\r\n<p>Подсчет голосов производился с использованием системы документооборота Comitet24.ru. Результаты подсчета проверены.</p>\r\n\r\n<p>Председатель Коллегиальный орган №1 _____подпись____ Паламар yandex</p>\r\n\r\n<p>Секретарь Коллегиальный орган №1 _____подпись____ Администратор Максим</p>\r\n',312,1,1,'2014-05-09 12:11:04','2014-06-04 18:04:43',NULL),(2,1,16,NULL,5,'<p><img alt=\"ruxon_cms_logo.png\" src=\"http://personal.comitet24.loc/uploads/images/1/4418b32504b5b684928c49fbfc84fce9_137.png\" /></p>\r\n\r\n<p style=\"text-align: center;\">Компания №1</p>\r\n\r\n<h1 style=\"text-align: center\"><span class=\"marker\">ПРОТОКОЛ</span></h1>\r\n\r\n<p>Заседание Коллегиальный орган №1</p>\r\n\r\n<p>Дата заседания: 13.05.2014 Время заседания 00:00</p>\r\n\r\n<p>Место, форма проведения: Лондон</p>\r\n\r\n<p>ПРИСУТСТВОВАЛИ / ПРИНЯЛИ УЧАСТИЕ:</p>\r\n\r\n<p>Председатель &ndash; Паламар yandex ;<br />\r\nСекретарь &ndash; Администратор Максим .</p>\r\n\r\n<p>ПОВЕСТКА ДНЯ ЗАСЕДАНИЯ:</p>\r\n\r\n<p>1. Вопрос №3</p>\r\n\r\n<p><strong>1. По вопросу повестки дня номер 1.</strong></p>\r\n\r\n<p>Вопрос №3<br />\r\nВопрос №3</p>\r\n\r\n<p><strong>1.1. Проект решения номер 1.</strong></p>\r\n\r\n<p>цука<br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 1 голосов: Администратор Максим ;<br />\r\n&laquo;Против&raquo; - 0 голосов;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;<br />\r\n<br />\r\nПо итогам голосования решение не принято, т.к. в голосовании приняло менее 50% членов или ни один проект решения не набрал более 50% голосов</p>\r\n\r\n<p>Подсчет голосов производился с использованием системы документооборота Comitet24.ru. Результаты подсчета проверены.</p>\r\n\r\n<p>Председатель Коллегиальный орган №1 _____подпись____ Паламар yandex</p>\r\n\r\n<p>Секретарь Коллегиальный орган №1 _____подпись____ Администратор Максим</p>\r\n',306,1,1,'2014-05-12 12:50:20','2014-05-22 14:24:58',NULL),(3,1,16,NULL,7,'<p><img alt=\"ruxon_cms_logo.png\" src=\"/files/default/index/bucket/images/?file=images%2F1%2Fc85fb2c40ee71221f14638670e38d9b8.png&amp;width=180&amp;crop=1&amp;height=80\" /></p>\r\n\r\n<p style=\"text-align: center;\">Компания №1</p>\r\n\r\n<h1 style=\"text-align: center\">ПРОТОКОЛ</h1>\r\n\r\n<p>Заседание Коллегиальный орган №1</p>\r\n\r\n<p>Дата заседания: 20.06.2014 Время заседания 09:00</p>\r\n\r\n<p>Место, форма проведения: feyhtujy</p>\r\n\r\n<p>ПРИСУТСТВОВАЛИ / ПРИНЯЛИ УЧАСТИЕ:</p>\r\n\r\n<p>Председатель &ndash; Паламар yandex ;</p>\r\n\r\n<p>Голосующие члены -</p>\r\n\r\n<p>Участники - Участник Органа 1; Участник Органа 2;</p>\r\n\r\n<p>Секретарь &ndash; Администратор Максим .</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ПОВЕСТКА ДНЯ ЗАСЕДАНИЯ:</p>\r\n\r\n<p>1. edesfsef</p>\r\n\r\n<p><strong>1. По вопросу повестки дня номер 1.</strong></p>\r\n\r\n<p>edesfsef<br />\r\nsfgsrdg</p>\r\n\r\n<p><strong>1.1. Проект решения номер 1.</strong></p>\r\n\r\n<p>fersg</p>\r\n\r\n<p><br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 1 голосов: Администратор Максим ;<br />\r\n&laquo;Против&raquo; - 0 голосов;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>1.2. Проект решения номер 2.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>htrhrht</p>\r\n\r\n<p><br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 0 голосов;<br />\r\n&laquo;Против&raquo; - 1 голосов: Администратор Максим ;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;<br />\r\n<br />\r\nПо итогам голосования решение не принято, т.к. в голосовании приняло менее 50% членов или ни один проект решения не набрал более 50% голосов</p>\r\n\r\n<p>Подсчет голосов производился с использованием системы документооборота Comitet24.ru. Результаты подсчета проверены.</p>\r\n\r\n<p>Председатель Коллегиальный орган №1 _____подпись____ Паламар yandex</p>\r\n\r\n<p>Секретарь Коллегиальный орган №1 _____подпись____ Администратор Максим</p>\r\n',313,1,1,'2014-06-20 10:15:12','2014-06-20 10:18:30',NULL),(5,1,1,NULL,9,'<p><img alt=\"ruxon_cms_logo.png\" src=\"http://personal.comitet24.loc/files/default/index/bucket/images/?file=images%2F1%2Fc85fb2c40ee71221f14638670e38d9b8.png&amp;width=180&amp;crop=1&amp;height=80\" /></p>\r\n\r\n<p style=\"text-align: center;\">Компания №1</p>\r\n\r\n<h1 style=\"text-align: center\">ПРОТОКОЛ</h1>\r\n\r\n<p>Заседание Коллегиальный орган №1</p>\r\n\r\n<p>Дата заседания: 20.06.2014 Время заседания 09:00</p>\r\n\r\n<p>Место, форма проведения: uiguigiuh</p>\r\n\r\n<p>ПРИСУТСТВОВАЛИ / ПРИНЯЛИ УЧАСТИЕ:</p>\r\n\r\n<p>Председатель &ndash; Паламар yandex ;</p>\r\n\r\n<p>Голосующие члены - Пупкин Василий ;</p>\r\n\r\n<p>Участники - Участник Органа 1; Участник Органа 2;</p>\r\n\r\n<p>Секретарь &ndash; Администратор Максим .</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ПОВЕСТКА ДНЯ ЗАСЕДАНИЯ:</p>\r\n\r\n<p>1. Вопрос №4</p>\r\n\r\n<p><strong>1. По вопросу повестки дня номер 1.</strong></p>\r\n\r\n<p>Вопрос №4<br />\r\nВопрос №4</p>\r\n\r\n<p><strong>1.1. Проект решения номер 1.</strong></p>\r\n\r\n<p>fesferf</p>\r\n\r\n<p><br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 6 голосов: Паламар yandex Администратор Максим Голосующий Член Органа 1 Голосующий Член Органа 2 Пупкин Василий Пинюгин Максим ;<br />\r\n&laquo;Против&raquo; - 0 голосов;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;<br />\r\n<br />\r\nПо итогам голосования ПРИНЯТО РЕШЕНИЕ:</p>\r\n\r\n<p>fesferf</p>\r\n\r\n<p>Подсчет голосов производился с использованием системы документооборота Comitet24.ru. Результаты подсчета проверены.</p>\r\n\r\n<p>Председатель Коллегиальный орган №1 _____подпись____ Паламар yandex</p>\r\n\r\n<p>Секретарь Коллегиальный орган №1 _____подпись____ Администратор Максим</p>\r\n',315,1,1,'2014-06-20 10:50:46','2014-06-20 11:01:28',NULL),(6,1,16,NULL,10,'<p><img alt=\"ruxon_cms_logo.png\" src=\"http://personal.comitet24.loc/files/default/index/bucket/images/?file=images%2F1%2Fc85fb2c40ee71221f14638670e38d9b8.png&amp;width=180&amp;crop=1&amp;height=80\" /></p>\r\n\r\n<p style=\"text-align: center;\">Компания №1</p>\r\n\r\n<h1 style=\"text-align: center\">ПРОТОКОЛ</h1>\r\n\r\n<p>Заседание Коллегиальный орган №1</p>\r\n\r\n<p>Дата заседания: 20.06.2014 Время заседания 09:00</p>\r\n\r\n<p>Место, форма проведения: екн</p>\r\n\r\n<p>ПРИСУТСТВОВАЛИ / ПРИНЯЛИ УЧАСТИЕ:</p>\r\n\r\n<p>Председатель &ndash; Паламар yandex ;</p>\r\n\r\n<p>Голосующие члены -</p>\r\n\r\n<p>Участники - Участник Органа 1; Участник Органа 2;</p>\r\n\r\n<p>Секретарь &ndash; Администратор Максим .</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ПОВЕСТКА ДНЯ ЗАСЕДАНИЯ:</p>\r\n\r\n<p>1. Вопрос №9</p>\r\n\r\n<p><strong>1. По вопросу повестки дня номер 1.</strong></p>\r\n\r\n<p>Вопрос №9<br />\r\nВопрос №9</p>\r\n\r\n<p><strong>1.1. Проект решения номер 1.</strong></p>\r\n\r\n<p>drgdrg</p>\r\n\r\n<p><br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 2 голосов: Паламар yandex Администратор Максим ;<br />\r\n&laquo;Против&raquo; - 0 голосов;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;<br />\r\n<br />\r\nПо итогам голосования решение не принято, т.к. в голосовании приняло менее 50% членов или ни один проект решения не набрал более 50% голосов</p>\r\n\r\n<p>Подсчет голосов производился с использованием системы документооборота Comitet24.ru. Результаты подсчета проверены.</p>\r\n\r\n<p>Председатель Коллегиальный орган №1 _____подпись____ Паламар yandex</p>\r\n\r\n<p>Секретарь Коллегиальный орган №1 _____подпись____ Администратор Максим</p>\r\n',316,1,1,'2014-06-20 11:24:01','2014-06-20 11:25:28',NULL),(7,1,1,NULL,11,'<p><img alt=\"ruxon_cms_logo.png\" src=\"http://personal.comitet24.lc/files/default/index/bucket/images/?file=images%2F1%2Fc85fb2c40ee71221f14638670e38d9b8.png&amp;width=180&amp;crop=1&amp;height=80\" /></p>\r\n\r\n<p style=\"text-align: center;\">Компания №1</p>\r\n\r\n<h1 style=\"text-align: center\">ПРОТОКОЛОС</h1>\r\n\r\n<p>Заседание Коллегиальный орган №1</p>\r\n\r\n<p>Дата заседания: 28.02.2015 Время заседания 04:00</p>\r\n\r\n<p>Место, форма проведения: Принятие решений по вопросам</p>\r\n\r\n<p>ПРИСУТСТВОВАЛИ / ПРИНЯЛИ УЧАСТИЕ:</p>\r\n\r\n<p>Председатель &ndash; Паламар yandex ;</p>\r\n\r\n<p>Голосующие члены - Пинюгин Максим ;</p>\r\n\r\n<p>Участники - Участник Органа 1; Участник Органа 2;</p>\r\n\r\n<p>Секретарь &ndash; Администратор Максим .</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ПОВЕСТКА ДНЯ ЗАСЕДАНИЯ:</p>\r\n\r\n<p>1. Вопрос №5</p>\r\n\r\n<p>2. Вопрос №9</p>\r\n\r\n<p>3. Вопрос №10</p>\r\n\r\n<p>4. Новый вопрос на голосование</p>\r\n\r\n<p><strong>1. По вопросу повестки дня номер 1.</strong></p>\r\n\r\n<p>Вопрос №5<br />\r\nВопрос №5</p>\r\n\r\n<p><strong>1.1. Проект решения номер 1.</strong></p>\r\n\r\n<p>Новый проект решения</p>\r\n\r\n<p><br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 5 голосов: Паламар yandex Администратор Максим Голосующий Член Органа 1 Голосующий Член Органа 2 Пупкин Василий ;<br />\r\n&laquo;Против&raquo; - 0 голосов;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;<br />\r\n<br />\r\nПо итогам голосования ПРИНЯТО РЕШЕНИЕ:</p>\r\n\r\n<p>Новый проект решения</p>\r\n\r\n<p><strong>2. По вопросу повестки дня номер 2.</strong></p>\r\n\r\n<p>Вопрос №9<br />\r\nВопрос №9</p>\r\n\r\n<p><strong>2.1. Проект решения номер 1.</strong></p>\r\n\r\n<p>drgdrg</p>\r\n\r\n<p><br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 4 голосов: Администратор Максим Голосующий Член Органа 1 Голосующий Член Органа 2 Пупкин Василий ;<br />\r\n&laquo;Против&raquo; - 0 голосов;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2.2. Проект решения номер 2.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>rdgdrg</p>\r\n\r\n<p><br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 0 голосов;<br />\r\n&laquo;Против&raquo; - 1 голосов: Администратор Максим ;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;<br />\r\n<br />\r\nПо итогам голосования ПРИНЯТО РЕШЕНИЕ:</p>\r\n\r\n<p>drgdrg</p>\r\n\r\n<p><strong>3. По вопросу повестки дня номер 3.</strong></p>\r\n\r\n<p>Вопрос №10<br />\r\nВопрос №10</p>\r\n\r\n<p><strong>3.1. Проект решения номер 1.</strong></p>\r\n\r\n<p>vfgyt</p>\r\n\r\n<p><br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 0 голосов;<br />\r\n&laquo;Против&raquo; - 1 голосов: Администратор Максим ;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>3.2. Проект решения номер 2.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>t6ut6u6t</p>\r\n\r\n<p><br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 6 голосов: Паламар yandex Администратор Максим Голосующий Член Органа 1 Голосующий Член Органа 2 Пинюгин Максим Пупкин Василий ;<br />\r\n&laquo;Против&raquo; - 0 голосов;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;<br />\r\n<br />\r\nПо итогам голосования ПРИНЯТО РЕШЕНИЕ:</p>\r\n\r\n<p>t6ut6u6t</p>\r\n\r\n<p><strong>4. По вопросу повестки дня номер 4.</strong></p>\r\n\r\n<p>Новый вопрос на голосование<br />\r\nакыакыак</p>\r\n\r\n<p><strong>4.1. Проект решения номер 1.</strong></p>\r\n\r\n<p>Первый проект решения<br />\r\nГолосовали:<br />\r\n&laquo;За&raquo; - 5 голосов: Паламар yandex Администратор Максим Голосующий Член Органа 1 Голосующий Член Органа 2 Пупкин Василий ;<br />\r\n&laquo;Против&raquo; - 0 голосов;<br />\r\n&laquo;Воздержался&raquo; - 0 голосов;<br />\r\n<br />\r\nПо итогам голосования ПРИНЯТО РЕШЕНИЕ: Первый проект решения</p>\r\n\r\n<p>Подсчет голосов производился с использованием системы документооборота Comitet24.ru. Результаты подсчета проверены.</p>\r\n\r\n<p>Председатель Коллегиальный орган №1 _____подпись____ Паламар yandex</p>\r\n\r\n<p>Секретарь Коллегиальный орган №1 _____подпись____ Администратор Максим</p>\r\n',327,1,1,'2015-07-16 01:21:50','2015-07-16 01:28:47',21);
/*!40000 ALTER TABLE `comitet_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_users`
--

DROP TABLE IF EXISTS `comitet_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_users` (
  `comitet_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL COMMENT '1 - председатель, 2-секретарь, 3-член, 4-участник, 5-эксперт',
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`comitet_id`,`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_users`
--

LOCK TABLES `comitet_users` WRITE;
/*!40000 ALTER TABLE `comitet_users` DISABLE KEYS */;
INSERT INTO `comitet_users` VALUES (1,1,2,2),(1,3,3,3),(1,5,3,4),(1,9,4,6),(1,10,4,7),(1,13,3,5),(1,21,1,1),(1,27,3,8),(9,1,1,1),(9,28,2,2),(9,29,3,3),(9,30,3,4);
/*!40000 ALTER TABLE `comitet_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_voting_members2user`
--

DROP TABLE IF EXISTS `comitet_voting_members2user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_voting_members2user` (
  `comitet_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comitet_id`,`user_id`),
  KEY `fk_comitet_voting_members2user_user_id` (`user_id`),
  CONSTRAINT `fk_comitet_voting_members2user_comitet_id` FOREIGN KEY (`comitet_id`) REFERENCES `comitet_comitet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comitet_voting_members2user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_voting_members2user`
--

LOCK TABLES `comitet_voting_members2user` WRITE;
/*!40000 ALTER TABLE `comitet_voting_members2user` DISABLE KEYS */;
INSERT INTO `comitet_voting_members2user` VALUES (5,2),(1,3),(1,5),(1,13),(1,27),(9,29),(9,30);
/*!40000 ALTER TABLE `comitet_voting_members2user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitet_votting`
--

DROP TABLE IF EXISTS `comitet_votting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comitet_votting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comitet_id` int(11) DEFAULT NULL,
  `instance_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vote_type` tinyint(1) DEFAULT '0' COMMENT '1 - за, 2 - против, 3 - воздержался',
  `date_create` datetime DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`),
  KEY `comitet_id` (`comitet_id`),
  KEY `question_id` (`question_id`),
  KEY `meeting_id` (`meeting_id`),
  KEY `project_id` (`project_id`),
  KEY `UK_comitet_votting` (`question_id`,`project_id`,`user_id`),
  CONSTRAINT `fk_votting2comitet` FOREIGN KEY (`comitet_id`) REFERENCES `comitet_comitet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_votting2instance` FOREIGN KEY (`instance_id`) REFERENCES `instances_instance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_votting2meeting` FOREIGN KEY (`meeting_id`) REFERENCES `comitet_meeting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_votting2project` FOREIGN KEY (`project_id`) REFERENCES `comitet_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_votting2question` FOREIGN KEY (`question_id`) REFERENCES `comitet_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitet_votting`
--

LOCK TABLES `comitet_votting` WRITE;
/*!40000 ALTER TABLE `comitet_votting` DISABLE KEYS */;
INSERT INTO `comitet_votting` VALUES (1,1,1,7,11,4,1,1,'2014-05-09 12:10:09','2014-05-09 12:10:09'),(2,1,1,7,13,4,3,1,'2014-05-09 12:59:22','2014-05-09 12:59:22'),(3,1,1,7,20,4,5,1,'2014-05-09 12:59:29','2014-05-09 12:59:29'),(4,1,1,7,20,4,21,1,'2014-05-09 12:59:33','2014-05-09 12:59:33'),(5,1,1,7,20,4,13,1,'2014-05-09 12:59:37','2014-05-09 12:59:37'),(6,1,1,9,21,5,1,1,'2014-05-12 12:46:22','2014-05-12 12:46:22'),(13,1,1,10,42,9,21,1,'2014-06-20 10:47:37','2014-06-20 10:47:37'),(14,1,1,10,42,9,1,1,'2014-06-20 10:47:44','2014-06-20 10:47:44'),(15,1,1,10,42,9,3,1,'2014-06-20 10:47:59','2014-06-20 10:47:59'),(16,1,1,10,42,9,5,1,'2014-06-20 10:48:06','2014-06-20 10:48:06'),(17,1,1,10,42,9,13,1,'2014-06-20 10:48:12','2014-06-20 10:48:12'),(18,1,1,10,42,9,27,1,'2014-06-20 10:48:19','2014-06-20 10:48:19'),(19,1,1,27,50,11,21,1,'2015-03-10 02:26:36','2015-03-10 02:26:36'),(20,1,1,27,50,11,1,1,'2015-03-10 02:26:52','2015-03-10 02:26:52'),(21,1,1,27,50,11,3,1,'2015-03-10 02:27:19','2015-03-10 02:27:19'),(22,1,1,27,50,11,5,1,'2015-03-10 02:27:45','2015-03-10 02:27:45'),(23,1,1,27,50,11,13,1,'2015-03-10 02:28:23','2015-03-10 02:28:23'),(24,1,1,11,51,11,21,1,'2015-03-10 02:34:35','2015-03-10 02:34:35'),(25,1,1,11,51,11,1,1,'2015-03-10 02:34:54','2015-03-10 02:34:54'),(26,1,1,11,51,11,3,1,'2015-03-10 02:35:21','2015-03-10 02:35:21'),(27,1,1,11,51,11,5,1,'2015-03-10 02:35:31','2015-03-10 02:35:31'),(28,1,1,11,51,11,13,1,'2015-03-10 02:35:42','2015-03-10 02:35:42'),(29,1,1,15,44,11,1,1,'2015-03-10 02:37:02','2015-03-10 02:37:02'),(30,1,1,15,44,11,3,1,'2015-03-10 02:37:20','2015-03-10 02:37:20'),(31,1,1,15,44,11,5,1,'2015-03-10 02:37:24','2015-03-10 02:37:24'),(32,1,1,15,44,11,13,1,'2015-03-10 02:37:28','2015-03-10 02:37:28'),(33,1,1,15,45,11,1,2,'2015-03-10 02:37:46','2015-03-10 02:37:46'),(34,1,1,16,41,11,21,1,'2015-03-10 02:48:30','2015-03-10 02:48:30'),(35,1,1,16,41,11,1,1,'2015-03-10 02:48:39','2015-03-10 02:48:39'),(36,1,1,16,41,11,3,1,'2015-03-10 02:49:11','2015-03-10 02:49:11'),(37,1,1,16,41,11,5,1,'2015-03-10 02:49:50','2015-03-10 02:49:50'),(38,1,1,16,41,11,27,1,'2015-03-10 02:50:21','2015-03-10 02:50:21'),(39,1,1,16,41,11,13,1,'2015-03-10 02:50:34','2015-03-10 02:50:34'),(40,1,1,16,40,11,1,2,'2015-07-16 01:19:35','2015-07-16 01:19:35');
/*!40000 ALTER TABLE `comitet_votting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_access`
--

DROP TABLE IF EXISTS `files_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(50) DEFAULT NULL,
  `expiration` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `author` FOREIGN KEY (`author_id`) REFERENCES `user_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `file` FOREIGN KEY (`file_id`) REFERENCES `files_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_access`
--

LOCK TABLES `files_access` WRITE;
/*!40000 ALTER TABLE `files_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `files_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_file`
--

DROP TABLE IF EXISTS `files_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `external_id` varchar(255) NOT NULL,
  `comitet_id` int(10) DEFAULT '0',
  `bucket` varchar(255) DEFAULT NULL,
  `author_id` int(10) DEFAULT '0',
  `parent_file_id` int(10) DEFAULT '0',
  `version_id` int(10) DEFAULT '0',
  `instance_id` int(10) DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `date_upload` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_file`
--

LOCK TABLES `files_file` WRITE;
/*!40000 ALTER TABLE `files_file` DISABLE KEYS */;
INSERT INTO `files_file` VALUES (78,'1/40c337d4639e837a45666282445185da.jpg','http://files.loc/comitet24/images','img01.jpg',0,'images',0,0,0,0,0,NULL),(79,'1/e592b59e66d8038addcb1334807c4fa1.jpg','http://files.loc/comitet24/images','img05.jpg',0,'images',0,0,0,0,0,NULL),(80,'1/e3bee292947c203aa986f07d12d20bee.jpg','http://files.loc/comitet24/images','img05.jpg',0,'images',0,0,0,0,0,NULL),(81,'1/e429f5f6f4ef57e4b62b82a125f67711.jpg','http://files.loc/comitet24/images','img02.jpg',0,'images',0,0,0,0,0,NULL),(82,'1/ce1e4d41b00be6aeae2acc719eec7659.jpg','http://files.loc/comitet24/images','img05.jpg',0,'images',0,0,0,0,0,NULL),(83,'1/511ca997c9cad65750b303b2ad97f7ce.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(84,'1/e8395ea9af14ab35b44efcc86da15497.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(85,'1/be37c6cf9f3cff4efe49ae19d4b71ef0.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(86,'1/553822fbc733ac9ffa7f85a986b932c5.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(87,'1/824a553f90786eb64349a354682f066c.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(88,'1/52b5894a6f0bf5ec39bd6297fcdfab3f.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(89,'1/f844821dcf384049f28cd716f6b773ed.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(90,'1/1594342ab3abfc5cca30d16e2d7ddbeb.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(91,'1/9aa4be8263eb8319ad17f1980393cad5.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(92,'1/ab3a36b701b925325398d15d7e0996a7.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(93,'1/e28714f5900ccd936287de903885156d.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(94,'1/fc080f05de74a15f7af423ce2b57d028.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(95,'1/d051d8cadf36e8af42df8eece41ebac7.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(96,'1/9a15fb033cd817a8a661ebc442c7f8de.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(97,'1/4fdad8348c81737e12b6e0ea62ec0dcd.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(98,'1/b170c3b0cd94b5d462ba03608a48b0ea.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(99,'1/c01a4b6f90bee5d39643c62ba1327612.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(100,'1/b6935b4d6b0220abf6c418fe5b22bd4e.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(101,'1/8c8ee327e5458acb3208d4171450a9ba.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(102,'1/5d40df3abd6b33f4ade6a64ac6cdc19d.png','http://files.loc/comitet24/files','logo.png',0,'files',0,0,0,0,0,NULL),(103,'1/0759ba5ee5658189b68072ca725c3163.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(104,'1/eaa8addaed6b3912e1f9b35902734681.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(105,'1/7814e292ea71206e68d98efb7bbb6d09.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(106,'1/68c85b5aab9ea4f4e4f6987ee13217a4.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(107,'1/c0f41fa68b9b08e3346651ba3ca65913.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(108,'1/6792dcd8cfe2a7fe4849f17f701c2272.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(109,'1/2575941c4d171127a13eb1986237e99a.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(110,'1/47623a1c944faca03b1fd70bc5581987.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(111,'1/f8cdb5215138b48266e8f37ecf4a021c.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(112,'1/daad65e054f04c53b10d0e5f6863d325.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(113,'1/62472918b251c0ec43c9736e2d912d12.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(114,'1/e0c614a415bd20c4f35faea916b783b5.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(115,'1/892989799f30bf71328a432dda078b6e.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(116,'1/e90d8c7a39e15e905d8cba7347abe7e9.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(117,'1/ff353a5f1e8207ea5f0cec8411030a72.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(118,'1/27bfde16f4b77d10b4b4c70f109c902a.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(119,'1/16a06a78cf4f1ca18045881f995023e8.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(120,'1/a61984080902fc7ecca3b4e608dfe547.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(121,'1/27ff0b028154c4945ea5e1d0cfdb7ada.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(122,'1/017046eab96175e386f618d67fb5954f.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(123,'1/3ac6ec66a1f21996d0ddcf1e5d0b2552.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(124,'1/38600613cb9159b3919a45c7a00732f4.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(125,'1/f00d7c54e231b5da2822fc296e44c8f9.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(126,'1/bca83fd146de755bdd855f01bd11462f.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(127,'1/03df8815651e8a53ab72f2501e488949.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(128,'1/18992dc93433f6da0a1daab819e7f149.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(129,'1/a4587f58dfbe7e625b843b20622dde52.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(130,'1/8b5618523c18da65e7ad9d850c30b0f1.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(131,'1/16fb70184cb64e57b814ffc241aff972.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(132,'1/29467ae45deb13a3ea9a8235b9b71d30.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(133,'1/f9905841d55d474a719dd803e664792c.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(134,'1/645956a0c62a5bdf642a087f23b8eceb.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(135,'1/c69f32ecb93efe465115e55d1718e2a6.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(136,'1/db4ff8a1236dcd428b2af25a0bc90c2d.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(137,'1/76552734e6ee67ea4dae56fd76a6f92a.png','http://files.loc/comitet24/files','logo.png',0,'files',0,0,0,0,0,NULL),(138,'1/ecb506c37a1371f9d6afd508dae84670.png','http://files.loc/comitet24/files','logo.png',0,'files',0,0,0,0,0,NULL),(139,'1/984c93d4cfd88df807b0dd38c1b9e4ec.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(140,'1/bfedd066b3ca406563c14bbbbb35b551.png','http://files.loc/comitet24/files','logo.png',0,'files',0,0,0,0,0,NULL),(141,'1/1b16fb8fe9c050391048cdb56bdfb724.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(142,'1/c96349933f93f0820853f2462b9a09c2.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(143,'1/9a06b60a8d61dc62a11186ec6fcb733f.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(144,'1/ad32b289fcfc431a05333112cb37ffd5.jpg','http://files.loc/comitet24/files','nologo.jpg',0,'files',0,0,0,0,0,NULL),(145,'1/cef741d82bad914e569875ae5f26de41.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(146,'1/a022f54d875662c3a3643536b64eba0c.png','http://files.loc/comitet24/files','icons.png',0,'files',0,0,0,0,0,NULL),(147,'1/57177480ce8c1b5383302ac91ea8c43a.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(148,'1/91acc2ecb4c87fd8586aa6962a132207.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(149,'1/01b59cb903a57af5411830a8fb887ec9.png','http://files.loc/comitet24/files','logo.png',0,'files',0,0,0,0,0,NULL),(150,'1/9627df55e5e4ab9c09c1cc4f5d22a1ed.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(151,'4/1206db57e47d9265640d4275ff75bef8.docx','http://files.loc/comitet24/files','Техническое задание Комитет24.docx',0,'files',0,0,0,0,0,NULL),(152,'4/51aa82213992fc7ec9dd8a0c154d24bc.xlsx','http://files.loc/comitet24/files','Перечень функциональности Комитет24.xlsx',0,'files',0,0,0,0,0,NULL),(153,'4/1b0f425b6d75ef7c2fafc3340ab26076.docx','http://files.loc/comitet24/files','Техническое задание Комитет24.docx',0,'files',0,0,0,0,0,NULL),(154,'4/69bb334677bd80b6d03acef693b36073.docx','http://files.loc/comitet24/files','Техническое задание Комитет24.docx',0,'files',0,0,0,0,0,NULL),(155,'4/b05c56d0bf33d38e92e9aa9b1b025449.docx','http://files.loc/comitet24/files','Техническое задание Комитет24.docx',0,'files',5,0,0,4,0,NULL),(156,'4/b9b1f5bc8c95fe123787c098c1f13b9e.docx','http://files.loc/comitet24/files','Техническое задание Комитет24.docx',0,'files',5,0,0,4,0,NULL),(157,'1/3e23b71c74c131553ef6f8076db13c42.docx','http://files.loc/comitet24/files','Техническое задание Комитет24.docx',0,'files',0,0,0,0,0,NULL),(158,'1/0157938dcde882192cd66c8319fc7b4b.docx','http://files.loc/comitet24/files','Техническое задание Комитет24.docx',0,'files',0,0,0,0,0,NULL),(159,'3/6a9ddf3f17c4fec0e5b2ef3c0912d713.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',3,0,0,3,0,NULL),(160,'1/c7aa85042679cbe0f3b90567a6c1a069.png','http://files.loc/comitet24/files','icons.png',0,'files',1,0,0,1,0,NULL),(161,'1/5716b45cadd998f1f20e7a8c1110c5af.png','http://files.loc/comitet24/files','icons.png',0,'files',0,0,0,0,0,NULL),(162,'1/69cbf2470e0d322d501f31df22e87e11.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(163,'1/1b5b6f9851931f572bb2ad2401028d65.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(164,'1/69ca5fd3edcfd7bf57dd10b8878d07af.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(165,'1/378ae092d24beaa3f44ed2755fbff9b4.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(166,'1/8e4374757f8565a8578b049b8237421c.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(167,'1/1b2b34f827b60d2814d4b773decfbc4a.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(168,'1/9577416b7dab38de6de2f7d03445e115.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(169,'1/196560ae5aa4abf59ec477498fba79f2.png','http://files.loc/comitet24/files','icons.png',0,'files',0,0,0,0,0,NULL),(170,'1/8a2c88cc312404f8cf428c858d6169ec.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(171,'1/a101aabe69662d9cba3c1858d64ce6d9.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(172,'1/d6a81b502ef1cabc646af0b5ec110c63.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(173,'1/1f892d37f7fd27745001036ec2787cc5.png','http://files.loc/comitet24/files','logo.png',0,'files',0,0,0,0,0,NULL),(174,'1/bf8b7175510e33c9552839b0095a98ff.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(175,'1/9665a771778b3619ad24768b39b5ecf6.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(176,'1/722e4e22520d6738ed52f707256faa7c.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(177,'1/56abea6197d41f1caa2b35764835e4bb.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(178,'1/920ea27e4627a515beaec481d199ee3e.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(179,'1/df4a8e926c9e583df3db581bf5d5e09e.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(180,'1/c99974ff27b5ff6a8ccade2d771a8746.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(181,'1/5b9bb655ad7a23eb1b8b7a42789c0e0b.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(182,'1/bc6b6291fdffccb83f83a180f4321bd9.gif','http://files.loc/comitet24/files','loader.gif',0,'files',0,0,0,0,0,NULL),(183,'1/0782d4758b3ba9c4c1721ad06c44e559.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(184,'1/a406ea33dda620471732079226dd34f8.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(185,'1/29e309bc32e6bc61cbc67f2a304edcd0.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(186,'1/f3dee98ba26c20b13b636d1192b19e34.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(187,'1/4ca0b411f19c7f5c5182606211347667.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(188,'1/9bd832ba7e67c1b3bf6a29e81a435e55.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(189,'1/e01d31b35f4fe383209d384dc042517b.gif','http://files.loc/comitet24/files','loader_smaller.gif',0,'files',0,0,0,0,0,NULL),(190,'1/3c6deb1039f4142d14e3aaea02df2223.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(191,'1/ebd81b49eb9e0f4ccbf4225b313b79c4.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(192,'1/4be29463e2bcb5c1bb08d289f782977f.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(193,'1/45e302259e66687bbfdd33726cf10f22.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(194,'1/a5ed9a0f4493dca2006c1e806d5d87a6.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(195,'1/f102f248c5f35b6413301477ea3452b3.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(196,'1/731cb497a8020dc9e823b44aa7fa7848.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(197,'1/9f1ebb1fc059156942ccc2e2b9b75a9a.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(198,'1/40f8d7d9cad45d596256480c515da676.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(199,'1/518e89cd3613705b3d7ce0377676b41b.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(200,'1/927da28ca52584e00ebb87184dad8d31.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(201,'1/0cf6dd2546bfcd43e99dde4145ceae13.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(202,'1/35476c36c659d8aa83bec52f7c28018b.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(203,'1/4d70f5a1004d5af472d8c27a65502a93.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(204,'1/e601acca3e8aa8e17ab8c26c1d07aef3.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(205,'1/87f005c1ea2626bff44b72de09ec9e77.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(206,'1/49046f0b4a489ab2e15a756d2117cd16.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(207,'1/3c4dc4ea73b52ed2c608d9a418f76e85.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(208,'1/5b2f655de74f527b444daf5c2711259c.jpg','http://files.loc/comitet24/files','nologo.jpg',0,'files',0,0,0,0,0,NULL),(209,'1/6c92b4a403db71d9c19e3de49be5e52f.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(210,'1/fddb881b8471c3ba06ceb804f90b5939.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(211,'1/2d05b9034e43d134655fc97812f9ab39.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(212,'1/50d860c66bb0e1327910f830c748e503.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(213,'1/7f08558fd13ad1603a40436c4c1e3f3c.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(214,'1/494517f3d18b4279dac8588aa673fc17.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(215,'1/19fdf903a7bd5c73c2f5868069dba503.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(216,'1/b3823490093ebe500cb2bfbc502b624a.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(217,'1/ee0b342ffd5a02ae09c96b2dddc8787e.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(218,'1/e1e766dcd4e56cd1a928bd9b20cab67d.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(219,'1/4aa7165b24d587b84ff0e5ed55dbed64.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(220,'1/65b792f1c07bd2f9c942795b65bed5d3.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(221,'1/978bfdd47fe2441c2a47bc2e116b5aaf.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(222,'1/a87a10b3276bb822fb69dcaa891c2527.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(223,'1/1736ead8d047bd3dfa2b46b65bdc4b94.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(224,'1/505530740e52274a9286163c5dfd10a0.gif','http://files.loc/comitet24/files','loader.gif',0,'files',0,0,0,0,0,NULL),(225,'1/2a7cfa16c14634054db2e52d6c0d7bd0.DS_Store','http://files.loc/comitet24/files','.DS_Store',0,'files',0,0,0,0,0,NULL),(226,'1/55581a1ba0c0625cd3b602c04202dfa0.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(227,'1/377205ca773e53e1e3e9e437916be326.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',0,0,0,0,0,NULL),(228,'1/f54ef20175cbf0871caba426da08e736.DS_Store','http://files.loc/comitet24/files','.DS_Store',0,'files',0,0,0,0,0,NULL),(229,'1/dd0350aaa25935c4e91e2fb5ac2616d2.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(230,'1/4b2d2647157e2a677e038650f1375088.png','http://files.loc/comitet24/files','icons.png',0,'files',0,0,0,0,0,NULL),(231,'1/707bdb9ba12b854a4550cdad5c68cc49.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(232,'1/06bb47cc1b810ae6eca4e595d4e2b01d.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(233,'1/df273352abaca108ecf5ad451fd99dce.jpg','http://files.loc/comitet24/files','img03.jpg',0,'files',0,0,0,0,0,NULL),(234,'1/da933fa35df1536b3643b4544613c22c.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(235,'1/dd68e0abbde57544a2b8a9143030a196.gif','http://files.loc/comitet24/files','loader.gif',0,'files',0,0,0,0,0,NULL),(236,'1/6172217f645cebf17ca5aecbf9c7abb8.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(237,'1/270c4e50eb8ef594e3b48907cc08a303.png','http://files.loc/comitet24/files','logo.png',0,'files',1,0,0,1,0,NULL),(238,'1/93b8a8fbbf058f1b4c88d91b4ce0ca21.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(239,'1/6e503a2297c37e50d2973ed87f03105c.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(240,'1/26b9d25b87e14298df81cb4afa27ec82.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(241,'1/b1d967d67d99592cac4ce84ace189438.jpg','http://files.loc/comitet24/files','nologo.jpg',0,'files',1,0,0,1,0,NULL),(242,'1/35af08945d6a68e6cd0acea1f38967ab.png','http://files.loc/comitet24/files','logo.png',0,'files',1,0,0,1,0,NULL),(243,'1/ad80f98e09584679d2677a1c5b5f7d01.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(244,'1/8d250b68d357e8d141e2b35c09532bb3.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(245,'1/bda3bd442857785dc1cdedf73069008d.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(246,'1/d0a8b0aaa1483ead20b6db3c0d2dbea3.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(247,'1/5d4bb8567967b04403f712471c691299.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',0,0,0,0,0,NULL),(248,'1/192c982cb2b006779b905c63c7bb6fd8.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(249,'1/750da38eec3043b32d39bf5832dcadf6.jpg','http://files.loc/comitet24/files','ava01.jpg',0,'files',0,0,0,0,0,NULL),(250,'1/5256e44598e099ee0722316c19b16cae.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',1,0,0,1,0,NULL),(251,'1/eec20ab2186bf715870a174cd8b8b83b.docx','http://files.loc/comitet24/files','Yandex money Анкета магазина .docx',0,'files',1,0,0,1,0,NULL),(252,'1/1f87695f0fc49bc17a0e3c6cd6f3846d.docx','http://files.loc/comitet24/files','Yandex money Анкета магазина .docx',0,'files',0,0,0,0,0,NULL),(253,'1/d69d585b315b28c3e17ce51dad6ed188.docx','http://files.loc/comitet24/files','Yandex money Анкета магазина .docx',0,'files',0,0,0,0,0,NULL),(254,'1/e6bbe245558d91d06fae9008b7a758be.pdf','http://files.loc/comitet24/files','CURREVENT_DEVELOPMENT.pdf',0,'files',1,0,0,1,0,NULL),(255,'1/9a4c954044c06c19baa7afe4f276d07a.pdf','http://files.loc/comitet24/files','CURREVENT_DEVELOPMENT.pdf',0,'files',0,0,0,0,0,NULL),(256,'1/d90b5f2bb06fe93efa3d63415f81928d.pdf','http://files.loc/comitet24/files','CURREVENT_DEVELOPMENT.pdf',0,'files',0,0,0,0,0,NULL),(257,'1/4fd09f23cf65bb23551416a5bb108fef.png','http://files.loc/comitet24/files','icons.png',0,'files',0,0,0,0,0,NULL),(258,'1/c2a499c55ec3a7e173d8d320b56292c8.png','http://files.loc/comitet24/files','icons.png',0,'files',0,0,0,0,0,NULL),(259,'1/c254cc269e4fc20e119e7d9467292c83.jpg','http://files.loc/comitet24/files','img01.jpg',0,'files',0,0,0,0,0,NULL),(260,'1/362efe6c352d24efd13f69f4b05657b1.jpg','http://files.loc/comitet24/files','img02.jpg',0,'files',0,0,0,0,0,NULL),(261,'protocol_4.pdf','http://files.loc/comitet24/pdf','protocol_4.pdf',0,'pdf',1,0,0,1,0,NULL),(262,'1/8cc9e92f63e4b0f906f724a86bdb10ed.jpg','http://files.loc/comitet24/images','img01.jpg',0,'images',1,0,0,1,0,NULL),(263,'1/1b0318301e41e17e444635a005e3cf44.jpg','http://files.loc/comitet24/images','img01.jpg',0,'images',1,0,0,1,0,NULL),(264,'1/c85fb2c40ee71221f14638670e38d9b8.png','images','ruxon_cms_logo.png',0,'images',1,0,0,1,0,NULL),(265,'1/b56efadd3577a40047436af86bb0f1d6.jpg','http://files.loc/comitet24/images','ava01.jpg',0,'images',1,0,0,1,0,NULL),(266,'1/035885de6371204393c3865ba631ecbe.jpg','http://files.loc/comitet24/images','ava01.jpg',0,'images',1,0,0,1,0,NULL),(267,'protocol_5.doc','http://personal.comitet24.loc/uploads/pdf','protocol_5.doc',0,'pdf',1,0,0,1,0,NULL),(268,'1/5929e6d6d1a64a3dae23f288691c3a29.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',1,0,0,1,0,NULL),(269,'1/b7e552fe66fb685371f97f5d92e74abd.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',1,0,0,1,0,NULL),(270,'1/8280c38a3deec4681b376b4f0b2c6b05.jpg','http://files.loc/comitet24/files','img04.jpg',0,'files',1,0,0,1,0,NULL),(271,'1/371b84e6727a713cf8ae483d51386c13.jpg','http://files.loc/comitet24/files','img05.jpg',0,'files',1,0,0,1,0,NULL),(272,'1/5714290835078a68e4964c4bda6afd24.docx','http://files.loc/comitet24/files','Прочти в первую очередь.docx',0,'files',1,0,0,1,0,NULL),(273,'22/35406aafbc0b0ae3c3c09b48e325fe9a.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(274,'22/885cd60045859cdd68c5b1c0f40b811b.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(275,'22/2848ce85ae2a7e2dbf6abec7f3d2e928.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(276,'22/002e608ef7c2a10affed25fb7c85fad9.jpg','http://personal.comitet24.loc/uploads/files','Заседание - Добавить время.jpg',0,'files',0,0,0,0,0,NULL),(277,'22/4c94d1e079d67b56ff8e2b65e11433c5.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(278,'22/6cc0102120d37b3a9a2af8ea7fcc5d12.jpg','http://personal.comitet24.loc/uploads/files','Заседание - Добавить время.jpg',0,'files',0,0,0,0,0,NULL),(279,'22/bfedc4b372a7e2d01a002adffb096170.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(280,'22/607e7581150b29efcf8eb048c3741492.jpg','http://personal.comitet24.loc/uploads/files','Заседание - Добавить время.jpg',0,'files',0,0,0,0,0,NULL),(281,'22/8d847c0076ee82443925cbe642c7f59e.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(282,'22/a6e22be530fb3fa0e3fe05b976da2ab1.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(283,'22/58141b632adf2ce747f1b458f2c0cb8a.jpg','http://personal.comitet24.loc/uploads/files','Заседание - Добавить время.jpg',0,'files',0,0,0,0,0,NULL),(284,'22/e68f1107128f9ee35ad81626a402562d.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(285,'22/8b1794f23fb363bf6661390a61bae010.docx','http://personal.comitet24.loc/uploads/files','Алгоритм формирования протокола.docx',0,'files',27,0,0,22,0,NULL),(286,'22/11308c84b33ca62da12b73e5d0012fb1.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(287,'22/23c92b8f607bbe4358955f85932e864d.jpg','http://personal.comitet24.loc/uploads/files','Заседание - Добавить время.jpg',0,'files',0,0,0,0,0,NULL),(288,'22/2bf58abeb59db756d35dbb78493b85ff.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',27,0,0,22,0,NULL),(289,'22/e95fd2fdd4a7f0c05049a4092641425b.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(290,'22/9930b2ec3e077a792ad8d40b615e45a8.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(291,'22/a2c5f78ade81fd53441d37ee1cdc0648.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(292,'22/7fd53523a14e366316186db4466c7891.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(293,'22/7ebf8b2e9911e54b47eea6e83b92ca52.docx','http://personal.comitet24.loc/uploads/files','Алгоритм формирования протокола.docx',0,'files',0,0,0,0,0,NULL),(294,'22/bcd1e9dee771c27e6a82ecf546564d1c.jpg','http://personal.comitet24.loc/uploads/files','Заседание - Добавить время.jpg',0,'files',0,0,0,0,0,NULL),(295,'22/a3de6d321224bc9459c2214993fb7e5e.docx','http://personal.comitet24.loc/uploads/files','Алгоритм формирования протокола.docx',0,'files',27,0,0,22,0,NULL),(296,'22/31fd6d711b59e51ab3efb0ad5f66854d.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',27,0,0,22,0,NULL),(297,'22/94edec99438b9c9994445fda0fe3973b.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',27,0,0,22,0,NULL),(298,'22/62cea2f9f6f9229bba605b85c2a6f5f1.docx','http://personal.comitet24.loc/uploads/files','Алгоритм формирования протокола.docx',0,'files',27,0,0,22,0,NULL),(299,'22/cf8ee37abc18d9cc52cc59da88c62e2b.txt','http://personal.comitet24.loc/uploads/files','Приоритет работ.txt',0,'files',0,0,0,0,0,NULL),(300,'22/73f12998a6f13ffa28621a3778e73bdb.docx','http://personal.comitet24.loc/uploads/files','Алгоритм формирования протокола.docx',0,'files',0,0,0,0,0,NULL),(301,'22/cb4d585b626fd6ab9cae9e3a2ca656bd.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(302,'22/06016d5d27748aabd6591bac75386579.docx','http://personal.comitet24.loc/uploads/files','Алгоритм формирования протокола.docx',0,'files',0,0,0,0,0,NULL),(303,'22/952a66dd759ec7e474cc631599bb18dc.zip','http://personal.comitet24.loc/uploads/files','ckeditor_4.4.0_c0ce9ddcdf8e.zip',0,'files',0,0,0,0,0,NULL),(304,'22/ab40b21f65d7ac9528cbd84374b41c12.docx','http://personal.comitet24.loc/uploads/files','Техническое задание Листоход финал.docx',0,'files',0,0,0,0,0,NULL),(305,'22/d613fef316a7b92efaa9d843376ee2ee.docx','http://personal.comitet24.loc/uploads/files','Алгоритм формирования протокола.docx',0,'files',0,0,0,0,0,NULL),(306,'protocol_5.doc','http://personal.comitet24.loc/uploads/pdf','protocol_5.doc',0,'pdf',21,0,0,16,0,NULL),(307,'1/91d43f84296f6bfe985f3233d0ad195e.docx','files','Техническое задание Листоход финал.docx',1,'files',1,0,0,1,0,NULL),(308,'1/bee064c6e9e73078c1150c5c7e639328.docx','files','Алгоритм формирования протокола.docx',1,'files',1,0,0,1,0,NULL),(309,'1/120bb826ecd82ed0545be2b90935e04e.docx','files','Техническое задание Листоход финал.docx',1,'files',0,0,0,0,0,NULL),(310,'1/59d724a6efee6212d6b619b659862df8.docx','files','Возможности Листоход.docx',1,'files',0,0,0,0,0,NULL),(311,'16/protocol_4.doc','pdf','protocol_4.doc',1,'pdf',21,0,0,16,0,NULL),(312,'16/protocol_4.doc','pdf','protocol_4.doc',1,'pdf',21,0,0,16,0,NULL),(313,'16/protocol_7.doc','pdf','protocol_7.doc',16,'pdf',21,0,0,16,0,NULL),(314,'1/protocol_8.doc','pdf','protocol_8.doc',1,'pdf',1,0,0,1,0,NULL),(315,'1/protocol_9.doc','pdf','protocol_9.doc',1,'pdf',1,0,0,1,0,NULL),(316,'16/protocol_10.doc','pdf','protocol_10.doc',16,'pdf',21,0,0,16,0,NULL),(317,'1/290a0190de28a22afa6126a865f5f7b8.docx','files','Главная страница Comitet24.docx',1,'files',1,0,0,1,0,NULL),(318,'1/fbad27f02fb32435cfcbd9ee4e662f65.jpg','files','2013-03-19-13.05_MIN.jpg',1,'files',0,0,0,0,0,NULL),(319,'1/82c01aff1bf8d9329689705f828b94cb.jpg','files','2013-03-19-13.05_MIN.jpg',1,'files',0,0,0,0,0,NULL),(320,'1/a6678405215218169a262d44a67d9405.jpg','files','2013-03-19-13.05_MIN.jpg',1,'files',0,0,0,0,0,NULL),(321,'1/38b4230b02d518bf3edfceb4c3a6d605.jpg','files','2013-03-19-13.05_MIN.jpg',1,'files',0,0,0,0,0,NULL),(322,'1/f7fdd7f215154ce2faaaf831521e66f3.php','files','index.php',1,'files',0,0,0,0,0,NULL),(323,'1/67a127d05e0e71d5bc7b1c3b663c343d.jpg','images','logoВИМКОМ.jpg',0,'images',1,0,0,1,10884,NULL),(324,'1/c686eda3426f49438b98240043db29ad.JPG','images','logoВИМКОМ.JPG',0,'images',1,0,0,1,10884,NULL),(325,'1/9cfea2fae46df5010c205c43532dce7e.jpg','files','0002948506EE-849x565.jpg',1,'files',1,0,0,1,300032,NULL),(326,'1/59fd20593c405f82ba924dadb70d6995.JPG','files','IMG_0013.JPG',1,'files',0,0,0,0,90733,NULL),(327,'1/protocol_11.doc','pdf','protocol_11.doc',1,'pdf',1,0,0,1,7532,'2015-07-16 01:29:56');
/*!40000 ALTER TABLE `files_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instances_instance`
--

DROP TABLE IF EXISTS `instances_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instances_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` text NOT NULL,
  `author_id` int(10) DEFAULT '0',
  `type_id` int(10) DEFAULT '0',
  `pay_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `fk_instance2author` FOREIGN KEY (`author_id`) REFERENCES `user_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_instance2type` FOREIGN KEY (`type_id`) REFERENCES `instances_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instances_instance`
--

LOCK TABLES `instances_instance` WRITE;
/*!40000 ALTER TABLE `instances_instance` DISABLE KEYS */;
INSERT INTO `instances_instance` VALUES (1,'',1,1,'2014-03-31 20:43:03',1),(2,'',2,1,'2014-03-28 15:46:30',1),(3,'',3,1,'2014-03-28 16:08:51',1),(4,'',5,1,'2014-04-25 15:50:45',1),(5,'',9,1,'2014-04-25 15:50:45',1),(6,'',10,1,'2014-04-25 15:50:45',1),(7,'',11,1,'2014-04-25 15:56:15',1),(8,'',12,1,'2014-04-25 16:00:14',1),(9,'',13,1,'2014-04-26 13:51:24',1),(16,'',21,1,'2014-04-26 15:54:59',1),(17,'',22,1,'2014-04-26 18:16:48',1),(18,'',23,1,'2014-05-05 18:26:17',1),(19,'',24,1,'2014-05-05 18:57:34',1),(20,'',25,1,'2014-05-05 20:48:45',1),(21,'',26,1,'2014-05-05 21:18:11',1),(22,'',27,1,'2014-05-21 08:58:18',1),(23,'',28,1,'2014-05-29 11:27:07',1),(24,'',29,1,'2014-05-29 11:27:33',1),(25,'',30,1,'2014-05-29 11:27:52',1),(26,'',31,1,'2014-07-03 10:43:45',1),(27,'',32,1,'2014-07-03 10:43:48',1),(28,'',34,1,'2014-07-03 10:48:56',1),(32,'',41,2,'2014-07-10 10:34:35',1),(33,'',42,2,'2014-07-10 10:34:44',1),(34,'',43,2,'2014-07-10 10:34:48',1),(35,'',44,1,'2014-07-21 10:22:38',1),(36,'',45,1,'2014-07-21 10:25:41',1),(37,'',46,1,'2014-07-22 12:26:50',1),(38,'',47,1,'2014-08-12 11:25:47',1),(42,'',52,1,'2014-09-21 13:09:18',1),(43,'',53,1,'2014-10-27 07:58:05',1);
/*!40000 ALTER TABLE `instances_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instances_type`
--

DROP TABLE IF EXISTS `instances_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instances_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instances_type`
--

LOCK TABLES `instances_type` WRITE;
/*!40000 ALTER TABLE `instances_type` DISABLE KEYS */;
INSERT INTO `instances_type` VALUES (1,'Внутренний'),(2,'Битрикс24');
/*!40000 ALTER TABLE `instances_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_modules`
--

DROP TABLE IF EXISTS `main_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_modules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `module_alias` varchar(255) DEFAULT NULL,
  `description` text,
  `installed` tinyint(1) DEFAULT '0',
  `system` tinyint(1) DEFAULT '0',
  `sort` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_modules`
--

LOCK TABLES `main_modules` WRITE;
/*!40000 ALTER TABLE `main_modules` DISABLE KEYS */;
INSERT INTO `main_modules` VALUES (1,'Главный модуль','main',NULL,1,1,100),(2,'Структура','structure','',1,0,200),(3,'Пользователь','user','',1,0,300),(4,'Права доступа','rights','',1,0,400),(7,'Инструменты','tools','',1,0,1500),(9,'Формы','forms','',0,0,900),(11,'Поиск','search','',1,0,1100),(13,'Пользователи','users','',1,0,1300),(14,'Экземпляры','instance',NULL,1,0,1400),(15,'Коллегиальные органы','comitet',NULL,1,0,1500),(16,'Уведомления','notifications',NULL,1,0,1600),(17,'Файлы','files',NULL,1,0,1700),(18,'Что нового','publications',NULL,1,1,250),(19,'Приложения','api',NULL,1,1,1800);
/*!40000 ALTER TABLE `main_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_item`
--

DROP TABLE IF EXISTS `notifications_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `customizable` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_item`
--

LOCK TABLES `notifications_item` WRITE;
/*!40000 ALTER TABLE `notifications_item` DISABLE KEYS */;
INSERT INTO `notifications_item` VALUES (4,'Регистрация пользователя','Добро пожаловать на сайт Comitet24','registration','',0),(5,'Регистрация через социальную сеть','Добро пожаловать на сайт Comitet24','registrationSocial','',0),(6,'Восстановление пароля','Восстановление пароля на сайте Comitet24','recovery','',0),(7,'Завтра заседание Comitet24.ru','Завтра заседание Comitet24.ru','meetingTomorrow','',1),(8,'Сегодня заседание Comitet24.ru','Сегодня заседание Comitet24.ru','meetingToday','',1),(9,'Регистрация по приглашению','Приглашение в Сомитет24','registrationByInvitation','',0),(10,'Голосование в Comitet24.ru','Голосование в Comitet24.ru','votting','',0),(11,'Новое Заседание Comitet24','Назначено Заседание Comitet24','meeting','',0),(12,'Задать вопрос','Задать вопрос','toAsk','',0),(13,'Три дня Премиум аккаунта Comitet24.ru','Три дня Премиум аккаунта Comitet24.ru','threeDaysPremiumAccount','',0),(14,'Подписан протокол ','Подписан протокол \"$comitet\" \"$company\" о заседаниии $date можете ознакомиться с материалом','signedProtocol','',0),(15,'Новый проект решения к моим вопросам','Новый проект решения к моим вопросам','NewProjectOnMyQuestions','',1),(16,'Увольнение из Комитета','Увольнение из Комитета','delMember','',0),(17,'Новый вопрос','Новый вопрос','newQuestion','',1),(18,'Новый комментарий к моим вопросам','Новый комментарий к моим вопросам','NewCommentOnMyQuestions','',1),(19,'Новый комментарий к чужим вопросам','Новый комментарий к чужим вопросам','NewCommentOnOtherQuestions','',1),(20,'Новый проект решения к чужим вопросам','Новый проект решения к чужим вопросам','NewProjectOnOtherQuestions','',1);
/*!40000 ALTER TABLE `notifications_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_item2user`
--

DROP TABLE IF EXISTS `notifications_item2user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_item2user` (
  `notification_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notification_id`,`user_id`),
  KEY `fk_notifications_item2user_user_id` (`user_id`),
  CONSTRAINT `fk_notifications_item2user_notification_id` FOREIGN KEY (`notification_id`) REFERENCES `notifications_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_notifications_item2user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_item2user`
--

LOCK TABLES `notifications_item2user` WRITE;
/*!40000 ALTER TABLE `notifications_item2user` DISABLE KEYS */;
INSERT INTO `notifications_item2user` VALUES (7,52),(8,52),(15,52),(17,52),(18,52),(19,52),(20,52),(7,53),(8,53),(15,53),(17,53),(18,53),(19,53),(20,53);
/*!40000 ALTER TABLE `notifications_item2user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_categories`
--

DROP TABLE IF EXISTS `publications_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `alias` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_categories`
--

LOCK TABLES `publications_categories` WRITE;
/*!40000 ALTER TABLE `publications_categories` DISABLE KEYS */;
INSERT INTO `publications_categories` VALUES (1,'Новости','news');
/*!40000 ALTER TABLE `publications_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_category_item`
--

DROP TABLE IF EXISTS `publications_category_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications_category_item` (
  `category_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_category_item`
--

LOCK TABLES `publications_category_item` WRITE;
/*!40000 ALTER TABLE `publications_category_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications_category_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_comments`
--

DROP TABLE IF EXISTS `publications_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `content` text NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`post_id`),
  KEY `author_id` (`author_id`),
  KEY `root` (`root`),
  KEY `lft` (`lft`),
  KEY `rgt` (`rgt`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_comments`
--

LOCK TABLES `publications_comments` WRITE;
/*!40000 ALTER TABLE `publications_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_comments_rating`
--

DROP TABLE IF EXISTS `publications_comments_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications_comments_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 + ; 2 - ;',
  PRIMARY KEY (`id`),
  KEY `author_id_comment_id` (`author_id`,`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_comments_rating`
--

LOCK TABLES `publications_comments_rating` WRITE;
/*!40000 ALTER TABLE `publications_comments_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications_comments_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_lookup`
--

DROP TABLE IF EXISTS `publications_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_lookup`
--

LOCK TABLES `publications_lookup` WRITE;
/*!40000 ALTER TABLE `publications_lookup` DISABLE KEYS */;
INSERT INTO `publications_lookup` VALUES (1,'Черновик',1,'PostStatus',1),(2,'Опубликован',2,'PostStatus',2),(3,'В архиве',3,'PostStatus',3),(4,'Ожидает проверки',1,'CommentStatus',1),(5,'Проверен',2,'CommentStatus',2);
/*!40000 ALTER TABLE `publications_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_posts`
--

DROP TABLE IF EXISTS `publications_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `alias` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `video` text NOT NULL,
  `audio` varchar(128) NOT NULL,
  `link` varchar(128) NOT NULL,
  `tags` text NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `image` varchar(128) NOT NULL DEFAULT '',
  `main_image` varchar(128) NOT NULL DEFAULT '',
  `show_on_main` tinyint(1) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_author` (`author_id`),
  KEY `FK_post_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_posts`
--

LOCK TABLES `publications_posts` WRITE;
/*!40000 ALTER TABLE `publications_posts` DISABLE KEYS */;
INSERT INTO `publications_posts` VALUES (2,'Запуск проекта Комитет24','hello_friends','Запуск публичной версии проекта.','','','','',2,1330588482,1415077437,1,1,'2014-08-15 11:42:14','','',0,1,1),(4,'Интеграция с Битрикс24','integraciya-s-bitriks24','Теперь наш сервис интегрирован с системой коллективной работы - Битрикс24.<br />Установить приложение на свой портал вы можете на странице <a target=\"_blank\" href=\"http://www.bitrix24.ru/apps/?app=pimax.comitet24\">http://www.bitrix24.ru/apps/?app=pimax.comitet24  </a>','','','','',2,1415076409,1415077467,1,1,'2014-10-10 00:00:00','','',0,0,1);
/*!40000 ALTER TABLE `publications_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_rating`
--

DROP TABLE IF EXISTS `publications_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 + ; 2 - ;',
  PRIMARY KEY (`id`),
  KEY `author_id_post_id` (`author_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_rating`
--

LOCK TABLES `publications_rating` WRITE;
/*!40000 ALTER TABLE `publications_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_tags`
--

DROP TABLE IF EXISTS `publications_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `frequency` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_tags`
--

LOCK TABLES `publications_tags` WRITE;
/*!40000 ALTER TABLE `publications_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_types`
--

DROP TABLE IF EXISTS `publications_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `alias` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_types`
--

LOCK TABLES `publications_types` WRITE;
/*!40000 ALTER TABLE `publications_types` DISABLE KEYS */;
INSERT INTO `publications_types` VALUES (1,'Текстовый пост','text'),(2,'Видео пост','video'),(3,'Аудио пост','audio'),(4,'Галерея','image'),(5,'Ссылка','link');
/*!40000 ALTER TABLE `publications_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights_assignment`
--

DROP TABLE IF EXISTS `rights_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights_assignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `rights_assignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `rights_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights_assignment`
--

LOCK TABLES `rights_assignment` WRITE;
/*!40000 ALTER TABLE `rights_assignment` DISABLE KEYS */;
INSERT INTO `rights_assignment` VALUES ('Admin','1',NULL,'N;'),('Authenticated','2',NULL,'N;');
/*!40000 ALTER TABLE `rights_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights_item`
--

DROP TABLE IF EXISTS `rights_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights_item`
--

LOCK TABLES `rights_item` WRITE;
/*!40000 ALTER TABLE `rights_item` DISABLE KEYS */;
INSERT INTO `rights_item` VALUES ('Admin',2,'Администратор',NULL,'N;'),('Authenticated',2,'Зарегистрированный пользователь','return !Yii::app()->user->isGuest;','N;'),('Comment.*',1,'Все действия с комментариями',NULL,'N;'),('Comment.Approve',0,'Подтверждение комментариев',NULL,'N;'),('Comment.Delete',0,'Удаление комментариев',NULL,'N;'),('Comment.Update',0,'Редактирование комментариев',NULL,'N;'),('CommentAdministration',1,'Администрирование комментариев',NULL,'N;'),('Editor',2,'Модератор',NULL,'N;'),('Guest',2,'Гость',NULL,'N;'),('Post.*',1,'Все действия с публикациями',NULL,'N;'),('Post.Admin',0,'Администрирование публикаций',NULL,'N;'),('Post.Create',0,'Создание публикаций',NULL,'N;'),('Post.Delete',0,'Удаление публикаций',NULL,'N;'),('Post.Update',0,'Редактирование публикаций',NULL,'N;'),('Post.View',0,'Просмотр публикаций',NULL,'N;'),('PostAdministrator',1,'Администрирование публикаций',NULL,'N;'),('PostUpdateOwn',0,'Редактирование своих публикаций','return Yii::app()->user->id==$params[\"userid\"];','N;');
/*!40000 ALTER TABLE `rights_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights_itemchild`
--

DROP TABLE IF EXISTS `rights_itemchild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights_itemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `rights_itemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `rights_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rights_itemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `rights_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights_itemchild`
--

LOCK TABLES `rights_itemchild` WRITE;
/*!40000 ALTER TABLE `rights_itemchild` DISABLE KEYS */;
INSERT INTO `rights_itemchild` VALUES ('Editor','Authenticated'),('CommentAdministration','Comment.*'),('Editor','CommentAdministration'),('Authenticated','Guest'),('PostAdministrator','Post.*'),('PostAdministrator','Post.Admin'),('Authenticated','Post.Create'),('PostAdministrator','Post.Create'),('PostAdministrator','Post.Delete'),('PostAdministrator','Post.Update'),('Guest','Post.View'),('Editor','PostAdministrator'),('Authenticated','PostUpdateOwn');
/*!40000 ALTER TABLE `rights_itemchild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights_rights`
--

DROP TABLE IF EXISTS `rights_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights_rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`),
  CONSTRAINT `rights_rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `rights_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights_rights`
--

LOCK TABLES `rights_rights` WRITE;
/*!40000 ALTER TABLE `rights_rights` DISABLE KEYS */;
INSERT INTO `rights_rights` VALUES ('Authenticated',2,1),('Editor',2,0),('Guest',2,2);
/*!40000 ALTER TABLE `rights_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structure_pages`
--

DROP TABLE IF EXISTS `structure_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structure_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(5) DEFAULT NULL,
  `root` int(11) DEFAULT NULL,
  `type_id` int(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `content` text,
  `template_id` int(11) DEFAULT NULL,
  `meta_keywords` text,
  `meta_description` text,
  `site_id` int(10) DEFAULT NULL,
  `allow_index` tinyint(1) NOT NULL DEFAULT '1',
  `show_in_menu` tinyint(1) NOT NULL DEFAULT '1',
  `show_in_sitemap` tinyint(1) NOT NULL DEFAULT '1',
  `title_in_menu` varchar(128) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lft` (`lft`),
  KEY `rgt` (`rgt`),
  KEY `level` (`level`),
  KEY `name` (`name`),
  KEY `root` (`root`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structure_pages`
--

LOCK TABLES `structure_pages` WRITE;
/*!40000 ALTER TABLE `structure_pages` DISABLE KEYS */;
INSERT INTO `structure_pages` VALUES (1,1,6,1,1,1,'/',1393313543,'/','Главная','Последние публикации','Персональный сайт','Главная страница первого сайта',NULL,NULL,NULL,1,1,1,1,'',NULL),(4,2,3,2,1,2,'wave',1320072801,'/wave','Публикации','Публикации','Публикации','',0,NULL,NULL,1,1,1,1,'',NULL),(12,4,5,2,1,4,'map',1320072801,'/map','Карта сайта','Карта сайта','Карта сайта','',NULL,NULL,NULL,1,0,0,0,'',NULL),(18,1,32,1,18,3,'/',1393313521,'/','Главная','','Система IT обеспечения коллегиальных органов','Главная страница второго сайта',NULL,NULL,NULL,2,1,1,1,'',NULL),(19,2,25,2,18,8,'help',1399212295,'/help','Помощь','Помощь','','',NULL,NULL,NULL,2,1,1,1,'',NULL),(20,3,4,3,18,8,'sozdanie-kollegialnogo-organa',1399968882,'/help/sozdanie-kollegialnogo-organa','Создание/редактирование коллегиального органа','Создание коллегиального органа','','Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и \r\nвэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на \r\nлатинице с начала XVI века. В то время некий безымянный печатник создал \r\nбольшую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для \r\nраспечатки образцов. Lorem Ipsum не только успешно пережил без заметных \r\nизменений пять веков, но и перешагнул в электронный дизайн. Его \r\nпопуляризации в новое время послужили публикация листов Letraset с \r\nобразцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы \r\nэлектронной вёрстки типа Aldus PageMaker, в шаблонах которых \r\nиспользуется Lorem Ipsum',NULL,NULL,NULL,2,1,1,1,'','http://youtu.be/TIy3n2b7V9k'),(22,5,6,3,18,8,'rabochiy-stol',1399212607,'/help/rabochiy-stol','Рабочий стол','Рабочий стол','','',NULL,NULL,NULL,2,1,1,1,'',NULL),(23,7,8,3,18,8,'sozdanie-novogo-voprosa',1399969020,'/help/sozdanie-novogo-voprosa','Создание/редактирование/обсуждение вопроса','Создание/редактирование/обсуждение вопроса','','',NULL,NULL,NULL,2,1,1,1,'',''),(24,9,10,3,18,8,'sozdanie-zasedaniya',1399968942,'/help/sozdanie-zasedaniya','Новое заседание','Новое заседание','','',NULL,NULL,NULL,2,1,1,1,'',''),(25,26,27,2,18,1,'works',1399215180,'/works','Как это работает?','Как это работает?','','Очень просто!!!!',NULL,NULL,NULL,2,1,1,1,'',NULL),(26,28,29,2,18,1,'agreement',1399302616,'/agreement','Условия обслуживания Comitet24','Условия обслуживания Comitet24','','тут будут условия!!!',NULL,NULL,NULL,2,1,1,1,'',NULL),(27,11,12,3,18,1,'kollegialnye-organy',1399968920,'/help/kollegialnye-organy','Коллегиальные органы','Коллегиальные органы','','',NULL,NULL,NULL,2,1,1,1,'',''),(28,13,14,3,18,1,'golosovanie-po-voprosu',1399968987,'/help/golosovanie-po-voprosu','Голосование по вопросу','Голосование по вопросу','','',NULL,NULL,NULL,2,1,1,1,'',''),(29,15,16,3,18,1,'formirovanie-protokola',1399969036,'/help/formirovanie-protokola','Формирование протокола','Формирование протокола','','',NULL,NULL,NULL,2,1,1,1,'',''),(30,17,18,3,18,8,'arhiv-resheniy',1406609874,'/help/arhiv-resheniy','Архив решений','Архив решений','','',NULL,NULL,NULL,2,1,1,1,'',''),(31,19,20,3,18,1,'oplata',1411291442,'/help/oplata','Оплата','Оплата','','',NULL,NULL,NULL,2,1,1,1,'',''),(32,21,22,3,18,1,'oshibki-na-sayte',1411291460,'/help/oshibki-na-sayte','Ошибки на сайте','Ошибки на сайте','','',NULL,NULL,NULL,2,1,1,1,'',''),(33,23,24,3,18,1,'drugaya-tema',1411291486,'/help/drugaya-tema','Другая тема','Другая тема','','',NULL,NULL,NULL,2,1,1,1,'',''),(34,30,31,2,18,9,'news',1415077421,'/news','Новости','Новости','Новости','',NULL,NULL,NULL,2,1,1,1,'','');
/*!40000 ALTER TABLE `structure_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structure_sites`
--

DROP TABLE IF EXISTS `structure_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structure_sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `counters` text,
  `template_id` int(10) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structure_sites`
--

LOCK TABLES `structure_sites` WRITE;
/*!40000 ALTER TABLE `structure_sites` DISABLE KEYS */;
INSERT INTO `structure_sites` VALUES (2,'listohod.dev','comitet24','Личный кабинет','',3,'ru','comitet24');
/*!40000 ALTER TABLE `structure_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structure_templates`
--

DROP TABLE IF EXISTS `structure_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structure_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `layout` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `part_template` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structure_templates`
--

LOCK TABLES `structure_templates` WRITE;
/*!40000 ALTER TABLE `structure_templates` DISABLE KEYS */;
INSERT INTO `structure_templates` VALUES (3,'Основной шаблон','main','',0);
/*!40000 ALTER TABLE `structure_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structure_types`
--

DROP TABLE IF EXISTS `structure_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structure_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `module_id` int(10) DEFAULT NULL,
  `controller_alias` varchar(255) DEFAULT NULL,
  `action_alias` varchar(255) DEFAULT NULL,
  `description` text,
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structure_types`
--

LOCK TABLES `structure_types` WRITE;
/*!40000 ALTER TABLE `structure_types` DISABLE KEYS */;
INSERT INTO `structure_types` VALUES (1,'Текстовая страница',2,'publicPage','index','',''),(2,'Публикации',5,'publicationsPublic','index','',''),(3,'Главная страница',15,'default','index','',''),(4,'Карта сайта',2,'map','index','',''),(5,'Обратная связь',2,'feedBack','index','',''),(6,'Пользователи',13,'default','index','',''),(7,'Поиск',11,'default','index','',''),(8,'Помощь',15,'help','index','',''),(9,'Новости',18,'publicationsPublic','index',NULL,NULL);
/*!40000 ALTER TABLE `structure_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_migration`
--

DROP TABLE IF EXISTS `tbl_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_migration`
--

LOCK TABLES `tbl_migration` WRITE;
/*!40000 ALTER TABLE `tbl_migration` DISABLE KEYS */;
INSERT INTO `tbl_migration` VALUES ('m000000_000000_base',1393316085),('m140225_081221_alter_structure_site',1393316139),('m140225_090509_create_intance',1393332318),('m140225_090814_create_files',1393332319),('m140225_091010_create_notifications',1393332320),('m140225_114830_create_users',1393332325),('m140225_120316_create_comitet',1393332554),('m140228_165244_alter_instance',1393606485),('m140307_120850_notifications_edit',1394194245),('m140513_080406_alter_page_add_video',1399968315);
/*!40000 ALTER TABLE `tbl_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity`
--

DROP TABLE IF EXISTS `user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `listohod_login_date` datetime DEFAULT NULL,
  `comitet24_login_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity`
--

LOCK TABLES `user_activity` WRITE;
/*!40000 ALTER TABLE `user_activity` DISABLE KEYS */;
INSERT INTO `user_activity` VALUES (1,1,NULL,'2014-11-21 07:37:17'),(2,1,NULL,'2014-11-21 07:37:44'),(3,1,'2014-11-21 08:11:47',NULL),(4,1,NULL,'2014-11-21 09:36:37'),(5,1,NULL,'2014-11-25 15:00:46'),(6,1,'2014-11-25 15:01:18',NULL),(7,1,'2014-11-27 07:04:02',NULL),(8,44,'2014-11-27 07:04:41',NULL),(9,43,'2014-11-27 07:05:13',NULL),(10,1,'2014-11-27 07:07:19',NULL),(11,44,'2014-11-27 07:30:03',NULL),(12,43,'2014-11-27 07:30:14',NULL),(13,44,'2014-11-27 07:30:43',NULL),(14,1,'2014-11-27 07:37:05',NULL),(15,1,'2014-11-27 07:39:52',NULL),(16,44,'2014-11-27 07:40:32',NULL),(17,44,'2014-11-27 07:40:53',NULL),(18,43,'2014-11-27 07:41:33',NULL),(19,1,'2014-11-27 07:41:40',NULL),(20,1,'2014-12-15 08:07:39',NULL),(21,1,'2014-12-15 08:31:34',NULL),(22,1,'2014-12-15 09:16:48',NULL),(23,1,'2014-12-15 09:16:50',NULL),(24,1,'2014-12-15 09:17:01',NULL),(25,1,'2014-12-15 09:18:19',NULL),(26,1,NULL,'2014-12-17 15:25:32'),(27,1,NULL,'2014-12-17 16:20:51'),(28,1,'2014-12-22 16:56:54',NULL),(29,1,'2015-01-27 11:46:26',NULL),(30,44,'2015-01-27 11:49:06',NULL),(31,1,'2015-01-27 11:49:28',NULL),(32,1,'2015-02-09 18:50:52',NULL),(33,44,'2015-02-09 18:51:42',NULL),(34,1,'2015-02-09 18:52:04',NULL),(35,44,'2015-02-09 18:53:59',NULL),(36,1,'2015-02-09 18:55:08',NULL),(37,44,'2015-02-09 18:55:36',NULL),(38,1,'2015-02-09 18:57:27',NULL),(39,1,NULL,'2015-02-20 16:13:07'),(40,1,'2015-02-21 18:34:41',NULL),(41,1,'2015-02-21 19:05:33',NULL),(42,1,'2015-02-21 19:18:38',NULL),(43,1,'2015-02-21 19:20:13',NULL),(44,1,'2015-02-21 19:21:25',NULL),(45,1,NULL,'2015-02-24 19:27:03'),(46,3,NULL,'2015-02-24 19:28:10'),(47,1,NULL,'2015-02-24 19:28:30'),(48,3,NULL,'2015-02-24 19:29:16'),(49,1,NULL,'2015-02-26 14:38:06'),(50,1,'2015-02-26 14:59:57',NULL),(51,1,NULL,'2015-03-03 18:35:03'),(52,53,NULL,'2015-03-10 02:25:34'),(53,1,NULL,'2015-03-10 02:25:46'),(54,1,'2015-03-13 14:29:00',NULL),(55,1,'2015-04-20 20:38:52',NULL),(56,1,NULL,'2015-06-15 22:05:42'),(57,1,'2015-07-14 22:38:58',NULL),(58,44,'2015-07-15 00:48:59',NULL),(59,1,'2015-07-15 00:49:38',NULL),(60,44,'2015-07-15 00:59:14',NULL),(61,1,'2015-07-15 00:59:47',NULL),(62,1,NULL,'2015-07-16 00:35:02'),(63,21,NULL,'2015-07-16 01:24:05'),(64,1,NULL,'2015-07-16 01:26:09'),(65,21,NULL,'2015-07-16 01:28:34'),(66,1,NULL,'2015-07-16 01:29:15'),(67,1,'2015-07-19 04:38:36',NULL),(68,1,'2015-08-07 00:15:41',NULL),(69,1,'2015-08-25 01:30:58',NULL),(70,44,'2015-08-26 01:14:26',NULL),(71,41,'2015-08-26 01:16:15',NULL),(72,44,'2015-08-26 03:13:36',NULL),(73,41,'2015-08-26 03:27:28',NULL),(74,44,'2015-08-26 03:42:50',NULL),(75,41,'2015-08-26 03:44:54',NULL),(76,1,'2015-08-26 10:34:57',NULL);
/*!40000 ALTER TABLE `user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity_archive`
--

DROP TABLE IF EXISTS `user_activity_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_activity_archive` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `month` int(11) unsigned DEFAULT '0',
  `year` int(11) unsigned DEFAULT '0',
  `listohod_activity` tinyint(1) unsigned DEFAULT '0',
  `comitet24_activity` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity_archive`
--

LOCK TABLES `user_activity_archive` WRITE;
/*!40000 ALTER TABLE `user_activity_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_activity_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_friend`
--

DROP TABLE IF EXISTS `user_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_start` datetime DEFAULT NULL,
  `instance_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `external_id` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_friend` (`instance_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_friend`
--

LOCK TABLES `user_friend` WRITE;
/*!40000 ALTER TABLE `user_friend` DISABLE KEYS */;
INSERT INTO `user_friend` VALUES (1,NULL,1,2,1),(2,NULL,1,22,2),(3,NULL,1,3,3),(4,NULL,1,5,4),(5,NULL,1,9,5),(6,NULL,1,10,6),(8,NULL,1,21,7),(9,NULL,1,1,8),(10,NULL,1,11,9),(11,NULL,1,12,10),(12,NULL,1,23,11),(13,NULL,1,13,12),(14,NULL,1,27,13),(15,NULL,1,28,14),(16,NULL,1,29,15),(17,NULL,1,30,16),(18,NULL,1,43,17),(19,NULL,42,43,1);
/*!40000 ALTER TABLE `user_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invite`
--

DROP TABLE IF EXISTS `user_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `date_userd` datetime DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `author_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `used` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_invite2author` FOREIGN KEY (`author_id`) REFERENCES `user_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_invite2user` FOREIGN KEY (`user_id`) REFERENCES `user_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invite`
--

LOCK TABLES `user_invite` WRITE;
/*!40000 ALTER TABLE `user_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log_request`
--

DROP TABLE IF EXISTS `user_log_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(10) DEFAULT '0',
  `date_request` datetime DEFAULT NULL,
  `date_response` datetime DEFAULT NULL,
  `request` text,
  `response` text,
  `error` text,
  `success` tinyint(1) DEFAULT '0',
  `failed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `fk_user_log_to_session` FOREIGN KEY (`session_id`) REFERENCES `user_log_session` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log_request`
--

LOCK TABLES `user_log_request` WRITE;
/*!40000 ALTER TABLE `user_log_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_log_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log_session`
--

DROP TABLE IF EXISTS `user_log_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `external_address` varchar(255) NOT NULL,
  `external_email` varchar(255) NOT NULL,
  `external_id` int(10) DEFAULT '0',
  `success` tinyint(1) DEFAULT '0',
  `failed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log_session`
--

LOCK TABLES `user_log_session` WRITE;
/*!40000 ALTER TABLE `user_log_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_log_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification`
--

DROP TABLE IF EXISTS `user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0',
  `notification_id` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification`
--

LOCK TABLES `user_notification` WRITE;
/*!40000 ALTER TABLE `user_notification` DISABLE KEYS */;
INSERT INTO `user_notification` VALUES (1,49,7),(2,49,8),(3,49,15),(4,49,17),(5,49,18),(6,49,19),(7,49,20);
/*!40000 ALTER TABLE `user_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_order`
--

DROP TABLE IF EXISTS `user_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` datetime DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `info` text NOT NULL,
  `user_id` int(10) DEFAULT '0',
  `payed` tinyint(1) DEFAULT '0',
  `amount` float DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_order2user` FOREIGN KEY (`user_id`) REFERENCES `user_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_order`
--

LOCK TABLES `user_order` WRITE;
/*!40000 ALTER TABLE `user_order` DISABLE KEYS */;
INSERT INTO `user_order` VALUES (1,'2014-04-30 19:43:24',NULL,'',1,0,300),(2,'2014-04-30 19:46:18',NULL,'',1,0,300),(3,'2014-04-30 19:58:31',NULL,'',1,0,300),(4,'2014-04-30 20:04:01',NULL,'',1,0,300),(5,'2014-04-30 20:04:39',NULL,'',1,0,100),(6,'2014-05-03 14:29:39',NULL,'',1,0,100),(7,'2014-05-03 14:30:22','2014-05-03 14:56:28','',1,1,100),(8,'2014-05-03 14:58:46',NULL,'',1,0,300),(9,'2014-05-19 12:02:25',NULL,'1',1,0,100),(10,'2014-05-21 08:19:17',NULL,'1',1,0,100),(11,'2014-05-30 07:21:46',NULL,'1',1,0,100),(12,'2014-05-30 07:24:59',NULL,'1',1,0,100),(13,'2014-05-30 07:26:36',NULL,'1',1,0,100),(14,'2014-05-30 07:27:29',NULL,'1',1,0,100),(15,'2014-05-30 07:28:27',NULL,'1',1,0,100),(16,'2014-05-30 07:30:47',NULL,'1',1,0,100),(17,'2014-05-30 07:33:05',NULL,'1',1,0,100),(18,'2014-05-30 07:34:40',NULL,'12',1,0,1000),(19,'2014-05-30 07:36:13',NULL,'3',1,0,300),(20,'2014-05-30 07:37:40',NULL,'1',1,0,100),(21,'2014-05-30 07:38:19',NULL,'1',1,0,100),(22,'2014-05-30 07:39:13',NULL,'6',1,0,600),(23,'2014-05-30 08:00:34',NULL,'12',1,0,1000),(24,'2014-05-30 08:01:09',NULL,'12',1,0,1000),(25,'2014-05-30 08:01:49',NULL,'12',1,0,1000),(26,'2014-05-30 08:02:46',NULL,'12',1,0,1000),(27,'2014-05-30 08:03:09',NULL,'12',1,0,1000),(28,'2014-05-30 08:03:24',NULL,'3',1,0,300);
/*!40000 ALTER TABLE `user_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profiles` (
  `user_id` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `middlename` varchar(50) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `organization` varchar(50) NOT NULL DEFAULT '',
  `post` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `patronymic` varchar(255) NOT NULL DEFAULT '',
  `position` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `avatar_color` varchar(50) DEFAULT '',
  `font_color` varchar(50) DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
INSERT INTO `user_profiles` VALUES (1,'Администратор','Максим','','+7 (495) 555-55-55','Pepsi Co Moscow','Chief Executive Officerajax','1e7be17e5e8533df6cd51b987a4275f5.JPG','','','','ad55ad','fff'),(2,'Паламар','Юрий','Владимирович','','','Программист','c7935bea43e11970f94f0c122d694bbb.jpg','','','','00BFFF','fff'),(3,'Голосующий','Член','Органа 1','','','','','','','','926fe1','fff'),(5,'Голосующий','Член','Органа 2','','','','','','','','ff0000','fff'),(9,'Участник','Органа','1','','','','','','','','ffff00','fff'),(10,'Участник','Органа','2','','','','','','','','B03060','fff'),(11,'Эксперт','1','','','','','','','','','',''),(12,'Эксперт','2','','','','','','','','','',''),(13,'Пупкин','Василий','','','','','','','','','6A5ACD','fff'),(21,'Паламар','yandex','','','','','a11f847a7c7b6377595451bb5f7f84d1.jpg','','','','30cde0','fff'),(22,'test','Юрий','','','','','','','','','00ff00','fff'),(23,'erg','erg','','','','','','','','','FFE4C4','fff'),(24,'wefwef','fwef','','','','','','','','','B03060','fff'),(25,'dfg','dfg','','','','','','','','','808000','fff'),(26,'erf','erf','','','','','','','','','00ff00','fff'),(27,'Пинюгин','Максим','','','','','','','','','808000','fff'),(28,'drgdrg','fdrg','drgdrg','','','','','','','','00BFFF','fff'),(29,'uyjuy','jutyjyu','yyujuyj','','','','','','','','800080','fff'),(30,'rdg','drg','drgdrg','','','','','','','','6A5ACD','fff'),(31,'er5','r5yr5y','','','','','','','','','8B4513','fff'),(32,'yr5yr5y','5ryr5','','','','','','','','','FFE4C4','fff'),(34,'sefsef','sef','','','','','','','','','FFD700','fff'),(41,'Паламар','Юрий','','','','','','','','','B03060','fff'),(42,'Маркелов','Евгений','Юрьевич','+7 925 5085253','','','42/c00ab1f9d63e8ed7dae4200a81a7ef26.jpg','','','','00BFFF','fff'),(43,'Пинюгин','Максим','','','','','43/839714dc8a53d9048ff4d7709443e2e4.jpg','','','','c0c0c0','fff'),(44,'erger','ewrfg','','','','','','','','','FFE4C4','fff'),(45,'petr','test','','','','','','','','','00ff00','fff'),(46,'Pinyugin','Maxim','','','','','','','','','6A5ACD','fff'),(47,'кенрка','terd','кен','','','','','','','','6A5ACD','fff'),(48,'Pinyugin','Max','','','','','','','','','808000','fff'),(49,'Pinyugin','Max','','','','','','','','','ff0000','fff'),(50,'Pinyugin','Max','','','','','','','','','30cde0','fff'),(52,'Pinyugin','Max','','','','','','','','','2F4F4F','fff'),(53,'Pinyugin','Max','','','','','','','','','800000','fff');
/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles_fields`
--

DROP TABLE IF EXISTS `user_profiles_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profiles_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `varname` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `field_size` int(3) NOT NULL DEFAULT '0',
  `field_size_min` int(3) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(5000) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `widget` varchar(255) NOT NULL DEFAULT '',
  `widgetparams` varchar(5000) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`,`widget`,`visible`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles_fields`
--

LOCK TABLES `user_profiles_fields` WRITE;
/*!40000 ALTER TABLE `user_profiles_fields` DISABLE KEYS */;
INSERT INTO `user_profiles_fields` VALUES (1,'lastname','Last Name','VARCHAR',50,0,1,'','','','','','','',1,3),(2,'firstname','First Name','VARCHAR',50,3,1,'','','Incorrect First Name (length between 3 and 50 characters).','','','','',0,3),(4,'avatar','Изображение','VARCHAR',255,0,0,'','','','','','UWimage','',5,3),(7,'patronymic','Отчество','VARCHAR',255,0,0,'','','','','','','',3,3),(9,'position','Должность','VARCHAR',255,0,0,'','','','','','','',7,0),(10,'company','Компания','VARCHAR',255,0,0,'','','','','','','',6,3),(11,'middlename','Отчество','VARCHAR',50,0,0,'','','','','','','',8,3),(12,'phone','Телефон','VARCHAR',20,0,0,'','','','','','','',9,3),(13,'organization','Организация','VARCHAR',50,0,0,'','','','','','','',10,3),(14,'post','Должность','VARCHAR',50,0,0,'','','','','','','',11,3),(15,'avatar_color','Цвет аватара','VARCHAR',50,0,0,'','','','','','','',0,3),(16,'font_color','Цвет шрифта','VARCHAR',50,0,0,'','','','','','','',0,3);
/*!40000 ALTER TABLE `user_profiles_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_users`
--

DROP TABLE IF EXISTS `user_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activkey` varchar(128) NOT NULL DEFAULT '',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `lastvisit` int(10) NOT NULL DEFAULT '0',
  `lastactivity` int(10) NOT NULL DEFAULT '0',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `rating` int(11) DEFAULT '0',
  `vkontakte_id` int(11) NOT NULL DEFAULT '0',
  `facebook_id` int(11) NOT NULL DEFAULT '0',
  `account_paid` date DEFAULT NULL,
  `listohod_paid` date DEFAULT NULL,
  `external_id` int(11) DEFAULT '0',
  `external_address` varchar(255) DEFAULT NULL,
  `external_member_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_users`
--

LOCK TABLES `user_users` WRITE;
/*!40000 ALTER TABLE `user_users` DISABLE KEYS */;
INSERT INTO `user_users` VALUES (1,'m.pinyugin@gmail.com','01cb1ed2f3ba8c6d2310a40804e0f9d5','m.pinyugin@gmail.com','8e7a82ddcba99dd334a0d6490254ff03',1261146094,1440574497,1440574516,1,1,2,0,0,'2015-09-23','2015-09-23',0,NULL,NULL),(2,'palamarffjura@gmail.com','6c5ac7b4d3bd3311f033f971196cfa75','palamarffjura@gmail.com','e37cc388d7186c1ad2f9dd05ef531143',1395058254,1399621365,1395058255,0,1,0,0,0,'2014-05-09',NULL,0,NULL,NULL),(3,'palamarjura@mail.ru','6c5ac7b4d3bd3311f033f971196cfa75','palamarjura@mail.ru','71c0ee4c7410bd82b2ad762db2960cb3',1396015731,1424791756,1424791756,0,1,0,0,0,'2015-01-01',NULL,0,NULL,NULL),(5,'test@gmail.com','6c5ac7b4d3bd3311f033f971196cfa75','test@gmail.com','b3af26a73907a88bdefdd0c06c781c7b',0,1398435223,1398437703,0,1,0,0,0,NULL,NULL,0,NULL,NULL),(9,'test2@gmail.com','6c5ac7b4d3bd3311f033f971196cfa75','test2@gmail.com','747a6f4a3235704d6feebbc5c39c3057',0,0,1414988735,0,1,0,0,0,'2014-05-15',NULL,0,NULL,NULL),(10,'test3@gmail.com','6c5ac7b4d3bd3311f033f971196cfa75','test3@gmail.com','92a15b43bfc5d6f4ef22de41e67a1769',0,1398430005,0,0,1,0,0,0,NULL,NULL,0,NULL,NULL),(11,'test4@gmail.com','6c5ac7b4d3bd3311f033f971196cfa75','test4@gmail.com','80addedf121c2fde096d8760ee1a5716',0,0,0,0,1,0,0,0,NULL,NULL,0,NULL,NULL),(12,'test5@gmail.com','6c5ac7b4d3bd3311f033f971196cfa75','test5@gmail.com','4ab58974eff6327789c1fae007aced8c',0,1398506626,0,0,1,0,0,0,NULL,NULL,0,NULL,NULL),(13,'test6@gmail.com','6c5ac7b4d3bd3311f033f971196cfa75','test6@gmail.com','6c51e12c8d09f37f669e73300c2a1b6c',0,1398509526,0,0,1,0,0,0,NULL,NULL,0,NULL,NULL),(21,'JuraPalamar@yandex.ua','6c5ac7b4d3bd3311f033f971196cfa75','JuraPalamar@yandex.ua','311d8f84f8f07e0338b7a261f59e6c83',0,1436995714,1436995727,0,1,0,0,0,'2016-04-29',NULL,0,NULL,NULL),(22,'test7@gmail.com','6c5ac7b4d3bd3311f033f971196cfa75','test7@gmail.com','fb53497f8de5d6c46c4f072151914eee',0,0,0,0,1,0,0,0,NULL,NULL,0,NULL,NULL),(23,'palamarjurDa@gmail.com','6c5ac7b4d3bd3311f033f971196cfa75','palamarjurDa@gmail.com','208edcc1c921665c6631cd5699e735ae',0,0,0,0,1,0,0,0,NULL,NULL,0,NULL,NULL),(24,'sdasd@sf.sdf','6c5ac7b4d3bd3311f033f971196cfa75','sdasd@sf.sdf','9771ba28c38da58d201d4cf294067d72',1399301854,1399301854,0,0,1,0,0,0,NULL,NULL,0,NULL,NULL),(25,'addfgmin@sdf.fsdf','6c5ac7b4d3bd3311f033f971196cfa75','addfgmin@sdf.fsdf','be4f4d266ca94f480efbfc9e31fdc875',1399308525,1399308525,0,0,1,0,0,0,NULL,NULL,0,NULL,NULL),(26,'admin@sdf.ddd','6c5ac7b4d3bd3311f033f971196cfa75','admin@sdf.ddd','239259e7a88f970f14702815783ed0be',1399310291,1399310291,0,0,1,0,0,0,NULL,NULL,0,NULL,NULL),(27,'pinyugin@yandex.ru','6c5ac7b4d3bd3311f033f971196cfa75','pinyugin@yandex.ru','385882d05973fac60b53a9edd2255bfc',0,1404982847,1404982855,0,1,0,0,0,'2014-06-21',NULL,0,NULL,NULL),(28,'fsrgdrg@grdgdr.ru','6c5ac7b4d3bd3311f033f971196cfa75','fsrgdrg@grdgdr.ru','75506368bf9718aa6b25ffc1650fdd10',0,0,0,0,1,0,0,0,'2014-06-29',NULL,0,NULL,NULL),(29,'hftbhygj@feffrdfg.ru','6c5ac7b4d3bd3311f033f971196cfa75','hftbhygj@feffrdfg.ru','8e4b0e92996ee80e8192d852d8281d84',0,0,0,0,1,0,0,0,'2014-06-29',NULL,0,NULL,NULL),(30,'lioill@fgrtgt.ru','6c5ac7b4d3bd3311f033f971196cfa75','lioill@fgrtgt.ru','a318136766f608ea2fd97301a17a7628',0,0,0,0,1,0,0,0,'2014-06-29',NULL,0,NULL,NULL),(31,'mffp@ipimax.ru','6c5ac7b4d3bd3311f033f971196cfa75','mffp@ipimax.ru','1370480b1d1896d9d9c6dac41b3a2eae',0,1404448750,1404449285,0,1,0,0,0,'2014-08-03','2014-08-03',0,NULL,NULL),(32,'comitet24-secretary@mail.ru','6c5ac7b4d3bd3311f033f971196cfa75','comitet24-secretary@mail.ru','0ac5dafb90802b6607d9d406cfddac47',0,0,0,0,1,0,0,0,'2014-08-03','2014-08-03',0,NULL,NULL),(34,'mp@ruxon.ru','6c5ac7b4d3bd3311f033f971196cfa75','mp@ruxon.ru','380eb18da5a64f1f234003d00bcf34bb',0,1407997877,1407997879,0,1,0,0,0,'2014-08-03','2014-08-03',0,NULL,NULL),(41,'palamarjura@gmail.com','01cb1ed2f3ba8c6d2310a40804e0f9d5','palamarjura@gmail.com','8caa87f1c6fb81d1abd9ce0727bf5137',0,1440549894,1440574473,0,1,0,0,0,'2014-08-10','2014-08-10',5,NULL,NULL),(42,'5085253@gmail.com','66f7261e6a354cf08927f79344fe52c2','5085253@gmail.com','02ffdc3f85372bce90a1225ff9b8f5fe',0,0,0,0,1,0,0,0,'2014-08-10','2014-08-10',3,NULL,NULL),(43,'mp@ipimax.ru','6c5ac7b4d3bd3311f033f971196cfa75','mp@ipimax.ru','306213ad749102a40e6a4add0fc1a29f',0,1417059693,1417059693,0,1,0,0,0,'2015-08-10','2015-08-10',1,NULL,NULL),(44,'comitet24-expert@mail.ru','01cb1ed2f3ba8c6d2310a40804e0f9d5','comitet24-expert@mail.ru','96d68e65a0c32dd2bcd8ad4311c038ff',0,1440549770,1440549816,0,1,0,0,0,'2014-08-21','2015-08-21',0,NULL,NULL),(45,'first2@mail.ru','6c5ac7b4d3bd3311f033f971196cfa75','first2@mail.ru','b09ae19331093f553a6366bfd01eaa29',0,1405927888,1405927905,0,1,0,0,0,'2014-08-21','2014-08-21',0,NULL,NULL),(46,'max@pinyugin.ru','6c5ac7b4d3bd3311f033f971196cfa75','max@pinyugin.ru','52f12756c83e047049329ae200f828b1',1406017610,1406017760,1406017760,0,1,0,0,0,'2014-08-22','2014-08-22',0,NULL,NULL),(47,'gdrdrgdr@fewfdr.ru','7b59be9abe11a031dbfbc50201bf157e','gdrdrgdr@fewfdr.ru','688cd7fe7f874d0015aaa7cb21686a23',0,0,0,0,1,0,0,0,NULL,NULL,0,NULL,NULL),(52,'ipimax@mail.ru','6c5ac7b4d3bd3311f033f971196cfa75','ipimax@mail.ru','75cacf1dfaf8eb2f0ad786c8073efd1d',1411290558,1411290584,1411290934,0,1,0,0,0,'2015-01-01',NULL,0,NULL,NULL),(53,'office@ipimax.ru','b8a162d45080d73da6ca3ba970e2e0a8','office@ipimax.ru','a6cfcaacdb66f7d6b63b21c43c974be8',1414382284,1425939934,1425939934,0,1,0,0,0,'2015-01-01','2015-01-01',0,NULL,NULL),(54,'','','','',0,0,0,0,0,0,0,0,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `user_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiisession`
--

DROP TABLE IF EXISTS `yiisession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yiisession` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiisession`
--

LOCK TABLES `yiisession` WRITE;
/*!40000 ALTER TABLE `yiisession` DISABLE KEYS */;
INSERT INTO `yiisession` VALUES ('7774181598d4ff47bdf2c33654a09041',1436997278,'c8b2ddfaf0054dd49ec2bb668119ddb5__id|s:1:\"1\";c8b2ddfaf0054dd49ec2bb668119ddb5__name|s:20:\"m.pinyugin@gmail.com\";c8b2ddfaf0054dd49ec2bb668119ddb5__states|a:0:{}');
/*!40000 ALTER TABLE `yiisession` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-26 12:19:54
