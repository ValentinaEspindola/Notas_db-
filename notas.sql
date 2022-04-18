--
-- tirame notas db si existe y volvela a levantar
--

DROP DATABASE IF EXISTS notasdb;
CREATE DATABASE notasdb;
USE notasdb;
--
-- tirame la tabla usuarios si existe y volvela a levantar
--
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT null,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`id`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- hago los insert para llenar la tabla usuarios
--


INSERT INTO `users` VALUES 
(1, 'Valentina', 'vce@hotmail.com'),
(2, 'Victoria', 'vae@hotmail.com'),
(3, 'Ignacio', 'nacho123@hotmail.com'), 
(4, 'Xaviera', 'xryal3@zimbio.com'), 
(5, 'Madison', 'msabate4@marketwatch.com'), 
(6, 'Yevette', 'ybolton5@timesonline.co.uk'),
(7, 'Xixa', 'xixa@online.co.uk'),
(8, 'Orlando', 'orlando@zimbo.co.uk'),
(9, 'Aixa', 'aixa@hotmail.co.uk');


--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL,
  `name` VARCHAR(100) not null, 
  PRIMARY KEY (`id`)
  
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Dumping data for table `category`
--


INSERT INTO `category` values (1, 'Contabilidad'),(2,'Musica'),(3, 'Economia'),(4, 'Interes general'),(5, 'Derecho'),(6, 'Quehaceres'),(7, 'Gimnasia'),(8, 'Ropa'),(9, 'Recordatorios'), (10, 'Lugares');




--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;

CREATE TABLE `notas` (
  `id` int(10) unsigned NOT null,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deletable` tinyint,  
  `users_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notas_users_id_foreign` (`users_id`),
  CONSTRAINT `notas_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) 

ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Dumping data for table `notas`
--
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO notasdb.notas
(id, title, content, created_at, updated_at, deletable, users_id)
VALUES (1, 'Day of the Wacko (Dzien swira)', 'Implemented intermediate parallelism', '2021-12-20 09:25:38', '2021-06-25 05:06:37',1, 1),(2, 'Stone Reader', 'Phased holistic emulation', '2021-07-10 17:13:18', '2021-04-24 03:30:46',1 , 2), (3, 'Canciones', 'Cross-group cohesive toolset', '2021-07-16 16:55:50', '2021-10-30 10:10:01',1 , 3),(4, 'Hacer tarea de contabilidad 1', 'Digitized empowering migration', '2021-04-25 14:00:11', '2021-10-06 18:42:07',1,4),(5, 'Hacer tp de contabilidad y eco', 'Devolved fresh-thinking Graphic Interface', '2021-11-22 23:45:09', '2021-06-08 05:46:01',1, 5),
(6, 'Canciones de Shazam', 'Fundamental didactic pricing structure', '2022-03-30 16:37:13', '2022-01-18 01:17:06',1, 6),(7, 'Resumen de economia', 'Open-architected multi-state artificial intelligence', '2021-09-03 05:45:12', '2021-05-13 15:27:15',1, 7),(8, 'Junk Mail (Budbringeren)', 'Focused disintermediate matrix', '2021-05-24 17:03:11', '2021-06-24 06:44:24',1,8),(9, 'Get Out of My Room', 'Inverse client-server process improvement', '2022-03-09 19:37:28', '2021-09-30 03:33:52',1,9),(10, 'Village People', 'Fully-configurable incremental emulation', '2021-09-13 01:18:01', '2021-08-30 09:25:49',1, 10);
SET FOREIGN_KEY_CHECKS = 1;



DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `id` int(10) unsigned NOT null,
  `accion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,  
  `notas_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `register_notas_id_foreign` (`notas_id`),
  CONSTRAINT `register_notas_id_foreign` FOREIGN KEY (`notas_id`) REFERENCES `notas` (`id`)
) 

ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Dumping data for table `notas`
--
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO notasdb.register
(id, accion, notas_id)
VALUES (1, 'Creada', 2),(2, 'Eliminada', 3), (3, 'Actualizada', 8),(4, 'Eliminada', 3),(5, 'Actualizada', 4),(6, 'Actualizada', 7),(7, 'Actualizada', 5),(8, 'Actualizada', 9),(9 , 'Actualizada', 1),(10, 'Eliminada', 1);
SET FOREIGN_KEY_CHECKS = 1;

--
-- Table structure for table pivot `notas_category`
--

DROP TABLE IF EXISTS `notas_category`;

CREATE TABLE `notas_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notas_id` int(10) unsigned NOT NULL,
  `category_id`int(10) unsigned NOT NULL,
  
  PRIMARY KEY (`id`),
  KEY `notas_category_notas_id_foreign` (`notas_id`),
  KEY `notas_category_category_id_foreign` (`category_id`),
  CONSTRAINT `notas_category_notas_id_foreignn` FOREIGN KEY (`notas_id`) REFERENCES `notas` (`id`),
  CONSTRAINT `notas_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Dumping data for table `episodes`
--
INSERT INTO notasdb.notas_category
(id, notas_id, category_id)
VALUES (1, 3, 2),(2, 6, 2),(3,4,1),(4, 5, 1),(5, 5, 3),(6, 7, 3),(7, 8, 4),(8, 10, 4), (9, 2, 4), (10, 1, 4);
