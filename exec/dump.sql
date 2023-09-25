-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `alarm`
--

DROP TABLE IF EXISTS `alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarm` (
  `arm_id` bigint NOT NULL AUTO_INCREMENT,
  `cage_id` bigint DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `cycle` bigint DEFAULT NULL,
  `recent` datetime NOT NULL,
  PRIMARY KEY (`arm_id`),
  KEY `fk_alarm_cage` (`cage_id`),
  CONSTRAINT `fk_alarm_cage` FOREIGN KEY (`cage_id`) REFERENCES `cage` (`cage_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarm`
--

LOCK TABLES `alarm` WRITE;
/*!40000 ALTER TABLE `alarm` DISABLE KEYS */;
INSERT INTO `alarm` VALUES (15,24,'밥주기',2880,'2023-08-19 10:29:00'),(23,31,'왕눈이 먹이주기',1440,'2023-08-18 23:02:00');
/*!40000 ALTER TABLE `alarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cage_id` bigint DEFAULT NULL,
  `dict_id` bigint DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birth` date DEFAULT NULL,
  `issue` text,
  `created_at` datetime NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_animal_cage` (`cage_id`),
  CONSTRAINT `fk_animal_cage` FOREIGN KEY (`cage_id`) REFERENCES `cage` (`cage_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (9,24,25,'민태친구','Male','2018-06-21','3년이 지나면 더 귀여워 집니다','2023-08-17 10:27:05','Peacock_Day_Gecko.jpg'),(18,31,25,'왕눈이','Female','2023-08-18','왕눈','2023-08-17 22:59:41','Peacock_Day_Gecko.jpg');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_set`
--

DROP TABLE IF EXISTS `auto_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_set` (
  `set_id` bigint NOT NULL AUTO_INCREMENT,
  `cage_id` bigint DEFAULT NULL,
  `time` time DEFAULT NULL,
  `set_temp` bigint DEFAULT NULL,
  `set_hum` bigint DEFAULT NULL,
  `set_uv` bigint DEFAULT NULL,
  PRIMARY KEY (`set_id`),
  KEY `fk_auto_set_cage` (`cage_id`),
  CONSTRAINT `fk_auto_set_cage` FOREIGN KEY (`cage_id`) REFERENCES `cage` (`cage_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_set`
--

LOCK TABLES `auto_set` WRITE;
/*!40000 ALTER TABLE `auto_set` DISABLE KEYS */;
INSERT INTO `auto_set` VALUES (9,24,'09:30:00',25,55,1),(12,27,'02:07:00',NULL,50,NULL),(16,31,'20:00:00',21,85,1);
/*!40000 ALTER TABLE `auto_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cage`
--

DROP TABLE IF EXISTS `cage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cage` (
  `cage_id` bigint NOT NULL AUTO_INCREMENT,
  `id` bigint DEFAULT NULL,
  `snum` varchar(255) DEFAULT NULL,
  `cage_name` varchar(255) DEFAULT NULL,
  `set_temp` bigint DEFAULT NULL,
  `set_hum` bigint DEFAULT NULL,
  `set_uv` bigint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cage_id`),
  UNIQUE KEY `unique_snum` (`snum`),
  KEY `fk_cage_user` (`id`),
  CONSTRAINT `fk_cage_user` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cage`
--

LOCK TABLES `cage` WRITE;
/*!40000 ALTER TABLE `cage` DISABLE KEYS */;
INSERT INTO `cage` VALUES (12,10,'serial_test','한강자이110동',25,60,0,'2023-08-17 02:12:49','turtle'),(19,16,'rattlesnake','방울뱀',25,60,0,'2023-08-17 07:02:49','snake'),(24,16,'1233','민태',25,60,0,'2023-08-17 10:26:19','lizard'),(27,19,'0307','한주',25,60,0,'2023-08-17 16:07:06','lizard'),(31,17,'1','파출',25,61,0,'2023-08-17 22:58:59','lizard');
/*!40000 ALTER TABLE `cage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict`
--

DROP TABLE IF EXISTS `dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dict` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `spices` varchar(255) DEFAULT NULL,
  `lifespan` varchar(255) DEFAULT NULL,
  `feed` varchar(255) DEFAULT NULL,
  `feed_cycle` varchar(255) DEFAULT NULL,
  `temp` varchar(255) DEFAULT NULL,
  `lighting` varchar(255) DEFAULT NULL,
  `humidity` varchar(255) DEFAULT NULL,
  `info` text,
  `environment` text,
  `home` text,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict`
--

LOCK TABLES `dict` WRITE;
/*!40000 ALTER TABLE `dict` DISABLE KEYS */;
INSERT INTO `dict` VALUES (1,'공비단뱀','30년','쥐, 아프리카 솜털 쥐, 가정용 쥐, 메추라기, 병아리','5주 이하: 5일마다, 200g이하: 7일, 200~350g: 7~10일, 350~500g: 10~14일, 500-1500g: 14-21일, 1500g이상: 28-56일','일광욕 표\n면 온도: 95-104°F (35-40°C), 따뜻한 은신처 온도: 86-90°F (30-32°C), 시원한 은신처 온도: 72-80°F (22-27°C), 야간 온도: 72-78°F (22-26°C)','UVB 빛없이 생존할 수 있지만, 주/야간 주기와 관련된 호르몬 \n리듬을 조절에 도움이 됨','45-75%','칼슘과 다른 비타민을 1:1 비율로 가볍게 묻혀 줄 것을 권장',' 120 갤런이상 공간 권장, 두 마리 이상 함께 기르는 건 권장하지 않음','아프리카 중서부','Ball_Python.jpg'),(2,'붉은줄보아','30년','쥐, 새끼 쥐, 햄스터, 새끼 햄스터, 새끼 퀘이일, 쿠왈 알, 병아리, 녹색 애노올, 리프틀링크스','작은 개체: 일주일에 한 번, 성체: 10-14일에 한 번','Basking(일광욕) 지역: 85-90°F (29-32°C), Cool zone(차가운 지역)의 온도: 75-80°F (24-27°C), 야간 온도: 60°F/16°C','UVB 조명은 건강에 중요한 영향을 미치며, 낮 동안 사용되어야 합니다. 일반적으로 하루에 14시간 동안 켜고 10시간  \n동안 끄는 것이 좋습니다','60% 미만','먹이를 주기 전에 칼슘과 멀티비타민을 1:1 비율로 가볍게 뿌려줍니다','보아의 예상 성체 길이에 따라 적절한 사육장 크기를 선택','미국 남서부, 바하 반도, 멕시코 \n의 북서부','Rosy_Boa.jpg'),(3,'액키 모니터','15년','사마귀, 바퀴벌레, 벌레 등 다양한 곤충','유아기(0-6개월): 매일, 이후의 유아기와 성체: 2일마다, 번식 암컷: 매일','일광욕 표면 온도: 158-172°F (약 70-78°C), 따뜻한 지역 온도\n: 84-100°F (약 29-38°C), 시원한 지역 온도: 75-82°F (약 24-28°C), 야간 온도: 72-78°F (약 22-26°C)','자연광 조명: 46-48인치(약 117-122cm) 6000-7000K LED 또는 형광등 식물용 조명을 설치, UVB 조명: 34 \n인치(약 86cm) T5 HO 사막용 UVB 전구를 적절한 온도대의 일광욕 지역 위에 설치','45-75%','칼슘 분말 보충제 (비타민 D3 함유하지 않은 것), 다른 비타민과 1:1 비율로 가볍게 덧칠하는 것이 권장',' 5\'L x \n2.5\'W x 4\'H 크기의 용기, 가능하면 더 큰 용기를 권장합니다. 앞쪽에서 여는 용기가 이용하기 편리하며, 좋은 환기가 필요','호주 북서 지역','Ackie_Monitor.jpg'),(4,'아프리칸 펫테일 게코','15-20년','지렁이, 듀비아 바퀴벌레 유충, 디스코이드 바퀴벌레 유충, 검은 군충애벌레, 애벌레, 등지렁이, 누릅나비, 호랑나방','유아기: 매일, 어린 성체: 2일 또는 3일마다, 성체\n: 5일마다','따뜻한 은신처 온도: 90°F (약 32°C), 따뜻한 쪽 공기 온도: 80-90°F (약 27-32°C), 시원한 쪽 온도: 70-77°F (약 21-25°C), 야간 온도: 60°F (약 16°C) 이하까지','빛은 밤에 모두 꺼줌','건조한\n 계절(겨울): 주간에 50%, 밤에 70-75%, 습한 계절(여름): 주간에 70-80%, 밤에는 100%','모든 곤충 먹이는 칼슘 분말로 가볍게 덮여야 하며 칼슘과 인의 비율을 조정',' 36”L x 18”W x 16”H 크기의 용기가 권 \n장','아프리카 서부 지역','African_Fat-Tailed_Gecko.jpg'),(5,'턱수염 도마뱀','10-15년','밥충, 두비아 통통벌레, 레드러너 통통벌레, 블랙 솔저 파리 애벌레, 멜로메 미끼벌레, 다크링 비단벌레, 호박벌레, 치매벌레','화품 (0-6개월): 하루에 2번, 채소 매일, 유년기(6개월-1년 이상): 하루에 1번, 채소 매일, 성체 (1년 이상): 주에 2-3번, 채소 매일','따뜻한 은신처 표면 온도: 105-115°F (약 40-46°C), 시원한 존 온도: 70-85°F (약 21-29°C)','주간 활동성이 있으므로 환 \n경에서 밝은 흰색 빛에 자극을 받으며 생존에 높은 품질의 UVB 조명이 필요','30-60%','자연 서식지의 조건과 유사한 토양 위에 기르는 것이 가장 건강하고 행복','주로 120 갤런 크기, 환기 중요, 보통 한마 \n리씩만 기르는 것을 권장','호주 동부 중부','Bearded_Dragon.jpg'),(6,'옥수수뱀','잘 관리된 경우 25년','쥐, 아프리카 부드러운 털쥐, 가정용 쥐, 메추리, 병아리','어린 파이썬은 주로 12주마다 먹이를 제공하고, 성체는 보통 24주마다 먹이를 제공','먹이주는 구역 (basking surface): 90°F (32°C), 쿨 구역 (cool zone): 75°F (23-24°C) ,밤에는 68°F/20°C 이하','콘 스네이크는 UVB 조명이 없어도 생존할 수 있지만, 최적의 환경을 제공','평균 습도는 65-75%','영양제 없이도 생 \n존할 수 있지만, 영양 결핍을 예방하기 위해 가끔 영양 보충제를 사용','최소 크기는 120 갤런 (48”L x 24”W x 24”H) 이상의 용기','열대 및 아열대의 풀 지역, 사바나, 덤불 지역 등에서 발견','Corn_Snake.jpg'),(7,'동부 푸른혀도마뱀','15-20년','고기와 식물 모두를 먹이로 섭취','새끼 동물 (3개월 미만): 매일, 유년기 (3개월-8개월): 주 3회, 성충 및 성체 (8개월 이상): 주 1-2회','일광욕 표면 온도: 105-115°F (40-46°C), 시원한 영역 온도: 70-80°F (21-27°C)','밝은 흰색 빛의 존재에 자극을 받으며 생존을 위해 높은 품질의 UVB 조명이 필요','40-60%','비타민과 무기질을 충분히 섭취할 수 있도록 칼슘 분말과 다목적\n 비타민 분말 또는 좋은 올인원 보충제 필요','120갤런, 앞쪽으로 열리도록 해야하며 좋은 환기가 필요','호주의 뉴사우스웨일스와 빅토리아 주','Eastern_Blue_Tongue_Skink.jpg'),(8,'인도네시안 푸른혀도마뱀','15-20년','고기와 식물 모두를 먹이로 섭취','새끼 동물 (3개월 미만): 매일, 유년기 (3개월-8개월): 주 3회, 성충 및 성체 (8개월 이상): 주 1-2회','뜨거운 표면 온도: 100-105°F (38-41°C), 시원한 존 온도: 70-80°F (21-27°C)','UVB 조명의 대신 비타민 D3 보충제를 사용하여 살아남을 수 있음','60-80%','식단에 올바른 양의 칼슘과 다중 비타민을 제공하면 건강한 애완 동물을 돌 \n보는 데 도움','120갤런 (48인치 L x 24인치 W x 24인치 H), 가능한 앞에서 열릴 수 있도록 해야하며, 적절한 환기 시스템이 필요, 싸움이 날 수 있으므로 한마리씩 키우길 권장','인도네시아','Indonesian_Blue_Tongue_Skink.jpg'),(9,'이리얀자야 푸른혀도마뱀','15-20년','동물성과 식물성 음식을 모두 섭취','새끼 동물 (3개월 미만): 매일, 유년기 (3개월-8개월): 주 3회, 성충 및 성체 (8개월 이상): 주 1-2회','일광욕 지역 온도: 100-105°F (38-41°C), 시원한 지역 온도: 70-80°F (21-27°C)','최적의 복지를 위해서는 UVB 조명이 강력히 권장','60-80%','칼슘 분말과 다용도 비타민 분말이 필요','120갤런 (48인치 L x 24인치 W x 24인치 H), 가능한 앞에서 열릴 수 있도록 해야하며, 적절한 환기 시스템이 필요, 싸움이 날 수 있으므로 한마리씩 키우길 권장','인도네시아','Irian_Jaya_Blue_Tongue_Skink.jpg'),(10,'서부구렁이','15년','쥐, 쥐, 아프리카 솜털 쥐, 햄스터, 거위, 어린 메추라기, 메추라기 계란, 병아리, 닭 계란, 녹색 류마, 집 도마뱀, 소형 뱀','부화한 뱀은 5-7일마다, 유년기 뱀은 5-7일마다, 성체 뱀\n은 7-14일','일광욕 영역에서 85-90°F (29-32°C), 시원한 영역에서 72-77°F (22-25°C)','주간 및 야간에 모두 활동하는 뱀으로, 주간에 밝은 조명을 제공하는 것이 자연적인 행동을 자극하는 데 도움','50-70%','칼슘과 다른 비타민을 1:1 비율로 가볍게 묻혀 줄 것을 권장','평균적으로 6\'L x 3\'W x 4\'H 크기의 용기','미국 중동부','Black_Rat_Snake.jpg'),(11,'북부 푸른혀도마뱀','15-20년','동물성과 식물성 음식을 모두 섭취','유아 (3개월 미만): 매일, 유년기 (3개월-8개월): 주 3회, 성충 및 성체 (8개월 이상): 주 1-2회','일광욕 지역 표면 온도: 105-115°F \n(40-46°C), 시원한 지역 온도: 70-80°F (21-27°C)','생존을 위해 높은 품질의 UVB 조명이 필요','40-60%','칼슘 분말과 다용도 비타민 분말 보충제가 필요','120갤런 (48인치 L x 24인치 W x 24인치 H), 가능\n한 앞에서 열릴 수 있도록 해야하며, 적절한 환기 시스템이 필요, 싸움이 날 수 있으므로 한마리씩 키우길 권장','호주','Northern_Blue_Tongue_Skink.jpg'),(12,'왕보아','30년','쥐, 아프리카 솜털 쥐, 가정용 쥐, 메추라기, 병아리','부화한 뱀은 10-12일마다, 유년기 뱀은 10-12일마다, 성체 뱀은 12-14일마다, 2-3년 이상 된 성체 뱀은 2-8주','따뜻한 영역의 표면\n 온도는 90°F (32°C), 공기 온도는 80-85°F (28-29°C),시원한 영역은 75-80°F (24-26°C), 밤에는 75-78°F (24-26°C)','빛의 존재는 일/야간 싸이클과 관련 호르몬 리듬을 조절하는 데 중요함, 빛은 하루에 12시 \n간 켜두는 것이 좋음','55-75%','칼슘과 다른 비타민을 1:1 비율로 가볍게 묻혀 줄 것을 권장','4\'L x 2\'W x 2\'H 크기의 용기가 최소한으로 필요','중남미와 남아메리카','Boa_Constrictor.jpg'),(13,'볏도마뱀붙이','15년','곤충, 과일','12개월 이하: 매일, 곤충 주 2회, 12개월 초과: 2~3일마다, 곤충 주 1회','일광욕 표면 온도: 82-85°F (28-29°C), 시원한 영역 온도:  70-75°F (21-24°C), 시원한 은신\n처 온도: 72-80°F (22-27°C), 밤 온도: 65-72°F (18-22°C)','크레스티드 게코는 황혼성 동물로, 주로 일몰 주변에 활동합니다.','60-80%','곤충 먹이는 칼슘 분말로 더스팅하여 칼슘-인 조 비율을 조절해야 합\n니다.',' 최소 권장 우리 크기는 18”L x 18”W x 24”H입니다','뉴 칼레도니아','Crested_Gecko.jpg'),(14,'융단비단뱀','20-30년','쥐, 두꺼비, 닭새끼 등을 주로 먹이로 사용','어린 파이썬은 주로 12주마다 먹이를 제공하고, 성체는 보통 24주마다 먹이를 제공','먹이주는 구역 (basking surface): 95-100°F (35-38°C), 쿨 구역 (cool end): 75-80°F (24-26°C), 밤에는 72-78°F (22-25°C)','밝은 조명이 있는 환경이 필요. 하루에 12시간 정도 조명을 켜 놓는 것이 좋습니다.',' 40-60% 사이에서 가장 적합','영양 결핍 \n을 예방하기 위해 비타민 및 무기질 보충제를 가끔 사용','세로로 넓은 앞쪽 개방형의 파충류 용 박스가 필요하며, 최소 크기는 8\' x 4\' x 4\' (길이 x 너비 x 높이)','열대 우림, 건조한 황무지, 사바나 우림, \n바위적인 지형 및 도시 지역에서도 발견','Carpet_Python.jpg'),(15,'중국 동굴 도마뱀','10-12년 이상','곤충','유년기: 매일, 성체: 일주일에 한 번','따뜻한 은신처/일광욕: 80-82°F (27-28°C), 시원한 지역: 72-77°F (22-25°C), 밤 온도: 68-72°F (20-22°C)','하루에 12 \n시간 동안 빛을 켜 놓습니다.','50-90%, 밤에는 더 높게 유지','최상의 결과를 위해 UVB 조명을 권장합니다.','최소 사육 용기 크기: 24”L x 18”W x 18”H 이상','북동 베트남에서 중국 남서부 지역, 일본','Chinese_Cave_Gecko.jpg'),(16,'가터뱀','10년 이상','지렁이(필요에 따라 잘게 썰어서), 구피, 플라티, 쥐, 버튼 퀘이, 쿼일 알, 렙티링크스','신생아는 매일 먹여야 하며, 성장과 함께 먹이 크기를 증가. 성체일 경우 4-7일마다','먹이 \n주는 구역 (basking area) 온도: 85-90°F (29-32°C), 쿨 구역 (cool side): 75-80°F (23-27°C), 밤에는 온도를 유지하기 위해 열원을 꺼야함','밝은 조명을 제공하는 것이 자연 행동과 활동을 자극하는 데 도움. UVB 조명은 건강에 도움이 되므로 반드시 제공','평균 습도는 35-60%','뱀은 영양 보충제 없이도 생존할 수 있지만, 가끔씩 영양 부족을 방지하기 위해 사용. 먹이에 칼슘과 다용도 비타민을 뿌려주는 것이 좋\n음','성체 길이를 기준으로 적절한 용기 크기를 선택. 크게 유연하고 작기 때문에 탈출을 방지하기 위해 용기를 잘 막아주어야 함.','물 근처의 들판, 숲, 늪지, 주거지에서 발견','Garter_Snake.jpg'),(17,'중국 물용','10-15년','곤충, 식물','유년기: 매일, 성체: 2-3일마다, 식물은 매일 제공','일광욕 온도: 90-95°F (32-35°C), 시원한 지역 온도: 77-86°F (25-30°C), 밤 온도: 75-77°F (24-25°C)','하루에 \n13시간(여름) 또는 11시간(겨울) 밝은 빛 노출','60-80%, 수영용 대형 수조 필요','성인 물용의 경우, 뒷다리 크기에 따라 적절한 UVB 조명 거리 설정이 중요합니다.','최소 사육 용기 크기: 6’L x 3’W x 6’H \n이상','동남아시아','Chinese_Water_Dragon.jpg'),(18,'케냐샌드보아','최대 30년','쥐, 새끼 쥐, 햄스터, 거브릴, 메추라기, 렙틸링크스','유아는 1-2주마다 먹이를 주고, 성체는 2-4주마다','밀짚 위의 온도는 93-95°F (34-35°C), 시원한 지역의 온도는 78-83°F (26-28°C)','주간 활동이 제한적이지만 적절한 환경 조명과 UVB 조명이 필요하다.','다소 습한 환경을 제공하되 건조하게 유지','영양제는 필수적이지는 않지만 영양 결핍 예방을 위해 가끔식 먹이에 칼슘과\n 멀티비타민을 약간 뿌려줌. 매일 깨끗한 물이 있는 작은 그릇을 제공해야 하며, 일주일에 한 번은 그릇을 청소','최소 수용 가능한 용량은 24\'L x 12\'W x 12\'H / 60 x 30 x 30 cm 이지만 가능하면 더 큰 용량을\n 선택하는 것이 좋음','동 아프리카의 건조하고 환경','Kenya_Sand_Boa.jpg'),(19,'왕뱀','20년 이상','생쥐 (mice), 어린 쥐 (young rats), 햄스터 (hamster), 거위 (gerbils), 어린 퀘일 (young quail), 퀘일 알 (quail eggs), 병아리 (chicks), 파충류 알 (reptile eggs), 녹색 빠꼬치 도 \n마뱀 (green anoles), 작은 뱀 (small snakes), 렙틸링크 (Reptilinks)','유아는 5-7일마다, 성체는 10-14일마다','섭씨 32-35도 사이의 보온 표면과 섭씨 23-27도 사이의 서늘한 지역을 제공','12시간 동안  \n빛을 받아야함','평균 습도 40-60%','비타민 또는 무기질 보충제 없이도 생존할 수 있지만, 간헐적으로 사용하는 것이 영양 결핍을 예방하는데 도움','일반적으로 48\' x 24\' x 24\' 크기의 거주지가 좋습니다','북미 전역에서 발견','Kingsnake.jpg'),(20,'바바투스','연령에 따라 다름','식물, 개체 크기에 따라 다양한 곤충','유년기: 매일, 성체: 매일 혹은 2일마다','일광욕 온도: 90°F (32°C), 시원한 지역 온도: 72-82°F (22-28°C), 밤 온도: 65-72°F (18-22°C)','하루에 13시간(여름) 또는 11시간(겨울) 밝은 빛 노출','40-100%, 수영용 대형 수조 필요','일반적인 카멜레온들과는 다르게 주로 느릿느릿한 행동을 취하므로 부드러운 다루기가 가능합니다.','최소\n 사육 용기 크기: 18″L x 18″W x 36″H 이상','쿠바의 서쪽 지역','Cuban_False_Chameleon.jpg'),(21,'우유뱀','20년 이상','생쥐, 어린 쥐, 햄스터, 저어새, 기러기 알, 병아리, 파충류 알, 녹색 청도마뱀, 작은 뱀','유충은 매 5-7일마다, 청소년은 매 7-10일마다, 성체는 매 10-14일마다','머리 위쪽의 온 \n도는 85-90°F (29-32°C), 차가운 쪽은 75-80°F (23-27°C), 밤에는 70-75°F (21-23°C)를 유지','밀크스네이크는 주로 밤에 활동하는데, 밝은 조명이 필요하지 않습니다. 하지만 UVB 조명은 건강에 도움. 여름에는\n 하루 15시간, 겨울에는 하루 9시간 켜놓고, 그 사이에 점진적으로 조절','평균 습도는 40-60% 정도를 유지','비타민 또는 무기질 보충제 없이도 생존할 수 있지만, 간헐적으로 사용하는 것이 영양 결핍을 예방\n하는데 도움','최소 사이즈는 48\'L x 24\'W x 24\'H / 1.2 x 6 x 6m','미국과 캐나다 남부 일부 지역에 주로 서식','Milk_Snake.jpg'),(22,'블루-테일드 데이 게코','최대 15년 이상','곤충, 크레스티드 게코 식이 제품 (CGD)','유년기: 매일 곤충, CGD 매일 또는 매 2일, 성체: 곤충 2주에 2회, CGD 2주에 2회','일광욕 온도: 85-90°F (29-32°C), 시원한 지역 온도: 72-80°F (22-27°C), 밤 온도: 68-72°F (20-22°C)','UVB 램프 및 밝은 빛 필요, 6500K 색온도 이상의 밝은 빛 권장','평균 습도 80%, 밤과 낮의 습도 변동은 정상','민감한 성격으로 올바른\n 사육 환경을 제공하는 것이 중요합니다. 다루기는 추천하지 않습니다.','최소 사육 용기 크기: 12″L x 12″W x 18″H 이상','모리셔스 섬 원산','Blue-Tailed_Day_Gecko.jpg'),(23,'동부돼지코뱀','약 10-15년','어린 생쥐, 어린 쥐, 기러기 알, 녹색 청도마뱀, 사육된 개구리/두꺼비','유충은 3-4일마다, 성체는 4-5일마다','머리 위쪽의 온도는 86-88°F (30-31°C), 차가운 쪽은 70-75°F (21-24°C)를 유지','평균 습도는 50-60%','평균 습도는 40-60% 정도를 유지','비타민 또는 무기질 보충제 없이도 생존할 수 있지만, 간헐적으로 사용하는 것이 영양 결핍을 예방하는데 도움','. 최소 40 갤 \n런 (36\'L x 18\'W x 18\'H) 크기의 용기','미국 동부와 캐나다 남부 일부 지역에 주로 서식','Eastern_Hognose_Snake.jpg'),(24,'자이언트 데이 게코','최대 15-20년','곤충, 크레스티드 게코 식이 제품 (CGD)','유년기: 매일 곤충, CGD 매일 또는 매 2일, 성체: 곤충 2-3주에 2회, CGD 1주에 1회','일광욕 온도: 85-90°F (29-32°C), 시\n원한 지역 온도: 77-82°F (25-28°C), 밤 온도: 73-77°F (23-25°C)','UVB 램프 및 밝은 빛 필요, 6500K 색온도 이상의 밝은 빛 권장','평균 습도 40-75%, 밤과 낮의 습도 변동은 정상','상대적으로 어린 나이에\n도 크기가 크고 비교적 튼튼하므로 주의 깊은 관리가 필요합니다. 민감한 피부를 가지고 있으므로 다루는 것에 주의가 필요합니다.','최소 사육 용기 크기: 24”L x 24”W x 48”H 이상','마다가스카르 섬 원산,  \n세계 여러 지역에서 침입종으로 발견됨','Giant_Day_Gecko.jpg'),(25,'피콕 데이 게코','최대 15년','곤충, 크레스티드 게코 식이 제품 (CGD)','유년기: 매일 곤충, CGD 매일 또는 매 2일, 성체: 곤충 2주에 2회, CGD 1주에 1회','낮 온도: \r (24-28°C), 밤 온도:  (20-23°C)','UVB 램프 및 밝은 빛 필요, 6500K 색온도 이상의 밝은 빛 권장','주간 습도 40-75%, 밤 습도 높음, 스프레이로 주기적으로 가습','비교적 어려운 종 중 하나\n로, 적절한 관리시 최대 15년까지 수명을 기대할 수 있음.','최소 사육 용기 크기: 12”L x 12”W x 18”H 이상','마다가스카르 동부 지역 원산','Peacock_Day_Gecko.jpg'),(26,'에메랄드 트리 스킨크','최소 7년','곤충, 과일, 크레스티드 게코 식이 제품 (CGD)','유년기: 매일 곤충, 매주 CGD, 성체: 곤충 매주 2회, CGD 매주 1회','낮 온도:  (24-29°C), 밤 온도: 68-77°F (20-25°C)','UVB 램프 및 밝은 빛 필요, 6500K 색온도 이상의 밝은 빛 권장','주간 습도 70%, 밤 습도 100%, 주기적으로 스프레이로 가습','종류에 따라 최소 7년의 수명을 기대할\n 수 있으며, 양질의 관리를 제공하면 더 오랜 기간 살 수 있음.','최소 사육 용기 크기: 24″L x 18″W x 36″H 이상','동남아시아, 특히 필리핀 및 인도네시아','Emerald_Tree_Skink.jpg'),(27,'파이어 스킨크','최대 15-20년','곤충 다양한 종류, 종종 과일과 꽃','유년기: 매일-매일 다양한 곤충, 주간 CGD, 성체: 주간 곤충 2회, 주간 CGD 1회','방치 온도: 75-85°F (24-29°C), 밤 온도: 70-75°F (21-24°C), 일광욕 온도: 92-96°F (33-35.5°C)','12시간/일 활성화, UVB 조명 권장','평균 습도 60-70%, 주간 시간에는 가습 필요','파이어 스킨크는 활발하고 사교적인 애완 동물로 잘 알려져 있으며, 고품질 \n의 관리를 제공하면 최대 15-20년의 수명을 기대할 수 있음.','최소 사육 용기 크기: 36”L x 18”W x 18”H 이상','서부 중앙 아프리카','Fire_Skink.jpg'),(28,'가고일 꾸러미 암사자','적절한 관리하에 15-20년 이상 생존 가능','다양한 곤충, 종종 과일과 꽃','유년기: 매일 다양한 곤충, 주간에는 Crested Gecko Diet (CGD); 성체: 주 2회 곤충, 주 1회 CGD','주간\n 온도: 75-85°F (24-29°C), 야간 온도: 70-75°F (21-24°C), 일광욕 온도: 92-96°F (33-35.5° C)','하루에 12시간 활성화, UVB 조명 권장','평균 습도 60-70%, 주간에 가습 필요','가고일 꾸러미 암사자는 활동\n적이고 사회적인 반려동물로, 높은 품질의 관리로 15-20년 이상 살 수 있습니다.','최소 컨테이너 크기: 적어도 36”L x 18”W x 18”H','서부 중앙 아프리카','Gargoyle_Gecko.jpg'),(29,'스탠딩 데이 게코','최대 15-20년','곤충, 크레스티드 게코 식이 제품 (CGD)','유년기: 매일 곤충, CGD 매일 또는 매 2일, 성체: 곤충 2-3주에 1회, CGD 1주에 1회','일광욕 온도: 90-95°F (32-35°C), 일반\n 온도: 75-88°F (24-31°C), 밤 온도: 72-74°F (22-23°C)','UVB 램프 및 밝은 빛 필요, 6500K 색온도 이상의 밝은 빛 권장','주간 습도 40-75%, 밤 습도 높음, 스프레이로 주기적으로 가습','Vulnerable로 분류\n되어 있는 종으로, 적절한 관리시 최대 15-20년까지 수명을 기대할 수 있음.','최소 사육 용기 크기: 24”L x 24”W x 48”H 이상','마다가스카르 남서부 지역 원산','Standing’s_Day_Gecko.jpg'),(30,'녹색 애놀','적절한 관리하에 최대 10년 이상 생존 가능','다양한 곤충','유년기: 매일, 성체: 주 2회','주간 온도: 75-85°F (24-29°C), 야간 온도: 70-75°F (21-24°C), 일광욕 온도: 90°F (32°C)','하루 \n에 10-14시간 빛, UVB 조명 권장','주간 습도 60-70%, 가습 필요','녹색 애놀은 다양한 관리 요구사항을 갖추어야 하며, 적절한 환경에서 최대 10년 이상 생존할 수 있습니다.','최소 컨테이너 크기: 24″L x 24″W x 24″H','미국 남부 및 동남부, 하와이, 캘리포니아 남부 해안 및 북태평양 섬','Green_Anole.jpg'),(31,'기타',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'물그릇',' 플라스톤 크레전용 물그릇1','https://www.vanmori.com/product/d683054b-3b07-4007-a3cc-8520806d468d',2600,'구조물'),(2,'은신처','레파즈 게코 습식 케이지 파충류 습식은신처','https://www.vanmori.com/product/7b70eb6e-9331-4f95-98ab-76fa42dae491',4000,'구조물'),(3,'선인장','THE 육지거북 전용 영양만점 천년초 선인장 400g ','https://theexotic.co.kr/product/the-%EC%9C%A1%EC%A7%80%EA%B1%B0%EB%B6%81-%EC%A0%84%EC%9A%A9-%EC%98%81%EC%96%91%EB%A7%8C%EC%A0%90-%EC%B2%9C%EB%85%84%EC%B4%88-%EC%84%A0%EC%9D%B8%EC%9E%A5-400g/1956/category/45/display/1/',9500,'먹이'),(4,'유산균','녹십자수의약품 G-REP LACTO 유산균 캡슐정 ','https://theexotic.co.kr/product/%EB%85%B9%EC%8B%AD%EC%9E%90%EC%88%98%EC%9D%98%EC%95%BD%ED%92%88-g-rep-lacto-%EC%9C%A0%EC%82%B0%EA%B7%A0-%EC%BA%A1%EC%8A%90%EC%A0%95/1939/category/45/display/1/',22000,'영양제'),(5,'전구','[나투라] 데이라이트 (100w)','https://theexotic.co.kr/product/%EB%82%98%ED%88%AC%EB%9D%BC-%EB%8D%B0%EC%9D%B4%EB%9D%BC%EC%9D%B4%ED%8A%B8-100w/1777/category/44/display/1/',8000,'기계'),(6,'케이지','[P0000FEG] 렙티주 미니테라리움 30*30*30cm ','https://newrunreptile.co.kr/product/detail.html?product_no=3490&cate_no=282&display_group=1',55000,'구조물'),(7,'온도기','렙티주 공식 우수 자동온도조절기 /소형화 및 최신기술탑재','https://newrunreptile.co.kr/product/detail.html?product_no=3391&cate_no=311&display_group=1',32000,'기계'),(8,'습도기','렙티주 미스팅기 0.8L (완전 간단한 설치가능) 적립금','https://newrunreptile.co.kr/product/detail.html?product_no=3390&cate_no=311&display_group=1',85000,'기계'),(9,'은신처',' 엑소테라 크로커다일 악어해골 은신처','https://newrunreptile.co.kr/product/detail.html?product_no=3601&cate_no=102&display_group=1',17000,'구조물'),(10,'온습도계','렙티주 야광 온습도계 야간사용 가능','https://newrunreptile.co.kr/product/detail.html?product_no=3383&cate_no=102&display_group=1',12500,'기계'),(11,'목줄','노모이 파충류 전용 목줄','https://newrunreptile.co.kr/product/detail.html?product_no=3090&cate_no=102&display_group=1',7000,'구조물'),(12,'청결제','NRC 스프링클 뉴클리어 120ml 2+1 초강력이벤트 (파충류 사육 청결제)','https://newrunreptile.co.kr/product/detail.html?product_no=2491&cate_no=102&display_group=1',5000,'영양제'),(13,'난파선 구조물','클리오네 난파선(대형)CH515','https://newrunreptile.co.kr/product/detail.html?product_no=2772&cate_no=102&display_group=1',60000,'구조물');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `unique_number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'ssafy1234','$2a$10$9YiiCQIkYcbEGiQp5DWJjOgUcqpIAZZUUgDIt.uLidJl0VqpArl/e','김싸피',NULL),(3,'test1234','$2a$10$pOzid.5x1F74Ak4XwZuyvei0.6q0wfzTY1uc3bWYk8Y.y0V4djqDi','test',NULL),(4,'ysang10','$2a$10$6GT5ynznGePDKXfTJgdM3eSWdkotQooxRE.zuu09Z6AIQ6rQmCgYy','윤프',NULL),(6,'asdfasdf','$2a$10$vkYVsosOO0IMum/AgpiureXq92QeDWcBSp8VHZrTyPtoXridz.OI2','asdf',NULL),(10,'asya393','$2a$10$od.D/p3RO0un.Om4mupYKOj0ODYRfELnfj8bWIatczNkCe66jHO6K','녹색',NULL),(11,'aaaa','$2a$10$TJjiZvwChORwMj2Dg6yfPuY5yh.NSzom7NjWHC8IPdFu7C9bt7g5O','aaa',NULL),(16,'younsang','$2a$10$mVLE0drLQ0mzrB78TQ60NurR1Rxj3kw7YedPA020XN0Q3.qncTPAK','윤상','01040905168'),(17,'injogh','$2a$10$jEYgcVobXbrIJWiy/oNLFeoQBZUHt/YiNLJ1c37oiQKSSj/5Ly/fO','정환','01048194898'),(18,'skdkdkskdk','$2a$10$HdFdKi/0wbe47sm6XaxwtexzFIat3eEz.7C1PCos66uT.Y/2PevwS','kddldkd','01033685168'),(19,'hanju','$2a$10$JdDV5xlEiz7BnFo8xhQcreN02UNSMBkTV9aV79uY1ai.miWDNiqc2','한주','01065551715');
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

-- Dump completed on 2023-08-18  0:08:39
