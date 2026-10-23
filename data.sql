/*
SQLyog Community v13.3.1 (64 bit)
MySQL - 8.4.7 : Database - friendshome
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`friendshome` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `friendshome`;

/*Table structure for table `attender` */

DROP TABLE IF EXISTS `attender`;

CREATE TABLE `attender` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_active` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `attender` */

/*Table structure for table `bill_type` */

DROP TABLE IF EXISTS `bill_type`;

CREATE TABLE `bill_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `table` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `bill_type` */

insert  into `bill_type`(`id`,`type`,`table`) values 
(1,'customer bill','prod_bill'),
(2,'customer balance collection','prod_bill_due'),
(3,'customer add advance','prod_bill_due'),
(4,'Customer old Balance add','prod_bill_due'),
(5,'purchase entry','prod_purchase'),
(6,'supplier balance collection','prod_supplier_due'),
(7,'supplier add advance','prod_supplier_due'),
(8,'Purchase Return','prod_purchase_return'),
(9,'Expense Entry','expense_entry'),
(11,'opening balance',NULL),
(12,'supplier old balance add','prod_supplier_due');

/*Table structure for table `company_details` */

DROP TABLE IF EXISTS `company_details`;

CREATE TABLE `company_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` text,
  `gstin` varchar(255) DEFAULT NULL,
  `print_type` int NOT NULL DEFAULT '0',
  `bank_details` varchar(255) DEFAULT NULL,
  `barcode_printer` varchar(255) DEFAULT NULL,
  `billing_type` int NOT NULL DEFAULT '1',
  `barcode_per_row` int NOT NULL DEFAULT '1',
  `barcode_width_mm` int NOT NULL DEFAULT '50',
  `barcode_height_mm` int NOT NULL DEFAULT '30',
  `printer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `thermal_print_type` int DEFAULT '1' COMMENT '1=local,2=cloud',
  `thermal_txt_file` int DEFAULT '1' COMMENT '1=txt file in bill folder',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `company_details` */

insert  into `company_details`(`id`,`shop_name`,`address`,`gstin`,`print_type`,`bank_details`,`barcode_printer`,`billing_type`,`barcode_per_row`,`barcode_width_mm`,`barcode_height_mm`,`printer_name`,`thermal_print_type`,`thermal_txt_file`) values 
(2,'FRIENDS HOME APPLINCE','NEW BUS STAND OPP\nSATHANKULAM.628704\nCELL: 9362636364, 7200607200','33ELNPM3247P1ZG',2,'TAMILNADU','AP4909',1,3,50,30,'',1,0);

/*Table structure for table `configure_bank_details` */

DROP TABLE IF EXISTS `configure_bank_details`;

CREATE TABLE `configure_bank_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_blocked` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `configure_bank_details` */

insert  into `configure_bank_details`(`id`,`name`,`is_blocked`) values 
(1,'SBI BANK',0),
(2,'CANARA BANK',0),
(3,'AXIS BANK',0),
(4,'IOB BANK',0);

/*Table structure for table `configure_payment_type` */

DROP TABLE IF EXISTS `configure_payment_type`;

CREATE TABLE `configure_payment_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_blocked` int unsigned NOT NULL DEFAULT '0',
  `type_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `configure_payment_type` */

insert  into `configure_payment_type`(`id`,`name`,`is_blocked`,`type_id`) values 
(1,'Cash',0,1),
(2,'BANK',0,2);

/*Table structure for table `credit_days` */

DROP TABLE IF EXISTS `credit_days`;

CREATE TABLE `credit_days` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `credit_days` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `credit_days` */

insert  into `credit_days`(`id`,`credit_days`) values 
(1,10);

/*Table structure for table `customer_account` */

DROP TABLE IF EXISTS `customer_account`;

CREATE TABLE `customer_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `advance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `customer_account` */

insert  into `customer_account`(`id`,`customer_id`,`advance`,`balance`) values 
(1,1,0.00,0.00),
(2,2,0.00,0.00),
(3,3,0.00,0.00),
(4,4,0.00,0.00),
(5,5,0.00,0.00),
(6,6,0.00,0.00),
(7,7,0.00,1200.00),
(8,8,0.00,0.00),
(9,9,0.00,0.00),
(10,10,0.00,0.00),
(11,11,0.00,0.00),
(12,12,0.00,0.00),
(13,13,0.00,0.00),
(14,14,0.00,0.00),
(15,15,0.00,5500.00);

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `is_eligible_for_commission` tinyint DEFAULT '1',
  `is_active` int DEFAULT '1',
  `gstin` varchar(255) DEFAULT NULL,
  `is_gst` int DEFAULT '0',
  `salesman` int DEFAULT NULL,
  `area` int DEFAULT NULL,
  `credit_limit` double(10,2) NOT NULL DEFAULT '0.00',
  `local` int DEFAULT '1',
  `exchange_point` double(10,3) DEFAULT '0.000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `customers` */

insert  into `customers`(`id`,`name`,`phone_number`,`address`,`date`,`time`,`is_eligible_for_commission`,`is_active`,`gstin`,`is_gst`,`salesman`,`area`,`credit_limit`,`local`,`exchange_point`) values 
(1,'ARUN WORK SHOP','9999999999','','2026-10-18','11:13:37',0,1,'',0,NULL,NULL,0.00,1,0.000),
(2,'M. EASAKKI','9787451226','','2026-10-18','13:24:05',0,1,'',0,NULL,NULL,0.00,1,0.000),
(3,'ALAGU POWER','9487359810','','2026-10-19','16:19:52',0,1,'',0,NULL,NULL,0.00,1,0.000),
(4,'CHINNADURAI','9787015082','','2026-10-19','16:21:14',0,1,'',0,NULL,NULL,0.00,1,0.000),
(5,'MANTHIRAM','9942442653','','2026-10-19','16:34:53',0,1,'',0,NULL,NULL,0.00,1,0.000),
(6,'JEYAKARAN','7598074864','','2026-10-19','20:35:18',0,1,'',0,NULL,NULL,0.00,1,0.000),
(7,'PALRAJ','7200400274','','2026-10-20','11:48:12',0,1,'',0,NULL,NULL,0.00,1,0.000),
(8,'UMA STORE PAYYAN','-','','2026-10-20','15:06:00',0,1,'',0,NULL,NULL,0.00,1,0.000),
(9,'BALA WORK SHOP','9688660763','','2026-10-20','18:42:34',0,1,'',0,NULL,NULL,0.00,1,0.000),
(10,'VIJAYAKUMAR','9158170631','','2026-10-20','19:02:28',0,1,'',0,NULL,NULL,0.00,1,0.000),
(11,'KANNAN','6382068094','','2026-10-21','10:57:36',0,1,'',0,NULL,NULL,0.00,1,0.000),
(12,'SUDALAIESWAR','9345449484','','2026-10-21','11:32:58',0,1,'',0,NULL,NULL,0.00,1,0.000),
(13,'MAHARAJA','8148352700','','2026-10-21','15:14:02',0,1,'',0,NULL,NULL,0.00,1,0.000),
(14,'ASIR WORK SHOP','8248934748','','2026-10-21','15:33:54',0,1,'',0,NULL,NULL,0.00,1,0.000),
(15,'JEYAKUMAR','9884997012','','2026-10-21','16:26:38',0,1,'',0,NULL,NULL,0.00,1,0.000);

/*Table structure for table `customers_exchange_point` */

DROP TABLE IF EXISTS `customers_exchange_point`;

CREATE TABLE `customers_exchange_point` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `bill_id` int NOT NULL,
  `old_point` double(10,3) DEFAULT '0.000',
  `exchange_point` double(10,3) DEFAULT '0.000',
  `total_point` double(10,3) DEFAULT '0.000',
  `uid` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `customers_exchange_point` */

/*Table structure for table `daybook_opening_balance` */

DROP TABLE IF EXISTS `daybook_opening_balance`;

CREATE TABLE `daybook_opening_balance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `balance_date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `notes` varchar(255) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `entry_date` date NOT NULL,
  `entry_time` time NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_balance_date` (`balance_date`),
  KEY `idx_active_date` (`is_active`,`balance_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `daybook_opening_balance` */

/*Table structure for table `expense_entry` */

DROP TABLE IF EXISTS `expense_entry`;

CREATE TABLE `expense_entry` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `exp_type` int NOT NULL,
  `content` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text,
  `exc_date_time` datetime DEFAULT NULL,
  `entry_date_time` datetime DEFAULT NULL,
  `is_active` int DEFAULT '1',
  `uid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`exp_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `expense_entry` */

/*Table structure for table `expense_type` */

DROP TABLE IF EXISTS `expense_type`;

CREATE TABLE `expense_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `is_active` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `expense_type` */

/*Table structure for table `gstin` */

DROP TABLE IF EXISTS `gstin`;

CREATE TABLE `gstin` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `gstin` varchar(255) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gstin` */

/*Table structure for table `heading` */

DROP TABLE IF EXISTS `heading`;

CREATE TABLE `heading` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `head1` varchar(255) DEFAULT NULL,
  `head2` varchar(255) DEFAULT NULL,
  `head3` varchar(255) DEFAULT NULL,
  `active` int DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `heading` */

insert  into `heading`(`id`,`head1`,`head2`,`head3`,`active`,`date`) values 
(1,'Category','Brand','Product',600,'2026-10-11');

/*Table structure for table `order_tables` */

DROP TABLE IF EXISTS `order_tables`;

CREATE TABLE `order_tables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_occupied` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order_tables` */

/*Table structure for table `pro_bill_exchange` */

DROP TABLE IF EXISTS `pro_bill_exchange`;

CREATE TABLE `pro_bill_exchange` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `old_prod_id` int NOT NULL,
  `new_prod_id` int NOT NULL,
  `uid` int NOT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pro_bill_exchange` */

/*Table structure for table `prod_batch` */

DROP TABLE IF EXISTS `prod_batch`;

