CREATE DATABASE  IF NOT EXISTS `friendsbook_db2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `friendsbook_db2`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: friendsbook_db2
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `postId` int DEFAULT NULL,
  `comment` text,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `userId` (`userId`),
  KEY `postId` (`postId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `user_post` (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (39,2,4,'nice work.','2024-08-07'),(40,1,5,'hy','2024-09-13'),(41,1,6,'hey how are you doing.','2024-09-17');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creds`
--

DROP TABLE IF EXISTS `creds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creds` (
  `passwordId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`passwordId`),
  KEY `userId` (`userId`),
  CONSTRAINT `creds_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creds`
--

LOCK TABLES `creds` WRITE;
/*!40000 ALTER TABLE `creds` DISABLE KEYS */;
INSERT INTO `creds` VALUES (11,1,'A1b@cD3e','2024-08-07',NULL),(12,2,'A1b@cD3e','2024-08-07',NULL),(13,3,'A1b@cD3e','2024-08-07',NULL);
/*!40000 ALTER TABLE `creds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_table`
--

DROP TABLE IF EXISTS `dp_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dp_table` (
  `dpId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `imageUrl` varchar(100) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`dpId`),
  KEY `userId` (`userId`),
  CONSTRAINT `dp_table_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_table`
--

LOCK TABLES `dp_table` WRITE;
/*!40000 ALTER TABLE `dp_table` DISABLE KEYS */;
INSERT INTO `dp_table` VALUES (10,1,'usrdp1.png','2024-08-07',NULL),(11,2,'usrdp2.png','2024-08-07',NULL),(12,3,'usrdp3.png','2024-08-07',NULL);
/*!40000 ALTER TABLE `dp_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_request` (
  `requestId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `friend_userId` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`requestId`),
  KEY `userId` (`userId`),
  KEY `friend_userId` (`friend_userId`),
  CONSTRAINT `friend_request_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `friend_request_ibfk_2` FOREIGN KEY (`friend_userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_request`
--

LOCK TABLES `friend_request` WRITE;
/*!40000 ALTER TABLE `friend_request` DISABLE KEYS */;
INSERT INTO `friend_request` VALUES (6,2,3,'2024-08-07',1),(7,2,1,'2024-09-17',0);
/*!40000 ALTER TABLE `friend_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friends` (
  `connection_id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `friend_user_id` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`connection_id`),
  KEY `userId` (`userId`),
  KEY `friends_id` (`friend_user_id`),
  CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend_user_id`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (9,2,3,1),(10,3,2,1);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likepost`
--

DROP TABLE IF EXISTS `likepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likepost` (
  `like_post_id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `postId` int DEFAULT NULL,
  PRIMARY KEY (`like_post_id`),
  KEY `userId` (`userId`),
  KEY `postId` (`postId`),
  CONSTRAINT `likepost_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `likepost_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `user_post` (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likepost`
--

LOCK TABLES `likepost` WRITE;
/*!40000 ALTER TABLE `likepost` DISABLE KEYS */;
INSERT INTO `likepost` VALUES (65,2,4),(66,1,3),(67,1,5),(68,1,6);
/*!40000 ALTER TABLE `likepost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_post` (
  `postId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `imageAddr` text,
  `likes` int DEFAULT NULL,
  `comments` int DEFAULT NULL,
  `share` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `top` time DEFAULT NULL,
  PRIMARY KEY (`postId`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_post_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post`
--

LOCK TABLES `user_post` WRITE;
/*!40000 ALTER TABLE `user_post` DISABLE KEYS */;
INSERT INTO `user_post` VALUES (3,1,'first pic on friendsbook','usrpost1.jpeg',4,3,0,'2024-08-07',NULL),(4,2,'frist pic on fbook','usrpost2.jpeg',4,3,0,'2024-08-07',NULL),(5,1,'nice picture','usrpost3.png',2,2,0,'2024-09-13',NULL),(6,1,'nice picture','usrpost4.png',1,1,0,'2024-09-17',NULL);
/*!40000 ALTER TABLE `user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'praj4737@gmail.com','Sam tree','Male','2005-01-14'),(2,'j4122478@gmail.com','Ramesh  ranjan','Male','2005-01-14'),(3,'raj9301560@gmail.com','Pravin Chandrasingh','Male','2002-02-26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-10 15:21:43
