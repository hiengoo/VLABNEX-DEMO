-- --------------------------------------------------------
-- Máy chủ:                      127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Phiên bản:           12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for webbanhang
CREATE DATABASE IF NOT EXISTS `webbanhang` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webbanhang`;

-- Dumping structure for table webbanhang.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rdxh7tq2xs66r485cc8dkxt77` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.brand: ~0 rows (approximately)
INSERT INTO `brand` (`id`, `name`, `thumbnail`) VALUES
	(1, 'SKIN 1004', '/media/static/20ccab9a-67e8-4358-809f-4f93b59d6fc9.png');

-- Dumping structure for table webbanhang.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.brands: ~0 rows (approximately)

-- Dumping structure for table webbanhang.cart_item
CREATE TABLE IF NOT EXISTS `cart_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjcyd5wv4igqnw413rgxbfu4nv` (`product_id`),
  KEY `FKjnaj4sjyqjkr4ivemf9gb25w` (`user_id`),
  CONSTRAINT `FKjcyd5wv4igqnw413rgxbfu4nv` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKjnaj4sjyqjkr4ivemf9gb25w` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.cart_item: ~0 rows (approximately)

-- Dumping structure for table webbanhang.cart_items
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.cart_items: ~0 rows (approximately)

-- Dumping structure for table webbanhang.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.categories: ~0 rows (approximately)

-- Dumping structure for table webbanhang.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.category: ~0 rows (approximately)
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Serum');

-- Dumping structure for table webbanhang.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm1rmnfcvq5mk26li4lit88pc5` (`product_id`),
  KEY `FK8kcum44fvpupyw6f5baccx25c` (`user_id`),
  CONSTRAINT `FK8kcum44fvpupyw6f5baccx25c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKm1rmnfcvq5mk26li4lit88pc5` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.comment: ~0 rows (approximately)
INSERT INTO `comment` (`id`, `content`, `created_at`, `product_id`, `user_id`) VALUES
	(1, 'hi', '2024-04-08 00:47:39', 4618230, 1);

-- Dumping structure for table webbanhang.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.comments: ~0 rows (approximately)

-- Dumping structure for table webbanhang.image
CREATE TABLE IF NOT EXISTS `image` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uploaded_at` datetime DEFAULT NULL,
  `uploaded_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4pgw8w3qp244ujvcs4wowiv3x` (`link`),
  KEY `FK6q9lwl1j82nmm8n75cxcuxc1p` (`uploaded_by`),
  CONSTRAINT `FK6q9lwl1j82nmm8n75cxcuxc1p` FOREIGN KEY (`uploaded_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.image: ~2 rows (approximately)
INSERT INTO `image` (`id`, `link`, `name`, `type`, `uploaded_at`, `uploaded_by`) VALUES
	('07b9c801-6ee2-4f93-9892-52600b16db37', '/media/static/07b9c801-6ee2-4f93-9892-52600b16db37.jpeg', 'file', 'jpeg', '2024-04-07 01:29:09', NULL),
	('20ccab9a-67e8-4358-809f-4f93b59d6fc9', '/media/static/20ccab9a-67e8-4358-809f-4f93b59d6fc9.png', 'file', 'png', '2024-04-07 01:25:10', NULL);

