CREATE DATABASE  IF NOT EXISTS `vs_videostreaming` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vs_videostreaming`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vs_videostreaming
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `vs_acteur`
--

DROP TABLE IF EXISTS `vs_acteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vs_acteur` (
  `id` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vs_acteur`
--

LOCK TABLES `vs_acteur` WRITE;
/*!40000 ALTER TABLE `vs_acteur` DISABLE KEYS */;
/*!40000 ALTER TABLE `vs_acteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vs_notation`
--

DROP TABLE IF EXISTS `vs_notation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vs_notation` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  `Note` int NOT NULL,
  `Commentaire` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vs_notation_userid_idx` (`userId`),
  KEY `vs_notation_videoid_idx` (`videoId`),
  CONSTRAINT `vs_notation_userid` FOREIGN KEY (`userId`) REFERENCES `vs_user` (`id`),
  CONSTRAINT `vs_notation_videoid` FOREIGN KEY (`videoId`) REFERENCES `vs_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vs_notation`
--

LOCK TABLES `vs_notation` WRITE;
/*!40000 ALTER TABLE `vs_notation` DISABLE KEYS */;
INSERT INTO `vs_notation` VALUES (1,1,1,4,'tttttt'),(2,1,2,2,'test');
/*!40000 ALTER TABLE `vs_notation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vs_realisateur`
--

DROP TABLE IF EXISTS `vs_realisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vs_realisateur` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vs_realisateur`
--

LOCK TABLES `vs_realisateur` WRITE;
/*!40000 ALTER TABLE `vs_realisateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `vs_realisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vs_user`
--

DROP TABLE IF EXISTS `vs_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vs_user` (
  `id` int NOT NULL,
  `email` varchar(200) NOT NULL,
  `identifiant` varchar(200) NOT NULL,
  `motDePasse` varchar(200) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `dateCreation` date NOT NULL,
  `photo` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vs_user`
--

LOCK TABLES `vs_user` WRITE;
/*!40000 ALTER TABLE `vs_user` DISABLE KEYS */;
INSERT INTO `vs_user` VALUES (1,'test1@gmail.fr','test1','test1','test1','test1','2022-01-19','test1.png'),(2,'test2@gmail.fr','test2','test2','test2','test2','2022-01-19','test2.jpeg'),(3,'achir.tinhinane@gmail.com','tachir','tachir','Achir','Tinhinane','2022-01-19','achir.jpeg');
/*!40000 ALTER TABLE `vs_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vs_user_preference`
--

DROP TABLE IF EXISTS `vs_user_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vs_user_preference` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `typeVideo` varchar(45) DEFAULT NULL,
  `langue` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_preference_userid_idx` (`userId`),
  CONSTRAINT `user_preference_userid` FOREIGN KEY (`userId`) REFERENCES `vs_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vs_user_preference`
--

LOCK TABLES `vs_user_preference` WRITE;
/*!40000 ALTER TABLE `vs_user_preference` DISABLE KEYS */;
INSERT INTO `vs_user_preference` VALUES (1,1,'action','film','fr'),(2,2,'thriller','film','fr'),(3,3,'doc','animalier','fr');
/*!40000 ALTER TABLE `vs_user_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vs_video`
--

DROP TABLE IF EXISTS `vs_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vs_video` (
  `id` int NOT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `duree` int NOT NULL,
  `date` datetime NOT NULL,
  `langue` varchar(45) NOT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `lien` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vs_video`
--

LOCK TABLES `vs_video` WRITE;
/*!40000 ALTER TABLE `vs_video` DISABLE KEYS */;
INSERT INTO `vs_video` VALUES (1,'test1',2,'2022-03-12 00:00:00','fr','film','videos\\movie.mp4',NULL),(2,'test2',30,'2021-05-23 00:00:00','en','doc','videos\\movie.mp4',NULL);
/*!40000 ALTER TABLE `vs_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vs_video_favorite`
--

DROP TABLE IF EXISTS `vs_video_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vs_video_favorite` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId_idx` (`userId`),
  KEY `video_favorite_videoId_idx` (`videoId`),
  CONSTRAINT `video_favorite_userId` FOREIGN KEY (`userId`) REFERENCES `vs_user` (`id`),
  CONSTRAINT `video_favorite_videoId` FOREIGN KEY (`videoId`) REFERENCES `vs_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vs_video_favorite`
--

LOCK TABLES `vs_video_favorite` WRITE;
/*!40000 ALTER TABLE `vs_video_favorite` DISABLE KEYS */;
INSERT INTO `vs_video_favorite` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `vs_video_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vs_video_visionnee`
--

DROP TABLE IF EXISTS `vs_video_visionnee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vs_video_visionnee` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_visionnee_userId_idx` (`userId`),
  KEY `video_visionnee_videoId_idx` (`videoId`),
  CONSTRAINT `video_visionnee_userId` FOREIGN KEY (`userId`) REFERENCES `vs_user` (`id`),
  CONSTRAINT `video_visionnee_videoId` FOREIGN KEY (`videoId`) REFERENCES `vs_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vs_video_visionnee`
--

LOCK TABLES `vs_video_visionnee` WRITE;
/*!40000 ALTER TABLE `vs_video_visionnee` DISABLE KEYS */;
INSERT INTO `vs_video_visionnee` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `vs_video_visionnee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-25 22:22:02
