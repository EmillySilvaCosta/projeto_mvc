CREATE DATABASE  IF NOT EXISTS `gft_desafiomvc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gft_desafiomvc`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gft_desafiomvc
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `tb_grupo_participantes`
--

DROP TABLE IF EXISTS `tb_grupo_participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_grupo_participantes` (
  `grupo_id_grupo` bigint NOT NULL,
  `participantes_id_participante` bigint NOT NULL,
  UNIQUE KEY `UK_8xk8lvc0yohuvj31gs8cp3umf` (`participantes_id_participante`),
  KEY `FKa5krmahyjpyudd1s8wsirydub` (`grupo_id_grupo`),
  CONSTRAINT `FK53sgswh17s5pf4wtpbt91flba` FOREIGN KEY (`participantes_id_participante`) REFERENCES `tb_participante` (`id_participante`),
  CONSTRAINT `FKa5krmahyjpyudd1s8wsirydub` FOREIGN KEY (`grupo_id_grupo`) REFERENCES `tb_grupo` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grupo_participantes`
--

LOCK TABLES `tb_grupo_participantes` WRITE;
/*!40000 ALTER TABLE `tb_grupo_participantes` DISABLE KEYS */;
INSERT INTO `tb_grupo_participantes` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(3,7),(4,8),(4,9),(4,10);
/*!40000 ALTER TABLE `tb_grupo_participantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-04 15:03:15
