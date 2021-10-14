/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `tblpricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpricing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` enum('product','addon','configoptions','domainregister','domaintransfer','domainrenew','domainaddons', 'usage') COLLATE utf8_unicode_ci NOT NULL,
  `currency` int(10) NOT NULL,
  `relid` int(10) NOT NULL,
  `msetupfee` decimal(16,2) NOT NULL,
  `qsetupfee` decimal(16,2) NOT NULL,
  `ssetupfee` decimal(16,2) NOT NULL,
  `asetupfee` decimal(16,2) NOT NULL,
  `bsetupfee` decimal(16,2) NOT NULL,
  `tsetupfee` decimal(16,2) NOT NULL,
  `monthly` decimal(16,2) NOT NULL,
  `quarterly` decimal(16,2) NOT NULL,
  `semiannually` decimal(16,2) NOT NULL,
  `annually` decimal(16,2) NOT NULL,
  `biennially` decimal(16,2) NOT NULL,
  `triennially` decimal(16,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pricing_relid_idx` (`relid`),
  KEY `pricing_currency_idx` (`currency`),
  KEY `pricing_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

