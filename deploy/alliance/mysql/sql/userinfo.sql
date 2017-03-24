-- MySQL dump 10.11
--
-- Host: 115.231.98.84    Database: userinfo
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
-- Table structure for table `channelSuffixInfo`
--

CREATE DATABASE IF NOT EXISTS `userinfo`;
use userinfo;

DROP TABLE IF EXISTS `channelSuffixInfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `channelSuffixInfo` (
  `channel` varchar(32) NOT NULL default '',
  `channel_name` varchar(300) default NULL,
  `suffix_name` varchar(300) default NULL,
  PRIMARY KEY  (`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clientEstimateProfitInfo`
--

DROP TABLE IF EXISTS `clientEstimateProfitInfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clientEstimateProfitInfo` (
  `id` int(11) NOT NULL auto_increment,
  `province_id` int(11) NOT NULL,
  `data_time` datetime default NULL,
  `estimate_score` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `province_id` (`province_id`,`data_time`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clientTypeInfo`
--

DROP TABLE IF EXISTS `clientTypeInfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clientTypeInfo` (
  `type_name` varchar(32) NOT NULL,
  `private_num` int(11) NOT NULL default '0',
  PRIMARY KEY  (`type_name`,`private_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clientUpdateRecordRaws`
--

DROP TABLE IF EXISTS `clientUpdateRecordRaws`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clientUpdateRecordRaws` (
  `client_code` int(11) NOT NULL default '0',
  `data_time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`client_code`,`data_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mediaChannelSuffixInfo`
--

DROP TABLE IF EXISTS `mediaChannelSuffixInfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mediaChannelSuffixInfo` (
  `channel` varchar(32) NOT NULL default '',
  `channel_name` varchar(300) default NULL,
  `suffix_name` varchar(300) default NULL,
  PRIMARY KEY  (`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mediaClientsDAURaws`
--

DROP TABLE IF EXISTS `mediaClientsDAURaws`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mediaClientsDAURaws` (
  `id` int(11) NOT NULL auto_increment,
  `client_code` int(11) NOT NULL default '0',
  `data_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `country_id` char(2) NOT NULL default 'CN',
  `province_id` int(11) default NULL,
  `city_id` int(11) default NULL,
  `isp_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `client_code` (`client_code`,`data_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mediaEstimateProfitInfo`
--

DROP TABLE IF EXISTS `mediaEstimateProfitInfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mediaEstimateProfitInfo` (
  `id` int(11) NOT NULL auto_increment,
  `province_id` int(11) NOT NULL,
  `data_time` datetime default NULL,
  `estimate_score` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `province_id` (`province_id`,`data_time`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tblWeatherCityInfo`
--

DROP TABLE IF EXISTS `tblWeatherCityInfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblWeatherCityInfo` (
  `city_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `name_ch` char(32) NOT NULL,
  `name_en` char(32) default NULL,
  `region_name` char(64) NOT NULL,
  `weathercity_code` char(16) NOT NULL,
  PRIMARY KEY  (`city_id`),
  KEY `tblCity_province` (`province_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `uecUserInfo`
--

DROP TABLE IF EXISTS `uecUserInfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `uecUserInfo` (
  `client_code` int(11) NOT NULL auto_increment,
  `user_name` char(255) default NULL,
  `mac_name` char(255) default NULL,
  `login_ip` char(255) default NULL,
  `login_time` datetime default NULL,
  `user_id` char(255) default NULL,
  `cpu_freq` int(11) default NULL,
  `mem_size` int(11) default NULL,
  `os_ver` char(15) default NULL,
  `ie_ver` int(11) default NULL,
  `private_num` int(11) default '0',
  `gateway_ip` varchar(45) default NULL,
  `channel` varchar(32) default '',
  `country_id` char(2) NOT NULL default 'CN',
  `province_id` int(11) default NULL,
  `city_id` int(11) default NULL,
  `isp_id` int(11) default NULL,
  PRIMARY KEY  (`client_code`)
) ENGINE=MyISAM AUTO_INCREMENT=115823 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `webClientsDAURaws`
--

DROP TABLE IF EXISTS `webClientsDAURaws`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `webClientsDAURaws` (
  `id` int(11) NOT NULL auto_increment,
  `client_code` int(11) NOT NULL default '0',
  `data_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `country_id` char(2) NOT NULL default 'CN',
  `province_id` int(11) default NULL,
  `city_id` int(11) default NULL,
  `isp_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `client_code` (`client_code`,`data_time`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-14  6:59:01
