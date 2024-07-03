-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: super_bbs
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `celery_task_logs`
--

DROP TABLE IF EXISTS `celery_task_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celery_task_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_name` varchar(128) DEFAULT NULL,
  `task_id` varchar(64) DEFAULT NULL,
  `retval` text,
  `done` tinyint(1) DEFAULT NULL,
  `task_status` tinyint(1) DEFAULT NULL,
  `exc` text,
  `einfo` text,
  `args` text,
  `kwargs` text,
  `available` tinyint(1) DEFAULT '1',
  `time_done` datetime DEFAULT NULL,
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_task_logs`
--

/*!40000 ALTER TABLE `celery_task_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_task_logs` ENABLE KEYS */;

--
-- Table structure for table `comment_like`
--

DROP TABLE IF EXISTS `comment_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_like`
--

/*!40000 ALTER TABLE `comment_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_like` ENABLE KEYS */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `topic_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text NOT NULL,
  `like_count` int DEFAULT '0',
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

--
-- Table structure for table `passports`
--

DROP TABLE IF EXISTS `passports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `data` varchar(256) DEFAULT NULL,
  `token` varchar(64) NOT NULL,
  `expire` datetime DEFAULT NULL,
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `passports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passports`
--

/*!40000 ALTER TABLE `passports` DISABLE KEYS */;
/*!40000 ALTER TABLE `passports` ENABLE KEYS */;

--
-- Table structure for table `sub_tab_fav`
--

DROP TABLE IF EXISTS `sub_tab_fav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_tab_fav` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_tab_id` int NOT NULL,
  `user_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_tab_fav`
--

/*!40000 ALTER TABLE `sub_tab_fav` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_tab_fav` ENABLE KEYS */;

--
-- Table structure for table `sub_tabs`
--

DROP TABLE IF EXISTS `sub_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_tabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) DEFAULT NULL,
  `tab_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  `zh` varchar(128) NOT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `sort_num` int DEFAULT '100',
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `zh` (`zh`),
  UNIQUE KEY `uid` (`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_tabs`
--

/*!40000 ALTER TABLE `sub_tabs` DISABLE KEYS */;
INSERT INTO `sub_tabs` VALUES (1,'1',1,'Cpp','C++','C++板块',100,1,'2024-07-01 15:34:43','2024-07-01 16:00:35');
/*!40000 ALTER TABLE `sub_tabs` ENABLE KEYS */;

--
-- Table structure for table `tabs`
--

DROP TABLE IF EXISTS `tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `zh` varchar(128) NOT NULL,
  `sort_num` int DEFAULT '100',
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `zh` (`zh`),
  UNIQUE KEY `uid` (`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabs`
--

/*!40000 ALTER TABLE `tabs` DISABLE KEYS */;
INSERT INTO `tabs` VALUES (1,'1','tech','科技',1,1,'2024-07-01 14:31:01','2024-07-01 14:31:01');
/*!40000 ALTER TABLE `tabs` ENABLE KEYS */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) DEFAULT NULL,
  `name` varchar(256) NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

--
-- Table structure for table `topic_appends`
--

DROP TABLE IF EXISTS `topic_appends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic_appends` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) DEFAULT NULL,
  `topic_id` int NOT NULL,
  `content` text NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_appends`
--

/*!40000 ALTER TABLE `topic_appends` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_appends` ENABLE KEYS */;

--
-- Table structure for table `topic_fav`
--

DROP TABLE IF EXISTS `topic_fav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic_fav` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int NOT NULL,
  `user_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_fav`
--

/*!40000 ALTER TABLE `topic_fav` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_fav` ENABLE KEYS */;

--
-- Table structure for table `topic_like`
--

DROP TABLE IF EXISTS `topic_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int NOT NULL,
  `user_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_like`
--

/*!40000 ALTER TABLE `topic_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_like` ENABLE KEYS */;

--
-- Table structure for table `topic_to_tag`
--

DROP TABLE IF EXISTS `topic_to_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic_to_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `topic_to_tag_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`),
  CONSTRAINT `topic_to_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_to_tag`
--

/*!40000 ALTER TABLE `topic_to_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_to_tag` ENABLE KEYS */;

--
-- Table structure for table `topic_up_down`
--

DROP TABLE IF EXISTS `topic_up_down`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic_up_down` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int NOT NULL,
  `user_id` int NOT NULL,
  `action` tinyint(1) NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_up_down`
--

/*!40000 ALTER TABLE `topic_up_down` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_up_down` ENABLE KEYS */;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) DEFAULT NULL,
  `user_id` int NOT NULL,
  `title` varchar(256) NOT NULL,
  `content` text,
  `content_length` int DEFAULT NULL,
  `tab_id` int NOT NULL,
  `sub_tab_id` int NOT NULL,
  `last_reply_user_id` int DEFAULT NULL,
  `last_reply_time` datetime DEFAULT NULL,
  `view_count` int DEFAULT '0',
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;

--
-- Table structure for table `user_fav_user`
--

DROP TABLE IF EXISTS `user_fav_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_fav_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fav_user_id` int NOT NULL,
  `user_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fav_user_id` (`fav_user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_fav_user_ibfk_1` FOREIGN KEY (`fav_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_fav_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_fav_user`
--

/*!40000 ALTER TABLE `user_fav_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_fav_user` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(256) NOT NULL,
  `sex` int DEFAULT '0',
  `avatar_url` varchar(32) DEFAULT NULL,
  `role_id` int DEFAULT '0',
  `site` varchar(256) DEFAULT NULL,
  `location` varchar(256) DEFAULT NULL,
  `company` varchar(256) DEFAULT NULL,
  `github` varchar(256) DEFAULT NULL,
  `twitter` varchar(256) DEFAULT NULL,
  `weibo` varchar(256) DEFAULT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `privacy_level` int DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'3f97913c7960','test','test','pbkdf2:sha256:150000$1GRy4Bgr$4d3e280ad32d57a68a3852c610f3ea918b31e11967cdd818246a516cabe30b29',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,'2024-07-03 10:19:58','2024-07-03 10:19:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Dumping routines for database 'super_bbs'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-03 10:56:21