-- Dumping structure for table webbanhang.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uploaded_at` datetime NOT NULL,
  `uploaded_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploaded_by` (`uploaded_by`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.images: ~0 rows (approximately)

-- Dumping structure for table webbanhang.ingredients
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `detail` text COLLATE utf8mb4_general_ci,
  `risk_level` int DEFAULT NULL,
  `uses` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `guide` text COLLATE utf8mb4_general_ci,
  `skin_compatibility` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.ingredients: ~4 rows (approximately)
INSERT INTO `ingredients` (`id`, `name`, `detail`, `risk_level`, `uses`, `guide`, `skin_compatibility`) VALUES
	(1, 'Water', 'Là thành phần mỹ phẩm được sử dụng phổ biến, nước gần như luôn luôn được liệt kê đầu tiên trong bảng thành phần trên một nhãn nguyên liệu vì nó thường là thành phần có nồng độ cao nhất trong công thức. Nước có thể không phải là một thành phần quan trọng cho da. Chỉ cần 10% nồng độ nước trong lớp ngoài của da là cần thiết cho sự mềm mại và tính dẻo dai trong phần này của lớp biểu bì. Các nghiên cứu so sánh hàm lượng nước trong da khô so với bình thường hoặc da nhờn không tìm thấy sự khác biệt có ý nghĩa thống kê về mức độ ẩm giữa chúng. Hơn nữa, nước quá nhiều có thể là một vấn đề đối với da bởi vì nó có thể phá vỡ các chất thiết yếu trong các lớp bề mặt của da mà giữ cho nó còn nguyên vẹn, mịn màng, và trông khỏe mạnh. Ví dụ, hãy nhớ lại da ngón tay bạn bị "móp" khi bạn tắm quá lâu', 1, 'Dễ dàng sử dụng', 'Không có hướng dẫn đặc biệt', 'Mọi loại da'),
	(2, 'Asiaticoside', NULL, 0, NULL, NULL, NULL),
	(3, 'Asiatic Acid', NULL, 0, NULL, NULL, NULL),
	(4, 'Madecassic Acid', NULL, 0, NULL, NULL, NULL);

-- Dumping structure for table webbanhang.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `receiver_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receiver_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receiver_phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `total_amount` bigint DEFAULT NULL,
  `buyer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4odf7l3wq1f4up72w6cc0ybqj` (`buyer_id`),
  CONSTRAINT `FK4odf7l3wq1f4up72w6cc0ybqj` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.orders: ~0 rows (approximately)

-- Dumping structure for table webbanhang.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `status` int DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt4dc2r9nbvbujrljv3e23iibt` (`order_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.order_item: ~0 rows (approximately)

-- Dumping structure for table webbanhang.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint NOT NULL,
  `quantity` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `FKlf6f9q956mt144wiv6p1yko16` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.order_items: ~0 rows (approximately)

