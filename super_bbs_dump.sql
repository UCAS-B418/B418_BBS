-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: super_bbs
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
-- Table structure for table `super_bbs_celery_task_logs`
--

DROP TABLE IF EXISTS `super_bbs_celery_task_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_celery_task_logs` (
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
-- Dumping data for table `super_bbs_celery_task_logs`
--

LOCK TABLES `super_bbs_celery_task_logs` WRITE;
/*!40000 ALTER TABLE `super_bbs_celery_task_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_celery_task_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_comment_like`
--

DROP TABLE IF EXISTS `super_bbs_comment_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_comment_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_comment_like`
--

LOCK TABLES `super_bbs_comment_like` WRITE;
/*!40000 ALTER TABLE `super_bbs_comment_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_comment_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_comments`
--

DROP TABLE IF EXISTS `super_bbs_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_comments` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_comments`
--

LOCK TABLES `super_bbs_comments` WRITE;
/*!40000 ALTER TABLE `super_bbs_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_passports`
--

DROP TABLE IF EXISTS `super_bbs_passports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_passports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `data` varchar(256) DEFAULT NULL,
  `token` varchar(64) NOT NULL,
  `expire` datetime DEFAULT NULL,
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `super_bbs_passports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `super_bbs_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_passports`
--

LOCK TABLES `super_bbs_passports` WRITE;
/*!40000 ALTER TABLE `super_bbs_passports` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_passports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_sub_tab_fav`
--

DROP TABLE IF EXISTS `super_bbs_sub_tab_fav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_sub_tab_fav` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_tab_id` int NOT NULL,
  `user_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_sub_tab_fav`
--

LOCK TABLES `super_bbs_sub_tab_fav` WRITE;
/*!40000 ALTER TABLE `super_bbs_sub_tab_fav` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_sub_tab_fav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_sub_tabs`
--

DROP TABLE IF EXISTS `super_bbs_sub_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_sub_tabs` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_sub_tabs`
--

LOCK TABLES `super_bbs_sub_tabs` WRITE;
/*!40000 ALTER TABLE `super_bbs_sub_tabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_sub_tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_tabs`
--

DROP TABLE IF EXISTS `super_bbs_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_tabs` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_tabs`
--

LOCK TABLES `super_bbs_tabs` WRITE;
/*!40000 ALTER TABLE `super_bbs_tabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_tags`
--

DROP TABLE IF EXISTS `super_bbs_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_tags` (
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
-- Dumping data for table `super_bbs_tags`
--

LOCK TABLES `super_bbs_tags` WRITE;
/*!40000 ALTER TABLE `super_bbs_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_topic_appends`
--

DROP TABLE IF EXISTS `super_bbs_topic_appends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_topic_appends` (
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
-- Dumping data for table `super_bbs_topic_appends`
--

LOCK TABLES `super_bbs_topic_appends` WRITE;
/*!40000 ALTER TABLE `super_bbs_topic_appends` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_topic_appends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_topic_fav`
--

DROP TABLE IF EXISTS `super_bbs_topic_fav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_topic_fav` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int NOT NULL,
  `user_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_topic_fav`
--

LOCK TABLES `super_bbs_topic_fav` WRITE;
/*!40000 ALTER TABLE `super_bbs_topic_fav` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_topic_fav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_topic_like`
--

DROP TABLE IF EXISTS `super_bbs_topic_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_topic_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int NOT NULL,
  `user_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_topic_like`
--

LOCK TABLES `super_bbs_topic_like` WRITE;
/*!40000 ALTER TABLE `super_bbs_topic_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_topic_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_topic_to_tag`
--

DROP TABLE IF EXISTS `super_bbs_topic_to_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_topic_to_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `super_bbs_topic_to_tag_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `super_bbs_topics` (`id`),
  CONSTRAINT `super_bbs_topic_to_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `super_bbs_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_topic_to_tag`
--

LOCK TABLES `super_bbs_topic_to_tag` WRITE;
/*!40000 ALTER TABLE `super_bbs_topic_to_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_topic_to_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_topic_up_down`
--

DROP TABLE IF EXISTS `super_bbs_topic_up_down`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_topic_up_down` (
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
-- Dumping data for table `super_bbs_topic_up_down`
--

LOCK TABLES `super_bbs_topic_up_down` WRITE;
/*!40000 ALTER TABLE `super_bbs_topic_up_down` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_topic_up_down` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_topics`
--

DROP TABLE IF EXISTS `super_bbs_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_topics` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_topics`
--

LOCK TABLES `super_bbs_topics` WRITE;
/*!40000 ALTER TABLE `super_bbs_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_user_fav_user`
--

DROP TABLE IF EXISTS `super_bbs_user_fav_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_user_fav_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fav_user_id` int NOT NULL,
  `user_id` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  `time_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fav_user_id` (`fav_user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `super_bbs_user_fav_user_ibfk_1` FOREIGN KEY (`fav_user_id`) REFERENCES `super_bbs_users` (`id`),
  CONSTRAINT `super_bbs_user_fav_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `super_bbs_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_user_fav_user`
--

LOCK TABLES `super_bbs_user_fav_user` WRITE;
/*!40000 ALTER TABLE `super_bbs_user_fav_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_user_fav_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_bbs_users`
--

DROP TABLE IF EXISTS `super_bbs_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_bbs_users` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_bbs_users`
--

LOCK TABLES `super_bbs_users` WRITE;
/*!40000 ALTER TABLE `super_bbs_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_bbs_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-01 22:25:31