CREATE TABLE `prod_batch` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `cost` double(10,3) DEFAULT '0.000',
  `mrp` double(10,3) DEFAULT '0.000',
  `commission` double(10,3) DEFAULT '0.000',
  `stock` decimal(10,2) NOT NULL,
  `disc_type` int DEFAULT '0' COMMENT '1=rs 2=%',
  `discount` double(10,3) DEFAULT '0.000',
  `date` date DEFAULT NULL,
  `time` time DEFAULT '00:00:00',
  `added_stock` decimal(10,2) NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prod` (`product_id`),
  KEY `disc` (`disc_type`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;

/*Data for the table `prod_batch` */

insert  into `prod_batch`(`id`,`name`,`product_id`,`cost`,`mrp`,`commission`,`stock`,`disc_type`,`discount`,`date`,`time`,`added_stock`,`uid`) values 
(1,'Z4 AH',1,930.000,1350.000,0.000,18.00,0,0.000,'2026-10-17','14:13:14',0.00,26),
(2,'Z5 AH 1',2,1100.000,1600.000,0.000,10.00,0,0.000,'2026-10-17','19:53:31',0.00,26),
(3,'Z5 AH 2',3,1210.000,1750.000,0.000,9.00,0,0.000,'2026-10-17','20:17:18',10.00,26),
(4,'Z7 AH 1',4,1310.000,1680.000,0.000,2.00,0,0.000,'2026-10-17','20:22:18',3.00,26),
(5,'Z7AH 2',5,1480.000,1780.000,0.000,1.00,0,0.000,'2026-10-17','20:23:08',1.00,26),
(6,'Z9 AH 1',6,1800.000,2300.000,0.000,3.00,0,0.000,'2026-10-17','20:24:40',3.00,26),
(7,'Z9 AH 2',7,1850.000,2160.000,0.000,3.00,0,0.000,'2026-10-17','20:29:47',3.00,26),
(8,'ZX 14',8,2600.000,3400.000,0.000,0.00,0,0.000,'2026-10-18','09:41:41',0.00,26),
(9,'Z14 A2',9,3000.000,3500.000,0.000,2.00,0,0.000,'2026-10-18','09:42:36',2.00,26),
(10,'Z38B20L',10,4100.000,5000.000,0.000,2.00,0,0.000,'2026-10-18','09:43:28',2.00,26),
(11,'Z38B20R',11,4100.000,5000.000,0.000,0.00,2,0.000,'2026-10-18','09:44:11',0.00,26),
(12,'Z55D23L',12,7000.000,8100.000,0.000,0.00,2,0.000,'2026-10-18','09:44:47',0.00,26),
(13,'Z40LBH',13,5050.000,5900.000,0.000,1.00,2,0.000,'2026-10-18','09:45:25',1.00,26),
(14,'ZDIN 50',14,6750.000,7600.000,0.000,1.00,2,0.000,'2026-10-18','09:46:15',1.00,26),
(15,'ZDIN 60',15,7900.000,9100.000,0.000,1.00,2,0.000,'2026-10-18','09:47:09',1.00,26),
(16,'ZDIN 66',16,8000.000,9200.000,0.000,1.00,2,0.000,'2026-10-18','09:47:55',1.00,26),
(17,'ZEY700F',17,7600.000,8550.000,0.000,1.00,2,0.000,'2026-10-18','09:48:28',1.00,26),
(18,'ZEY700LF',18,7600.000,8550.000,0.000,1.00,2,0.000,'2026-10-18','09:50:10',1.00,26),
(19,'ZEKO60L',19,5750.000,6450.000,0.000,1.00,2,0.000,'2026-10-18','09:51:05',1.00,26),
(20,'ZDRIVE80L',20,6750.000,7900.000,0.000,1.00,2,0.000,'2026-10-18','09:51:40',1.00,26),
(21,'ZXP1000',21,9600.000,10900.000,0.000,0.00,2,0.000,'2026-10-18','09:52:19',0.00,26),
(22,'Z1500',22,13500.000,15500.000,0.000,1.00,2,0.000,'2026-10-18','10:03:02',1.00,26),
(23,'ZXP1800',23,17600.000,18700.000,0.000,0.00,2,0.000,'2026-10-18','10:03:46',0.00,26),
(24,'Z2000 3Y',24,19000.000,21000.000,0.000,0.00,2,0.000,'2026-10-18','10:04:24',0.00,26),
(25,'ZMST1000',25,10900.000,13100.000,0.000,0.00,2,0.000,'2026-10-18','10:08:48',0.00,26),
(26,'Z150 SOLAR',26,13900.000,16000.000,0.000,0.00,2,0.000,'2026-10-18','10:13:56',0.00,26),
(27,'Z105 SOLAR',27,9500.000,12000.000,0.000,1.00,2,0.000,'2026-10-18','10:14:42',1.00,26),
(28,'ZEL 200AH [48M]',28,17600.000,21000.000,0.000,0.00,2,0.000,'2026-10-18','10:17:46',0.00,26),
(29,'Z200 SOLAR 5Y',29,19100.000,23000.000,0.000,1.00,2,0.000,'2026-10-18','10:18:22',1.00,26),
(30,'Z700',30,5200.000,6200.000,0.000,1.00,2,0.000,'2026-10-18','10:19:12',1.00,26),
(31,'Z900',31,5400.000,6500.000,0.000,1.00,2,0.000,'2026-10-18','10:19:41',1.00,26),
(32,'Z1125',32,6150.000,7300.000,0.000,1.00,2,0.000,'2026-10-18','10:20:09',1.00,26),
(33,'Z1625',33,9000.000,10700.000,0.000,0.00,2,0.000,'2026-10-18','10:20:41',0.00,26),
(34,'ZLITHIYAN 100',34,15750.000,18500.000,0.000,1.00,2,0.000,'2026-10-18','10:21:24',1.00,26),
(35,'Z2.5 AH',35,760.000,900.000,0.000,4.00,2,0.000,'2026-10-18','10:22:52',4.00,26),
(36,'ZAMAORN 4 AH',36,860.000,1300.000,0.000,27.00,2,0.000,'2026-10-18','10:23:29',31.00,26),
(37,'ZAMAORN 5 AH 1',37,1040.000,1600.000,0.000,24.00,2,0.000,'2026-10-18','10:24:06',24.00,26),
(38,'ZAMAORN 5 AH 2',38,1110.000,1750.000,0.000,13.00,2,0.000,'2026-10-18','10:24:54',13.00,26),
(39,'ZAMAORN 7 AH',39,1120.000,1700.000,0.000,4.00,2,0.000,'2026-10-18','10:25:37',0.00,26),
(40,'ZAMAORN 9 AH 1',40,1580.000,2300.000,0.000,3.00,2,0.000,'2026-10-18','10:26:25',3.00,26),
(41,'ZAMAORN 9 AH 2',41,1630.000,2250.000,0.000,5.00,2,0.000,'2026-10-18','10:26:58',6.00,26),
(42,'ZAMAORN 14 AH',42,2420.000,3000.000,0.000,1.00,2,0.000,'2026-10-18','10:27:58',1.00,26),
(43,'Z40 LMF',43,3200.000,4000.000,0.000,1.00,2,0.000,'2026-10-18','12:07:35',1.00,26),
(44,'Z38B20L',44,3550.000,4700.000,0.000,3.00,2,0.000,'2026-10-18','12:12:20',3.00,26),
(45,'Z38B20R',45,3550.000,4700.000,0.000,1.00,2,0.000,'2026-10-18','12:13:10',1.00,26),
(46,'ZBH38B20R',46,4500.000,5400.000,0.000,1.00,2,0.000,'2026-10-18','12:13:54',1.00,26),
(47,'Z40B20L',47,4150.000,5250.000,0.000,1.00,2,0.000,'2026-10-18','12:14:54',1.00,26),
(48,'Z42 B20R',48,4400.000,5250.000,0.000,0.00,2,0.000,'2026-10-18','12:15:45',1.00,26),
(49,'Z600 LMF  (24)',49,5250.000,6000.000,0.000,1.00,2,0.000,'2026-10-18','12:17:04',1.00,26),
(50,'Z800RMF',50,6450.000,8000.000,0.000,1.00,2,0.000,'2026-10-18','12:18:10',1.00,26),
(51,'ZDIN 50',51,6400.000,7900.000,0.000,1.00,2,0.000,'2026-10-18','12:19:05',1.00,26),
(52,'ZDIN 45',52,5450.000,6450.000,0.000,1.00,2,0.000,'2026-10-18','12:20:55',1.00,26),
(53,'ZDIN65',53,6700.000,8400.000,0.000,1.00,2,0.000,'2026-10-18','12:21:43',1.00,26),
(54,'ZDIN 66',54,7100.000,8500.000,0.000,1.00,2,0.000,'2026-10-18','12:22:45',1.00,26),
(55,'Z85D23R',55,6550.000,8150.000,0.000,1.00,2,0.000,'2026-10-18','12:36:35',1.00,26),
(56,'Z80D23L',56,6300.000,8100.000,0.000,1.00,2,0.000,'2026-10-18','12:37:08',1.00,26),
(57,'Z95D26R',57,6900.000,8100.000,0.000,1.00,2,0.000,'2026-10-18','12:37:44',1.00,26),
(58,'Z95D26L',58,6900.000,8100.000,0.000,1.00,2,0.000,'2026-10-18','12:38:25',1.00,26),
(59,'Z105D31R',59,7400.000,8800.000,0.000,1.00,2,0.000,'2026-10-18','12:38:56',1.00,26),
(60,'Z105D31L',60,7400.000,8800.000,0.000,0.00,2,0.000,'2026-10-18','12:39:37',1.00,26),
(61,'ZNT700 E41R',61,8750.000,10200.000,0.000,1.00,2,0.000,'2026-10-18','12:41:29',1.00,26),
(62,'ZBL90E41R',62,6800.000,8500.000,0.000,1.00,1,0.000,'2026-10-18','12:42:11',1.00,26),
(63,'Z1000 UPS',63,4900.000,5700.000,0.000,1.00,2,0.000,'2026-10-18','12:44:05',1.00,26),
(64,'Z1200 UPS',64,5250.000,6250.000,0.000,2.00,2,0.000,'2026-10-18','12:44:43',2.00,26),
(65,'Z1200 UPS',65,5250.000,6250.000,0.000,2.00,2,0.000,'2026-10-18','12:46:32',2.00,26),
(66,'Z1300 UPS',66,5750.000,6800.000,0.000,1.00,2,0.000,'2026-10-18','12:50:15',1.00,26),
(67,'Z1600 UPS',67,7100.000,8700.000,0.000,1.00,2,0.000,'2026-10-18','12:52:20',1.00,26),
(68,'ZTALL 100 AH SOLAR [5Y]',68,11600.000,13400.000,0.000,1.00,2,0.000,'2026-10-18','12:53:16',1.00,26),
(69,'Z130ST 48',69,8600.000,10600.000,0.000,0.00,2,0.000,'2026-10-18','12:53:47',0.00,26),
(70,'ZTALL 150 AH 36+24',70,12400.000,14300.000,0.000,1.00,2,0.000,'2026-10-18','12:54:20',1.00,26),
(71,'ZTALL 150 AH SOLAR 60 +12',71,14500.000,16700.000,0.000,2.00,2,0.000,'2026-10-18','12:54:59',2.00,26),
(72,'Z4 AH BOSCH',72,850.000,1250.000,0.000,12.00,2,0.000,'2026-10-18','12:56:36',12.00,26),
(73,'Z5 AH ELITO',73,900.000,1500.000,0.000,1.00,2,0.000,'2026-10-18','12:58:19',1.00,26),
(74,'Z875 W MICRO',74,4700.000,5700.000,0.000,1.00,2,0.000,'2026-10-18','13:00:10',1.00,26),
(75,'Z1075 MICRO',75,5300.000,6500.000,0.000,1.00,2,0.000,'2026-10-18','13:00:57',1.00,26),
(76,'Z1875 24 V MICRO',76,7800.000,9400.000,0.000,0.00,2,0.000,'2026-10-18','13:04:00',0.00,26),
(77,'ZMICROTEK 140AH',77,10000.000,13000.000,0.000,1.00,2,0.000,'2026-10-18','13:04:37',1.00,26),
(78,'Z150 AH LUMINOUS',78,13500.000,15500.000,0.000,1.00,2,0.000,'2026-10-18','13:05:21',1.00,26),
(79,'Z1050 W LUMINOS',79,6200.000,7500.000,0.000,1.00,2,0.000,'2026-10-18','13:05:52',1.00,26),
(80,'Z4 AH SF',80,830.000,1150.000,0.000,4.00,2,0.000,'2026-10-18','13:07:24',4.00,26),
(81,'Z5 AH 1 SF',81,1016.000,1500.000,0.000,9.00,2,0.000,'2026-10-18','13:09:40',10.00,26),
(82,'Z5 AH 2 SF',82,930.000,1300.000,0.000,8.00,2,0.000,'2026-10-18','13:13:05',8.00,26),
(83,'ZSF 38B20R',83,3350.000,4150.000,0.000,1.00,2,0.000,'2026-10-18','13:14:20',1.00,26),
(84,'ZSF 150 TT',84,11000.000,13000.000,0.000,1.00,2,0.000,'2026-10-18','13:14:57',1.00,26),
(85,'ZEASTMAN 150AH',85,11500.000,12500.000,0.000,1.00,2,0.000,'2026-10-18','13:15:59',1.00,26),
(86,'Z1200 W EASTMAN',86,6000.000,6700.000,0.000,1.00,2,0.000,'2026-10-18','13:16:30',1.00,26),
(87,'Z100 AH AMAZE',87,7700.000,10000.000,0.000,1.00,2,0.000,'2026-10-18','13:17:11',1.00,26),
(88,'Z135 AH AMAZE',88,8600.000,11000.000,0.000,1.00,2,0.000,'2026-10-18','13:17:59',1.00,26),
(89,'Z150 AH AMAZE',89,12200.000,13500.000,0.000,0.00,2,0.000,'2026-10-18','13:27:44',0.00,26),
(90,'Z150 AH AMAZE  5Y',90,12800.000,15500.000,0.000,2.00,2,0.000,'2026-10-18','13:29:49',2.00,26),
(91,'Z200 AH AMAZE 5Y',91,18700.000,22000.000,0.000,0.00,2,0.000,'2026-10-18','13:30:27',1.00,26),
(92,'Z700 W AMAZE',92,3900.000,4500.000,0.000,1.00,2,0.000,'2026-10-18','13:31:14',1.00,26),
(93,'Z875 W AMAZE',93,4700.000,5700.000,0.000,2.00,2,0.000,'2026-10-18','13:31:51',2.00,26),
(94,'Z1075 W AMAZE',94,5200.000,6200.000,0.000,1.00,2,0.000,'2026-10-18','13:32:24',1.00,26),
(95,'Z1275 W AMAZE',95,6200.000,7500.000,0.000,0.00,2,0.000,'2026-10-18','13:33:09',1.00,26),
(96,'Z7 AH UPS BATTERY',96,700.000,900.000,0.000,6.00,2,0.000,'2026-10-18','13:34:37',6.00,26),
(97,'Z14 AH UPS BATTERY',97,1400.000,1700.000,0.000,3.00,2,0.000,'2026-10-18','13:36:33',3.00,26),
(98,'Z4 AH POWER',98,750.000,1100.000,0.000,19.00,2,0.000,'2026-10-18','13:40:48',19.00,26),
(99,'Z5 AH 1 POWER',99,930.000,1300.000,0.000,15.00,2,0.000,'2026-10-18','13:41:41',15.00,26),
(100,'Z5 AH 2 POWER',100,960.000,1400.000,0.000,4.00,2,0.000,'2026-10-18','13:42:26',5.00,26),
(101,'Z2.5 AH POWER',101,620.000,900.000,0.000,0.00,2,0.000,'2026-10-18','13:43:38',0.00,26),
(102,'Z7 AH POWER',102,1070.000,1500.000,0.000,1.00,2,0.000,'2026-10-18','13:44:24',1.00,26),
(103,'Z80 AH V GURAD',103,8200.000,1000.000,0.000,1.00,2,0.000,'2026-10-18','13:45:14',1.00,26),
(104,'Z150 AH V GUARD',104,13300.000,15300.000,0.000,1.00,2,0.000,'2026-10-18','13:45:56',1.00,26),
(105,'Z400 W V GUARD',105,3400.000,4300.000,0.000,1.00,2,0.000,'2026-10-18','13:46:57',1.00,26),
(106,'Z750 W V GUARD',106,4200.000,5200.000,0.000,1.00,2,0.000,'2026-10-18','13:47:33',1.00,26),
(107,'Z1000 W V GUARD',107,5500.000,6500.000,0.000,1.00,2,0.000,'2026-10-18','13:48:21',1.00,26),
(108,'Z1100 W V GUARD',108,6300.000,7300.000,0.000,1.00,2,0.000,'2026-10-18','13:48:54',1.00,26),
(109,'Z1550 W V GUARD',109,7000.000,8400.000,0.000,1.00,2,0.000,'2026-10-18','13:49:34',1.00,26),
(110,'Z3 LIT V GUARD',110,2860.000,3300.000,0.000,1.00,2,0.000,'2026-10-18','13:51:03',1.00,26),
(111,'Z5 LIT V GUARD',111,3900.000,5500.000,0.000,1.00,2,0.000,'2026-10-18','13:51:34',1.00,26),
(112,'Z22 LIT USHA',112,5900.000,7000.000,0.000,1.00,2,0.000,'2026-10-18','14:43:08',1.00,26),
(113,'ZCHOROME',113,2200.000,3000.000,0.000,3.00,2,0.000,'2026-10-18','14:44:23',3.00,26),
(114,'ZSWIFT USHA',114,2050.000,2500.000,0.000,3.00,2,0.000,'2026-10-18','14:45:02',3.00,26),
(115,'Z600 SWIFT',115,1700.000,2200.000,0.000,2.00,2,0.000,'2026-10-18','14:45:40',2.00,26),
(116,'ZGRINDER 150',116,5000.000,5950.000,0.000,1.00,2,0.000,'2026-10-18','14:47:44',1.00,26),
(117,'Z1300 IRON',117,1250.000,1500.000,0.000,2.00,2,0.000,'2026-10-18','14:49:01',2.00,26),
(118,'Z1000 IRON',118,750.000,900.000,0.000,1.00,2,0.000,'2026-10-18','14:49:38',1.00,26),
(119,'Z1100 IRON',119,600.000,750.000,0.000,1.00,2,0.000,'2026-10-18','14:50:12',1.00,26),
(120,'ZGREEN CHEF',120,1550.000,1800.000,0.000,8.00,2,0.000,'2026-10-18','14:51:31',8.00,26),
(121,'ZV GUARD FAN 2Y',121,1500.000,1800.000,0.000,2.00,2,0.000,'2026-10-18','14:52:11',2.00,26),
(122,'ZTABLE FAN',122,2550.000,3000.000,0.000,1.00,2,0.000,'2026-10-18','14:53:05',1.00,26),
(123,'Z500 MIXI  V GUARD',123,2300.000,2800.000,0.000,2.00,2,0.000,'2026-10-18','14:53:38',2.00,26),
(124,'Z600 MIXI V GUARD',124,3700.000,4000.000,0.000,2.00,2,0.000,'2026-10-18','14:54:23',2.00,26),
(125,'Z2B STOVE',125,3100.000,3500.000,0.000,1.00,2,0.000,'2026-10-18','14:54:58',1.00,26),
(126,'Z3B STOVE',126,4200.000,4800.000,0.000,1.00,2,0.000,'2026-10-18','14:55:27',1.00,26),
(127,'Z10 KG',127,900.000,1800.000,0.000,6.00,2,0.000,'2026-10-18','14:56:34',6.00,26),
(128,'Z5 KG',128,1300.000,2500.000,0.000,0.00,2,0.000,'2026-10-18','14:57:32',0.00,26),
(129,'Z20 KG MINI',129,1200.000,2400.000,0.000,1.00,2,0.000,'2026-10-18','14:58:55',1.00,26),
(130,'Z20 KG MINI POLE',130,1300.000,2500.000,0.000,1.00,2,0.000,'2026-10-18','14:59:43',1.00,26),
(131,'Z30 KG TT',131,1600.000,3200.000,0.000,1.00,2,0.000,'2026-10-18','15:00:32',1.00,26),
(132,'Z50 KG 7\"',132,1300.000,2600.000,0.000,2.00,2,0.000,'2026-10-18','15:05:51',2.00,26),
(133,'Z50 KG 8\"',133,1400.000,2800.000,0.000,4.00,2,0.000,'2026-10-18','15:06:33',4.00,26),
(134,'Z50 KG 10\"',134,1750.000,3500.000,0.000,1.00,2,0.000,'2026-10-18','15:09:43',1.00,26),
(135,'Z100 KG  BLOCK',135,2350.000,3900.000,0.000,2.00,2,0.000,'2026-10-18','15:12:15',2.00,26),
(136,'Z50 KG SS 10\"',136,2050.000,3500.000,0.000,2.00,2,0.000,'2026-10-18','15:13:35',2.00,26),
(137,'Z100 KG 12\" SS',137,2350.000,4300.000,0.000,1.00,0,0.000,'2026-10-18','15:14:38',1.00,26),
(138,'Z200 KG 14\" SS',138,2700.000,4800.000,0.000,1.00,2,0.000,'2026-10-18','15:15:24',1.00,26),
(139,'Z150 KG 14\" BLOCK',139,2500.000,4500.000,0.000,1.00,2,0.000,'2026-10-18','15:17:32',1.00,26),
(140,'Z300 KG 16\" BLOCK',140,3300.000,5900.000,0.000,2.00,2,0.000,'2026-10-18','15:18:34',2.00,26),
(141,'ZEGELE',141,300.000,600.000,0.000,2.00,2,0.000,'2026-10-18','15:19:23',2.00,26),
(142,'Z20 KG ABS',142,2200.000,3800.000,0.000,1.00,2,0.000,'2026-10-18','15:19:56',1.00,26),
(143,'ZCHAINA PRC',143,2500.000,4500.000,0.000,1.00,2,0.000,'2026-10-18','15:20:30',1.00,26),
(144,'ZMEGA PHONE',144,450.000,600.000,0.000,1.00,2,0.000,'2026-10-18','15:21:00',1.00,26),
(145,'ZSEALING MACHINES',145,900.000,1500.000,0.000,2.00,2,0.000,'2026-10-18','15:21:29',2.00,26),
(146,'ZDOLPHINE',146,3600.000,8000.000,0.000,5.00,2,0.000,'2026-10-18','15:33:37',3.00,26),
(147,'ZMARS BULE',147,3900.000,10000.000,0.000,2.00,2,0.000,'2026-10-18','15:36:29',2.00,26),
(148,'ZMARS BLACK',148,4100.000,9000.000,0.000,0.00,2,0.000,'2026-10-18','15:37:13',0.00,26),
(149,'ZDOLPHIN METALIC',149,3800.000,9000.000,0.000,0.00,2,0.000,'2026-10-18','15:39:26',0.00,26),
(150,'ZAQUAGRAND OR FRESH  15 Lit',150,4500.000,12000.000,0.000,1.00,2,0.000,'2026-10-18','15:41:37',1.00,26),
(151,'ZLEXZON.     10 Lit',151,4200.000,11000.000,0.000,0.00,2,0.000,'2026-10-18','15:43:01',0.00,26),
(152,'ZAQUA JADE.               12 Lit',152,4700.000,12000.000,0.000,1.00,2,0.000,'2026-10-18','15:44:33',1.00,26),
(153,'ZAQUA XL.                   12 Lit',153,4900.000,13000.000,0.000,2.00,2,0.000,'2026-10-18','15:45:07',2.00,26),
(154,'ZAQUA 2090.             10 Lit',154,5000.000,13000.000,0.000,1.00,2,0.000,'2026-10-18','15:48:24',1.00,26),
(155,'ZAQUA NINE.             10 Lit',155,5100.000,14000.000,0.000,2.00,2,0.000,'2026-10-18','15:49:25',2.00,26),
(156,'ZAQUAGLORY OR FLIP.  13 Lit',156,4500.000,12000.000,0.000,1.00,2,0.000,'2026-10-18','15:50:56',1.00,26),
(157,'ZAQUA SONNET BLK          14 Lit',157,5100.000,14000.000,0.000,0.00,2,0.000,'2026-10-18','15:51:28',0.00,26),
(158,'ZAQUA SONNET BLUE  14 Lit',158,4800.000,13500.000,0.000,0.00,2,0.000,'2026-10-18','15:53:41',0.00,26),
(159,'ZAQUA ROMA.              12 Lit',159,5200.000,14000.000,0.000,1.00,2,0.000,'2026-10-18','15:54:57',1.00,26),
(160,'ZAQUA INNOVICA.        10 Lit',160,5100.000,16000.000,0.000,1.00,2,0.000,'2026-10-18','15:55:48',1.00,26),
(161,'ZAQUA 9090                         13 Lit',161,5000.000,13000.000,0.000,1.00,2,0.000,'2026-10-18','15:56:23',1.00,26),
(162,'ZAQUA FINEPURE                14 Lit',162,5500.000,16000.000,0.000,1.00,2,0.000,'2026-10-18','15:57:13',1.00,26),
(163,'ZAQUVA V5                 10 LIT',163,4800.000,12500.000,0.000,3.00,2,0.000,'2026-10-18','15:58:23',3.00,26),
(164,'ZHOT & COOL',164,8000.000,16000.000,0.000,1.00,2,0.000,'2026-10-18','15:59:01',1.00,26),
(165,'ZWOHALMENT',165,2800.000,5500.000,0.000,1.00,2,0.000,'2026-10-18','15:59:34',1.00,26),
(166,'ZERA',166,4800.000,13500.000,0.000,0.00,2,0.000,'2026-10-18','16:05:17',0.00,26),
(167,'ZAQUA HIFLO',167,4200.000,11500.000,0.000,1.00,2,0.000,'2026-10-18','16:05:56',1.00,26),
(168,'ZEXIDE 150 SOLAR 5Y',168,14950.000,18000.000,0.000,1.00,1,0.000,'2026-10-19','16:32:20',2.00,26),
(169,'Z2.5 AH EXIDE',169,780.000,950.000,0.000,0.00,0,0.000,'2026-10-21','14:49:54',0.00,26);

/*Table structure for table `prod_batch_updated` */

DROP TABLE IF EXISTS `prod_batch_updated`;

CREATE TABLE `prod_batch_updated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `cost` double(10,3) NOT NULL DEFAULT '0.000',
  `mrp` double(10,3) NOT NULL DEFAULT '0.000',
  `stock` decimal(10,2) NOT NULL,
  `disc_type` int DEFAULT '0' COMMENT '1=rs 2=%',
  `discount` double(10,3) DEFAULT '0.000',
  `date` date DEFAULT NULL,
  `time` time DEFAULT '00:00:00',
  `added_stock` decimal(10,2) NOT NULL,
  `uid` int NOT NULL DEFAULT '0',
  `updatedDate` date DEFAULT NULL,
  `updatedTime` time DEFAULT '00:00:00',
  `updatedUid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prod` (`product_id`),
  KEY `disc` (`disc_type`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `prod_batch_updated` */

insert  into `prod_batch_updated`(`id`,`name`,`product_id`,`cost`,`mrp`,`stock`,`disc_type`,`discount`,`date`,`time`,`added_stock`,`uid`,`updatedDate`,`updatedTime`,`updatedUid`) values 
(1,'Z4 AH',36,860.000,1300.000,31.00,2,0.000,NULL,'00:00:00',31.00,0,'2026-10-18','12:03:59',26),
(2,'Z5 AH 1',37,1040.000,1600.000,24.00,2,0.000,NULL,'00:00:00',24.00,0,'2026-10-18','12:04:13',26),
(3,'Z5 AH 2',38,1110.000,1750.000,12.00,2,0.000,NULL,'00:00:00',13.00,0,'2026-10-18','12:04:21',26),
(4,'Z7 AH',39,1120.000,1700.000,0.00,2,0.000,NULL,'00:00:00',0.00,0,'2026-10-18','12:04:29',26),
(5,'Z9 AH 1',40,1580.000,2300.000,3.00,2,0.000,NULL,'00:00:00',3.00,0,'2026-10-18','12:04:36',26),
(6,'Z9 AH 2',41,1630.000,2250.000,6.00,2,0.000,NULL,'00:00:00',6.00,0,'2026-10-18','12:04:43',26),
(7,'Z14 AH',42,2420.000,3000.000,1.00,2,0.000,NULL,'00:00:00',1.00,0,'2026-10-18','12:04:51',26),
(8,'ZAMAORN 4 AH',36,860.000,1300.000,31.00,2,0.000,NULL,'00:00:00',31.00,0,'2026-10-18','12:05:41',26),
(9,'Z4AH',1,930.000,1350.000,19.00,0,0.000,NULL,'00:00:00',0.00,0,'2026-10-18','12:57:03',26),
(10,'Z5 AH SF',81,1016.000,1500.000,10.00,2,0.000,NULL,'00:00:00',10.00,0,'2026-10-18','13:12:14',26),
(11,'ZMARS BULE',147,3900.000,9000.000,2.00,2,0.000,NULL,'00:00:00',2.00,0,'2026-10-18','15:37:34',26),
(12,'ZMARS BLACK',148,4100.000,10000.000,0.00,2,0.000,NULL,'00:00:00',0.00,0,'2026-10-18','15:37:43',26),
(13,'Z1000 W V GUARD',107,5500.000,6500.000,1.00,2,0.000,NULL,'00:00:00',1.00,0,'2026-10-18','16:08:55',26),
(14,'ZAMAORN 5 AH 1',37,1040.000,1600.000,24.00,2,0.000,NULL,'00:00:00',24.00,0,'2026-10-18','18:37:52',27),
(15,'Z5 AH 1 SF',81,1016.000,1500.000,10.00,2,0.000,NULL,'00:00:00',10.00,0,'2026-10-18','18:38:22',27),
(16,'Z5 AH 2 SF',82,930.000,1300.000,8.00,2,0.000,NULL,'00:00:00',8.00,0,'2026-10-18','18:38:39',27),
(17,'ZAMAORN 5 AH 2',38,1110.000,1750.000,12.00,2,0.000,NULL,'00:00:00',13.00,0,'2026-10-18','18:39:02',27),
(18,'ZAMAORN 4 AH',36,860.000,1300.000,31.00,2,0.000,NULL,'00:00:00',31.00,0,'2026-10-18','18:39:43',27),
(19,'ZAMAORN 14 AH',42,2420.000,3000.000,1.00,2,0.000,NULL,'00:00:00',1.00,0,'2026-10-18','18:39:57',27),
(20,'Z4 AH SF',80,830.000,1150.000,4.00,2,0.000,NULL,'00:00:00',4.00,0,'2026-10-18','18:40:14',27),
(21,'ZAMAORN 7 AH',39,1120.000,1700.000,0.00,2,0.000,NULL,'00:00:00',0.00,0,'2026-10-18','18:41:10',27),
(22,'ZAMAORN 9 AH 1',40,1580.000,2300.000,3.00,2,0.000,NULL,'00:00:00',3.00,0,'2026-10-18','18:41:28',27),
(23,'ZAMAORN 9 AH 2',41,1630.000,2250.000,6.00,2,0.000,NULL,'00:00:00',6.00,0,'2026-10-18','18:41:43',27),
(24,'Z50 KG SS',136,2050.000,3500.000,2.00,2,0.000,NULL,'00:00:00',2.00,0,'2026-10-18','18:45:12',27),
(25,'ZERA',166,4800.000,13500.000,0.00,2,0.000,NULL,'00:00:00',0.00,0,'2026-10-18','18:48:05',27),
(26,'ZHIFLO',167,4200.000,11500.000,1.00,2,0.000,NULL,'00:00:00',1.00,0,'2026-10-18','18:48:37',27),
(27,'ZDOLPHINE',146,3600.000,8000.000,5.00,2,0.000,NULL,'00:00:00',3.00,0,'2026-10-18','18:49:06',27),
(28,'ZDOLPHIN METALIC',149,3800.000,9000.000,0.00,2,0.000,NULL,'00:00:00',0.00,0,'2026-10-18','18:49:11',27);

/*Table structure for table `prod_batch_zero_stock_bill` */

DROP TABLE IF EXISTS `prod_batch_zero_stock_bill`;

CREATE TABLE `prod_batch_zero_stock_bill` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT '00:00:00',
  `uid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `batch` (`batch_id`),
  KEY `prod` (`product_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prod_batch_zero_stock_bill` */

/*Table structure for table `prod_bill` */

DROP TABLE IF EXISTS `prod_bill`;

CREATE TABLE `prod_bill` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bill_display` varchar(255) NOT NULL,
  `is_tax_bill` tinyint(1) DEFAULT '1',
  `is_receipt` int DEFAULT '1',
  `total` double(10,3) DEFAULT '0.000',
  `prodDisc` double(10,3) DEFAULT '0.000',
  `extraDisc` double(10,3) DEFAULT '0.000',
  `payable` double(10,3) DEFAULT '0.000',
  `paid` double(10,3) DEFAULT '0.000',
  `balance` double(10,3) DEFAULT '0.000',
  `currentBalance` double(10,3) DEFAULT '0.000',
  `is_balance` int DEFAULT '0',
  `paymentMode` int NOT NULL COMMENT 'prod_bill_payment_mode',
  `paymentType` int DEFAULT '0' COMMENT 'prod_bill_payment_type',
  `uid` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL DEFAULT '00:00:00',
  `is_cancelled` int DEFAULT '0',
  `bill_type` int DEFAULT '1' COMMENT '1=prod bill',
  `cusName` varchar(255) DEFAULT '""',
  `cusPhn` varchar(255) DEFAULT '-',
  `customerId` int DEFAULT NULL,
  `price_category` int NOT NULL,
  `lr_no` varchar(255) DEFAULT NULL,
  `lr_date` date DEFAULT NULL,
  `lr_name` varchar(255) DEFAULT NULL,
  `attender_id` int DEFAULT NULL,
  `exchPoint` double(10,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mode` (`paymentMode`),
  KEY `type` (`paymentType`),
  KEY `idx_is_tax_bill` (`is_tax_bill`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `prod_bill` */

insert  into `prod_bill`(`id`,`bill_display`,`is_tax_bill`,`is_receipt`,`total`,`prodDisc`,`extraDisc`,`payable`,`paid`,`balance`,`currentBalance`,`is_balance`,`paymentMode`,`paymentType`,`uid`,`date`,`time`,`is_cancelled`,`bill_type`,`cusName`,`cusPhn`,`customerId`,`price_category`,`lr_no`,`lr_date`,`lr_name`,`attender_id`,`exchPoint`) values 
(1,'1',0,1,1750.000,525.000,0.000,1225.000,1225.000,0.000,0.000,0,2,1,26,'2026-10-18','11:13:37',1,1,'ARUN WORK SHOP','9999999999',1,3,NULL,NULL,NULL,NULL,0.000),
(2,'2',0,1,5250.000,262.500,0.000,4987.500,3000.500,1987.000,1987.000,1,1,1,26,'2026-10-18','13:24:05',0,1,'M. EASAKKI','9787451226',2,3,NULL,NULL,NULL,NULL,0.000),
(3,'3',0,1,3100.000,850.000,0.000,2250.000,2250.000,0.000,0.000,0,1,1,26,'2026-10-19','16:19:52',0,1,'ALAGU POWER','9487359810',3,3,NULL,NULL,NULL,NULL,0.000),
(4,'4',0,1,1300.000,100.000,0.000,1200.000,1200.000,0.000,0.000,0,2,1,26,'2026-10-19','16:21:14',0,1,'CHINNADURAI','9787015082',4,3,NULL,NULL,NULL,NULL,0.000),
(5,'26-1',0,1,18000.000,500.000,0.000,17500.000,17500.000,0.000,0.000,0,2,1,26,'2026-10-19','16:34:53',0,1,'MANTHIRAM','9942442653',5,3,NULL,NULL,NULL,NULL,0.000),
(6,'6',0,1,1500.000,0.000,0.000,1500.000,1500.000,0.000,0.000,0,1,1,26,'2026-10-19','20:35:18',0,1,'JEYAKARAN','7598074864',6,3,NULL,NULL,NULL,NULL,0.000),
(7,'7',0,1,1300.000,100.000,0.000,1200.000,0.000,1200.000,1200.000,1,1,1,26,'2026-10-20','11:48:12',0,1,'PALRAJ','7200400274',7,3,NULL,NULL,NULL,NULL,0.000),
(8,'8',0,1,1300.000,0.000,0.000,1300.000,1300.000,0.000,0.000,0,1,1,26,'2026-10-20','15:06:00',0,1,'UMA STORE PAYYAN','-',8,3,NULL,NULL,NULL,NULL,0.000),
(9,'26-1',1,1,1400.000,300.000,0.000,1100.000,1100.000,0.000,0.000,0,1,1,26,'2026-10-20','18:42:35',0,1,'BALA WORK SHOP','9688660763',9,3,NULL,NULL,NULL,NULL,0.000),
(10,'26-2',0,1,1680.000,80.000,0.000,1600.000,1600.000,0.000,0.000,0,1,1,26,'2026-10-20','19:02:28',0,1,'VIJAYAKUMAR','9158170631',10,3,NULL,NULL,NULL,NULL,0.000),
(11,'26-3',0,1,1600.000,200.000,0.000,1400.000,0.000,1400.000,1400.000,1,1,1,26,'2026-10-21','10:57:36',1,1,'KANNAN','6382068094',11,3,NULL,NULL,NULL,NULL,0.000),
(12,'26-4',0,1,6900.000,1300.000,0.000,5600.000,5600.000,0.000,0.000,0,2,1,26,'2026-10-21','11:32:58',1,1,'SUDALAIESWAR','9345449484',12,3,NULL,NULL,NULL,NULL,0.000),
(13,'26-2',1,1,2250.000,200.000,0.000,2050.000,2050.000,0.000,0.000,0,2,1,26,'2026-10-21','15:14:02',0,1,'MAHARAJA','8148352700',13,3,NULL,NULL,NULL,NULL,0.000),
(14,'12',0,1,1300.000,300.000,0.000,1000.000,1000.000,0.000,0.000,0,1,1,26,'2026-10-21','15:33:54',0,1,'ASIR WORK SHOP','8248934748',14,3,NULL,NULL,NULL,NULL,0.000),
(15,'26-3',1,1,31000.000,0.000,0.000,31000.000,31000.000,0.000,0.000,0,1,1,26,'2026-10-21','16:26:38',1,1,'JEYAKUMAR','9884997012',15,3,NULL,NULL,NULL,NULL,0.000),
(16,'26-4',1,1,31000.000,0.000,0.000,31000.000,31000.000,0.000,0.000,0,1,1,26,'2026-10-21','16:50:42',1,1,'JEYAKUMAR','9884997012',15,3,NULL,NULL,NULL,NULL,0.000),
(17,'13',0,1,30500.000,0.000,0.000,30500.000,25000.000,5500.000,5500.000,1,1,1,26,'2026-10-21','16:53:08',0,1,'JEYAKUMAR','9884997012',15,3,NULL,NULL,NULL,NULL,0.000);

/*Table structure for table `prod_bill_cancel` */

DROP TABLE IF EXISTS `prod_bill_cancel`;

CREATE TABLE `prod_bill_cancel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `reason` text,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billId` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `prod_bill_cancel` */

insert  into `prod_bill_cancel`(`id`,`bill_id`,`reason`,`date`,`time`,`uid`) values 
(1,1,'DUMMY','2026-10-19','17:00:31',26),
(2,11,'DOUBLE','2026-10-21','16:49:21',26),
(3,15,'WORNG BILL','2026-10-21','16:50:03',26),
(4,12,'WORNG','2026-10-21','16:51:50',26),
(5,16,'WORNG','2026-10-21','16:52:37',26);

/*Table structure for table `prod_bill_datechange` */

DROP TABLE IF EXISTS `prod_bill_datechange`;

CREATE TABLE `prod_bill_datechange` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `billId` int NOT NULL,
  `oldDate` date DEFAULT NULL,
  `changeDate` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `billId` (`billId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prod_bill_datechange` */

/*Table structure for table `prod_bill_details` */

DROP TABLE IF EXISTS `prod_bill_details`;

CREATE TABLE `prod_bill_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `price` double(10,3) DEFAULT '0.000',
  `disc` double(10,3) DEFAULT '0.000',
  `total` double(10,3) DEFAULT '0.000',
  `cost` double(10,3) DEFAULT '0.000',
  `commission` double(10,3) DEFAULT '0.000',
  `gst` int NOT NULL DEFAULT '0',
  `is_cancelled` int DEFAULT '0',
  `cancel_date` datetime DEFAULT NULL,
  `is_exchanged` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bill` (`bill_id`),
  KEY `prod` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `prod_bill_details` */

insert  into `prod_bill_details`(`id`,`bill_id`,`prod_id`,`qty`,`price`,`disc`,`total`,`cost`,`commission`,`gst`,`is_cancelled`,`cancel_date`,`is_exchanged`) values 
(1,1,38,1.00,1750.000,525.000,1225.000,1110.000,0.000,0,0,NULL,0),
(2,2,48,1.00,5250.000,262.500,4987.500,4400.000,0.000,0,0,NULL,0),
(3,3,1,1.00,1350.000,350.000,1000.000,930.000,0.000,0,0,NULL,0),
(4,3,3,1.00,1750.000,500.000,1250.000,1210.000,0.000,0,0,NULL,0),
(5,4,36,1.00,1300.000,100.000,1200.000,860.000,0.000,0,0,NULL,0),
(8,6,81,1.00,1500.000,0.000,1500.000,1016.000,0.000,0,0,NULL,0),
(9,7,36,1.00,1300.000,100.000,1200.000,860.000,0.000,0,0,NULL,0),
(10,8,36,1.00,1300.000,0.000,1300.000,860.000,0.000,0,0,NULL,0),
(11,9,100,1.00,1400.000,300.000,1100.000,960.000,0.000,0,0,NULL,0),
(16,11,2,1.00,1600.000,200.000,1400.000,1100.000,0.000,0,0,NULL,0),
(17,5,168,1.00,18000.000,500.000,17500.000,14950.000,0.000,0,0,NULL,0),
(18,10,4,1.00,1680.000,80.000,1600.000,1310.000,0.000,0,0,NULL,0),
(19,12,52,1.00,6900.000,1300.000,5600.000,5450.000,0.000,0,0,NULL,0),
(20,13,41,1.00,2250.000,200.000,2050.000,1630.000,0.000,0,0,NULL,0),
(21,14,36,1.00,1300.000,300.000,1000.000,860.000,0.000,0,0,NULL,0),
(24,15,91,1.00,23000.000,0.000,23000.000,18700.000,0.000,0,0,NULL,0),
(25,15,95,1.00,8000.000,0.000,8000.000,6200.000,0.000,0,0,NULL,0),
(26,16,91,1.00,23000.000,0.000,23000.000,18700.000,0.000,0,0,NULL,0),
(27,16,95,1.00,8000.000,0.000,8000.000,6200.000,0.000,0,0,NULL,0),
(30,17,91,1.00,22750.000,0.000,22750.000,18700.000,0.000,0,0,NULL,0),
(31,17,95,1.00,7750.000,0.000,7750.000,6200.000,0.000,0,0,NULL,0);

/*Table structure for table `prod_bill_due` */

DROP TABLE IF EXISTS `prod_bill_due`;

CREATE TABLE `prod_bill_due` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `amount` double(10,3) NOT NULL DEFAULT '0.000',
  `cash_paid` double(10,3) NOT NULL DEFAULT '0.000',
  `bank_paid` double(10,3) NOT NULL DEFAULT '0.000',
  `balance` double(10,3) NOT NULL DEFAULT '0.000',
  `pay_mode` tinyint NOT NULL DEFAULT '1',
  `pay_type` tinyint NOT NULL DEFAULT '0',
  `txn_type` varchar(20) NOT NULL DEFAULT 'COLLECTION',
  `notes` varchar(255) DEFAULT NULL,
  `uid` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_bill_due` */

insert  into `prod_bill_due`(`id`,`customer_id`,`amount`,`cash_paid`,`bank_paid`,`balance`,`pay_mode`,`pay_type`,`txn_type`,`notes`,`uid`,`date`,`time`) values 
(1,2,987.000,987.000,0.000,1000.000,1,1,'COLLECTION',NULL,26,'2026-10-18','13:25:51'),
(2,2,1000.000,1000.000,0.000,0.000,1,1,'COLLECTION',NULL,26,'2026-10-19','12:36:11');

/*Table structure for table `prod_bill_due_collection` */

DROP TABLE IF EXISTS `prod_bill_due_collection`;

CREATE TABLE `prod_bill_due_collection` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `balance` double(10,2) DEFAULT NULL,
  `paid` double(10,2) DEFAULT NULL,
  `finalBalance` double(10,2) DEFAULT NULL,
  `mode` int DEFAULT NULL,
  `bankOption` int DEFAULT NULL,
  `uid` int NOT NULL,
  `collectDate` varchar(255) DEFAULT NULL,
  `collectTime` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billId` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prod_bill_due_collection` */

/*Table structure for table `prod_bill_edit_log` */

DROP TABLE IF EXISTS `prod_bill_edit_log`;

CREATE TABLE `prod_bill_edit_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bill_id` bigint DEFAULT NULL,
  `bill_display` varchar(64) DEFAULT NULL,
  `action` varchar(32) NOT NULL,
  `details` text,
  `uid` bigint DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_edit_log_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_bill_edit_log` */

insert  into `prod_bill_edit_log`(`id`,`bill_id`,`bill_display`,`action`,`details`,`uid`,`date`,`time`) values 
(1,1,'26-1','EDIT','Payable 200.00 → 400.00. Cash 200.00 → 400.00. Bank 0.00 → 0.00. Extra disc 0.00 → 0.00. Items before: 1 x1.00 @200.00. Items after: 1 x1.00 @200.00, 1 x1.00 @200.00',1,'2026-09-10','12:15:24'),
(2,1,'26-1','CANCEL','Cancelled. Reason: sum',1,'2026-09-10','12:16:38'),
(3,2,'26-2','EDIT','Payable 200.00 → 200.00. Cash 200.00 → 100.00. Bank 0.00 → 0.00. Extra disc 0.00 → 0.00. Items before: 1 x1.00 @200.00. Items after: 1 x1.00 @200.00',1,'2026-09-10','12:20:18'),
(4,2,'26-2','EDIT','Payable 200.00 → 400.00. Cash 100.00 → 200.00. Bank 0.00 → 0.00. Extra disc 0.00 → 0.00. Items before: 1 x1.00 @200.00. Items after: 1 x1.00 @200.00, 1 x1.00 @200.00',1,'2026-09-10','12:21:03'),
(5,5,'26-1','EDIT','Payable 17500.00 → 17500.00. Cash 0.00 → 0.00. Bank 17500.00 → 17500.00. Extra disc 0.00 → 0.00. Items before: EXIDE 150 SOLAR 5Y x1.00 @18000.00. Items after: 168 x1.00 @18000.00',26,'2026-10-19','16:43:05'),
(6,1,'1','CANCEL','Cancelled. Reason: DUMMY',26,'2026-10-19','17:00:31'),
(7,10,'26-2','EDIT','Payable 1600.00 → 1600.00. Cash 1600.00 → 1600.00. Bank 0.00 → 0.00. Extra disc 0.00 → 0.00. Items before: 7AH 2 x1.00 @1780.00. Items after: 4 x1.00 @1680.00',26,'2026-10-21','13:22:47'),
(8,11,'26-3','EDIT','Payable 1400.00 → 1400.00. Cash 0.00 → 0.00. Bank 0.00 → 0.00. Extra disc 0.00 → 0.00. Items before: 5 AH 1 x1.00 @1600.00. Items after: 2 x1.00 @1600.00',26,'2026-10-21','13:24:23'),
(9,5,'26-1','EDIT','Payable 17500.00 → 17500.00. Cash 0.00 → 0.00. Bank 17500.00 → 17500.00. Extra disc 0.00 → 0.00. Items before: EXIDE 150 SOLAR 5Y x1.00 @18000.00. Items after: 168 x1.00 @18000.00',26,'2026-10-21','13:24:43'),
(10,10,'26-2','EDIT','Payable 1600.00 → 1600.00. Cash 1600.00 → 1600.00. Bank 0.00 → 0.00. Extra disc 0.00 → 0.00. Items before: 7 AH 1 x1.00 @1680.00. Items after: 4 x1.00 @1680.00',26,'2026-10-21','13:24:55'),
(11,12,'26-4','EDIT','Payable 5600.00 → 5600.00. Cash 0.00 → 0.00. Bank 5600.00 → 5600.00. Extra disc 0.00 → 0.00. Items before: DIN 45 x1.00 @6900.00. Items after: 52 x1.00 @6900.00',26,'2026-10-21','13:25:19'),
(12,11,'26-3','CANCEL','Cancelled. Reason: DOUBLE',26,'2026-10-21','16:49:21'),
(13,15,'26-3','EDIT','Payable 31000.00 → 31000.00. Cash 31000.00 → 31000.00. Bank 0.00 → 0.00. Extra disc 0.00 → 0.00. Items before: 200 AH AMAZE 5Y x1.00 @23000.00, 1275 W AMAZE x1.00 @8000.00. Items after: 91 x1.00 @23000.00, 95 x1.00 @8000.00',26,'2026-10-21','16:49:42'),
(14,15,'26-3','CANCEL','Cancelled. Reason: WORNG BILL',26,'2026-10-21','16:50:03'),
(15,12,'26-4','CANCEL','Cancelled. Reason: WORNG',26,'2026-10-21','16:51:50'),
(16,16,'26-4','CANCEL','Cancelled. Reason: WORNG',26,'2026-10-21','16:52:37'),
(17,17,'13','EDIT','Payable 31000.00 → 30500.00. Cash 31000.00 → 25000.00. Bank 0.00 → 0.00. Extra disc 0.00 → 0.00. Items before: 200 AH AMAZE 5Y x1.00 @23000.00, 1275 W AMAZE x1.00 @8000.00. Items after: 91 x1.00 @22750.00, 95 x1.00 @7750.00',26,'2026-10-21','17:05:41');

/*Table structure for table `prod_bill_payment` */

DROP TABLE IF EXISTS `prod_bill_payment`;

CREATE TABLE `prod_bill_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `cash` double(10,2) DEFAULT '0.00',
  `bank` double(10,2) DEFAULT '0.00',
  `paymentType` int DEFAULT '0' COMMENT 'prod_bill_payment_type',
  PRIMARY KEY (`id`),
  KEY `billid` (`bill_id`),
  KEY `paymentType` (`paymentType`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `prod_bill_payment` */

insert  into `prod_bill_payment`(`id`,`bill_id`,`cash`,`bank`,`paymentType`) values 
(1,1,0.00,1225.00,1),
(2,2,3000.50,0.00,1),
(3,3,2250.00,0.00,1),
(4,4,0.00,1200.00,1),
(5,5,0.00,17500.00,1),
(6,6,1500.00,0.00,1),
(7,7,0.00,0.00,1),
(8,8,1300.00,0.00,1),
(9,9,1100.00,0.00,1),
(10,10,1600.00,0.00,1),
(11,11,0.00,0.00,1),
(12,12,0.00,5600.00,1),
(13,13,0.00,2050.00,1),
(14,14,1000.00,0.00,1),
(15,15,31000.00,0.00,1),
(16,16,31000.00,0.00,1),
(17,17,25000.00,0.00,1);

/*Table structure for table `prod_bill_payment_mode` */

DROP TABLE IF EXISTS `prod_bill_payment_mode`;

CREATE TABLE `prod_bill_payment_mode` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mode` varchar(255) NOT NULL,
  `is_active` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `prod_bill_payment_mode` */

insert  into `prod_bill_payment_mode`(`id`,`mode`,`is_active`) values 
(1,'cash',1),
(2,'bank',1),
(3,'mixed',1);

/*Table structure for table `prod_bill_payment_type` */

DROP TABLE IF EXISTS `prod_bill_payment_type`;

CREATE TABLE `prod_bill_payment_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `is_active` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `prod_bill_payment_type` */

insert  into `prod_bill_payment_type`(`id`,`type`,`is_active`) values 
(0,'CASH',1),
(1,'UPI',1),
(2,'DEBIT CARD',1),
(3,'CREDIT CARD',1),
(4,'NET BANKING',1),
(5,'WALLET',1),
(6,'CHEQUE',1);

/*Table structure for table `prod_bill_payment_type_change` */

DROP TABLE IF EXISTS `prod_bill_payment_type_change`;

CREATE TABLE `prod_bill_payment_type_change` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `old_cash_amount` double(10,3) DEFAULT NULL,
  `cash_amount` double(10,3) DEFAULT NULL,
  `old_bank_amount` double(10,3) DEFAULT NULL,
  `bank_amount` double(10,3) DEFAULT NULL,
  `bank_mode` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_bill_payment_type_change` */

/*Table structure for table `prod_brands` */

DROP TABLE IF EXISTS `prod_brands`;

CREATE TABLE `prod_brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `is_active` int DEFAULT '1',
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `prod_brands` */

insert  into `prod_brands`(`id`,`name`,`date`,`time`,`is_active`) values 
(1,'Others','2026-10-17','12:27:55',1),
(2,'EXIDE','2026-10-17','14:11:35',1),
(3,'AMAORN','2026-10-17','14:11:42',1),
(4,'LUMINOUS','2026-10-17','14:12:00',1),
(5,'AMAZE','2026-10-17','14:12:04',1),
(6,'V GUARD','2026-10-17','14:12:09',1),
(7,'BOSCH','2026-10-18','12:55:24',1),
(8,'MICROTEK','2026-10-18','12:59:11',1),
(9,'SF','2026-10-18','13:06:16',1),
(10,'EASTMAN','2026-10-18','13:15:18',1),
(11,'RELICELL','2026-10-18','13:33:33',1),
(12,'POWERZONE','2026-10-18','13:39:57',1),
(13,'USHA','2026-10-18','13:52:03',1),
(14,'AQUA','2026-10-18','15:22:05',1);

/*Table structure for table `prod_category` */

DROP TABLE IF EXISTS `prod_category`;

CREATE TABLE `prod_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `is_active` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `prod_category` */

insert  into `prod_category`(`id`,`name`,`date`,`time`,`is_active`) values 
(1,'BATTERY','2026-10-17','14:10:09',1),
(2,'WATER PURIFIER','2026-10-17','14:10:26',1),
(3,'INVETER','2026-10-17','14:10:37',1),
(4,'SCALE','2026-10-17','14:10:43',1),
(5,'SPARE','2026-10-17','14:10:53',1),
(6,'WATER HETER','2026-10-18','13:50:01',1),
(7,'FAN & GRIENDER','2026-10-18','13:51:53',1);

/*Table structure for table `prod_cheque_allocation` */

DROP TABLE IF EXISTS `prod_cheque_allocation`;

CREATE TABLE `prod_cheque_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cheque_id` int NOT NULL,
  `bill_id` int NOT NULL,
  `allocated_amount` double NOT NULL,
  `allocated_date` date DEFAULT NULL,
  `allocated_time` time DEFAULT NULL,
  `due_date` date NOT NULL,
  `credit_days` int DEFAULT '10',
  `status` enum('ALLOCATED','CLEARED','REVERSED','BOUNCED') DEFAULT 'ALLOCATED',
  `cleared_date` date DEFAULT NULL,
  `cleared_time` time DEFAULT NULL,
  `reversed_date` date DEFAULT NULL,
  `reversed_time` time DEFAULT NULL,
  `reversed_by` int DEFAULT NULL,
  `is_reversed` tinyint DEFAULT '0',
  `uid` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `idx_cheque` (`cheque_id`),
  KEY `idx_bill` (`bill_id`),
  KEY `idx_status` (`status`),
  KEY `idx_due_date` (`due_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_cheque_allocation` */

/*Table structure for table `prod_cheque_events` */

DROP TABLE IF EXISTS `prod_cheque_events`;

CREATE TABLE `prod_cheque_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cheque_id` int NOT NULL,
  `event_type` enum('BOUNCE','EXPIRY','MANUAL_CLEAR') NOT NULL,
  `event_date` date DEFAULT NULL,
  `event_time` time DEFAULT NULL,
  `reason` text,
  `uid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cheque` (`cheque_id`),
  KEY `idx_event_type` (`event_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_cheque_events` */

/*Table structure for table `prod_cheque_stock` */

DROP TABLE IF EXISTS `prod_cheque_stock`;

CREATE TABLE `prod_cheque_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `cheque_number` varchar(50) NOT NULL,
  `bank_name` text,
  `status` enum('AVAILABLE','PARTIAL','FULLY_USED','CLEARED','BOUNCED','EXPIRED') DEFAULT 'AVAILABLE',
  `entry_date` date DEFAULT NULL,
  `entry_time` time DEFAULT NULL,
  `uid` int NOT NULL,
  `notes` text,
  `is_active` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_customer` (`customer_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_cheque_stock` */

/*Table structure for table `prod_ledger` */

DROP TABLE IF EXISTS `prod_ledger`;

CREATE TABLE `prod_ledger` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bill_type` int NOT NULL COMMENT 'FK logical: bill_type.id',
  `bill_id` int NOT NULL DEFAULT '0' COMMENT 'Source row id e.g. prod_bill.id',
  `customer_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `payment_mode` tinyint NOT NULL DEFAULT '1' COMMENT '1=Cash 2=Bank 3=Mixed',
  `bill_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `cash_paid` decimal(12,2) NOT NULL DEFAULT '0.00',
  `bank_paid` decimal(12,2) NOT NULL DEFAULT '0.00',
  `payment_type` tinyint NOT NULL DEFAULT '0' COMMENT 'UPI, card, etc. from configure_payment_type',
  `uid` int NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_bill_type_id` (`bill_type`,`bill_id`),
  KEY `idx_customer` (`customer_id`),
  KEY `idx_supplier` (`supplier_id`),
  KEY `idx_date_time` (`date_time`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_ledger` */

insert  into `prod_ledger`(`id`,`bill_type`,`bill_id`,`customer_id`,`supplier_id`,`payment_mode`,`bill_amount`,`cash_paid`,`bank_paid`,`payment_type`,`uid`,`date_time`) values 
(1,5,1,NULL,1,1,10974.00,0.00,0.00,1,26,'2026-10-17 14:21:05'),
(2,5,2,NULL,1,1,12980.00,0.00,0.00,1,26,'2026-10-17 20:37:39'),
(3,1,1,1,NULL,2,1225.00,0.00,1225.00,1,26,'2026-10-18 11:13:37'),
(4,1,2,2,NULL,1,4987.50,3000.50,0.00,1,26,'2026-10-18 13:24:05'),
(5,2,1,2,NULL,1,987.00,987.00,0.00,1,26,'2026-10-18 13:25:51'),
(6,2,2,2,NULL,1,1000.00,1000.00,0.00,1,26,'2026-10-19 12:36:11'),
(7,1,3,3,NULL,1,2250.00,2250.00,0.00,1,26,'2026-10-19 16:19:52'),
(8,1,4,4,NULL,2,1200.00,0.00,1200.00,1,26,'2026-10-19 16:21:14'),
(9,1,5,5,NULL,2,17500.00,0.00,17500.00,1,26,'2026-10-19 16:34:53'),
(10,1,6,6,NULL,1,1500.00,1500.00,0.00,1,26,'2026-10-19 20:35:18'),
(11,1,7,7,NULL,1,1200.00,0.00,0.00,1,26,'2026-10-20 11:48:12'),
(12,1,8,8,NULL,1,1300.00,1300.00,0.00,1,26,'2026-10-20 15:06:00'),
(13,1,9,9,NULL,1,1100.00,1100.00,0.00,1,26,'2026-10-20 18:42:35'),
(14,1,10,10,NULL,1,1600.00,1600.00,0.00,1,26,'2026-10-20 19:02:28'),
(15,1,11,11,NULL,1,1400.00,0.00,0.00,1,26,'2026-10-21 10:57:36'),
(16,1,12,12,NULL,2,5600.00,0.00,5600.00,1,26,'2026-10-21 11:32:58'),
(17,5,3,NULL,8,1,4480.00,4480.00,0.00,0,26,'2026-10-21 13:20:51'),
(18,1,13,13,NULL,2,2050.00,0.00,2050.00,1,26,'2026-10-21 15:14:02'),
(19,1,14,14,NULL,1,1000.00,1000.00,0.00,1,26,'2026-10-21 15:33:54'),
(20,1,15,15,NULL,1,31000.00,31000.00,0.00,1,26,'2026-10-21 16:26:38'),
(21,1,16,15,NULL,1,31000.00,31000.00,0.00,1,26,'2026-10-21 16:50:42'),
(22,1,17,15,NULL,1,30500.00,25000.00,0.00,1,26,'2026-10-21 16:53:08');

/*Table structure for table `prod_lifecycle` */

DROP TABLE IF EXISTS `prod_lifecycle`;

CREATE TABLE `prod_lifecycle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL DEFAULT '0',
  `batch_id` int NOT NULL,
  `product_id` int NOT NULL,
  `stock_in` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock_out` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock_now` decimal(10,2) NOT NULL,
  `is_zero_stock_bill` int DEFAULT '0',
  `notes` text,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `uid` int NOT NULL,
  `stock_type` int DEFAULT '1' COMMENT '1=stock 2=noStock',
  `stockAdjType` int DEFAULT '0' COMMENT '1=add 2=remove',
  PRIMARY KEY (`id`),
  KEY `batch` (`batch_id`),
  KEY `prod` (`product_id`),
  KEY `uid` (`uid`),
  KEY `stock` (`stockAdjType`),
  KEY `billId` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=latin1;

/*Data for the table `prod_lifecycle` */

insert  into `prod_lifecycle`(`id`,`bill_id`,`batch_id`,`product_id`,`stock_in`,`stock_out`,`stock_now`,`is_zero_stock_bill`,`notes`,`date`,`time`,`uid`,`stock_type`,`stockAdjType`) values 
(1,0,1,1,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-17','14:13:14',26,1,0),
(2,0,1,1,10.00,0.00,10.00,2,'While Stock Added Through Purchase Entry','2026-10-17','14:21:05',26,2,0),
(3,0,1,1,9.00,0.00,19.00,0,'Adding Stock - OLD STOCK','2026-10-17','14:22:02',26,1,1),
(4,0,2,2,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-17','19:53:31',26,1,0),
(5,0,3,3,10.00,0.00,10.00,0,'WHILE ADD PRODUCT','2026-10-17','20:17:18',26,1,0),
(6,0,4,4,3.00,0.00,3.00,0,'WHILE ADD PRODUCT','2026-10-17','20:22:18',26,1,0),
(7,0,5,5,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-17','20:23:08',26,1,0),
(8,0,6,6,3.00,0.00,3.00,0,'WHILE ADD PRODUCT','2026-10-17','20:24:40',26,1,0),
(9,0,7,7,3.00,0.00,3.00,0,'WHILE ADD PRODUCT','2026-10-17','20:29:47',26,1,0),
(10,0,1,2,10.00,0.00,10.00,2,'While Stock Added Through Purchase Entry','2026-10-17','20:37:39',26,2,0),
(11,0,8,8,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','09:41:41',26,1,0),
(12,0,9,9,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','09:42:36',26,1,0),
(13,0,10,10,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','09:43:28',26,1,0),
(14,0,11,11,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','09:44:11',26,1,0),
(15,0,12,12,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','09:44:47',26,1,0),
(16,0,13,13,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','09:45:25',26,1,0),
(17,0,14,14,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','09:46:15',26,1,0),
(18,0,15,15,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','09:47:09',26,1,0),
(19,0,16,16,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','09:47:55',26,1,0),
(20,0,17,17,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','09:48:28',26,1,0),
(21,0,18,18,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','09:50:10',26,1,0),
(22,0,19,19,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','09:51:05',26,1,0),
(23,0,20,20,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','09:51:40',26,1,0),
(24,0,21,21,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','09:52:19',26,1,0),
(25,0,22,22,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','10:03:02',26,1,0),
(26,0,23,23,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','10:03:46',26,1,0),
(27,0,24,24,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','10:04:24',26,1,0),
(28,0,25,25,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','10:08:48',26,1,0),
(29,0,26,26,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','10:13:56',26,1,0),
(30,0,27,27,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','10:14:42',26,1,0),
(31,0,28,28,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','10:17:46',26,1,0),
(32,0,29,29,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','10:18:22',26,1,0),
(33,0,30,30,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','10:19:12',26,1,0),
(34,0,31,31,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','10:19:41',26,1,0),
(35,0,32,32,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','10:20:09',26,1,0),
(36,0,33,33,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','10:20:41',26,1,0),
(37,0,34,34,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','10:21:24',26,1,0),
(38,0,35,35,4.00,0.00,4.00,0,'WHILE ADD PRODUCT','2026-10-18','10:22:52',26,1,0),
(39,0,36,36,31.00,0.00,31.00,0,'WHILE ADD PRODUCT','2026-10-18','10:23:29',26,1,0),
(40,0,37,37,24.00,0.00,24.00,0,'WHILE ADD PRODUCT','2026-10-18','10:24:06',26,1,0),
(41,0,38,38,13.00,0.00,13.00,0,'WHILE ADD PRODUCT','2026-10-18','10:24:54',26,1,0),
(42,0,39,39,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','10:25:37',26,1,0),
(43,0,40,40,3.00,0.00,3.00,0,'WHILE ADD PRODUCT','2026-10-18','10:26:25',26,1,0),
(44,0,41,41,6.00,0.00,6.00,0,'WHILE ADD PRODUCT','2026-10-18','10:26:58',26,1,0),
(45,0,42,42,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','10:27:58',26,1,0),
(46,1,38,38,0.00,1.00,12.00,0,'WHILE BILLING','2026-10-18','11:13:37',26,1,0),
(47,0,43,43,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:07:35',26,1,0),
(48,0,44,44,3.00,0.00,3.00,0,'WHILE ADD PRODUCT','2026-10-18','12:12:20',26,1,0),
(49,0,45,45,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:13:10',26,1,0),
(50,0,46,46,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:13:54',26,1,0),
(51,0,47,47,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:14:54',26,1,0),
(52,0,48,48,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:15:45',26,1,0),
(53,0,49,49,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:17:04',26,1,0),
(54,0,50,50,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:18:10',26,1,0),
(55,0,51,51,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:19:05',26,1,0),
(56,0,52,52,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:20:55',26,1,0),
(57,0,53,53,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:21:43',26,1,0),
(58,0,54,54,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:22:45',26,1,0),
(59,0,55,55,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:36:35',26,1,0),
(60,0,56,56,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:37:08',26,1,0),
(61,0,57,57,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:37:44',26,1,0),
(62,0,58,58,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:38:25',26,1,0),
(63,0,59,59,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:38:56',26,1,0),
(64,0,60,60,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:39:37',26,1,0),
(65,0,60,60,0.00,1.00,0.00,0,'Removing Stock - OLD STOCK','2026-10-18','12:40:41',26,1,2),
(66,0,61,61,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:41:29',26,1,0),
(67,0,62,62,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:42:11',26,1,0),
(68,0,63,63,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:44:05',26,1,0),
(69,0,64,64,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','12:44:43',26,1,0),
(70,0,65,65,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','12:46:32',26,1,0),
(71,0,66,66,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:50:15',26,1,0),
(72,0,67,67,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:52:20',26,1,0),
(73,0,68,68,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:53:16',26,1,0),
(74,0,69,69,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','12:53:47',26,1,0),
(75,0,70,70,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:54:20',26,1,0),
(76,0,71,71,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','12:54:59',26,1,0),
(77,0,72,72,12.00,0.00,12.00,0,'WHILE ADD PRODUCT','2026-10-18','12:56:36',26,1,0),
(78,0,73,73,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','12:58:19',26,1,0),
(79,0,74,74,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:00:10',26,1,0),
(80,0,75,75,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:00:57',26,1,0),
(81,0,76,76,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','13:04:00',26,1,0),
(82,0,77,77,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:04:37',26,1,0),
(83,0,78,78,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:05:21',26,1,0),
(84,0,79,79,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:05:52',26,1,0),
(85,0,80,80,4.00,0.00,4.00,0,'WHILE ADD PRODUCT','2026-10-18','13:07:24',26,1,0),
(86,0,81,81,10.00,0.00,10.00,0,'WHILE ADD PRODUCT','2026-10-18','13:09:40',26,1,0),
(87,0,82,82,8.00,0.00,8.00,0,'WHILE ADD PRODUCT','2026-10-18','13:13:05',26,1,0),
(88,0,83,83,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:14:20',26,1,0),
(89,0,84,84,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:14:57',26,1,0),
(90,0,85,85,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:15:59',26,1,0),
(91,0,86,86,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:16:30',26,1,0),
(92,0,87,87,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:17:11',26,1,0),
(93,0,88,88,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:17:59',26,1,0),
(94,2,48,48,0.00,1.00,0.00,0,'WHILE BILLING','2026-10-18','13:24:05',26,1,0),
(95,0,89,89,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','13:27:44',26,1,0),
(96,0,90,90,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','13:29:49',26,1,0),
(97,0,91,91,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:30:27',26,1,0),
(98,0,92,92,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:31:14',26,1,0),
(99,0,93,93,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','13:31:51',26,1,0),
(100,0,94,94,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:32:24',26,1,0),
(101,0,95,95,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:33:09',26,1,0),
(102,0,96,96,6.00,0.00,6.00,0,'WHILE ADD PRODUCT','2026-10-18','13:34:37',26,1,0),
(103,0,97,97,3.00,0.00,3.00,0,'WHILE ADD PRODUCT','2026-10-18','13:36:33',26,1,0),
(104,0,98,98,19.00,0.00,19.00,0,'WHILE ADD PRODUCT','2026-10-18','13:40:48',26,1,0),
(105,0,99,99,15.00,0.00,15.00,0,'WHILE ADD PRODUCT','2026-10-18','13:41:41',26,1,0),
(106,0,100,100,5.00,0.00,5.00,0,'WHILE ADD PRODUCT','2026-10-18','13:42:26',26,1,0),
(107,0,101,101,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','13:43:38',26,1,0),
(108,0,102,102,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:44:24',26,1,0),
(109,0,103,103,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:45:14',26,1,0),
(110,0,104,104,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:45:56',26,1,0),
(111,0,105,105,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:46:57',26,1,0),
(112,0,106,106,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:47:33',26,1,0),
(113,0,107,107,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:48:21',26,1,0),
(114,0,108,108,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:48:54',26,1,0),
(115,0,109,109,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:49:34',26,1,0),
(116,0,110,110,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:51:03',26,1,0),
(117,0,111,111,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','13:51:34',26,1,0),
(118,0,112,112,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','14:43:08',26,1,0),
(119,0,113,113,3.00,0.00,3.00,0,'WHILE ADD PRODUCT','2026-10-18','14:44:23',26,1,0),
(120,0,114,114,3.00,0.00,3.00,0,'WHILE ADD PRODUCT','2026-10-18','14:45:02',26,1,0),
(121,0,115,115,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','14:45:40',26,1,0),
(122,0,116,116,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','14:47:44',26,1,0),
(123,0,117,117,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','14:49:01',26,1,0),
(124,0,118,118,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','14:49:38',26,1,0),
(125,0,119,119,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','14:50:12',26,1,0),
(126,0,120,120,8.00,0.00,8.00,0,'WHILE ADD PRODUCT','2026-10-18','14:51:31',26,1,0),
(127,0,121,121,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','14:52:11',26,1,0),
(128,0,122,122,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','14:53:05',26,1,0),
(129,0,123,123,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','14:53:38',26,1,0),
(130,0,124,124,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','14:54:23',26,1,0),
(131,0,125,125,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','14:54:58',26,1,0),
(132,0,126,126,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','14:55:27',26,1,0),
(133,0,127,127,6.00,0.00,6.00,0,'WHILE ADD PRODUCT','2026-10-18','14:56:34',26,1,0),
(134,0,128,128,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','14:57:32',26,1,0),
(135,0,129,129,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','14:58:55',26,1,0),
(136,0,130,130,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','14:59:43',26,1,0),
(137,0,131,131,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:00:32',26,1,0),
(138,0,132,132,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','15:05:51',26,1,0),
(139,0,133,133,4.00,0.00,4.00,0,'WHILE ADD PRODUCT','2026-10-18','15:06:33',26,1,0),
(140,0,134,134,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:09:43',26,1,0),
(141,0,135,135,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','15:12:15',26,1,0),
(142,0,136,136,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','15:13:35',26,1,0),
(143,0,137,137,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:14:38',26,1,0),
(144,0,138,138,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:15:24',26,1,0),
(145,0,139,139,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:17:32',26,1,0),
(146,0,140,140,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','15:18:34',26,1,0),
(147,0,141,141,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','15:19:23',26,1,0),
(148,0,142,142,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:19:56',26,1,0),
(149,0,143,143,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:20:30',26,1,0),
(150,0,144,144,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:21:00',26,1,0),
(151,0,145,145,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','15:21:29',26,1,0),
(152,0,146,146,3.00,0.00,3.00,0,'WHILE ADD PRODUCT','2026-10-18','15:33:37',26,1,0),
(153,0,147,147,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','15:36:29',26,1,0),
(154,0,148,148,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','15:37:13',26,1,0),
(155,0,149,149,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','15:39:26',26,1,0),
(156,0,150,150,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:41:37',26,1,0),
(157,0,151,151,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','15:43:01',26,1,0),
(158,0,152,152,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:44:33',26,1,0),
(159,0,153,153,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','15:45:07',26,1,0),
(160,0,154,154,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:48:24',26,1,0),
(161,0,155,155,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-18','15:49:25',26,1,0),
(162,0,156,156,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:50:56',26,1,0),
(163,0,157,157,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','15:51:28',26,1,0),
(164,0,158,158,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','15:53:41',26,1,0),
(165,0,159,159,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:54:57',26,1,0),
(166,0,160,160,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:55:48',26,1,0),
(167,0,161,161,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:56:23',26,1,0),
(168,0,162,162,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:57:13',26,1,0),
(169,0,163,163,3.00,0.00,3.00,0,'WHILE ADD PRODUCT','2026-10-18','15:58:23',26,1,0),
(170,0,164,164,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:59:01',26,1,0),
(171,0,165,165,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','15:59:34',26,1,0),
(172,0,166,166,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-18','16:05:17',26,1,0),
(173,0,167,167,1.00,0.00,1.00,0,'WHILE ADD PRODUCT','2026-10-18','16:05:56',26,1,0),
(174,0,146,146,2.00,0.00,5.00,0,'Adding Stock - OLD STOCK','2026-10-18','16:16:14',26,1,1),
(175,3,1,1,0.00,1.00,18.00,0,'WHILE BILLING','2026-10-19','16:19:52',26,1,0),
(176,3,3,3,0.00,1.00,9.00,0,'WHILE BILLING','2026-10-19','16:19:52',26,1,0),
(177,4,36,36,0.00,1.00,30.00,0,'WHILE BILLING','2026-10-19','16:21:14',26,1,0),
(178,0,168,168,2.00,0.00,2.00,0,'WHILE ADD PRODUCT','2026-10-19','16:32:20',26,1,0),
(179,5,168,168,0.00,1.00,1.00,0,'WHILE BILLING','2026-10-19','16:34:53',26,1,0),
(180,5,168,168,1.00,0.00,2.00,0,'Edit bill - returned to stock','2026-10-19','16:43:05',26,1,1),
(181,5,168,168,0.00,1.00,1.00,0,'WHILE EDIT BILL','2026-10-19','16:43:05',26,1,0),
(182,0,38,38,1.00,0.00,13.00,0,'Cancel bill - returned to stock','2026-10-19','17:00:31',26,1,1),
(183,6,81,81,0.00,1.00,9.00,0,'WHILE BILLING','2026-10-19','20:35:18',26,1,0),
(184,7,36,36,0.00,1.00,29.00,0,'WHILE BILLING','2026-10-20','11:48:12',26,1,0),
(185,8,36,36,0.00,1.00,28.00,0,'WHILE BILLING','2026-10-20','15:06:00',26,1,0),
(186,9,100,100,0.00,1.00,4.00,0,'WHILE BILLING','2026-10-20','18:42:35',26,1,0),
(187,10,5,5,0.00,1.00,0.00,0,'WHILE BILLING','2026-10-20','19:02:28',26,1,0),
(188,11,2,2,0.00,1.00,9.00,0,'WHILE BILLING','2026-10-21','10:57:36',26,1,0),
(189,12,52,52,0.00,1.00,0.00,0,'WHILE BILLING','2026-10-21','11:32:58',26,1,0),
(190,0,1,39,4.00,0.00,4.00,2,'While Stock Added Through Purchase Entry','2026-10-21','13:20:51',26,2,0),
(191,10,5,5,1.00,0.00,1.00,0,'Edit bill - returned to stock','2026-10-21','13:22:47',26,1,1),
(192,10,4,4,0.00,1.00,2.00,0,'WHILE EDIT BILL','2026-10-21','13:22:47',26,1,0),
(193,11,2,2,1.00,0.00,10.00,0,'Edit bill - returned to stock','2026-10-21','13:24:23',26,1,1),
(194,11,2,2,0.00,1.00,9.00,0,'WHILE EDIT BILL','2026-10-21','13:24:23',26,1,0),
(195,5,168,168,1.00,0.00,2.00,0,'Edit bill - returned to stock','2026-10-21','13:24:43',26,1,1),
(196,5,168,168,0.00,1.00,1.00,0,'WHILE EDIT BILL','2026-10-21','13:24:43',26,1,0),
(197,10,4,4,1.00,0.00,3.00,0,'Edit bill - returned to stock','2026-10-21','13:24:55',26,1,1),
(198,10,4,4,0.00,1.00,2.00,0,'WHILE EDIT BILL','2026-10-21','13:24:55',26,1,0),
(199,12,52,52,1.00,0.00,1.00,0,'Edit bill - returned to stock','2026-10-21','13:25:19',26,1,1),
(200,12,52,52,0.00,1.00,0.00,0,'WHILE EDIT BILL','2026-10-21','13:25:19',26,1,0),
(201,0,169,169,0.00,0.00,0.00,0,'WHILE ADD PRODUCT','2026-10-21','14:49:54',26,1,0),
(202,13,41,41,0.00,1.00,5.00,0,'WHILE BILLING','2026-10-21','15:14:02',26,1,0),
(203,14,36,36,0.00,1.00,27.00,0,'WHILE BILLING','2026-10-21','15:33:54',26,1,0),
(204,15,91,91,0.00,1.00,0.00,0,'WHILE BILLING','2026-10-21','16:26:38',26,1,0),
(205,15,95,95,0.00,1.00,0.00,0,'WHILE BILLING','2026-10-21','16:26:38',26,1,0),
(206,0,2,2,1.00,0.00,10.00,0,'Cancel bill - returned to stock','2026-10-21','16:49:21',26,1,1),
(207,15,91,91,1.00,0.00,1.00,0,'Edit bill - returned to stock','2026-10-21','16:49:42',26,1,1),
(208,15,95,95,1.00,0.00,1.00,0,'Edit bill - returned to stock','2026-10-21','16:49:42',26,1,1),
(209,15,91,91,0.00,1.00,0.00,0,'WHILE EDIT BILL','2026-10-21','16:49:42',26,1,0),
(210,15,95,95,0.00,1.00,0.00,0,'WHILE EDIT BILL','2026-10-21','16:49:42',26,1,0),
(211,0,91,91,1.00,0.00,1.00,0,'Cancel bill - returned to stock','2026-10-21','16:50:03',26,1,1),
(212,0,95,95,1.00,0.00,1.00,0,'Cancel bill - returned to stock','2026-10-21','16:50:03',26,1,1),
(213,16,91,91,0.00,1.00,0.00,0,'WHILE BILLING','2026-10-21','16:50:42',26,1,0),
(214,16,95,95,0.00,1.00,0.00,0,'WHILE BILLING','2026-10-21','16:50:42',26,1,0),
(215,0,52,52,1.00,0.00,1.00,0,'Cancel bill - returned to stock','2026-10-21','16:51:50',26,1,1),
(216,0,91,91,1.00,0.00,1.00,0,'Cancel bill - returned to stock','2026-10-21','16:52:37',26,1,1),
(217,0,95,95,1.00,0.00,1.00,0,'Cancel bill - returned to stock','2026-10-21','16:52:37',26,1,1),
(218,17,91,91,0.00,1.00,0.00,0,'WHILE BILLING','2026-10-21','16:53:08',26,1,0),
(219,17,95,95,0.00,1.00,0.00,0,'WHILE BILLING','2026-10-21','16:53:08',26,1,0),
(220,17,91,91,1.00,0.00,1.00,0,'Edit bill - returned to stock','2026-10-21','17:05:41',26,1,1),
(221,17,95,95,1.00,0.00,1.00,0,'Edit bill - returned to stock','2026-10-21','17:05:41',26,1,1),
(222,17,91,91,0.00,1.00,0.00,0,'WHILE EDIT BILL','2026-10-21','17:05:41',26,1,0),
(223,17,95,95,0.00,1.00,0.00,0,'WHILE EDIT BILL','2026-10-21','17:05:41',26,1,0);

/*Table structure for table `prod_order` */

DROP TABLE IF EXISTS `prod_order`;

CREATE TABLE `prod_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) NOT NULL,
  `table_id` int NOT NULL,
  `is_delivered` int DEFAULT '0',
  `is_billed` int DEFAULT '0',
  `is_cancelled` int DEFAULT '0',
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_order` */

/*Table structure for table `prod_order_details` */

DROP TABLE IF EXISTS `prod_order_details`;

CREATE TABLE `prod_order_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `qty` int NOT NULL,
  `price` double(10,3) DEFAULT '0.000',
  `total` double(10,3) DEFAULT '0.000',
  `is_delivered` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_order_details` */

/*Table structure for table `prod_product` */

DROP TABLE IF EXISTS `prod_product`;

CREATE TABLE `prod_product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `unit_id` int DEFAULT '1',
  `hsn` int DEFAULT NULL,
  `uid` int NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `is_active` int DEFAULT '1',
  `gst` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat` (`category_id`),
  KEY `brand` (`brand_id`),
  KEY `uid` (`uid`),
  KEY `unit` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;

/*Data for the table `prod_product` */

insert  into `prod_product`(`id`,`name`,`code`,`category_id`,`brand_id`,`unit_id`,`hsn`,`uid`,`date`,`time`,`is_active`,`gst`) values 
(1,'EXIDE 4L','4 AH',1,2,1,NULL,26,'2026-10-17','14:13:14',1,18),
(2,'EXIDE XLTZ5A KATTA','5 AH 1',1,2,1,NULL,26,'2026-10-17','19:53:31',1,18),
(3,'EXIDE 12XL5L-B VALATHI','5 AH 2',1,2,1,NULL,26,'2026-10-17','20:17:18',1,0),
(4,'EXIDE 12XL7B-B','7 AH 1',1,2,1,NULL,26,'2026-10-17','20:22:18',1,0),
(5,'EXIDE XLTZ7','7AH 2',1,2,1,NULL,26,'2026-10-17','20:23:08',1,0),
(6,'EXIDE XLTZ9 KATTA','9 AH 1',1,2,1,NULL,26,'2026-10-17','20:24:40',1,0),
(7,'EXIDE 12XL9-B VALATHI','9 AH 2',1,2,1,NULL,26,'2026-10-17','20:29:47',1,0),
(8,'EXIDE XLTX14','X 14',1,2,1,NULL,26,'2026-10-18','09:41:41',1,0),
(9,'EXIDE 12XL14L-A2','14 A2',1,2,1,NULL,26,'2026-10-18','09:42:36',1,0),
(10,'EXIDE ML38B20L','38B20L',1,2,1,NULL,26,'2026-10-18','09:43:28',1,0),
(11,'EXIDE ML38B20R','38B20R',1,2,1,NULL,26,'2026-10-18','09:44:11',1,0),
(12,'EXIDE ML55D23L','55D23L',1,2,1,NULL,26,'2026-10-18','09:44:47',1,0),
(13,'EXIDE ML40LBH','40LBH',1,2,1,NULL,26,'2026-10-18','09:45:25',1,0),
(14,'EXIDE MLDIN 50','DIN 50',1,2,1,NULL,26,'2026-10-18','09:46:15',1,0),
(15,'EXIDE MLDIN 60','DIN 60',1,2,1,NULL,26,'2026-10-18','09:47:09',1,0),
(16,'EXIDE MLDIN 66','DIN 66',1,2,1,NULL,26,'2026-10-18','09:47:55',1,0),
(17,'EXIDE EY700F','EY700F',1,2,1,NULL,26,'2026-10-18','09:48:28',1,0),
(18,'EXIDE EY700LF','EY700LF',1,2,1,NULL,26,'2026-10-18','09:50:10',1,0),
(19,'EXIDE EKO60L','EKO60L',1,2,1,NULL,26,'2026-10-18','09:51:05',1,0),
(20,'DRIVE 80L','DRIVE80L',1,2,1,NULL,26,'2026-10-18','09:51:40',1,0),
(21,'EXIDE XP1000','XP1000',1,2,1,NULL,26,'2026-10-18','09:52:19',1,0),
(22,'EXIDE IMTT1500','1500',1,2,1,NULL,26,'2026-10-18','10:03:02',1,0),
(23,'EXIDE XP1800','XP1800',1,2,1,NULL,26,'2026-10-18','10:03:46',1,0),
(24,'EXIDE IMTT 2000[3Y]','2000 3Y',1,2,1,NULL,26,'2026-10-18','10:04:24',1,0),
(25,'EXIDE MST1000','MST1000',1,2,1,NULL,26,'2026-10-18','10:08:48',1,0),
(26,'EXIDE 150 SOLAR [5Y]','150 SOLAR',1,2,1,NULL,26,'2026-10-18','10:13:56',0,0),
(27,'EXIDE 105 SOLAR','105 SOLAR',1,2,1,NULL,26,'2026-10-18','10:14:42',1,0),
(28,'EXIDE EL 200AH [48M]','EL 200AH [48M]',1,2,1,NULL,26,'2026-10-18','10:17:46',1,0),
(29,'EXIDE SOLAR 200AH 5Y','200 SOLAR 5Y',1,2,1,NULL,26,'2026-10-18','10:18:22',1,0),
(30,'EXIDE STAR 12V700','700',3,2,1,NULL,26,'2026-10-18','10:19:12',1,0),
(31,'EXIDE STAR 12V900','900',3,2,1,NULL,26,'2026-10-18','10:19:41',1,0),
(32,'EXIDE STER 1125','1125',3,2,1,NULL,26,'2026-10-18','10:20:09',1,0),
(33,'EXIDE12 V  1625','1625',3,2,1,NULL,26,'2026-10-18','10:20:41',1,0),
(34,'LITHIYAN BATTRY 100AM','LITHIYAN 100',1,1,1,NULL,26,'2026-10-18','10:21:24',1,0),
(35,'AMARON BTX2.5L','2.5 AH',1,3,1,NULL,26,'2026-10-18','10:22:52',1,0),
(36,'AMAORN 4L','AMAORN 4 AH',1,3,1,NULL,26,'2026-10-18','10:23:29',1,0),
(37,'AMARON BTZ5L KATTA','AMAORN 5 AH 1',1,3,1,NULL,26,'2026-10-18','10:24:06',1,0),
(38,'AMARON X50 VALATHI','AMAORN 5 AH 2',1,3,1,NULL,26,'2026-10-18','10:24:54',1,0),
(39,'AMAORN BTX7 R','AMAORN 7 AH',1,3,1,NULL,26,'2026-10-18','10:25:37',1,0),
(40,'AMAORN Z9R  KATTA','AMAORN 9 AH 1',1,3,1,NULL,26,'2026-10-18','10:26:25',1,0),
(41,'AMAORN X9R VALATHI','AMAORN 9 AH 2',1,3,1,NULL,26,'2026-10-18','10:26:58',1,0),
(42,'AMAORN Z14R','AMAORN 14 AH',1,3,1,NULL,26,'2026-10-18','10:27:58',1,0),
(43,'AMARON BC 40 LMF','40 LMF',1,3,1,NULL,26,'2026-10-18','12:07:35',1,0),
(44,'AMARON 38B20L','38B20L',1,3,1,NULL,26,'2026-10-18','12:12:20',1,0),
(45,'AMARON 38B20R','38B20R',1,3,1,NULL,26,'2026-10-18','12:13:10',1,0),
(46,'AMARON BH38B20R','BH38B20R',1,3,1,NULL,26,'2026-10-18','12:13:54',1,0),
(47,'AMARON  40B20L 36+36','40B20L',1,3,1,NULL,26,'2026-10-18','12:14:54',1,0),
(48,'AMARON  42 B20R 36+36','42 B20R',1,3,1,NULL,26,'2026-10-18','12:15:45',1,0),
(49,'AMARON BL 600 LMF  (24)','600 LMF  (24)',1,3,1,NULL,26,'2026-10-18','12:17:04',1,0),
(50,'AMARON BL 800RMF','800RMF',1,3,1,NULL,26,'2026-10-18','12:18:10',1,0),
(51,'AMARON FLO DIN 50 30+30','DIN 50',1,3,1,NULL,26,'2026-10-18','12:19:05',1,0),
(52,'AMARON FLO DIN 45','DIN 45',1,3,1,NULL,26,'2026-10-18','12:20:55',1,0),
(53,'AMARON FLO  DIN65 30+30','DIN65',1,3,1,NULL,26,'2026-10-18','12:21:43',1,0),
(54,'AMARON FLO DIN66','DIN 66',1,3,1,NULL,26,'2026-10-18','12:22:45',1,0),
(55,'AMARON 85D23R','85D23R',1,3,1,NULL,26,'2026-10-18','12:36:35',1,0),
(56,'AMARON 80D23L','80D23L',1,3,1,NULL,26,'2026-10-18','12:37:08',1,0),
(57,'AMARON 95D26R 24+24','95D26R',1,3,1,NULL,26,'2026-10-18','12:37:44',1,0),
(58,'AMARON 95D26L 24+24','95D26L',1,3,1,NULL,26,'2026-10-18','12:38:25',1,0),
(59,'AMARON 105D31R','105D31R',1,3,1,NULL,26,'2026-10-18','12:38:56',1,0),
(60,'AMARON 105D31L','105D31L',1,3,1,NULL,26,'2026-10-18','12:39:37',1,0),
(61,'AMARON  NT700 E41R','NT700 E41R',1,3,1,NULL,26,'2026-10-18','12:41:29',1,0),
(62,'AMARON  BL90E41R','BL90E41R',1,3,1,NULL,26,'2026-10-18','12:42:11',1,0),
(63,'AMARON 1000 UPS','1000 UPS',3,3,1,NULL,26,'2026-10-18','12:44:05',1,0),
(64,'AMARON 1200 UPS','1200 UPS',3,3,1,NULL,26,'2026-10-18','12:44:43',1,0),
(65,'AMARON 1200 UPS','1200 UPS',3,3,1,NULL,26,'2026-10-18','12:46:32',1,0),
(66,'AMARON 1300 UPS','1300 UPS',3,3,1,NULL,26,'2026-10-18','12:50:15',1,0),
(67,'AMARON 1600 UPS','1600 UPS',3,3,1,NULL,26,'2026-10-18','12:52:20',1,0),
(68,'AMARON TALL 100 AH SOLAR [5Y]','TALL 100 AH SOLAR [5Y]',1,3,1,NULL,26,'2026-10-18','12:53:16',1,0),
(69,'AMARON 130ST 48','130ST 48',1,3,1,NULL,26,'2026-10-18','12:53:47',1,0),
(70,'AMARON TALL 150 AH 36+24','TALL 150 AH 36+24',1,3,1,NULL,26,'2026-10-18','12:54:20',1,0),
(71,'AMARON TALL 150 AH SOLAR 60 +12','TALL 150 AH SOLAR 60 +12',1,3,1,NULL,26,'2026-10-18','12:54:59',1,0),
(72,'BOSCH 4L','4 AH BOSCH',1,7,1,NULL,26,'2026-10-18','12:56:36',1,0),
(73,'ELITO 5L','5 AH ELITO',1,1,1,NULL,26,'2026-10-18','12:58:19',1,0),
(74,'MICROTEK 875 W','875 W MICRO',3,8,1,NULL,26,'2026-10-18','13:00:10',1,0),
(75,'MICROTEK 1075W','1075 MICRO',3,8,1,NULL,26,'2026-10-18','13:00:57',1,0),
(76,'MICROTEK 1875 24V','1875 24 V MICRO',3,8,1,NULL,26,'2026-10-18','13:04:00',1,0),
(77,'MICROTEK 140AH','MICROTEK 140AH',1,8,1,NULL,26,'2026-10-18','13:04:37',1,0),
(78,'LUMINOUS ILTT 150 AH PRO','150 AH LUMINOUS',1,4,1,NULL,26,'2026-10-18','13:05:21',1,0),
(79,'LUMINOUS EVO S +1050 W','1050 W LUMINOS',3,4,1,NULL,26,'2026-10-18','13:05:52',1,0),
(80,'SF TZ4A','4 AH SF',1,9,1,NULL,26,'2026-10-18','13:07:24',1,0),
(81,'SF  TZ5L-B VALATHI','5 AH 1 SF',1,9,1,NULL,26,'2026-10-18','13:09:40',1,0),
(82,'SF TZ5A KATTA','5 AH 2 SF',1,9,1,NULL,26,'2026-10-18','13:13:05',1,0),
(83,'SF 38B20R','SF 38B20R',1,9,1,NULL,26,'2026-10-18','13:14:20',1,0),
(84,'SF 150 TT','SF 150 TT',1,9,1,NULL,26,'2026-10-18','13:14:57',1,0),
(85,'EASTMAN 150AH','EASTMAN 150AH',1,10,1,NULL,26,'2026-10-18','13:15:59',1,0),
(86,'EASTMAN1200 VA','1200 W EASTMAN',3,10,1,NULL,26,'2026-10-18','13:16:30',1,0),
(87,'AMAZE 100 AH','100 AH AMAZE',1,5,1,NULL,26,'2026-10-18','13:17:11',1,0),
(88,'AMAZE 135 AH','135 AH AMAZE',1,5,1,NULL,26,'2026-10-18','13:17:59',1,0),
(89,'AMAZE 150 AH [3Y]','150 AH AMAZE',1,5,1,NULL,26,'2026-10-18','13:27:44',1,0),
(90,'AMAZE 150 AH [5Y]','150 AH AMAZE  5Y',1,5,1,NULL,26,'2026-10-18','13:29:49',1,0),
(91,'AMAZE 200 TALL [5Y]','200 AH AMAZE 5Y',1,5,1,NULL,26,'2026-10-18','13:30:27',1,0),
(92,'AMAZE 700AH 12V','700 W AMAZE',3,5,1,NULL,26,'2026-10-18','13:31:14',1,0),
(93,'AMAZE 875 UPS','875 W AMAZE',3,5,1,NULL,26,'2026-10-18','13:31:51',1,0),
(94,'AMAZE 1075 UPS','1075 W AMAZE',3,5,1,NULL,26,'2026-10-18','13:32:24',1,0),
(95,'AMAZE 1275 UPS','1275 W AMAZE',3,5,1,NULL,26,'2026-10-18','13:33:09',1,0),
(96,'COMPUTER UPS BATTERY 7A','7 AH UPS BATTERY',1,11,1,NULL,26,'2026-10-18','13:34:37',1,0),
(97,'COMPUTER UPS BATTERY 14 AH','14 AH UPS BATTERY',1,11,1,NULL,26,'2026-10-18','13:36:33',1,0),
(98,'POWER ZONE 4L','4 AH POWER',1,12,1,NULL,26,'2026-10-18','13:40:48',1,0),
(99,'POWER ZONE 5L KATTA','5 AH 1 POWER',1,12,1,NULL,26,'2026-10-18','13:41:41',1,0),
(100,'POWER ZONE 50 VALATHI','5 AH 2 POWER',1,12,1,NULL,26,'2026-10-18','13:42:26',1,0),
(101,'POWER ZONE X2.5','2.5 AH POWER',1,12,1,NULL,26,'2026-10-18','13:43:38',1,0),
(102,'POWER ZONE X7R','7 AH POWER',1,12,1,NULL,26,'2026-10-18','13:44:24',1,0),
(103,'V GUARD 100 AH BATTERY','80 AH V GURAD',1,6,1,NULL,26,'2026-10-18','13:45:14',1,0),
(104,'V GUARD V 160 P BATTRY','150 AH V GUARD',1,6,1,NULL,26,'2026-10-18','13:45:56',1,0),
(105,'VGURAD  400V UPS','400 W V GUARD',3,6,1,NULL,26,'2026-10-18','13:46:57',1,0),
(106,'V GUARD 750 USP','750 W V GUARD',3,6,1,NULL,26,'2026-10-18','13:47:33',1,0),
(107,'V GUARD 1000 USP','1000 W V GUARD',3,6,1,NULL,26,'2026-10-18','13:48:21',1,0),
(108,'VGURAD 1100','1100 W V GUARD',3,6,1,NULL,26,'2026-10-18','13:48:54',1,0),
(109,'V GUARD 1550 USP','1550 W V GUARD',3,6,1,NULL,26,'2026-10-18','13:49:34',1,0),
(110,'V GUARD 3 LIT HEATER 2 Y','3 LIT V GUARD',6,6,1,NULL,26,'2026-10-18','13:51:03',1,0),
(111,'V GUARD 5 LIT HEATER 2 Y','5 LIT V GUARD',6,6,1,NULL,26,'2026-10-18','13:51:34',1,0),
(112,'USHA 22 LIT AIR COOLER','22 LIT USHA',7,13,1,NULL,26,'2026-10-18','14:43:08',1,0),
(113,'USHA ALPHA CHOROME','CHOROME',7,13,1,NULL,26,'2026-10-18','14:44:23',1,0),
(114,'USHA 1200 BROWN SWIFT 1ST','SWIFT USHA',7,13,1,NULL,26,'2026-10-18','14:45:02',1,0),
(115,'USHA 600 BROWN SWIFT','600 SWIFT',7,13,1,NULL,26,'2026-10-18','14:45:40',1,0),
(116,'USHA GRINDER 150WW','GRINDER 150',7,13,1,NULL,26,'2026-10-18','14:47:44',1,0),
(117,'USHA IRON BOX 1300W','1300 IRON',7,13,1,NULL,26,'2026-10-18','14:49:01',1,0),
(118,'USHA IRON BOX 1000W','1000 IRON',7,13,1,NULL,26,'2026-10-18','14:49:38',1,0),
(119,'USHA IRON ARMOR 1100W','1100 IRON',7,13,1,NULL,26,'2026-10-18','14:50:12',1,0),
(120,'GREEN CHEF GRIENDER','GREEN CHEF',7,6,1,NULL,26,'2026-10-18','14:51:31',1,0),
(121,'V GUARD FAN 2Y','V GUARD FAN 2Y',7,6,1,NULL,26,'2026-10-18','14:52:11',1,0),
(122,'V GUARD TABLE FAN 2Y','TABLE FAN',7,6,1,NULL,26,'2026-10-18','14:53:05',1,0),
(123,'VGUARD 500 NX MIXE 3Y','500 MIXI  V GUARD',7,6,1,NULL,26,'2026-10-18','14:53:38',1,0),
(124,'VGUARD 600 NX MIXE 5 Y','600 MIXI V GUARD',7,6,1,NULL,26,'2026-10-18','14:54:23',1,0),
(125,'VGUARD 2B STOVE 5Y','2B STOVE',7,6,1,NULL,26,'2026-10-18','14:54:58',1,0),
(126,'VGUARD 3B STOVE 5Y','3B STOVE',7,6,1,NULL,26,'2026-10-18','14:55:27',1,0),
(127,'MICRO MINI [ 10 kg ]','10 KG',4,1,1,NULL,26,'2026-10-18','14:56:34',1,0),
(128,'MINI [ 5KG]','5 KG',4,1,1,NULL,26,'2026-10-18','14:57:32',1,0),
(129,'MINI [ 20 kg ]','20 KG MINI',4,1,1,NULL,26,'2026-10-18','14:58:55',1,0),
(130,'MINI POLE [20 KG ]','20 KG MINI POLE',4,1,1,NULL,26,'2026-10-18','14:59:43',1,0),
(131,'TABELE TOP [ 30 kg ] 4V','30 KG TT',4,1,1,NULL,26,'2026-10-18','15:00:32',1,0),
(132,'7\" 180*180 [ 50kg ]','50 KG 7\"',4,1,1,NULL,26,'2026-10-18','15:05:51',1,0),
(133,'8\" 210*210 [ 50 kg ]','50 KG 8\"',4,1,1,NULL,26,'2026-10-18','15:06:33',1,0),
(134,'10\" 250*250 [ 50 kg ]','50 KG 10\"',4,1,1,NULL,26,'2026-10-18','15:09:43',1,0),
(135,'12\" 3*3   [ 100 kg ]','100 KG  BLOCK',4,1,1,NULL,26,'2026-10-18','15:12:15',1,0),
(136,'10\" 200*250 SS [50KG ]','50 KG SS 10\"',4,1,1,NULL,26,'2026-10-18','15:13:35',1,0),
(137,'300*300 SS [100KG] 12*','100 KG 12\" SS',4,1,1,NULL,26,'2026-10-18','15:14:38',1,0),
(138,'350*350  SS [200kg] 14*','200 KG 14\" SS',4,1,1,NULL,26,'2026-10-18','15:15:24',1,0),
(139,'14\" [ 150 KG ]','150 KG 14\" BLOCK',4,1,1,NULL,26,'2026-10-18','15:17:32',1,0),
(140,'16\" 400*400 SK [ 300 kg ]','300 KG 16\" BLOCK',4,1,1,NULL,26,'2026-10-18','15:18:34',1,0),
(141,'EGELE','EGELE',4,1,1,NULL,26,'2026-10-18','15:19:23',1,0),
(142,'CHODA ABS [20KG]','20 KG ABS',4,1,1,NULL,26,'2026-10-18','15:19:56',1,0),
(143,'CHAINA PRC','CHAINA PRC',4,1,1,NULL,26,'2026-10-18','15:20:30',1,0),
(144,'MEGA PHONE','MEGA PHONE',4,1,1,NULL,26,'2026-10-18','15:21:00',1,0),
(145,'SEALING MACHINES','SEALING MACHINES',4,1,1,NULL,26,'2026-10-18','15:21:29',1,0),
(146,'AQUA DOLPHINE GOLD  7LIT','DOLPHINE',2,14,1,NULL,26,'2026-10-18','15:33:37',1,0),
(147,'MARS BULE','MARS BULE',2,14,1,NULL,26,'2026-10-18','15:36:29',1,0),
(148,'MARS BLACK','MARS BLACK',2,14,1,NULL,26,'2026-10-18','15:37:13',1,0),
(149,'AQUA DOLPHIN METALIC','DOLPHIN METALIC',2,14,1,NULL,26,'2026-10-18','15:39:26',1,0),
(150,'AQUAGRAND OR FRESH  15 LIT','AQUAGRAND OR FRESH  15 Lit',2,14,1,NULL,26,'2026-10-18','15:41:37',1,0),
(151,'LEXZON    10 Lit','LEXZON.     10 Lit',2,14,1,NULL,26,'2026-10-18','15:43:01',1,0),
(152,'AQUA JADE.               12 Lit','AQUA JADE.               12 Lit',2,14,1,NULL,26,'2026-10-18','15:44:33',1,0),
(153,'AQUA XL.                   12 Lit','AQUA XL.                   12 Lit',2,14,1,NULL,26,'2026-10-18','15:45:07',1,0),
(154,'AQUA 2090.             10 Lit','AQUA 2090.             10 Lit',2,14,1,NULL,26,'2026-10-18','15:48:24',1,0),
(155,'AQUA NINE.             10 Lit','AQUA NINE.             10 Lit',2,14,1,NULL,26,'2026-10-18','15:49:25',1,0),
(156,'AQUAGLORY OR FLIP.  13 Lit','AQUAGLORY OR FLIP.  13 Lit',2,14,1,NULL,26,'2026-10-18','15:50:56',1,0),
(157,'AQUA SONNET BLK          14 Lit','AQUA SONNET BLK          14 Lit',2,14,1,NULL,26,'2026-10-18','15:51:28',1,0),
(158,'AQUA SONNET BLUE  14 Lit','AQUA SONNET BLUE  14 Lit',2,14,1,NULL,26,'2026-10-18','15:53:41',1,0),
(159,'AQUA ROMA.              12 Lit','AQUA ROMA.              12 Lit',2,14,1,NULL,26,'2026-10-18','15:54:57',1,0),
(160,'AQUA INNOVICA.        10 Lit','AQUA INNOVICA.        10 Lit',2,14,1,NULL,26,'2026-10-18','15:55:48',1,0),
(161,'AQUA 9090                         13 Lit','AQUA 9090                         13 Lit',2,14,1,NULL,26,'2026-10-18','15:56:23',1,0),
(162,'AQUA FINEPURE                14 Lit','AQUA FINEPURE                14 Lit',2,14,1,NULL,26,'2026-10-18','15:57:13',1,0),
(163,'AQUVA V5                 10 LIT','AQUVA V5                 10 LIT',2,14,1,NULL,26,'2026-10-18','15:58:23',1,0),
(164,'HOT & COOL','HOT & COOL',2,14,1,NULL,26,'2026-10-18','15:59:01',1,0),
(165,'WOHALMENT','WOHALMENT',2,14,1,NULL,26,'2026-10-18','15:59:34',1,0),
(166,'AQUA ERA','ERA',2,14,1,NULL,26,'2026-10-18','16:05:17',1,0),
(167,'AQUA HIFLO','AQUA HIFLO',2,14,1,NULL,26,'2026-10-18','16:05:56',1,0),
(168,'EXIDE 150 SOLAR ( 5Y )','EXIDE 150 SOLAR 5Y',1,2,1,NULL,26,'2026-10-19','16:32:20',1,0),
(169,'EXIDE 2.5 AH','2.5 AH EXIDE',1,2,1,NULL,26,'2026-10-21','14:49:54',1,0);

/*Table structure for table `prod_product_components` */

DROP TABLE IF EXISTS `prod_product_components`;

CREATE TABLE `prod_product_components` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL COMMENT 'Main product ID',
  `component_product_id` int NOT NULL COMMENT 'Component product ID',
  `quantity` decimal(10,2) DEFAULT '1.00' COMMENT 'Quantity needed',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prod` (`product_id`),
  KEY `compo` (`component_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_product_components` */

/*Table structure for table `prod_purchase` */

DROP TABLE IF EXISTS `prod_purchase`;

CREATE TABLE `prod_purchase` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prno` varchar(25) NOT NULL DEFAULT '',
  `invno` varchar(255) DEFAULT '',
  `invdate` date DEFAULT NULL,
  `total` double(10,2) NOT NULL DEFAULT '0.00',
  `paid` double(10,2) NOT NULL DEFAULT '0.00',
  `balance` double(10,2) DEFAULT '0.00',
  `discount` double(10,2) DEFAULT '0.00',
  `net` double NOT NULL DEFAULT '0',
  `ent_date` date NOT NULL DEFAULT '0001-01-01',
  `ent_time` time NOT NULL DEFAULT '00:00:00',
  `ent_uid` int unsigned NOT NULL DEFAULT '0',
  `ispending` tinyint unsigned DEFAULT '0',
  `pay_type` int unsigned NOT NULL DEFAULT '0',
  `bank_id` int unsigned NOT NULL DEFAULT '0',
  `deal_id` int unsigned DEFAULT '0',
  `remark` varchar(100) NOT NULL DEFAULT '0',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `cancel_date` date DEFAULT '0001-01-01',
  `cancel_time` time DEFAULT '00:00:00',
  `cancel_uid` varchar(10) DEFAULT '0',
  `is_po` tinyint DEFAULT '0',
  `po_status` tinyint DEFAULT '1',
  `pr_id` int DEFAULT NULL,
  `grn_id` int DEFAULT '0',
  `expected_date` date DEFAULT NULL,
  `po_notes` text,
  `offer` text,
  `offer_date` date DEFAULT NULL,
  `lr_no` varchar(255) DEFAULT NULL,
  `lr_date` date DEFAULT NULL,
  `lr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prno` (`prno`),
  KEY `dealer` (`deal_id`),
  KEY `grnid` (`grn_id`),
  KEY `status` (`po_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `prod_purchase` */

insert  into `prod_purchase`(`id`,`prno`,`invno`,`invdate`,`total`,`paid`,`balance`,`discount`,`net`,`ent_date`,`ent_time`,`ent_uid`,`ispending`,`pay_type`,`bank_id`,`deal_id`,`remark`,`is_cancelled`,`cancel_date`,`cancel_time`,`cancel_uid`,`is_po`,`po_status`,`pr_id`,`grn_id`,`expected_date`,`po_notes`,`offer`,`offer_date`,`lr_no`,`lr_date`,`lr_name`) values 
(1,'GRN-1','JKTVL-2066','2026-10-12',10974.00,0.00,10974.00,0.00,10974,'2026-10-17','14:21:05',26,0,1,0,1,'0',0,'0001-01-01','00:00:00','0',0,1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'GRN-2','JKTVL-2066','2026-10-17',12980.00,0.00,12980.00,0.00,12980,'2026-10-17','20:37:39',26,0,1,0,1,'0',0,'0001-01-01','00:00:00','0',0,1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'GRN-3','11361','2026-03-19',4480.00,4480.00,0.00,0.00,4480,'2026-10-21','13:20:51',26,0,0,0,8,'0',0,'0001-01-01','00:00:00','0',0,1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `prod_purchase_counter` */

DROP TABLE IF EXISTS `prod_purchase_counter`;

CREATE TABLE `prod_purchase_counter` (
  `id` int NOT NULL,
  `last_pr_no` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_purchase_counter` */

/*Table structure for table `prod_purchase_details` */

DROP TABLE IF EXISTS `prod_purchase_details`;

CREATE TABLE `prod_purchase_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prid` int unsigned DEFAULT '0',
  `prods_id` int DEFAULT '0',
  `pack` int DEFAULT '0',
  `qtypack` decimal(10,2) DEFAULT '0.00',
  `quantity` decimal(10,2) unsigned DEFAULT '0.00',
  `free` int unsigned DEFAULT '0',
  `rate` double(10,3) DEFAULT '0.000',
  `mrp` double(10,3) DEFAULT '0.000',
  `totalamt` double(10,3) DEFAULT '0.000',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `tax_amt` double(10,3) DEFAULT '0.000',
  `mrp_vat_amt` double(10,2) DEFAULT '0.00',
  `disc_per` double(10,2) DEFAULT '0.00',
  `disc` double(10,3) DEFAULT '0.000',
  `netamt` double(10,3) DEFAULT '0.000',
  `isinvoicereceived` int unsigned NOT NULL DEFAULT '0',
  `hsn_code` varchar(20) NOT NULL DEFAULT '0',
  `sgst_per` double(10,2) NOT NULL DEFAULT '0.00',
  `cgst_per` double(10,2) NOT NULL DEFAULT '0.00',
  `igst_per` double(10,2) NOT NULL DEFAULT '0.00',
  `sgst_amt` double(10,2) NOT NULL DEFAULT '0.00',
  `cgst_amt` double(10,2) NOT NULL DEFAULT '0.00',
  `igst_amt` double(10,2) NOT NULL DEFAULT '0.00',
  `unitrate` double(10,3) DEFAULT '0.000',
  `unitmrp` double(10,3) DEFAULT '0.000',
  `ordered_qty` int DEFAULT '0',
  `received_qty` int DEFAULT '0',
  `pending_qty` int DEFAULT '0',
  `is_fully_received` tinyint DEFAULT '0',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = this item was cancelled',
  PRIMARY KEY (`id`),
  KEY `prid` (`prid`),
  KEY `prod` (`prods_id`),
  KEY `fullyreceive` (`is_fully_received`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `prod_purchase_details` */

insert  into `prod_purchase_details`(`id`,`prid`,`prods_id`,`pack`,`qtypack`,`quantity`,`free`,`rate`,`mrp`,`totalamt`,`tax`,`tax_amt`,`mrp_vat_amt`,`disc_per`,`disc`,`netamt`,`isinvoicereceived`,`hsn_code`,`sgst_per`,`cgst_per`,`igst_per`,`sgst_amt`,`cgst_amt`,`igst_amt`,`unitrate`,`unitmrp`,`ordered_qty`,`received_qty`,`pending_qty`,`is_fully_received`,`is_cancelled`) values 
(1,1,1,1,10.00,10.00,0,930.000,1350.000,9300.000,18.00,1674.000,0.00,0.00,0.000,10974.000,1,'0',9.00,9.00,0.00,837.00,837.00,0.00,93.000,135.000,0,0,0,0,0),
(2,2,2,1,10.00,10.00,0,1100.000,1600.000,11000.000,18.00,1980.000,0.00,0.00,0.000,12980.000,1,'0',9.00,9.00,0.00,990.00,990.00,0.00,110.000,160.000,0,0,0,0,0),
(3,3,39,1,4.00,4.00,0,1120.000,1700.000,4480.000,0.00,0.000,0.00,0.00,0.000,4480.000,1,'0',0.00,0.00,0.00,0.00,0.00,0.00,280.000,425.000,0,0,0,0,0);

/*Table structure for table `prod_purchase_edit_log` */

DROP TABLE IF EXISTS `prod_purchase_edit_log`;

CREATE TABLE `prod_purchase_edit_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int NOT NULL,
  `purchase_detail_id` int NOT NULL,
  `product_id` int NOT NULL,
  `edit_type` enum('price_edit','cancel') NOT NULL,
  `old_rate` double DEFAULT NULL,
  `new_rate` double DEFAULT NULL,
  `old_mrp` double DEFAULT NULL,
  `new_mrp` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `reason` text,
  `uid` int NOT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_purchase_edit_log` */

/*Table structure for table `prod_purchase_entry_details_link` */

DROP TABLE IF EXISTS `prod_purchase_entry_details_link`;

CREATE TABLE `prod_purchase_entry_details_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `link_id` int NOT NULL,
  `po_detail_id` bigint unsigned NOT NULL,
  `pe_detail_id` bigint unsigned NOT NULL,
  `quantity_received` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_purchase_entry_details_link` */

/*Table structure for table `prod_purchase_entry_link` */

DROP TABLE IF EXISTS `prod_purchase_entry_link`;

CREATE TABLE `prod_purchase_entry_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `po_id` bigint unsigned NOT NULL,
  `pe_id` bigint unsigned NOT NULL,
  `receipt_no` varchar(50) DEFAULT NULL,
  `receipt_date` date DEFAULT NULL,
  `received_by` int DEFAULT NULL,
  `notes` text,
  `created_date` date NOT NULL,
  `created_time` time NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_purchase_entry_link` */

/*Table structure for table `prod_purchase_order_counter` */

DROP TABLE IF EXISTS `prod_purchase_order_counter`;

CREATE TABLE `prod_purchase_order_counter` (
  `id` int NOT NULL DEFAULT '1',
  `last_po_no` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_purchase_order_counter` */

/*Table structure for table `prod_purchase_request` */

DROP TABLE IF EXISTS `prod_purchase_request`;

CREATE TABLE `prod_purchase_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `req_no` varchar(50) NOT NULL COMMENT 'REQ1, REQ2, REQ3...',
  `req_date` date NOT NULL,
  `req_time` time NOT NULL,
  `deal_id` int DEFAULT NULL COMMENT 'Supplier ID - can be null for TBD supplier',
  `total` decimal(15,2) DEFAULT '0.00' COMMENT 'Total request amount',
  `pr_status` tinyint DEFAULT '1' COMMENT '1=Draft, 2=Submitted, 3=Approved, 4=Rejected, 5=Converted to PO',
  `notes` text COMMENT 'Request notes/justification',
  `requested_by` int NOT NULL COMMENT 'User ID who created the request',
  `approver_id` int DEFAULT NULL COMMENT 'User ID who approved/rejected - for future multi-level approval',
  `approved_date` date DEFAULT NULL COMMENT 'Approval date',
  `approved_time` time DEFAULT NULL COMMENT 'Approval time',
  `approval_notes` text COMMENT 'Approval/rejection notes',
  `po_id` int DEFAULT NULL COMMENT 'Link to PO if converted',
  `is_cancelled` tinyint DEFAULT '0' COMMENT '0=Active, 1=Cancelled',
  `ent_date` date NOT NULL,
  `ent_time` time NOT NULL,
  `ent_uid` int NOT NULL COMMENT 'Entry user ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_no` (`req_no`),
  KEY `deal` (`deal_id`),
  KEY `status` (`pr_status`),
  KEY `po` (`po_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Purchase Request Header';

/*Data for the table `prod_purchase_request` */

/*Table structure for table `prod_purchase_request_counter` */

DROP TABLE IF EXISTS `prod_purchase_request_counter`;

CREATE TABLE `prod_purchase_request_counter` (
  `id` int NOT NULL DEFAULT '1',
  `last_req_no` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_purchase_request_counter` */

/*Table structure for table `prod_purchase_request_details` */

DROP TABLE IF EXISTS `prod_purchase_request_details`;

CREATE TABLE `prod_purchase_request_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pr_id` int NOT NULL COMMENT 'Foreign key to prod_purchase_request',
  `prods_id` int NOT NULL COMMENT 'Product ID',
  `pack` int DEFAULT '1' COMMENT 'Number of packs',
  `qtypack` int DEFAULT '1' COMMENT 'Quantity per pack',
  `quantity` int NOT NULL COMMENT 'Total quantity requested',
  `free` int DEFAULT '0' COMMENT 'Free quantity expected',
  `rate` decimal(15,2) DEFAULT '0.00' COMMENT 'Expected cost per unit',
  `mrp` decimal(15,2) DEFAULT '0.00' COMMENT 'Expected MRP',
  `total` decimal(15,2) DEFAULT '0.00' COMMENT 'Line total',
  `tax` decimal(5,2) DEFAULT '0.00' COMMENT 'Tax percentage',
  `tax_amt` decimal(15,2) DEFAULT '0.00' COMMENT 'Tax amount',
  `disc_per` decimal(5,2) DEFAULT '0.00' COMMENT 'Discount percentage',
  `disc_amt` decimal(15,2) DEFAULT '0.00' COMMENT 'Discount amount',
  `net` decimal(15,2) DEFAULT '0.00' COMMENT 'Net amount',
  `notes` text COMMENT 'Item notes',
  PRIMARY KEY (`id`),
  KEY `idx_pr_id` (`pr_id`),
  KEY `idx_prods_id` (`prods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Purchase Request Line Items';

/*Data for the table `prod_purchase_request_details` */

/*Table structure for table `prod_purchase_return` */

DROP TABLE IF EXISTS `prod_purchase_return`;

CREATE TABLE `prod_purchase_return` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `return_no` varchar(50) DEFAULT NULL,
  `purchase_id` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `total` double DEFAULT '0',
  `notes` text,
  `uid` int NOT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_purchase_return` */

/*Table structure for table `prod_purchase_return_details` */

DROP TABLE IF EXISTS `prod_purchase_return_details`;

CREATE TABLE `prod_purchase_return_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int NOT NULL,
  `purchase_detail_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` double DEFAULT '0',
  `rate` double DEFAULT '0',
  `total` double DEFAULT '0',
  `uid` int NOT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_id` (`return_id`),
  KEY `purchase_detail_id` (`purchase_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_purchase_return_details` */

/*Table structure for table `prod_purchase_supplier_payment` */

DROP TABLE IF EXISTS `prod_purchase_supplier_payment`;

CREATE TABLE `prod_purchase_supplier_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `prid` int NOT NULL,
  `deal_id` int NOT NULL,
  `total` double(10,2) DEFAULT NULL,
  `paid` double(10,2) DEFAULT NULL,
  `balance` double(10,2) DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prid` (`prid`),
  KEY `deal` (`deal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `prod_purchase_supplier_payment` */

insert  into `prod_purchase_supplier_payment`(`id`,`prid`,`deal_id`,`total`,`paid`,`balance`,`is_active`) values 
(1,1,1,10974.00,0.00,10974.00,1),
(2,2,1,12980.00,0.00,12980.00,1),
(3,3,8,4480.00,4480.00,0.00,1);

/*Table structure for table `prod_purchase_supplier_payment_details` */

DROP TABLE IF EXISTS `prod_purchase_supplier_payment_details`;

CREATE TABLE `prod_purchase_supplier_payment_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `supPayId` int NOT NULL,
  `payable` double(10,2) DEFAULT NULL,
  `paid` double(10,2) DEFAULT NULL,
  `balance` double(10,2) DEFAULT NULL,
  `pay_type` int DEFAULT NULL,
  `pay_mode` int DEFAULT '0',
  `uid` int DEFAULT NULL,
  `notes` text,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payId` (`supPayId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `prod_purchase_supplier_payment_details` */

insert  into `prod_purchase_supplier_payment_details`(`id`,`supPayId`,`payable`,`paid`,`balance`,`pay_type`,`pay_mode`,`uid`,`notes`,`date`,`time`) values 
(1,1,10974.00,0.00,10974.00,1,0,26,'Payment for Purchase Bill','2026-10-17','14:21:05'),
(2,2,12980.00,0.00,12980.00,1,0,26,'Payment for Purchase Bill','2026-10-17','20:37:39'),
(3,3,4480.00,4480.00,0.00,0,1,26,'Payment for Purchase Bill','2026-10-21','13:20:51');

/*Table structure for table `prod_quotation` */

DROP TABLE IF EXISTS `prod_quotation`;

CREATE TABLE `prod_quotation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bill_display` varchar(255) NOT NULL,
  `total` double(10,3) DEFAULT '0.000',
  `prodDisc` double(10,3) DEFAULT '0.000',
  `extraDisc` double(10,3) DEFAULT '0.000',
  `payable` double(10,3) DEFAULT '0.000',
  `is_billed` int DEFAULT '0',
  `is_cancelled` int DEFAULT '0',
  `cusName` varchar(255) DEFAULT NULL,
  `cusPhn` varchar(255) DEFAULT NULL,
  `customerId` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `is_tax_bill` tinyint NOT NULL DEFAULT '1',
  `is_commission` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_quotation` */

/*Table structure for table `prod_quotation_details` */

DROP TABLE IF EXISTS `prod_quotation_details`;

CREATE TABLE `prod_quotation_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quot_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `price` double(10,3) NOT NULL,
  `disc` double(10,3) DEFAULT NULL,
  `total` double(10,3) DEFAULT NULL,
  `gst` int DEFAULT NULL,
  `is_cancelled` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_quotation_details` */

/*Table structure for table `prod_stock_adjustment` */

DROP TABLE IF EXISTS `prod_stock_adjustment`;

CREATE TABLE `prod_stock_adjustment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `batch_id` int NOT NULL,
  `stockType` int NOT NULL COMMENT '1=add 2=minus',
  `stock` decimal(10,2) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `notes` text,
  `uid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prod` (`product_id`),
  KEY `batch` (`batch_id`),
  KEY `stock` (`stockType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `prod_stock_adjustment` */

insert  into `prod_stock_adjustment`(`id`,`product_id`,`batch_id`,`stockType`,`stock`,`date`,`time`,`notes`,`uid`) values 
(1,1,1,1,9.00,'2026-10-17','14:22:02','Adding Stock - OLD STOCK',26),
(2,60,60,2,1.00,'2026-10-18','12:40:41','Removing Stock - OLD STOCK',26),
(3,146,146,1,2.00,'2026-10-18','16:16:14','Adding Stock - OLD STOCK',26);

/*Table structure for table `prod_stock_totals` */

DROP TABLE IF EXISTS `prod_stock_totals`;

CREATE TABLE `prod_stock_totals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `prods_id` int unsigned NOT NULL DEFAULT '0',
  `stock` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `rack` char(1) NOT NULL DEFAULT '',
  `shelf` int NOT NULL DEFAULT '0',
  `userlog` text,
  `extra1` tinyint unsigned DEFAULT '0',
  `extra2` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `store_id_index` (`prods_id`),
  KEY `stock` (`stock`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `prod_stock_totals` */

insert  into `prod_stock_totals`(`id`,`prods_id`,`stock`,`rack`,`shelf`,`userlog`,`extra1`,`extra2`) values 
(1,1,10.00,'',0,'While Stock Added Through Purchase Entry',0,0),
(2,2,10.00,'',0,'While Stock Added Through Purchase Entry',0,0),
(3,39,4.00,'',0,'While Stock Added Through Purchase Entry',0,0);

/*Table structure for table `prod_supplier` */

DROP TABLE IF EXISTS `prod_supplier`;

CREATE TABLE `prod_supplier` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `is_active` int DEFAULT '1',
  `gstin` varchar(255) DEFAULT NULL,
  `is_gst` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `prod_supplier` */

insert  into `prod_supplier`(`id`,`name`,`phone_number`,`description`,`date`,`time`,`is_active`,`gstin`,`is_gst`) values 
(1,'JK BATTERY','9443132896','TIRUNELVELI','2026-10-17','14:17:56',1,'',0),
(2,'MORDEN','9442322233','','2026-10-17','14:18:28',1,'',0),
(3,'SUN POWER','9842930626','','2026-10-18','18:28:18',1,'',0),
(4,'ANNANI SCALE','9444327536','','2026-10-18','18:29:51',1,'',0),
(5,'EURO SMILE RO','9551419166','','2026-10-18','18:30:24',1,'',0),
(6,'AYYA MARKETING  V GUARD','9965573249','','2026-10-18','18:31:02',1,'',0),
(7,'AYYA MARKETING USHA','6369008906','','2026-10-18','18:31:24',1,'',0),
(8,'SRI VENKATESWARA','04632226931','16 MATHANKOIL STREET \nKOVILPATTI','2026-10-21','13:15:54',1,'',0);

/*Table structure for table `prod_supplier_cheque_allocation` */

DROP TABLE IF EXISTS `prod_supplier_cheque_allocation`;

CREATE TABLE `prod_supplier_cheque_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cheque_id` int NOT NULL,
  `purchase_id` int NOT NULL,
  `allocated_amount` decimal(10,2) NOT NULL,
  `allocated_date` date NOT NULL,
  `allocated_time` time NOT NULL,
  `allocated_uid` int NOT NULL,
  `due_date` date DEFAULT NULL,
  `credit_days` int DEFAULT '10',
  `status` varchar(20) NOT NULL DEFAULT 'ALLOCATED',
  `cleared_date` date DEFAULT NULL,
  `cleared_time` time DEFAULT NULL,
  `cleared_uid` int DEFAULT NULL,
  `is_reversed` tinyint(1) DEFAULT '0',
  `reversed_date` date DEFAULT NULL,
  `reversed_time` time DEFAULT NULL,
  `reversed_uid` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_cheque` (`cheque_id`),
  KEY `idx_purchase` (`purchase_id`),
  KEY `idx_status` (`status`),
  KEY `idx_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_supplier_cheque_allocation` */

/*Table structure for table `prod_supplier_cheque_events` */

DROP TABLE IF EXISTS `prod_supplier_cheque_events`;

CREATE TABLE `prod_supplier_cheque_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cheque_id` int NOT NULL,
  `event_type` varchar(20) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `event_uid` int NOT NULL,
  `reason` text,
  PRIMARY KEY (`id`),
  KEY `idx_cheque` (`cheque_id`),
  KEY `idx_event_type` (`event_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_supplier_cheque_events` */

/*Table structure for table `prod_supplier_cheque_stock` */

DROP TABLE IF EXISTS `prod_supplier_cheque_stock`;

CREATE TABLE `prod_supplier_cheque_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `cheque_number` varchar(255) NOT NULL,
  `bank_name` text,
  `entry_date` date NOT NULL,
  `entry_time` time NOT NULL,
  `entry_uid` int NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'AVAILABLE',
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_supplier` (`supplier_id`),
  KEY `idx_status` (`status`),
  KEY `idx_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_supplier_cheque_stock` */

/*Table structure for table `prod_supplier_due` */

DROP TABLE IF EXISTS `prod_supplier_due`;

CREATE TABLE `prod_supplier_due` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `cash_paid` decimal(12,2) NOT NULL DEFAULT '0.00',
  `bank_paid` decimal(12,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  `pay_mode` tinyint NOT NULL DEFAULT '1',
  `pay_type` tinyint NOT NULL DEFAULT '0',
  `txn_type` varchar(20) NOT NULL DEFAULT 'COLLECTION',
  `notes` varchar(255) DEFAULT NULL,
  `uid` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_supplier` (`supplier_id`),
  KEY `idx_txn_type` (`txn_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_supplier_due` */

/*Table structure for table `prod_units` */

DROP TABLE IF EXISTS `prod_units`;

CREATE TABLE `prod_units` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `convertion_unit` varchar(255) DEFAULT NULL,
  `convertion_calculation` decimal(10,2) DEFAULT NULL,
  `is_active` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prod_units` */

insert  into `prod_units`(`id`,`name`,`convertion_unit`,`convertion_calculation`,`is_active`) values 
(1,'NOS',NULL,NULL,1),
(2,'Gram',NULL,NULL,1),
(3,'KG',NULL,NULL,1),
(4,'Meter',NULL,NULL,1),
(5,'length','Feet',20.00,1);

/*Table structure for table `sales_area` */

DROP TABLE IF EXISTS `sales_area`;

CREATE TABLE `sales_area` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sales_area` */

/*Table structure for table `sales_man` */

DROP TABLE IF EXISTS `sales_man`;

CREATE TABLE `sales_man` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` int DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sales_man` */

/*Table structure for table `special_permission` */

DROP TABLE IF EXISTS `special_permission`;

CREATE TABLE `special_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `special_permission` */

insert  into `special_permission`(`id`,`content`) values 
(1,'allow to Zero stock billing ');

/*Table structure for table `supplier_account` */

DROP TABLE IF EXISTS `supplier_account`;

CREATE TABLE `supplier_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `advance` decimal(12,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `supplier_account` */

insert  into `supplier_account`(`id`,`supplier_id`,`advance`,`balance`) values 
(1,1,0.00,23954.00),
(2,2,0.00,0.00),
(3,3,0.00,0.00),
(4,4,0.00,0.00),
(5,5,0.00,0.00),
(6,6,0.00,0.00),
(7,7,0.00,0.00),
(8,8,0.00,0.00);

/*Table structure for table `user_modules` */

DROP TABLE IF EXISTS `user_modules`;

CREATE TABLE `user_modules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `user_modules` */

insert  into `user_modules`(`id`,`module_name`) values 
(1,'Billing'),
(2,'Master'),
(3,'Inventory'),
(4,'Stock Reports'),
(5,'Account Report'),
(6,'Statistics'),
(7,'Credit Management'),
(8,'Expense'),
(9,'Admin');

/*Table structure for table `user_permission` */

DROP TABLE IF EXISTS `user_permission`;

CREATE TABLE `user_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int NOT NULL,
  `uid` int NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mod` (`module_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;

/*Data for the table `user_permission` */

insert  into `user_permission`(`id`,`module_id`,`uid`,`date`,`time`) values 
(70,1,1,'2025-09-19','11:43:23'),
(71,2,1,'2025-09-19','11:43:23'),
(72,3,1,'2025-09-19','11:43:23'),
(73,4,1,'2025-09-19','11:43:23'),
(74,5,1,'2025-09-19','11:43:23'),
(75,6,1,'2025-09-19','11:43:23'),
(76,7,1,'2025-09-19','11:43:23'),
(77,8,1,'2025-09-19','11:43:23'),
(81,9,1,'2025-09-19','11:51:25'),
(122,1,26,'2026-10-17','14:09:29'),
(123,2,26,'2026-10-17','14:09:29'),
(124,3,26,'2026-10-17','14:09:29'),
(125,4,26,'2026-10-17','14:09:29'),
(126,5,26,'2026-10-17','14:09:29'),
(127,6,26,'2026-10-17','14:09:29'),
(128,7,26,'2026-10-17','14:09:29'),
(129,8,26,'2026-10-17','14:09:29'),
(130,9,26,'2026-10-17','14:09:29'),
(131,1,27,'2026-10-17','21:03:15'),
(132,2,27,'2026-10-17','21:03:15'),
(133,3,27,'2026-10-17','21:03:15'),
(134,4,27,'2026-10-17','21:03:15'),
(135,5,27,'2026-10-17','21:03:15'),
(136,6,27,'2026-10-17','21:03:15'),
(137,7,27,'2026-10-17','21:03:15'),
(138,8,27,'2026-10-17','21:03:15'),
(139,9,27,'2026-10-17','21:03:15');

/*Table structure for table `user_special_permission` */

DROP TABLE IF EXISTS `user_special_permission`;

CREATE TABLE `user_special_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user_special_permission` */

insert  into `user_special_permission`(`id`,`content_id`,`user_id`) values 
(3,1,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` int DEFAULT '1',
  `fullName` varchar(255) DEFAULT NULL,
  `disc_per` int DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`user_name`,`password`,`is_active`,`fullName`,`disc_per`) values 
(1,'admin','aecbf9a63cec1e93327dfc212f31acdb31c4f5d10bedccf8fbb8b042a6f0f39155797bdd04517905ae5d98b69fdc452cdb61b018e10939740ec96f36e133d639',1,'admin',50),
(26,'friends','a7e704f99c78e5eccfbd65e3c50a0e8f871969658c27c1c1b0fa104a332478f754e89d7c65778be6a7450f55f70e02513e071ac2e3d1481896b386eda3fd6fbf',1,'friends',100),
(27,'VINCY','a7e704f99c78e5eccfbd65e3c50a0e8f871969658c27c1c1b0fa104a332478f754e89d7c65778be6a7450f55f70e02513e071ac2e3d1481896b386eda3fd6fbf',1,'VINCY',100);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
