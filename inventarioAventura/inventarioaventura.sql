CREATE DATABASE  IF NOT EXISTS `inventarioaventura` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventarioaventura`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inventarioaventura
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add categoria',7,'add_categoria'),(26,'Can change categoria',7,'change_categoria'),(27,'Can delete categoria',7,'delete_categoria'),(28,'Can view categoria',7,'view_categoria'),(29,'Can add gestion_actividades',8,'add_gestion_actividades'),(30,'Can change gestion_actividades',8,'change_gestion_actividades'),(31,'Can delete gestion_actividades',8,'delete_gestion_actividades'),(32,'Can view gestion_actividades',8,'view_gestion_actividades'),(33,'Can add crear_actividades',9,'add_crear_actividades'),(34,'Can change crear_actividades',9,'change_crear_actividades'),(35,'Can delete crear_actividades',9,'delete_crear_actividades'),(36,'Can view crear_actividades',9,'view_crear_actividades'),(37,'Can add perfil',10,'add_perfil'),(38,'Can change perfil',10,'change_perfil'),(39,'Can delete perfil',10,'delete_perfil'),(40,'Can view perfil',10,'view_perfil'),(41,'Can add Reserva',11,'add_reserva'),(42,'Can change Reserva',11,'change_reserva'),(43,'Can delete Reserva',11,'delete_reserva'),(44,'Can view Reserva',11,'view_reserva');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$oCXknmHQE7ID3shRx4DDhe$Fyr8UHvEugeNParVpVdcUrPGwo39joOab/IKvhldVgA=','2026-11-16 13:57:10.009360',1,'admin','','','',1,1,'2026-11-13 01:37:11.361970'),(2,'pbkdf2_sha256$1000000$UInQ4czGabqNrGgfj1ScBU$KJT0h9Wrxo52fbzwYyDU6w6610QEDCazDKNmJb5EhmU=','2026-11-16 13:52:50.547784',0,'turista_prueba26','','','turista26@example.com',0,1,'2026-11-14 01:32:53.855356'),(3,'pbkdf2_sha256$1000000$upDsKIAFxfvjCBWxBoMI0f$IPReP+Z6pnSynjDiGvL4EfQwPbeGJE0X8A54XP8oeGc=','2026-11-16 14:00:15.157504',0,'guia_prueba26','','','guia.prueba26@gmail.com',0,1,'2026-11-14 03:41:18.506632'),(4,'pbkdf2_sha256$1000000$9h31DgZirAFiDJ5e6Me6h4$dJaWQ9pYULiLYp6GoQfbFs5sjgEfCDJQIFxMce65XkE=','2026-11-16 01:18:35.712241',0,'guia_prueba27','','','guia27@gmail.com',0,1,'2026-11-14 21:39:16.430047'),(5,'pbkdf2_sha256$1000000$KGCocLRPygAxmPE864A3V1$VU6aLIocStqB/ozfe1UbDkLzHOluJq3Ot2j+sCOEV/k=','2026-11-16 14:52:16.600821',1,'admin_aventuras','','','admin@aventurasdelsur.cl',1,1,'2026-11-15 20:06:39.202084'),(6,'pbkdf2_sha256$1000000$azVpmLfi9YVIExM3Sv5gqD$9Sa1eCFHtUFFmydO9kKmjubDlVbtPobSYReJmyQIehg=','2026-11-15 22:13:08.369810',0,'turista_prueba27','','','turista27@gmail.com',0,1,'2026-11-15 22:12:53.745343');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas_perfil`
--

DROP TABLE IF EXISTS `cuentas_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_perfil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rol` varchar(20) NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `cuentas_perfil_usuario_id_06f8a1e5_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_perfil`
--

