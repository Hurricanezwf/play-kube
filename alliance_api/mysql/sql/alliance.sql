-- MySQL dump 10.11
--
-- Host: 115.231.98.84    Database: alliance
-- ------------------------------------------------------
-- Server version	5.0.51b-debug-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_req`
--

DROP TABLE IF EXISTS `account_req`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `account_req` (
  `id` int(11) NOT NULL auto_increment,
  `channel` varchar(32) NOT NULL,
  `account_num` int(10) unsigned NOT NULL,
  `prefix` varchar(20) NOT NULL,
  `created_time` datetime NOT NULL,
  `finished_time` datetime default NULL,
  `status` enum('created','finished','failed') NOT NULL default 'created',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alliance_bill`
--

DROP TABLE IF EXISTS `alliance_bill`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `alliance_bill` (
  `id` int(10) NOT NULL auto_increment,
  `record_time` datetime NOT NULL,
  `channel` varchar(255) NOT NULL,
  `action_id_start` int(10) NOT NULL,
  `action_id_end` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alliance_credit_action`
--

DROP TABLE IF EXISTS `alliance_credit_action`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `alliance_credit_action` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type` int(8) unsigned NOT NULL COMMENT '1 - 存入礼券，2 - 消费礼券',
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `credit_point` int(10) NOT NULL default '0',
  `data_num` int(10) unsigned NOT NULL default '0',
  `action_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `remark` varchar(2048) NOT NULL default '',
  `hangup_time` int(10) unsigned NOT NULL,
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=237029 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alliance_gift`
--

DROP TABLE IF EXISTS `alliance_gift`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `alliance_gift` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` text NOT NULL,
  `img_url` text NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '100',
  `price` int(10) unsigned NOT NULL,
  `stock` int(10) unsigned NOT NULL default '100',
  `status` int(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100030 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alliance_order`
--

DROP TABLE IF EXISTS `alliance_order`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `alliance_order` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `gift_id` int(10) unsigned NOT NULL,
  `mobile` varchar(31) NOT NULL,
  `province` varchar(255) NOT NULL default '',
  `city` varchar(255) NOT NULL default '',
  `address` varchar(2048) NOT NULL default '',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `record_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `status` int(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alliance_user`
--

DROP TABLE IF EXISTS `alliance_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `alliance_user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `password` varchar(2048) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(31) NOT NULL,
  `province` varchar(255) NOT NULL default '',
  `city` varchar(255) NOT NULL default '',
  `address` varchar(2048) NOT NULL default '',
  `qq` varchar(31) NOT NULL default '',
  `valid` tinyint(1) NOT NULL default '0',
  `update_time` timestamp NOT NULL default '2014-01-01 05:00:00',
  `record_time` timestamp NOT NULL default '2014-01-01 05:00:00',
  `channel` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=629449 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alliance_user_ext`
--

DROP TABLE IF EXISTS `alliance_user_ext`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `alliance_user_ext` (
  `id` int(10) unsigned NOT NULL default '0',
  `recom_token` varchar(256) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `recom_token` (`recom_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alliance_user_recom_stats`
--

DROP TABLE IF EXISTS `alliance_user_recom_stats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `alliance_user_recom_stats` (
  `id` int(10) unsigned NOT NULL default '0',
  `recom_user_id` int(10) unsigned NOT NULL,
  `record_time` timestamp NOT NULL default '2014-01-01 05:00:00',
  `valid` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics`
--

DROP TABLE IF EXISTS `client_statistics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=MyISAM AUTO_INCREMENT=266380 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201411`
--

DROP TABLE IF EXISTS `client_statistics_shard_201411`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201411` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5080 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201412`
--

DROP TABLE IF EXISTS `client_statistics_shard_201412`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201412` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=16339 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201501`
--

DROP TABLE IF EXISTS `client_statistics_shard_201501`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201501` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=50672 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201502`
--

DROP TABLE IF EXISTS `client_statistics_shard_201502`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201502` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=41304 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201503`
--

DROP TABLE IF EXISTS `client_statistics_shard_201503`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201503` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=32777 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201504`
--

DROP TABLE IF EXISTS `client_statistics_shard_201504`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201504` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=37900 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201505`
--

DROP TABLE IF EXISTS `client_statistics_shard_201505`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201505` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=56625 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201506`
--

DROP TABLE IF EXISTS `client_statistics_shard_201506`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201506` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`),
  KEY `data_time` (`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=240788 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201507`
--

DROP TABLE IF EXISTS `client_statistics_shard_201507`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201507` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201508`
--

DROP TABLE IF EXISTS `client_statistics_shard_201508`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201508` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201509`
--

DROP TABLE IF EXISTS `client_statistics_shard_201509`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201509` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201510`
--

DROP TABLE IF EXISTS `client_statistics_shard_201510`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201510` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_statistics_shard_201511`
--

DROP TABLE IF EXISTS `client_statistics_shard_201511`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `client_statistics_shard_201511` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `task_num` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `credit_factor`
--

DROP TABLE IF EXISTS `credit_factor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `credit_factor` (
  `province_id` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `isp_id` int(10) unsigned NOT NULL,
  `factor` float NOT NULL,
  UNIQUE KEY `id` (`province_id`,`city_id`,`isp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mobile_client_statistics`
--

DROP TABLE IF EXISTS `mobile_client_statistics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mobile_client_statistics` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned default NULL,
  `data_time` datetime default NULL,
  `hangup_time` int(10) unsigned NOT NULL,
  `credit_point` int(10) unsigned NOT NULL default '0',
  `wifi_tasknum` int(10) unsigned NOT NULL default '0',
  `g2_flow` int(10) unsigned NOT NULL default '0',
  `g3_flow` int(10) unsigned NOT NULL default '0',
  `g4_flow` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_id` (`client_id`,`data_time`),
  KEY `user_data` (`user_id`,`data_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-13  7:56:38
