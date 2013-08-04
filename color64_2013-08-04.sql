# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.67)
# Database: color64
# Generation Time: 2013-08-04 22:56:20 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `lines_msg` int(11) NOT NULL DEFAULT '100',
  `cols_line` int(11) NOT NULL DEFAULT '38',
  `max_msgs` int(11) NOT NULL DEFAULT '200',
  `max_pswds` int(11) NOT NULL DEFAULT '999',
  `min_blks_cycle_msgs` int(11) NOT NULL DEFAULT '1',
  `min_blks_allow_ups` int(11) NOT NULL DEFAULT '75',
  `max_dls_per_call` int(11) NOT NULL DEFAULT '99',
  `dl_creds_per_up` int(11) NOT NULL DEFAULT '1',
  `new_mbr_dl_creds` int(11) NOT NULL DEFAULT '100',
  `credit_exempt_lvl` int(11) NOT NULL DEFAULT '5',
  `days_hold_mail` int(11) NOT NULL DEFAULT '90',
  `new_lvl` int(11) NOT NULL DEFAULT '1',
  `expired_lvl` int(11) NOT NULL DEFAULT '2',
  `save_caller_log` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;

INSERT INTO `log` (`id`, `user_id`, `user_name`, `date`, `updated`)
VALUES
	(152,4,'JAZZY JAY',1345577858,'2012-08-21 15:37:38'),
	(153,18,'JAKUB',1363186715,'2013-03-13 10:58:35'),
	(154,26,'HÃ¥KAN MEDIN',1366287470,'2013-04-18 08:17:50'),
	(155,36,'SHUN MATSUOKA',1369330430,'2013-05-23 13:33:50'),
	(156,46,'BEN DOVER',1373929257,'2013-07-15 19:00:57'),
	(157,3,'ADRIEL ICKLER',1374963426,'2013-07-27 18:17:06');

/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `real_name` varchar(64) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(12) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `computer` varchar(255) DEFAULT NULL,
  `lvl` int(12) DEFAULT NULL,
  `expr` date DEFAULT NULL,
  `dnlds` int(12) DEFAULT NULL,
  `uplds` int(12) DEFAULT NULL,
  `no_calls` int(12) DEFAULT NULL,
  `last_call` date DEFAULT NULL,
  `baud` int(12) DEFAULT NULL,
  `w_w` int(12) DEFAULT NULL,
  `blk` int(12) DEFAULT NULL,
  `msg` int(12) DEFAULT NULL,
  `time` int(12) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `password`, `real_name`, `address`, `city`, `state`, `zip`, `phone`, `computer`, `lvl`, `expr`, `dnlds`, `uplds`, `no_calls`, `last_call`, `baud`, `w_w`, `blk`, `msg`, `time`, `updated`)
VALUES
	(1,'SYSOP','786c1eb21b21e89d652c9843ad5abb9f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-07-27',NULL,NULL,NULL,NULL,NULL,'2013-07-27 18:17:06');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