LOCK TABLES `cuentas_perfil` WRITE;
/*!40000 ALTER TABLE `cuentas_perfil` DISABLE KEYS */;
INSERT INTO `cuentas_perfil` VALUES (1,'turista',2),(2,'guia',3),(3,'guia',4),(4,'administrador',5),(5,'turista',6);
/*!40000 ALTER TABLE `cuentas_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-11-14 02:24:07.229696','1','Trekking - Actividades de caminata y exploración por senderos naturales de la Patagonia. - True',1,'[{\"added\": {}}]',7,1),(2,'2026-11-14 02:26:31.387720','1','Trekking en la Patagonia - Recorrido guiado por senderos naturales de la Patagonia, disfrutando de sus paisajes, bosques y montañas. - $15000.00 - 10 - 2026-11-20 10:00:00-03:00',1,'[{\"added\": {}}]',8,1),(3,'2026-11-14 20:07:33.792844','3','guia_prueba26',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(4,'2026-11-14 20:09:41.279572','2','turista_prueba26',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(5,'2026-11-15 20:19:31.692172','4','admin_aventuras - Administrador',1,'[{\"added\": {}}]',10,5);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'cuentas','perfil'),(7,'experiencias','categoria'),(9,'experiencias','crear_actividades'),(8,'experiencias','gestion_actividades'),(11,'experiencias','reserva'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-11-12 23:37:58.590255'),(2,'auth','0001_initial','2026-11-12 23:38:00.209361'),(3,'admin','0001_initial','2026-11-12 23:38:00.511356'),(4,'admin','0002_logentry_remove_auto_add','2026-11-12 23:38:00.526286'),(5,'admin','0003_logentry_add_action_flag_choices','2026-11-12 23:38:00.537410'),(6,'contenttypes','0002_remove_content_type_name','2026-11-12 23:38:00.743539'),(7,'auth','0002_alter_permission_name_max_length','2026-11-12 23:38:00.873632'),(8,'auth','0003_alter_user_email_max_length','2026-11-12 23:38:00.918089'),(9,'auth','0004_alter_user_username_opts','2026-11-12 23:38:00.931667'),(10,'auth','0005_alter_user_last_login_null','2026-11-12 23:38:01.037583'),(11,'auth','0006_require_contenttypes_0002','2026-11-12 23:38:01.043806'),(12,'auth','0007_alter_validators_add_error_messages','2026-11-12 23:38:01.064544'),(13,'auth','0008_alter_user_username_max_length','2026-11-12 23:38:01.210007'),(14,'auth','0009_alter_user_last_name_max_length','2026-11-12 23:38:01.389498'),(15,'auth','0010_alter_group_name_max_length','2026-11-12 23:38:01.424215'),(16,'auth','0011_update_proxy_permissions','2026-11-12 23:38:01.441061'),(17,'auth','0012_alter_user_first_name_max_length','2026-11-12 23:38:01.550748'),(18,'experiencias','0001_initial','2026-11-12 23:38:01.755388'),(19,'experiencias','0002_categoria_gestion_actividades_delete_experiencia','2026-11-12 23:38:02.257152'),(20,'experiencias','0003_crear_actividades','2026-11-12 23:38:02.704286'),(21,'experiencias','0004_gestion_actividades_imagen','2026-11-12 23:38:02.827723'),(22,'experiencias','0005_remove_gestion_actividades_imagen','2026-11-12 23:38:02.950092'),(23,'sessions','0001_initial','2026-11-12 23:38:03.021483'),(24,'cuentas','0001_initial','2026-11-13 17:53:25.426934'),(25,'experiencias','0006_reserva','2026-11-15 19:23:22.805989'),(26,'experiencias','0007_estado_pago_por_verificar','2026-11-16 16:22:03.971434');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7p2kminwcqmkd6wpxsv45i48526qnnoa','.eJxVjDEOgzAMAP_iuYoghLhh7M4bIjt2GtoKJAJT1b9XSAztene6N0TatxL3qmucBAawcPllTOmp8yHkQfN9MWmZt3VicyTmtNWMi-jrdrZ_g0K1wADYs20aFmxb4uyRgmTxKZAn1ladU7IOQ8qCKinIFfuAnnxPuek6Uvh8AQj7OPw:1xSfv2:7W2lQsFGDbroosGUpEadTh1UI3y9qTzu9eLo07-ysuk','2026-11-29 19:29:40.381878'),('mgewqlp7qvhd3fjwg2oag0b7pia12jp3','.eJxVjDEOwjAMAP_iGUWtQxzSkb1viFzb0AJKpaadEH9HlTrAene6N2Te1jFv1ZY8KXQQ4PTLBpanlV3og8t9djKXdZkGtyfusNX1s9rrerR_g5HrCB2gMIryDYMkbVIbkxcM5pH8wBalIU0Yz54ICYmDXhrW2JoIpmBi8PkC6DE4AA:1xSy48:h9AxihdGdOWJkrsYtjzqQslkh2-sfTUJyb4tcXtiV4w','2026-11-30 14:52:16.609344');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_categoria`
--

DROP TABLE IF EXISTS `experiencias_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_categoria`
--

LOCK TABLES `experiencias_categoria` WRITE;
/*!40000 ALTER TABLE `experiencias_categoria` DISABLE KEYS */;
INSERT INTO `experiencias_categoria` VALUES (1,'Trekking','Actividades de caminata y exploración por senderos naturales de la Patagonia.',1),(2,'Kayak','Actividades recreativas de navegación en kayak en espacios acuáticos naturales.',1),(3,'Cabalgatas','Paseos guiados a caballo por paisajes naturales de la Patagonia y el sur de Chile.',1),(4,'Canopy','Actividad de aventura que consiste en desplazarse entre plataformas y árboles mediante circuitos de cables elevados.',1),(5,'Arriendo de equipos','Servicio de alquiler de equipos y accesorios necesarios para realizar actividades recreativas y aventuras al aire libre.',1);
/*!40000 ALTER TABLE `experiencias_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_crear_actividades`
--

DROP TABLE IF EXISTS `experiencias_crear_actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_crear_actividades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cupo_maximo` int NOT NULL,
  `fecha_hora` datetime(6) NOT NULL,
  `categoria_id` bigint NOT NULL,
  `usuario_creador_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiencias_crear_a_categoria_id_16dbd624_fk_experienc` (`categoria_id`),
  KEY `experiencias_crear_a_usuario_creador_id_8e905d76_fk_auth_user` (`usuario_creador_id`),
  CONSTRAINT `experiencias_crear_a_categoria_id_16dbd624_fk_experienc` FOREIGN KEY (`categoria_id`) REFERENCES `experiencias_categoria` (`id`),
  CONSTRAINT `experiencias_crear_a_usuario_creador_id_8e905d76_fk_auth_user` FOREIGN KEY (`usuario_creador_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_crear_actividades`
--

LOCK TABLES `experiencias_crear_actividades` WRITE;
/*!40000 ALTER TABLE `experiencias_crear_actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiencias_crear_actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_gestion_actividades`
--

DROP TABLE IF EXISTS `experiencias_gestion_actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_gestion_actividades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cupo_maximo` int NOT NULL,
  `fecha_hora` datetime(6) NOT NULL,
  `categoria_id` bigint NOT NULL,
  `usuario_creador_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiencias_gestion_categoria_id_b5d67a1f_fk_experienc` (`categoria_id`),
  KEY `experiencias_gestion_usuario_creador_id_7dee8ffc_fk_auth_user` (`usuario_creador_id`),
  CONSTRAINT `experiencias_gestion_categoria_id_b5d67a1f_fk_experienc` FOREIGN KEY (`categoria_id`) REFERENCES `experiencias_categoria` (`id`),
  CONSTRAINT `experiencias_gestion_usuario_creador_id_7dee8ffc_fk_auth_user` FOREIGN KEY (`usuario_creador_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_gestion_actividades`
--

LOCK TABLES `experiencias_gestion_actividades` WRITE;
/*!40000 ALTER TABLE `experiencias_gestion_actividades` DISABLE KEYS */;
INSERT INTO `experiencias_gestion_actividades` VALUES (1,'Trekking en la Patagonia','Recorrido guiado por senderos naturales de la Patagonia, disfrutando de sus paisajes, bosques y montañas.',15000.00,10,'2026-11-20 13:00:00.000000',1,1),(2,'Kayak en el Lago Llanquihue','Experiencia guiada en kayak para disfrutar de los paisajes naturales del lago.',20000.00,8,'2026-11-25 13:00:00.000000',2,3),(3,'Senderismo por los bosques del sur','Recorrido guiado por senderos naturales del sur de Chile, disfrutando de sus bosques, paisajes y flora nativa.',18000.00,12,'2026-11-28 18:30:00.000000',1,3),(4,'Cabalgata por paisajes patagónicos','Paseo guiado a caballo por hermosos paisajes naturales de la Patagonia, disfrutando de la tranquilidad y la naturaleza.',25000.00,8,'2026-11-05 12:00:00.000000',3,3),(5,'Exploración de cascadas y senderos','Excursión guiada para conocer cascadas y senderos naturales, disfrutando de los paisajes y la biodiversidad del sur de Chile.',16000.00,10,'2026-11-12 14:30:00.000000',1,3),(6,'Navegación y aventura en el Lago Todos los Santos','Experiencia guiada de navegación para conocer los paisajes del Lago Todos los Santos y disfrutar de su entorno natural.',22000.00,10,'2026-12-19 12:30:00.000000',2,4),(7,'Fotografía de naturaleza en la Patagonia','Recorrido guiado por paisajes naturales para descubrir y fotografiar la flora, fauna y belleza de la Patagonia.',14000.00,6,'2026-12-20 19:00:00.000000',1,4),(8,'Picnic y caminata junto al río','Actividad guiada que combina una caminata por senderos naturales con un momento de descanso para disfrutar del paisaje junto al río.',12000.00,12,'2026-12-26 15:30:00.000000',1,4),(9,'Aventura por los miradores del sur','Excursión guiada por senderos que conducen a hermosos miradores naturales, ideales para disfrutar de los paisajes del sur de Chile.',19000.00,10,'2026-12-27 18:00:00.000000',1,4),(11,'Canopy entre los árboles del sur','Recorrido de aventura mediante cables elevados entre plataformas ubicadas en un entorno natural.',22000.00,8,'2026-12-25 13:00:00.000000',4,3);
/*!40000 ALTER TABLE `experiencias_gestion_actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_reserva`
--

DROP TABLE IF EXISTS `experiencias_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_reserva` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_reserva` datetime(6) NOT NULL,
  `estado_pago` varchar(20) NOT NULL,
  `actividad_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `experiencias_reserva_usuario_id_actividad_id_24e3dd7a_uniq` (`usuario_id`,`actividad_id`),
  KEY `experiencias_reserva_actividad_id_2f6d22a9_fk_experienc` (`actividad_id`),
  CONSTRAINT `experiencias_reserva_actividad_id_2f6d22a9_fk_experienc` FOREIGN KEY (`actividad_id`) REFERENCES `experiencias_gestion_actividades` (`id`),
  CONSTRAINT `experiencias_reserva_usuario_id_8724df18_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_reserva`
--

LOCK TABLES `experiencias_reserva` WRITE;
/*!40000 ALTER TABLE `experiencias_reserva` DISABLE KEYS */;
INSERT INTO `experiencias_reserva` VALUES (1,'2026-11-15 19:28:14.369032','pendiente',1,2),(2,'2026-11-15 19:36:14.644710','pendiente',2,2),(3,'2026-11-15 22:22:31.891515','pendiente',2,6),(4,'2026-11-15 22:23:13.303696','pendiente',1,6),(5,'2026-11-15 22:23:32.339389','pendiente',6,6),(6,'2026-11-15 22:34:07.046742','pendiente',9,2),(7,'2026-11-15 22:34:17.361845','pendiente',3,2),(8,'2026-11-15 22:34:24.793316','pendiente',8,2),(9,'2026-11-15 22:34:58.138858','pendiente',6,2);
/*!40000 ALTER TABLE `experiencias_reserva` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-16 13:22:40
