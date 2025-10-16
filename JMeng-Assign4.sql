-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: united_helpers
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`,`startDateTime`),
  KEY `fk_asg_task` (`taskCode`),
  CONSTRAINT `fk_asg_task` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `fk_asg_vol` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,101,'2025-10-01 09:00:00','2025-10-01 13:00:00'),(1,105,'2025-10-02 09:00:00','2025-10-02 12:00:00'),(2,102,'2025-10-01 08:00:00','2025-10-01 12:30:00'),(2,109,'2025-10-03 14:00:00','2025-10-03 18:00:00'),(3,102,'2025-10-02 08:00:00','2025-10-02 12:00:00'),(3,108,'2025-10-04 09:00:00',NULL),(4,103,'2025-10-01 10:00:00','2025-10-01 16:00:00'),(4,105,'2025-10-05 09:00:00','2025-10-05 13:00:00'),(5,108,'2025-10-02 13:00:00','2025-10-02 17:00:00'),(6,109,'2025-10-02 09:00:00','2025-10-02 12:00:00'),(7,101,'2025-10-04 12:00:00','2025-10-04 16:00:00'),(7,105,'2025-10-03 08:00:00','2025-10-03 12:00:00'),(8,104,'2025-10-03 09:30:00','2025-10-03 12:30:00'),(9,106,'2025-10-04 10:00:00','2025-10-04 14:00:00'),(10,107,'2025-10-01 13:00:00','2025-10-01 17:00:00');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(120) NOT NULL,
  `itemValue` decimal(8,2) NOT NULL,
  `quantityOnHand` int NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Canned beans (400g)',1.20,8000),(2,'Rice (1kg)',2.10,6000),(3,'Baby formula (500g)',8.50,1200),(4,'Diapers (pack of 20)',9.90,1500),(5,'Water (2L bottle)',0.80,10000),(6,'Soap bar',0.50,7000),(7,'Toothbrush',0.60,5000),(8,'Bandage roll',1.10,4000),(9,'Antiseptic wipes',0.90,3500),(10,'Low-sodium soup (400g)',1.40,2000),(11,'Tuna (170g)',1.30,5000),(12,'Baby wipes (80ct)',2.80,1800);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` int NOT NULL,
  `packageCreateDate` date NOT NULL,
  `packageWeight` decimal(6,2) NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `fk_pkg_task` (`taskCode`),
  KEY `fk_pkg_ptype` (`packageTypeId`),
  CONSTRAINT `fk_pkg_ptype` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`),
  CONSTRAINT `fk_pkg_task` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,102,3,'2025-10-02',5.50),(2,102,3,'2025-10-02',5.45),(3,102,3,'2025-10-02',5.60),(4,102,2,'2025-10-02',4.20),(5,102,2,'2025-10-02',4.30),(6,105,4,'2025-10-03',3.10),(7,105,5,'2025-10-03',4.00),(8,105,3,'2025-10-03',6.10),(9,108,1,'2025-10-04',2.80),(10,108,3,'2025-10-04',4.90),(11,108,1,'2025-10-04',2.75),(12,108,3,'2025-10-04',5.05);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `fk_pc_package` (`packageId`),
  CONSTRAINT `fk_pc_item` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `fk_pc_package` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,1,4),(1,2,3),(1,8,4),(2,1,1),(2,2,1),(2,3,1),(2,8,1),(2,12,1),(3,4,1),(3,5,1),(4,4,1),(4,5,1),(5,1,2),(5,2,2),(5,3,3),(5,7,6),(5,8,2),(5,10,2),(5,12,2),(6,6,2),(7,6,2),(8,9,2),(8,11,2),(9,6,3),(9,9,5),(9,11,4),(10,3,2),(10,10,3),(10,12,2),(11,2,2),(12,4,1),(12,5,1);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(60) NOT NULL,
  PRIMARY KEY (`packageTypeId`),
  UNIQUE KEY `uq_package_type_name` (`packageTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'basic medical'),(2,'child-care'),(3,'food'),(4,'hygiene'),(5,'water');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(120) NOT NULL,
  `packingListDescription` text,
  PRIMARY KEY (`packingListId`),
  UNIQUE KEY `uq_packing_list_name` (`packingListName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'Hurricane Alpha – Wave 1','2,000 medical, 2,000 food, 1,000 child-care. No meat in food packages.'),(2,'Flood Relief Beta – Family','Family kit: food + water + hygiene for 3 days.'),(3,'Earthquake Gamma – Senior Care','Low-sodium food and basic medical supplies');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int NOT NULL,
  `taskStatusId` int NOT NULL,
  `taskDescription` varchar(200) NOT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `fk_task_type` (`taskTypeId`),
  KEY `fk_task_status` (`taskStatusId`),
  KEY `fk_task_packlist` (`packingListId`),
  CONSTRAINT `fk_task_packlist` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `fk_task_status` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`),
  CONSTRAINT `fk_task_type` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (101,NULL,1,2,'Answer the telephone and route calls'),(102,1,2,1,'Prepare 5,000 packages for Hurricane Alpha'),(103,NULL,3,1,'Schedule truck pickups and warehouse slots'),(104,NULL,4,1,'Canvass neighborhoods for needs assessment'),(105,2,2,2,'Assemble family flood-relief kits'),(106,NULL,5,1,'Stock first-aid station'),(107,NULL,1,1,'Data entry of donation records'),(108,3,2,1,'Assemble senior-care packages'),(109,NULL,3,2,'Unload inbound supplies'),(110,NULL,4,5,'Translate flyers to Spanish & Mandarin');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskStatusId`),
  UNIQUE KEY `uq_task_status_name` (`taskStatusName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (4,'cancelled'),(3,'complete'),(5,'on hold'),(2,'ongoing'),(1,'open');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` int NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskTypeId`),
  UNIQUE KEY `uq_task_type_name` (`taskTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (3,'logistics'),(5,'medical'),(4,'outreach'),(2,'packing'),(1,'recurring');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(100) NOT NULL,
  `volunteerAddress` varchar(200) DEFAULT NULL,
  `volunteerTelephone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Ava Chen','12 Elm St, Baytown','555-2011'),(2,'Ben Ortiz','44 Lake Rd, Pineview','555-4332'),(3,'Chloe Park','101 Maple Ave, Riverton','555-1010'),(4,'Diego Ramos','77 Cedar Blvd, Hill City','555-7712'),(5,'Emma Li','5 Pearl Ct, Seaside','555-8891'),(6,'Finn Cooper','9 Birch Way, Millbrook','555-0134'),(7,'Grace Kim','18 Ocean Dr, Seaside','555-1188'),(8,'Hassan Ali','120 Ridge St, Hill City','555-2200'),(9,'Isabella Rossi','3 Garden Ln, Baytown','555-3003'),(10,'Jack Wilson','85 Brook St, Riverton','555-8520');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 23:22:24
