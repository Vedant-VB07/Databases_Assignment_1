-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: laundrydb
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `clothing_type`
--

DROP TABLE IF EXISTS `clothing_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothing_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `wash_instruction` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothing_type`
--

LOCK TABLES `clothing_type` WRITE;
/*!40000 ALTER TABLE `clothing_type` DISABLE KEYS */;
INSERT INTO `clothing_type` VALUES (1,'Cotton Shirt','Cold water, tumble dry low'),(2,'Silk Saree','Dry clean only'),(3,'Denim Jeans','Warm wash, inside out'),(4,'Woolen Sweater','Hand wash cold, flat dry'),(5,'Bed Sheet','Hot wash, high heat dry'),(6,'Linen Trousers','Cold wash, air dry'),(7,'Suit Jacket','Dry clean only'),(8,'Curtains','Gentle cycle, hang dry'),(9,'Bath Towel','Hot wash, tumble dry high'),(10,'Silk Scarf','Hand wash cold');
/*!40000 ALTER TABLE `clothing_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `joining_date` date NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES
(1,'Ramesh Kumar','Delivery Driver','9988776655','2024-01-15'),
(2,'Suresh Yadav','Washer','9988776644','2024-02-10'),
(3,'Anita Desai','Ironing Specialist','9988776633','2024-03-05'),
(4,'Pooja Reddy','Manager','9988776622','2023-11-20'),
(5,'Vikram Malhotra','Dry Cleaning Expert','9988776611','2024-01-25'),
(6,'Rajesh Koothrappali','Driver','9988776600','2024-04-01'),
(7,'Neha Sharma','Customer Support','9988776599','2024-04-12'),
(8,'Amit Verma','Quality Checker','9988776588','2024-05-03'),
(9,'Kavita Joshi','Accountant','9988776577','2024-05-15'),
(10,'Rahul Mehta','Inventory Supervisor','9988776566','2024-06-01');
;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `order_id` int NOT NULL,
  `rating` int NOT NULL,
  `comments` text,
  `feedback_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`feedback_id`),
  KEY `member_id` (`member_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `laundry_order` (`order_id`),
  CONSTRAINT `feedback_chk_1` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES
(1,3,3,5,'Excellent service, delivered on time!','2026-02-14 21:37:05'),
(2,1,1,4,'Good wash, but folding could be better.','2026-02-14 21:37:05'),
(3,4,4,3,'Ironing was okay, but delivery was late.','2026-02-14 21:37:05'),
(4,7,7,5,'Super fast express delivery.','2026-02-14 21:37:05'),
(5,2,2,2,'Pickup was delayed by an hour.','2026-02-14 21:37:05'),
(6,5,5,5,'Dry cleaning quality was excellent.','2026-02-14 21:37:05'),
(7,6,6,4,'Driver was polite and punctual.','2026-02-14 21:37:05'),
(8,8,8,3,'Service was average, expected better packaging.','2026-02-14 21:37:05'),
(9,9,9,1,'Very poor stain removal. Disappointed.','2026-02-14 21:37:05'),
(10,10,10,4,'Overall good experience, will use again.','2026-02-14 21:37:05');

/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laundry_order`
--

DROP TABLE IF EXISTS `laundry_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laundry_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pickup_time` datetime NOT NULL,
  `expected_delivery_time` datetime NOT NULL,
  `total_amount` decimal(10,2) DEFAULT '0.00',
  `current_status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`order_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `laundry_order_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `chk_delivery_time` CHECK ((`expected_delivery_time` > `pickup_time`))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laundry_order`
--

LOCK TABLES `laundry_order` WRITE;
/*!40000 ALTER TABLE `laundry_order` DISABLE KEYS */;
INSERT INTO `laundry_order` VALUES (1,1,'2026-02-14 21:37:05','2026-02-01 09:00:00','2026-02-03 18:00:00',500.00,'Processing'),(2,2,'2026-02-14 21:37:05','2026-02-02 10:00:00','2026-02-04 12:00:00',250.00,'Pending'),(3,3,'2026-02-14 21:37:05','2026-02-02 14:00:00','2026-02-05 10:00:00',1000.00,'Delivered'),(4,4,'2026-02-14 21:37:05','2026-02-03 08:30:00','2026-02-04 17:00:00',150.00,'Picked Up'),(5,5,'2026-02-14 21:37:05','2026-02-03 11:00:00','2026-02-06 09:00:00',450.00,'Processing'),(6,6,'2026-02-14 21:37:05','2026-02-04 09:15:00','2026-02-06 18:00:00',300.00,'Washing'),(7,7,'2026-02-14 21:37:05','2026-02-04 10:30:00','2026-02-05 14:00:00',600.00,'Ready for Delivery'),(8,8,'2026-02-14 21:37:05','2026-02-05 13:00:00','2026-02-07 11:00:00',200.00,'Pending'),(9,9,'2026-02-14 21:37:05','2026-02-05 15:45:00','2026-02-08 10:00:00',120.00,'Picked Up'),(10,10,'2026-02-14 21:37:05','2026-02-06 08:00:00','2026-02-09 18:00:00',800.00,'Processing');
/*!40000 ALTER TABLE `laundry_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lost_item`
--

DROP TABLE IF EXISTS `lost_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lost_item` (
  `lost_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `item_description` varchar(255) NOT NULL,
  `reported_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `compensation_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`lost_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `lost_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `laundry_order` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lost_item`
--

LOCK TABLES `lost_item` WRITE;
/*!40000 ALTER TABLE `lost_item` DISABLE KEYS */;
INSERT INTO `lost_item` VALUES
(1,5,'Blue handkerchief missing','2026-02-14 21:37:05',50.00),
(2,8,'Button missing on shirt','2026-02-14 21:37:05',20.00),
(3,2,'Single sock missing','2026-02-14 21:37:05',30.00),
(4,7,'Scarf misplaced during washing','2026-02-14 21:37:05',80.00),
(5,4,'Stain on white kurta after wash','2026-02-14 21:37:05',120.00),
(6,9,'Belt missing from trousers','2026-02-14 21:37:05',70.00),
(7,1,'Cap lost during processing','2026-02-14 21:37:05',40.00),
(8,6,'Pocket torn on jeans','2026-02-14 21:37:05',150.00),
(9,10,'Silk dupatta damaged','2026-02-14 21:37:05',200.00),
(10,3,'Tie missing after dry cleaning','2026-02-14 21:37:05',60.00);

