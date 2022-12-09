-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: greeny_shop
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_image` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (4,NULL,'Sữa rửa mặt'),(5,NULL,'Mặt nạ'),(6,NULL,'Trang điểm'),(7,NULL,'Chăm sóc tóc'),(8,NULL,'Dưỡng da'),(9,NULL,'Kem chống nắng');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `rate_date` datetime DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `order_detail_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfwepd0s8syqc9s06xnqa7mdwf` (`order_detail_id`),
  KEY `FK6uv0qku8gsu6x1r2jkrtqwjtn` (`product_id`),
  KEY `FKqi14bvepnwtjbbaxm7m4v44yg` (`user_id`),
  CONSTRAINT `FK6uv0qku8gsu6x1r2jkrtqwjtn` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKfwepd0s8syqc9s06xnqa7mdwf` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`order_detail_id`),
  CONSTRAINT `FKqi14bvepnwtjbbaxm7m4v44yg` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `favorite_id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`favorite_id`),
  KEY `FK6sgu5npe8ug4o42bf9j71x20c` (`product_id`),
  KEY `FK1uphh0glinnprjknyl68k1hw1` (`user_id`),
  CONSTRAINT `FK1uphh0glinnprjknyl68k1hw1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK6sgu5npe8ug4o42bf9j71x20c` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_detail_id` bigint NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (70,449000,1,32,65),(71,99000,1,32,50),(72,330000,1,32,51),(73,140000,1,32,37),(74,360000,1,32,39),(75,510000,1,32,42),(76,340000,1,32,44),(77,216000,1,32,60),(78,495000,1,32,45),(79,520000,1,33,48),(80,330000,1,34,51),(81,260000,1,35,38),(82,360000,1,36,39),(83,360000,1,37,39),(84,150000,1,38,54),(85,330000,1,39,51),(86,360000,1,39,39);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (32,'phu xuyen',2656990,'2022-11-27 00:00:00','+840981542102',2,9),(33,'phu xuyen',468000,'2022-11-27 00:00:00','+840981542102',3,9),(34,'phu xuyen',297000,'2022-11-27 00:00:00','+840981542102',2,9),(35,'phu xuyen',234000,'2022-11-27 00:00:00','0981542102',3,9),(36,'phu xuyen',342000,'2022-11-27 00:00:00','+840981542102',2,9),(37,'phu xuyen',342000,'2022-12-01 00:00:00','+840981542102',2,9),(38,'phu xuyen',135000,'2022-12-01 00:00:00','+840981542102',3,9),(39,'phu xuyen',639000,'2022-12-02 00:00:00','+840981542102',2,9);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
  `discount` int NOT NULL,
  `entered_date` datetime DEFAULT NULL,
  `price` double NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `favorite` bit(1) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (37,'Sữa rửa mặt dịu nhẹ chiết xuất từ việt quất innisfree Blueberry Rebalancing 5.5 Cleanser có tính acid nhẹ, cân bằng độ pH giúp làm sạch nhẹ nhàng cho làn da ẩm mịn, sảng khoái.',20,'2022-11-26 00:00:00',140000,'ruamat1.jpg','Sữa rửa mặt cân bằng giữ ẩm da innisfree',99,NULL,4,_binary '\0'),(38,'Sữa rửa mặt trà xanh innisfree Green Tea Hydrating Amino Acid Cleansing Foam làm sạch tạp chất, đồng thời dưỡng ẩm để làn da sạch sẽ, mịn màng.',10,'2022-11-26 00:00:00',260000,'ruamat2.jpg','Sữa rửa mặt dưỡng ẩm da innisfree Green Tea',120,NULL,4,_binary '\0'),(39,'Sữa rửa mặt táo xanh innisfree Apple Seed Bubble Cleanser làm sạch sâu cho da và hạn chế tình trạng khô căng sau khi rửa mặt, được tạo bọt sẵn để tiết kiệm thời gian cho quá trình làm sạch.',5,'2022-11-26 00:00:00',360000,'ruamat3.jpg','Sữa rửa mặt làm sạch dạng bọt innisfree ',121,NULL,4,_binary '\0'),(40,'Sữa rửa mặt sạch sâu đá tro núi lửa innisfree Volcanic Pore BHA Cleansing Foam 150 g làm sạch sâu, se khít lỗ chân lông và giúp da thư giãn.',10,'2022-11-26 00:00:00',230000,'ruamat4.jpg','Sữa rửa mặt se khít lỗ chân lông innisfree',160,NULL,4,_binary '\0'),(41,'Sữa rửa mặt innisfree Bija Trouble Facial Foam chiết xuất từ dầu hạt Bija, Acid Salicylic BHA và hạt hoa hồng, giúp làm sạch bụi bẩn từ sâu bên trong lỗ chân lông, đặc biệt phù hợp cho làn da dầu mụn.',15,'2022-11-26 00:00:00',210000,'ruamat5.jpg','Sữa rửa mặt dành cho da mụn innisfree',100,NULL,4,_binary '\0'),(42,'Mặt nạ ngủ làm sáng da innisfree Brightening Pore Sleeping Mask chiết xuất từ vỏ quýt tươi Jeju Hallabong giúp dưỡng sáng, cấp ẩm và chăm sóc lỗ chân lông cho da.',5,'2022-11-26 00:00:00',510000,'matna1.jpg','Mặt nạ ngủ dưỡng sáng da, se khít lỗ chân lông innisfree',79,NULL,5,_binary '\0'),(43,'Mặt nạ ngủ trà xanh innisfree Green Tea Sleeping Mask cấp ẩm và cân bằng độ pH để khôi phục làn da khỏe mạnh.',2,'2022-11-26 00:00:00',370000,'matna2.jpg','Mặt nạ ngủ dưỡng ẩm da innisfree',100,NULL,5,_binary '\0'),(44,'Siêu mặt nạ đất sét đá tro núi lửa innisfree Super Volcanic Pore Clay Mask 2X hút sạch đến 98% bã nhờn và thanh lọc lỗ chân lông.',10,'2022-11-26 00:00:00',340000,'matna3.jpg','Siêu mặt nạ đất sét đá tro núi lửa innisfree',89,NULL,5,_binary '\0'),(45,'Siêu mặt nạ đất sét mousse innisfree Super Volcanic Clay Mousse Mask 2X hút sạch bã nhờn và tẩy tế bào chết mạnh mẽ nhờ đá tro núi lửa, AHA, BHA, cellulose và sulfur.',20,'2022-11-26 00:00:00',495000,'matna4.jpg','Mặt nạ se khít lỗ chân lông dạng bọt xốp innisfree',119,NULL,5,_binary '\0'),(46,'Mặt nạ innisfree Black Tea Youth Enhancing Ampoule Mask với tăng cường tinh chất trà đen, giàu lợi ích chống oxy hóa, giúp cấp ẩm tức thì và cải thiện độ săn chắc, trả lại vẻ đẹp tươi trẻ và sáng khỏe cho làn da.',15,'2022-11-26 00:00:00',99000,'matna5.jpg','Mặt nạ phục hồi da innisfree',100,NULL,5,_binary '\0'),(47,'Mặt nạ giấy innisfree My Real Squeeze Mask chiết xuất từ nước ép tự nhiên đảo Jeju, giải quyết các vấn đề khác nhau của làn da. Làm từ 100% cellulose lành tính, mặt nạ ứng dụng công nghệ vắt - ép lạnh để tối ưu hóa dưỡng chất.',10,'2022-11-26 00:00:00',27000,'matna6.jpg','Mặt nạ cấp nước, làm mát da innisfree',110,NULL,5,_binary '\0'),(48,'Phấn nước Skin Fit Glow Cushion tạo hiệu ứng căng mịn, bóng khỏe cho lớp nền. Phấn nước sử dụng công nghệ Even Fitting Formula, vô cùng mỏng nhẹ, dễ tán đều và vừa khít với đường cong gương mặt. Phấn nước vừa mang đến lớp nền glass kin chuẩn Hàn, vừa dưỡng da đa năng: Dưỡng sáng, chống nhăn và chống nắng với chỉ số SPF34 PA++.',10,'2022-11-27 00:00:00',520000,'trangdiem1.jpg','Phấn nước trang điểm ẩm mượt innisfree',100,NULL,6,_binary '\0'),(49,'Bộ sản phẩm chăm sóc tóc gãy rụng innisfree My Hair Recipe Strength For Hair Roots Care giúp nuôi dưỡng chân tóc chắc khỏe và cải thiện tình trạng tóc gãy rụng.',30,'2022-11-27 00:00:00',449000,'toc1.jpg','Bộ sản phẩm chăm sóc tóc gãy rụng innisfree',100,NULL,7,_binary '\0'),(50,'Kem dưỡng da tay innisfree innisfree Jeju Life Perfumed Hand Cream với hương thơm dài lâu mang phong cách thiên nhiên Jeju lãng mạn và kết cấu thẩm thấu nhanh mà vẫn giàu ẩm. Đa dạng 10 mùi hương lựa chọn và thuận tiện sử dụng với nắp vặn dễ dàng.',5,'2022-11-27 00:00:00',99000,'duongda1.jpg','Kem dưỡng da tay hương thiên nhiên innisfree',99,NULL,8,_binary '\0'),(51,'Kem chống nắng innisfree Tone Up No Sebum Sunscreen EX SPF 50+ PA++++ với màng lọc chống nắng vật lý, giúp bảo vệ da tối ưu, đồng thời mang lại hiệu quả nâng tông, kiềm dầu vượt trội, duy trì làn da hồng hào, mịn mượt suốt 24 giờ.',10,NULL,330000,'chongnang1.jpg','Kem chống nắng nâng tông kiềm dầu innisfree ',97,NULL,9,_binary '\0'),(52,'Bảng phấn mắt với các tông màu cơ bản, dễ dùng, tạo chiều sâu cho mắt mà vẫn đem lại sự tự nhiên, phù hợp với trang điểm hàng ngày.',10,'2022-11-27 00:00:00',700000,'trangdiem2.jpg','Bảng phấn mắt các màu cơ bản innisfree',80,NULL,6,_binary '\0'),(53,'Dầu gội dưỡng tóc hương hoa trà innisfree Camellia Essential Shampoo giúp giữ ẩm và nuôi dưỡng mái tóc bị hư tổn trở nên bóng mượt.',0,'2022-11-27 00:00:00',449000,'toc2.jpg','Bộ sản phẩm dưỡng tóc suôn mượt hoa trà innisfree',100,NULL,7,_binary '\0'),(54,'Gel dưỡng da tay innisfree Green Tea Pure Gel Hand Cream EX chiết xuất từ trà xanh hữu cơ đảo Jeju giúp tăng cường dưỡng ẩm và chăm sóc đôi tay mềm mại, mịn màng.',10,'2022-11-27 00:00:00',150000,'duongda2.jpg','Gel dưỡng da tay hương trà xanh innisfree',100,NULL,8,_binary '\0'),(55,'Kem chống nắng hóa học innisfree Anti-aging Serum Sunscreen SPF 50+ PA++++ giúp bảo vệ và đẩy lùi các dấu hiệu lão hóa nhờ chứa tinh chất lá anh thảo chống oxy hóa. Đồng thời, kem giúp dưỡng ẩm và làm dịu da.',10,'2022-11-27 00:00:00',540000,'chongnang2.jpg','Kem chống nắng hỗ trợ chống lão hoá innisfree',100,NULL,9,_binary '\0'),(56,'Son dưỡng môi innisfree Dewy Treatment Lip Balm với thành phần giàu ẩm và nhiều dưỡng chất, giúp đôi môi được cấp ẩm tức thì và nuôi dưỡng chuyên sâu vào ban đêm, cho hiệu ứng căng mướt và mềm mại như nhung.',20,'2022-11-27 00:00:00',340000,'trangdiem3.jpg','Son dưỡng môi chuyên sâu innisfree',100,NULL,6,_binary '\0'),(57,'Kem nền trang điểm lâu trôi innisfree My Foundation All day Longwear SPF25 PA ++ là phiên bản cải tiến của dòng kem nền My Foundation, chất kem nền Semi-matte lì mịn, giúp che phủ và giữ lớp nền lâu trôi, kéo dài suốt 24 giờ. Công thức bổ sung chỉ số chống nắng giúp bảo vệ làn da nhẹ nhàng, cho lớp nền hoàn hảo như ý.',5,NULL,520000,'trangdiem4.jpg','Kem nền trang điểm lâu trôi innisfree',99,NULL,6,_binary '\0'),(58,'Kem dưỡng da tay innisfree Olive Real Moisture Hand Cream EX 50ml chiết xuất từ tinh dầu Olive nguyên chất giàu độ ẩm và dưỡng chất giúp cấp nước từ sâu bên trong và dưỡng ẩm cho làn da tay khô ráp.',10,'2022-11-27 00:00:00',150000,'duongda3.jpg','Kem dưỡng da tay hương oliu innisfree',100,NULL,8,_binary '\0'),(59,'Dầu dưỡng ẩm toàn thân ô liu innisfree Olive Real Body Oil chiết xuất từ tinh dầu ô liu vàng nguyên chất, giúp dưỡng ẩm sâu, mang lại làn da mềm mại và ẩm mượt.',10,'2022-11-27 00:00:00',360000,'duongda4.jpg','Dầu dưỡng ẩm toàn thân hương ô liu innisfree',100,NULL,8,_binary '\0'),(60,'Son tint dạng lì siêu nhẹ môi innisfree Airy Matte Tint với kết cấu mỏng nhẹ như phấn, cho hiệu ứng lì mịn và ẩm mượt mà không gây nặng môi. Bảng màu MLBB (My Lips But Better) thời thượng cho sắc son tươi tắn và cuốn hút mỗi ngày.',10,'2022-11-27 00:00:00',216000,'trangdiem5.jpg','Son kem innisfree',99,NULL,6,_binary '\0'),(61,'Gel tẩy da chết toàn thân innisfree Green Tea Pure Body Gel Scrub chiết xuất từ trà xanh hữu cơ Jeju giúp loại bỏ tế bào chết trên da, cấp ẩm cho làn da mịn màng và tươi sáng.',12,'2022-11-27 00:00:00',200000,'duongda5.jpg','Gel tẩy tế bào chết toàn thân hương trà xanh innisfree',100,NULL,8,_binary '\0'),(62,'Chì kẻ lông mày lâu trôi innisfree Simple Label Lasting Pencil Brow với thiết kế đầu chì được dát 3D cùng kết cấu chống trôi và hiệu ứng lì, giúp nét vẻ được thanh mảnh và bám lâu trên da. Công thức thuần chay không gây dị ứng, giúp da luôn cảm thấy thoải mái và nhẹ nhàng.',5,NULL,270000,'trangdiem6.jpg','Chì kẻ lông mày lâu trôi innisfree',100,NULL,6,_binary '\0'),(63,'Gel đa năng chiết xuất từ nha đam hữu cơ Jeju innisfree Aloe Revital Soothing Gel khôi phục độ ẩm tức thì, giúp làm dịu và mát da nhanh chóng.',6,NULL,160000,'duongda6.jpg','Gel nha đam dưỡng da innisfree',100,NULL,8,_binary '\0'),(64,'Mascara chân mày Skinny Brow Mascara với đầu cọ mỏng, chống thấm nước, giúp tạo màu và định hình chân mày thanh thoát, tự nhiên. Đặc biệt phù hợp với làn da dầu và toát mồ hôi nhờ độ bền màu cao.',2,'2022-11-27 00:00:00',86000,'trangdiem8.jpg','Mascara chân mày siêu mảnh innisfree',100,NULL,6,_binary '\0'),(65,'Dầu gội trà xanh Green Tea Fresh Shampoo giúp làm sạch, kiểm soát dầu thừa để hạn chế bết tóc.',4,'2022-11-27 00:00:00',449000,'toc3.jpg','Bộ sản phẩm hạn chế bết tóc trà xanh innisfree',99,NULL,7,_binary '\0'),(66,'Kem chống nắng vật lý 3 tác động innisfree Intensive Triple-shield Sunscreen SPF50+ PA++++ với chỉ số chống nắng cao giúp bảo vệ da khỏi tác hại của tia UV, đồng thời dưỡng trắng và cải thiện nếp nhăn, cho làn da trở nên săn chắc và đều màu.',6,'2022-11-27 00:00:00',360000,'chongnang3.jpg','Kem chống nắng lâu trôi tăng cường innisfree',100,NULL,9,_binary '\0');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (10,'ROLE_USER'),(11,'ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (9,'user.png','thangdz1401@gmail.com','Thắng Vũ','$2a$10$Ht..Cq8A1BYB9MaIWC0YE./SP6x9U2g.Xf4FZ9kKTMZUr1sNyNnqW','2022-11-26',_binary ''),(10,'user.png','winvu1401@gmail.com','Thắng','$2a$10$DPvVpPbhLeOFc0buuhigMuNYO7oxUL5pP02ithDaIhu.vE3Nosjt.','2022-11-26',_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`),
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (9,10),(10,11);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-08 15:29:52
