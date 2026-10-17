-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: pruebas_local
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Current Database: `pruebas_local`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pruebas_local` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pruebas_local`;

--
-- Table structure for table `alert_rule`
--

DROP TABLE IF EXISTS `alert_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `condition_expression` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `severity` varchar(20) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKnoymmtxnvwsj0olwqj3apqc6c` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule`
--

LOCK TABLES `alert_rule` WRITE;
/*!40000 ALTER TABLE `alert_rule` DISABLE KEYS */;
INSERT INTO `alert_rule` VALUES (1,_binary '','promedio < 60','2026-09-29 22:14:30.962077','Alerta para estudiantes con bajo rendimiento','Alerta de bajo rendimiento','HIGH','2026-09-29 22:14:30.962077'),(2,_binary '','promedio >= 60 AND promedio < 70','2026-10-03 08:46:26.844552','Identifica estudiantes con promedio entre 60 y 70','Rendimiento académico medio','MEDIUM','2026-10-03 08:46:26.844552'),(3,_binary '','promedio >= 60 AND promedio < 70','2026-10-07 18:01:38.822625','Detecta estudiantes con rendimiento académico regular','Alerta de rendimiento regular','MEDIUM','2026-10-07 18:01:38.822625'),(6,_binary '','inasistencias >= 3','2026-10-13 21:05:42.792183','Detecta estudiantes con tres o más inasistencias','Alerta de inasistencias','HIGH','2026-10-13 21:05:42.792183'),(7,_binary '','Anulaciones > 3','2026-10-13 21:08:53.937607','Detecta estudiantes con anulaciones de examen','Anulacion de examen','HIGH','2026-10-13 21:08:53.937607'),(8,_binary '','inasistencias > 40','2026-10-13 22:16:20.312721','Detecta estudiantes con promedio bajo','Alerta de bajo promedio','CRITICAL','2026-10-13 22:16:20.312721');
/*!40000 ALTER TABLE `alert_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_up`
--

DROP TABLE IF EXISTS `follow_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow_up` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `follow_up_date` date NOT NULL,
  `intervention_id` bigint NOT NULL,
  `observation` varchar(500) NOT NULL,
  `result` enum('IMPROVED','NO_CHANGE','PENDING','WORSENED') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_up`
--

LOCK TABLES `follow_up` WRITE;
/*!40000 ALTER TABLE `follow_up` DISABLE KEYS */;
INSERT INTO `follow_up` VALUES (1,_binary '\0','2026-09-25',1,'El estudiante asistió a la tutoría y mostró mejoría','IMPROVED'),(2,_binary '\0','2026-10-02',1,'Seguimiento de prueba para verificar los avances del estudiante.','IMPROVED'),(3,_binary '\0','2026-10-25',1,'El estudiante continúa presentando dificultades en los temas evaluados.','IMPROVED'),(4,_binary '\0','2026-10-17',1,'El estudiante ha presentando mejorias en los temas evaluados.','IMPROVED'),(5,_binary '\0','2026-10-20',1,'El estudiante esta presentando dificultades para asistir a clases','IMPROVED'),(6,_binary '\0','2026-10-25',1,'El estudiante no muestra avances.','WORSENED'),(7,_binary '\0','2026-10-27',1,'El estudiante no muestra avances, promedio sigue estando bajo.','NO_CHANGE');
/*!40000 ALTER TABLE `follow_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervention`
--

DROP TABLE IF EXISTS `intervention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intervention` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alert_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` varchar(500) NOT NULL,
  `responsible` varchar(150) NOT NULL,
  `start_date` date NOT NULL,
  `status` enum('CANCELLED','COMPLETED','IN_PROGRESS','PLANNED') NOT NULL,
  `type` enum('ACADEMIC_PLAN','MEETING','OTHER','PARENT_CONTACT','REFERRAL','TUTORING') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervention`
--

LOCK TABLES `intervention` WRITE;
/*!40000 ALTER TABLE `intervention` DISABLE KEYS */;
INSERT INTO `intervention` VALUES (1,10,'2026-09-29 23:02:52.185886','Tutoría de refuerzo en matemática','Lic. Ana Pérez','2026-09-20','PLANNED','TUTORING'),(2,10,'2026-10-03 08:46:59.949688','Apoyo académico en comprensión lectora','Lic. Miguel Hernández','2026-10-06','PLANNED','TUTORING'),(3,10,'2026-10-07 18:02:38.642162','Apoyo académico en comprensión lectora','Lic. Miguel Hernández','2026-10-12','PLANNED','TUTORING'),(4,10,'2026-10-13 21:11:02.245346','Sesión individual de seguimiento académico','Lic. Sofía Ramírez','2026-10-15','PLANNED','TUTORING'),(5,10,'2026-10-13 21:59:31.888429','Tutoría de refuerzo en Ingles','Lic. Jonathan Smith','2026-10-11','PLANNED','OTHER'),(6,10,'2026-10-13 22:02:55.806348','Tutoría de refuerzo en Programación','Lic. Cesar Smith','2026-10-12','PLANNED','OTHER');
/*!40000 ALTER TABLE `intervention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `teacher_code` varchar(255) NOT NULL,
  `teacher_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK98e7j8mw41re3p2mis5rr9608` (`teacher_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'carlos.mendez@prueba.com','ACTIVE','DOC001','Carlos Méndez'),(2,'prueba.doc002@example.com','ACTIVE','DOC002','Profesor de Prueba'),(3,'juanca.doc002@example.com','ACTIVE','DOC003','Juan Carlos'),(4,'jojavier.doc002@example.com','ACTIVE','DOC004','Jose Javier'),(5,'laura.castillo@example.com','ACTIVE','DOC007','Laura Castillo'),(6,'juan.carlos@example.com','INACTIVE','DOC005','Juan Carlos'),(7,'daniel.morales@example.com','SUSPENDED','DOC006','Daniel Morales');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pruebas_local'
--

--
-- Dumping routines for database 'pruebas_local'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-16 21:22:07