/*!40000 ALTER TABLE `lost_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contact_number` (`contact_number`),
  CONSTRAINT `member_chk_1` CHECK ((`age` >= 18))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'Aarav Patel',25,'aarav.p@example.com','9876543210','123 MG Road, Gandhinagar','2026-02-14 21:37:05'),(2,'Vivaan Singh',34,'vivaan.s@example.com','9876543211','456 Sector 11, Gandhinagar','2026-02-14 21:37:05'),(3,'Diya Sharma',22,'diya.sharma@example.com','9876543212','789 Campus Housing, IITGN','2026-02-14 21:37:05'),(4,'Ananya Gupta',29,'ananya.g@example.com','9876543213','321 Riverside Apt, Ahmedabad','2026-02-14 21:37:05'),(5,'Rohan Mehta',40,'rohan.m@example.com','9876543214','654 Paldi, Ahmedabad','2026-02-14 21:37:05'),(6,'Ishita Verma',27,'ishita.v@example.com','9876543215','12 Green Park, Gandhinagar','2026-02-14 21:37:05'),(7,'Kabir Das',31,'kabir.d@example.com','9876543216','88 Lake View, Ahmedabad','2026-02-14 21:37:05'),(8,'Meera Iyer',45,'meera.i@example.com','9876543217','99 Satellite Road, Ahmedabad','2026-02-14 21:37:05'),(9,'Arjun Reddy',23,'arjun.r@example.com','9876543218','Hostel Block 4, IITGN','2026-02-14 21:37:05'),(10,'Sanya Malhotra',28,'sanya.m@example.com','9876543219','55 InfoCity, Gandhinagar','2026-02-14 21:37:05');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_assignment`
--

DROP TABLE IF EXISTS `order_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_assignment` (
  `assignment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `assigned_role` varchar(50) NOT NULL,
  `assigned_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`assignment_id`),
  KEY `order_id` (`order_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `order_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `laundry_order` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `order_assignment_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_assignment`
--

LOCK TABLES `order_assignment` WRITE;
/*!40000 ALTER TABLE `order_assignment` DISABLE KEYS */;
INSERT INTO `order_assignment` VALUES (1,1,2,'Washing','2026-02-14 21:37:05'),(2,1,1,'Pickup','2026-02-14 21:37:05'),(3,2,1,'Pickup','2026-02-14 21:37:05'),(4,3,1,'Delivery','2026-02-14 21:37:05'),(5,4,3,'Ironing','2026-02-14 21:37:05'),(6,5,2,'Washing','2026-02-14 21:37:05'),(7,6,5,'Dry Cleaning','2026-02-14 21:37:05'),(8,7,6,'Delivery','2026-02-14 21:37:05'),(9,9,1,'Pickup','2026-02-14 21:37:05'),(10,10,5,'Dry Cleaning','2026-02-14 21:37:05');
/*!40000 ALTER TABLE `order_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_service`
--

DROP TABLE IF EXISTS `order_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_service` (
  `order_service_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `service_id` int NOT NULL,
  `quantity` int NOT NULL,
  `applied_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_service_id`),
  KEY `order_id` (`order_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `order_service_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `laundry_order` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `order_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`),
  CONSTRAINT `order_service_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_service`
--

LOCK TABLES `order_service` WRITE;
/*!40000 ALTER TABLE `order_service` DISABLE KEYS */;
INSERT INTO `order_service` VALUES (1,1,1,5,60.00),(2,1,3,2,40.00),(3,2,2,1,250.00),(4,3,1,10,60.00),(5,4,3,5,30.00),(6,5,1,4,60.00),(7,6,2,2,150.00),(8,7,5,3,200.00),(9,8,3,4,50.00),(10,9,1,2,60.00),(11,10,2,3,250.00);
/*!40000 ALTER TABLE `order_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_log`
--

DROP TABLE IF EXISTS `order_status_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_log` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `status_timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_status_log_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `laundry_order` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_log`
--

LOCK TABLES `order_status_log` WRITE;
/*!40000 ALTER TABLE `order_status_log` DISABLE KEYS */;
INSERT INTO `order_status_log` VALUES (1,1,'Picked Up','2026-02-14 21:37:05'),(2,1,'Washing','2026-02-14 21:37:05'),(3,2,'Picked Up','2026-02-14 21:37:05'),(4,3,'Delivered','2026-02-14 21:37:05'),(5,4,'Picked Up','2026-02-14 21:37:05'),(6,5,'Washing','2026-02-14 21:37:05'),(7,6,'Processing','2026-02-14 21:37:05'),(8,7,'Ironing','2026-02-14 21:37:05'),(9,9,'Picked Up','2026-02-14 21:37:05'),(10,10,'Received','2026-02-14 21:37:05');
/*!40000 ALTER TABLE `order_status_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `laundry_order` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `payment_chk_1` CHECK ((`payment_amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'UPI',500.00,'2026-02-14 21:37:05'),(2,2,'Cash',250.00,'2026-02-14 21:37:05'),(3,3,'Credit Card',1000.00,'2026-02-14 21:37:05'),(4,4,'UPI',150.00,'2026-02-14 21:37:05'),(5,5,'Cash',450.00,'2026-02-14 21:37:05'),(6,6,'Credit Card',300.00,'2026-02-14 21:37:05'),(7,7,'UPI',600.00,'2026-02-14 21:37:05'),(8,8,'Cash',200.00,'2026-02-14 21:37:05'),(9,9,'UPI',120.00,'2026-02-14 21:37:05'),(10,10,'Credit Card',800.00,'2026-02-14 21:37:05');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_status`
--

DROP TABLE IF EXISTS `payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_status` (
  `payment_status_id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `status_timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_status_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `payment_status_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_status`
--

LOCK TABLES `payment_status` WRITE;
/*!40000 ALTER TABLE `payment_status` DISABLE KEYS */;
INSERT INTO `payment_status` VALUES (1,1,'Success','2026-02-14 21:37:05'),(2,2,'Pending','2026-02-14 21:37:05'),(3,3,'Success','2026-02-14 21:37:05'),(4,4,'Success','2026-02-14 21:37:05'),(5,5,'Pending','2026-02-14 21:37:05'),(6,6,'Success','2026-02-14 21:37:05'),(7,7,'Success','2026-02-14 21:37:05'),(8,8,'Failed','2026-02-14 21:37:05'),(9,9,'Success','2026-02-14 21:37:05'),(10,10,'Success','2026-02-14 21:37:05');
/*!40000 ALTER TABLE `payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `price_id` int NOT NULL AUTO_INCREMENT,
  `service_id` int NOT NULL,
  `type_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`price_id`),
  UNIQUE KEY `service_id` (`service_id`,`type_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `price_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `price_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `clothing_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `price_chk_1` CHECK ((`price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,1,1,60.00),(2,1,3,70.00),(3,2,2,250.00),(4,3,1,40.00),(5,2,4,200.00),(6,1,5,90.00),(7,2,7,300.00),(8,3,6,45.00),(9,1,9,50.00),(10,2,10,150.00);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(50) NOT NULL,
  `service_description` varchar(255) NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `service_name` (`service_name`),
  CONSTRAINT `service_chk_1` CHECK ((`base_price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES
(1,'Wash & Fold','Standard machine wash and folding service',50.00),
(2,'Dry Cleaning','Chemical cleaning for delicate fabrics',150.00),
(3,'Steam Ironing','Professional steam pressing',30.00),
(4,'Stain Removal','Intensive chemical stain treatment',80.00),
(5,'Express Delivery','Same day washing and delivery',100.00),
(6,'Premium Wash','Eco-friendly detergent and fabric softeners',70.00),
(7,'Shoe Cleaning','Deep cleaning and deodorizing of footwear',120.00),
(8,'Curtain Washing','Specialized washing for curtains and drapes',200.00),
(9,'Blanket Cleaning','Heavy-duty washing for blankets and quilts',180.00),
(10,'Leather Cleaning','Professional care for leather garments',250.00);

/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-14 21:41:49
