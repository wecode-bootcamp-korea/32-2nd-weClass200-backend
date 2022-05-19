-- MySQL dump 10.13  Distrib 8.0.28, for macos12.2 (arm64)
--
-- Host: localhost    Database: pj200
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `creators`
--

DROP TABLE IF EXISTS `creators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creators` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profile_image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `introduction` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `carrer` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creators_user_id_05f271dc` (`user_id`),
  CONSTRAINT `creators_user_id_05f271dc_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creators`
--

LOCK TABLES `creators` WRITE;
/*!40000 ALTER TABLE `creators` DISABLE KEYS */;
INSERT INTO `creators` VALUES (1,'지기성','rltjd@naver.com','010-1111-1111','s','프론트 개발 20년 고인물 입니다.','15',7),(2,'유동혁','ehdgur@naver.com','010-1111-1111','s','풀스택의 근본 그 자체 입니다.','20',8),(3,'전예찬','dPcks@naver.com','010-1111-1111','s','커피를 사랑하는 사람 전예찬 입니다.','20',9),(4,'경규현','rbgus@naver.com','010-2222-1111','s','아이돌 댄스 머신 경규현입니다.','5',10),(5,'황석영','tjdrud@naver.com','010-3333-1111','s','힘을 다를 줄 아는 남자 확성영 입니다.','10',6),(6,'이현석','gustjr@naver.com','010-4444-1111','s','동물보호협회 단체장 이현석입니다.','15',3),(7,'안유림','dbfla@naver.com','010-5555-1111','s','그림을 좋아하는 안유림 입니다!','3',5),(8,'송재관','worhks@naver.com','010-6666-1111','s','낭만을 쫒는 송재관 입니다!','26',1),(9,'안남규','skarb@naver.com','010-7777-1111','s','신발을 좋아하는 남자 안남규입니다!','5',2);
/*!40000 ALTER TABLE `creators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'contenttypes','contenttype'),(3,'products','maincategory'),(4,'products','product'),(6,'products','productimage'),(5,'products','subcategory'),(8,'sessions','session'),(2,'users','creator'),(10,'users','like'),(12,'users','myclass'),(11,'users','review'),(9,'users','reviewimage'),(1,'users','user');
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
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'users','0001_initial','2022-05-12 09:01:40.596617'),(2,'products','0001_initial','2022-05-12 09:01:40.784914'),(3,'users','0002_like_myclass_review_user_likes_user_myclasses_and_more','2022-05-12 09:01:41.027903'),(4,'users','0003_alter_review_product_alter_reviewimage_review','2022-05-12 09:01:41.044934'),(5,'users','0004_alter_like_product','2022-05-12 09:01:41.054025'),(6,'users','0005_alter_user_age_alter_user_email_alter_user_gender_and_more','2022-05-12 09:01:41.158930'),(7,'products','0002_product_type','2022-05-15 11:14:38.171377'),(8,'products','0003_status','2022-05-15 11:17:48.539383'),(9,'products','0002_status_product_type','2022-05-15 11:23:18.827250'),(10,'users','0006_alter_myclass_product','2022-05-19 02:11:09.148083'),(11,'users','0007_alter_creator_user','2022-05-19 02:52:13.407913'),(12,'users','0008_alter_creator_user','2022-05-19 12:58:12.737765');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_0899754c_fk_users_id` (`user_id`),
  KEY `likes_product_id_7f73cfa5_fk_products_id` (`product_id`),
  CONSTRAINT `likes_product_id_7f73cfa5_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `likes_user_id_0899754c_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_categories`
--

DROP TABLE IF EXISTS `main_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_categories`
--

