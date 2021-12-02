-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: jobidb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `appID` int NOT NULL AUTO_INCREMENT,
  `motivation` varchar(1000) NOT NULL,
  `status` enum('accepted','refused','processing') NOT NULL,
  `studentUser` int NOT NULL,
  `offerOfferId` int NOT NULL,
  `appDate` varchar(255) NOT NULL,
  PRIMARY KEY (`appID`),
  UNIQUE KEY `REL_40d806b07fb8eff73e29e9ce76` (`offerOfferId`),
  KEY `FK_5a7d57955c93429c442d4ffc39c` (`studentUser`),
  CONSTRAINT `FK_40d806b07fb8eff73e29e9ce761` FOREIGN KEY (`offerOfferId`) REFERENCES `offer` (`offerId`),
  CONSTRAINT `FK_5a7d57955c93429c442d4ffc39c` FOREIGN KEY (`studentUser`) REFERENCES `student` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `website` varchar(100) NOT NULL,
  `tel` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `logo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (3,'leafy company','charguia, tunis','www.leaf.org',4678902,'leafy@notarealcompany.org',NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer` (
  `userId` int NOT NULL,
  `companyId` int NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `REL_3c1fd852d591f7b15a467b8fc4` (`companyId`),
  UNIQUE KEY `REL_bf0894d837af561b2f63387499` (`userId`),
  CONSTRAINT `FK_3c1fd852d591f7b15a467b8fc48` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_bf0894d837af561b2f633874993` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES (5,3);
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer` (
  `offerId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `status` enum('Open','Closed') NOT NULL DEFAULT 'Open',
  `employmentType` enum('fulltime','part-time/flexible','weekend','temporary','summer/holidays','internship','graduate') NOT NULL,
  `category` varchar(20) NOT NULL,
  `location` varchar(100) NOT NULL,
  `salary` varchar(50) NOT NULL,
  `description` varchar(700) NOT NULL,
  `requirements` varchar(1500) NOT NULL,
  `responsibilities` varchar(1500) NOT NULL,
  `about` varchar(2500) NOT NULL,
  `hoursPerWeek` int NOT NULL,
  `languages` varchar(100) NOT NULL,
  `employerUser` int NOT NULL,
  `companyId` int NOT NULL,
  `datePosted` varchar(255) NOT NULL,
  PRIMARY KEY (`offerId`),
  KEY `FK_3f06ebad201b4fc05a02379c6df` (`employerUser`),
  KEY `FK_7e3791c6351f63eaf655522c700` (`companyId`),
  CONSTRAINT `FK_3f06ebad201b4fc05a02379c6df` FOREIGN KEY (`employerUser`) REFERENCES `employer` (`userId`),
  CONSTRAINT `FK_7e3791c6351f63eaf655522c700` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `driverLicense` tinyint NOT NULL DEFAULT '0',
  `education` varchar(50) NOT NULL,
  `school` varchar(100) NOT NULL,
  `languages` varchar(20) NOT NULL,
  `linkedin` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `cv` varchar(50) DEFAULT NULL,
  `userId` int NOT NULL,
  `dateOfBirth` date NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `REL_b35463776b4a11a3df3c30d920` (`userId`),
  CONSTRAINT `FK_b35463776b4a11a3df3c30d920a` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (0,'Engineering degree','INSAT','fr,ar,eng','www.linkedin.com','Ariana, raoued',NULL,NULL,4,'1999-07-20');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tel` int NOT NULL,
  `gender` enum('M','F','X') NOT NULL,
  `salt` varchar(255) NOT NULL,
  `role` enum('student','employer') DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_e12875dfb3b1d92d7d7c5377e2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'eya zaoui','eya@yahoo.fr',23848,'F','$2b$08$LhVGTxju/Tss1O4NR5ItXO','student','$2b$08$LhVGTxju/Tss1O4NR5ItXO1qo6V3UTsbhf0qg1G8xdfSWr5W1M48W'),(5,'taha','taha@gmail.com',23848,'M','$2b$08$.ze79RXhV7lPGIq73GWLm.','employer','$2b$08$.ze79RXhV7lPGIq73GWLm.H43OMjApGZsK.UMVlnQ4iWCvzUWkhyy'),(6,'kiba','kiba@outlook.fr',555555,'X','$2b$08$mWEz5yEB9ugfRxYcJNrn/e',NULL,'$2b$08$mWEz5yEB9ugfRxYcJNrn/eKisGLC8swYCUyy72hhN/egoWdl9GAWK');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-02 17:14:41
