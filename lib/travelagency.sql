-- Adminer 4.8.0 MySQL 5.7.35-log dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `ta_customer`;
CREATE TABLE `ta_customer` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `dateCreation` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  `version` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

TRUNCATE `ta_customer`;
INSERT INTO `ta_customer` (`id`, `name`, `last_name`, `dateCreation`, `lastModified`, `version`) VALUES
(1,	'Иван',	'Иванов',	'2022-05-25 23:15:33',	'2022-05-25 23:15:33',	1),
(2,	'Анна',	'Ивлеева',	'2022-05-25 23:16:13',	'2022-05-25 23:16:13',	1),
(3,	'Петр',	'Верзило',	'2022-05-25 23:16:41',	'2022-05-25 23:16:41',	1),
(4,	'Петр',	'Киркоров',	'2022-05-26 12:00:52',	'2022-05-26 12:00:52',	1),
(5,	'Виктория',	'Давидова',	'2022-05-26 12:01:27',	'2022-05-26 12:01:27',	1);

DROP TABLE IF EXISTS `ta_order`;
CREATE TABLE `ta_order` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `date_creation` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `ta_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `ta_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

TRUNCATE `ta_order`;
INSERT INTO `ta_order` (`id`, `customer_id`, `description`, `completed`, `date_creation`, `last_modified`, `version`) VALUES
(1,	4,	'Срочный заказ',	0,	'2022-05-26 12:02:59',	'2022-05-26 12:02:59',	1),
(2,	2,	'Максимально лакшери',	1,	'2022-05-26 12:03:44',	'2022-05-26 12:03:44',	1),
(3,	1,	'Обычный',	0,	'2022-05-26 12:04:35',	'2022-05-26 12:04:35',	1);

DROP TABLE IF EXISTS `ta_travel`;
CREATE TABLE `ta_travel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `type` varchar(30) NOT NULL,
  `country_from` varchar(30) NOT NULL,
  `country_to` varchar(30) NOT NULL,
  `days` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `ta_travel_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `ta_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

TRUNCATE `ta_travel`;
INSERT INTO `ta_travel` (`id`, `order_id`, `price`, `type`, `country_from`, `country_to`, `days`) VALUES
(1,	1,	605,	'all inclusive',	'Беларусь',	'Турция',	7),
(2,	2,	380,	'shopping',	'Беларусь',	'Ирак',	2),
(3,	3,	1200,	'all inclusive',	'Украина',	'Монголия',	21);

-- 2022-05-26 11:36:24