-- Dumping structure for table webbanhang.post
CREATE TABLE IF NOT EXISTS `post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `modified_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int DEFAULT '0',
  `thumbnail` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK93o2xaw90541rp5xaf29hsgd2` (`created_by`),
  KEY `FKodidrykmej58d3xy9ynanq3vw` (`modified_by`),
  CONSTRAINT `FK93o2xaw90541rp5xaf29hsgd2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FKodidrykmej58d3xy9ynanq3vw` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.post: ~0 rows (approximately)

-- Dumping structure for table webbanhang.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint NOT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  `created_at` datetime NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `modified_at` datetime NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.posts: ~0 rows (approximately)

-- Dumping structure for table webbanhang.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `is_available` tinyint(1) DEFAULT NULL,
  `name` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `price` bigint DEFAULT NULL,
  `product_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `quantity` int NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `total_sold` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `ingredient` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs6cydsualtsrprvlf2bb3lcam` (`brand_id`),
  CONSTRAINT `FKs6cydsualtsrprvlf2bb3lcam` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `product_chk_1` CHECK (json_valid(`product_images`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.product: ~0 rows (approximately)
 INSERT INTO `product` (`id`, `created_at`, `description`, `is_available`, `name`, `price`, `product_images`, `quantity`, `slug`, `total_sold`, `brand_id`, `ingredient`) VALUES
	 (4618230, NULL, '<p style="line-height: 1.5;">Em tinh chất này thì quá nổi của hãng Skin1004 rồi. Với thành phần đúng như tên của em tinh chất Rau má Skin1004 Madagascar Centella Ampoule: chứa 100% chiết xuất cô đặc từ Rau Má vùng Madagascar – nơi được mệnh danh là hòn đảo đã có mặt lâu đời nhất trên Trái Đất.</p><p style="line-height: 1.5;"></p><p style="line-height: 1.5;">Trong thành phần bao gồm các hoạt chất như sau:</p><p style="line-height: 1.5;">- 30% Asiaticoside: Cải thiện sự cân bằng lượng dầu – nước, giúp tổng hợp Collagen ở tầng biểu bì.</p><p style="line-height: 1.5;">- 30% Asiatic Acid: Củng cố hàng rào bảo vệ tự nhiên của da, làm dịu làn da mẫn cảm, chống oxy hóa và góp phần cải thiện độ đàn hồi của da.</p><p style="line-height: 1.5;">- 40% Madecassic Acid: làm dịu làn da mệt mỏi, cải thiện các thương tổn do mụn để lại, làm lành làn da bị tổn thương.</p><p style="line-height: 1.5;"></p><p style="line-height: 1.5;">Em này cấp ẩm cực tốt và còn làm dịu da, dưỡng da dành cho nhữung ngày lười thì có thể chỉ sử dụng mỗi em này rồi đi ngủ luôn cũng được. Chất thấm nhanh và không bết rít trên da. Phù hợp cho mọi loại da luôn nha!</p>', 1, 'Skin1004 Madagascar Centella Ampoule 55ml', 310000, '["/media/static/07b9c801-6ee2-4f93-9892-52600b16db37.jpeg"]', 10, 'skin1004-madagascar-centella-ampoule-55ml', 0, 1, NULL);

-- Dumping structure for table webbanhang.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `is_available` tinyint(1) DEFAULT NULL,
  `name` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `product_images` text COLLATE utf8mb4_general_ci,
  `slug` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.products: ~0 rows (approximately)

-- Dumping structure for table webbanhang.product_category
CREATE TABLE IF NOT EXISTS `product_category` (
  `product_id` bigint NOT NULL,
  `category_id` int NOT NULL,
  KEY `FKkud35ls1d40wpjb5htpp14q4e` (`category_id`),
  KEY `FK2k3smhbruedlcrvu6clued06x` (`product_id`),
  CONSTRAINT `FK2k3smhbruedlcrvu6clued06x` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKkud35ls1d40wpjb5htpp14q4e` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.product_category: ~0 rows (approximately)
INSERT INTO `product_category` (`product_id`, `category_id`) VALUES
	(4618230, 1);

-- Dumping structure for table webbanhang.product_ingredient
CREATE TABLE IF NOT EXISTS `product_ingredient` (
  `product_id` bigint NOT NULL,
  `ingredient_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`ingredient_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `product_ingredient_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.product_ingredient: ~0 rows (approximately)
INSERT INTO `product_ingredient` (`product_id`, `ingredient_id`) VALUES
	(4618230, 1),
	(4618230, 2),
	(4618230, 3),
	(4618230, 4);

-- Dumping structure for table webbanhang.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  CONSTRAINT `user_chk_1` CHECK (json_valid(`roles`))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.user: ~2 rows (approximately)
INSERT INTO `user` (`id`, `address`, `created_at`, `email`, `full_name`, `password`, `phone`, `roles`, `status`) VALUES
	(1, NULL, '2024-04-06 15:13:06', 'admin@gmail.com', 'Admin', '$2y$10$lUctaWcCDsBuqUDMfOjrgurE38WXuChJYqmD3MTLOlsYYbzK5zkTS', '0987654321', '["USER", "ADMIN"]', 1),
	(2, NULL, '2024-04-06 15:47:25', 'caominh26032003@gmail.com', 'Cao Minh', '$2a$10$l7PikzHIZUFsxCweVG1DjefqNw.UYwQQ1JNxeiroGNSk5schIZEIa', '0987654321', '["USER"]', 1);

-- Dumping structure for table webbanhang.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `full_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `users_chk_1` CHECK (json_valid(`roles`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webbanhang.users: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
