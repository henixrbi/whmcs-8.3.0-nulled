/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `tblusage_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblusage_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rel_id` int(11) NOT NULL DEFAULT '0',
  `module_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `metric` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `included` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `is_hidden` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblusage_items_rel_type_id` (`rel_type`,`rel_id`),
  KEY `tblusage_items_module_type` (`module_type`),
  KEY `tblusage_items_module` (`module`),
  KEY `tblusage_items_metric` (`metric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;