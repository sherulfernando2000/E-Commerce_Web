CREATE DATABASE  IF NOT EXISTS `ecommerceweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerceweb`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerceweb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId_idx` (`userId`),
  KEY `productId_idx` (`productId`),
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categorieId` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categorieId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'phone'),(2,'air pods');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `orderId_idx` (`orderId`),
  KEY `productId_idx` (`productId`),
  CONSTRAINT `fk_orderdetails_orderId` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_orderdetails_productId` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `total_amount` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`userId`),
  CONSTRAINT `user_id` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(20,0) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `image_path` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE KEY `productId_UNIQUE` (`productId`),
  KEY `categoryId_idx` (`categoryId`),
  CONSTRAINT `categoryId` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categorieId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Apple-Iphone-15',249000,12,1,'fdsafsad','uploaded_images/Apple-iPhone-15-2.jpg'),(2,'Samsung-Galaxy-F05 4GB 128GB',36900,20,1,'Samsung-Galaxy','uploaded_images/Samsung-Galaxy-F05.jpg'),(3,'Honor-X5B 4GB 64GB',49500,25,1,'Honor-X5B','uploaded_images/Honor-X5B.jpg'),(4,'Apple-iPhone-16 8GB 124GB',349000,20,1,'Apple-iPhone-16','uploaded_images/Apple-iPhone-16-1.png'),(5,'Apple-iPhone-16-Pro 8GB 128GB',639000,20,1,'Apple-iPhone-16-Pro','uploaded_images/Apple-iPhone-16-Pro-1.png'),(6,'OnePlus-13R 4GB 128GB',79900,20,1,'OnePlus-13R','uploaded_images/OnePlus-13R-2.png'),(7,'Samsung-Galaxy-S24',249500,20,1,'Samsung-Galaxy','uploaded_images/Samsung-Galaxy-S24-FE.png'),(8,'Apple-iPhone-16-Pro 8GB 128GB',235000,21,1,'Apple-iPhone-16-Pro','uploaded_images/Apple-iPhone-16-Pro-1.png'),(9,'Samsung-Galaxy-F06 4GB 128GB',95600,20,1,'Samsung-Galaxy-F06','uploaded_images/Samsung-Galaxy-F05.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sherul','sherul.dhanushka@gmail.com','1234','admin','active'),(2,'asd','sherul.dhanushka@gmail.com','1234','customer',NULL),(3,'fdsa','sonalifernando044@gmail.com','123','customer',NULL),(4,'Asdf','sh@gmail.com','1111','customer',NULL),(5,'shenal','fds@gmail.com','111','customer',NULL),(6,'asd','sonalifernando044@gmail.com','123','customer',NULL),(7,'fdsa','sherul.dhanushka@gmail.com','123','customer',NULL),(8,'asd','sonalifernando044@gmail.com','123','customer',NULL),(9,'asd','sonalifernando044@gmail.com','123','customer',NULL),(10,'fdsa','sonalifernando044@gmail.com','123','customer',NULL),(11,'admin','admin@gmail.com','1234','admin','active');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerceweb'
--

--
-- Dumping routines for database 'ecommerceweb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-20 15:24:25