LOCK TABLES `main_categories` WRITE;
/*!40000 ALTER TABLE `main_categories` DISABLE KEYS */;
INSERT INTO `main_categories` VALUES (1,'투자'),(2,'Life'),(3,'프로그래밍'),(4,'음식'),(5,'지식');
/*!40000 ALTER TABLE `main_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myclasses`
--

DROP TABLE IF EXISTS `myclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myclasses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myclasses_user_id_5710e1b1_fk_users_id` (`user_id`),
  KEY `myclasses_product_id_5bea2ce2_fk_products_id` (`product_id`),
  CONSTRAINT `myclasses_product_id_5bea2ce2_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `myclasses_user_id_5710e1b1_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myclasses`
--

LOCK TABLES `myclasses` WRITE;
/*!40000 ALTER TABLE `myclasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `myclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_urls` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_28ebf5f0_fk_products_id` (`product_id`),
  CONSTRAINT `product_images_product_id_28ebf5f0_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_001.png?raw=true',1),(2,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_002.png?raw=true',2),(3,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_003.png?raw=true',3),(4,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_004.png?raw=true',4),(5,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_005.png?raw=true',5),(6,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_006.png?raw=true',6),(7,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_009.png?raw=true',7),(8,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_010.png?raw=true',8),(9,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_011.png?raw=true',9),(10,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_008.png?raw=true',10),(11,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_008.png?raw=true',11),(12,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_008.png?raw=true',12),(13,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_012.png?raw=true',13),(14,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_013.png?raw=true',14),(15,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_014.png?raw=true',15),(16,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_015.png?raw=true',16),(17,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_016.png?raw=true',17),(18,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_017.png?raw=true',18),(19,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_018.png?raw=true',19),(20,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_019.png?raw=true',20),(21,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_020.png?raw=true',21),(22,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_024.png?raw=true',22),(23,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_025.png?raw=true',23),(24,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_026.png?raw=true',24),(25,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_021.png?raw=true',25),(26,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_022.png?raw=true',26),(27,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_023.png?raw=true',27),(28,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_027.png?raw=true',28),(29,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_028.png?raw=true',29),(30,'https://github.com/BDjaekwanee/project-imgaes/blob/master/img_029.png?raw=true',30);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `period` int unsigned DEFAULT NULL,
  `review_score` decimal(2,1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `discount_rate` int DEFAULT NULL,
  `discount_coupon` int DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `subcategory_id` bigint DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_subcategory_id_6acd45e4_fk_sub_categories_id` (`subcategory_id`),
  KEY `products_creator_id_f217ad7d_fk_creators_id` (`creator_id`),
  KEY `products_type_id_d32300e3_fk_statuses_id` (`type_id`),
  CONSTRAINT `products_creator_id_f217ad7d_fk_creators_id` FOREIGN KEY (`creator_id`) REFERENCES `creators` (`id`),
  CONSTRAINT `products_subcategory_id_6acd45e4_fk_sub_categories_id` FOREIGN KEY (`subcategory_id`) REFERENCES `sub_categories` (`id`),
  CONSTRAINT `products_type_id_d32300e3_fk_statuses_id` FOREIGN KEY (`type_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `products_chk_1` CHECK ((`period` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'지기성의 세계 최고로 쉬운 React 0강 리엑트 기초',750000.00,'리엑트의 흐름 설명',6,4.0,'2022-05-15 07:10:50.622114','2022-05-15 07:10:50.622438',30,30000,1,6,1),(2,'지기성의 세계 최고로 쉬운 React 1강 설치와 세팅',850000.00,'기본 설치 과정 및 개발 세팅 ',5,5.0,'2022-05-15 07:10:50.624944','2022-05-15 07:10:50.624975',20,NULL,1,6,1),(3,'지기성의 세계 최고로 쉬운 React 2강 JSX 문법',300000.00,'JSX 문법에 대한 전반적인 이해',12,4.0,'2022-05-15 07:10:50.627849','2022-05-15 07:10:50.627877',50,NULL,1,6,1),(4,'유동혁의 JUST FullStack 0강 시작이 반이다.',150000.00,'풀스택 시작 방법',3,4.0,'2022-05-15 07:10:50.630080','2022-05-15 07:10:50.630104',10,NULL,2,7,3),(5,'유동혁의 JUST FullStack 1강 혼자서 다한다.',200000.00,'백앤드 없이 혼자 다하는법',2,4.0,'2022-05-15 07:10:50.632711','2022-05-15 07:10:50.632740',NULL,NULL,2,7,3),(6,'유동혁의 JUST FullStack 2강 몰라도 해결한다.',320000.00,'그냥 해결하는 방법',4,3.0,'2022-05-15 07:10:50.634967','2022-05-15 07:10:50.635002',NULL,NULL,2,7,3),(7,'전예찬의 6시간만에 끝내는 바리스타 입문코스 0강 커피 너무 쉽다',30000.00,'커피에 대한 이해',3,4.0,'2022-05-15 07:10:50.636920','2022-05-15 07:10:50.636950',NULL,NULL,3,8,2),(8,'전예찬의 6시간만에 끝내는 바리스타 입문코스 1강 원두? 너무 쉽다',50000.00,'원두에 대한 이해',2,3.0,'2022-05-15 07:10:50.638602','2022-05-15 07:10:50.638630',10,NULL,3,8,2),(9,'전예찬의 6시간만에 끝내는 바리스타 입문코스 2강 드립? 너무 쉽다',20000.00,'드립에 대한 이해',4,4.0,'2022-05-15 07:10:50.640479','2022-05-15 07:10:50.640509',15,NULL,3,8,2),(10,'경규현의 3시간만에 끝내는 아이돌 댄스교실 0강 리듬을 타는법',150000.00,'리듬에 대한 이해',3,5.0,'2022-05-15 07:10:50.642712','2022-05-15 07:10:50.642741',20,NULL,4,3,1),(11,'경규현의 3시간만에 끝내는 아이돌 댄스교실 1강 그르부를 타는법',120000.00,'기본적인 춤선에 대한 이해',3,4.0,'2022-05-15 07:10:50.645146','2022-05-15 07:10:50.645173',20,10000,4,3,1),(12,'경규현의 3시간만에 끝내는 아이돌 댄스교실 2강 춤선 이뻐지는 법',180000.00,'실전 무용 팁',3,3.0,'2022-05-15 07:10:50.646849','2022-05-15 07:10:50.646874',20,NULL,4,3,1),(13,'황석영의 맞으면서 배우는 복싱교실 0강 세상에 의미없는 일은 없다',200000.00,'복싱 기본기',6,4.0,'2022-05-15 07:10:50.648511','2022-05-15 07:10:50.648539',10,NULL,5,4,3),(14,'황석영의 맞으면서 배우는 복싱교실 1강 의미있는 일을 찾는법',150000.00,'복싱 실전',6,4.0,'2022-05-15 07:10:50.649821','2022-05-15 07:10:50.649862',10,5000,5,4,3),(15,'황석영의 맞으면서 배우는 복싱교실 2강 영원히 살것 처럼 꿈꾸고 오늘 죽을 것처럼 살아라',200000.00,'실전 복싱 강의',6,4.0,'2022-05-15 07:10:50.651520','2022-05-15 07:10:50.651552',10,NULL,5,4,3),(16,'이현석 교수의 개소리의 역사 강의 0강 강아지는 왜 짖는 걸까?',1000000.00,'강아지 소리로 노래하는법',5,4.0,'2022-05-15 07:10:50.653443','2022-05-15 07:10:50.653472',99,NULL,6,10,2),(17,'이현석 교수의 개소리의 역사 강의 1강 개소리의 유래와 역사',1000000.00,'강아지 소리의 높낮이',10,3.0,'2022-05-15 07:10:50.659650','2022-05-15 07:10:50.659682',99,NULL,6,10,2),(18,'이현석 교수의 개소리의 역사 강의 2강 고양이는 왜 울까?',1000000.00,'실질적인 고양이 소리 팁',3,2.0,'2022-05-15 07:10:50.660695','2022-05-15 07:10:50.660721',99,NULL,6,10,2),(19,'안유림의 너도 할 수 있다! 아이패드 스케치 0강 프로크리에트 설치와 셋팅',150000.00,'프로크리에트 설치와 셋팅',6,4.0,'2022-05-15 07:10:50.661688','2022-05-15 07:10:50.661711',15,NULL,7,5,1),(20,'안유림의 너도 할 수 있다! 아이패드 스케치 1강 브러쉬 고르는법',150000.00,'스케치 기초',3,1.0,'2022-05-15 07:10:50.663406','2022-05-15 07:10:50.663430',15,NULL,7,5,1),(21,'안유림의 너도 할 수 있다! 아이패드 스케치 2강 레이어의 활용',300000.00,'기본 스케치',3,1.0,'2022-05-15 07:10:50.664430','2022-05-15 07:10:50.664472',15,NULL,7,5,1),(22,'안유림의 비트코인 강좌 0강 존버만이 살길이다.',1500000.00,'비트코인 강좌',6,4.0,'2022-05-15 07:10:50.665678','2022-05-15 07:10:50.665723',30,NULL,7,1,3),(23,'안유림의 비트코인 강좌 1강 수익률 -80% 멘탈관리 비결',1500000.00,'비트코인 강좌',6,4.0,'2022-05-15 07:10:50.667025','2022-05-15 07:10:50.667058',30,NULL,7,1,3),(24,'안유림의 비트코인 강좌 2강 시드머니는 중요하지 않다!',2000000.00,'비트코인 강좌',6,4.0,'2022-05-15 07:10:50.669116','2022-05-15 07:10:50.669145',30,NULL,7,1,3),(25,'송재관의 팀플 생존법 0강 팀원을 파악해라',15000.00,'팀플 가이드',3,4.0,'2022-05-15 07:10:50.670423','2022-05-15 07:10:50.670453',NULL,NULL,8,9,2),(26,'송재관의 팀플 생존법 1강 ',15000.00,'팀플 가이드',3,4.0,'2022-05-15 07:10:50.671809','2022-05-15 07:10:50.671835',NULL,NULL,8,9,2),(27,'송재관의 팀플 생존법 2강 적당히 빠져라!',15000.00,'팀플 가이드',3,4.0,'2022-05-15 07:10:50.673082','2022-05-15 07:10:50.673110',NULL,NULL,8,9,2),(28,'안남규의 JUST shoeTech 0강 어떤 신발이 돈이될까?',180000.00,'리셀 가이드 강의',3,1.0,'2022-05-15 07:10:50.674390','2022-05-15 07:10:50.674418',20,NULL,9,2,1),(29,'안남규의 JUST shoeTech 1강 선착순은 운빨이다.',300000.00,'리셀 가이드 강의',3,4.0,'2022-05-15 07:10:50.675574','2022-05-16 07:10:50.675600',20,NULL,9,2,1),(30,'안남규의 JUST shoeTech 2강 크림 판매 꿀팁',150000.00,'리셀 가이드 강의',3,3.0,'2022-05-16 07:10:50.676690','2022-05-17 07:10:50.676714',20,NULL,9,2,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_images`
--

DROP TABLE IF EXISTS `review_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_urls` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `review_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `review_images_review_id_9c7a1455_fk_reviews_id` (`review_id`),
  CONSTRAINT `review_images_review_id_9c7a1455_fk_reviews_id` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_images`
--

LOCK TABLES `review_images` WRITE;
/*!40000 ALTER TABLE `review_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `score` int unsigned NOT NULL,
  `detail` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_c23b0903_fk_users_id` (`user_id`),
  KEY `reviews_product_id_d4b78cfe_fk_products_id` (`product_id`),
  CONSTRAINT `reviews_product_id_d4b78cfe_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `reviews_user_id_c23b0903_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_chk_1` CHECK ((`score` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,5,'리엑트 할줄 알았는데 왜 장고하죠?? 사기 아닌가요. 근데 잘 가르치시네요','2022-05-12 11:19:12.205065','2022-05-12 11:19:12.205848',1,1),(2,4,'너무 좋습니다!! 굿굿입니다.','2022-05-12 11:19:12.212438','2022-05-12 11:19:12.212464',1,1),(3,4,'사랑합니다 기성님!!! 좋은 강의입니다.','2022-05-12 11:19:12.214068','2022-05-12 11:19:12.214092',1,2),(4,3,'설치 과정에서 오류가 납니다','2022-05-12 11:19:12.215228','2022-05-12 11:19:12.215252',2,3),(5,2,'설치 안되는데요? 뭐죠?','2022-05-12 11:19:12.216140','2022-05-12 11:19:12.216161',2,4),(6,4,'문법 이해가 너무 잘됩니다!','2022-05-12 11:19:12.217121','2022-05-12 11:19:12.217144',3,1),(7,2,'너무 어려워요 저한테는 떠먹여 주세요 ㅠㅠ','2022-05-12 11:19:12.217991','2022-05-12 11:19:12.218011',3,2),(8,1,'시작이 반이라면서 너무 어렵네요 실망입니다.','2022-05-12 11:19:12.219255','2022-05-12 11:19:12.219275',4,2),(9,4,'진짜 명강의 입니다 굿굿굿 입니다.','2022-05-12 11:19:12.220064','2022-05-12 11:19:12.220082',4,1),(10,3,'백엔드 친구가 없는데 혼자 다했습니다 정말 감사합니다!','2022-05-12 11:19:12.220852','2022-05-12 11:19:12.220871',5,1),(11,4,'문제 해결 능력을 기르게 되었습니다 정말 감사합니다.','2022-05-12 11:19:12.221578','2022-05-12 11:19:12.221597',6,3),(12,3,'커피 입문을 하게 되었습니다 너무 좋습니다.','2022-05-12 11:19:12.222287','2022-05-12 11:19:12.222305',7,1),(13,5,'예찬 강사님 너무 잘생겨서 결제했습니다','2022-05-12 11:19:12.223064','2022-05-12 11:19:12.223082',7,4),(14,3,'강사님 사랑합니다!!! 강의 너무 좋아요!!','2022-05-12 11:19:12.223836','2022-05-12 11:19:12.223854',8,5),(15,1,'강사님 강의중에 야구 얘기는 하지 않았으면 좋겠습니다.','2022-05-12 11:19:12.224510','2022-05-12 11:19:12.224527',8,6),(16,3,'덕분에 바리스타 자격증 땃습니다.','2022-05-12 11:19:12.225219','2022-05-12 11:19:12.225236',9,1),(17,4,'너무 좋은 강의 사랑합니다!','2022-05-12 11:19:12.226010','2022-05-12 11:19:12.226029',9,2),(18,3,'항상 행복하세요!','2022-05-12 11:19:12.226790','2022-05-12 11:19:12.226808',9,3);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Best'),(2,'Sale'),(3,'New');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `maincategory_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_maincategory_id_0f1a4c7e_fk_main_categories_id` (`maincategory_id`),
  CONSTRAINT `sub_categories_maincategory_id_0f1a4c7e_fk_main_categories_id` FOREIGN KEY (`maincategory_id`) REFERENCES `main_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'주식',1),(2,'테크',1),(3,'운동',2),(4,'취미',2),(5,'그림',2),(6,'리엑트',3),(7,'풀스택',3),(8,'커피',4),(9,'회사꿀팁',5),(10,'악기',5);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kakao_id` bigint DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profile_image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `users_chk_1` CHECK ((`age` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'송재관',NULL,'cyc04088@naver.com','010-1111-1111',NULL,'male',NULL),(2,'안남규',NULL,'skarb@naver.com','010-1111-1111',NULL,'male',NULL),(3,'이현석',NULL,'dbfla@naver.com','010-1111-1111',NULL,'male',NULL),(4,'양재원',NULL,'wodnjs@naver.com','010-1111-1111',NULL,'female',NULL),(5,'안유림',NULL,'dbfla@naver.com','010-1111-1111',NULL,'female',NULL),(6,'황석영',NULL,'tjrdud@naver.com','010-1111-1111',NULL,'male',NULL),(7,'지기성',NULL,'rltjd@navaer.com','010-1111-1111',NULL,'male',NULL),(8,'유동혁',NULL,'ehdgur@naver.com','010-1111-1111',NULL,'male',NULL),(9,'전예찬',NULL,'dPcks@naver.com','010-1111-1111',NULL,'male',NULL),(10,'경규현',NULL,'rbgus@naver.com','010-1111-1111',NULL,'male',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-19 22:51:27
