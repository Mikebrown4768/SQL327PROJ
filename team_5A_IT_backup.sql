CREATE DATABASE  IF NOT EXISTS `team_5a_polishit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `team_5a_polishit`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: team_5a_polishit
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `company size`
--

DROP TABLE IF EXISTS `company size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company size` (
  `company_size_id` int NOT NULL,
  `company_size_from` int NOT NULL,
  `company_size_to` int NOT NULL,
  PRIMARY KEY (`company_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company size`
--

LOCK TABLES `company size` WRITE;
/*!40000 ALTER TABLE `company size` DISABLE KEYS */;
INSERT INTO `company size` VALUES (1,10,20),(2,10,0),(3,10,15),(4,15,0),(5,20,0),(6,20,30),(7,20,50),(8,20,35),(9,25,0),(10,30,50),(11,35,0),(12,40,0),(13,50,0),(14,51,200),(15,80,100),(16,100,0),(17,1001,0);
/*!40000 ALTER TABLE `company size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience level`
--

DROP TABLE IF EXISTS `experience level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience level` (
  `Experience_level_id` int NOT NULL,
  `experence_level` varchar(45) NOT NULL,
  PRIMARY KEY (`Experience_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience level`
--

LOCK TABLES `experience level` WRITE;
/*!40000 ALTER TABLE `experience level` DISABLE KEYS */;
INSERT INTO `experience level` VALUES (1,'junior'),(2,'mid'),(3,'senior');
/*!40000 ALTER TABLE `experience level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job posting`
--

DROP TABLE IF EXISTS `job posting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job posting` (
  `Job_id` int NOT NULL,
  `Salary_id` int NOT NULL,
  `Location_id` int NOT NULL,
  `company_size_id` int NOT NULL,
  `Marker_icon_id` int NOT NULL,
  `Title` varchar(45) NOT NULL,
  `Workplace_type` varchar(45) NOT NULL,
  `Published_at` varchar(45) NOT NULL,
  `Remote_interview` varchar(45) NOT NULL,
  `Remote` varchar(45) NOT NULL,
  `Open_to_hire_ukrainians` varchar(45) NOT NULL,
  `Contract_type` varchar(45) NOT NULL,
  `Experience_level_id` int NOT NULL,
  PRIMARY KEY (`Job_id`),
  KEY `fk_Job posting_Salary_idx` (`Salary_id`),
  KEY `fk_Job posting_Location1_idx` (`Location_id`),
  KEY `fk_Job posting_Company size1_idx` (`company_size_id`),
  KEY `fk_Job posting_Marker Icon1_idx` (`Marker_icon_id`),
  KEY `fk_Job posting_Experience level1_idx` (`Experience_level_id`),
  CONSTRAINT `fk_Job posting_Company size1` FOREIGN KEY (`company_size_id`) REFERENCES `company size` (`company_size_id`),
  CONSTRAINT `fk_Job posting_Experience level1` FOREIGN KEY (`Experience_level_id`) REFERENCES `experience level` (`Experience_level_id`),
  CONSTRAINT `fk_Job posting_Location1` FOREIGN KEY (`Location_id`) REFERENCES `location` (`Location_id`),
  CONSTRAINT `fk_Job posting_Marker Icon1` FOREIGN KEY (`Marker_icon_id`) REFERENCES `marker icon` (`Marker_icon_id`),
  CONSTRAINT `fk_Job posting_Salary` FOREIGN KEY (`Salary_id`) REFERENCES `salary` (`Salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job posting`
--

LOCK TABLES `job posting` WRITE;
/*!40000 ALTER TABLE `job posting` DISABLE KEYS */;
INSERT INTO `job posting` VALUES (1,1,1,1,1,'Senior Frontend Software Engineer','remote','2022-07-31T11:00:14.548Z','TRUE','TRUE','TRUE','TRUE',1),(2,2,2,2,2,'Python Developer (4 days/week)','remote','2022-07-07T10:25:00.000Z','TRUE','TRUE','TRUE','TRUE',2),(3,3,3,3,3,'Mid Full-stack Engineer (React/TypeScript)','remote','2022-05-31T11:32:00.000Z','TRUE','TRUE','TRUE','TRUE',3),(4,4,4,4,4,'Full-stack Engineer (React/TypeScript)','remote','2022-05-25T17:06:36.442Z','TRUE','TRUE','TRUE','TRUE',1),(5,5,5,5,5,'Senior iOS Engineer','remote','2022-06-30T14:57:00.000Z','TRUE','TRUE','FALSE','TRUE',2),(6,6,6,6,6,'Golang Developer','remote','2022-06-15T13:15:00.000Z','TRUE','TRUE','FALSE','TRUE',3),(7,7,7,7,7,'Mid/Senior Ad Banner Developer','remote','2022-05-19T11:35:00.000Z','TRUE','TRUE','TRUE','TRUE',1),(8,8,8,8,8,'Mid/Senior Creative Frontend Developer','remote','2022-05-10T09:32:00.000Z','TRUE','TRUE','TRUE','TRUE',2),(9,9,9,9,9,'Senior Backend Engineer','remote','2022-05-09T07:04:00.000Z','TRUE','TRUE','TRUE','TRUE',3),(10,10,10,10,10,'Platform Engineer - AWS','remote','2022-04-22T11:45:00.000Z','TRUE','TRUE','FALSE','TRUE',1),(11,11,11,11,11,'Senior Elixir Backend Developer','remote','2022-04-18T13:00:12.755Z','TRUE','TRUE','TRUE','TRUE',2),(12,12,12,12,12,'ServiceNow Developer','remote','2022-10-24T11:57:00.000Z','TRUE','TRUE','FALSE','TRUE',3),(13,13,13,13,13,'Front-end developer (ReactJS)','remote','2022-09-29T15:00:09.200Z','TRUE','TRUE','FALSE','TRUE',1),(14,14,14,14,14,'Development Team Lead - EMEA Region','remote','2022-04-24T11:00:19.180Z','TRUE','TRUE','TRUE','TRUE',2),(15,15,15,15,1,'Senior Data Engineer (REMOTE)','remote','2022-04-19T12:09:00.000Z','TRUE','TRUE','TRUE','TRUE',3),(16,16,16,16,2,'Fullstack Software Engineer (REMOTE)','remote','2022-04-19T11:00:21.029Z','TRUE','TRUE','TRUE','TRUE',1),(17,17,17,17,3,'Web Developer','partly_remote','2022-11-12T20:00:09.635Z','TRUE','FALSE','TRUE','TRUE',2),(18,18,18,1,4,'Head of Engineering','partly_remote','2022-11-12T16:00:00.000Z','TRUE','FALSE','FALSE','TRUE',3),(19,19,19,2,5,'Python developer','partly_remote','2022-04-25T13:29:00.000Z','TRUE','FALSE','TRUE','TRUE',1),(20,20,20,3,6,'Senior UX Designer','remote','2022-06-29T07:22:00.000Z','FALSE','TRUE','TRUE','TRUE',2),(21,1,21,4,7,'Junior DevOps Engineer','remote','2022-08-11T16:03:00.000Z','TRUE','TRUE','FALSE','TRUE',3),(22,2,22,5,8,'Senior Full Stack Developer (Angular & .NET)','remote','2022-07-28T14:05:00.000Z','FALSE','TRUE','TRUE','TRUE',1),(23,3,23,6,9,'Product Manager, B2C HealthTech','partly_remote','2022-08-02T09:00:15.694Z','TRUE','FALSE','TRUE','TRUE',2),(24,4,24,7,10,'IT Analyst for Payments','remote','2022-07-08T07:08:00.000Z','TRUE','TRUE','TRUE','TRUE',3),(25,5,25,8,11,'Product Engineer (Java)','partly_remote','2022-07-08T07:06:00.000Z','TRUE','FALSE','TRUE','TRUE',1);
/*!40000 ALTER TABLE `job posting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `Location_id` int NOT NULL,
  `city` varchar(45) NOT NULL,
  `country_code` varchar(45) NOT NULL,
  PRIMARY KEY (`Location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Almucar','ES'),(2,'Amsterdam','NL'),(3,'Barcelona','ES'),(4,'Berlin','DE'),(5,'Biaystok','PL'),(6,'Brno','CZ'),(7,'Gdask','PL'),(8,'Gdynia','PL'),(9,'Gliwice','PL'),(10,'Gorzw Wielkopolski','PL'),(11,'Helsinki','FI'),(12,'Katowice','PL'),(13,'Kopenhaga','DK'),(14,'Krakw','PL'),(15,'London','GB'),(16,'Mnchen','DE'),(17,'Ni','RS'),(18,'Pozna','PL'),(19,'Prague','CZ'),(20,'Southampton','GB'),(21,'Tallinn','EE'),(22,'Warszawa','PL'),(23,'Warszawa','UA'),(24,'Wrocaw','PL'),(25,'Zug','CH');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marker icon`
--

DROP TABLE IF EXISTS `marker icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marker icon` (
  `Marker_icon_id` int NOT NULL,
  `marker` varchar(45) NOT NULL,
  PRIMARY KEY (`Marker_icon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marker icon`
--

LOCK TABLES `marker icon` WRITE;
/*!40000 ALTER TABLE `marker icon` DISABLE KEYS */;
INSERT INTO `marker icon` VALUES (1,'admin'),(2,'data'),(3,'devops'),(4,'erp'),(5,'go'),(6,'java'),(7,'javascript'),(8,'Marker_icon'),(9,'mobile'),(10,'net'),(11,'other'),(12,'pm'),(13,'python'),(14,'ux');
/*!40000 ALTER TABLE `marker icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `Salary_id` int NOT NULL,
  `contract_type` varchar(45) NOT NULL,
  `salary_from` varchar(45) NOT NULL,
  `salary_to` varchar(45) NOT NULL,
  `salary_currency` varchar(45) NOT NULL,
  PRIMARY KEY (`Salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'TRUE','32996.60215','47136.3871','gbp'),(2,'TRUE','32487.52743','46409.16243','gbp'),(3,'TRUE','31387.43804','44837.66003','gbp'),(4,'TRUE','31606.67566','45150.84589','gbp'),(5,'TRUE','13116.94244','17489.25658','gbp'),(6,'TRUE','14029.5','23382.5','eur'),(7,'TRUE','11691.25','18706','eur'),(8,'TRUE','14031.9','21047.85','eur'),(9,'TRUE','16788.8','33289.792','eur'),(10,'TRUE','28143','36585.9','eur'),(11,'TRUE','22680','24360','pln'),(12,'TRUE','20160','25200','pln'),(13,'TRUE','16800','24360','pln'),(14,'TRUE','23520','25200','pln'),(15,'TRUE','20160','25200','pln'),(16,'TRUE','27354.9959','39789.08494','usd'),(17,'TRUE','27354.9959','37302.26713','usd'),(18,'TRUE','21386.63316','26360.26877','usd'),(19,'TRUE','21386.63316','39789.08494','usd'),(20,'TRUE','22381.36028','29344.45014','usd');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill value`
--

DROP TABLE IF EXISTS `skill value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill value` (
  `Skill_value_id` int NOT NULL,
  `skill_value` int NOT NULL,
  PRIMARY KEY (`Skill_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill value`
--

LOCK TABLES `skill value` WRITE;
/*!40000 ALTER TABLE `skill value` DISABLE KEYS */;
INSERT INTO `skill value` VALUES (1,5),(2,3),(3,3),(4,2),(5,3),(6,4),(7,4),(8,5),(9,2),(10,3),(11,3),(12,1),(13,4),(14,4),(15,3);
/*!40000 ALTER TABLE `skill value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `Skill_id` int NOT NULL,
  `skill_name` varchar(45) NOT NULL,
  `Skill_value_id` int NOT NULL,
  PRIMARY KEY (`Skill_id`),
  KEY `fk_Skills_Skill Value1_idx` (`Skill_value_id`),
  CONSTRAINT `fk_Skills_Skill Value1` FOREIGN KEY (`Skill_value_id`) REFERENCES `skill value` (`Skill_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'React',1),(2,'Kotlin',2),(3,'Flask',3),(4,'Node.js',4),(5,'Node.js',5),(6,'Mobile',6),(7,'Go',7),(8,'JavaScript',8),(9,'Terraform',9),(10,'Amazon AWS',10),(11,'Bootstrap',11),(12,'Azure',12),(13,'Testing',13),(14,'API',14),(15,'Scrum',15);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills and values`
--

DROP TABLE IF EXISTS `skills and values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills and values` (
  `Skills_Skill_id` int NOT NULL,
  `Job posting_Job_id` int NOT NULL,
  PRIMARY KEY (`Skills_Skill_id`,`Job posting_Job_id`),
  KEY `fk_Skills_has_Job posting_Job posting1_idx` (`Job posting_Job_id`),
  KEY `fk_Skills_has_Job posting_Skills1_idx` (`Skills_Skill_id`),
  CONSTRAINT `fk_Skills_has_Job posting_Job posting1` FOREIGN KEY (`Job posting_Job_id`) REFERENCES `job posting` (`Job_id`),
  CONSTRAINT `fk_Skills_has_Job posting_Skills1` FOREIGN KEY (`Skills_Skill_id`) REFERENCES `skills` (`Skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills and values`
--

LOCK TABLES `skills and values` WRITE;
/*!40000 ALTER TABLE `skills and values` DISABLE KEYS */;
INSERT INTO `skills and values` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15);
/*!40000 ALTER TABLE `skills and values` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-16  0:54:57
