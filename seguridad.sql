CREATE DATABASE  IF NOT EXISTS `seguridad` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `seguridad`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: seguridad
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
-- Table structure for table `tbl_aplicacion`
--

DROP TABLE IF EXISTS `tbl_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_aplicacion` (
  `PK_id_aplicacion` int NOT NULL,
  `PK_id_modulo` int NOT NULL,
  `nombre_aplicacion` varchar(45) DEFAULT NULL,
  `descripcion_aplicacion` varchar(200) DEFAULT NULL,
  `estado_aplicacion` tinyint DEFAULT NULL,
  PRIMARY KEY (`PK_id_aplicacion`,`PK_id_modulo`),
  KEY `fk_Aplicacion_Modulo` (`PK_id_modulo`),
  CONSTRAINT `fk_Aplicacion_Modulo` FOREIGN KEY (`PK_id_modulo`) REFERENCES `tbl_modulo` (`PK_id_Modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aplicacion`
--

LOCK TABLES `tbl_aplicacion` WRITE;
/*!40000 ALTER TABLE `tbl_aplicacion` DISABLE KEYS */;
INSERT INTO `tbl_aplicacion` VALUES (1,1,'mant',' ',1),(1001,1000,'Mantenimientos',' ',1),(1002,1000,'Movimientos de Inventario',' ',1),(1003,1000,'Ordenes de Compra',' ',1),(1004,1000,'Cotizaciones',' ',1);
/*!40000 ALTER TABLE `tbl_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bitacora`
--

DROP TABLE IF EXISTS `tbl_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bitacora` (
  `PK_id_bitacora` int NOT NULL AUTO_INCREMENT,
  `PK_id_usuario` varchar(25) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `host` varchar(45) DEFAULT NULL,
  `ip` varchar(25) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `tabla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PK_id_bitacora`,`PK_id_usuario`),
  KEY `fk_Bitacora_Usuario1` (`PK_id_usuario`),
  CONSTRAINT `fk_Bitacora_Usuario1` FOREIGN KEY (`PK_id_usuario`) REFERENCES `tbl_usuario` (`PK_id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bitacora`
--

LOCK TABLES `tbl_bitacora` WRITE;
/*!40000 ALTER TABLE `tbl_bitacora` DISABLE KEYS */;
INSERT INTO `tbl_bitacora` VALUES (1,'MiUsuario','2020-04-29','12:04:14','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(2,'MiUsuario','2020-04-29','12:09:15','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(3,'MiUsuario','2020-04-29','12:10:23','LIGIAABRILA131','10.211.55.3','Inserto un nuevo perfil: 1 - Adim','tbl_perfil'),(4,'MiUsuario','2020-04-29','12:10:32','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(5,'MiUsuario','2020-04-29','12:10:42','LIGIAABRILA131','10.211.55.3','Inserto un nuevo modulo: 1 - SIC','tbl_modulo'),(6,'MiUsuario','2020-04-29','12:10:46','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(7,'MiUsuario','2020-04-29','12:10:57','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(8,'MiUsuario','2020-04-29','12:10:57','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(9,'MiUsuario','2020-04-29','12:11:00','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(10,'MiUsuario','2020-04-29','12:11:06','LIGIAABRILA131','10.211.55.3','Asigno permiso: mant a perfil: Adim','tbl_usuario_aplicacion'),(11,'MiUsuario','2020-04-29','12:11:11','LIGIAABRILA131','10.211.55.3','Realizo una consulta a usuarios','tbl_usuario'),(12,'MiUsuario','2020-04-29','12:11:11','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(13,'MiUsuario','2020-04-29','12:11:16','LIGIAABRILA131','10.211.55.3','Asigno perfil: Adim a usuario: usu','tbl_usuario_perfil'),(14,'MiUsuario','2020-04-29','12:11:19','LIGIAABRILA131','10.211.55.3','Realizo una consulta a usuarios','tbl_usuario'),(15,'MiUsuario','2020-04-29','12:11:19','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(16,'MiUsuario','2020-04-29','12:11:23','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(17,'MiUsuario','2020-04-29','12:11:31','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(18,'MiUsuario','2020-04-29','12:11:37','LIGIAABRILA131','10.211.55.3','Asigno aplicacion: mant a usuario: MiUsuario','tbl_usuario_aplicacion'),(19,'MiUsuario','2020-04-29','12:11:37','LIGIAABRILA131','10.211.55.3','Asigno aplicacion: mant a usuario: usu','tbl_usuario_aplicacion'),(20,'MiUsuario','2020-04-29','12:11:42','LIGIAABRILA131','10.211.55.3','Realizo una consulta a usuarios','tbl_usuario'),(21,'MiUsuario','2020-04-29','12:11:42','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(22,'MiUsuario','2020-04-29','12:11:47','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(23,'MiUsuario','2020-04-29','12:11:51','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(24,'MiUsuario','2020-04-29','12:11:51','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(25,'MiUsuario','2020-04-29','12:11:56','LIGIAABRILA131','10.211.55.3','Realizo una consulta a usuarios','tbl_usuario'),(26,'MiUsuario','2020-04-29','12:11:56','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(27,'MiUsuario','2020-04-29','12:12:00','LIGIAABRILA131','10.211.55.3','Consulto bitacora','tbl_bitacora'),(28,'usu','2020-04-29','12:13:20','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(29,'usu','2020-04-29','12:13:40','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(30,'usu','2020-04-29','12:14:12','LIGIAABRILA131','10.211.55.3','Realizo una consulta a usuarios','tbl_usuario'),(31,'usu','2020-04-29','12:14:12','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(32,'usu','2020-04-29','12:14:16','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(33,'usu','2020-04-29','12:14:22','LIGIAABRILA131','10.211.55.3','Asigno aplicacion: mant a usuario: usu','tbl_usuario_aplicacion'),(34,'usu','2020-04-29','12:14:44','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(35,'usu','2020-04-29','12:15:02','LIGIAABRILA131','10.211.55.3','Realizo una consulta a usuarios','tbl_usuario'),(36,'usu','2020-04-29','12:15:02','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(37,'usu','2020-04-29','12:15:06','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(38,'usu','2020-04-29','12:15:13','LIGIAABRILA131','10.211.55.3','Asigno aplicacion: mant a usuario: usu','tbl_usuario_aplicacion'),(39,'usu','2020-04-29','12:15:17','LIGIAABRILA131','10.211.55.3','Consulto bitacora','tbl_bitacora'),(40,'MiUsuario','2020-04-29','12:16:32','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(41,'MiUsuario','2020-04-29','12:16:48','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(42,'MiUsuario','2020-04-29','12:17:49','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(43,'MiUsuario','2020-04-29','12:17:50','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(44,'MiUsuario','2020-04-29','12:18:00','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(45,'MiUsuario','2020-04-29','12:18:09','LIGIAABRILA131','10.211.55.3','Asigno permiso: mant a perfil: Adim','tbl_usuario_aplicacion'),(46,'MiUsuario','2020-04-29','12:18:17','LIGIAABRILA131','10.211.55.3','Realizo una consulta a usuarios','tbl_usuario'),(47,'MiUsuario','2020-04-29','12:18:17','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(48,'MiUsuario','2020-04-29','12:18:22','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(49,'MiUsuario','2020-04-29','12:18:23','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(50,'MiUsuario','2020-04-29','12:18:29','LIGIAABRILA131','10.211.55.3','Asigno perfil: Adim a usuario: MiUsuario','tbl_usuario_perfil'),(51,'MiUsuario','2020-04-29','12:18:35','LIGIAABRILA131','10.211.55.3','Realizo una consulta a usuarios','tbl_usuario'),(52,'MiUsuario','2020-04-29','12:18:36','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(53,'MiUsuario','2020-04-29','12:18:41','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(54,'MiUsuario','2020-04-29','12:18:51','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(55,'MiUsuario','2020-04-29','12:18:58','LIGIAABRILA131','10.211.55.3','Asigno aplicacion: mant a usuario: MiUsuario','tbl_usuario_aplicacion'),(56,'MiUsuario','2020-04-29','12:18:59','LIGIAABRILA131','10.211.55.3','Asigno aplicacion: mant a usuario: usu','tbl_usuario_aplicacion'),(57,'MiUsuario','2020-04-29','12:19:03','LIGIAABRILA131','10.211.55.3','Consulto bitacora','tbl_bitacora'),(58,'MiUsuario','2020-04-29','12:21:13','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(61,'usu','2020-05-03','10:57:03','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(62,'usu','2020-05-03','11:24:25','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(63,'MiUsuario','2020-05-03','11:28:12','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(64,'usu','2020-05-03','11:37:15','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(65,'usu','2020-05-06','09:49:31','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(66,'usu','2020-05-06','09:53:54','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(67,'usu','2020-05-06','09:54:09','LIGIAABRILA131','10.211.55.3','Realizo una consulta a usuarios','tbl_usuario'),(68,'usu','2020-05-06','09:54:09','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(69,'usu','2020-05-06','09:54:13','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(70,'usu','2020-05-06','09:54:26','LIGIAABRILA131','10.211.55.3','Inserto un nuevo modulo: 2 - SCM','tbl_modulo'),(71,'usu','2020-05-06','09:58:18','LIGIAABRILA131','10.211.55.3','Realizo una consulta a usuarios','tbl_usuario'),(72,'usu','2020-05-06','09:58:19','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(73,'usu','2020-05-06','09:58:22','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(74,'usu','2020-05-06','09:58:24','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(75,'usu','2020-05-06','09:58:29','LIGIAABRILA131','10.211.55.3','Realizo una consulta a perfiles','tbl_perfil'),(76,'usu','2020-05-06','09:58:29','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(77,'usu','2020-05-06','09:58:33','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(78,'usu','2020-05-06','09:58:38','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(79,'usu','2020-05-06','09:58:45','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(80,'usu','2020-05-06','09:58:52','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(81,'usu','2020-05-06','09:59:11','LIGIAABRILA131','10.211.55.3','Asigno permiso: Mantenimientos a perfil: Adim','tbl_usuario_aplicacion'),(82,'usu','2020-05-06','09:59:20','LIGIAABRILA131','10.211.55.3','Asigno permiso: Ordenes de Compra a perfil: Adim','tbl_usuario_aplicacion'),(83,'usu','2020-05-06','09:59:21','LIGIAABRILA131','10.211.55.3','Asigno permiso: Cotizaciones a perfil: Adim','tbl_usuario_aplicacion'),(84,'usu','2020-05-06','09:59:25','LIGIAABRILA131','10.211.55.3','Realizo una consulta a usuarios','tbl_usuario'),(85,'usu','2020-05-06','09:59:25','LIGIAABRILA131','10.211.55.3','Realizo una consulta a modulos','tbl_modulos'),(86,'usu','2020-05-06','09:59:29','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(87,'usu','2020-05-06','09:59:34','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(88,'usu','2020-05-06','09:59:41','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(89,'usu','2020-05-06','09:59:46','LIGIAABRILA131','10.211.55.3','Realizo una consulta a aplicaciones','tbl_aplicacion'),(90,'usu','2020-05-06','10:00:00','LIGIAABRILA131','10.211.55.3','Asigno aplicacion: Mantenimientos a usuario: usu','tbl_usuario_aplicacion'),(91,'usu','2020-05-06','10:00:02','LIGIAABRILA131','10.211.55.3','Asigno aplicacion: Cotizaciones a usuario: usu','tbl_usuario_aplicacion'),(92,'usu','2020-05-06','10:02:39','LIGIAABRILA131','10.211.55.3','Se actualizó un registro','tipos_movimientos'),(93,'usu','2020-05-06','10:02:55','LIGIAABRILA131','10.211.55.3','Se creó un nuevo registro','tipos_movimientos'),(94,'usu','2020-05-06','10:04:07','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(95,'usu','2020-05-06','12:51:42','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(96,'usu','2020-05-06','12:55:57','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(97,'usu','2020-05-06','12:57:12','LIGIAABRILA131','10.211.55.3','Se actualizó un registro','productos'),(98,'usu','2020-05-06','12:57:35','LIGIAABRILA131','10.211.55.3','Se actualizó un registro','productos'),(99,'usu','2020-05-06','12:57:44','LIGIAABRILA131','10.211.55.3','Se actualizó un registro','productos'),(100,'usu','2020-05-06','01:00:50','LIGIAABRILA131','10.211.55.3','Se creó un nuevo registro','tipos_movimientos'),(101,'usu','2020-05-06','01:01:05','LIGIAABRILA131','10.211.55.3','Se actualizó un registro','tipos_movimientos'),(102,'usu','2020-05-09','06:56:43','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(103,'usu','2020-05-09','06:59:15','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(104,'usu','2020-05-09','07:01:38','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(105,'usu','2020-05-09','07:02:38','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(106,'usu','2020-05-09','07:05:00','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(107,'usu','2020-05-09','07:07:05','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(108,'usu','2020-05-09','07:09:52','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(109,'usu','2020-05-09','07:11:32','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(110,'usu','2020-05-09','07:12:14','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(111,'usu','2020-05-09','07:13:23','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(112,'usu','2020-05-09','07:19:35','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(113,'usu','2020-05-09','07:20:18','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(114,'usu','2020-05-09','07:25:38','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(115,'usu','2020-05-09','07:26:23','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(116,'usu','2020-05-09','07:28:04','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(117,'usu','2020-05-09','09:27:18','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(118,'usu','2020-05-09','09:28:14','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(119,'usu','2020-05-10','06:12:18','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(120,'usu','2020-05-10','06:14:26','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(121,'usu','2020-05-10','08:49:55','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(122,'usu','2020-05-10','08:56:17','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(123,'usu','2020-05-10','08:57:36','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(124,'usu','2020-05-10','09:18:23','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(125,'usu','2020-05-11','08:15:20','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(126,'usu','2020-05-11','08:16:00','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(127,'usu','2020-05-11','08:18:19','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(128,'usu','2020-05-11','08:20:18','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(129,'usu','2020-05-11','08:22:47','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(130,'usu','2020-05-11','08:25:13','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(131,'usu','2020-05-11','08:28:13','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(132,'usu','2020-05-11','08:29:07','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(133,'usu','2020-05-11','08:30:04','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(134,'usu','2020-05-11','08:38:19','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(135,'usu','2020-05-11','08:41:06','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(136,'usu','2020-05-11','08:42:23','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(137,'usu','2020-05-11','08:43:19','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(138,'usu','2020-05-11','08:46:34','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(139,'usu','2020-05-11','09:09:12','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(140,'usu','2020-05-11','09:11:31','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(141,'usu','2020-05-11','09:13:01','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(142,'usu','2020-05-11','09:13:48','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(143,'usu','2020-05-11','09:15:42','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(144,'usu','2020-05-11','09:26:29','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(145,'usu','2020-05-11','09:32:30','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(146,'usu','2020-05-11','09:39:43','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(147,'usu','2020-05-11','09:40:34','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(148,'usu','2020-05-11','09:41:22','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(149,'usu','2020-05-11','09:42:05','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(150,'usu','2020-05-11','10:33:15','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(151,'usu','2020-05-12','02:31:08','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(152,'usu','2020-05-12','02:33:08','LIGIAABRILA131','10.211.55.3','Se creó un nuevo registro','proveedores'),(153,'usu','2020-05-12','02:35:47','LIGIAABRILA131','10.211.55.3','Se creó un nuevo registro','tipos_movimientos'),(154,'usu','2020-05-12','02:36:37','LIGIAABRILA131','10.211.55.3','Se creó un nuevo registro','tipos_movimientos'),(155,'usu','2020-05-12','02:41:53','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(156,'usu','2020-05-12','02:47:06','LIGIAABRILA131','10.211.55.3','Se creó un nuevo registro','productos'),(157,'usu','2020-05-12','06:18:37','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(158,'usu','2020-05-12','09:17:37','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(159,'usu','2020-05-12','09:18:30','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(160,'usu','2020-05-12','09:38:30','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(161,'usu','2020-05-12','09:39:23','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(162,'usu','2020-05-12','09:53:20','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(163,'usu','2020-05-12','09:54:56','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(164,'usu','2020-05-12','09:55:51','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(165,'usu','2020-05-12','09:56:26','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(166,'usu','2020-05-12','09:57:00','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(167,'usu','2020-05-12','09:58:19','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(168,'usu','2020-05-12','09:59:20','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(169,'usu','2020-05-12','10:00:05','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(170,'usu','2020-05-12','10:07:27','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(171,'usu','2020-05-12','10:12:32','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(172,'usu','2020-05-12','10:14:54','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(173,'usu','2020-05-12','10:18:35','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(174,'usu','2020-05-12','10:51:58','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(175,'usu','2020-05-12','10:53:23','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(176,'usu','2020-05-12','11:06:09','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(177,'usu','2020-05-12','11:09:22','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(178,'usu','2020-05-12','11:10:45','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(179,'usu','2020-05-12','11:11:20','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(180,'usu','2020-05-12','11:13:09','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(181,'usu','2020-05-12','11:15:28','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(182,'usu','2020-05-12','11:16:43','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(183,'usu','2020-05-12','11:18:11','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(184,'usu','2020-05-12','11:19:49','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(185,'usu','2020-05-12','11:45:28','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(186,'usu','2020-05-12','11:52:58','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(187,'usu','2020-05-12','11:54:52','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(188,'usu','2020-05-13','12:01:33','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(189,'usu','2020-05-13','12:02:19','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(190,'usu','2020-05-13','12:03:23','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(191,'usu','2020-05-13','12:22:45','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(192,'usu','2020-05-13','12:28:30','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(193,'usu','2020-05-13','12:32:58','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(194,'usu','2020-05-13','12:38:30','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(195,'usu','2020-05-13','12:39:36','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(196,'usu','2020-05-13','12:40:57','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(197,'usu','2020-05-13','12:50:25','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(198,'usu','2020-05-13','12:50:59','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(199,'usu','2020-05-13','12:51:44','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(200,'usu','2020-05-13','12:53:33','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(201,'usu','2020-05-13','12:56:07','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(202,'usu','2020-05-13','12:57:18','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(203,'usu','2020-05-13','12:58:15','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(204,'usu','2020-05-13','12:59:34','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(205,'usu','2020-05-13','07:05:48','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(206,'usu','2020-05-13','07:18:47','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(207,'usu','2020-05-13','07:20:30','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(208,'usu','2020-05-13','07:26:15','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(209,'usu','2020-05-13','07:28:17','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(210,'usu','2020-05-13','07:29:02','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(211,'usu','2020-05-13','07:32:47','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(212,'usu','2020-05-13','07:34:53','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(213,'usu','2020-05-13','07:36:31','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(214,'usu','2020-05-13','07:38:50','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(215,'usu','2020-05-13','07:43:42','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(216,'usu','2020-05-13','07:44:50','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(217,'usu','2020-05-13','07:47:49','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(218,'usu','2020-05-13','07:48:57','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(219,'usu','2020-05-13','08:12:03','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(220,'usu','2020-05-13','08:12:55','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(221,'usu','2020-05-13','08:14:05','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(222,'usu','2020-05-13','08:15:51','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(223,'usu','2020-05-13','08:17:55','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(224,'usu','2020-05-13','08:25:51','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(225,'usu','2020-05-13','08:30:36','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(226,'usu','2020-05-13','08:33:10','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(227,'usu','2020-05-13','08:35:53','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(228,'usu','2020-05-13','08:37:49','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(229,'usu','2020-05-13','08:39:15','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(230,'usu','2020-05-13','08:41:01','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(231,'usu','2020-05-13','08:46:13','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(232,'usu','2020-05-13','04:34:32','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(233,'usu','2020-05-13','04:40:17','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(234,'usu','2020-05-13','04:45:27','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(235,'usu','2020-05-13','04:49:01','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(236,'usu','2020-05-13','04:51:15','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(237,'usu','2020-05-13','04:59:53','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(238,'usu','2020-05-13','05:01:46','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(239,'usu','2020-05-15','09:41:34','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(240,'usu','2020-05-15','09:45:20','LIGIAABRILA131','10.211.55.3','Se actualizó un registro','productos'),(241,'usu','2020-05-15','09:48:25','LIGIAABRILA131','10.211.55.3','Se actualizó un registro','productos'),(242,'usu','2020-05-15','09:50:40','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(243,'usu','2020-05-15','09:52:41','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(244,'usu','2020-05-15','09:54:09','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(245,'usu','2020-05-15','09:55:43','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(246,'usu','2020-05-15','09:57:12','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(247,'usu','2020-05-15','09:58:18','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(248,'usu','2020-05-15','09:59:09','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(249,'usu','2020-05-15','10:00:44','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(250,'usu','2020-05-15','10:04:48','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(251,'usu','2020-05-15','10:06:10','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(252,'usu','2020-05-15','10:06:30','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(253,'usu','2020-05-15','10:07:26','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(254,'usu','2020-05-15','10:10:21','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(255,'usu','2020-05-15','10:11:28','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(256,'usu','2020-05-15','10:13:36','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(257,'usu','2020-05-15','10:14:44','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(258,'usu','2020-05-15','10:15:44','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(259,'usu','2020-05-15','10:20:12','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(260,'usu','2020-05-15','10:20:58','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(261,'usu','2020-05-17','10:08:46','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(262,'usu','2020-05-17','10:10:10','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(263,'usu','2020-05-17','11:15:56','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(264,'usu','2020-05-17','11:58:00','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(265,'usu','2020-05-17','12:01:08','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(266,'usu','2020-05-17','12:04:07','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(267,'usu','2020-05-17','12:05:27','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(268,'usu','2020-05-17','12:06:59','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(269,'usu','2020-05-17','12:08:12','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(270,'usu','2020-05-17','02:59:25','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(271,'usu','2020-05-17','03:23:31','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(272,'usu','2020-05-17','03:25:50','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(273,'usu','2020-05-17','03:26:30','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(274,'usu','2020-05-17','08:18:58','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(275,'usu','2020-05-17','08:19:59','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(276,'usu','2020-05-17','08:51:11','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(277,'usu','2020-05-17','09:18:13','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(278,'usu','2020-05-17','09:55:27','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(279,'usu','2020-05-17','09:57:08','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(280,'usu','2020-05-17','09:58:54','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(281,'usu','2020-05-17','10:03:44','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(282,'usu','2020-05-17','10:12:35','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(283,'usu','2020-05-18','12:45:28','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(284,'usu','2020-05-19','04:56:10','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(285,'usu','2020-05-19','04:57:21','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login'),(286,'usu','2020-05-19','05:01:03','LIGIAABRILA131','10.211.55.3','Se logeo al sistema','Login');
/*!40000 ALTER TABLE `tbl_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modulo`
--

DROP TABLE IF EXISTS `tbl_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_modulo` (
  `PK_id_Modulo` int NOT NULL,
  `nombre_modulo` varchar(45) DEFAULT NULL,
  `descripcion_modulo` varchar(200) DEFAULT NULL,
  `estado_modulo` tinyint DEFAULT NULL,
  PRIMARY KEY (`PK_id_Modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modulo`
--

LOCK TABLES `tbl_modulo` WRITE;
/*!40000 ALTER TABLE `tbl_modulo` DISABLE KEYS */;
INSERT INTO `tbl_modulo` VALUES (1,'SIC',' ',1),(1000,'SCM',' ',1);
/*!40000 ALTER TABLE `tbl_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perfil_detalle`
--

DROP TABLE IF EXISTS `tbl_perfil_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_perfil_detalle` (
  `PK_id_perfil` int NOT NULL,
  `PK_id_aplicacion` int NOT NULL,
  `ingresar` tinyint DEFAULT NULL,
  `consultar` tinyint DEFAULT NULL,
  `modificar` tinyint DEFAULT NULL,
  `eliminar` tinyint DEFAULT NULL,
  `imprimir` tinyint DEFAULT NULL,
  PRIMARY KEY (`PK_id_perfil`,`PK_id_aplicacion`),
  KEY `fk_Perfil_detalle_Aplicacion1` (`PK_id_aplicacion`),
  CONSTRAINT `fk_Perfil_detalle_Aplicacion1` FOREIGN KEY (`PK_id_aplicacion`) REFERENCES `tbl_aplicacion` (`PK_id_aplicacion`),
  CONSTRAINT `fk_Perfil_detalle_Perfil1` FOREIGN KEY (`PK_id_perfil`) REFERENCES `tbl_perfil_encabezado` (`PK_id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perfil_detalle`
--

LOCK TABLES `tbl_perfil_detalle` WRITE;
/*!40000 ALTER TABLE `tbl_perfil_detalle` DISABLE KEYS */;
INSERT INTO `tbl_perfil_detalle` VALUES (1,1,1,1,1,1,1),(1,1001,1,1,1,1,1),(1,1002,1,1,1,1,1),(1,1003,1,1,1,1,1),(1,1004,1,1,1,1,1);
/*!40000 ALTER TABLE `tbl_perfil_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perfil_encabezado`
--

DROP TABLE IF EXISTS `tbl_perfil_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_perfil_encabezado` (
  `PK_id_perfil` int NOT NULL,
  `nombre_perfil` varchar(45) DEFAULT NULL,
  `descripcion_perfil` varchar(200) DEFAULT NULL,
  `estado_perfil` tinyint DEFAULT NULL,
  PRIMARY KEY (`PK_id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perfil_encabezado`
--

LOCK TABLES `tbl_perfil_encabezado` WRITE;
/*!40000 ALTER TABLE `tbl_perfil_encabezado` DISABLE KEYS */;
INSERT INTO `tbl_perfil_encabezado` VALUES (1,'Adim',' ',1);
/*!40000 ALTER TABLE `tbl_perfil_encabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario` (
  `PK_id_usuario` varchar(25) NOT NULL,
  `nombre_usuario` varchar(45) DEFAULT NULL,
  `apellido_usuarios` varchar(45) DEFAULT NULL,
  `password_usuario` varchar(45) DEFAULT NULL,
  `cambio_contrasena` tinyint DEFAULT NULL,
  `estado_usuario` tinyint DEFAULT NULL,
  PRIMARY KEY (`PK_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES ('MiUsuario','Usuario','Prueba','e19d5cd5af0378da05f63f891c7467af',0,1),('usu',' ',' ','25d55ad283aa400af464c76d713c07ad',NULL,1);
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario_aplicacion`
--

DROP TABLE IF EXISTS `tbl_usuario_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario_aplicacion` (
  `PK_id_usuario` varchar(25) NOT NULL,
  `PK_id_aplicacion` int NOT NULL,
  `ingresar` tinyint DEFAULT NULL,
  `consultar` tinyint DEFAULT NULL,
  `modificar` tinyint DEFAULT NULL,
  `eliminar` tinyint DEFAULT NULL,
  `imprimir` tinyint DEFAULT NULL,
  PRIMARY KEY (`PK_id_usuario`,`PK_id_aplicacion`),
  KEY `fk_tbl_usuario_aplicacion_tbl_aplicacion1` (`PK_id_aplicacion`),
  CONSTRAINT `fk_tbl_usuario_aplicacion_tbl_aplicacion1` FOREIGN KEY (`PK_id_aplicacion`) REFERENCES `tbl_aplicacion` (`PK_id_aplicacion`),
  CONSTRAINT `fk_Usuario_aplicacion_Usuario1` FOREIGN KEY (`PK_id_usuario`) REFERENCES `tbl_usuario` (`PK_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario_aplicacion`
--

LOCK TABLES `tbl_usuario_aplicacion` WRITE;
/*!40000 ALTER TABLE `tbl_usuario_aplicacion` DISABLE KEYS */;
INSERT INTO `tbl_usuario_aplicacion` VALUES ('MiUsuario',1,1,1,1,1,1),('usu',1,1,1,1,1,1);
/*!40000 ALTER TABLE `tbl_usuario_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario_perfil`
--

DROP TABLE IF EXISTS `tbl_usuario_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario_perfil` (
  `PK_id_usuario` varchar(25) NOT NULL,
  `PK_id_perfil` int NOT NULL,
  PRIMARY KEY (`PK_id_usuario`,`PK_id_perfil`),
  KEY `fk_Usuario_perfil_Perfil1` (`PK_id_perfil`),
  CONSTRAINT `fk_Usuario_perfil_Perfil1` FOREIGN KEY (`PK_id_perfil`) REFERENCES `tbl_perfil_encabezado` (`PK_id_perfil`),
  CONSTRAINT `fk_Usuario_perfil_Usuario1` FOREIGN KEY (`PK_id_usuario`) REFERENCES `tbl_usuario` (`PK_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario_perfil`
--

LOCK TABLES `tbl_usuario_perfil` WRITE;
/*!40000 ALTER TABLE `tbl_usuario_perfil` DISABLE KEYS */;
INSERT INTO `tbl_usuario_perfil` VALUES ('MiUsuario',1),('usu',1);
/*!40000 ALTER TABLE `tbl_usuario_perfil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-19 17:06:52
