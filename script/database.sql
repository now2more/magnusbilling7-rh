-- MariaDB dump 10.19  Distrib 10.5.23-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: mbilling
-- ------------------------------------------------------
-- Server version	10.5.23-MariaDB-0+deb11u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pkg_alarm`
--

DROP TABLE IF EXISTS `pkg_alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `condition` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `period` int(11) DEFAULT NULL,
  `id_plan` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `last_notification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(200) NOT NULL DEFAULT 'MagnusBilling ALARM',
  `message` varchar(1000) NOT NULL DEFAULT 'MagnusBilling ALARM email body, customize',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_alarm`
--

LOCK TABLES `pkg_alarm` WRITE;
/*!40000 ALTER TABLE `pkg_alarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_alarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_api`
--

DROP TABLE IF EXISTS `pkg_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `status` tinyint(11) NOT NULL DEFAULT 1,
  `api_key` varchar(150) NOT NULL,
  `api_secret` varchar(150) NOT NULL,
  `api_restriction_ips` varchar(150) DEFAULT NULL,
  `action` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_api`
--

LOCK TABLES `pkg_api` WRITE;
/*!40000 ALTER TABLE `pkg_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_balance`
--

DROP TABLE IF EXISTS `pkg_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_use` int(2) NOT NULL,
  `id_prefix` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_balance`
--

LOCK TABLES `pkg_balance` WRITE;
/*!40000 ALTER TABLE `pkg_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_boleto`
--

DROP TABLE IF EXISTS `pkg_boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_boleto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` mediumtext NOT NULL,
  `status` varchar(4) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `vencimento` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_boleto` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_boleto` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_boleto`
--

LOCK TABLES `pkg_boleto` WRITE;
/*!40000 ALTER TABLE `pkg_boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_call_chart`
--

DROP TABLE IF EXISTS `pkg_call_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_call_chart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_call_chart`
--

LOCK TABLES `pkg_call_chart` WRITE;
/*!40000 ALTER TABLE `pkg_call_chart` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_call_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_call_online`
--

DROP TABLE IF EXISTS `pkg_call_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_call_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(25) DEFAULT NULL,
  `sip_account` varchar(50) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `canal` varchar(50) DEFAULT NULL,
  `tronco` varchar(50) DEFAULT NULL,
  `ndiscado` varchar(25) DEFAULT '0',
  `codec` varchar(5) NOT NULL,
  `status` varchar(16) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `reinvite` varchar(5) NOT NULL,
  `from_ip` varchar(50) DEFAULT NULL,
  `server` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `starttime` (`status`),
  KEY `fk_pkg_user_pkg_call_online` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_call_online` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_call_online`
--

LOCK TABLES `pkg_call_online` WRITE;
/*!40000 ALTER TABLE `pkg_call_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_call_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_callback`
--

DROP TABLE IF EXISTS `pkg_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_callback` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_did` int(11) NOT NULL,
  `uniqueid` varchar(40) DEFAULT NULL,
  `entry_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(80) DEFAULT NULL,
  `server_ip` varchar(40) DEFAULT NULL,
  `num_attempt` int(11) NOT NULL DEFAULT 0,
  `last_attempt_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `manager_result` varchar(60) DEFAULT NULL,
  `agi_result` varchar(60) DEFAULT NULL,
  `callback_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `channel` varchar(60) DEFAULT NULL,
  `exten` varchar(60) DEFAULT NULL,
  `context` varchar(60) DEFAULT NULL,
  `priority` varchar(60) DEFAULT NULL,
  `application` varchar(60) DEFAULT NULL,
  `data` varchar(60) DEFAULT NULL,
  `timeout` varchar(60) DEFAULT NULL,
  `callerid` varchar(60) DEFAULT NULL,
  `variable` varchar(300) DEFAULT NULL,
  `account` varchar(60) DEFAULT NULL,
  `async` varchar(60) DEFAULT NULL,
  `actionid` varchar(60) DEFAULT NULL,
  `id_server` int(11) DEFAULT NULL,
  `id_server_group` int(11) DEFAULT NULL,
  `sessiontime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pkg_callback_uniqueid_key` (`uniqueid`),
  KEY `fk_pkg_user_pkg_callback` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_callback` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_callback`
--

LOCK TABLES `pkg_callback` WRITE;
/*!40000 ALTER TABLE `pkg_callback` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_callback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_callerid`
--

DROP TABLE IF EXISTS `pkg_callerid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_callerid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` mediumtext DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `activated` char(1) NOT NULL DEFAULT 't',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cons_pkg_callerid_cid` (`cid`),
  KEY `fk_pkg_user_pkg_callerid` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_callerid` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_callerid`
--

LOCK TABLES `pkg_callerid` WRITE;
/*!40000 ALTER TABLE `pkg_callerid` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_callerid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_callshop`
--

DROP TABLE IF EXISTS `pkg_callshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_callshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionid` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `buycost` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `price` decimal(15,5) NOT NULL,
  `price_min` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `calledstation` varchar(50) NOT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sessiontime` int(11) NOT NULL,
  `cabina` varchar(30) NOT NULL,
  `markup` decimal(15,5) NOT NULL DEFAULT 0.00000,
  PRIMARY KEY (`id`),
  KEY `cabina` (`cabina`),
  KEY `fk_pkg_user_pkg_callshop` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_callshop` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_callshop`
--

LOCK TABLES `pkg_callshop` WRITE;
/*!40000 ALTER TABLE `pkg_callshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_callshop` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_sip_status_after_insert` AFTER INSERT ON `pkg_callshop` FOR EACH ROW BEGIN
                    UPDATE pkg_sip SET status = 2 WHERE name = new.cabina;
                END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pkg_campaign`
--

DROP TABLE IF EXISTS `pkg_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_plan` int(11) DEFAULT NULL,
  `name` char(50) NOT NULL,
  `callerid` varchar(100) DEFAULT '',
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `startingdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expirationdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` mediumtext DEFAULT NULL,
  `secondusedreal` int(11) DEFAULT 0,
  `nb_callmade` int(11) DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `frequency` int(11) NOT NULL DEFAULT 0,
  `max_frequency` int(11) NOT NULL DEFAULT 0,
  `forward_number` varchar(160) DEFAULT NULL,
  `daily_start_time` time NOT NULL DEFAULT '10:00:00',
  `daily_stop_time` time NOT NULL DEFAULT '18:00:00',
  `monday` tinyint(4) NOT NULL DEFAULT 1,
  `tuesday` tinyint(4) NOT NULL DEFAULT 1,
  `wednesday` tinyint(4) NOT NULL DEFAULT 1,
  `thursday` tinyint(4) NOT NULL DEFAULT 1,
  `friday` tinyint(4) NOT NULL DEFAULT 1,
  `saturday` tinyint(4) NOT NULL DEFAULT 0,
  `sunday` tinyint(4) NOT NULL DEFAULT 0,
  `audio` varchar(100) DEFAULT NULL,
  `audio_2` varchar(100) DEFAULT NULL,
  `type` int(10) DEFAULT 1,
  `restrict_phone` int(1) NOT NULL DEFAULT 0,
  `enable_max_call` int(1) NOT NULL DEFAULT 0,
  `digit_authorize` smallint(1) NOT NULL DEFAULT 1,
  `tts_audio` varchar(200) DEFAULT NULL,
  `tts_audio2` varchar(200) DEFAULT NULL,
  `asr_audio` varchar(200) DEFAULT NULL,
  `asr_options` varchar(200) DEFAULT NULL,
  `auto_reprocess` int(11) DEFAULT 0,
  `from` varchar(20) DEFAULT NULL,
  `record_call` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_campaign` (`id_user`),
  KEY `fk_pkg_plan_pkg_campaign` (`id_plan`),
  CONSTRAINT `fk_pkg_plan_pkg_campaign` FOREIGN KEY (`id_plan`) REFERENCES `pkg_plan` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_campaign` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign`
--

LOCK TABLES `pkg_campaign` WRITE;
/*!40000 ALTER TABLE `pkg_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_log`
--

DROP TABLE IF EXISTS `pkg_campaign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_campaign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL DEFAULT 0,
  `loops` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `trunks` varchar(200) DEFAULT NULL,
  `campaigns` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_log`
--

LOCK TABLES `pkg_campaign_log` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_phonebook`
--

DROP TABLE IF EXISTS `pkg_campaign_phonebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_campaign_phonebook` (
  `id_campaign` int(11) NOT NULL,
  `id_phonebook` int(11) NOT NULL,
  PRIMARY KEY (`id_campaign`,`id_phonebook`),
  KEY `fk_pkg_campaign_pkg_campaign_phonebook` (`id_campaign`),
  KEY `fk_pkg_phonebook_pkg_campaign_phonebook` (`id_phonebook`),
  CONSTRAINT `fk_pkg_campaign_pkg_campaign_phonebook` FOREIGN KEY (`id_campaign`) REFERENCES `pkg_campaign` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_phonebook_pkg_campaign_phonebook` FOREIGN KEY (`id_phonebook`) REFERENCES `pkg_phonebook` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_phonebook`
--

LOCK TABLES `pkg_campaign_phonebook` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_phonebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_phonebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_poll`
--

DROP TABLE IF EXISTS `pkg_campaign_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_campaign_poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_campaign` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `arq_audio` varchar(100) DEFAULT NULL,
  `ordem_exibicao` int(11) DEFAULT NULL,
  `option0` varchar(300) NOT NULL,
  `option1` varchar(300) NOT NULL,
  `option2` varchar(300) NOT NULL,
  `option3` varchar(300) NOT NULL,
  `option4` varchar(300) NOT NULL,
  `option5` varchar(300) NOT NULL,
  `option6` varchar(300) NOT NULL,
  `option7` varchar(300) NOT NULL,
  `option8` varchar(300) NOT NULL,
  `option9` varchar(300) NOT NULL,
  `digit_authorize` int(1) NOT NULL DEFAULT 1,
  `request_authorize` int(1) NOT NULL DEFAULT 0,
  `repeat` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_campaign_pkg_campaign_poll` (`id_campaign`),
  CONSTRAINT `fk_pkg_campaign_pkg_campaign_poll` FOREIGN KEY (`id_campaign`) REFERENCES `pkg_campaign` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_poll`
--

LOCK TABLES `pkg_campaign_poll` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_poll_info`
--

DROP TABLE IF EXISTS `pkg_campaign_poll_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_campaign_poll_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_campaign_poll` int(11) NOT NULL,
  `resposta` smallint(2) NOT NULL,
  `number` varchar(18) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `obs` varchar(200) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_campaign_poll_pkg_campaign_poll_info` (`id_campaign_poll`),
  KEY `number` (`number`),
  CONSTRAINT `fk_pkg_campaign_poll_pkg_campaign_poll_info` FOREIGN KEY (`id_campaign_poll`) REFERENCES `pkg_campaign_poll` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_poll_info`
--

LOCK TABLES `pkg_campaign_poll_info` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_poll_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_poll_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_report`
--

DROP TABLE IF EXISTS `pkg_campaign_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_campaign_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_campaign` int(11) NOT NULL,
  `id_phonenumber` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_trunk` int(11) NOT NULL,
  `unix_timestamp` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 2,
  PRIMARY KEY (`id`),
  KEY `unix_timestamp` (`unix_timestamp`),
  KEY `fk_pkg_campaign_report_pkg_campaign` (`id_campaign`),
  KEY `fk_pkg_campaign_report_pkg_phonenumber` (`id_phonenumber`),
  KEY `fk_pkg_campaign_report_pkg_user` (`id_user`),
  KEY `fk_pkg_campaign_report_pkg_trunk` (`id_trunk`),
  CONSTRAINT `fk_pkg_campaign_report_pkg_campaign` FOREIGN KEY (`id_campaign`) REFERENCES `pkg_campaign` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_campaign_report_pkg_phonenumber` FOREIGN KEY (`id_phonenumber`) REFERENCES `pkg_phonenumber` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_campaign_report_pkg_trunk` FOREIGN KEY (`id_trunk`) REFERENCES `pkg_trunk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_campaign_report_pkg_user` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_report`
--

LOCK TABLES `pkg_campaign_report` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_restrict_phone`
--

DROP TABLE IF EXISTS `pkg_campaign_restrict_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_campaign_restrict_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_restrict_phone`
--

LOCK TABLES `pkg_campaign_restrict_phone` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_restrict_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_restrict_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr`
--

DROP TABLE IF EXISTS `pkg_cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_plan` int(11) DEFAULT NULL,
  `id_trunk` int(11) DEFAULT NULL,
  `id_server` int(11) DEFAULT NULL,
  `id_prefix` int(11) DEFAULT NULL,
  `id_campaign` int(11) DEFAULT NULL,
  `callerid` varchar(40) NOT NULL DEFAULT '',
  `uniqueid` varchar(30) NOT NULL,
  `starttime` timestamp NOT NULL DEFAULT current_timestamp(),
  `sessiontime` int(11) DEFAULT NULL,
  `calledstation` varchar(30) NOT NULL,
  `sessionbill` float DEFAULT NULL,
  `sipiax` int(11) DEFAULT 0,
  `src` varchar(40) NOT NULL,
  `buycost` decimal(15,6) DEFAULT 0.000000,
  `real_sessiontime` int(11) DEFAULT NULL,
  `terminatecauseid` int(1) DEFAULT 1,
  `agent_bill` decimal(15,6) DEFAULT 0.000000,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_trunk` (`id_trunk`),
  KEY `id_prefix` (`id_prefix`),
  KEY `calledstation` (`calledstation`),
  KEY `src` (`src`),
  KEY `callerid` (`callerid`),
  KEY `starttime` (`starttime`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr`
--

LOCK TABLES `pkg_cdr` WRITE;
/*!40000 ALTER TABLE `pkg_cdr` DISABLE KEYS */;
INSERT INTO `pkg_cdr` VALUES (9,2,3,3,NULL,399,NULL,'981340509','1677409801.16','2023-02-26 11:10:17',72,'5562981343410',0.132,0,'621105',0.039600,67,1,0.000000),(10,2,1,1,NULL,399,NULL,'991253305','1677409959.20','2023-02-26 11:12:57',66,'5562981343410',0.121,0,'621105',0.045100,64,1,0.000000),(11,2,4,4,NULL,399,NULL,'991253305','1677414958.0','2023-02-26 12:36:14',66,'5562981343410',0.583,0,'621105',0.407000,62,1,0.000000),(12,2,1,1,NULL,399,NULL,'991253305','1677415058.2','2023-02-26 12:37:51',66,'5562981343410',0.121,0,'621105',0.045100,63,1,0.000000),(13,2,2,2,NULL,399,NULL,'991253305','1677415152.4','2023-02-26 12:39:25',66,'5562981343410',0.121,0,'621105',0.049500,62,1,0.000000),(14,2,3,3,NULL,399,NULL,'991253305','1677415245.6','2023-02-26 12:41:01',66,'5562981343410',0.121,0,'621105',0.036300,62,1,0.000000),(22,2,4,4,NULL,616,NULL,'991253305','1677432909.20','2023-02-26 17:35:19',66,'5562984660868',0.583,0,'621105',0.407000,61,1,0.000000),(23,2,4,4,NULL,399,NULL,'991253305','1677493745.22','2023-02-27 10:29:17',66,'5562981343410',0.583,0,'621105',0.407000,61,1,0.000000),(24,2,4,4,NULL,505,NULL,'991253305','1677493843.24','2023-02-27 10:30:55',66,'5562991269596',0.583,0,'621105',0.407000,61,1,0.000000),(25,2,1,1,NULL,399,NULL,'991253305','1677494343.26','2023-02-27 10:39:15',60,'5562981343410',0.11,0,'621105',0.041000,60,1,0.000000),(26,2,1,1,NULL,505,NULL,'991253305','1677494434.28','2023-02-27 10:40:44',60,'5562991269596',0.11,0,'621105',0.041000,60,1,0.000000),(27,2,2,2,NULL,399,NULL,'991253305','1677496992.30','2023-02-27 11:23:27',30,'5562981343410',0.055,0,'621105',0.022500,4,1,0.000000),(28,2,2,2,NULL,399,NULL,'991253305','1677497108.32','2023-02-27 11:25:20',30,'5562981343410',0.055,0,'621105',0.022500,30,1,0.000000),(29,2,2,2,NULL,505,NULL,'991253305','1677497164.34','2023-02-27 11:26:14',60,'5562991269596',0.11,0,'621105',0.045000,59,1,0.000000),(30,2,3,3,NULL,399,NULL,'991253305','1677497729.36','2023-02-27 11:35:44',60,'5562981343410',0.11,0,'621105',0.033000,60,1,0.000000),(31,2,3,3,NULL,505,NULL,'991253305','1677497818.38','2023-02-27 11:37:11',66,'5562991269596',0.121,0,'621105',0.036300,61,1,0.000000),(32,2,3,3,NULL,399,NULL,'991253305','1677515833.0','2023-02-27 16:37:31',30,'5562981343410',0.055,0,'621105',0.016500,7,1,0.000000),(33,2,4,4,NULL,399,NULL,'991253305','1677583080.49','2023-02-28 11:18:22',30,'5562981341067',0.265,0,'621105',0.185000,16,1,0.000000),(34,2,4,4,NULL,399,NULL,'991253305','1677687077.55','2023-03-01 16:11:36',0,'5562981343410',0,0,'621105',0.000000,0,1,0.000000),(35,2,3,3,NULL,399,NULL,'991253305','1677690094.59','2023-03-01 17:01:55',30,'5562981343410',0.055,0,'621105',0.016500,18,1,0.000000),(36,2,3,3,NULL,399,NULL,'991253305','1677690160.61','2023-03-01 17:02:58',72,'5562981343410',0.132,0,'621105',0.039600,72,1,0.000000),(37,2,2,2,NULL,399,NULL,'991253305','1677690566.63','2023-03-01 17:09:41',72,'5562981343410',0.132,0,'621105',0.054000,68,1,0.000000),(38,2,2,2,NULL,505,NULL,'991253305','1677690710.65','2023-03-01 17:12:10',66,'5562991269596',0.121,0,'621105',0.049500,62,1,0.000000),(39,2,1,1,NULL,505,NULL,'991253305','1677690913.67','2023-03-01 17:15:23',66,'5562991269596',0.121,0,'621105',0.045100,61,1,0.000000),(40,3,4,4,NULL,401,NULL,'991261195','1678308095.48','2023-03-08 20:41:51',30,'5562981364148',0.265,0,'623781',0.185000,17,1,0.000000),(41,3,4,4,NULL,635,NULL,'991261195','1678498991.6','2023-03-11 01:43:16',30,'5562992478520',0.265,0,'623781',0.000000,19,1,0.000000),(42,3,4,4,NULL,635,NULL,'991261195','1678504008.10','2023-03-11 03:06:54',30,'5562992478520',0.265,0,'623781',0.000000,19,1,0.000000),(43,3,4,4,NULL,399,NULL,'991261195','1678843675.2','2023-03-15 01:28:14',30,'5562981343410',0.265,0,'623781',0.185000,19,1,0.000000),(44,3,4,4,NULL,505,NULL,'991261195','1678895658.4','2023-03-15 15:54:28',66,'5562991269596',0.583,0,'623781',0.407000,61,1,0.000000),(45,2,2,2,NULL,616,NULL,'981343410','1678968593.38','2023-03-16 12:10:19',36,'5562984660868',0.066,0,'621105',0.027000,36,1,0.000000),(46,2,3,3,NULL,616,NULL,'981343410','1678968772.40','2023-03-16 12:13:25',30,'5562984660868',0.055,0,'621105',0.016500,1,1,0.000000),(47,2,3,3,NULL,617,NULL,'981343410','1679390843.4','2023-03-21 09:27:43',30,'5562984672103',0.055,0,'621105',0.016500,5,1,0.000000),(48,2,3,3,NULL,489,NULL,'981343410','1679433802.0','2023-03-21 21:23:38',210,'5562984999838',1.575,0,'621105',0.000000,207,1,0.000000),(49,2,3,3,NULL,489,NULL,'981343410','1679434064.2','2023-03-21 21:28:16',48,'5562984999838',0.36,0,'621105',0.000000,47,1,0.000000);
/*!40000 ALTER TABLE `pkg_cdr` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_user_credit_after_insert` AFTER INSERT ON `pkg_cdr` FOR EACH ROW BEGIN
                    IF NEW.sessionbill > 0 THEN
                        IF NEW.agent_bill > 0 THEN
                            SET @IDAGENT = (SELECT id_user FROM pkg_user WHERE id = new.id_user LIMIT 1);
                            UPDATE pkg_user SET credit = credit - new.agent_bill WHERE pkg_user.id = new.id_user;
                            UPDATE pkg_user SET credit = credit - new.sessionbill WHERE pkg_user.id = @IDAGENT;
                        ELSE
                            UPDATE pkg_user SET credit = credit - new.sessionbill WHERE pkg_user.id = new.id_user;
                        END IF;
                    END IF;
                END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pkg_cdr_summary_day`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr_summary_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(10) NOT NULL,
  `sessiontime` bigint(25) NOT NULL,
  `aloc_all_calls` int(11) NOT NULL,
  `nbcall` int(11) NOT NULL,
  `nbcall_fail` int(11) DEFAULT NULL,
  `buycost` float NOT NULL DEFAULT 0,
  `sessionbill` float NOT NULL DEFAULT 0,
  `lucro` float DEFAULT NULL,
  `asr` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `day` (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_day`
--

LOCK TABLES `pkg_cdr_summary_day` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_day_agent`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_day_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr_summary_day_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(10) NOT NULL,
  `id_user` int(11) NOT NULL,
  `sessiontime` bigint(25) NOT NULL,
  `aloc_all_calls` int(11) NOT NULL,
  `nbcall` int(11) NOT NULL,
  `nbcall_fail` int(11) NOT NULL DEFAULT 0,
  `buycost` float NOT NULL DEFAULT 0,
  `sessionbill` float NOT NULL DEFAULT 0,
  `lucro` float DEFAULT 0,
  `agent_bill` float NOT NULL DEFAULT 0,
  `agent_lucro` float NOT NULL DEFAULT 0,
  `asr` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `day` (`day`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_day_agent`
--

LOCK TABLES `pkg_cdr_summary_day_agent` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_day_trunk`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_day_trunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr_summary_day_trunk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(10) NOT NULL,
  `id_trunk` int(11) NOT NULL,
  `sessiontime` bigint(25) NOT NULL,
  `aloc_all_calls` int(11) NOT NULL,
  `nbcall` int(11) NOT NULL,
  `nbcall_fail` int(11) NOT NULL DEFAULT 0,
  `buycost` float NOT NULL DEFAULT 0,
  `sessionbill` float NOT NULL DEFAULT 0,
  `lucro` float DEFAULT 0,
  `asr` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `day` (`day`),
  KEY `id_trunk` (`id_trunk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_day_trunk`
--

LOCK TABLES `pkg_cdr_summary_day_trunk` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_trunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_trunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_day_user`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_day_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr_summary_day_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(10) NOT NULL,
  `id_user` int(11) NOT NULL,
  `sessiontime` bigint(25) NOT NULL,
  `aloc_all_calls` int(11) NOT NULL,
  `nbcall` int(11) NOT NULL,
  `nbcall_fail` int(11) NOT NULL DEFAULT 0,
  `buycost` float DEFAULT 0,
  `sessionbill` float DEFAULT 0,
  `lucro` float DEFAULT 0,
  `isAgent` tinyint(1) DEFAULT NULL,
  `agent_bill` float NOT NULL DEFAULT 0,
  `asr` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `day` (`day`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_day_user`
--

LOCK TABLES `pkg_cdr_summary_day_user` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_ids`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr_summary_ids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL,
  `cdr_id` int(11) NOT NULL,
  `cdr_falide_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `day` (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_ids`
--

LOCK TABLES `pkg_cdr_summary_ids` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_month`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr_summary_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(20) NOT NULL,
  `sessiontime` bigint(25) NOT NULL,
  `aloc_all_calls` int(11) NOT NULL,
  `nbcall` int(11) NOT NULL,
  `nbcall_fail` int(11) NOT NULL DEFAULT 0,
  `buycost` float NOT NULL DEFAULT 0,
  `sessionbill` float NOT NULL DEFAULT 0,
  `lucro` float DEFAULT 0,
  `asr` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `month` (`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_month`
--

LOCK TABLES `pkg_cdr_summary_month` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_month` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_month_did`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_month_did`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr_summary_month_did` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(20) NOT NULL,
  `id_did` int(11) NOT NULL,
  `sessiontime` int(11) NOT NULL,
  `aloc_all_calls` int(11) NOT NULL,
  `nbcall` int(11) NOT NULL,
  `sessionbill` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `month` (`month`),
  KEY `id_did` (`id_did`),
  CONSTRAINT `pkg_cdr_summary_month_did_ibfk_1` FOREIGN KEY (`id_did`) REFERENCES `pkg_did` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_month_did`
--

LOCK TABLES `pkg_cdr_summary_month_did` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_did` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_did` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_month_trunk`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_month_trunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr_summary_month_trunk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(20) NOT NULL,
  `id_trunk` int(11) NOT NULL,
  `sessiontime` bigint(25) NOT NULL,
  `aloc_all_calls` int(11) NOT NULL,
  `nbcall` int(11) NOT NULL,
  `nbcall_fail` int(11) NOT NULL DEFAULT 0,
  `buycost` float NOT NULL DEFAULT 0,
  `sessionbill` float NOT NULL DEFAULT 0,
  `lucro` float DEFAULT 0,
  `asr` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `month` (`month`),
  KEY `id_trunk` (`id_trunk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_month_trunk`
--

LOCK TABLES `pkg_cdr_summary_month_trunk` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_trunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_trunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_month_user`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_month_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr_summary_month_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `sessiontime` bigint(25) NOT NULL,
  `aloc_all_calls` int(11) NOT NULL,
  `nbcall` int(11) NOT NULL,
  `nbcall_fail` int(11) NOT NULL DEFAULT 0,
  `buycost` float NOT NULL DEFAULT 0,
  `sessionbill` float NOT NULL DEFAULT 0,
  `lucro` float DEFAULT 0,
  `isAgent` tinyint(1) DEFAULT NULL,
  `agent_bill` float NOT NULL DEFAULT 0,
  `asr` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `month` (`month`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_month_user`
--

LOCK TABLES `pkg_cdr_summary_month_user` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_trunk`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_trunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr_summary_trunk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_trunk` int(11) NOT NULL,
  `sessiontime` bigint(25) NOT NULL,
  `aloc_all_calls` int(11) NOT NULL,
  `nbcall` int(11) NOT NULL,
  `nbcall_fail` int(11) DEFAULT NULL,
  `buycost` float NOT NULL DEFAULT 0,
  `sessionbill` float NOT NULL DEFAULT 0,
  `lucro` float DEFAULT NULL,
  `asr` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_trunk` (`id_trunk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_trunk`
--

LOCK TABLES `pkg_cdr_summary_trunk` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_trunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_trunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_user`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cdr_summary_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `sessiontime` bigint(25) NOT NULL,
  `aloc_all_calls` int(11) NOT NULL,
  `nbcall` int(11) NOT NULL,
  `nbcall_fail` int(11) DEFAULT NULL,
  `buycost` float NOT NULL DEFAULT 0,
  `sessionbill` float NOT NULL DEFAULT 0,
  `lucro` float DEFAULT NULL,
  `asr` float DEFAULT NULL,
  `isAgent` int(11) DEFAULT NULL,
  `agent_bill` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_user`
--

LOCK TABLES `pkg_cdr_summary_user` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_configuration`
--

DROP TABLE IF EXISTS `pkg_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_title` varchar(100) DEFAULT NULL,
  `config_key` varchar(100) DEFAULT NULL,
  `config_value` varchar(200) DEFAULT NULL,
  `config_description` varchar(500) DEFAULT NULL,
  `config_group_title` varchar(64) NOT NULL,
  `status` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_configuration`
--

LOCK TABLES `pkg_configuration` WRITE;
/*!40000 ALTER TABLE `pkg_configuration` DISABLE KEYS */;
INSERT INTO `pkg_configuration` VALUES (1,'Moeda','base_currency','R$','Moeda usada no sistema','global',1),(2,'Language','base_language','pt_BR','Allow \n en English \nes Espanhol \npt_BR Portugues','global',1),(3,'Versão','version','7.8.3.1','Versão MagnusBilling','global',1),(4,'Licence','licence','free','MBilling Licence','global',0),(5,'Server IP','ip_servers','150.230.72.111','Ip do servidor MBilling','global',1),(6,'Template','template','black-neptune','Allowed values:\ngreen, gray, blue, yellow, red, orange, purple','global',0),(7,'País','base_country','BRL','Valores permitidos\nUSA United States,BRL Brasil,\nARG Argentina,\nNLD Netherlands,\nESP Spanish,\nITA Italy,\nMEX Mexico','global',1),(8,'Desktop layout','layout','0','Active Desktop template, only to FULL version\n1 - Enable (Only to full version)\n0 - Disable','global',0),(9,'Wallpaper','wallpaper','Azul','Default Wallpaper, only FULL version.','global',0),(10,'SMTP Host','smtp_host','mail.magnusbilling.com','SMTP Hostname','global',0),(11,'SMTP UserName','smtp_username','billing@magnusbilling.com','SMTP server Username','global',0),(12,'SMTP Password','smtp_password','magnus','SMTP server Password','global',0),(13,'SMTP Encryption','smtp_encryption','null','SMTP Encryption: tls, ssl or blank','global',0),(14,'SMTP Port','smtp_port','587','SMTP Port','global',0),(15,'Email do administrador','admin_email','renato.netspeed@gmail.com','Email usado para receber notificações','global',1),(16,'Enviar copias para o admin','admin_received_email','1','Receber no email do administrador copias dos emails gerados pelo sistema','global',1),(19,'Intervalo de notificação','delay_notifications','3','Intervalo para notificar os cliente de que estão com pouco credito.','global',1),(20,'Arredondar tempo','bloc_time_call','1','Arredonda o tempo da chamada respeitando a tarifa de venda.\n1: Sim\n0: Não\n','global',1),(21,'Notificação de Pacotes de Ofertas','planbilling_daytopay','5','Total Dias anterior ao vencimento que o MBilling avisara o cliente para pagar o pacote de oferta.','global',1),(22,'Limite de recarga de revendedores','agent_limit_refill','5','Credito máximo que um revendedor para usar para recarga. Este total é calculado levando em consideração o saldo do revendedor.\nEX: Se o revendedor tem R$100 e o limite de recarga esta em 5, quer dizer que o total de credito entre todos os clientes do revendedor, não pode superar R$500.','global',1),(23,'Arquivar ligações','archive_call_prior_x_month','4','Arquivar ligações anterior a determinada quantidade de meses.','global',1),(25,'Decimal precisão','decimal_precision','0000','Número de zeros apôs a virgula.','global',1),(26,'Paypal para novos cliente','paypal_new_user','0','Permitir recargas automáticas para cliente novos.\n0 - Desativado (RECOMENDADO )\n1 - Ativado','global',1),(29,'Portabilidade Usuário','portabilidadeUsername','0','Usuário da portabilidade para consulta via WebService','global',1),(30,'Portabilidade Senha','portabilidadePassword','0','Senha da portabilidade para consulta via WebService','global',1),(31,'AGI - Answer Call','answer_call','0','Se ativado, o MBilling atendera a chamada no inicio.\n\n1 - Ativo\n0 - Desativado (DEFAULT)','agi-conf1',1),(32,'AGI - User DNID','use_dnid','1','Se desativar, será solicitado ao cliente que marque o número que deseja chamar.\n\n1 - Ativo (DEFAULT)\n0 - Desativado','agi-conf1',1),(34,'AGI - Audio inicial','intro_prompt','','Audio para ser executado no inicio de cada chamada. Deixe em branco para não executar nada','agi-conf1',1),(37,'AGI - International prefixes','international_prefixes','00,09','Lista de prefixos que o MagnusBilling vai retirar do numero discado.','agi-conf1',1),(38,'AGI - Informar preço do minuto','say_rateinitial','0','Informa ao cliente o valor do minuto no inicio de cada chamada.\n\n0 - Não\n1 - Sim','agi-conf1',1),(39,'AGI - Informar tempo disponível','say_timetocall','0','informa no inicio da chamada o tempo total de minutos disponível ','agi-conf1',1),(40,'AGI - Autenticação por CallerID','cid_enable','0','Ativar autenticação por CallerID.\n0 - Não\n1 - Sim\n','agi-conf1',1),(41,'AGI - Backup por LCR/LCD Prefix','failover_lc_prefix','1','Se ativo e existir dois prefixo idênticos no mesmo plano, o MBilling vai usar 1º o de menor custo.\nSe o tronco da 1º tarifa nao completar a chamada, e não tiver um tronco backup, o MBilling usará a segunda tarifa','agi-conf1',1),(42,'AGI - Comando Dial','dialcommand_param',',60,L(%timeout%:61000:30000)','Mais informações em : http://voip-info.org/wiki-Asterisk+cmd+dial','agi-conf1',1),(43,'AGI - Internal Call, Dial Command Params','dialcommand_param_sipiax_friend',',60,TtiL(3600000:61000:30000)','Parâmetros para o DIAL usado em ligações entre clientes.\nby default (3600000 = 1HOUR MAX CALL).','agi-conf1',1),(44,'AGI - DID Dial Command Params','dialcommand_param_call_2did',',45,TtiL(%timeout%:61000:30000)','%timeout% is the value of the paramater : Max time to Call a DID no billed','agi-conf1',1),(45,'AGI - Limite de tronco backup','failover_recursive_limit','5','Limite máximo de busca uso de tronco backup','agi-conf1',1),(46,'AGI - Tentativas de discagem','number_try','1','Números de tentativas para marcar o numero. Usado para callingcard\nValor minimo 1','agi-conf1',1),(47,'AGI - Outbound Call','switchdialcommand','0','Order para o comando DIAL\n\n1 - SIP/number@trunk\n0 - SIP/trunk/number\n\nAs duas formas trabalham iguais, mas alguns gateways so aceitam SIP/number@trunk.','agi-conf1',1),(48,'AGI - Informar saldo apôs chamada','say_balance_after_call','0','Diz o credito do cliente ao final da chamada\n0 - Não\n1 - Sim','agi-conf1',1),(85,'Ramal Voip para Espiar chamadas','channel_spy','0','Ramal Voip para Espiar chamada','global',1),(142,'Gerar usuário automaticamente','username_generate','1','Gerar usuário automaticamente quando for criar um novo cliente','global',1),(143,'Username Prefixo','generate_prefix','0','Prefixo para ser colocado no inicio quando for criado novos usuarios','global',1),(144,'Username tamanho','generate_length','5','Qual tamanho dos usuarios que devera ser criado? Ex 5 para gerar usuarios com 5 digitos','global',1),(145,'Atender o Callback','answer_callback','0','Atende callback e executa um audio','global',1),(146,'Callback - Adicionar prefixo','callback_add_prefix','','Adicionar prefixo no CallerID quando a chamada for um callback','global',1),(147,'Callback remover Prefixo','callback_remove_prefix','','Remove prefixo no CallerID quando a chamada for um callback','global',1),(233,'Menu color (Tema windows)','color_menu','White','Menu color, Black or White','global',0),(234,'Menu color (Tema windows)','color_menu','White','Menu color, Black or White','global',1),(235,'Cobrar Sip Call','charge_sip_call','0','Cobrar sip call entre clientes','global',1),(236,'URL to extra module','module_extra','index.php/extra/read','Url to extra module, default: index.php/extra/read','global',1),(237,'intra/inter Billing','intra-inter','0','Enable Intra-Inter Billing. If you enable this option, and you have another plan with the same name + Intra on the name Mbilling use the new plan to intra call','global',0),(238,'Ativar Paypal no Softphone Android','paypal-softphone','0','Ativar Paypal no Android Softphones, 0 - Disable 1 - Enable','global',1),(239,'Mostrar CallBack no Softphone','callback-softphone','0','Ativa o Callback no softphone Android 0 - Desativa 1 - Ativa','global',1),(240,'Invoice tax','invoice_tax','0','Tax to add in Invoice.','global',1),(241,'Log nivel','log','0','min 0 - max 5 ','global',0),(242,'Asterisk','asterisk_version','11','Set your Asterisk Version instaled. Default 1.8','global',0),(243,'Tts URL','tts_url','https://translate.google.com/translate_tts?ie=UTF-8&q=$name&tl=pt-BR&total=1&idx=0&textlen=25&client=t&tk=55786|34299.','Set here the URL to use in Massive Call. Use variable $name in the string field','global',1),(244,'fm.transfer-to.com username','fm_transfer_to_username',NULL,'Username in Transfer To','global',0),(245,'fm.transfer-to.com token','fm_transfer_to_ token',NULL,'Token to Transfer To API','global',0),(248,'Days to find in Summary per agent','summary_per_agent_days','7','Days to find when you open the menu Summary per Agent','global',1),(249,'MixMonitor Format','MixMonitor_format','gsm','Veja as extensões permitidas em http://www.voip-info.org/wiki/view/MixMonitor','global',1),(251,'fm.transfer-to.com print Header','fm_transfer_print_header','Change it in configuration menu','Description to print header','global',0),(252,'fm.transfer-to.com print Footer','fm_transfer_print_footer','Change it in configuration menu','Description to print footer','global',0),(253,'fm.transfer-to.com Currency','fm_transfer_currency','€','Set the transfer-to currency','global',0),(254,'Sip trunk short duration call','trunk_short_duration_call','3','SIP TRUNK short duration call','global',1),(255,'Sip trunk short total calls','trunk_short_total_calls','0','Sip trunk short total calls','global',1),(256,'Enable IAX','enable_izx','3','Enable IAX','global',0),(259,'BDService Url','BDService_url','https://req.ovinovo.net','Default https://req.ovinovo.net','global',0),(260,'Gerar a senha automaticamente no formulario de registro','signup_auto_pass','0','Coloque o numero total de digitos que deseja gerar a senha. EX: Se quer uma senha de 10 digitos, colocar 10. Minimo 6. Deixe em branco para o usuário poder cadastrar a propria senha','global',1),(261,'Link para redes sociais para mostrar no painel de cliente','social_media_network','','Link para redes sociais para mostrar no painel de cliente','global',1),(262,'Link termos do formulario de register','accept_terms_link','','Link para os termos de registro','global',1),(263,'Gerar automaticamente o usuario do formulario de registro','auto_generate_user_signup','1','Gerar automaticamente o usuario do formulario de registro','global',1),(264,'Notificação de  Pagamento de serviços','service_daytopay','5','Total Dias anterior ao vencimento que o MagnusBilling avisara o cliente para pagar os serviços','global',1),(265,'Start User Call Limit','start_user_call_limit','-1','Default call limit for new user','global',0),(266,'CallingCard atender a chamada','callingcard_answer','1','Executa o Answer no CallingCard','agi-conf1',1),(267,'CallingCard ativar CID authentication','callingcard_cid_enable','1','CID authentication no CallingCard','agi-conf1',1),(268,'CallingCard tentativas','callingcard_number_try','3','Quantas vezes o CallingCard vai pedir para digitar o numero desejado, caso falhar.','agi-conf1',1),(269,'CallingCard diz preço da tarifa','callingcard_say_rateinitial','0','CallingCard diz preço da tarifa','agi-conf1',1),(270,'CallingCard diz tempo total restante','callingcard_say_timetocall','0','CallingCard diz tempo total restante','agi-conf1',1),(271,'reCaptchaKey sitekey','reCaptchaKey','','Generate your sitekey in https://www.google.com/recaptcha/admin#list','global',1),(272,'BDService Username','BDService_username','','BDService username','global',0),(273,'BDService token','BDService_token','','BDService token','global',0),(274,'BDService flexiload values','BDService_flexiload','10-1000','BDService flexiload values','global',0),(275,'BDService bkash values','BDService_bkash','50-2500','BDService bkash values','global',0),(276,'BDService currency translation','BDService_cambio','0.01','BDService currency translation','global',0),(277,'BDService DBBL/Rocket values','BDService_dbbl_rocket','10-1000','DBBL/Rocket flexiload values','global',0),(278,'BDService Credit','BDService_credit_provider','0','BDService Credit','global',0),(279,'Session timeout','session_timeout','55333','Tempo em segundos para fechar as sessoes do painel.','global',1),(280,'Mostrar icone PLAY no menu Relatório de Ligaçōes','show_playicon_cdr','1','Mostrar icone PLAY no menu Relatório de Ligaçōes','global',1),(281,'Mostrar icone de ajuda','show_filed_help','1','Mostrar icone de ajuda nos formulários','global',1),(282,'Autenticação por IP/tech - Tamanho do tech','ip_tech_length','6','Autenticação IP/tech Tamanho 4, 5 or 6 digitos','global',1),(283,'Baixar gravaçoes via API URL','external_record_link','','URL para baixar as gravaçoes. Permite baixar somente 1 audio por vez. Deixe em branco para desativar. URL EX: http://IP/record.php?username=%user%&amp;audio=%number%.%uniqueid%.%audio_exten%','global',1),(284,'Campaign call limit to users','campaign_user_limit','1','Campaign call limit to users','global',1),(285,'Ativar CallingCard','enable_callingcard','1','Ativar CallingCard. \n 0 - Desativa \n 1 - Ativa','global',1),(286,'Avisar admin/email quando alguem se registrar','signup_admin_email','1','Envia um email para o administrador quando alguem se cadastrar no formulário de registro. \n 0 - Desativa \n 1 - Ativa','global',1),(287,'Show Signup button on login page','show_signup_button','0','Show Signup button on login page\n 0 - Disable \n1 - Enable','global',1),(288,'reCaptchaKey secretkey','reCaptchaSecret','','Generate your secredt key in https://www.google.com/recaptcha/admin#list','global',1),(289,'Enable Signup Form','enable_signup','0','Enable Signup form','global',1),(290,'Background Color','backgroundColor','#1b1e23','Background Color','global',1),(291,'DIDWW APY KEY','didww_api_key','','DIDWW APY KEY','global',1),(292,'DIDWW APY URL','didww_url','https://api.didww.com/v3/','DIDWW APY URL','global',1),(293,'DIDWW PROFIT','didww_profit','0','DIDWW profit percentage. Integer value','global',1),(294,'URL to extra module2','module_extra2','','Url to extra module, default: index.php/extra2/read','global',1),(295,'URL to extra module3','module_extra3','','Url to extra module, default: index.php/extra3/read','global',1),(296,'DIDWW CURRENCY CONVERTER','didww_curreny_converter','0','DIDWW CURRENCY CONVERTER. Ex. 1 USD in your local currency is 3.25, so add here 3.25','global',1),(297,'Fixed CallerId to use on Signup','fixed_callerid_signup','','Fixed CallerId to use on Signup, Leave blank to use the user phone','global',1),(298,'Apply the local prefix rule on DID and Sip Call','apply_local_prefix_did_sip','0','Apply the local prefix rule on DID and Sip Call','global',1),(299,'Default Codecs','default_codeds','g729,gsm,opus,alaw,ulaw','Default Codecs','global',1),(300,'Permitir usuários se registrar com CPF/CNPJ já em uso','signup_unique_doc','1','config_desc_signup_unique_doc','global',1),(301,'Show Broadcasting DashBoard on User home panel','showMCDashBoard','0','Show the Campaign DashBoard to User','global',1),(302,'Incoming DID first Digit Removal','did_ignore_zero_on_did','0','0=Disable \n1=Enable Remove First Digit of Incoming DID','global',1),(303,'Enable IAX internal calls','use_sip_to_iax','0','Enable IAX internal calls','global',1),(304,'Login header','login_header','Log in','Login header','global',1),(305,'Record all calls','global_record_calls','0','0=Disable \n1=Enable\n Record all calls, the fields record calls will be hidden if this option is activated.','global',1),(306,'Default prefix rule','default_prefix_rule','','This rule will be used when you create a new user or on the Sign up  form. More details about prefix rule on the bellow link https://www.magnusbilling.org/local_prefix','global',1),(307,'Deletar ligações arquivadas anterior a X meses','delete_cdr_archived_prior_x_month','0','Deletar ligações arquivadas anterior a X meses.','global',1),(308,'Deletar ligações rejeitadas arquivadas anterior a X meses','delete_cdr_failed_archived_prior_x_month','0','Deletar ligações rejeitadas arquivadas anterior a X meses','global',1),(309,'Cobrar o DID/serviços se o cliente tiver crédito suficiente antes da data de vencimento','charge_did_services_before_due_date','1','Cobrar o DID/serviços se o cliente tiver crédito suficiente antes da data de vencimento','global',1);
/*!40000 ALTER TABLE `pkg_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cryptocurrency`
--

DROP TABLE IF EXISTS `pkg_cryptocurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_cryptocurrency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `currency` varchar(50) NOT NULL,
  `amountCrypto` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `amount` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_cryptocurrency` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_cryptocurrency` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cryptocurrency`
--

LOCK TABLES `pkg_cryptocurrency` WRITE;
/*!40000 ALTER TABLE `pkg_cryptocurrency` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cryptocurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_did`
--

DROP TABLE IF EXISTS `pkg_did`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_did` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_server` int(11) DEFAULT NULL,
  `activated` int(11) NOT NULL DEFAULT 1,
  `reserved` tinyint(11) DEFAULT 0,
  `did` char(50) NOT NULL,
  `callerid` varchar(50) NOT NULL DEFAULT '',
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `startingdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expirationdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` mediumtext DEFAULT NULL,
  `secondusedreal` int(11) DEFAULT 0,
  `billingtype` int(11) DEFAULT 0,
  `cbr` tinyint(1) NOT NULL DEFAULT 0,
  `fixrate` float NOT NULL DEFAULT 0,
  `connection_charge` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `expression_1` varchar(150) NOT NULL DEFAULT '*',
  `selling_rate_1` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `agent_client_rate_1` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `buy_rate_1` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `expression_2` varchar(150) NOT NULL DEFAULT '*',
  `selling_rate_2` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `agent_client_rate_2` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `buy_rate_2` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `connection_sell` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `minimal_time_charge` int(11) NOT NULL DEFAULT 0,
  `minimal_time_buy` int(11) NOT NULL DEFAULT 1,
  `initblock` int(11) NOT NULL DEFAULT 1,
  `buyrateinitblock` int(11) NOT NULL DEFAULT 1,
  `cbr_ua` tinyint(1) NOT NULL DEFAULT 0,
  `cbr_em` tinyint(1) NOT NULL DEFAULT 0,
  `cbr_total_try` int(11) NOT NULL DEFAULT 3,
  `cbr_time_try` int(11) NOT NULL DEFAULT 30,
  `increment` int(11) NOT NULL DEFAULT 1,
  `buyrateincrement` int(11) NOT NULL DEFAULT 1,
  `block_expression_1` smallint(2) NOT NULL DEFAULT 0,
  `block_expression_2` smallint(2) NOT NULL DEFAULT 0,
  `expression_3` varchar(150) NOT NULL DEFAULT '*',
  `selling_rate_3` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `agent_client_rate_3` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `buy_rate_3` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `block_expression_3` smallint(2) NOT NULL DEFAULT 0,
  `charge_of` int(1) NOT NULL DEFAULT 1,
  `send_to_callback_1` tinyint(1) NOT NULL DEFAULT 0,
  `send_to_callback_2` tinyint(1) NOT NULL DEFAULT 0,
  `send_to_callback_3` tinyint(1) NOT NULL DEFAULT 0,
  `TimeOfDay_monFri` varchar(150) DEFAULT NULL,
  `TimeOfDay_sat` varchar(150) DEFAULT NULL,
  `TimeOfDay_sun` varchar(150) DEFAULT NULL,
  `workaudio` varchar(150) DEFAULT NULL,
  `noworkaudio` varchar(150) DEFAULT NULL,
  `calllimit` int(11) NOT NULL DEFAULT -1,
  `record_call` int(11) NOT NULL DEFAULT 0,
  `country` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `did` (`did`),
  KEY `fk_pkg_user_pkg_did` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_did` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_did`
--

LOCK TABLES `pkg_did` WRITE;
/*!40000 ALTER TABLE `pkg_did` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_did` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_did_destination`
--

DROP TABLE IF EXISTS `pkg_did_destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_did_destination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_ivr` int(11) DEFAULT NULL,
  `id_sip` int(11) DEFAULT NULL,
  `id_queue` int(11) DEFAULT NULL,
  `id_did` int(11) NOT NULL,
  `destination` varchar(120) NOT NULL,
  `context` text DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `activated` int(11) NOT NULL DEFAULT 1,
  `secondusedreal` int(11) DEFAULT 0,
  `voip_call` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_did_pkg_did_destination` (`id_did`),
  KEY `fk_pkg_user_pkg_did_destination` (`id_user`),
  CONSTRAINT `fk_pkg_did_pkg_did_destination` FOREIGN KEY (`id_did`) REFERENCES `pkg_did` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_did_destination` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_did_destination`
--

LOCK TABLES `pkg_did_destination` WRITE;
/*!40000 ALTER TABLE `pkg_did_destination` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_did_destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_did_history`
--

DROP TABLE IF EXISTS `pkg_did_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_did_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `did` varchar(50) DEFAULT NULL,
  `reservationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `releasedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `month_payed` int(11) DEFAULT 0,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `did` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_did_history`
--

LOCK TABLES `pkg_did_history` WRITE;
/*!40000 ALTER TABLE `pkg_did_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_did_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_did_use`
--

DROP TABLE IF EXISTS `pkg_did_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_did_use` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_did` int(11) DEFAULT NULL,
  `reservationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `releasedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) DEFAULT 0,
  `month_payed` int(11) DEFAULT 0,
  `reminded` tinyint(4) NOT NULL DEFAULT 0,
  `next_due_date` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id_card` (`id_user`),
  KEY `id_did` (`id_did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_did_use`
--

LOCK TABLES `pkg_did_use` WRITE;
/*!40000 ALTER TABLE `pkg_did_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_did_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_estados`
--

DROP TABLE IF EXISTS `pkg_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_estados` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sigla` varchar(2) NOT NULL,
  PRIMARY KEY (`id`,`sigla`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_estados`
--

LOCK TABLES `pkg_estados` WRITE;
/*!40000 ALTER TABLE `pkg_estados` DISABLE KEYS */;
INSERT INTO `pkg_estados` VALUES (1,'Acre','AC'),(2,'Alagoas','AL'),(3,'Amazonas','AM'),(4,'Amapá','AP'),(5,'Bahia','BA'),(6,'Ceará','CE'),(7,'Distrito Federal','DF'),(8,'Espírito Santo','ES'),(9,'Goiás','GO'),(10,'Maranhão','MA'),(11,'Minas Gerais','MG'),(12,'Mato Grosso do Sul','MS'),(13,'Mato Grosso','MT'),(14,'Pará','PA'),(15,'Paraíba','PB'),(16,'Pernambuco','PE'),(17,'Piauí','PI'),(18,'Paraná','PR'),(19,'Rio de Janeiro','RJ'),(20,'Rio Grande do Norte','RN'),(21,'Rondônia','RO'),(22,'Roraima','RR'),(23,'Rio Grande do Sul','RS'),(24,'Santa Catarina','SC'),(25,'Sergipe','SE'),(26,'São Paulo','SP'),(27,'Tocantins','TO');
/*!40000 ALTER TABLE `pkg_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_firewall`
--

DROP TABLE IF EXISTS `pkg_firewall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_firewall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(50) NOT NULL,
  `action` int(1) NOT NULL,
  `description` text NOT NULL,
  `jail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_firewall`
--

LOCK TABLES `pkg_firewall` WRITE;
/*!40000 ALTER TABLE `pkg_firewall` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_firewall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_group_module`
--

DROP TABLE IF EXISTS `pkg_group_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_group_module` (
  `id_group` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `action` varchar(45) NOT NULL,
  `show_menu` tinyint(1) NOT NULL DEFAULT 1,
  `createShortCut` tinyint(1) NOT NULL DEFAULT 0,
  `createQuickStart` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_group`,`id_module`),
  KEY `fk_pkg_module_group_pkg_module` (`id_module`),
  CONSTRAINT `fk_pkg_group_user_pkg_group_module` FOREIGN KEY (`id_group`) REFERENCES `pkg_group_user` (`id`),
  CONSTRAINT `fk_pkg_module_group_pkg_module` FOREIGN KEY (`id_module`) REFERENCES `pkg_module` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_group_module`
--

LOCK TABLES `pkg_group_module` WRITE;
/*!40000 ALTER TABLE `pkg_group_module` DISABLE KEYS */;
INSERT INTO `pkg_group_module` VALUES (1,1,'crud',1,0,0),(1,3,'crud',1,0,0),(1,4,'ru',1,0,0),(1,5,'crud',1,0,0),(1,6,'crud',1,0,0),(1,7,'crud',1,0,0),(1,8,'crud',1,0,0),(1,9,'crud',1,0,0),(1,10,'crud',1,0,0),(1,12,'crud',1,0,0),(1,13,'crud',1,0,0),(1,14,'crud',1,0,0),(1,15,'crud',1,1,1),(1,16,'crud',1,0,0),(1,17,'crud',1,1,1),(1,19,'crud',1,1,1),(1,20,'crud',1,0,0),(1,21,'crud',1,1,1),(1,22,'crud',1,0,0),(1,23,'crud',1,1,1),(1,25,'crud',1,0,0),(1,26,'crud',1,0,0),(1,27,'crud',1,0,0),(1,28,'crud',1,0,0),(1,29,'crud',1,1,1),(1,30,'rud',1,1,1),(1,31,'crud',1,0,0),(1,32,'crud',1,0,0),(1,33,'crud',1,0,0),(1,34,'crud',1,0,0),(1,36,'crud',1,0,0),(1,40,'crud',1,1,1),(1,41,'crud',1,0,0),(1,42,'crud',1,0,0),(1,43,'crud',1,0,0),(1,44,'crud',1,0,0),(1,45,'crud',1,0,0),(1,46,'crud',1,0,0),(1,48,'crud',1,0,0),(1,49,'crud',1,0,0),(1,50,'crud',1,0,0),(1,51,'crud',1,0,0),(1,53,'crud',1,0,0),(1,54,'crud',1,0,0),(1,56,'crud',1,0,0),(1,57,'crud',1,0,0),(1,58,'crud',1,0,0),(1,59,'crud',1,0,0),(1,60,'crud',1,1,0),(1,62,'crud',1,0,0),(1,63,'crud',1,1,1),(1,64,'r',1,1,1),(1,66,'crud',1,1,1),(1,67,'rud',1,1,1),(1,71,'r',0,1,1),(1,72,'crud',1,1,1),(1,77,'crud',1,1,1),(1,78,'r',1,1,1),(1,80,'r',1,1,1),(1,82,'crud',1,0,0),(1,83,'crud',1,1,1),(1,85,'crud',1,1,1),(1,86,'crud',1,1,1),(1,87,'crud',1,1,1),(1,89,'r',1,1,1),(1,90,'r',1,1,1),(1,91,'r',1,1,1),(1,92,'r',1,1,1),(1,93,'r',1,1,1),(1,94,'r',1,1,1),(1,95,'crud',1,1,1),(1,96,'crud',1,1,1),(1,97,'crud',1,1,1),(1,98,'crud',1,0,0),(1,102,'crud',1,1,1),(1,103,'crud',1,1,1),(1,104,'crud',1,1,1),(1,105,'crud',1,1,1),(1,106,'crud',1,1,1),(1,107,'crud',1,1,1),(1,108,'crud',1,1,1),(1,109,'crud',1,1,1),(1,111,'crud',1,1,1),(1,112,'crud',1,1,1),(2,1,'crud',1,0,0),(2,7,'crud',1,0,0),(2,8,'crud',1,0,0),(2,9,'crud',1,0,0),(2,15,'crud',1,1,1),(2,19,'crud',1,1,1),(2,20,'crud',1,0,0),(2,21,'r',1,1,1),(2,23,'crud',1,1,1),(2,25,'r',0,0,0),(2,28,'crud',1,0,0),(2,29,'crud',1,1,1),(2,30,'r',1,1,1),(2,33,'r',0,0,0),(2,51,'r',1,0,0),(2,53,'r',1,0,0),(2,61,'r',1,1,1),(3,1,'ru',1,0,0),(3,5,'r',1,0,0),(3,7,'r',1,0,0),(3,8,'r',1,0,0),(3,9,'r',1,0,0),(3,15,'ru',1,1,1),(3,19,'ru',1,0,0),(3,20,'crud',1,0,0),(3,21,'r',1,1,1),(3,22,'crud',1,0,0),(3,23,'r',1,1,1),(3,25,'r',0,0,0),(3,28,'r',0,0,0),(3,29,'r',1,1,1),(3,30,'r',1,1,1),(3,31,'r',1,0,0),(3,32,'crud',1,0,0),(3,33,'r',0,0,0),(3,34,'r',0,0,0),(3,61,'r',1,1,1),(3,80,'r',1,0,0),(3,90,'r',1,0,0),(3,93,'r',1,0,0);
/*!40000 ALTER TABLE `pkg_group_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_group_user`
--

DROP TABLE IF EXISTS `pkg_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_user_type` int(11) NOT NULL,
  `user_prefix` int(11) DEFAULT NULL,
  `hidden_prices` tinyint(1) NOT NULL DEFAULT 0,
  `hidden_batch_update` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `pkg_user_type_pkg_group_user` (`id_user_type`),
  CONSTRAINT `pkg_user_type_pkg_group_user` FOREIGN KEY (`id_user_type`) REFERENCES `pkg_user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_group_user`
--

LOCK TABLES `pkg_group_user` WRITE;
/*!40000 ALTER TABLE `pkg_group_user` DISABLE KEYS */;
INSERT INTO `pkg_group_user` VALUES (1,'Administrator',1,NULL,0,0),(2,'Agent',2,NULL,0,0),(3,'Client',3,NULL,0,0);
/*!40000 ALTER TABLE `pkg_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_group_user_group`
--

DROP TABLE IF EXISTS `pkg_group_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_group_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group_user` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_pkg_group_user_pkg_group` (`id_group_user`),
  KEY `fk_pkg_group_pkg_pkg_group_user_group` (`id_group`),
  CONSTRAINT `fk_pkg_group_pkg_pkg_group_user_group` FOREIGN KEY (`id_group`) REFERENCES `pkg_group_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_pkg_group_user_pkg_group` FOREIGN KEY (`id_group_user`) REFERENCES `pkg_group_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_group_user_group`
--

LOCK TABLES `pkg_group_user_group` WRITE;
/*!40000 ALTER TABLE `pkg_group_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_group_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_holidays`
--

DROP TABLE IF EXISTS `pkg_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `day` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_holidays`
--

LOCK TABLES `pkg_holidays` WRITE;
/*!40000 ALTER TABLE `pkg_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_iax`
--

DROP TABLE IF EXISTS `pkg_iax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_iax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT 0,
  `name` varchar(80) NOT NULL,
  `accountcode` varchar(20) NOT NULL,
  `regexten` varchar(20) NOT NULL,
  `amaflags` char(7) DEFAULT NULL,
  `callgroup` char(10) DEFAULT NULL,
  `callerid` varchar(80) NOT NULL,
  `canreinvite` varchar(20) DEFAULT NULL,
  `context` varchar(80) NOT NULL,
  `DEFAULTip` char(15) DEFAULT NULL,
  `dtmfmode` char(7) NOT NULL DEFAULT 'RFC2833',
  `fromuser` varchar(80) NOT NULL,
  `fromdomain` varchar(80) NOT NULL,
  `host` varchar(31) NOT NULL,
  `insecure` varchar(20) NOT NULL,
  `language` char(2) DEFAULT NULL,
  `mailbox` varchar(50) NOT NULL,
  `md5secret` varchar(80) NOT NULL,
  `nat` varchar(25) DEFAULT 'force_rport,comedia',
  `permit` varchar(95) NOT NULL,
  `deny` varchar(95) NOT NULL,
  `mask` varchar(95) DEFAULT NULL,
  `pickupgroup` char(10) DEFAULT NULL,
  `port` char(5) NOT NULL DEFAULT '',
  `qualify` char(7) DEFAULT 'yes',
  `restrictcid` char(1) DEFAULT NULL,
  `rtptimeout` char(3) DEFAULT NULL,
  `rtpholdtimeout` char(3) DEFAULT NULL,
  `secret` varchar(80) NOT NULL,
  `type` char(6) NOT NULL DEFAULT 'friend',
  `username` varchar(80) NOT NULL,
  `disallow` varchar(100) NOT NULL,
  `allow` varchar(100) NOT NULL,
  `musiconhold` varchar(100) DEFAULT NULL,
  `regseconds` int(11) NOT NULL DEFAULT 0,
  `ipaddr` char(15) NOT NULL DEFAULT '',
  `cancallforward` char(3) DEFAULT 'yes',
  `trunk` char(3) DEFAULT 'no',
  `useragent` varchar(200) NOT NULL DEFAULT '',
  `requirecalltoken` varchar(3) NOT NULL DEFAULT 'no',
  `calllimit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cons_pkg_iax_name` (`name`),
  KEY `name` (`name`),
  KEY `host` (`host`),
  KEY `ipaddr` (`ipaddr`),
  KEY `port` (`port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_iax`
--

LOCK TABLES `pkg_iax` WRITE;
/*!40000 ALTER TABLE `pkg_iax` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_iax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_ivr`
--

DROP TABLE IF EXISTS `pkg_ivr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_ivr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_did` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `monFriStart` varchar(200) NOT NULL DEFAULT '09:00-12:00|14:00-18:00',
  `satStart` varchar(200) NOT NULL DEFAULT '09:00-12:00',
  `sunStart` varchar(200) NOT NULL DEFAULT '00:00',
  `option_0` varchar(50) DEFAULT NULL,
  `option_1` varchar(50) DEFAULT NULL,
  `option_2` varchar(50) DEFAULT NULL,
  `option_3` varchar(50) DEFAULT NULL,
  `option_4` varchar(50) DEFAULT NULL,
  `option_5` varchar(50) DEFAULT NULL,
  `option_6` varchar(50) DEFAULT NULL,
  `option_7` varchar(50) DEFAULT NULL,
  `option_8` varchar(50) DEFAULT NULL,
  `option_9` varchar(50) DEFAULT NULL,
  `option_10` varchar(50) DEFAULT NULL,
  `direct_extension` tinyint(1) DEFAULT 0,
  `workaudio` varchar(100) DEFAULT NULL,
  `noworkaudio` varchar(100) DEFAULT NULL,
  `option_out_0` varchar(50) DEFAULT NULL,
  `option_out_1` varchar(50) DEFAULT NULL,
  `option_out_2` varchar(50) DEFAULT NULL,
  `option_out_3` varchar(50) DEFAULT NULL,
  `option_out_4` varchar(50) DEFAULT NULL,
  `option_out_5` varchar(50) DEFAULT NULL,
  `option_out_6` varchar(50) DEFAULT NULL,
  `option_out_7` varchar(50) DEFAULT NULL,
  `option_out_8` varchar(50) DEFAULT NULL,
  `option_out_9` varchar(50) DEFAULT NULL,
  `option_out_10` varchar(50) DEFAULT NULL,
  `use_holidays` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_ivr` (`id_user`),
  KEY `fk_pkg_did_pkg_ivr` (`id_did`),
  CONSTRAINT `fk_pkg_user_pkg_ivr` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_ivr`
--

LOCK TABLES `pkg_ivr` WRITE;
/*!40000 ALTER TABLE `pkg_ivr` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_ivr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_log`
--

DROP TABLE IF EXISTS `pkg_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_log_actions` int(11) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_log_actions_pkg_log` (`id_log_actions`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_log`
--

LOCK TABLES `pkg_log` WRITE;
/*!40000 ALTER TABLE `pkg_log` DISABLE KEYS */;
INSERT INTO `pkg_log` VALUES (1,NULL,1,'Username and password combination is invalid - User: root IP: 45.184.180.231',NULL,'2023-02-18 23:06:07','45.184.180.231'),(2,1,1,'Username Login on the panel - User root',NULL,'2023-02-18 23:06:13','45.184.180.231'),(3,1,1,'Username Login on the panel - User root',NULL,'2023-02-19 01:33:55','45.184.180.231'),(4,NULL,1,'Username and password combination is invalid - User: root IP: 103.113.149.246',NULL,'2023-02-25 13:07:09','103.113.149.246'),(5,NULL,1,'Username and password combination is invalid - User: root IP: 45.184.180.231',NULL,'2023-02-25 18:06:41','45.184.180.231'),(6,NULL,1,'Username and password combination is invalid - User: root IP: 45.184.180.231',NULL,'2023-02-25 18:06:49','45.184.180.231'),(7,NULL,1,'Username and password combination is invalid - User: root IP: 45.184.180.231',NULL,'2023-02-25 18:06:56','45.184.180.231'),(8,NULL,1,'IP blocked after 3 failing attempts. IP: 45.184.180.231',NULL,'2023-02-25 18:07:10','45.184.180.231'),(9,1,1,'Username Login on the panel - User root',NULL,'2023-02-25 18:50:44','45.184.180.231'),(10,1,2,'Module: configuration  {\"config_value\":\"55333\",\"id\":279}',NULL,'2023-02-25 18:51:12','45.184.180.231'),(11,1,2,'Module: configuration  {\"config_value\":\"150.230.72.111\",\"id\":5}',NULL,'2023-02-25 18:51:34','45.184.180.231'),(12,1,2,'Module: configuration  {\"config_value\":\"pt_BR\",\"id\":2}',NULL,'2023-02-25 18:52:05','45.184.180.231'),(13,1,1,'Username Login on the panel - User root',NULL,'2023-02-25 20:39:14','45.184.180.231'),(14,1,2,'Module: provider  {\"id\":0,\"provider_name\":\"Voxbeam-Gold\",\"creationdate\":null,\"description\":\"\",\"credit_control\":0,\"credit\":25}',NULL,'2023-02-25 21:57:00','45.184.180.231'),(15,1,2,'Module: provider  {\"id\":0,\"provider_name\":\"Voxbeam-Platinum\",\"creationdate\":null,\"description\":\"\",\"credit_control\":0,\"credit\":25}',NULL,'2023-02-25 21:57:27','45.184.180.231'),(16,1,2,'Module: provider  {\"id\":0,\"provider_name\":\"Voxbeam-Silver\",\"creationdate\":null,\"description\":\"\",\"credit_control\":0,\"credit\":25}',NULL,'2023-02-25 21:57:46','45.184.180.231'),(17,1,2,'Module: provider  {\"id\":0,\"provider_name\":\"Voxbeam-Call-Center\",\"creationdate\":null,\"description\":\"\",\"credit_control\":0,\"credit\":25}',NULL,'2023-02-25 21:58:15','45.184.180.231'),(18,1,2,'Module: trunk  {\"id\":0,\"trunkcode\":\"Vox-Gold\",\"trunkprefix\":\"0011101\",\"providertech\":\"sip\",\"providerip\":\"\",\"removeprefix\":\"\",\"secondusedreal\":0,\"creationdate\":null,\"failover_trunk\":null,\"fromdomain\":\"\",\"addparameter\":\"\",\"id_provider\":1,\"inuse\":\"\",\"maxuse\":\"-1\",\"status\":1,\"if_max_use\":\"\",\"user\":\"\",\"secret\":\"\",\"allow\":\"g729,g723,gsm,g726,opus,alaw,ulaw,g722\",\"link_sms\":\"\",\"directmedia\":\"no\",\"context\":\"billing\",\"dtmfmode\":\"RFC2833\",\"insecure\":\"port,invite\",\"nat\":\"force_rport,comedia\",\"qualify\":\"yes\",\"type\":\"peer\",\"disallow\":\"all\",\"host\":\"sbc.voxbeam.com\",\"sms_res\":\"\",\"register\":0,\"language\":\"\",\"allow_error\":0,\"fromuser\":\"\",\"port\":5060,\"encryption\":\"\",\"transport\":\"\",\"sendrpid\":\"no\",\"cnl\":0,\"cid_add\":\"\",\"cid_remove\":\"\",\"register_string\":\"\",\"sip_config\":\"\",\"short_time_call\":0}',NULL,'2023-02-25 22:00:19','45.184.180.231'),(19,1,2,'Module: trunk  {\"id\":0,\"trunkcode\":\"Vox-Platinum\",\"trunkprefix\":\"0011102\",\"providertech\":\"sip\",\"providerip\":\"\",\"removeprefix\":\"\",\"secondusedreal\":0,\"creationdate\":null,\"failover_trunk\":null,\"fromdomain\":\"\",\"addparameter\":\"\",\"id_provider\":2,\"inuse\":\"\",\"maxuse\":\"-1\",\"status\":1,\"if_max_use\":\"\",\"user\":\"\",\"secret\":\"\",\"allow\":\"g729,g723,gsm,g726,opus,alaw,ulaw,g722\",\"link_sms\":\"\",\"directmedia\":\"no\",\"context\":\"billing\",\"dtmfmode\":\"RFC2833\",\"insecure\":\"port,invite\",\"nat\":\"force_rport,comedia\",\"qualify\":\"yes\",\"type\":\"peer\",\"disallow\":\"all\",\"host\":\"sbc.voxbeam.com\",\"sms_res\":\"\",\"register\":0,\"language\":\"\",\"allow_error\":0,\"fromuser\":\"\",\"port\":5060,\"encryption\":\"\",\"transport\":\"\",\"sendrpid\":\"no\",\"cnl\":0,\"cid_add\":\"\",\"cid_remove\":\"\",\"register_string\":\"\",\"sip_config\":\"\",\"short_time_call\":0}',NULL,'2023-02-25 22:00:55','45.184.180.231'),(20,1,2,'Module: trunk  {\"id\":0,\"trunkcode\":\"Vox-Silver\",\"trunkprefix\":\"0011103\",\"providertech\":\"sip\",\"providerip\":\"\",\"removeprefix\":\"\",\"secondusedreal\":0,\"creationdate\":null,\"failover_trunk\":null,\"fromdomain\":\"\",\"addparameter\":\"\",\"id_provider\":3,\"inuse\":\"\",\"maxuse\":\"-1\",\"status\":1,\"if_max_use\":\"\",\"user\":\"\",\"secret\":\"\",\"allow\":\"g729,g723,gsm,g726,opus,alaw,ulaw,g722\",\"link_sms\":\"\",\"directmedia\":\"no\",\"context\":\"billing\",\"dtmfmode\":\"RFC2833\",\"insecure\":\"port,invite\",\"nat\":\"force_rport,comedia\",\"qualify\":\"yes\",\"type\":\"peer\",\"disallow\":\"all\",\"host\":\"sbc.voxbeam.com\",\"sms_res\":\"\",\"register\":0,\"language\":\"\",\"allow_error\":0,\"fromuser\":\"\",\"port\":5060,\"encryption\":\"\",\"transport\":\"\",\"sendrpid\":\"no\",\"cnl\":0,\"cid_add\":\"\",\"cid_remove\":\"\",\"register_string\":\"\",\"sip_config\":\"\",\"short_time_call\":0}',NULL,'2023-02-25 22:01:53','45.184.180.231'),(21,1,2,'Module: trunk  {\"id\":0,\"trunkcode\":\"Vox-Call-Center\",\"trunkprefix\":\"0011104\",\"providertech\":\"sip\",\"providerip\":\"\",\"removeprefix\":\"\",\"secondusedreal\":0,\"creationdate\":null,\"failover_trunk\":null,\"fromdomain\":\"\",\"addparameter\":\"\",\"id_provider\":4,\"inuse\":\"\",\"maxuse\":\"-1\",\"status\":1,\"if_max_use\":\"\",\"user\":\"\",\"secret\":\"\",\"allow\":\"g729,g723,gsm,g726,opus,alaw,ulaw,g722\",\"link_sms\":\"\",\"directmedia\":\"no\",\"context\":\"billing\",\"dtmfmode\":\"RFC2833\",\"insecure\":\"port,invite\",\"nat\":\"force_rport,comedia\",\"qualify\":\"yes\",\"type\":\"peer\",\"disallow\":\"all\",\"host\":\"sbc.voxbeam.com\",\"sms_res\":\"\",\"register\":0,\"language\":\"\",\"allow_error\":0,\"fromuser\":\"\",\"port\":5060,\"encryption\":\"\",\"transport\":\"\",\"sendrpid\":\"no\",\"cnl\":0,\"cid_add\":\"\",\"cid_remove\":\"\",\"register_string\":\"\",\"sip_config\":\"\",\"short_time_call\":0}',NULL,'2023-02-25 22:02:28','45.184.180.231'),(22,1,2,'Module: trunkgroup  {\"id\":0,\"name\":\"Vox-Call-Center\",\"type\":1,\"description\":\"\",\"weight\":\"\"}',NULL,'2023-02-25 22:03:19','45.184.180.231'),(23,1,2,'Module: trunkgroup  {\"id\":0,\"name\":\"Vox-Silver\",\"type\":1,\"description\":\"\",\"weight\":\"\"}',NULL,'2023-02-25 22:03:49','45.184.180.231'),(24,1,2,'Module: trunkgroup  {\"id\":0,\"name\":\"Vox-Platinum\",\"type\":1,\"description\":\"\",\"weight\":\"\"}',NULL,'2023-02-25 22:04:07','45.184.180.231'),(25,1,2,'Module: trunkgroup  {\"id\":0,\"name\":\"Vox-Gold\",\"type\":1,\"description\":\"\",\"weight\":\"\"}',NULL,'2023-02-25 22:04:33','45.184.180.231'),(26,1,2,'Module: plan  {\"id_services_array\":\"\",\"name\":\"Vox-Gold\",\"signup\":\"0\",\"ini_credit\":\"0.0000\",\"play_audio\":\"1\",\"portabilidadeMobile\":\"0\",\"portabilidadeFixed\":\"0\",\"techprefix\":\"\",\"id\":\"0\",\"id_user\":1}',NULL,'2023-02-25 22:22:50','45.184.180.231'),(27,1,2,'Module: plan  {\"id_services_array\":\"\",\"name\":\"Vox-Platinum\",\"signup\":\"0\",\"ini_credit\":\"0.0000\",\"play_audio\":\"1\",\"portabilidadeMobile\":\"0\",\"portabilidadeFixed\":\"0\",\"techprefix\":\"\",\"id\":\"0\",\"id_user\":1}',NULL,'2023-02-25 22:23:06','45.184.180.231'),(28,1,2,'Module: plan  {\"id_services_array\":\"\",\"name\":\"Vox-Silver\",\"signup\":\"0\",\"ini_credit\":\"0.0000\",\"play_audio\":\"1\",\"portabilidadeMobile\":\"0\",\"portabilidadeFixed\":\"0\",\"techprefix\":\"\",\"id\":\"0\",\"id_user\":1}',NULL,'2023-02-25 22:23:23','45.184.180.231'),(29,1,2,'Module: plan  {\"id_services_array\":\"\",\"name\":\"Vox-Call-Center\",\"signup\":\"0\",\"ini_credit\":\"0.0000\",\"play_audio\":\"1\",\"portabilidadeMobile\":\"0\",\"portabilidadeFixed\":\"0\",\"techprefix\":\"\",\"id\":\"0\",\"id_user\":1}',NULL,'2023-02-25 22:23:38','45.184.180.231'),(30,1,2,'Module: prefix  {\"id\":0,\"prefix\":\"55\",\"destination\":\"Brasil, Geral\",\"id_services_array\":\"\"}',NULL,'2023-02-25 22:25:04','45.184.180.231'),(31,1,5,'Module: rate  {}',NULL,'2023-02-25 23:10:51','45.184.180.231'),(32,1,5,'Module: rate  {}',NULL,'2023-02-25 23:12:05','45.184.180.231'),(33,1,5,'Module: rate  {}',NULL,'2023-02-25 23:12:52','45.184.180.231'),(34,1,5,'Module: rate  {}',NULL,'2023-02-25 23:13:29','45.184.180.231'),(35,1,2,'Module: user  {\"id\":0,\"id_group\":3,\"id_plan\":1,\"offer\":0,\"id_user\":1,\"id_offer\":null,\"username\":\"621105\",\"password\":\"passion11\",\"active\":1,\"credit\":0,\"enableexpire\":0,\"expiredays\":0,\"status\":0,\"typepaid\":0,\"creditlimit\":0,\"credit_notification\":-1,\"restriction\":0,\"callingcard_pin\":996481,\"callshop\":0,\"plan_day\":0,\"active_paypal\":0,\"boleto\":0,\"lastname\":\"\",\"firstname\":\"\",\"redial\":\"\",\"tag\":\"\",\"company_name\":\"\",\"commercial_name\":\"\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"55\",\"loginkey\":\"\",\"zipcode\":\"\",\"phone\":\"\",\"mobile\":\"\",\"email\":\"\",\"doc\":\"\",\"vat\":\"\",\"language\":\"br\",\"company_website\":\"\",\"prefix_local\":\"0\\/55\\/11,0\\/55\\/12,*\\/5562\\/8,*\\/5562\\/9\",\"boleto_day\":0,\"firstusedate\":null,\"expirationdate\":null,\"lastuse\":null,\"description\":\"\",\"creationdate\":null,\"id_group_agent\":null,\"calllimit\":-1,\"mix_monitor_format\":\"gsm\",\"disk_space\":-1,\"sipaccountlimit\":-1,\"cpslimit\":-1,\"sip_count\":0,\"dist\":\"\",\"state_number\":\"\",\"neighborhood\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"calllimit_error\":\"503\",\"restriction_use\":1,\"transfer_international\":0,\"transfer_international_profit\":null,\"transfer_flexiload\":0,\"transfer_flexiload_profit\":null,\"transfer_bkash\":0,\"transfer_bkash_profit\":null,\"transfer_dbbl_rocket\":0,\"transfer_dbbl_rocket_profit\":null,\"transfer_bdservice_rate\":null,\"transfer_show_selling_price\":null}',NULL,'2023-02-25 23:17:00','45.184.180.231'),(36,1,2,'Module: user  {\"id\":0,\"id_group\":3,\"id_plan\":3,\"offer\":0,\"id_user\":1,\"id_offer\":null,\"username\":\"623781\",\"password\":\"passion11\",\"active\":1,\"credit\":0,\"enableexpire\":0,\"expiredays\":0,\"status\":0,\"typepaid\":0,\"creditlimit\":0,\"credit_notification\":-1,\"restriction\":0,\"callingcard_pin\":797278,\"callshop\":0,\"plan_day\":0,\"active_paypal\":0,\"boleto\":0,\"lastname\":\"\",\"firstname\":\"\",\"redial\":\"\",\"tag\":\"\",\"company_name\":\"\",\"commercial_name\":\"\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"55\",\"loginkey\":\"\",\"zipcode\":\"\",\"phone\":\"\",\"mobile\":\"\",\"email\":\"\",\"doc\":\"\",\"vat\":\"\",\"language\":\"br\",\"company_website\":\"\",\"prefix_local\":\"0\\/55\\/11,0\\/55\\/12,*\\/5511\\/8,*\\/5511\\/9\",\"boleto_day\":0,\"firstusedate\":null,\"expirationdate\":null,\"lastuse\":null,\"description\":\"\",\"creationdate\":null,\"id_group_agent\":null,\"calllimit\":-1,\"mix_monitor_format\":\"gsm\",\"disk_space\":-1,\"sipaccountlimit\":-1,\"cpslimit\":-1,\"sip_count\":0,\"dist\":\"\",\"state_number\":\"\",\"neighborhood\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"calllimit_error\":\"503\",\"restriction_use\":1,\"transfer_international\":0,\"transfer_international_profit\":null,\"transfer_flexiload\":0,\"transfer_flexiload_profit\":null,\"transfer_bkash\":0,\"transfer_bkash_profit\":null,\"transfer_dbbl_rocket\":0,\"transfer_dbbl_rocket_profit\":null,\"transfer_bdservice_rate\":null,\"transfer_show_selling_price\":null}',NULL,'2023-02-25 23:17:44','45.184.180.231'),(37,1,2,'Module: refill  {\"id\":\"0\",\"id_user\":\"2\",\"credit\":\"15.0000\",\"description\":\"sdfsdfsgrege\",\"payment\":\"1\",\"date\":\"2023-02-25 20:16:53\",\"invoice_number\":\"\"}',NULL,'2023-02-25 23:18:11','45.184.180.231'),(38,1,2,'Module: refill  {\"id\":\"0\",\"id_user\":\"3\",\"credit\":\"11.0000\",\"description\":\"regehrthtrtrthrth\",\"payment\":\"1\",\"date\":\"2023-02-25 20:16:53\",\"invoice_number\":\"\"}',NULL,'2023-02-25 23:18:33','45.184.180.231'),(39,1,2,'Module: sip  {\"allow\":\"g729,g723,gsm,g726,opus,alaw,ulaw,g722\",\"extension\":\"\",\"voicemail_email\":\"\",\"sip_config\":\"\",\"sipshowpeer\":\"Array\\n(\\n    [data] => Privilege: Command\\n\\n\\n  * Name       : 623781\\n  Description  : \\n  Secret       : <Set>\\n  MD5Secret    : <Not set>\\n  Remote Secret: <Not set>\\n  Context      : billing\\n  Record On feature : automon\\n  Record Off feature : automon\\n  Subscr.Cont. : <Not set>\\n  Language     : br\\n  Tonezone     : <Not set>\\n  Accountcode  : 623781\\n  AMA flags    : Unknown\\n  Transfer mode: closed\\n  CallingPres  : Presentation Allowed, Not Screened\\n  FromDomain   : dynamic Port 5060\\n  Callgroup    : \\n  Pickupgroup  : \\n  Named Callgr : \\n  Nam. Pickupgr: \\n  MOH Suggest  : \\n  Mailbox      : \\n  VM Extension : asterisk\\n  LastMsgsSent : 0\\/0\\n  Call limit   : 0\\n  Max forwards : 0\\n  Dynamic      : Yes\\n  Callerid     : \\\"\\\" <>\\n  MaxCallBR    : 384 kbps\\n  Expire       : 52\\n  Insecure     : no\\n  Force rport  : Yes\\n  Symmetric RTP: Yes\\n  ACL          : No\\n  ContactACL   : No\\n  DirectMedACL : No\\n  T.38 support : No\\n  T.38 EC mode : Unknown\\n  T.38 MaxDtgrm: 4294967295\\n  DirectMedia  : No\\n  PromiscRedir : No\\n  User=Phone   : No\\n  Video Support: No\\n  Text Support : No\\n  Ign SDP ver  : No\\n  Trust RPID   : No\\n  Send RPID    : No\\n  Path support : No\\n  Path         : N\\/A\\n  TrustIDOutbnd: Legacy\\n  Subscriptions: No\\n  Overlap dial : Yes\\n  DTMFmode     : rfc2833\\n  Timer T1     : 500\\n  Timer B      : 32000\\n  ToHost       : \\n  Addr->IP     : 45.184.180.231:10699\\n  Defaddr->IP  : (null)\\n  Prim.Transp. : UDP\\n  Allowed.Trsp : UDP\\n  Def. Username: 623781\\n  SIP Options  : (none)\\n  Codecs       : (g729|gsm|alaw|ulaw)\\n  Auto-Framing : No\\n  Status       : OK (16 ms)\\n  Useragent    : PortSIP Softphone Win - v21.0.57\\n  Reg. Contact : sip:623781@45.184.180.231:10699\\n  Qualify Freq : 60000 ms\\n  Keepalive    : 0 ms\\n  Sess-Timers  : Accept\\n  Sess-Refresh : uas\\n  Sess-Expires : 1800 secs\\n  Min-Sess     : 90 secs\\n  RTP Engine   : asterisk\\n  Parkinglot   : \\n  Use Reason   : No\\n  Encryption   : No\\n  RTCP Mux     : No\\n\\n\\n    [Response] => Follows\\n)\\n\",\"id\":2}',NULL,'2023-02-25 23:23:15','45.184.180.231'),(40,1,2,'Module: sip  {\"allow\":\"g729,g723,gsm,g726,opus,alaw,ulaw,g722\",\"extension\":\"\",\"voicemail_email\":\"\",\"sip_config\":\"\",\"sipshowpeer\":\"Array\\n(\\n    [data] => Privilege: Command\\n\\n\\n  * Name       : 621105\\n  Description  : \\n  Secret       : <Set>\\n  MD5Secret    : <Not set>\\n  Remote Secret: <Not set>\\n  Context      : billing\\n  Record On feature : automon\\n  Record Off feature : automon\\n  Subscr.Cont. : <Not set>\\n  Language     : br\\n  Tonezone     : <Not set>\\n  Accountcode  : 621105\\n  AMA flags    : Unknown\\n  Transfer mode: closed\\n  CallingPres  : Presentation Allowed, Not Screened\\n  FromDomain   : dynamic Port 5060\\n  Callgroup    : \\n  Pickupgroup  : \\n  Named Callgr : \\n  Nam. Pickupgr: \\n  MOH Suggest  : \\n  Mailbox      : \\n  VM Extension : asterisk\\n  LastMsgsSent : 0\\/0\\n  Call limit   : 0\\n  Max forwards : 0\\n  Dynamic      : Yes\\n  Callerid     : \\\"\\\" <>\\n  MaxCallBR    : 384 kbps\\n  Expire       : -1\\n  Insecure     : no\\n  Force rport  : Yes\\n  Symmetric RTP: Yes\\n  ACL          : No\\n  ContactACL   : No\\n  DirectMedACL : No\\n  T.38 support : No\\n  T.38 EC mode : Unknown\\n  T.38 MaxDtgrm: 4294967295\\n  DirectMedia  : No\\n  PromiscRedir : No\\n  User=Phone   : No\\n  Video Support: No\\n  Text Support : No\\n  Ign SDP ver  : No\\n  Trust RPID   : No\\n  Send RPID    : No\\n  Path support : No\\n  Path         : N\\/A\\n  TrustIDOutbnd: Legacy\\n  Subscriptions: No\\n  Overlap dial : Yes\\n  DTMFmode     : rfc2833\\n  Timer T1     : 500\\n  Timer B      : 32000\\n  ToHost       : \\n  Addr->IP     : (null)\\n  Defaddr->IP  : (null)\\n  Prim.Transp. : UDP\\n  Allowed.Trsp : UDP\\n  Def. Username: 621105\\n  SIP Options  : (none)\\n  Codecs       : (g729|gsm|alaw|ulaw)\\n  Auto-Framing : No\\n  Status       : UNKNOWN\\n  Useragent    : \\n  Reg. Contact : \\n  Qualify Freq : 60000 ms\\n  Keepalive    : 0 ms\\n  Sess-Timers  : Accept\\n  Sess-Refresh : uas\\n  Sess-Expires : 1800 secs\\n  Min-Sess     : 90 secs\\n  RTP Engine   : asterisk\\n  Parkinglot   : \\n  Use Reason   : No\\n  Encryption   : No\\n  RTCP Mux     : No\\n\\n\\n    [Response] => Follows\\n)\\n\",\"id\":1}',NULL,'2023-02-25 23:23:23','45.184.180.231'),(41,1,2,'Module: prefix  {\"id\":0,\"prefix\":\"55629\",\"destination\":\"Brasil, Gyn, Celular\"}',NULL,'2023-02-25 23:55:23','45.184.180.231'),(42,1,2,'Module: rate  {\"id_trunk_group\":1,\"id\":2}',NULL,'2023-02-25 23:56:05','45.184.180.231'),(43,1,2,'Module: rate  {\"id_trunk_group\":4,\"id\":2}',NULL,'2023-02-25 23:56:15','45.184.180.231'),(44,1,2,'Module: rate  {\"id\":0,\"id_plan\":3,\"id_trunk_group\":2,\"id_prefix\":489,\"rateinitial\":0.45,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-02-25 23:57:37','45.184.180.231'),(45,1,2,'Module: user  {\"prefix_local\":\"0\\/55\\/11,0\\/55\\/12,*\\/5562\\/8,*\\/5562\\/9\",\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":3}',NULL,'2023-02-26 00:01:21','45.184.180.231'),(46,1,2,'Module: user  {\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 00:01:27','45.184.180.231'),(47,1,5,'Module: rate  {}',NULL,'2023-02-26 00:27:08','45.184.180.231'),(48,1,5,'Module: rate  {}',NULL,'2023-02-26 00:27:38','45.184.180.231'),(49,1,5,'Module: rate  {}',NULL,'2023-02-26 00:28:02','45.184.180.231'),(50,1,5,'Module: rate  {}',NULL,'2023-02-26 00:28:21','45.184.180.231'),(51,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 00:30:25','45.184.180.231'),(52,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":3}',NULL,'2023-02-26 00:30:33','45.184.180.231'),(53,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 00:32:05','45.184.180.231'),(54,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":3}',NULL,'2023-02-26 00:32:15','45.184.180.231'),(55,1,2,'Module: trunk  {\"status\":0,\"id\":1}',NULL,'2023-02-26 00:33:46','45.184.180.231'),(56,1,2,'Module: trunk  {\"status\":0,\"id\":2}',NULL,'2023-02-26 00:33:51','45.184.180.231'),(57,1,2,'Module: trunk  {\"status\":0,\"id\":3}',NULL,'2023-02-26 00:33:56','45.184.180.231'),(58,1,2,'Module: trunk  {\"status\":0,\"id\":4}',NULL,'2023-02-26 00:34:02','45.184.180.231'),(59,1,2,'Module: trunk  {\"status\":1,\"id\":1,\"short_time_call\":0}',NULL,'2023-02-26 00:34:09','45.184.180.231'),(60,1,2,'Module: trunk  {\"status\":1,\"id\":2,\"short_time_call\":0}',NULL,'2023-02-26 00:34:16','45.184.180.231'),(61,1,2,'Module: trunk  {\"status\":1,\"id\":3,\"short_time_call\":0}',NULL,'2023-02-26 00:34:21','45.184.180.231'),(62,1,2,'Module: trunk  {\"status\":1,\"id\":4,\"short_time_call\":0}',NULL,'2023-02-26 00:34:26','45.184.180.231'),(63,1,2,'Module: sip  {\"callerid\":\"981340509\",\"record_call\":1,\"extension\":\"\",\"sipshowpeer\":\"Array\\n(\\n    [data] => Privilege: Command\\n\\n\\n  * Name       : 621105\\n  Description  : \\n  Secret       : <Set>\\n  MD5Secret    : <Not set>\\n  Remote Secret: <Not set>\\n  Context      : billing\\n  Record On feature : automon\\n  Record Off feature : automon\\n  Subscr.Cont. : <Not set>\\n  Language     : br\\n  Tonezone     : <Not set>\\n  Accountcode  : 621105\\n  AMA flags    : Unknown\\n  Transfer mode: closed\\n  CallingPres  : Presentation Allowed, Not Screened\\n  FromDomain   : dynamic Port 5060\\n  Callgroup    : \\n  Pickupgroup  : \\n  Named Callgr : \\n  Nam. Pickupgr: \\n  MOH Suggest  : \\n  Mailbox      : \\n  VM Extension : asterisk\\n  LastMsgsSent : 0\\/0\\n  Call limit   : 0\\n  Max forwards : 0\\n  Dynamic      : Yes\\n  Callerid     : \\\"\\\" <>\\n  MaxCallBR    : 384 kbps\\n  Expire       : 3561\\n  Insecure     : no\\n  Force rport  : Yes\\n  Symmetric RTP: Yes\\n  ACL          : No\\n  ContactACL   : No\\n  DirectMedACL : No\\n  T.38 support : No\\n  T.38 EC mode : Unknown\\n  T.38 MaxDtgrm: 4294967295\\n  DirectMedia  : No\\n  PromiscRedir : No\\n  User=Phone   : No\\n  Video Support: No\\n  Text Support : No\\n  Ign SDP ver  : No\\n  Trust RPID   : No\\n  Send RPID    : No\\n  Path support : No\\n  Path         : N\\/A\\n  TrustIDOutbnd: Legacy\\n  Subscriptions: No\\n  Overlap dial : Yes\\n  DTMFmode     : rfc2833\\n  Timer T1     : 500\\n  Timer B      : 32000\\n  ToHost       : \\n  Addr->IP     : 45.184.180.231:5060\\n  Defaddr->IP  : (null)\\n  Prim.Transp. : UDP\\n  Allowed.Trsp : UDP\\n  Def. Username: 621105\\n  SIP Options  : (none)\\n  Codecs       : (g729|g723|gsm|g726|opus|alaw|ulaw|g722)\\n  Auto-Framing : No\\n  Status       : OK (18 ms)\\n  Useragent    : Z 3.15.40006 rv2.8.20\\n  Reg. Contact : sip:621105@45.184.180.231:5060;rinstance=e019315d0f0f33ec;transport=UDP\\n  Qualify Freq : 60000 ms\\n  Keepalive    : 0 ms\\n  Sess-Timers  : Accept\\n  Sess-Refresh : uas\\n  Sess-Expires : 1800 secs\\n  Min-Sess     : 90 secs\\n  RTP Engine   : asterisk\\n  Parkinglot   : \\n  Use Reason   : No\\n  Encryption   : No\\n  RTCP Mux     : No\\n\\n\\n    [Response] => Follows\\n)\\n\",\"id\":1,\"cid_number\":\"981340509\"}',NULL,'2023-02-26 00:35:47','45.184.180.231'),(64,1,2,'Module: sip  {\"callerid\":\"991261195\",\"record_call\":1,\"extension\":\"\",\"sipshowpeer\":\"Array\\n(\\n    [data] => Privilege: Command\\n\\n\\n  * Name       : 623781\\n  Description  : \\n  Secret       : <Set>\\n  MD5Secret    : <Not set>\\n  Remote Secret: <Not set>\\n  Context      : billing\\n  Record On feature : automon\\n  Record Off feature : automon\\n  Subscr.Cont. : <Not set>\\n  Language     : br\\n  Tonezone     : <Not set>\\n  Accountcode  : 623781\\n  AMA flags    : Unknown\\n  Transfer mode: closed\\n  CallingPres  : Presentation Allowed, Not Screened\\n  FromDomain   : dynamic Port 5060\\n  Callgroup    : \\n  Pickupgroup  : \\n  Named Callgr : \\n  Nam. Pickupgr: \\n  MOH Suggest  : \\n  Mailbox      : \\n  VM Extension : asterisk\\n  LastMsgsSent : 0\\/0\\n  Call limit   : 0\\n  Max forwards : 0\\n  Dynamic      : Yes\\n  Callerid     : \\\"\\\" <>\\n  MaxCallBR    : 384 kbps\\n  Expire       : 3608\\n  Insecure     : no\\n  Force rport  : Yes\\n  Symmetric RTP: Yes\\n  ACL          : No\\n  ContactACL   : No\\n  DirectMedACL : No\\n  T.38 support : No\\n  T.38 EC mode : Unknown\\n  T.38 MaxDtgrm: 4294967295\\n  DirectMedia  : No\\n  PromiscRedir : No\\n  User=Phone   : No\\n  Video Support: No\\n  Text Support : No\\n  Ign SDP ver  : No\\n  Trust RPID   : No\\n  Send RPID    : No\\n  Path support : No\\n  Path         : N\\/A\\n  TrustIDOutbnd: Legacy\\n  Subscriptions: No\\n  Overlap dial : Yes\\n  DTMFmode     : rfc2833\\n  Timer T1     : 500\\n  Timer B      : 32000\\n  ToHost       : \\n  Addr->IP     : 45.184.180.231:5060\\n  Defaddr->IP  : (null)\\n  Prim.Transp. : UDP\\n  Allowed.Trsp : UDP\\n  Def. Username: 623781\\n  SIP Options  : (none)\\n  Codecs       : (g729|g723|gsm|g726|opus|alaw|ulaw|g722)\\n  Auto-Framing : No\\n  Status       : OK (22 ms)\\n  Useragent    : Z 3.15.40006 rv2.8.20\\n  Reg. Contact : sip:623781@45.184.180.231:5060;rinstance=7497b249b0a8ac87;transport=UDP\\n  Qualify Freq : 60000 ms\\n  Keepalive    : 0 ms\\n  Sess-Timers  : Accept\\n  Sess-Refresh : uas\\n  Sess-Expires : 1800 secs\\n  Min-Sess     : 90 secs\\n  RTP Engine   : asterisk\\n  Parkinglot   : \\n  Use Reason   : No\\n  Encryption   : No\\n  RTCP Mux     : No\\n\\n\\n    [Response] => Follows\\n)\\n\",\"id\":2,\"cid_number\":\"991261195\"}',NULL,'2023-02-26 00:36:24','45.184.180.231'),(65,1,1,'Username Login on the panel - User root',NULL,'2023-02-26 01:06:31','45.184.180.231'),(66,1,2,'Module: user  {\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 01:31:41','45.184.180.231'),(67,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 01:33:30','45.184.180.231'),(68,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 01:34:18','45.184.180.231'),(69,1,5,'Module: rate  {}',NULL,'2023-02-26 02:52:43','45.184.180.231'),(70,1,5,'Module: rate  {}',NULL,'2023-02-26 02:53:09','45.184.180.231'),(71,1,5,'Module: rate  {}',NULL,'2023-02-26 02:53:36','45.184.180.231'),(72,1,5,'Module: rate  {}',NULL,'2023-02-26 02:54:06','45.184.180.231'),(73,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 02:55:52','45.184.180.231'),(74,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 02:56:31','45.184.180.231'),(75,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 02:59:02','45.184.180.231'),(76,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 02:59:30','45.184.180.231'),(77,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 03:01:20','45.184.180.231'),(78,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 03:01:47','45.184.180.231'),(79,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 03:02:29','45.184.180.231'),(80,1,3,'Module callfailed  [{\"id\":34},{\"id\":33},{\"id\":32},{\"id\":31},{\"id\":30},{\"id\":29},{\"id\":28},{\"id\":27},{\"id\":26},{\"id\":25},{\"id\":24},{\"id\":23},{\"id\":22},{\"id\":21},{\"id\":20},{\"id\":19},{\"id\":18},{\"id\":17},{\"id\":16},{\"id\":15},{\"id\":14},{\"id\":13},{\"id\":12},{\"id\":11},{\"id\":10}]',NULL,'2023-02-26 03:11:31','45.184.180.231'),(81,1,3,'Module callfailed  [{\"id\":9},{\"id\":8},{\"id\":7},{\"id\":6},{\"id\":5},{\"id\":4},{\"id\":3},{\"id\":2},{\"id\":1}]',NULL,'2023-02-26 03:11:37','45.184.180.231'),(82,1,1,'Username Login on the panel - User root',NULL,'2023-02-26 10:39:48','45.184.180.231'),(83,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 10:46:15','45.184.180.231'),(84,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 10:47:57','45.184.180.231'),(85,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 10:49:36','45.184.180.231'),(86,1,3,'Module callfailed  {\"id\":35}',NULL,'2023-02-26 11:07:11','45.184.180.231'),(87,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 11:09:06','45.184.180.231'),(88,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 11:09:32','45.184.180.231'),(89,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 11:09:53','45.184.180.231'),(90,1,2,'Module: sip  {\"callerid\":\"991253305\",\"extension\":\"\",\"sipshowpeer\":\"Array\\n(\\n    [data] => Privilege: Command\\n\\n\\n  * Name       : 621105\\n  Description  : \\n  Secret       : <Set>\\n  MD5Secret    : <Not set>\\n  Remote Secret: <Not set>\\n  Context      : billing\\n  Record On feature : automon\\n  Record Off feature : automon\\n  Subscr.Cont. : <Not set>\\n  Language     : br\\n  Tonezone     : <Not set>\\n  Accountcode  : 621105\\n  AMA flags    : Unknown\\n  Transfer mode: closed\\n  CallingPres  : Presentation Allowed, Not Screened\\n  FromDomain   : dynamic Port 5060\\n  Callgroup    : \\n  Pickupgroup  : \\n  Named Callgr : \\n  Nam. Pickupgr: \\n  MOH Suggest  : \\n  Mailbox      : \\n  VM Extension : asterisk\\n  LastMsgsSent : 0\\/0\\n  Call limit   : 0\\n  Max forwards : 0\\n  Dynamic      : Yes\\n  Callerid     : \\\"\\\" <981340509>\\n  MaxCallBR    : 384 kbps\\n  Expire       : 3504\\n  Insecure     : no\\n  Force rport  : Yes\\n  Symmetric RTP: Yes\\n  ACL          : No\\n  ContactACL   : No\\n  DirectMedACL : No\\n  T.38 support : No\\n  T.38 EC mode : Unknown\\n  T.38 MaxDtgrm: 4294967295\\n  DirectMedia  : No\\n  PromiscRedir : No\\n  User=Phone   : No\\n  Video Support: No\\n  Text Support : No\\n  Ign SDP ver  : No\\n  Trust RPID   : No\\n  Send RPID    : No\\n  Path support : No\\n  Path         : N\\/A\\n  TrustIDOutbnd: Legacy\\n  Subscriptions: No\\n  Overlap dial : Yes\\n  DTMFmode     : rfc2833\\n  Timer T1     : 500\\n  Timer B      : 32000\\n  ToHost       : \\n  Addr->IP     : 45.184.180.231:1024\\n  Defaddr->IP  : (null)\\n  Prim.Transp. : UDP\\n  Allowed.Trsp : UDP\\n  Def. Username: 621105\\n  SIP Options  : (none)\\n  Codecs       : (g729|g723|gsm|g726|opus|alaw|ulaw|g722)\\n  Auto-Framing : No\\n  Status       : OK (17 ms)\\n  Useragent    : Z 3.15.40006 rv2.8.20\\n  Reg. Contact : sip:621105@45.184.180.231:1024;rinstance=17ec735899b5eac7;transport=UDP\\n  Qualify Freq : 60000 ms\\n  Keepalive    : 0 ms\\n  Sess-Timers  : Accept\\n  Sess-Refresh : uas\\n  Sess-Expires : 1800 secs\\n  Min-Sess     : 90 secs\\n  RTP Engine   : asterisk\\n  Parkinglot   : \\n  Use Reason   : No\\n  Encryption   : No\\n  RTCP Mux     : No\\n\\n\\n    [Response] => Follows\\n)\\n\",\"id\":1,\"cid_number\":\"991253305\"}',NULL,'2023-02-26 11:11:58','45.184.180.231'),(91,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 11:12:11','45.184.180.231'),(92,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 11:12:32','45.184.180.231'),(93,1,3,'Module call  [{\"id\":8},{\"id\":7},{\"id\":6},{\"id\":5},{\"id\":4},{\"id\":3},{\"id\":2},{\"id\":1}]',NULL,'2023-02-26 11:16:16','45.184.180.231'),(94,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 11:16:40','45.184.180.231'),(95,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 11:57:02','45.184.180.231'),(96,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 11:57:53','45.184.180.231'),(97,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 11:58:26','45.184.180.231'),(98,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 11:59:15','45.184.180.231'),(99,1,2,'Module: trunk  {\"allow\":\"g723,gsm,g726,opus,alaw,ulaw,g722\",\"status\":0,\"id\":4}',NULL,'2023-02-26 11:59:34','45.184.180.231'),(100,1,2,'Module: trunk  {\"allow\":\"g723,gsm,g726,opus,alaw,ulaw,g722\",\"status\":0,\"id\":3}',NULL,'2023-02-26 11:59:40','45.184.180.231'),(101,1,2,'Module: trunk  {\"allow\":\"g723,gsm,g726,opus,alaw,ulaw,g722\",\"status\":0,\"id\":2}',NULL,'2023-02-26 11:59:48','45.184.180.231'),(102,1,2,'Module: trunk  {\"allow\":\"g723,gsm,g726,opus,alaw,ulaw,g722\",\"status\":0,\"id\":1}',NULL,'2023-02-26 11:59:57','45.184.180.231'),(103,1,2,'Module: sip  {\"allow\":\"g723,gsm,g726,opus,alaw,ulaw,g722\",\"extension\":\"\",\"sipshowpeer\":\"Array\\n(\\n    [data] => Privilege: Command\\n\\n\\n  * Name       : 621105\\n  Description  : \\n  Secret       : <Set>\\n  MD5Secret    : <Not set>\\n  Remote Secret: <Not set>\\n  Context      : billing\\n  Record On feature : automon\\n  Record Off feature : automon\\n  Subscr.Cont. : <Not set>\\n  Language     : br\\n  Tonezone     : <Not set>\\n  Accountcode  : 621105\\n  AMA flags    : Unknown\\n  Transfer mode: closed\\n  CallingPres  : Presentation Allowed, Not Screened\\n  FromDomain   : dynamic Port 5060\\n  Callgroup    : \\n  Pickupgroup  : \\n  Named Callgr : \\n  Nam. Pickupgr: \\n  MOH Suggest  : \\n  Mailbox      : \\n  VM Extension : asterisk\\n  LastMsgsSent : 0\\/0\\n  Call limit   : 0\\n  Max forwards : 0\\n  Dynamic      : Yes\\n  Callerid     : \\\"\\\" <991253305>\\n  MaxCallBR    : 384 kbps\\n  Expire       : 3592\\n  Insecure     : no\\n  Force rport  : Yes\\n  Symmetric RTP: Yes\\n  ACL          : No\\n  ContactACL   : No\\n  DirectMedACL : No\\n  T.38 support : No\\n  T.38 EC mode : Unknown\\n  T.38 MaxDtgrm: 4294967295\\n  DirectMedia  : No\\n  PromiscRedir : No\\n  User=Phone   : No\\n  Video Support: No\\n  Text Support : No\\n  Ign SDP ver  : No\\n  Trust RPID   : No\\n  Send RPID    : No\\n  Path support : No\\n  Path         : N\\/A\\n  TrustIDOutbnd: Legacy\\n  Subscriptions: No\\n  Overlap dial : Yes\\n  DTMFmode     : rfc2833\\n  Timer T1     : 500\\n  Timer B      : 32000\\n  ToHost       : \\n  Addr->IP     : 45.184.180.231:1024\\n  Defaddr->IP  : (null)\\n  Prim.Transp. : UDP\\n  Allowed.Trsp : UDP\\n  Def. Username: 621105\\n  SIP Options  : (none)\\n  Codecs       : (g729|g723|gsm|g726|opus|alaw|ulaw|g722)\\n  Auto-Framing : No\\n  Status       : OK (23 ms)\\n  Useragent    : \\n  Reg. Contact : sip:621105@45.184.180.231:1024;rinstance=17ec735899b5eac7;transport=UDP\\n  Qualify Freq : 60000 ms\\n  Keepalive    : 0 ms\\n  Sess-Timers  : Accept\\n  Sess-Refresh : uas\\n  Sess-Expires : 1800 secs\\n  Min-Sess     : 90 secs\\n  RTP Engine   : asterisk\\n  Parkinglot   : \\n  Use Reason   : No\\n  Encryption   : No\\n  RTCP Mux     : No\\n\\n\\n    [Response] => Follows\\n)\\n\",\"id\":1}',NULL,'2023-02-26 12:00:11','45.184.180.231'),(104,1,2,'Module: sip  {\"allow\":\"g723,gsm,g726,opus,alaw,ulaw,g722\",\"extension\":\"\",\"sipshowpeer\":\"Array\\n(\\n    [data] => Privilege: Command\\n\\n\\n  * Name       : 623781\\n  Description  : \\n  Secret       : <Set>\\n  MD5Secret    : <Not set>\\n  Remote Secret: <Not set>\\n  Context      : billing\\n  Record On feature : automon\\n  Record Off feature : automon\\n  Subscr.Cont. : <Not set>\\n  Language     : br\\n  Tonezone     : <Not set>\\n  Accountcode  : 623781\\n  AMA flags    : Unknown\\n  Transfer mode: closed\\n  CallingPres  : Presentation Allowed, Not Screened\\n  FromDomain   : dynamic Port 5060\\n  Callgroup    : \\n  Pickupgroup  : \\n  Named Callgr : \\n  Nam. Pickupgr: \\n  MOH Suggest  : \\n  Mailbox      : \\n  VM Extension : asterisk\\n  LastMsgsSent : 0\\/0\\n  Call limit   : 0\\n  Max forwards : 0\\n  Dynamic      : Yes\\n  Callerid     : \\\"\\\" <991261195>\\n  MaxCallBR    : 384 kbps\\n  Expire       : 3609\\n  Insecure     : no\\n  Force rport  : Yes\\n  Symmetric RTP: Yes\\n  ACL          : No\\n  ContactACL   : No\\n  DirectMedACL : No\\n  T.38 support : No\\n  T.38 EC mode : Unknown\\n  T.38 MaxDtgrm: 4294967295\\n  DirectMedia  : No\\n  PromiscRedir : No\\n  User=Phone   : No\\n  Video Support: No\\n  Text Support : No\\n  Ign SDP ver  : No\\n  Trust RPID   : No\\n  Send RPID    : No\\n  Path support : No\\n  Path         : N\\/A\\n  TrustIDOutbnd: Legacy\\n  Subscriptions: No\\n  Overlap dial : Yes\\n  DTMFmode     : rfc2833\\n  Timer T1     : 500\\n  Timer B      : 32000\\n  ToHost       : \\n  Addr->IP     : 45.184.180.231:1024\\n  Defaddr->IP  : (null)\\n  Prim.Transp. : UDP\\n  Allowed.Trsp : UDP\\n  Def. Username: 623781\\n  SIP Options  : (none)\\n  Codecs       : (g729|g723|gsm|g726|opus|alaw|ulaw|g722)\\n  Auto-Framing : No\\n  Status       : OK (19 ms)\\n  Useragent    : \\n  Reg. Contact : sip:623781@45.184.180.231:1024;rinstance=d535042bd8116f6c;transport=UDP\\n  Qualify Freq : 60000 ms\\n  Keepalive    : 0 ms\\n  Sess-Timers  : Accept\\n  Sess-Refresh : uas\\n  Sess-Expires : 1800 secs\\n  Min-Sess     : 90 secs\\n  RTP Engine   : asterisk\\n  Parkinglot   : \\n  Use Reason   : No\\n  Encryption   : No\\n  RTCP Mux     : No\\n\\n\\n    [Response] => Follows\\n)\\n\",\"id\":2}',NULL,'2023-02-26 12:00:16','45.184.180.231'),(105,1,2,'Module: trunk  {\"status\":1,\"id\":1,\"short_time_call\":0}',NULL,'2023-02-26 12:00:30','45.184.180.231'),(106,1,2,'Module: trunk  {\"status\":1,\"id\":2,\"short_time_call\":0}',NULL,'2023-02-26 12:00:36','45.184.180.231'),(107,1,2,'Module: trunk  {\"status\":1,\"id\":3,\"short_time_call\":0}',NULL,'2023-02-26 12:00:43','45.184.180.231'),(108,1,2,'Module: trunk  {\"status\":1,\"id\":4,\"short_time_call\":0}',NULL,'2023-02-26 12:00:50','45.184.180.231'),(109,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 12:01:01','45.184.180.231'),(110,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 12:01:47','45.184.180.231'),(111,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 12:02:43','45.184.180.231'),(112,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 12:03:46','45.184.180.231'),(113,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 12:37:28','45.184.180.231'),(114,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 12:39:05','45.184.180.231'),(115,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 12:40:37','45.184.180.231'),(116,1,2,'Module: provider  {\"id\":0,\"provider_name\":\"Bridgevoice\",\"creationdate\":null,\"description\":\"\",\"credit_control\":0,\"credit\":11}',NULL,'2023-02-26 12:56:43','45.184.180.231'),(117,1,2,'Module: trunk  {\"id\":0,\"trunkcode\":\"Bridge-Platinum\",\"trunkprefix\":\"1111\",\"providertech\":\"sip\",\"providerip\":\"\",\"removeprefix\":\"\",\"secondusedreal\":0,\"creationdate\":null,\"failover_trunk\":null,\"fromdomain\":\"\",\"addparameter\":\"\",\"id_provider\":5,\"inuse\":\"\",\"maxuse\":\"-1\",\"status\":1,\"if_max_use\":\"\",\"user\":\"\",\"secret\":\"\",\"allow\":\"g723,gsm,g726,opus,alaw,ulaw,g722\",\"link_sms\":\"\",\"directmedia\":\"no\",\"context\":\"billing\",\"dtmfmode\":\"RFC2833\",\"insecure\":\"port,invite\",\"nat\":\"force_rport,comedia\",\"qualify\":\"yes\",\"type\":\"peer\",\"disallow\":\"all\",\"host\":\"204.15.169.92\",\"sms_res\":\"\",\"register\":0,\"language\":\"\",\"allow_error\":0,\"fromuser\":\"\",\"port\":5060,\"encryption\":\"\",\"transport\":\"\",\"sendrpid\":\"no\",\"cnl\":0,\"cid_add\":\"\",\"cid_remove\":\"\",\"register_string\":\"\",\"sip_config\":\"\",\"short_time_call\":0}',NULL,'2023-02-26 12:57:46','45.184.180.231'),(118,1,2,'Module: trunkgroup  {\"id\":0,\"name\":\"Bridge-Platinum\",\"type\":1,\"description\":\"\",\"weight\":\"\"}',NULL,'2023-02-26 12:58:54','45.184.180.231'),(119,1,2,'Module: plan  {\"id_services_array\":\"\",\"name\":\"Bridge-Platinum\",\"signup\":\"0\",\"ini_credit\":\"0.0000\",\"play_audio\":\"1\",\"portabilidadeMobile\":\"0\",\"portabilidadeFixed\":\"0\",\"techprefix\":\"\",\"id\":\"0\",\"id_user\":1}',NULL,'2023-02-26 12:59:52','45.184.180.231'),(120,1,2,'Module: rate  {\"id\":0,\"id_plan\":5,\"id_trunk_group\":5,\"id_prefix\":399,\"rateinitial\":0.19,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1,\"id_services_array\":\"\"}',NULL,'2023-02-26 13:02:46','45.184.180.231'),(121,1,2,'Module: user  {\"id_plan\":5,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id_services_array\":\"\",\"id\":2}',NULL,'2023-02-26 13:03:42','45.184.180.231'),(122,1,3,'Module callfailed  [{\"id\":49},{\"id\":48},{\"id\":47},{\"id\":46},{\"id\":45},{\"id\":44},{\"id\":43},{\"id\":42},{\"id\":41},{\"id\":40},{\"id\":39},{\"id\":38},{\"id\":37},{\"id\":36}]',NULL,'2023-02-26 13:05:31','45.184.180.231'),(123,1,2,'Module: trunk  {\"trunkprefix\":\"2222\",\"id_services_array\":\"\",\"id\":5}',NULL,'2023-02-26 13:08:11','45.184.180.231'),(124,1,2,'Module: trunk  {\"id_services_array\":\"\",\"id\":5}',NULL,'2023-02-26 13:09:13','45.184.180.231'),(125,1,2,'Module: trunk  {\"trunkprefix\":\"3333\",\"id_services_array\":\"\",\"id\":5}',NULL,'2023-02-26 13:13:37','45.184.180.231'),(126,1,2,'Module: trunk  {\"trunkprefix\":\"4494\",\"id_services_array\":\"\",\"id\":5}',NULL,'2023-02-26 13:18:14','45.184.180.231'),(127,1,2,'Module: rate  {\"id\":0,\"id_plan\":5,\"id_trunk_group\":5,\"id_prefix\":616,\"rateinitial\":0.35,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-02-26 17:23:30','45.184.180.231'),(128,1,2,'Module: trunk  {\"allow\":\"g729,g723,gsm,g726,opus,alaw,ulaw,g722\",\"status\":0,\"id\":5}',NULL,'2023-02-26 17:26:13','45.184.180.231'),(129,1,2,'Module: trunk  {\"status\":1,\"id\":5,\"short_time_call\":0}',NULL,'2023-02-26 17:26:21','45.184.180.231'),(130,1,2,'Module: trunk  {\"trunkprefix\":\"3333\",\"id\":5}',NULL,'2023-02-26 17:26:49','45.184.180.231'),(131,1,2,'Module: trunk  {\"trunkprefix\":\"2222\",\"id\":5}',NULL,'2023-02-26 17:27:11','45.184.180.231'),(132,1,2,'Module: trunk  {\"allow\":\"g723,gsm,g726,opus,alaw,ulaw,g722\",\"id\":5}',NULL,'2023-02-26 17:27:42','45.184.180.231'),(133,1,2,'Module: trunk  {\"trunkprefix\":\"3333\",\"id\":5}',NULL,'2023-02-26 17:31:16','45.184.180.231'),(134,1,2,'Module: trunk  {\"trunkprefix\":\"1111\",\"id\":5}',NULL,'2023-02-26 17:31:48','45.184.180.231'),(135,1,2,'Module: trunk  {\"removeprefix\":\"0000\",\"id\":5}',NULL,'2023-02-26 17:31:57','45.184.180.231'),(136,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-26 17:34:53','45.184.180.231'),(137,1,1,'Username Login on the panel - User root',NULL,'2023-02-27 10:27:31','45.184.180.231'),(138,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":3}',NULL,'2023-02-27 10:28:56','45.184.180.231'),(139,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-27 10:33:25','45.184.180.231'),(140,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-27 11:23:03','45.184.180.231'),(141,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-27 11:35:10','45.184.180.231'),(142,1,3,'Module call  [{\"id\":21},{\"id\":20},{\"id\":19},{\"id\":18},{\"id\":17},{\"id\":16},{\"id\":15}]',NULL,'2023-02-27 11:39:58','45.184.180.231'),(143,1,1,'Username Login on the panel - User root',NULL,'2023-02-27 14:32:33','45.184.180.231'),(144,1,2,'Module: configuration  {\"config_value\":\"1\",\"id\":280}',NULL,'2023-02-27 15:32:09','45.184.180.231'),(145,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":3}',NULL,'2023-02-27 16:38:32','45.184.180.231'),(146,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":3}',NULL,'2023-02-27 16:39:10','45.184.180.231'),(147,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-27 16:39:25','45.184.180.231'),(148,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-27 16:40:46','45.184.180.231'),(149,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-02-27 16:41:25','45.184.180.231'),(150,1,1,'Username Login on the panel - User root',NULL,'2023-02-28 03:45:12','45.184.180.231'),(151,1,1,'Username Login on the panel - User root',NULL,'2023-03-01 03:21:47','45.184.180.231'),(152,1,3,'Module callfailed  [{\"id\":82},{\"id\":81},{\"id\":80},{\"id\":79},{\"id\":78},{\"id\":77},{\"id\":76},{\"id\":75},{\"id\":74},{\"id\":73},{\"id\":72},{\"id\":71},{\"id\":70},{\"id\":69},{\"id\":68},{\"id\":67},{\"id\":66},{\"id\":65},{\"id\":64},{\"id\":63},{\"id\":62},{\"id\":61},{\"id\":60},{\"id\":59},{\"id\":58}]',NULL,'2023-03-01 03:22:11','45.184.180.231'),(153,1,1,'Username Login on the panel - User root',NULL,'2023-03-01 15:50:30','45.184.180.231'),(154,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-03-01 17:00:46','45.184.180.231'),(155,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-03-01 17:09:18','45.184.180.231'),(156,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-03-01 17:15:01','45.184.180.231'),(157,1,3,'Module callfailed  [{\"id\":83},{\"id\":57},{\"id\":56},{\"id\":55},{\"id\":54},{\"id\":53},{\"id\":52},{\"id\":51},{\"id\":50}]',NULL,'2023-03-01 17:17:45','45.184.180.231'),(158,1,1,'Username Login on the panel - User root',NULL,'2023-03-08 19:29:18','45.184.180.231'),(159,1,2,'Module: prefix  {\"id\":0,\"prefix\":\"55623\",\"destination\":\"Brasil, Gyn, Fixo\"}',NULL,'2023-03-08 20:00:48','45.184.180.231'),(160,1,2,'Module: rate  {\"id\":0,\"id_plan\":1,\"id_trunk_group\":4,\"id_prefix\":634,\"rateinitial\":0.05,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-08 20:01:53','45.184.180.231'),(161,1,2,'Module: rate  {\"id\":0,\"id_plan\":2,\"id_trunk_group\":3,\"id_prefix\":634,\"rateinitial\":0.05,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-08 20:03:11','45.184.180.231'),(162,1,2,'Module: rate  {\"id\":0,\"id_plan\":3,\"id_trunk_group\":2,\"id_prefix\":634,\"rateinitial\":0.05,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-08 20:03:45','45.184.180.231'),(163,1,2,'Module: rate  {\"id\":0,\"id_plan\":4,\"id_trunk_group\":1,\"id_prefix\":634,\"rateinitial\":0.05,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-08 20:04:22','45.184.180.231'),(164,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":3}',NULL,'2023-03-08 20:33:59','45.184.180.231'),(165,1,2,'Module: user  {\"id_plan\":4,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-03-08 20:38:34','45.184.180.231'),(166,1,2,'Module: sip  {\"extension\":\"\",\"sipshowpeer\":\"Array\\n(\\n    [data] => Privilege: Command\\n\\n\\n  * Name       : 623781\\n  Description  : \\n  Secret       : <Set>\\n  MD5Secret    : <Not set>\\n  Remote Secret: <Not set>\\n  Context      : billing\\n  Record On feature : automon\\n  Record Off feature : automon\\n  Subscr.Cont. : <Not set>\\n  Language     : br\\n  Tonezone     : <Not set>\\n  Accountcode  : 623781\\n  AMA flags    : Unknown\\n  Transfer mode: closed\\n  CallingPres  : Presentation Allowed, Not Screened\\n  FromDomain   : dynamic Port 5060\\n  Callgroup    : \\n  Pickupgroup  : \\n  Named Callgr : \\n  Nam. Pickupgr: \\n  MOH Suggest  : \\n  Mailbox      : \\n  VM Extension : asterisk\\n  LastMsgsSent : 0\\/0\\n  Call limit   : 0\\n  Max forwards : 0\\n  Dynamic      : Yes\\n  Callerid     : \\\"\\\" <991261195>\\n  MaxCallBR    : 384 kbps\\n  Expire       : 25\\n  Insecure     : no\\n  Force rport  : Yes\\n  Symmetric RTP: Yes\\n  ACL          : No\\n  ContactACL   : No\\n  DirectMedACL : No\\n  T.38 support : No\\n  T.38 EC mode : Unknown\\n  T.38 MaxDtgrm: 4294967295\\n  DirectMedia  : No\\n  PromiscRedir : No\\n  User=Phone   : No\\n  Video Support: No\\n  Text Support : No\\n  Ign SDP ver  : No\\n  Trust RPID   : No\\n  Send RPID    : No\\n  Path support : No\\n  Path         : N\\/A\\n  TrustIDOutbnd: Legacy\\n  Subscriptions: No\\n  Overlap dial : Yes\\n  DTMFmode     : rfc2833\\n  Timer T1     : 500\\n  Timer B      : 32000\\n  ToHost       : \\n  Addr->IP     : 45.184.180.231:54010\\n  Defaddr->IP  : (null)\\n  Prim.Transp. : UDP\\n  Allowed.Trsp : UDP\\n  Def. Username: 623781\\n  SIP Options  : (none)\\n  Codecs       : (g723|gsm|g726|opus|alaw|ulaw|g722)\\n  Auto-Framing : No\\n  Status       : OK (22 ms)\\n  Useragent    : Z 5.5.14 v2.10.18.6\\n  Reg. Contact : sip:623781@45.184.180.231:54010;transport=UDP;rinstance=d6ecacbe66c74b31\\n  Qualify Freq : 60000 ms\\n  Keepalive    : 0 ms\\n  Sess-Timers  : Accept\\n  Sess-Refresh : uas\\n  Sess-Expires : 1800 secs\\n  Min-Sess     : 90 secs\\n  RTP Engine   : asterisk\\n  Parkinglot   : \\n  Use Reason   : No\\n  Encryption   : No\\n  RTCP Mux     : No\\n\\n\\n    [Response] => Follows\\n)\\n\",\"id\":2}',NULL,'2023-03-08 20:39:25','45.184.180.231'),(167,1,2,'Module: sip  {\"extension\":\"\",\"sipshowpeer\":\"Array\\n(\\n    [data] => Privilege: Command\\n\\n\\n  * Name       : 621105\\n  Description  : \\n  Secret       : <Set>\\n  MD5Secret    : <Not set>\\n  Remote Secret: <Not set>\\n  Context      : billing\\n  Record On feature : automon\\n  Record Off feature : automon\\n  Subscr.Cont. : <Not set>\\n  Language     : br\\n  Tonezone     : <Not set>\\n  Accountcode  : 621105\\n  AMA flags    : Unknown\\n  Transfer mode: closed\\n  CallingPres  : Presentation Allowed, Not Screened\\n  FromDomain   : dynamic Port 5060\\n  Callgroup    : \\n  Pickupgroup  : \\n  Named Callgr : \\n  Nam. Pickupgr: \\n  MOH Suggest  : \\n  Mailbox      : \\n  VM Extension : asterisk\\n  LastMsgsSent : 32767\\/65535\\n  Call limit   : 0\\n  Max forwards : 0\\n  Dynamic      : Yes\\n  Callerid     : \\\"\\\" <991253305>\\n  MaxCallBR    : 384 kbps\\n  Expire       : 909\\n  Insecure     : no\\n  Force rport  : Yes\\n  Symmetric RTP: Yes\\n  ACL          : No\\n  ContactACL   : No\\n  DirectMedACL : No\\n  T.38 support : No\\n  T.38 EC mode : Unknown\\n  T.38 MaxDtgrm: 4294967295\\n  DirectMedia  : No\\n  PromiscRedir : No\\n  User=Phone   : No\\n  Video Support: No\\n  Text Support : No\\n  Ign SDP ver  : No\\n  Trust RPID   : No\\n  Send RPID    : No\\n  Path support : No\\n  Path         : N\\/A\\n  TrustIDOutbnd: Legacy\\n  Subscriptions: No\\n  Overlap dial : Yes\\n  DTMFmode     : rfc2833\\n  Timer T1     : 500\\n  Timer B      : 32000\\n  ToHost       : \\n  Addr->IP     : 45.184.180.231:57916\\n  Defaddr->IP  : (null)\\n  Prim.Transp. : UDP\\n  Allowed.Trsp : UDP\\n  Def. Username: 621105\\n  SIP Options  : 100rel replaces replace \\n  Codecs       : (g723|gsm|g726|opus|alaw|ulaw|g722)\\n  Auto-Framing : No\\n  Status       : OK (106 ms)\\n  Useragent    : SKYSIP Android 5.7.2 build 115303\\n  Reg. Contact : sip:621105@45.184.180.231:57916;rinstance=bf20926822a2bcc3\\n  Qualify Freq : 60000 ms\\n  Keepalive    : 0 ms\\n  Sess-Timers  : Accept\\n  Sess-Refresh : uas\\n  Sess-Expires : 1800 secs\\n  Min-Sess     : 90 secs\\n  RTP Engine   : asterisk\\n  Parkinglot   : \\n  Use Reason   : No\\n  Encryption   : No\\n  RTCP Mux     : No\\n\\n\\n    [Response] => Follows\\n)\\n\",\"id\":1}',NULL,'2023-03-08 20:39:33','45.184.180.231'),(168,1,2,'Module: trunk  {\"status\":0,\"id\":4}',NULL,'2023-03-08 20:39:58','45.184.180.231'),(169,1,2,'Module: trunk  {\"status\":0,\"id\":3}',NULL,'2023-03-08 20:40:04','45.184.180.231'),(170,1,2,'Module: trunk  {\"status\":0,\"id\":2}',NULL,'2023-03-08 20:40:08','45.184.180.231'),(171,1,2,'Module: trunk  {\"status\":0,\"id\":1}',NULL,'2023-03-08 20:40:12','45.184.180.231'),(172,1,2,'Module: trunk  {\"status\":1,\"id\":4,\"short_time_call\":0}',NULL,'2023-03-08 20:40:18','45.184.180.231'),(173,1,2,'Module: trunk  {\"status\":1,\"id\":3,\"short_time_call\":0}',NULL,'2023-03-08 20:40:23','45.184.180.231'),(174,1,2,'Module: trunk  {\"status\":1,\"id\":2,\"short_time_call\":0}',NULL,'2023-03-08 20:40:28','45.184.180.231'),(175,1,2,'Module: trunk  {\"status\":1,\"id\":1,\"short_time_call\":0}',NULL,'2023-03-08 20:40:34','45.184.180.231'),(176,NULL,1,'Username and password combination is invalid - User: root IP: 37.123.161.34',NULL,'2023-03-08 23:59:36','37.123.161.34'),(177,NULL,1,'Username and password combination is invalid - User: root IP: 37.123.161.34',NULL,'2023-03-09 00:03:33','37.123.161.34'),(178,1,1,'Username Login on the panel - User root',NULL,'2023-03-09 03:10:11','45.184.180.231'),(179,1,1,'Username Login on the panel - User root',NULL,'2023-03-11 01:33:03','45.184.180.231'),(180,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-03-11 01:33:20','45.184.180.231'),(181,1,2,'Module: prefix  {\"id\":0,\"prefix\":\"556299247\",\"destination\":\"Brasil, GO, Celular  - Claro\"}',NULL,'2023-03-11 01:36:05','45.184.180.231'),(182,1,2,'Module: rate  {\"id\":0,\"id_plan\":1,\"id_trunk_group\":4,\"id_prefix\":635,\"rateinitial\":0.11,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-11 01:38:28','45.184.180.231'),(183,1,2,'Module: rate  {\"id\":0,\"id_plan\":2,\"id_trunk_group\":3,\"id_prefix\":635,\"rateinitial\":0.11,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-11 01:39:44','45.184.180.231'),(184,1,2,'Module: rate  {\"id\":0,\"id_plan\":3,\"id_trunk_group\":2,\"id_prefix\":635,\"rateinitial\":0.11,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-11 01:40:11','45.184.180.231'),(185,1,2,'Module: rate  {\"id\":0,\"id_plan\":4,\"id_trunk_group\":1,\"id_prefix\":635,\"rateinitial\":0.53,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-11 01:40:46','45.184.180.231'),(186,1,1,'Username Login on the panel - User root',NULL,'2023-03-14 15:06:40','45.184.180.231'),(187,1,1,'Username Login on the panel - User root',NULL,'2023-03-15 22:35:19','45.184.180.231'),(188,1,2,'Module: prefix  {\"id\":0,\"prefix\":\"0800\",\"destination\":\"Brasil - 0800\"}',NULL,'2023-03-15 22:37:00','45.184.180.231'),(189,1,2,'Module: rate  {\"id\":0,\"id_plan\":1,\"id_trunk_group\":4,\"id_prefix\":636,\"rateinitial\":0.11,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-15 22:37:55','45.184.180.231'),(190,1,2,'Module: rate  {\"id\":0,\"id_plan\":2,\"id_trunk_group\":3,\"id_prefix\":636,\"rateinitial\":0.11,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-15 22:39:13','45.184.180.231'),(191,1,2,'Module: rate  {\"id\":0,\"id_plan\":3,\"id_trunk_group\":2,\"id_prefix\":636,\"rateinitial\":0.11,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-15 22:53:35','45.184.180.231'),(192,1,2,'Module: rate  {\"id\":0,\"id_plan\":4,\"id_trunk_group\":1,\"id_prefix\":636,\"rateinitial\":0.15,\"initblock\":30,\"billingblock\":6,\"connectcharge\":0,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2023-03-15 22:54:07','45.184.180.231'),(193,1,2,'Module: prefix  {\"id\":0,\"prefix\":\"550800\",\"destination\":\"Brasil - 0800\"}',NULL,'2023-03-15 22:56:21','45.184.180.231'),(194,1,2,'Module: rate  {\"id_prefix\":637,\"id\":3018}',NULL,'2023-03-15 22:56:52','45.184.180.231'),(195,1,2,'Module: rate  {\"id_prefix\":637,\"id\":3019}',NULL,'2023-03-15 22:57:03','45.184.180.231'),(196,1,2,'Module: rate  {\"id_prefix\":637,\"id\":3020}',NULL,'2023-03-15 22:57:09','45.184.180.231'),(197,1,2,'Module: rate  {\"id_prefix\":637,\"id\":3021}',NULL,'2023-03-15 22:57:14','45.184.180.231'),(198,1,3,'Module prefix  {\"id\":636}',NULL,'2023-03-15 22:57:34','45.184.180.231'),(199,1,2,'Module: user  {\"prefix_local\":\"0\\/55\\/11,0\\/55\\/12,*\\/5562\\/8,*\\/5562\\/9,*\\/55\\/11\",\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":3}',NULL,'2023-03-15 23:04:32','45.184.180.231'),(200,1,2,'Module: user  {\"prefix_local\":\"0\\/55\\/11,0\\/55\\/12,*\\/5562\\/8,*\\/5562\\/9,*\\/55\\/11\",\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-03-15 23:04:55','45.184.180.231'),(201,1,2,'Module: trunk  {\"removeprefix\":\"55\",\"id\":1}',NULL,'2023-03-15 23:08:50','45.184.180.231'),(202,1,2,'Module: trunk  {\"removeprefix\":\"55\",\"id\":2}',NULL,'2023-03-15 23:08:54','45.184.180.231'),(203,1,2,'Module: trunk  {\"removeprefix\":\"55\",\"id\":3}',NULL,'2023-03-15 23:08:58','45.184.180.231'),(204,1,2,'Module: trunk  {\"removeprefix\":\"55\",\"id\":4}',NULL,'2023-03-15 23:09:03','45.184.180.231'),(205,1,2,'Module: trunk  {\"removeprefix\":\"\",\"id\":1}',NULL,'2023-03-15 23:14:52','45.184.180.231'),(206,1,2,'Module: trunk  {\"removeprefix\":\"\",\"id\":2}',NULL,'2023-03-15 23:14:56','45.184.180.231'),(207,1,2,'Module: trunk  {\"removeprefix\":\"\",\"id\":3}',NULL,'2023-03-15 23:15:01','45.184.180.231'),(208,1,2,'Module: trunk  {\"removeprefix\":\"\",\"id\":4}',NULL,'2023-03-15 23:15:05','45.184.180.231'),(209,1,1,'Username Login on the panel - User root',NULL,'2023-03-16 11:57:39','45.184.180.231'),(210,1,2,'Module: user  {\"id_plan\":5,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-03-16 11:59:14','45.184.180.231'),(211,1,2,'Module: user  {\"id_plan\":1,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-03-16 11:59:54','45.184.180.231'),(212,1,2,'Module: user  {\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-03-16 12:02:06','45.184.180.231'),(213,1,2,'Module: sip  {\"callerid\":\"981343410\",\"extension\":\"\",\"sipshowpeer\":\"Array\\n(\\n    [data] => Privilege: Command\\n\\n\\n  * Name       : 621105\\n  Description  : \\n  Secret       : <Set>\\n  MD5Secret    : <Not set>\\n  Remote Secret: <Not set>\\n  Context      : billing\\n  Record On feature : automon\\n  Record Off feature : automon\\n  Subscr.Cont. : <Not set>\\n  Language     : br\\n  Tonezone     : <Not set>\\n  Accountcode  : 621105\\n  AMA flags    : Unknown\\n  Transfer mode: closed\\n  CallingPres  : Presentation Allowed, Not Screened\\n  FromDomain   : dynamic Port 5060\\n  Callgroup    : \\n  Pickupgroup  : \\n  Named Callgr : \\n  Nam. Pickupgr: \\n  MOH Suggest  : \\n  Mailbox      : \\n  VM Extension : asterisk\\n  LastMsgsSent : 32767\\/65535\\n  Call limit   : 0\\n  Max forwards : 0\\n  Dynamic      : Yes\\n  Callerid     : \\\"\\\" <991253305>\\n  MaxCallBR    : 384 kbps\\n  Expire       : 900\\n  Insecure     : no\\n  Force rport  : Yes\\n  Symmetric RTP: Yes\\n  ACL          : No\\n  ContactACL   : No\\n  DirectMedACL : No\\n  T.38 support : No\\n  T.38 EC mode : Unknown\\n  T.38 MaxDtgrm: 4294967295\\n  DirectMedia  : No\\n  PromiscRedir : No\\n  User=Phone   : No\\n  Video Support: No\\n  Text Support : No\\n  Ign SDP ver  : No\\n  Trust RPID   : No\\n  Send RPID    : No\\n  Path support : No\\n  Path         : N\\/A\\n  TrustIDOutbnd: Legacy\\n  Subscriptions: No\\n  Overlap dial : Yes\\n  DTMFmode     : rfc2833\\n  Timer T1     : 500\\n  Timer B      : 32000\\n  ToHost       : \\n  Addr->IP     : 45.184.180.231:42866\\n  Defaddr->IP  : (null)\\n  Prim.Transp. : UDP\\n  Allowed.Trsp : UDP\\n  Def. Username: 621105\\n  SIP Options  : 100rel replaces replace \\n  Codecs       : (g723|gsm|g726|opus|alaw|ulaw|g722)\\n  Auto-Framing : No\\n  Status       : OK (108 ms)\\n  Useragent    : SKYSIP Android 5.7.2 build 115303\\n  Reg. Contact : sip:621105@45.184.180.231:42866;rinstance=9fd121549a07f2e5\\n  Qualify Freq : 60000 ms\\n  Keepalive    : 0 ms\\n  Sess-Timers  : Accept\\n  Sess-Refresh : uas\\n  Sess-Expires : 1800 secs\\n  Min-Sess     : 90 secs\\n  RTP Engine   : asterisk\\n  Parkinglot   : \\n  Use Reason   : No\\n  Encryption   : No\\n  RTCP Mux     : No\\n\\n\\n    [Response] => Follows\\n)\\n\",\"id\":1,\"cid_number\":\"981343410\"}',NULL,'2023-03-16 12:02:26','45.184.180.231'),(214,1,2,'Module: user  {\"id_plan\":2,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-03-16 12:03:07','45.184.180.231'),(215,1,2,'Module: user  {\"id_plan\":3,\"state_number\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":2}',NULL,'2023-03-16 12:12:41','45.184.180.231'),(216,1,1,'Username Login on the panel - User root',NULL,'2023-03-18 22:44:06','45.184.180.231'),(217,1,1,'Username Login on the panel - User root',NULL,'2023-03-20 04:18:43','45.184.180.231'),(218,1,2,'Module: user  {\"id\":0,\"id_group\":2,\"id_plan\":3,\"offer\":0,\"id_user\":1,\"id_offer\":null,\"username\":\"6230856855\",\"password\":\"passion-11\",\"active\":1,\"credit\":0,\"enableexpire\":0,\"expiredays\":0,\"status\":0,\"typepaid\":0,\"creditlimit\":0,\"credit_notification\":-1,\"restriction\":0,\"callingcard_pin\":889453,\"callshop\":0,\"plan_day\":0,\"active_paypal\":0,\"boleto\":0,\"lastname\":\"\",\"firstname\":\"Master Voip\",\"redial\":\"\",\"tag\":\"\",\"company_name\":\"\",\"commercial_name\":\"\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"55\",\"loginkey\":\"\",\"zipcode\":\"\",\"phone\":\"\",\"mobile\":\"\",\"email\":\"\",\"doc\":\"\",\"vat\":\"\",\"language\":\"br\",\"company_website\":\"\",\"prefix_local\":\"0\\/55\\/11,0\\/55\\/12,*\\/5562\\/8,*\\/5562\\/9,*\\/55\\/11\",\"boleto_day\":0,\"firstusedate\":null,\"expirationdate\":null,\"lastuse\":null,\"description\":\"\",\"creationdate\":null,\"id_group_agent\":3,\"calllimit\":-1,\"mix_monitor_format\":\"gsm\",\"disk_space\":-1,\"sipaccountlimit\":-1,\"cpslimit\":-1,\"sip_count\":0,\"dist\":\"\",\"state_number\":\"\",\"neighborhood\":\"\",\"contract_value\":\"0.0000\",\"credit_notification_daily\":0,\"calllimit_error\":\"503\",\"restriction_use\":1,\"transfer_international\":0,\"transfer_international_profit\":null,\"transfer_flexiload\":0,\"transfer_flexiload_profit\":null,\"transfer_bkash\":0,\"transfer_bkash_profit\":null,\"transfer_dbbl_rocket\":0,\"transfer_dbbl_rocket_profit\":null,\"transfer_bdservice_rate\":null,\"transfer_show_selling_price\":null}',NULL,'2023-03-20 05:22:10','45.184.180.231'),(219,1,2,'Module: user  {\"state_number\":\"\",\"lastname\":\"Master Voip\",\"firstname\":\"\",\"contract_value\":\"0.0000\",\"credit_notification_daily\":0,\"restriction_use\":1,\"transfer_international\":0,\"transfer_flexiload\":0,\"transfer_bkash\":0,\"transfer_dbbl_rocket\":0,\"id\":4}',NULL,'2023-03-20 05:22:46','45.184.180.231'),(220,1,2,'Module: refill  {\"id\":\"0\",\"id_user\":\"4\",\"credit\":\"50.0000\",\"description\":\"dsdsadasdasdasdasd\",\"payment\":\"1\",\"date\":\"2023-03-20 02:23:42\",\"invoice_number\":\"\"}',NULL,'2023-03-20 05:23:58','45.184.180.231'),(221,4,1,'Username Login on the panel - User 6230856855',NULL,'2023-03-20 05:24:29','45.184.180.231'),(222,1,1,'Username Login on the panel - User root',NULL,'2023-03-21 17:03:06','45.184.180.231'),(223,1,1,'Username Login on the panel - User root',NULL,'2023-03-22 04:45:58','45.184.180.231'),(224,1,1,'Username Login on the panel - User root',NULL,'2024-02-29 04:04:20','45.184.180.231'),(225,1,1,'Username Login on the panel - User root',NULL,'2024-02-29 22:03:46','45.184.180.231');
/*!40000 ALTER TABLE `pkg_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_log_actions`
--

DROP TABLE IF EXISTS `pkg_log_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_log_actions` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_log_actions`
--

LOCK TABLES `pkg_log_actions` WRITE;
/*!40000 ALTER TABLE `pkg_log_actions` DISABLE KEYS */;
INSERT INTO `pkg_log_actions` VALUES (1,'Login'),(2,'Edit'),(3,'Delete'),(4,'New'),(5,'Import'),(6,'UpdateAll'),(7,'Export'),(8,'Logout');
/*!40000 ALTER TABLE `pkg_log_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_method_pay`
--

DROP TABLE IF EXISTS `pkg_method_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_method_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `payment_method` char(100) NOT NULL,
  `show_name` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL,
  `active` tinyint(11) NOT NULL DEFAULT 0,
  `active_agent` tinyint(11) NOT NULL DEFAULT 0,
  `obs` varchar(300) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pagseguro_TOKEN` varchar(100) NOT NULL,
  `fee` tinyint(1) NOT NULL DEFAULT 0,
  `boleto_convenio` varchar(50) DEFAULT NULL,
  `boleto_banco` varchar(50) DEFAULT NULL,
  `boleto_agencia` varchar(50) DEFAULT NULL,
  `boleto_conta_corrente` varchar(50) DEFAULT NULL,
  `boleto_inicio_nosso_numeroa` varchar(50) DEFAULT NULL,
  `boleto_carteira` varchar(50) DEFAULT NULL,
  `boleto_taxa` varchar(50) DEFAULT NULL,
  `boleto_instrucoes` varchar(50) DEFAULT NULL,
  `boleto_nome_emp` varchar(50) DEFAULT NULL,
  `boleto_end_emp` varchar(50) DEFAULT NULL,
  `boleto_cidade_emp` varchar(50) DEFAULT NULL,
  `boleto_estado_emp` varchar(50) DEFAULT NULL,
  `boleto_cpf_emp` varchar(50) DEFAULT NULL,
  `P2P_CustomerSiteID` varchar(100) NOT NULL DEFAULT '',
  `P2P_KeyID` varchar(50) NOT NULL DEFAULT '',
  `P2P_Passphrase` varchar(50) NOT NULL DEFAULT '',
  `P2P_RecipientKeyID` varchar(100) NOT NULL DEFAULT '',
  `P2P_tax_amount` varchar(10) NOT NULL DEFAULT '0',
  `client_id` varchar(500) DEFAULT NULL,
  `client_secret` varchar(500) DEFAULT NULL,
  `SLAppToken` varchar(50) DEFAULT NULL,
  `SLAccessToken` varchar(50) DEFAULT NULL,
  `SLSecret` varchar(50) DEFAULT NULL,
  `SLIdProduto` int(11) DEFAULT NULL,
  `SLvalidationtoken` varchar(100) DEFAULT NULL,
  `min` int(11) NOT NULL DEFAULT 10,
  `max` int(11) NOT NULL DEFAULT 10,
  `showFields` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_method_pay` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_method_pay` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_method_pay`
--

LOCK TABLES `pkg_method_pay` WRITE;
/*!40000 ALTER TABLE `pkg_method_pay` DISABLE KEYS */;
INSERT INTO `pkg_method_pay` VALUES (1,1,'Pagseguro','Pagseguro','Brasil',0,0,'','','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'payment_method,show_name,id_user,country,active,min,max,username,pagseguro_TOKEN'),(3,1,'Moip','Moip','Brasil',0,0,'','https://www.moip.com.br/PagamentoMoIP.do','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,id_user,show_name,country,active,min,max,username,url'),(4,1,'Paypal','Paypal','Global',0,0,'','https://www.paypal.com/cgi-bin/webscr','your@paypal.email','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,500,'payment_method,show_name,id_user,country,active,min,max,username,url,fee'),(5,1,'CuentaDigital','PagoFacil o Rapipago','Argentina',0,0,'','http://www.cuentadigital.com/api.php','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,username,url'),(6,1,'DineroMail','Tarjeta de crédito, DineroMail','Brasil',0,0,'','https://argentina.dineromail.com/Shop/Shop_Ingreso.asp','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,min,max,username,url'),(7,1,'PlacetoPay','PlacetoPay','Brasil',0,0,'','','','',0,'','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,P2P_CustomerSiteID,P2P_KeyID,P2P_Passphrase,P2P_RecipientKeyID,P2P_tax_amount'),(8,1,'GerenciaNet','GerenciaNet','Brasil',0,0,'','','','',0,'','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,client_id,client_secret'),(9,1,'Pagseguro','Pagseguro','Brasil',0,0,'','','','',0,'','Banco do Brasil','','','','','','','','','','','','','','','','','','','','','',0,'',10,500,'payment_method,show_name,id_user,country,active,min,max,username,pagseguro_TOKEN'),(10,1,'MercadoPago','MercadoPago','Brasil',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,500,'payment_method,show_name,id_user,country,active,min,max,username,pagseguro_TOKEN'),(11,1,'paghiper','Boleto Bancario  paghiper','Brasil',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,username,pagseguro_TOKEN'),(12,1,'MercadoPago','MercadoPago','Brasil',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,username,pagseguro_TOKEN'),(13,1,'molpay','MoPay','Global',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,username,pagseguro_TOKEN,P2P_RecipientKeyID'),(14,1,'Sagepay','sagepay','Global',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,P2P_KeyID,client_id'),(15,1,'Stripe','Stripe','Global',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,client_id,client_secret'),(16,1,'Elavon','Elavon','Global',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,username,client_id,client_secret'),(17,1,'cryptocurrency','BITCOIN','Global',1,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0','','',NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,username,client_id,client_secret'),(18,1,'Custom','Custom Method','Global',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,10,'payment_method,show_name,id_user,country,active,min,max,min,max,username,url');
/*!40000 ALTER TABLE `pkg_method_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_module`
--

DROP TABLE IF EXISTS `pkg_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL,
  `module` varchar(100) DEFAULT NULL,
  `icon_cls` varchar(100) DEFAULT NULL,
  `id_module` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_module_pkg_module` (`id_module`),
  CONSTRAINT `fk_pkg_module_pkg_module` FOREIGN KEY (`id_module`) REFERENCES `pkg_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_module`
--

LOCK TABLES `pkg_module` WRITE;
/*!40000 ALTER TABLE `pkg_module` DISABLE KEYS */;
INSERT INTO `pkg_module` VALUES (1,'t(\'Clients\')',NULL,'x-fa fa-arrow-right',NULL,1),(3,'t(\'Group Users\')','groupuser','x-fa fa-desktop',12,2),(4,'t(\'Menus\')','module','x-fa fa-desktop',12,1),(5,'t(\'DIDs\')',NULL,'x-fa fa-arrow-right',NULL,3),(6,'t(\'Configuration\')','configuration','x-fa fa-desktop',12,3),(7,'t(\'Billing\')',NULL,'x-fa fa-arrow-right',NULL,2),(8,'t(\'Rates\')',NULL,'x-fa fa-arrow-right',NULL,4),(9,'t(\'Reports\')',NULL,'x-fa fa-arrow-right',NULL,5),(10,'t(\'Routes\')',NULL,'x-fa fa-arrow-right',NULL,6),(12,'t(\'Settings\')',NULL,'x-fa fa-arrow-right',NULL,7),(13,'t(\'Voice Broadcasting\')',NULL,'x-fa fa-arrow-right',NULL,8),(14,'t(\'CallShop\')',NULL,'x-fa fa-arrow-right',NULL,9),(15,'t(\'Users\')','user','x-fa fa-desktop',1,1),(16,'t(\'Providers\')','provider','x-fa fa-desktop',10,1),(17,'t(\'Trunks\')','trunk','x-fa fa-desktop',10,2),(19,'t(\'SIP Users\')','sip','x-fa fa-desktop',1,2),(20,'t(\'ATA Linksys\')','sipuras','x-fa fa-desktop',1,5),(21,'t(\'Calls Online\')','callonline','x-fa fa-desktop',1,3),(22,'t(\'CallerID\')','callerid','x-fa fa-desktop',1,4),(23,'t(\'Refills\')','refill','x-fa fa-desktop',7,1),(25,'t(\'Payment Methods\')','methodpay','x-fa fa-desktop',7,2),(26,'t(\'Voucher\')','voucher','x-fa fa-desktop',7,3),(27,'t(\'Refill Providers\')','refillprovider','x-fa fa-desktop',7,4),(28,'t(\'Plans\')','plan','x-fa fa-desktop',8,1),(29,'t(\'Tariffs\')','rate','x-fa fa-desktop',8,2),(30,'t(\'CDR\')','call','x-fa fa-desktop',9,1),(31,'t(\'DIDs\')','did','x-fa fa-desktop',5,1),(32,'t(\'DID Destination\')','diddestination','x-fa fa-desktop',5,2),(33,'t(\'Prefixes\')','prefix','x-fa fa-desktop',8,3),(34,'t(\'Offers\')','offer','x-fa fa-desktop',8,5),(36,'t(\'DIDs Use\')','diduse','x-fa fa-desktop',5,3),(40,'t(\'Summary per Day\')','callsummaryperday','x-fa fa-desktop',9,3),(41,'t(\'Campaigns\')','campaign','x-fa fa-desktop',13,1),(42,'t(\'Polls\')','campaignpoll','x-fa fa-desktop',13,4),(43,'t(\'Phonebooks\')','phonebook','x-fa fa-desktop',13,2),(44,'t(\'Phonenumbers\')','phonenumber','x-fa fa-desktop',13,3),(45,'t(\'Offer CDR\')','offercdr','x-fa fa-desktop',8,6),(46,'t(\'Offer Use\')','offeruse','x-fa fa-desktop',8,7),(48,'t(\'Restricted Number\')','restrictedphonenumber','x-fa fa-desktop',1,6),(49,'t(\'SMS\')','sms','x-fa fa-desktop',13,7),(50,'t(\'Booths\')','callshop','x-fa fa-desktop',14,1),(51,'t(\'Booths Report\')','callshopcdr','x-fa fa-desktop',14,2),(53,'t(\'Booths Tariffs\')','ratecallshop','x-fa fa-desktop',14,3),(54,'t(\'Emails Templates\')','templatemail','x-fa fa-desktop',12,4),(55,'t(\'Callback\')','callback','x-fa fa-desktop',1,7),(56,'t(\'IVRs\')','ivr','x-fa fa-desktop',5,4),(57,'t(\'Polls Reports\')','campaignpollinfo','x-fa fa-desktop',13,5),(58,'t(\'Queues\')','queue','x-fa fa-desktop',5,5),(59,'t(\'Queues Members\')','queuemember','x-fa fa-desktop',5,6),(60,'t(\'Summary per Month\')','callsummarypermonth','x-fa fa-desktop',9,7),(61,'t(\'Buy Credit\')','buycredit','x-fa fa-desktop',1,8),(62,'t(\'Restrict Phone\')','campaignrestrictphone','x-fa fa-desktop',13,6),(63,'t(\'Quick Campaign\')','campaignsend','x-fa fa-desktop',13,8),(64,'t(\'Log Users\')','logusers','x-fa fa-desktop',12,5),(65,'t(\'Call per Minutes\')','campaignlog','x-fa fa-desktop',12,10),(66,'t(\'User Custom Rates\')','userrate','x-fa fa-desktop',8,4),(67,'t(\'CDR Failed\')','callfailed','x-fa fa-desktop',9,2),(68,'t(\'Buy DID\')','didbuy','x-fa fa-desktop',5,7),(69,'t(\'Extra\')','extra','x-fa fa-desktop',12,69),(71,'t(\'Dashboard\')','dashboard','x-fa fa-desktop',12,9),(72,'t(\'SMTP\')','smtps','x-fa fa-desktop',12,6),(73,'t(\'Summary per Day\')','callsummarycallshop','x-fa fa-desktop',14,4),(77,'t(\'Servers\')','servers','x-fa fa-desktop',10,5),(78,'t(\'Queue DashBoard\')','dashboardqueue','x-fa fa-desktop',5,8),(79,'t(\'Send Credit\')','transfertomobile','x-fa fa-desktop',1,11),(80,'t(\'Summary per User\')','callsummaryperuser','x-fa fa-desktop',9,10),(82,'t(\'Fail2ban\')','firewall','x-fa fa-desktop',12,7),(83,'t(\'Iax\')','iax','x-fa fa-desktop',1,9),(85,'t(\'Services\')',NULL,'x-fa fa-arrow-right',NULL,10),(86,'t(\'Services\')','services','x-fa fa-desktop',85,1),(87,'t(\'Services Use\')','servicesuse','x-fa fa-desktop',85,2),(88,'t(\'Send Credit Summary\')','sendcreditsummary','x-fa fa-desktop',9,13),(89,'t(\'Summary per Trunk\')','callsummarypertrunk','x-fa fa-desktop',9,11),(90,'t(\'Summary Day User\')','callsummarydayuser','x-fa fa-desktop',9,4),(91,'t(\'Summary Day Trunk\')','callsummarydaytrunk','x-fa fa-desktop',9,5),(92,'t(\'Summary Day Agent\')','callsummarydayagent','x-fa fa-desktop',9,6),(93,'t(\'Summary Month User\')','callsummarymonthuser','x-fa fa-desktop',9,8),(94,'t(\'Summary Month Trunk\')','callsummarymonthtrunk','x-fa fa-desktop',9,9),(95,'t(\'Call Archive\')','callarchive','x-fa fa-desktop',9,12),(96,'t(\'API\')','api','x-fa fa-desktop',12,8),(97,'t(\'Provider Rates\')','rateprovider','x-fa fa-desktop',10,4),(98,'t(\'Group to Admins\')','groupusergroup','x-fa fa-desktop',12,11),(99,'t(\'DIDww\')','didww','x-fa fa-desktop',5,10),(100,'t(\'Extra2\')','extra2','x-fa fa-desktop',12,10),(101,'t(\'Extra3\')','extra3','x-fa fa-desktop',12,11),(102,'t(\'Trunk Groups\')','trunkgroup','x-fa fa-desktop',10,3),(103,'t(\'Campaigns DashBoard\')','campaigndashboard','x-fa fa-desktop',13,11),(104,'t(\'Backup\')','backup','x-fa fa-desktop',12,15),(105,'t(\'Campaign Report\')','campaignreport','x-fa fa-desktop',13,12),(106,'t(\'Holidays\')','holidays','x-fa fa-desktop',5,11),(107,'t(\'Alarms\')','alarm','x-fa fa-desktop',12,16),(108,'t(\'Summary Month DID\')','callsummarymonthdid','x-fa fa-desktop',9,14),(109,'t(\'Trunk Errors\')','trunksipcodes','x-fa fa-desktop',10,7),(110,'t(\'Provider CNL\')','providercnl','x-fa fa-desktop',10,7),(111,'t(\'User History\')','userhistory','x-fa fa-desktop',1,12),(112,'t(\'DID History\')','didhistory','x-fa fa-desktop',5,12);
/*!40000 ALTER TABLE `pkg_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_module_extra`
--

DROP TABLE IF EXISTS `pkg_module_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_module_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_module` int(11) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pkg_module_extra_id_module` (`id_module`),
  KEY `type` (`type`),
  CONSTRAINT `fk_pkg_module_pkg_module_extra` FOREIGN KEY (`id_module`) REFERENCES `pkg_module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_module_extra`
--

LOCK TABLES `pkg_module_extra` WRITE;
/*!40000 ALTER TABLE `pkg_module_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_module_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_offer`
--

DROP TABLE IF EXISTS `pkg_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `label` varchar(70) NOT NULL,
  `packagetype` int(11) NOT NULL,
  `billingtype` int(11) NOT NULL,
  `startday` int(11) NOT NULL,
  `freetimetocall` int(11) NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `initblock` int(11) NOT NULL DEFAULT 60,
  `billingblock` int(11) NOT NULL DEFAULT 60,
  `minimal_time_charge` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_offer` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_offer` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_offer`
--

LOCK TABLES `pkg_offer` WRITE;
/*!40000 ALTER TABLE `pkg_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_offer_cdr`
--

DROP TABLE IF EXISTS `pkg_offer_cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_offer_cdr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_offer` int(11) NOT NULL,
  `date_consumption` timestamp NOT NULL DEFAULT current_timestamp(),
  `used_secondes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_pkg_offer_cdr_date_consumption` (`date_consumption`),
  KEY `fk_pkg_user_pkg_offer_cdr` (`id_user`),
  KEY `fk_pkg_offer_pkg_offer_cdr` (`id_offer`),
  CONSTRAINT `fk_pkg_offer_pkg_offer_cdr` FOREIGN KEY (`id_offer`) REFERENCES `pkg_offer` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_offer_cdr` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_offer_cdr`
--

LOCK TABLES `pkg_offer_cdr` WRITE;
/*!40000 ALTER TABLE `pkg_offer_cdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_offer_cdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_offer_use`
--

DROP TABLE IF EXISTS `pkg_offer_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_offer_use` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_offer` int(11) NOT NULL,
  `reservationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `releasedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) DEFAULT 0,
  `month_payed` int(11) DEFAULT 0,
  `reminded` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_offer_use` (`id_user`),
  KEY `fk_pkg_offer_pkg_offer_use` (`id_offer`),
  CONSTRAINT `fk_pkg_offer_pkg_offer_use` FOREIGN KEY (`id_offer`) REFERENCES `pkg_offer` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_offer_use` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_offer_use`
--

LOCK TABLES `pkg_offer_use` WRITE;
/*!40000 ALTER TABLE `pkg_offer_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_offer_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_phonebook`
--

DROP TABLE IF EXISTS `pkg_phonebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_phonebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `name` char(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_phonebook` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_phonebook` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_phonebook`
--

LOCK TABLES `pkg_phonebook` WRITE;
/*!40000 ALTER TABLE `pkg_phonebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_phonebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_phonenumber`
--

DROP TABLE IF EXISTS `pkg_phonenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_phonenumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_phonebook` int(11) NOT NULL,
  `number` varchar(30) NOT NULL,
  `name` char(40) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `doc` varchar(200) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` smallint(6) NOT NULL DEFAULT 1,
  `info` mediumtext DEFAULT NULL,
  `try` smallint(1) NOT NULL DEFAULT 0,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_phonebook_pkg_phonenumber` (`id_phonebook`),
  KEY `number` (`number`),
  CONSTRAINT `fk_pkg_phonebook_pkg_phonenumber` FOREIGN KEY (`id_phonebook`) REFERENCES `pkg_phonebook` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_phonenumber`
--

LOCK TABLES `pkg_phonenumber` WRITE;
/*!40000 ALTER TABLE `pkg_phonenumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_phonenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_plan`
--

DROP TABLE IF EXISTS `pkg_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `name` char(50) NOT NULL,
  `lcrtype` int(11) NOT NULL DEFAULT 0,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `removeinterprefix` int(11) NOT NULL DEFAULT 1,
  `signup` int(11) NOT NULL DEFAULT 0,
  `portabilidadeMobile` tinyint(1) NOT NULL DEFAULT 0,
  `portabilidadeFixed` tinyint(1) NOT NULL DEFAULT 0,
  `ini_credit` decimal(10,5) NOT NULL DEFAULT 0.00000,
  `techprefix` varchar(7) NOT NULL DEFAULT '',
  `play_audio` smallint(1) NOT NULL DEFAULT 0,
  `tariff_limit` int(11) NOT NULL DEFAULT 3,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_plan` (`id_user`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_plan` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_plan`
--

LOCK TABLES `pkg_plan` WRITE;
/*!40000 ALTER TABLE `pkg_plan` DISABLE KEYS */;
INSERT INTO `pkg_plan` VALUES (1,1,'Vox-Gold',0,'2023-02-25 22:22:50',1,0,0,0,0.00000,'',1,3),(2,1,'Vox-Platinum',0,'2023-02-25 22:23:06',1,0,0,0,0.00000,'',1,3),(3,1,'Vox-Silver',0,'2023-02-25 22:23:23',1,0,0,0,0.00000,'',1,3),(4,1,'Vox-Call-Center',0,'2023-02-25 22:23:38',1,0,0,0,0.00000,'',1,3),(5,1,'Bridge-Platinum',0,'2023-02-26 12:59:52',1,0,0,0,0.00000,'',1,3);
/*!40000 ALTER TABLE `pkg_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_prefix`
--

DROP TABLE IF EXISTS `pkg_prefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_prefix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(18) NOT NULL,
  `destination` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix_2` (`prefix`),
  KEY `prefix` (`prefix`),
  KEY `destination` (`destination`)
) ENGINE=InnoDB AUTO_INCREMENT=638 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_prefix`
--

LOCK TABLES `pkg_prefix` WRITE;
/*!40000 ALTER TABLE `pkg_prefix` DISABLE KEYS */;
INSERT INTO `pkg_prefix` VALUES (1,'55','Brasil, Geral'),(2,'556198681','Brasil, DF, Celular  - OI'),(3,'556298411','Brasil, Gyn, Celular  - OI'),(4,'556298513','Brasil, Gyn, Celular  - OI'),(5,'556298621','Brasil, Gyn, Celular  - OI'),(6,'556398427','Brasil, TO, Celular - OI'),(7,'556398503','Brasil, TO, Celular - OI'),(8,'556398513','Brasil, TO, Celular - OI'),(9,'556398520','Brasil, TO, Celular - OI'),(10,'556398521','Brasil, TO, Celular - OI'),(11,'556398522','Brasil, TO, Celular - OI'),(12,'556398523','Brasil, TO, Celular - OI'),(13,'556398524','Brasil, TO, Celular - OI'),(14,'556498403','Brasil, GO, Celular  - OI'),(15,'556498419','Brasil, GO, Celular  - OI'),(16,'556498427','Brasil, GO, Celular  - OI'),(17,'556498437','Brasil, GO, Celular  - OI'),(18,'556498447','Brasil, GO, Celular  - OI'),(19,'556498457','Brasil, GO, Celular  - OI'),(20,'556498460','Brasil, GO, Celular  - OI'),(21,'556498461','Brasil, GO, Celular  - OI'),(22,'556498470','Brasil, GO, Celular  - OI'),(23,'556498479','Brasil, GO, Celular  - OI'),(24,'556498480','Brasil, GO, Celular  - OI'),(25,'556498481','Brasil, GO, Celular  - OI'),(26,'556498482','Brasil, GO, Celular  - OI'),(27,'556498483','Brasil, GO, Celular  - OI'),(28,'556298446','Brasil, Gyn, Celular  - OI'),(29,'556199601','Brasil, Gyn, Celular - VIVO'),(30,'556199602','Brasil, Gyn, Celular - VIVO'),(31,'556199603','Brasil, Gyn, Celular - VIVO'),(32,'556199604','Brasil, Gyn, Celular - VIVO'),(33,'556199605','Brasil, Gyn, Celular - VIVO'),(34,'556199606','Brasil, Gyn, Celular - VIVO'),(35,'556199607','Brasil, Gyn, Celular - VIVO'),(36,'556199608','Brasil, Gyn, Celular - VIVO'),(37,'556199609','Brasil, Gyn, Celular - VIVO'),(38,'556199611','Brasil, Gyn, Celular - VIVO'),(39,'556199612','Brasil, Gyn, Celular - VIVO'),(40,'556199613','Brasil, Gyn, Celular - VIVO'),(41,'556199614','Brasil, Gyn, Celular - VIVO'),(42,'556199615','Brasil, Gyn, Celular - VIVO'),(43,'556199616','Brasil, Gyn, Celular - VIVO'),(44,'556199617','Brasil, Gyn, Celular - VIVO'),(45,'556199618','Brasil, Gyn, Celular - VIVO'),(46,'556199619','Brasil, Gyn, Celular - VIVO'),(47,'556199621','Brasil, Gyn, Celular - VIVO'),(48,'556199622','Brasil, Gyn, Celular - VIVO'),(49,'556199623','Brasil, Gyn, Celular - VIVO'),(50,'556199624','Brasil, Gyn, Celular - VIVO'),(51,'556199625','Brasil, Gyn, Celular - VIVO'),(52,'556199626','Brasil, Gyn, Celular - VIVO'),(53,'556199627','Brasil, Gyn, Celular - VIVO'),(54,'556199628','Brasil, Gyn, Celular - VIVO'),(55,'556199629','Brasil, Gyn, Celular - VIVO'),(56,'556199631','Brasil, Gyn, Celular - VIVO'),(57,'556199632','Brasil, Gyn, Celular - VIVO'),(58,'556199633','Brasil, Gyn, Celular - VIVO'),(59,'556199634','Brasil, Gyn, Celular - VIVO'),(60,'556199635','Brasil, Gyn, Celular - VIVO'),(61,'556199636','Brasil, Gyn, Celular - VIVO'),(62,'556199637','Brasil, Gyn, Celular - VIVO'),(63,'556199638','Brasil, Gyn, Celular - VIVO'),(64,'556199639','Brasil, Gyn, Celular - VIVO'),(65,'556199641','Brasil, Gyn, Celular - VIVO'),(66,'556199642','Brasil, Gyn, Celular - VIVO'),(67,'556199643','Brasil, Gyn, Celular - VIVO'),(68,'556199644','Brasil, Gyn, Celular - VIVO'),(69,'556199645','Brasil, Gyn, Celular - VIVO'),(70,'556199646','Brasil, Gyn, Celular - VIVO'),(71,'556199647','Brasil, Gyn, Celular - VIVO'),(72,'556199648','Brasil, Gyn, Celular - VIVO'),(73,'556199649','Brasil, Gyn, Celular - VIVO'),(74,'556199651','Brasil, Gyn, Celular - VIVO'),(75,'556199652','Brasil, Gyn, Celular - VIVO'),(76,'556199653','Brasil, Gyn, Celular - VIVO'),(77,'556199654','Brasil, Gyn, Celular - VIVO'),(78,'556199655','Brasil, Gyn, Celular - VIVO'),(79,'556199656','Brasil, Gyn, Celular - VIVO'),(80,'556199657','Brasil, Gyn, Celular - VIVO'),(81,'556199658','Brasil, Gyn, Celular - VIVO'),(82,'556199659','Brasil, Gyn, Celular - VIVO'),(83,'556199661','Brasil, Gyn, Celular - VIVO'),(84,'556199662','Brasil, Gyn, Celular - VIVO'),(85,'556199663','Brasil, Gyn, Celular - VIVO'),(86,'556199664','Brasil, Gyn, Celular - VIVO'),(87,'556199665','Brasil, Gyn, Celular - VIVO'),(88,'556199666','Brasil, Gyn, Celular - VIVO'),(89,'556199667','Brasil, Gyn, Celular - VIVO'),(90,'556199668','Brasil, Gyn, Celular - VIVO'),(91,'556199669','Brasil, Gyn, Celular - VIVO'),(92,'556199671','Brasil, Gyn, Celular - VIVO'),(93,'556199672','Brasil, Gyn, Celular - VIVO'),(94,'556199673','Brasil, Gyn, Celular - VIVO'),(95,'556199674','Brasil, Gyn, Celular - VIVO'),(96,'556199675','Brasil, Gyn, Celular - VIVO'),(97,'556199676','Brasil, Gyn, Celular - VIVO'),(98,'556199677','Brasil, Gyn, Celular - VIVO'),(99,'556199678','Brasil, Gyn, Celular - VIVO'),(100,'556199679','Brasil, Gyn, Celular - VIVO'),(101,'556199681','Brasil, Gyn, Celular - VIVO'),(102,'556199682','Brasil, Gyn, Celular - VIVO'),(103,'556199683','Brasil, Gyn, Celular - VIVO'),(104,'556199684','Brasil, Gyn, Celular - VIVO'),(105,'556199685','Brasil, Gyn, Celular - VIVO'),(106,'556199686','Brasil, Gyn, Celular - VIVO'),(107,'556199687','Brasil, Gyn, Celular - VIVO'),(108,'556199688','Brasil, Gyn, Celular - VIVO'),(109,'556199689','Brasil, Gyn, Celular - VIVO'),(110,'556199691','Brasil, Gyn, Celular - VIVO'),(111,'556199692','Brasil, Gyn, Celular - VIVO'),(112,'556199693','Brasil, Gyn, Celular - VIVO'),(113,'556199694','Brasil, Gyn, Celular - VIVO'),(114,'556199695','Brasil, Gyn, Celular - VIVO'),(115,'556199696','Brasil, Gyn, Celular - VIVO'),(116,'556199697','Brasil, Gyn, Celular - VIVO'),(117,'556199698','Brasil, Gyn, Celular - VIVO'),(118,'556199699','Brasil, Gyn, Celular - VIVO'),(119,'556199801','Brasil, Gyn, Celular - VIVO'),(120,'556199802','Brasil, Gyn, Celular - VIVO'),(121,'556199803','Brasil, Gyn, Celular - VIVO'),(122,'556199804','Brasil, Gyn, Celular - VIVO'),(123,'556199805','Brasil, Gyn, Celular - VIVO'),(124,'556199806','Brasil, Gyn, Celular - VIVO'),(125,'556199807','Brasil, Gyn, Celular - VIVO'),(126,'556199808','Brasil, Gyn, Celular - VIVO'),(127,'556199809','Brasil, Gyn, Celular - VIVO'),(128,'556199811','Brasil, Gyn, Celular - VIVO'),(129,'556199812','Brasil, Gyn, Celular - VIVO'),(130,'556199813','Brasil, Gyn, Celular - VIVO'),(131,'556199814','Brasil, Gyn, Celular - VIVO'),(132,'556199815','Brasil, Gyn, Celular - VIVO'),(133,'556199816','Brasil, Gyn, Celular - VIVO'),(134,'556199817','Brasil, Gyn, Celular - VIVO'),(135,'556199818','Brasil, Gyn, Celular - VIVO'),(136,'556199819','Brasil, Gyn, Celular - VIVO'),(137,'556199821','Brasil, Gyn, Celular - VIVO'),(138,'556199822','Brasil, Gyn, Celular - VIVO'),(139,'556199823','Brasil, Gyn, Celular - VIVO'),(140,'556199824','Brasil, Gyn, Celular - VIVO'),(141,'556199825','Brasil, Gyn, Celular - VIVO'),(142,'556199826','Brasil, Gyn, Celular - VIVO'),(143,'556199827','Brasil, Gyn, Celular - VIVO'),(144,'556199828','Brasil, Gyn, Celular - VIVO'),(145,'556199829','Brasil, Gyn, Celular - VIVO'),(146,'556199831','Brasil, Gyn, Celular - VIVO'),(147,'556199832','Brasil, Gyn, Celular - VIVO'),(148,'556199833','Brasil, Gyn, Celular - VIVO'),(149,'556199834','Brasil, Gyn, Celular - VIVO'),(150,'556199835','Brasil, Gyn, Celular - VIVO'),(151,'556199836','Brasil, Gyn, Celular - VIVO'),(152,'556199837','Brasil, Gyn, Celular - VIVO'),(153,'556199838','Brasil, Gyn, Celular - VIVO'),(154,'556199839','Brasil, Gyn, Celular - VIVO'),(155,'556199841','Brasil, Gyn, Celular - VIVO'),(156,'556199842','Brasil, Gyn, Celular - VIVO'),(157,'556199843','Brasil, Gyn, Celular - VIVO'),(158,'556199844','Brasil, Gyn, Celular - VIVO'),(159,'556199845','Brasil, Gyn, Celular - VIVO'),(160,'556199846','Brasil, Gyn, Celular - VIVO'),(161,'556199847','Brasil, Gyn, Celular - VIVO'),(162,'556199848','Brasil, Gyn, Celular - VIVO'),(163,'556199849','Brasil, Gyn, Celular - VIVO'),(164,'556199851','Brasil, Gyn, Celular - VIVO'),(165,'556199852','Brasil, Gyn, Celular - VIVO'),(166,'556199853','Brasil, Gyn, Celular - VIVO'),(167,'556199854','Brasil, Gyn, Celular - VIVO'),(168,'556199855','Brasil, Gyn, Celular - VIVO'),(169,'556199856','Brasil, Gyn, Celular - VIVO'),(170,'556199857','Brasil, Gyn, Celular - VIVO'),(171,'556199858','Brasil, Gyn, Celular - VIVO'),(172,'556199859','Brasil, Gyn, Celular - VIVO'),(173,'55619986','Brasil, Gyn, Celular - VIVO'),(174,'55619987','Brasil, Gyn, Celular - VIVO'),(175,'556199880','Brasil, Gyn, Celular - VIVO'),(176,'556199881','Brasil, Gyn, Celular - VIVO'),(177,'556199882','Brasil, Gyn, Celular - VIVO'),(178,'556199883','Brasil, Gyn, Celular - VIVO'),(179,'556199884','Brasil, Gyn, Celular - VIVO'),(180,'556199901','Brasil, Gyn, Celular - VIVO'),(181,'556199902','Brasil, Gyn, Celular - VIVO'),(182,'556199903','Brasil, Gyn, Celular - VIVO'),(183,'556199904','Brasil, Gyn, Celular - VIVO'),(184,'556199905','Brasil, Gyn, Celular - VIVO'),(185,'556199906','Brasil, Gyn, Celular - VIVO'),(186,'556199907','Brasil, Gyn, Celular - VIVO'),(187,'556199908','Brasil, Gyn, Celular - VIVO'),(188,'556199909','Brasil, Gyn, Celular - VIVO'),(189,'556199911','Brasil, Gyn, Celular - VIVO'),(190,'556199912','Brasil, Gyn, Celular - VIVO'),(191,'556199913','Brasil, Gyn, Celular - VIVO'),(192,'556199914','Brasil, Gyn, Celular - VIVO'),(193,'556199915','Brasil, Gyn, Celular - VIVO'),(194,'556199916','Brasil, Gyn, Celular - VIVO'),(195,'556199917','Brasil, Gyn, Celular - VIVO'),(196,'556199918','Brasil, Gyn, Celular - VIVO'),(197,'556199919','Brasil, Gyn, Celular - VIVO'),(198,'556199921','Brasil, Gyn, Celular - VIVO'),(199,'556199922','Brasil, Gyn, Celular - VIVO'),(200,'556199923','Brasil, Gyn, Celular - VIVO'),(201,'556199924','Brasil, Gyn, Celular - VIVO'),(202,'556199925','Brasil, Gyn, Celular - VIVO'),(203,'556199926','Brasil, Gyn, Celular - VIVO'),(204,'556199927','Brasil, Gyn, Celular - VIVO'),(205,'556199928','Brasil, Gyn, Celular - VIVO'),(206,'556199929','Brasil, Gyn, Celular - VIVO'),(207,'556199931','Brasil, Gyn, Celular - VIVO'),(208,'556199932','Brasil, Gyn, Celular - VIVO'),(209,'556199933','Brasil, Gyn, Celular - VIVO'),(210,'556199934','Brasil, Gyn, Celular - VIVO'),(211,'556199935','Brasil, Gyn, Celular - VIVO'),(212,'556199936','Brasil, Gyn, Celular - VIVO'),(213,'556199937','Brasil, Gyn, Celular - VIVO'),(214,'556199938','Brasil, Gyn, Celular - VIVO'),(215,'556199939','Brasil, Gyn, Celular - VIVO'),(216,'556199941','Brasil, Gyn, Celular - VIVO'),(217,'556199942','Brasil, Gyn, Celular - VIVO'),(218,'556199943','Brasil, Gyn, Celular - VIVO'),(219,'556199944','Brasil, Gyn, Celular - VIVO'),(220,'556199945','Brasil, Gyn, Celular - VIVO'),(221,'556199946','Brasil, Gyn, Celular - VIVO'),(222,'556199947','Brasil, Gyn, Celular - VIVO'),(223,'556199948','Brasil, Gyn, Celular - VIVO'),(224,'556199949','Brasil, Gyn, Celular - VIVO'),(225,'556199951','Brasil, Gyn, Celular - VIVO'),(226,'556199952','Brasil, Gyn, Celular - VIVO'),(227,'556199953','Brasil, Gyn, Celular - VIVO'),(228,'556199954','Brasil, Gyn, Celular - VIVO'),(229,'556199955','Brasil, Gyn, Celular - VIVO'),(230,'556199956','Brasil, Gyn, Celular - VIVO'),(231,'556199957','Brasil, Gyn, Celular - VIVO'),(232,'556199958','Brasil, Gyn, Celular - VIVO'),(233,'556199959','Brasil, Gyn, Celular - VIVO'),(234,'556199963','Brasil, Gyn, Celular - VIVO'),(235,'556199975','Brasil, Gyn, Celular - VIVO'),(236,'556199981','Brasil, Gyn, Celular - VIVO'),(237,'556199993','Brasil, Gyn, Celular - VIVO'),(238,'556299611','Brasil, Gyn, Celular - VIVO'),(239,'556299801','Brasil, Gyn, Celular - VIVO'),(240,'556299815','Brasil, Gyn, Celular - VIVO'),(241,'556299823','Brasil, Gyn, Celular - VIVO'),(242,'556299837','Brasil, Gyn, Celular - VIVO'),(243,'556299843','Brasil, Gyn, Celular - VIVO'),(244,'556299851','Brasil, Gyn, Celular - VIVO'),(245,'556299860','Brasil, Gyn, Celular - VIVO'),(246,'556299861','Brasil, Gyn, Celular - VIVO'),(247,'556299862','Brasil, Gyn, Celular - VIVO'),(248,'556299981','Brasil, Gyn, Celular - VIVO'),(249,'556399644','Brasil, Gyn, Celular - VIVO'),(250,'556399658','Brasil, Gyn, Celular - VIVO'),(251,'556399695','Brasil, Gyn, Celular - VIVO'),(252,'556399902','Brasil, Gyn, Celular - VIVO'),(253,'556399906','Brasil, Gyn, Celular - VIVO'),(254,'556399911','Brasil, Gyn, Celular - VIVO'),(255,'556399923','Brasil, Gyn, Celular - VIVO'),(256,'556399928','Brasil, Gyn, Celular - VIVO'),(257,'556399929','Brasil, Gyn, Celular - VIVO'),(258,'55639993','Brasil, Gyn, Celular - VIVO'),(259,'55639994','Brasil, Gyn, Celular - VIVO'),(260,'55639995','Brasil, Gyn, Celular - VIVO'),(261,'55639996','Brasil, Gyn, Celular - VIVO'),(262,'55639997','Brasil, Gyn, Celular - VIVO'),(263,'55639998','Brasil, Gyn, Celular - VIVO'),(264,'556399991','Brasil, Gyn, Celular - VIVO'),(265,'556399992','Brasil, Gyn, Celular - VIVO'),(266,'556399993','Brasil, Gyn, Celular - VIVO'),(267,'556399994','Brasil, Gyn, Celular - VIVO'),(268,'556399995','Brasil, Gyn, Celular - VIVO'),(269,'556399996','Brasil, Gyn, Celular - VIVO'),(270,'556399997','Brasil, Gyn, Celular - VIVO'),(271,'556399998','Brasil, Gyn, Celular - VIVO'),(272,'556399999','Brasil, Gyn, Celular - VIVO'),(273,'55649960','Brasil, Gyn, Celular - VIVO'),(274,'55649961','Brasil, Gyn, Celular - VIVO'),(275,'556499620','Brasil, Gyn, Celular - VIVO'),(276,'556499621','Brasil, Gyn, Celular - VIVO'),(277,'556499622','Brasil, Gyn, Celular - VIVO'),(278,'556499623','Brasil, Gyn, Celular - VIVO'),(279,'556499624','Brasil, Gyn, Celular - VIVO'),(280,'556499625','Brasil, Gyn, Celular - VIVO'),(281,'556499626','Brasil, Gyn, Celular - VIVO'),(282,'556499627','Brasil, Gyn, Celular - VIVO'),(283,'556499641','Brasil, Gyn, Celular - VIVO'),(284,'556499642','Brasil, Gyn, Celular - VIVO'),(285,'556499643','Brasil, Gyn, Celular - VIVO'),(286,'556499644','Brasil, Gyn, Celular - VIVO'),(287,'556499645','Brasil, Gyn, Celular - VIVO'),(288,'556499646','Brasil, Gyn, Celular - VIVO'),(289,'556499647','Brasil, Gyn, Celular - VIVO'),(290,'556499648','Brasil, Gyn, Celular - VIVO'),(291,'556499652','Brasil, Gyn, Celular - VIVO'),(292,'556499653','Brasil, Gyn, Celular - VIVO'),(293,'556499654','Brasil, Gyn, Celular - VIVO'),(294,'556499655','Brasil, Gyn, Celular - VIVO'),(295,'556499658','Brasil, Gyn, Celular - VIVO'),(296,'556499671','Brasil, Gyn, Celular - VIVO'),(297,'556499673','Brasil, Gyn, Celular - VIVO'),(298,'556499674','Brasil, Gyn, Celular - VIVO'),(299,'556499675','Brasil, Gyn, Celular - VIVO'),(300,'556499676','Brasil, Gyn, Celular - VIVO'),(301,'556499694','Brasil, Gyn, Celular - VIVO'),(302,'556499695','Brasil, Gyn, Celular - VIVO'),(303,'556499696','Brasil, Gyn, Celular - VIVO'),(304,'556499697','Brasil, Gyn, Celular - VIVO'),(305,'556499699','Brasil, Gyn, Celular - VIVO'),(306,'55649990','Brasil, Gyn, Celular - VIVO'),(307,'556499910','Brasil, Gyn, Celular - VIVO'),(308,'556499911','Brasil, Gyn, Celular - VIVO'),(309,'556499912','Brasil, Gyn, Celular - VIVO'),(310,'556499915','Brasil, Gyn, Celular - VIVO'),(311,'556499916','Brasil, Gyn, Celular - VIVO'),(312,'556499917','Brasil, Gyn, Celular - VIVO'),(313,'556499918','Brasil, Gyn, Celular - VIVO'),(314,'556499919','Brasil, Gyn, Celular - VIVO'),(315,'556499921','Brasil, Gyn, Celular - VIVO'),(316,'556499922','Brasil, Gyn, Celular - VIVO'),(317,'556499923','Brasil, Gyn, Celular - VIVO'),(318,'556499924','Brasil, Gyn, Celular - VIVO'),(319,'556499925','Brasil, Gyn, Celular - VIVO'),(320,'556499926','Brasil, Gyn, Celular - VIVO'),(321,'556499927','Brasil, Gyn, Celular - VIVO'),(322,'556499928','Brasil, Gyn, Celular - VIVO'),(323,'556499929','Brasil, Gyn, Celular - VIVO'),(324,'556499931','Brasil, Gyn, Celular - VIVO'),(325,'556499932','Brasil, Gyn, Celular - VIVO'),(326,'556499933','Brasil, Gyn, Celular - VIVO'),(327,'556499934','Brasil, Gyn, Celular - VIVO'),(328,'556499935','Brasil, Gyn, Celular - VIVO'),(329,'556499936','Brasil, Gyn, Celular - VIVO'),(330,'556499937','Brasil, Gyn, Celular - VIVO'),(331,'556499938','Brasil, Gyn, Celular - VIVO'),(332,'556499939','Brasil, Gyn, Celular - VIVO'),(333,'556499941','Brasil, Gyn, Celular - VIVO'),(334,'556499942','Brasil, Gyn, Celular - VIVO'),(335,'556499943','Brasil, Gyn, Celular - VIVO'),(336,'556499944','Brasil, Gyn, Celular - VIVO'),(337,'556499945','Brasil, Gyn, Celular - VIVO'),(338,'556499946','Brasil, Gyn, Celular - VIVO'),(339,'556499947','Brasil, Gyn, Celular - VIVO'),(340,'556499948','Brasil, Gyn, Celular - VIVO'),(341,'556499949','Brasil, Gyn, Celular - VIVO'),(342,'55649995','Brasil, Gyn, Celular - VIVO'),(343,'556499960','Brasil, Gyn, Celular - VIVO'),(344,'556499961','Brasil, Gyn, Celular - VIVO'),(345,'556499962','Brasil, Gyn, Celular - VIVO'),(346,'556499963','Brasil, Gyn, Celular - VIVO'),(347,'556499964','Brasil, Gyn, Celular - VIVO'),(348,'556499965','Brasil, Gyn, Celular - VIVO'),(349,'556499967','Brasil, Gyn, Celular - VIVO'),(350,'556499968','Brasil, Gyn, Celular - VIVO'),(351,'556499969','Brasil, Gyn, Celular - VIVO'),(352,'55649997','Brasil, Gyn, Celular - VIVO'),(353,'55649998','Brasil, Gyn, Celular - VIVO'),(354,'556499990','Brasil, Gyn, Celular - VIVO'),(355,'556499991','Brasil, Gyn, Celular - VIVO'),(356,'556499994','Brasil, Gyn, Celular - VIVO'),(357,'556499995','Brasil, Gyn, Celular - VIVO'),(358,'556499996','Brasil, Gyn, Celular - VIVO'),(359,'556499997','Brasil, Gyn, Celular - VIVO'),(360,'556499998','Brasil, Gyn, Celular - VIVO'),(361,'556198684','Brasil, Gyn, Celular - Geral'),(362,'556198685','Brasil, Gyn, Celular - Geral'),(363,'556198686','Brasil, Gyn, Celular - Geral'),(364,'556198687','Brasil, Gyn, Celular - Geral'),(365,'556198688','Brasil, Gyn, Celular - Geral'),(366,'556198689','Brasil, Gyn, Celular - Geral'),(367,'556298668','Brasil, Gyn, Celular - Geral'),(368,'556298669','Brasil, Gyn, Celular - Geral'),(369,'556298103','Brasil, GO, Celular - TIM'),(370,'556298104','Brasil, GO, Celular - TIM'),(371,'556298105','Brasil, GO, Celular - TIM'),(372,'556298106','Brasil, GO, Celular - TIM'),(373,'556298107','Brasil, GO, Celular - TIM'),(374,'556298108','Brasil, GO, Celular - TIM'),(375,'556298109','Brasil, GO, Celular - TIM'),(376,'556298110','Brasil, GO, Celular - TIM'),(377,'556298111','Brasil, GO, Celular - TIM'),(378,'556298112','Brasil, GO, Celular - TIM'),(379,'556298113','Brasil, GO, Celular - TIM'),(380,'556298114','Brasil, GO, Celular - TIM'),(381,'556298115','Brasil, GO, Celular - TIM'),(382,'556298116','Brasil, GO, Celular - TIM'),(383,'556298117','Brasil, GO, Celular - TIM'),(384,'556298118','Brasil, GO, Celular - TIM'),(385,'556298119','Brasil, GO, Celular - TIM'),(386,'556298120','Brasil, GO, Celular - TIM'),(387,'556298121','Brasil, GO, Celular - TIM'),(388,'556298122','Brasil, GO, Celular - TIM'),(389,'556298123','Brasil, GO, Celular - TIM'),(390,'556298124','Brasil, GO, Celular - TIM'),(391,'556298125','Brasil, GO, Celular - TIM'),(392,'556298126','Brasil, GO, Celular - TIM'),(393,'556298127','Brasil, GO, Celular - TIM'),(394,'556298128','Brasil, GO, Celular - TIM'),(395,'556298129','Brasil, GO, Celular - TIM'),(396,'556298131','Brasil, GO, Celular - TIM'),(397,'556298132','Brasil, GO, Celular - TIM'),(398,'556298133','Brasil, GO, Celular - TIM'),(399,'556298134','Brasil, GO, Celular - TIM'),(400,'556298135','Brasil, GO, Celular - TIM'),(401,'556298136','Brasil, GO, Celular - TIM'),(402,'556298137','Brasil, GO, Celular - TIM'),(403,'556298138','Brasil, GO, Celular - TIM'),(404,'556298139','Brasil, GO, Celular - TIM'),(405,'556298140','Brasil, GO, Celular - TIM'),(406,'556298141','Brasil, GO, Celular - TIM'),(407,'556298142','Brasil, GO, Celular - TIM'),(408,'556298143','Brasil, GO, Celular - TIM'),(409,'556298144','Brasil, GO, Celular - TIM'),(410,'556298145','Brasil, GO, Celular - TIM'),(411,'556298157','Brasil, GO, Celular - TIM'),(412,'556298158','Brasil, GO, Celular - TIM'),(413,'556298159','Brasil, GO, Celular - TIM'),(414,'556298160','Brasil, GO, Celular - TIM'),(415,'556298161','Brasil, GO, Celular - TIM'),(416,'556298162','Brasil, GO, Celular - TIM'),(417,'556298163','Brasil, GO, Celular - TIM'),(418,'556298164','Brasil, GO, Celular - TIM'),(419,'556298165','Brasil, GO, Celular - TIM'),(420,'556298166','Brasil, GO, Celular - TIM'),(421,'556298167','Brasil, GO, Celular - TIM'),(422,'556298168','Brasil, GO, Celular - TIM'),(423,'556298169','Brasil, GO, Celular - TIM'),(424,'556298170','Brasil, GO, Celular - TIM'),(425,'556298171','Brasil, GO, Celular - TIM'),(426,'556298172','Brasil, GO, Celular - TIM'),(427,'556298173','Brasil, GO, Celular - TIM'),(428,'556298174','Brasil, GO, Celular - TIM'),(429,'556298175','Brasil, GO, Celular - TIM'),(430,'556298191','Brasil, GO, Celular - TIM'),(431,'556298192','Brasil, GO, Celular - TIM'),(432,'556298193','Brasil, GO, Celular - TIM'),(433,'556298194','Brasil, GO, Celular - TIM'),(434,'556298195','Brasil, GO, Celular - TIM'),(435,'556298196','Brasil, GO, Celular - TIM'),(436,'556298197','Brasil, GO, Celular - TIM'),(437,'556298198','Brasil, GO, Celular - TIM'),(438,'556298199','Brasil, GO, Celular - TIM'),(439,'556298200','Brasil, GO, Celular - TIM'),(440,'556298201','Brasil, GO, Celular - TIM'),(441,'556298202','Brasil, GO, Celular - TIM'),(442,'556298203','Brasil, GO, Celular - TIM'),(443,'556298204','Brasil, GO, Celular - TIM'),(444,'556298205','Brasil, GO, Celular - TIM'),(445,'556298206','Brasil, GO, Celular - TIM'),(446,'556298207','Brasil, GO, Celular - TIM'),(447,'556298208','Brasil, GO, Celular - TIM'),(448,'556298209','Brasil, GO, Celular - TIM'),(449,'556298210','Brasil, GO, Celular - TIM'),(450,'556298211','Brasil, GO, Celular - TIM'),(451,'556298212','Brasil, GO, Celular - TIM'),(452,'556298213','Brasil, GO, Celular - TIM'),(453,'556298214','Brasil, GO, Celular - TIM'),(454,'556298215','Brasil, GO, Celular - TIM'),(455,'556298216','Brasil, GO, Celular - TIM'),(456,'556298217','Brasil, GO, Celular - TIM'),(457,'556298218','Brasil, GO, Celular - TIM'),(458,'556298219','Brasil, GO, Celular - TIM'),(459,'556298220','Brasil, GO, Celular - TIM'),(460,'556298221','Brasil, GO, Celular - TIM'),(461,'556298222','Brasil, GO, Celular - TIM'),(462,'556298223','Brasil, GO, Celular - TIM'),(463,'556298231','Brasil, GO, Celular - TIM'),(464,'556298232','Brasil, GO, Celular - TIM'),(465,'556298233','Brasil, GO, Celular - TIM'),(466,'556298234','Brasil, GO, Celular - TIM'),(467,'556298235','Brasil, GO, Celular - TIM'),(468,'556298236','Brasil, GO, Celular - TIM'),(469,'556298237','Brasil, GO, Celular - TIM'),(470,'556298238','Brasil, GO, Celular - TIM'),(471,'556298239','Brasil, GO, Celular - TIM'),(472,'556298240','Brasil, GO, Celular - TIM'),(473,'556298241','Brasil, GO, Celular - TIM'),(474,'556298242','Brasil, GO, Celular - TIM'),(475,'556298243','Brasil, GO, Celular - TIM'),(476,'556298244','Brasil, GO, Celular - TIM'),(477,'556298245','Brasil, GO, Celular - TIM'),(478,'556298246','Brasil, GO, Celular - TIM'),(479,'556298247','Brasil, GO, Celular - TIM'),(480,'556298248','Brasil, GO, Celular - TIM'),(481,'556298249','Brasil, GO, Celular - TIM'),(482,'556298250','Brasil, GO, Celular - TIM'),(483,'556298251','Brasil, GO, Celular - TIM'),(484,'556298252','Brasil, GO, Celular - TIM'),(485,'556298253','Brasil, GO, Celular - TIM'),(486,'556298254','Brasil, GO, Celular - TIM'),(487,'556298255','Brasil, GO, Celular - TIM'),(488,'556298291','Brasil, GO, Celular - TIM'),(489,'55629','Brasil, Gyn, Celular'),(490,'556299111','Brasil, GO, Celular  - Claro'),(491,'556299112','Brasil, GO, Celular  - Claro'),(492,'556299113','Brasil, GO, Celular  - Claro'),(493,'556299114','Brasil, GO, Celular  - Claro'),(494,'556299115','Brasil, GO, Celular  - Claro'),(495,'556299116','Brasil, GO, Celular  - Claro'),(496,'556299117','Brasil, GO, Celular  - Claro'),(497,'556299118','Brasil, GO, Celular  - Claro'),(498,'556299119','Brasil, GO, Celular  - Claro'),(499,'556299120','Brasil, GO, Celular  - Claro'),(500,'556299121','Brasil, GO, Celular  - Claro'),(501,'556299122','Brasil, GO, Celular  - Claro'),(502,'556299123','Brasil, GO, Celular  - Claro'),(503,'556299124','Brasil, GO, Celular  - Claro'),(504,'556299125','Brasil, GO, Celular  - Claro'),(505,'556299126','Brasil, GO, Celular  - Claro'),(506,'556299127','Brasil, GO, Celular  - Claro'),(507,'556299128','Brasil, GO, Celular  - Claro'),(508,'556299129','Brasil, GO, Celular  - Claro'),(509,'556299130','Brasil, GO, Celular  - Claro'),(510,'556299131','Brasil, GO, Celular  - Claro'),(511,'556299132','Brasil, GO, Celular  - Claro'),(512,'556299133','Brasil, GO, Celular  - Claro'),(513,'556299134','Brasil, GO, Celular  - Claro'),(514,'556299135','Brasil, GO, Celular  - Claro'),(515,'556299136','Brasil, GO, Celular  - Claro'),(516,'556299137','Brasil, GO, Celular  - Claro'),(517,'556299138','Brasil, GO, Celular  - Claro'),(518,'556299139','Brasil, GO, Celular  - Claro'),(519,'556299140','Brasil, GO, Celular  - Claro'),(520,'556299141','Brasil, GO, Celular  - Claro'),(521,'556299142','Brasil, GO, Celular  - Claro'),(522,'556299143','Brasil, GO, Celular  - Claro'),(523,'556299144','Brasil, GO, Celular  - Claro'),(524,'556299145','Brasil, GO, Celular  - Claro'),(525,'556299146','Brasil, GO, Celular  - Claro'),(526,'556299147','Brasil, GO, Celular  - Claro'),(527,'556299148','Brasil, GO, Celular  - Claro'),(528,'556299149','Brasil, GO, Celular  - Claro'),(529,'556299150','Brasil, GO, Celular  - Claro'),(530,'556299151','Brasil, GO, Celular  - Claro'),(531,'556299152','Brasil, GO, Celular  - Claro'),(532,'556299153','Brasil, GO, Celular  - Claro'),(533,'556299154','Brasil, GO, Celular  - Claro'),(534,'556299155','Brasil, GO, Celular  - Claro'),(535,'556299156','Brasil, GO, Celular  - Claro'),(536,'556299157','Brasil, GO, Celular  - Claro'),(537,'556299158','Brasil, GO, Celular  - Claro'),(538,'556299159','Brasil, GO, Celular  - Claro'),(539,'556299160','Brasil, GO, Celular  - Claro'),(540,'556299161','Brasil, GO, Celular  - Claro'),(541,'556299162','Brasil, GO, Celular  - Claro'),(542,'556299163','Brasil, GO, Celular  - Claro'),(543,'556299164','Brasil, GO, Celular  - Claro'),(544,'556299165','Brasil, GO, Celular  - Claro'),(545,'556299166','Brasil, GO, Celular  - Claro'),(546,'556299167','Brasil, GO, Celular  - Claro'),(547,'556299168','Brasil, GO, Celular  - Claro'),(548,'556299169','Brasil, GO, Celular  - Claro'),(549,'556299170','Brasil, GO, Celular  - Claro'),(550,'556299171','Brasil, GO, Celular  - Claro'),(551,'556299172','Brasil, GO, Celular  - Claro'),(552,'556299173','Brasil, GO, Celular  - Claro'),(553,'556299174','Brasil, GO, Celular  - Claro'),(554,'556299175','Brasil, GO, Celular  - Claro'),(555,'556299176','Brasil, GO, Celular  - Claro'),(556,'556299177','Brasil, GO, Celular  - Claro'),(557,'556299178','Brasil, GO, Celular  - Claro'),(558,'556299179','Brasil, GO, Celular  - Claro'),(559,'556299180','Brasil, GO, Celular  - Claro'),(560,'556299181','Brasil, GO, Celular  - Claro'),(561,'556299182','Brasil, GO, Celular  - Claro'),(562,'556299183','Brasil, GO, Celular  - Claro'),(563,'556298412','Brasil, GO, Celular  - TIM / OI'),(564,'556298413','Brasil, GO, Celular  - TIM / OI'),(565,'556298414','Brasil, GO, Celular  - TIM / OI'),(566,'556298415','Brasil, GO, Celular  - TIM / OI'),(567,'556298416','Brasil, GO, Celular  - TIM / OI'),(568,'556298417','Brasil, GO, Celular  - TIM / OI'),(569,'556298418','Brasil, GO, Celular  - TIM / OI'),(570,'556298419','Brasil, GO, Celular  - TIM / OI'),(571,'556298420','Brasil, GO, Celular  - TIM / OI'),(572,'556298421','Brasil, GO, Celular  - TIM / OI'),(573,'556298422','Brasil, GO, Celular  - TIM / OI'),(574,'556298423','Brasil, GO, Celular  - TIM / OI'),(575,'556298424','Brasil, GO, Celular  - TIM / OI'),(576,'556298425','Brasil, GO, Celular  - TIM / OI'),(577,'556298426','Brasil, GO, Celular  - TIM / OI'),(578,'556298427','Brasil, GO, Celular  - TIM / OI'),(579,'556298428','Brasil, GO, Celular  - TIM / OI'),(580,'556298429','Brasil, GO, Celular  - TIM / OI'),(581,'556298430','Brasil, GO, Celular  - TIM / OI'),(582,'556298431','Brasil, GO, Celular  - TIM / OI'),(583,'556298432','Brasil, GO, Celular  - TIM / OI'),(584,'556298433','Brasil, GO, Celular  - TIM / OI'),(585,'556298434','Brasil, GO, Celular  - TIM / OI'),(586,'556298435','Brasil, GO, Celular  - TIM / OI'),(587,'556298436','Brasil, GO, Celular  - TIM / OI'),(588,'556298437','Brasil, GO, Celular  - TIM / OI'),(589,'556298438','Brasil, GO, Celular  - TIM / OI'),(590,'556298439','Brasil, GO, Celular  - TIM / OI'),(591,'556298440','Brasil, GO, Celular  - TIM / OI'),(592,'556298441','Brasil, GO, Celular  - TIM / OI'),(593,'556298442','Brasil, GO, Celular  - TIM / OI'),(594,'556298443','Brasil, GO, Celular  - TIM / OI'),(595,'556298444','Brasil, GO, Celular  - TIM / OI'),(596,'556298445','Brasil, GO, Celular  - TIM / OI'),(597,'556298447','Brasil, GO, Celular  - TIM / OI'),(598,'556298448','Brasil, GO, Celular  - TIM / OI'),(599,'556298449','Brasil, GO, Celular  - TIM / OI'),(600,'556298450','Brasil, GO, Celular  - TIM / OI'),(601,'556298451','Brasil, GO, Celular  - TIM / OI'),(602,'556298452','Brasil, GO, Celular  - TIM / OI'),(603,'556298453','Brasil, GO, Celular  - TIM / OI'),(604,'556298454','Brasil, GO, Celular  - TIM / OI'),(605,'556298455','Brasil, GO, Celular  - TIM / OI'),(606,'556298456','Brasil, GO, Celular  - TIM / OI'),(607,'556298457','Brasil, GO, Celular  - TIM / OI'),(608,'556298458','Brasil, GO, Celular  - TIM / OI'),(609,'556298459','Brasil, GO, Celular  - TIM / OI'),(610,'556298460','Brasil, GO, Celular  - TIM / OI'),(611,'556298461','Brasil, GO, Celular  - TIM / OI'),(612,'556298462','Brasil, GO, Celular  - TIM / OI'),(613,'556298463','Brasil, GO, Celular  - TIM / OI'),(614,'556298464','Brasil, GO, Celular  - TIM / OI'),(615,'556298465','Brasil, GO, Celular  - TIM / OI'),(616,'556298466','Brasil, GO, Celular  - TIM / OI'),(617,'556298467','Brasil, GO, Celular  - TIM / OI'),(618,'556298468','Brasil, GO, Celular  - TIM / OI'),(619,'556298469','Brasil, GO, Celular  - TIM / OI'),(620,'556298470','Brasil, GO, Celular  - TIM / OI'),(621,'556298471','Brasil, GO, Celular  - TIM / OI'),(622,'556298472','Brasil, GO, Celular  - TIM / OI'),(623,'556298473','Brasil, GO, Celular  - TIM / OI'),(624,'556298474','Brasil, GO, Celular  - TIM / OI'),(625,'556298475','Brasil, GO, Celular  - TIM / OI'),(626,'556298476','Brasil, GO, Celular  - TIM / OI'),(627,'556298477','Brasil, GO, Celular  - TIM / OI'),(628,'556298478','Brasil, GO, Celular  - TIM / OI'),(629,'556298479','Brasil, GO, Celular  - TIM / OI'),(630,'556298480','Brasil, GO, Celular  - TIM / OI'),(631,'556298481','Brasil, GO, Celular  - TIM / OI'),(632,'556298482','Brasil, GO, Celular  - TIM / OI'),(633,'556298483','Brasil, GO, Celular  - TIM / OI'),(634,'55623','Brasil, Gyn, Fixo'),(635,'556299247','Brasil, GO, Celular  - Claro'),(637,'550800','Brasil - 0800');
/*!40000 ALTER TABLE `pkg_prefix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_prefix_length`
--

DROP TABLE IF EXISTS `pkg_prefix_length`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_prefix_length` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_prefix_length`
--

LOCK TABLES `pkg_prefix_length` WRITE;
/*!40000 ALTER TABLE `pkg_prefix_length` DISABLE KEYS */;
INSERT INTO `pkg_prefix_length` VALUES (7,55,9),(8,8,4);
/*!40000 ALTER TABLE `pkg_prefix_length` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_provider`
--

DROP TABLE IF EXISTS `pkg_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_name` char(30) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` mediumtext DEFAULT NULL,
  `credit` decimal(18,5) NOT NULL DEFAULT 0.00000,
  `credit_control` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cons_pkg_provider_provider_name` (`provider_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_provider`
--

LOCK TABLES `pkg_provider` WRITE;
/*!40000 ALTER TABLE `pkg_provider` DISABLE KEYS */;
INSERT INTO `pkg_provider` VALUES (1,'Voxbeam-Gold','2023-02-25 21:57:00','',24.78270,0),(2,'Voxbeam-Platinum','2023-02-25 21:57:27','',24.73000,0),(3,'Voxbeam-Silver','2023-02-25 21:57:46','',24.74920,0),(4,'Voxbeam-Call-Center','2023-02-25 21:58:15','',22.41000,0),(5,'Bridgevoice','2023-02-26 12:56:43','',11.00000,0);
/*!40000 ALTER TABLE `pkg_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_provider_cnl`
--

DROP TABLE IF EXISTS `pkg_provider_cnl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_provider_cnl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_provider` int(11) NOT NULL,
  `cnl` int(11) NOT NULL,
  `zone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_provider` (`id_provider`),
  KEY `cnl` (`cnl`),
  CONSTRAINT `fk_pkg_provider_pkg_provider_cnl` FOREIGN KEY (`id_provider`) REFERENCES `pkg_provider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_provider_cnl`
--

LOCK TABLES `pkg_provider_cnl` WRITE;
/*!40000 ALTER TABLE `pkg_provider_cnl` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_provider_cnl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_queue`
--

DROP TABLE IF EXISTS `pkg_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `language` varchar(5) NOT NULL,
  `musiconhold` varchar(128) DEFAULT NULL,
  `announce` varchar(128) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `announce-frequency` int(11) DEFAULT NULL,
  `announce-round-seconds` int(11) DEFAULT NULL,
  `announce-holdtime` varchar(128) DEFAULT NULL,
  `announce-position` varchar(5) NOT NULL DEFAULT 'yes',
  `retry` int(11) DEFAULT NULL,
  `wrapuptime` int(11) DEFAULT NULL,
  `maxlen` int(11) DEFAULT NULL,
  `servicelevel` int(11) DEFAULT NULL,
  `strategy` varchar(128) DEFAULT NULL,
  `joinempty` varchar(128) DEFAULT NULL,
  `leavewhenempty` varchar(128) DEFAULT NULL,
  `eventmemberstatus` tinyint(1) DEFAULT NULL,
  `eventwhencalled` tinyint(1) DEFAULT NULL,
  `reportholdtime` tinyint(1) DEFAULT NULL,
  `memberdelay` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `timeoutrestart` tinyint(1) DEFAULT NULL,
  `periodic-announce` varchar(200) DEFAULT NULL,
  `periodic-announce-frequency` int(11) DEFAULT NULL,
  `ringinuse` varchar(3) DEFAULT NULL,
  `setinterfacevar` varchar(3) DEFAULT 'yes',
  `setqueuevar` varchar(3) NOT NULL DEFAULT 'yes',
  `setqueueentryvar` varchar(3) NOT NULL DEFAULT 'yes',
  `var_holdtime` int(11) NOT NULL DEFAULT 0,
  `var_talktime` int(11) NOT NULL DEFAULT 0,
  `var_totalCalls` int(11) NOT NULL DEFAULT 0,
  `var_answeredCalls` int(11) NOT NULL DEFAULT 0,
  `ring_or_moh` varchar(4) NOT NULL DEFAULT 'moh',
  `max_wait_time` int(11) DEFAULT NULL,
  `max_wait_time_action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_pkg_user_pkg_queue` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_queue` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_queue`
--

LOCK TABLES `pkg_queue` WRITE;
/*!40000 ALTER TABLE `pkg_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_queue_agent_status`
--

DROP TABLE IF EXISTS `pkg_queue_agent_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_queue_agent_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_queue` int(11) NOT NULL,
  `agentName` varchar(40) DEFAULT NULL,
  `agentStatus` varchar(30) DEFAULT NULL,
  `totalCalls` int(11) NOT NULL DEFAULT 0,
  `last_call` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`agentName`,`id_queue`),
  KEY `id_user` (`id_user`),
  KEY `id_queue` (`id_queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_queue_agent_status`
--

LOCK TABLES `pkg_queue_agent_status` WRITE;
/*!40000 ALTER TABLE `pkg_queue_agent_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_queue_agent_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_queue_member`
--

DROP TABLE IF EXISTS `pkg_queue_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_queue_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniqueid` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `membername` varchar(40) DEFAULT NULL,
  `queue_name` varchar(128) DEFAULT NULL,
  `interface` varchar(128) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `paused` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `queue_interface` (`queue_name`,`interface`),
  KEY `fk_pkg_user_pkg_queue_member` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_queue_member` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_queue_member`
--

LOCK TABLES `pkg_queue_member` WRITE;
/*!40000 ALTER TABLE `pkg_queue_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_queue_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_queue_status`
--

DROP TABLE IF EXISTS `pkg_queue_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_queue_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_queue` int(11) DEFAULT NULL,
  `id_agent` int(11) DEFAULT NULL,
  `callId` varchar(40) NOT NULL,
  `callerId` varchar(60) NOT NULL,
  `status` varchar(30) NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `queue_name` varchar(25) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `channel` varchar(50) NOT NULL,
  `holdtime` varchar(11) DEFAULT '',
  `totalCalls` int(11) DEFAULT NULL,
  `answeredCalls` int(11) DEFAULT NULL,
  `callduration` int(11) DEFAULT NULL,
  `oldtime` int(11) NOT NULL DEFAULT 0,
  `agentName` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `callerId` (`callerId`),
  KEY `status` (`status`),
  KEY `timestamp` (`time`),
  KEY `queue_name` (`queue_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_queue_status`
--

LOCK TABLES `pkg_queue_status` WRITE;
/*!40000 ALTER TABLE `pkg_queue_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_queue_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_rate`
--

DROP TABLE IF EXISTS `pkg_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_plan` int(11) NOT NULL,
  `id_trunk_group` int(11) NOT NULL,
  `id_prefix` int(11) NOT NULL,
  `rateinitial` decimal(15,6) DEFAULT 0.000000,
  `initblock` int(11) NOT NULL DEFAULT 1,
  `billingblock` int(11) NOT NULL DEFAULT 1,
  `connectcharge` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `disconnectcharge` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `additional_grace` varchar(11) NOT NULL DEFAULT '0',
  `minimal_time_charge` int(2) NOT NULL DEFAULT 0,
  `package_offer` smallint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `dialprefix` bigint(20) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_plan_pkg_rate` (`id_plan`),
  KEY `fk_pkg_prefix_pkg_rate` (`id_prefix`),
  KEY `fk_pkg_trunk_pkg_rate` (`id_trunk_group`),
  KEY `dialprefix` (`dialprefix`),
  CONSTRAINT `fk_pkg_plan_pkg_rate` FOREIGN KEY (`id_plan`) REFERENCES `pkg_plan` (`id`),
  CONSTRAINT `fk_pkg_trunk_group_pkg_rate` FOREIGN KEY (`id_trunk_group`) REFERENCES `pkg_trunk_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3022 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_rate`
--

LOCK TABLES `pkg_rate` WRITE;
/*!40000 ALTER TABLE `pkg_rate` DISABLE KEYS */;
INSERT INTO `pkg_rate` VALUES (1,1,4,2,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2,1,4,3,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3,1,4,4,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(4,1,4,5,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(5,1,4,6,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(6,1,4,7,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(7,1,4,8,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(8,1,4,9,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(9,1,4,10,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(10,1,4,11,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(11,1,4,12,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(12,1,4,13,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(13,1,4,14,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(14,1,4,15,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(15,1,4,16,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(16,1,4,17,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(17,1,4,18,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(18,1,4,19,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(19,1,4,20,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(20,1,4,21,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(21,1,4,22,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(22,1,4,23,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(23,1,4,24,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(24,1,4,25,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(25,1,4,26,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(26,1,4,27,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(27,1,4,28,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(28,1,4,29,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(29,1,4,30,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(30,1,4,31,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(31,1,4,32,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(32,1,4,33,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(33,1,4,34,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(34,1,4,35,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(35,1,4,36,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(36,1,4,37,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(37,1,4,38,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(38,1,4,39,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(39,1,4,40,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(40,1,4,41,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(41,1,4,42,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(42,1,4,43,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(43,1,4,44,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(44,1,4,45,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(45,1,4,46,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(46,1,4,47,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(47,1,4,48,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(48,1,4,49,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(49,1,4,50,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(50,1,4,51,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(51,1,4,52,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(52,1,4,53,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(53,1,4,54,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(54,1,4,55,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(55,1,4,56,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(56,1,4,57,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(57,1,4,58,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(58,1,4,59,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(59,1,4,60,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(60,1,4,61,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(61,1,4,62,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(62,1,4,63,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(63,1,4,64,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(64,1,4,65,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(65,1,4,66,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(66,1,4,67,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(67,1,4,68,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(68,1,4,69,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(69,1,4,70,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(70,1,4,71,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(71,1,4,72,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(72,1,4,73,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(73,1,4,74,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(74,1,4,75,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(75,1,4,76,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(76,1,4,77,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(77,1,4,78,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(78,1,4,79,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(79,1,4,80,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(80,1,4,81,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(81,1,4,82,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(82,1,4,83,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(83,1,4,84,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(84,1,4,85,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(85,1,4,86,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(86,1,4,87,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(87,1,4,88,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(88,1,4,89,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(89,1,4,90,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(90,1,4,91,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(91,1,4,92,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(92,1,4,93,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(93,1,4,94,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(94,1,4,95,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(95,1,4,96,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(96,1,4,97,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(97,1,4,98,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(98,1,4,99,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(99,1,4,100,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(100,1,4,101,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(101,1,4,102,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(102,1,4,103,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(103,1,4,104,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(104,1,4,105,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(105,1,4,106,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(106,1,4,107,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(107,1,4,108,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(108,1,4,109,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(109,1,4,110,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(110,1,4,111,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(111,1,4,112,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(112,1,4,113,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(113,1,4,114,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(114,1,4,115,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(115,1,4,116,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(116,1,4,117,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(117,1,4,118,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(118,1,4,119,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(119,1,4,120,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(120,1,4,121,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(121,1,4,122,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(122,1,4,123,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(123,1,4,124,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(124,1,4,125,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(125,1,4,126,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(126,1,4,127,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(127,1,4,128,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(128,1,4,129,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(129,1,4,130,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(130,1,4,131,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(131,1,4,132,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(132,1,4,133,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(133,1,4,134,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(134,1,4,135,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(135,1,4,136,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(136,1,4,137,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(137,1,4,138,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(138,1,4,139,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(139,1,4,140,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(140,1,4,141,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(141,1,4,142,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(142,1,4,143,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(143,1,4,144,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(144,1,4,145,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(145,1,4,146,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(146,1,4,147,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(147,1,4,148,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(148,1,4,149,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(149,1,4,150,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(150,1,4,151,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(151,1,4,152,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(152,1,4,153,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(153,1,4,154,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(154,1,4,155,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(155,1,4,156,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(156,1,4,157,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(157,1,4,158,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(158,1,4,159,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(159,1,4,160,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(160,1,4,161,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(161,1,4,162,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(162,1,4,163,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(163,1,4,164,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(164,1,4,165,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(165,1,4,166,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(166,1,4,167,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(167,1,4,168,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(168,1,4,169,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(169,1,4,170,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(170,1,4,171,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(171,1,4,172,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(172,1,4,173,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(173,1,4,174,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(174,1,4,175,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(175,1,4,176,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(176,1,4,177,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(177,1,4,178,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(178,1,4,179,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(179,1,4,180,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(180,1,4,181,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(181,1,4,182,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(182,1,4,183,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(183,1,4,184,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(184,1,4,185,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(185,1,4,186,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(186,1,4,187,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(187,1,4,188,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(188,1,4,189,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(189,1,4,190,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(190,1,4,191,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(191,1,4,192,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(192,1,4,193,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(193,1,4,194,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(194,1,4,195,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(195,1,4,196,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(196,1,4,197,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(197,1,4,198,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(198,1,4,199,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(199,1,4,200,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(200,1,4,201,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(201,1,4,202,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(202,1,4,203,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(203,1,4,204,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(204,1,4,205,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(205,1,4,206,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(206,1,4,207,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(207,1,4,208,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(208,1,4,209,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(209,1,4,210,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(210,1,4,211,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(211,1,4,212,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(212,1,4,213,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(213,1,4,214,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(214,1,4,215,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(215,1,4,216,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(216,1,4,217,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(217,1,4,218,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(218,1,4,219,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(219,1,4,220,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(220,1,4,221,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(221,1,4,222,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(222,1,4,223,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(223,1,4,224,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(224,1,4,225,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(225,1,4,226,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(226,1,4,227,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(227,1,4,228,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(228,1,4,229,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(229,1,4,230,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(230,1,4,231,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(231,1,4,232,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(232,1,4,233,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(233,1,4,234,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(234,1,4,235,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(235,1,4,236,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(236,1,4,237,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(237,1,4,238,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(238,1,4,239,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(239,1,4,240,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(240,1,4,241,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(241,1,4,242,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(242,1,4,243,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(243,1,4,244,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(244,1,4,245,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(245,1,4,246,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(246,1,4,247,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(247,1,4,248,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(248,1,4,249,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(249,1,4,250,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(250,1,4,251,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(251,1,4,252,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(252,1,4,253,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(253,1,4,254,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(254,1,4,255,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(255,1,4,256,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(256,1,4,257,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(257,1,4,258,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(258,1,4,259,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(259,1,4,260,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(260,1,4,261,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(261,1,4,262,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(262,1,4,263,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(263,1,4,264,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(264,1,4,265,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(265,1,4,266,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(266,1,4,267,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(267,1,4,268,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(268,1,4,269,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(269,1,4,270,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(270,1,4,271,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(271,1,4,272,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(272,1,4,273,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(273,1,4,274,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(274,1,4,275,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(275,1,4,276,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(276,1,4,277,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(277,1,4,278,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(278,1,4,279,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(279,1,4,280,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(280,1,4,281,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(281,1,4,282,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(282,1,4,283,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(283,1,4,284,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(284,1,4,285,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(285,1,4,286,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(286,1,4,287,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(287,1,4,288,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(288,1,4,289,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(289,1,4,290,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(290,1,4,291,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(291,1,4,292,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(292,1,4,293,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(293,1,4,294,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(294,1,4,295,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(295,1,4,296,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(296,1,4,297,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(297,1,4,298,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(298,1,4,299,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(299,1,4,300,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(300,1,4,301,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(301,1,4,302,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(302,1,4,303,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(303,1,4,304,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(304,1,4,305,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(305,1,4,306,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(306,1,4,307,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(307,1,4,308,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(308,1,4,309,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(309,1,4,310,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(310,1,4,311,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(311,1,4,312,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(312,1,4,313,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(313,1,4,314,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(314,1,4,315,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(315,1,4,316,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(316,1,4,317,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(317,1,4,318,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(318,1,4,319,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(319,1,4,320,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(320,1,4,321,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(321,1,4,322,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(322,1,4,323,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(323,1,4,324,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(324,1,4,325,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(325,1,4,326,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(326,1,4,327,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(327,1,4,328,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(328,1,4,329,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(329,1,4,330,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(330,1,4,331,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(331,1,4,332,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(332,1,4,333,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(333,1,4,334,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(334,1,4,335,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(335,1,4,336,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(336,1,4,337,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(337,1,4,338,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(338,1,4,339,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(339,1,4,340,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(340,1,4,341,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(341,1,4,342,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(342,1,4,343,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(343,1,4,344,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(344,1,4,345,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(345,1,4,346,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(346,1,4,347,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(347,1,4,348,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(348,1,4,349,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(349,1,4,350,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(350,1,4,351,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(351,1,4,352,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(352,1,4,353,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(353,1,4,354,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(354,1,4,355,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(355,1,4,356,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(356,1,4,357,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(357,1,4,358,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(358,1,4,359,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(359,1,4,360,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(360,1,4,361,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(361,1,4,362,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(362,1,4,363,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(363,1,4,364,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(364,1,4,365,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(365,1,4,366,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(366,1,4,367,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(367,1,4,368,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(368,1,4,369,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(369,1,4,370,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(370,1,4,371,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(371,1,4,372,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(372,1,4,373,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(373,1,4,374,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(374,1,4,375,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(375,1,4,376,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(376,1,4,377,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(377,1,4,378,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(378,1,4,379,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(379,1,4,380,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(380,1,4,381,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(381,1,4,382,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(382,1,4,383,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(383,1,4,384,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(384,1,4,385,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(385,1,4,386,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(386,1,4,387,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(387,1,4,388,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(388,1,4,389,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(389,1,4,390,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(390,1,4,391,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(391,1,4,392,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(392,1,4,393,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(393,1,4,394,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(394,1,4,395,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(395,1,4,396,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(396,1,4,397,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(397,1,4,398,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(398,1,4,399,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(399,1,4,400,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(400,1,4,401,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(401,1,4,402,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(402,1,4,403,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(403,1,4,404,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(404,1,4,405,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(405,1,4,406,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(406,1,4,407,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(407,1,4,408,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(408,1,4,409,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(409,1,4,410,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(410,1,4,411,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(411,1,4,412,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(412,1,4,413,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(413,1,4,414,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(414,1,4,415,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(415,1,4,416,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(416,1,4,417,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(417,1,4,418,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(418,1,4,419,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(419,1,4,420,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(420,1,4,421,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(421,1,4,422,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(422,1,4,423,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(423,1,4,424,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(424,1,4,425,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(425,1,4,426,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(426,1,4,427,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(427,1,4,428,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(428,1,4,429,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(429,1,4,430,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(430,1,4,431,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(431,1,4,432,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(432,1,4,433,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(433,1,4,434,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(434,1,4,435,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(435,1,4,436,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(436,1,4,437,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(437,1,4,438,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(438,1,4,439,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(439,1,4,440,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(440,1,4,441,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(441,1,4,442,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(442,1,4,443,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(443,1,4,444,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(444,1,4,445,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(445,1,4,446,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(446,1,4,447,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(447,1,4,448,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(448,1,4,449,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(449,1,4,450,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(450,1,4,451,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(451,1,4,452,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(452,1,4,453,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(453,1,4,454,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(454,1,4,455,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(455,1,4,456,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(456,1,4,457,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(457,1,4,458,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(458,1,4,459,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(459,1,4,460,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(460,1,4,461,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(461,1,4,462,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(462,1,4,463,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(463,1,4,464,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(464,1,4,465,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(465,1,4,466,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(466,1,4,467,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(467,1,4,468,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(468,1,4,469,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(469,1,4,470,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(470,1,4,471,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(471,1,4,472,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(472,1,4,473,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(473,1,4,474,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(474,1,4,475,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(475,1,4,476,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(476,1,4,477,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(477,1,4,478,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(478,1,4,479,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(479,1,4,480,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(480,1,4,481,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(481,1,4,482,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(482,1,4,483,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(483,1,4,484,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(484,1,4,485,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(485,1,4,486,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(486,1,4,487,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(487,1,4,488,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(512,2,3,2,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(513,2,3,3,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(514,2,3,4,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(515,2,3,5,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(516,2,3,6,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(517,2,3,7,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(518,2,3,8,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(519,2,3,9,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(520,2,3,10,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(521,2,3,11,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(522,2,3,12,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(523,2,3,13,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(524,2,3,14,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(525,2,3,15,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(526,2,3,16,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(527,2,3,17,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(528,2,3,18,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(529,2,3,19,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(530,2,3,20,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(531,2,3,21,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(532,2,3,22,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(533,2,3,23,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(534,2,3,24,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(535,2,3,25,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(536,2,3,26,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(537,2,3,27,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(538,2,3,28,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(539,2,3,29,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(540,2,3,30,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(541,2,3,31,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(542,2,3,32,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(543,2,3,33,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(544,2,3,34,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(545,2,3,35,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(546,2,3,36,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(547,2,3,37,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(548,2,3,38,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(549,2,3,39,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(550,2,3,40,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(551,2,3,41,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(552,2,3,42,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(553,2,3,43,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(554,2,3,44,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(555,2,3,45,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(556,2,3,46,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(557,2,3,47,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(558,2,3,48,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(559,2,3,49,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(560,2,3,50,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(561,2,3,51,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(562,2,3,52,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(563,2,3,53,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(564,2,3,54,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(565,2,3,55,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(566,2,3,56,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(567,2,3,57,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(568,2,3,58,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(569,2,3,59,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(570,2,3,60,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(571,2,3,61,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(572,2,3,62,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(573,2,3,63,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(574,2,3,64,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(575,2,3,65,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(576,2,3,66,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(577,2,3,67,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(578,2,3,68,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(579,2,3,69,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(580,2,3,70,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(581,2,3,71,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(582,2,3,72,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(583,2,3,73,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(584,2,3,74,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(585,2,3,75,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(586,2,3,76,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(587,2,3,77,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(588,2,3,78,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(589,2,3,79,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(590,2,3,80,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(591,2,3,81,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(592,2,3,82,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(593,2,3,83,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(594,2,3,84,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(595,2,3,85,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(596,2,3,86,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(597,2,3,87,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(598,2,3,88,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(599,2,3,89,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(600,2,3,90,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(601,2,3,91,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(602,2,3,92,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(603,2,3,93,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(604,2,3,94,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(605,2,3,95,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(606,2,3,96,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(607,2,3,97,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(608,2,3,98,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(609,2,3,99,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(610,2,3,100,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(611,2,3,101,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(612,2,3,102,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(613,2,3,103,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(614,2,3,104,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(615,2,3,105,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(616,2,3,106,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(617,2,3,107,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(618,2,3,108,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(619,2,3,109,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(620,2,3,110,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(621,2,3,111,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(622,2,3,112,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(623,2,3,113,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(624,2,3,114,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(625,2,3,115,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(626,2,3,116,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(627,2,3,117,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(628,2,3,118,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(629,2,3,119,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(630,2,3,120,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(631,2,3,121,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(632,2,3,122,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(633,2,3,123,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(634,2,3,124,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(635,2,3,125,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(636,2,3,126,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(637,2,3,127,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(638,2,3,128,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(639,2,3,129,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(640,2,3,130,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(641,2,3,131,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(642,2,3,132,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(643,2,3,133,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(644,2,3,134,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(645,2,3,135,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(646,2,3,136,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(647,2,3,137,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(648,2,3,138,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(649,2,3,139,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(650,2,3,140,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(651,2,3,141,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(652,2,3,142,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(653,2,3,143,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(654,2,3,144,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(655,2,3,145,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(656,2,3,146,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(657,2,3,147,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(658,2,3,148,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(659,2,3,149,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(660,2,3,150,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(661,2,3,151,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(662,2,3,152,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(663,2,3,153,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(664,2,3,154,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(665,2,3,155,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(666,2,3,156,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(667,2,3,157,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(668,2,3,158,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(669,2,3,159,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(670,2,3,160,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(671,2,3,161,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(672,2,3,162,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(673,2,3,163,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(674,2,3,164,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(675,2,3,165,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(676,2,3,166,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(677,2,3,167,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(678,2,3,168,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(679,2,3,169,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(680,2,3,170,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(681,2,3,171,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(682,2,3,172,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(683,2,3,173,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(684,2,3,174,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(685,2,3,175,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(686,2,3,176,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(687,2,3,177,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(688,2,3,178,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(689,2,3,179,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(690,2,3,180,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(691,2,3,181,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(692,2,3,182,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(693,2,3,183,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(694,2,3,184,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(695,2,3,185,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(696,2,3,186,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(697,2,3,187,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(698,2,3,188,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(699,2,3,189,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(700,2,3,190,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(701,2,3,191,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(702,2,3,192,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(703,2,3,193,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(704,2,3,194,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(705,2,3,195,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(706,2,3,196,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(707,2,3,197,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(708,2,3,198,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(709,2,3,199,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(710,2,3,200,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(711,2,3,201,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(712,2,3,202,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(713,2,3,203,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(714,2,3,204,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(715,2,3,205,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(716,2,3,206,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(717,2,3,207,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(718,2,3,208,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(719,2,3,209,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(720,2,3,210,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(721,2,3,211,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(722,2,3,212,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(723,2,3,213,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(724,2,3,214,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(725,2,3,215,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(726,2,3,216,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(727,2,3,217,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(728,2,3,218,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(729,2,3,219,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(730,2,3,220,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(731,2,3,221,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(732,2,3,222,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(733,2,3,223,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(734,2,3,224,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(735,2,3,225,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(736,2,3,226,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(737,2,3,227,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(738,2,3,228,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(739,2,3,229,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(740,2,3,230,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(741,2,3,231,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(742,2,3,232,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(743,2,3,233,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(744,2,3,234,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(745,2,3,235,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(746,2,3,236,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(747,2,3,237,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(748,2,3,238,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(749,2,3,239,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(750,2,3,240,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(751,2,3,241,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(752,2,3,242,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(753,2,3,243,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(754,2,3,244,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(755,2,3,245,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(756,2,3,246,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(757,2,3,247,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(758,2,3,248,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(759,2,3,249,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(760,2,3,250,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(761,2,3,251,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(762,2,3,252,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(763,2,3,253,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(764,2,3,254,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(765,2,3,255,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(766,2,3,256,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(767,2,3,257,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(768,2,3,258,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(769,2,3,259,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(770,2,3,260,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(771,2,3,261,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(772,2,3,262,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(773,2,3,263,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(774,2,3,264,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(775,2,3,265,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(776,2,3,266,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(777,2,3,267,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(778,2,3,268,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(779,2,3,269,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(780,2,3,270,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(781,2,3,271,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(782,2,3,272,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(783,2,3,273,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(784,2,3,274,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(785,2,3,275,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(786,2,3,276,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(787,2,3,277,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(788,2,3,278,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(789,2,3,279,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(790,2,3,280,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(791,2,3,281,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(792,2,3,282,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(793,2,3,283,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(794,2,3,284,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(795,2,3,285,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(796,2,3,286,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(797,2,3,287,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(798,2,3,288,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(799,2,3,289,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(800,2,3,290,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(801,2,3,291,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(802,2,3,292,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(803,2,3,293,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(804,2,3,294,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(805,2,3,295,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(806,2,3,296,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(807,2,3,297,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(808,2,3,298,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(809,2,3,299,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(810,2,3,300,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(811,2,3,301,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(812,2,3,302,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(813,2,3,303,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(814,2,3,304,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(815,2,3,305,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(816,2,3,306,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(817,2,3,307,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(818,2,3,308,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(819,2,3,309,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(820,2,3,310,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(821,2,3,311,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(822,2,3,312,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(823,2,3,313,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(824,2,3,314,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(825,2,3,315,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(826,2,3,316,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(827,2,3,317,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(828,2,3,318,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(829,2,3,319,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(830,2,3,320,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(831,2,3,321,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(832,2,3,322,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(833,2,3,323,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(834,2,3,324,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(835,2,3,325,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(836,2,3,326,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(837,2,3,327,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(838,2,3,328,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(839,2,3,329,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(840,2,3,330,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(841,2,3,331,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(842,2,3,332,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(843,2,3,333,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(844,2,3,334,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(845,2,3,335,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(846,2,3,336,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(847,2,3,337,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(848,2,3,338,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(849,2,3,339,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(850,2,3,340,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(851,2,3,341,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(852,2,3,342,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(853,2,3,343,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(854,2,3,344,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(855,2,3,345,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(856,2,3,346,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(857,2,3,347,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(858,2,3,348,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(859,2,3,349,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(860,2,3,350,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(861,2,3,351,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(862,2,3,352,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(863,2,3,353,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(864,2,3,354,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(865,2,3,355,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(866,2,3,356,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(867,2,3,357,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(868,2,3,358,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(869,2,3,359,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(870,2,3,360,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(871,2,3,361,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(872,2,3,362,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(873,2,3,363,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(874,2,3,364,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(875,2,3,365,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(876,2,3,366,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(877,2,3,367,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(878,2,3,368,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(879,2,3,369,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(880,2,3,370,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(881,2,3,371,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(882,2,3,372,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(883,2,3,373,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(884,2,3,374,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(885,2,3,375,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(886,2,3,376,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(887,2,3,377,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(888,2,3,378,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(889,2,3,379,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(890,2,3,380,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(891,2,3,381,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(892,2,3,382,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(893,2,3,383,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(894,2,3,384,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(895,2,3,385,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(896,2,3,386,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(897,2,3,387,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(898,2,3,388,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(899,2,3,389,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(900,2,3,390,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(901,2,3,391,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(902,2,3,392,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(903,2,3,393,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(904,2,3,394,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(905,2,3,395,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(906,2,3,396,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(907,2,3,397,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(908,2,3,398,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(909,2,3,399,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(910,2,3,400,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(911,2,3,401,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(912,2,3,402,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(913,2,3,403,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(914,2,3,404,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(915,2,3,405,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(916,2,3,406,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(917,2,3,407,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(918,2,3,408,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(919,2,3,409,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(920,2,3,410,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(921,2,3,411,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(922,2,3,412,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(923,2,3,413,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(924,2,3,414,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(925,2,3,415,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(926,2,3,416,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(927,2,3,417,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(928,2,3,418,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(929,2,3,419,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(930,2,3,420,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(931,2,3,421,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(932,2,3,422,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(933,2,3,423,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(934,2,3,424,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(935,2,3,425,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(936,2,3,426,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(937,2,3,427,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(938,2,3,428,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(939,2,3,429,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(940,2,3,430,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(941,2,3,431,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(942,2,3,432,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(943,2,3,433,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(944,2,3,434,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(945,2,3,435,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(946,2,3,436,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(947,2,3,437,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(948,2,3,438,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(949,2,3,439,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(950,2,3,440,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(951,2,3,441,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(952,2,3,442,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(953,2,3,443,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(954,2,3,444,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(955,2,3,445,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(956,2,3,446,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(957,2,3,447,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(958,2,3,448,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(959,2,3,449,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(960,2,3,450,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(961,2,3,451,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(962,2,3,452,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(963,2,3,453,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(964,2,3,454,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(965,2,3,455,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(966,2,3,456,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(967,2,3,457,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(968,2,3,458,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(969,2,3,459,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(970,2,3,460,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(971,2,3,461,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(972,2,3,462,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(973,2,3,463,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(974,2,3,464,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(975,2,3,465,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(976,2,3,466,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(977,2,3,467,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(978,2,3,468,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(979,2,3,469,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(980,2,3,470,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(981,2,3,471,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(982,2,3,472,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(983,2,3,473,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(984,2,3,474,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(985,2,3,475,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(986,2,3,476,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(987,2,3,477,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(988,2,3,478,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(989,2,3,479,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(990,2,3,480,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(991,2,3,481,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(992,2,3,482,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(993,2,3,483,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(994,2,3,484,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(995,2,3,485,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(996,2,3,486,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(997,2,3,487,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(998,2,3,488,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1023,3,2,2,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1024,3,2,3,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1025,3,2,4,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1026,3,2,5,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1027,3,2,6,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1028,3,2,7,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1029,3,2,8,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1030,3,2,9,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1031,3,2,10,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1032,3,2,11,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1033,3,2,12,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1034,3,2,13,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1035,3,2,14,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1036,3,2,15,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1037,3,2,16,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1038,3,2,17,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1039,3,2,18,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1040,3,2,19,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1041,3,2,20,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1042,3,2,21,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1043,3,2,22,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1044,3,2,23,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1045,3,2,24,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1046,3,2,25,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1047,3,2,26,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1048,3,2,27,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1049,3,2,28,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1050,3,2,29,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1051,3,2,30,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1052,3,2,31,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1053,3,2,32,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1054,3,2,33,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1055,3,2,34,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1056,3,2,35,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1057,3,2,36,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1058,3,2,37,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1059,3,2,38,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1060,3,2,39,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1061,3,2,40,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1062,3,2,41,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1063,3,2,42,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1064,3,2,43,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1065,3,2,44,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1066,3,2,45,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1067,3,2,46,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1068,3,2,47,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1069,3,2,48,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1070,3,2,49,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1071,3,2,50,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1072,3,2,51,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1073,3,2,52,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1074,3,2,53,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1075,3,2,54,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1076,3,2,55,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1077,3,2,56,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1078,3,2,57,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1079,3,2,58,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1080,3,2,59,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1081,3,2,60,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1082,3,2,61,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1083,3,2,62,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1084,3,2,63,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1085,3,2,64,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1086,3,2,65,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1087,3,2,66,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1088,3,2,67,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1089,3,2,68,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1090,3,2,69,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1091,3,2,70,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1092,3,2,71,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1093,3,2,72,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1094,3,2,73,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1095,3,2,74,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1096,3,2,75,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1097,3,2,76,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1098,3,2,77,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1099,3,2,78,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1100,3,2,79,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1101,3,2,80,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1102,3,2,81,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1103,3,2,82,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1104,3,2,83,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1105,3,2,84,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1106,3,2,85,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1107,3,2,86,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1108,3,2,87,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1109,3,2,88,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1110,3,2,89,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1111,3,2,90,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1112,3,2,91,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1113,3,2,92,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1114,3,2,93,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1115,3,2,94,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1116,3,2,95,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1117,3,2,96,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1118,3,2,97,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1119,3,2,98,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1120,3,2,99,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1121,3,2,100,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1122,3,2,101,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1123,3,2,102,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1124,3,2,103,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1125,3,2,104,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1126,3,2,105,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1127,3,2,106,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1128,3,2,107,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1129,3,2,108,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1130,3,2,109,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1131,3,2,110,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1132,3,2,111,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1133,3,2,112,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1134,3,2,113,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1135,3,2,114,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1136,3,2,115,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1137,3,2,116,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1138,3,2,117,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1139,3,2,118,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1140,3,2,119,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1141,3,2,120,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1142,3,2,121,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1143,3,2,122,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1144,3,2,123,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1145,3,2,124,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1146,3,2,125,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1147,3,2,126,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1148,3,2,127,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1149,3,2,128,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1150,3,2,129,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1151,3,2,130,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1152,3,2,131,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1153,3,2,132,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1154,3,2,133,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1155,3,2,134,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1156,3,2,135,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1157,3,2,136,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1158,3,2,137,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1159,3,2,138,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1160,3,2,139,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1161,3,2,140,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1162,3,2,141,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1163,3,2,142,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1164,3,2,143,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1165,3,2,144,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1166,3,2,145,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1167,3,2,146,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1168,3,2,147,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1169,3,2,148,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1170,3,2,149,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1171,3,2,150,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1172,3,2,151,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1173,3,2,152,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1174,3,2,153,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1175,3,2,154,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1176,3,2,155,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1177,3,2,156,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1178,3,2,157,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1179,3,2,158,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1180,3,2,159,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1181,3,2,160,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1182,3,2,161,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1183,3,2,162,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1184,3,2,163,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1185,3,2,164,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1186,3,2,165,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1187,3,2,166,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1188,3,2,167,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1189,3,2,168,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1190,3,2,169,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1191,3,2,170,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1192,3,2,171,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1193,3,2,172,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1194,3,2,173,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1195,3,2,174,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1196,3,2,175,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1197,3,2,176,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1198,3,2,177,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1199,3,2,178,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1200,3,2,179,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1201,3,2,180,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1202,3,2,181,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1203,3,2,182,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1204,3,2,183,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1205,3,2,184,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1206,3,2,185,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1207,3,2,186,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1208,3,2,187,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1209,3,2,188,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1210,3,2,189,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1211,3,2,190,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1212,3,2,191,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1213,3,2,192,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1214,3,2,193,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1215,3,2,194,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1216,3,2,195,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1217,3,2,196,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1218,3,2,197,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1219,3,2,198,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1220,3,2,199,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1221,3,2,200,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1222,3,2,201,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1223,3,2,202,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1224,3,2,203,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1225,3,2,204,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1226,3,2,205,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1227,3,2,206,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1228,3,2,207,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1229,3,2,208,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1230,3,2,209,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1231,3,2,210,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1232,3,2,211,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1233,3,2,212,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1234,3,2,213,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1235,3,2,214,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1236,3,2,215,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1237,3,2,216,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1238,3,2,217,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1239,3,2,218,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1240,3,2,219,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1241,3,2,220,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1242,3,2,221,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1243,3,2,222,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1244,3,2,223,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1245,3,2,224,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1246,3,2,225,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1247,3,2,226,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1248,3,2,227,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1249,3,2,228,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1250,3,2,229,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1251,3,2,230,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1252,3,2,231,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1253,3,2,232,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1254,3,2,233,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1255,3,2,234,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1256,3,2,235,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1257,3,2,236,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1258,3,2,237,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1259,3,2,238,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1260,3,2,239,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1261,3,2,240,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1262,3,2,241,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1263,3,2,242,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1264,3,2,243,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1265,3,2,244,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1266,3,2,245,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1267,3,2,246,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1268,3,2,247,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1269,3,2,248,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1270,3,2,249,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1271,3,2,250,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1272,3,2,251,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1273,3,2,252,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1274,3,2,253,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1275,3,2,254,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1276,3,2,255,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1277,3,2,256,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1278,3,2,257,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1279,3,2,258,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1280,3,2,259,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1281,3,2,260,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1282,3,2,261,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1283,3,2,262,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1284,3,2,263,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1285,3,2,264,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1286,3,2,265,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1287,3,2,266,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1288,3,2,267,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1289,3,2,268,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1290,3,2,269,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1291,3,2,270,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1292,3,2,271,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1293,3,2,272,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1294,3,2,273,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1295,3,2,274,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1296,3,2,275,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1297,3,2,276,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1298,3,2,277,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1299,3,2,278,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1300,3,2,279,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1301,3,2,280,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1302,3,2,281,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1303,3,2,282,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1304,3,2,283,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1305,3,2,284,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1306,3,2,285,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1307,3,2,286,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1308,3,2,287,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1309,3,2,288,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1310,3,2,289,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1311,3,2,290,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1312,3,2,291,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1313,3,2,292,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1314,3,2,293,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1315,3,2,294,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1316,3,2,295,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1317,3,2,296,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1318,3,2,297,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1319,3,2,298,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1320,3,2,299,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1321,3,2,300,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1322,3,2,301,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1323,3,2,302,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1324,3,2,303,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1325,3,2,304,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1326,3,2,305,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1327,3,2,306,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1328,3,2,307,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1329,3,2,308,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1330,3,2,309,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1331,3,2,310,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1332,3,2,311,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1333,3,2,312,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1334,3,2,313,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1335,3,2,314,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1336,3,2,315,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1337,3,2,316,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1338,3,2,317,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1339,3,2,318,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1340,3,2,319,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1341,3,2,320,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1342,3,2,321,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1343,3,2,322,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1344,3,2,323,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1345,3,2,324,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1346,3,2,325,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1347,3,2,326,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1348,3,2,327,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1349,3,2,328,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1350,3,2,329,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1351,3,2,330,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1352,3,2,331,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1353,3,2,332,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1354,3,2,333,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1355,3,2,334,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1356,3,2,335,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1357,3,2,336,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1358,3,2,337,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1359,3,2,338,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1360,3,2,339,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1361,3,2,340,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1362,3,2,341,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1363,3,2,342,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1364,3,2,343,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1365,3,2,344,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1366,3,2,345,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1367,3,2,346,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1368,3,2,347,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1369,3,2,348,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1370,3,2,349,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1371,3,2,350,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1372,3,2,351,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1373,3,2,352,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1374,3,2,353,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1375,3,2,354,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1376,3,2,355,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1377,3,2,356,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1378,3,2,357,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1379,3,2,358,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1380,3,2,359,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1381,3,2,360,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1382,3,2,361,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1383,3,2,362,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1384,3,2,363,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1385,3,2,364,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1386,3,2,365,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1387,3,2,366,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1388,3,2,367,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1389,3,2,368,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1390,3,2,369,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1391,3,2,370,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1392,3,2,371,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1393,3,2,372,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1394,3,2,373,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1395,3,2,374,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1396,3,2,375,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1397,3,2,376,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1398,3,2,377,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1399,3,2,378,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1400,3,2,379,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1401,3,2,380,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1402,3,2,381,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1403,3,2,382,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1404,3,2,383,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1405,3,2,384,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1406,3,2,385,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1407,3,2,386,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1408,3,2,387,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1409,3,2,388,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1410,3,2,389,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1411,3,2,390,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1412,3,2,391,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1413,3,2,392,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1414,3,2,393,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1415,3,2,394,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1416,3,2,395,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1417,3,2,396,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1418,3,2,397,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1419,3,2,398,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1420,3,2,399,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1421,3,2,400,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1422,3,2,401,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1423,3,2,402,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1424,3,2,403,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1425,3,2,404,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1426,3,2,405,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1427,3,2,406,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1428,3,2,407,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1429,3,2,408,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1430,3,2,409,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1431,3,2,410,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1432,3,2,411,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1433,3,2,412,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1434,3,2,413,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1435,3,2,414,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1436,3,2,415,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1437,3,2,416,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1438,3,2,417,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1439,3,2,418,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1440,3,2,419,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1441,3,2,420,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1442,3,2,421,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1443,3,2,422,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1444,3,2,423,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1445,3,2,424,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1446,3,2,425,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1447,3,2,426,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1448,3,2,427,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1449,3,2,428,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1450,3,2,429,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1451,3,2,430,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1452,3,2,431,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1453,3,2,432,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1454,3,2,433,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1455,3,2,434,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1456,3,2,435,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1457,3,2,436,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1458,3,2,437,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1459,3,2,438,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1460,3,2,439,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1461,3,2,440,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1462,3,2,441,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1463,3,2,442,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1464,3,2,443,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1465,3,2,444,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1466,3,2,445,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1467,3,2,446,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1468,3,2,447,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1469,3,2,448,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1470,3,2,449,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1471,3,2,450,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1472,3,2,451,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1473,3,2,452,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1474,3,2,453,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1475,3,2,454,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1476,3,2,455,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1477,3,2,456,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1478,3,2,457,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1479,3,2,458,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1480,3,2,459,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1481,3,2,460,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1482,3,2,461,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1483,3,2,462,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1484,3,2,463,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1485,3,2,464,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1486,3,2,465,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1487,3,2,466,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1488,3,2,467,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1489,3,2,468,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1490,3,2,469,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1491,3,2,470,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1492,3,2,471,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1493,3,2,472,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1494,3,2,473,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1495,3,2,474,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1496,3,2,475,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1497,3,2,476,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1498,3,2,477,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1499,3,2,478,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1500,3,2,479,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1501,3,2,480,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1502,3,2,481,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1503,3,2,482,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1504,3,2,483,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1505,3,2,484,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1506,3,2,485,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1507,3,2,486,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1508,3,2,487,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1509,3,2,488,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1534,4,1,2,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1535,4,1,3,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1536,4,1,4,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1537,4,1,5,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1538,4,1,6,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1539,4,1,7,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1540,4,1,8,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1541,4,1,9,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1542,4,1,10,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1543,4,1,11,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1544,4,1,12,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1545,4,1,13,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1546,4,1,14,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1547,4,1,15,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1548,4,1,16,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1549,4,1,17,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1550,4,1,18,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1551,4,1,19,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1552,4,1,20,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1553,4,1,21,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1554,4,1,22,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1555,4,1,23,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1556,4,1,24,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1557,4,1,25,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1558,4,1,26,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1559,4,1,27,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1560,4,1,28,1.550000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1561,4,1,29,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1562,4,1,30,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1563,4,1,31,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1564,4,1,32,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1565,4,1,33,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1566,4,1,34,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1567,4,1,35,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1568,4,1,36,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1569,4,1,37,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1570,4,1,38,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1571,4,1,39,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1572,4,1,40,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1573,4,1,41,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1574,4,1,42,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1575,4,1,43,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1576,4,1,44,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1577,4,1,45,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1578,4,1,46,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1579,4,1,47,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1580,4,1,48,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1581,4,1,49,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1582,4,1,50,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1583,4,1,51,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1584,4,1,52,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1585,4,1,53,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1586,4,1,54,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1587,4,1,55,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1588,4,1,56,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1589,4,1,57,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1590,4,1,58,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1591,4,1,59,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1592,4,1,60,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1593,4,1,61,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1594,4,1,62,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1595,4,1,63,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1596,4,1,64,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1597,4,1,65,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1598,4,1,66,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1599,4,1,67,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1600,4,1,68,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1601,4,1,69,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1602,4,1,70,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1603,4,1,71,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1604,4,1,72,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1605,4,1,73,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1606,4,1,74,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1607,4,1,75,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1608,4,1,76,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1609,4,1,77,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1610,4,1,78,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1611,4,1,79,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1612,4,1,80,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1613,4,1,81,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1614,4,1,82,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1615,4,1,83,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1616,4,1,84,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1617,4,1,85,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1618,4,1,86,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1619,4,1,87,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1620,4,1,88,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1621,4,1,89,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1622,4,1,90,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1623,4,1,91,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1624,4,1,92,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1625,4,1,93,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1626,4,1,94,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1627,4,1,95,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1628,4,1,96,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1629,4,1,97,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1630,4,1,98,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1631,4,1,99,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1632,4,1,100,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1633,4,1,101,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1634,4,1,102,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1635,4,1,103,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1636,4,1,104,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1637,4,1,105,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1638,4,1,106,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1639,4,1,107,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1640,4,1,108,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1641,4,1,109,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1642,4,1,110,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1643,4,1,111,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1644,4,1,112,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1645,4,1,113,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1646,4,1,114,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1647,4,1,115,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1648,4,1,116,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1649,4,1,117,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1650,4,1,118,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1651,4,1,119,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1652,4,1,120,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1653,4,1,121,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1654,4,1,122,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1655,4,1,123,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1656,4,1,124,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1657,4,1,125,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1658,4,1,126,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1659,4,1,127,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1660,4,1,128,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1661,4,1,129,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1662,4,1,130,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1663,4,1,131,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1664,4,1,132,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1665,4,1,133,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1666,4,1,134,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1667,4,1,135,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1668,4,1,136,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1669,4,1,137,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1670,4,1,138,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1671,4,1,139,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1672,4,1,140,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1673,4,1,141,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1674,4,1,142,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1675,4,1,143,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1676,4,1,144,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1677,4,1,145,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1678,4,1,146,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1679,4,1,147,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1680,4,1,148,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1681,4,1,149,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1682,4,1,150,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1683,4,1,151,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1684,4,1,152,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1685,4,1,153,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1686,4,1,154,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1687,4,1,155,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1688,4,1,156,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1689,4,1,157,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1690,4,1,158,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1691,4,1,159,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1692,4,1,160,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1693,4,1,161,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1694,4,1,162,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1695,4,1,163,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1696,4,1,164,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1697,4,1,165,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1698,4,1,166,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1699,4,1,167,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1700,4,1,168,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1701,4,1,169,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1702,4,1,170,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1703,4,1,171,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1704,4,1,172,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1705,4,1,173,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1706,4,1,174,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1707,4,1,175,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1708,4,1,176,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1709,4,1,177,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1710,4,1,178,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1711,4,1,179,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1712,4,1,180,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1713,4,1,181,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1714,4,1,182,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1715,4,1,183,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1716,4,1,184,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1717,4,1,185,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1718,4,1,186,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1719,4,1,187,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1720,4,1,188,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1721,4,1,189,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1722,4,1,190,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1723,4,1,191,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1724,4,1,192,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1725,4,1,193,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1726,4,1,194,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1727,4,1,195,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1728,4,1,196,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1729,4,1,197,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1730,4,1,198,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1731,4,1,199,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1732,4,1,200,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1733,4,1,201,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1734,4,1,202,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1735,4,1,203,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1736,4,1,204,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1737,4,1,205,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1738,4,1,206,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1739,4,1,207,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1740,4,1,208,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1741,4,1,209,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1742,4,1,210,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1743,4,1,211,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1744,4,1,212,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1745,4,1,213,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1746,4,1,214,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1747,4,1,215,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1748,4,1,216,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1749,4,1,217,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1750,4,1,218,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1751,4,1,219,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1752,4,1,220,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1753,4,1,221,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1754,4,1,222,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1755,4,1,223,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1756,4,1,224,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1757,4,1,225,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1758,4,1,226,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1759,4,1,227,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1760,4,1,228,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1761,4,1,229,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1762,4,1,230,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1763,4,1,231,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1764,4,1,232,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1765,4,1,233,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1766,4,1,234,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1767,4,1,235,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1768,4,1,236,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1769,4,1,237,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1770,4,1,238,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1771,4,1,239,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1772,4,1,240,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1773,4,1,241,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1774,4,1,242,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1775,4,1,243,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1776,4,1,244,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1777,4,1,245,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1778,4,1,246,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1779,4,1,247,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1780,4,1,248,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1781,4,1,249,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1782,4,1,250,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1783,4,1,251,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1784,4,1,252,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1785,4,1,253,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1786,4,1,254,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1787,4,1,255,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1788,4,1,256,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1789,4,1,257,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1790,4,1,258,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1791,4,1,259,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1792,4,1,260,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1793,4,1,261,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1794,4,1,262,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1795,4,1,263,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1796,4,1,264,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1797,4,1,265,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1798,4,1,266,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1799,4,1,267,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1800,4,1,268,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1801,4,1,269,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1802,4,1,270,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1803,4,1,271,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1804,4,1,272,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1805,4,1,273,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1806,4,1,274,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1807,4,1,275,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1808,4,1,276,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1809,4,1,277,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1810,4,1,278,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1811,4,1,279,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1812,4,1,280,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1813,4,1,281,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1814,4,1,282,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1815,4,1,283,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1816,4,1,284,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1817,4,1,285,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1818,4,1,286,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1819,4,1,287,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1820,4,1,288,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1821,4,1,289,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1822,4,1,290,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1823,4,1,291,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1824,4,1,292,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1825,4,1,293,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1826,4,1,294,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1827,4,1,295,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1828,4,1,296,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1829,4,1,297,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1830,4,1,298,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1831,4,1,299,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1832,4,1,300,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1833,4,1,301,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1834,4,1,302,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1835,4,1,303,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1836,4,1,304,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1837,4,1,305,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1838,4,1,306,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1839,4,1,307,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1840,4,1,308,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1841,4,1,309,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1842,4,1,310,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1843,4,1,311,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1844,4,1,312,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1845,4,1,313,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1846,4,1,314,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1847,4,1,315,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1848,4,1,316,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1849,4,1,317,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1850,4,1,318,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1851,4,1,319,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1852,4,1,320,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1853,4,1,321,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1854,4,1,322,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1855,4,1,323,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1856,4,1,324,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1857,4,1,325,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1858,4,1,326,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1859,4,1,327,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1860,4,1,328,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1861,4,1,329,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1862,4,1,330,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1863,4,1,331,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1864,4,1,332,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1865,4,1,333,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1866,4,1,334,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1867,4,1,335,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1868,4,1,336,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1869,4,1,337,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1870,4,1,338,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1871,4,1,339,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1872,4,1,340,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1873,4,1,341,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1874,4,1,342,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1875,4,1,343,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1876,4,1,344,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1877,4,1,345,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1878,4,1,346,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1879,4,1,347,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1880,4,1,348,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1881,4,1,349,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1882,4,1,350,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1883,4,1,351,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1884,4,1,352,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1885,4,1,353,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1886,4,1,354,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1887,4,1,355,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1888,4,1,356,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1889,4,1,357,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1890,4,1,358,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1891,4,1,359,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1892,4,1,360,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1893,4,1,361,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1894,4,1,362,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1895,4,1,363,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1896,4,1,364,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1897,4,1,365,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1898,4,1,366,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1899,4,1,367,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1900,4,1,368,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1901,4,1,369,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1902,4,1,370,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1903,4,1,371,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1904,4,1,372,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1905,4,1,373,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1906,4,1,374,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1907,4,1,375,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1908,4,1,376,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1909,4,1,377,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1910,4,1,378,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1911,4,1,379,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1912,4,1,380,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1913,4,1,381,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1914,4,1,382,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1915,4,1,383,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1916,4,1,384,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1917,4,1,385,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1918,4,1,386,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1919,4,1,387,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1920,4,1,388,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1921,4,1,389,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1922,4,1,390,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1923,4,1,391,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1924,4,1,392,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1925,4,1,393,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1926,4,1,394,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1927,4,1,395,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1928,4,1,396,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1929,4,1,397,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1930,4,1,398,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1931,4,1,399,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1932,4,1,400,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1933,4,1,401,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1934,4,1,402,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1935,4,1,403,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1936,4,1,404,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1937,4,1,405,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1938,4,1,406,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1939,4,1,407,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1940,4,1,408,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1941,4,1,409,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1942,4,1,410,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1943,4,1,411,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1944,4,1,412,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1945,4,1,413,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1946,4,1,414,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1947,4,1,415,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1948,4,1,416,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1949,4,1,417,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1950,4,1,418,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1951,4,1,419,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1952,4,1,420,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1953,4,1,421,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1954,4,1,422,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1955,4,1,423,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1956,4,1,424,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1957,4,1,425,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1958,4,1,426,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1959,4,1,427,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1960,4,1,428,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1961,4,1,429,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1962,4,1,430,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1963,4,1,431,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1964,4,1,432,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1965,4,1,433,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1966,4,1,434,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1967,4,1,435,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1968,4,1,436,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1969,4,1,437,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1970,4,1,438,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1971,4,1,439,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1972,4,1,440,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1973,4,1,441,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1974,4,1,442,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1975,4,1,443,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1976,4,1,444,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1977,4,1,445,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1978,4,1,446,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1979,4,1,447,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1980,4,1,448,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1981,4,1,449,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1982,4,1,450,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1983,4,1,451,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1984,4,1,452,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1985,4,1,453,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1986,4,1,454,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1987,4,1,455,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1988,4,1,456,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1989,4,1,457,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1990,4,1,458,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1991,4,1,459,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1992,4,1,460,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1993,4,1,461,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1994,4,1,462,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1995,4,1,463,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1996,4,1,464,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1997,4,1,465,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1998,4,1,466,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(1999,4,1,467,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2000,4,1,468,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2001,4,1,469,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2002,4,1,470,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2003,4,1,471,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2004,4,1,472,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2005,4,1,473,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2006,4,1,474,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2007,4,1,475,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2008,4,1,476,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2009,4,1,477,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2010,4,1,478,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2011,4,1,479,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2012,4,1,480,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2013,4,1,481,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2014,4,1,482,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2015,4,1,483,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2016,4,1,484,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2017,4,1,485,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2018,4,1,486,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2019,4,1,487,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2020,4,1,488,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2045,3,2,489,0.450000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2046,1,4,490,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2047,1,4,491,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2048,1,4,492,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2049,1,4,493,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2050,1,4,494,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2051,1,4,495,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2052,1,4,496,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2053,1,4,497,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2054,1,4,498,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2055,1,4,499,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2056,1,4,500,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2057,1,4,501,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2058,1,4,502,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2059,1,4,503,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2060,1,4,504,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2061,1,4,505,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2062,1,4,506,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2063,1,4,507,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2064,1,4,508,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2065,1,4,509,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2066,1,4,510,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2067,1,4,511,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2068,1,4,512,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2069,1,4,513,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2070,1,4,514,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2071,1,4,515,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2072,1,4,516,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2073,1,4,517,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2074,1,4,518,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2075,1,4,519,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2076,1,4,520,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2077,1,4,521,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2078,1,4,522,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2079,1,4,523,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2080,1,4,524,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2081,1,4,525,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2082,1,4,526,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2083,1,4,527,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2084,1,4,528,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2085,1,4,529,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2086,1,4,530,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2087,1,4,531,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2088,1,4,532,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2089,1,4,533,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2090,1,4,534,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2091,1,4,535,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2092,1,4,536,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2093,1,4,537,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2094,1,4,538,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2095,1,4,539,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2096,1,4,540,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2097,1,4,541,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2098,1,4,542,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2099,1,4,543,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2100,1,4,544,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2101,1,4,545,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2102,1,4,546,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2103,1,4,547,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2104,1,4,548,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2105,1,4,549,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2106,1,4,550,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2107,1,4,551,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2108,1,4,552,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2109,1,4,553,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2110,1,4,554,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2111,1,4,555,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2112,1,4,556,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2113,1,4,557,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2114,1,4,558,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2115,1,4,559,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2116,1,4,560,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2117,1,4,561,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2118,1,4,562,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2173,2,3,490,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2174,2,3,491,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2175,2,3,492,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2176,2,3,493,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2177,2,3,494,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2178,2,3,495,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2179,2,3,496,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2180,2,3,497,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2181,2,3,498,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2182,2,3,499,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2183,2,3,500,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2184,2,3,501,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2185,2,3,502,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2186,2,3,503,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2187,2,3,504,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2188,2,3,505,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2189,2,3,506,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2190,2,3,507,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2191,2,3,508,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2192,2,3,509,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2193,2,3,510,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2194,2,3,511,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2195,2,3,512,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2196,2,3,513,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2197,2,3,514,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2198,2,3,515,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2199,2,3,516,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2200,2,3,517,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2201,2,3,518,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2202,2,3,519,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2203,2,3,520,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2204,2,3,521,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2205,2,3,522,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2206,2,3,523,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2207,2,3,524,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2208,2,3,525,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2209,2,3,526,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2210,2,3,527,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2211,2,3,528,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2212,2,3,529,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2213,2,3,530,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2214,2,3,531,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2215,2,3,532,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2216,2,3,533,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2217,2,3,534,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2218,2,3,535,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2219,2,3,536,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2220,2,3,537,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2221,2,3,538,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2222,2,3,539,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2223,2,3,540,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2224,2,3,541,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2225,2,3,542,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2226,2,3,543,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2227,2,3,544,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2228,2,3,545,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2229,2,3,546,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2230,2,3,547,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2231,2,3,548,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2232,2,3,549,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2233,2,3,550,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2234,2,3,551,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2235,2,3,552,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2236,2,3,553,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2237,2,3,554,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2238,2,3,555,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2239,2,3,556,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2240,2,3,557,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2241,2,3,558,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2242,2,3,559,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2243,2,3,560,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2244,2,3,561,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2245,2,3,562,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2300,3,2,490,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2301,3,2,491,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2302,3,2,492,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2303,3,2,493,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2304,3,2,494,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2305,3,2,495,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2306,3,2,496,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2307,3,2,497,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2308,3,2,498,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2309,3,2,499,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2310,3,2,500,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2311,3,2,501,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2312,3,2,502,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2313,3,2,503,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2314,3,2,504,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2315,3,2,505,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2316,3,2,506,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2317,3,2,507,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2318,3,2,508,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2319,3,2,509,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2320,3,2,510,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2321,3,2,511,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2322,3,2,512,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2323,3,2,513,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2324,3,2,514,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2325,3,2,515,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2326,3,2,516,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2327,3,2,517,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2328,3,2,518,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2329,3,2,519,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2330,3,2,520,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2331,3,2,521,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2332,3,2,522,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2333,3,2,523,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2334,3,2,524,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2335,3,2,525,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2336,3,2,526,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2337,3,2,527,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2338,3,2,528,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2339,3,2,529,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2340,3,2,530,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2341,3,2,531,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2342,3,2,532,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2343,3,2,533,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2344,3,2,534,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2345,3,2,535,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2346,3,2,536,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2347,3,2,537,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2348,3,2,538,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2349,3,2,539,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2350,3,2,540,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2351,3,2,541,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2352,3,2,542,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2353,3,2,543,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2354,3,2,544,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2355,3,2,545,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2356,3,2,546,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2357,3,2,547,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2358,3,2,548,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2359,3,2,549,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2360,3,2,550,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2361,3,2,551,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2362,3,2,552,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2363,3,2,553,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2364,3,2,554,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2365,3,2,555,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2366,3,2,556,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2367,3,2,557,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2368,3,2,558,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2369,3,2,559,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2370,3,2,560,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2371,3,2,561,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2372,3,2,562,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2427,4,1,490,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2428,4,1,491,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2429,4,1,492,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2430,4,1,493,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2431,4,1,494,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2432,4,1,495,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2433,4,1,496,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2434,4,1,497,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2435,4,1,498,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2436,4,1,499,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2437,4,1,500,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2438,4,1,501,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2439,4,1,502,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2440,4,1,503,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2441,4,1,504,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2442,4,1,505,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2443,4,1,506,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2444,4,1,507,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2445,4,1,508,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2446,4,1,509,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2447,4,1,510,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2448,4,1,511,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2449,4,1,512,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2450,4,1,513,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2451,4,1,514,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2452,4,1,515,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2453,4,1,516,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2454,4,1,517,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2455,4,1,518,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2456,4,1,519,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2457,4,1,520,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2458,4,1,521,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2459,4,1,522,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2460,4,1,523,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2461,4,1,524,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2462,4,1,525,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2463,4,1,526,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2464,4,1,527,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2465,4,1,528,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2466,4,1,529,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2467,4,1,530,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2468,4,1,531,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2469,4,1,532,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2470,4,1,533,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2471,4,1,534,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2472,4,1,535,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2473,4,1,536,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2474,4,1,537,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2475,4,1,538,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2476,4,1,539,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2477,4,1,540,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2478,4,1,541,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2479,4,1,542,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2480,4,1,543,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2481,4,1,544,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2482,4,1,545,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2483,4,1,546,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2484,4,1,547,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2485,4,1,548,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2486,4,1,549,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2487,4,1,550,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2488,4,1,551,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2489,4,1,552,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2490,4,1,553,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2491,4,1,554,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2492,4,1,555,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2493,4,1,556,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2494,4,1,557,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2495,4,1,558,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2496,4,1,559,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2497,4,1,560,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2498,4,1,561,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2499,4,1,562,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2554,1,4,3,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2555,1,4,563,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2556,1,4,564,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2557,1,4,565,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2558,1,4,566,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2559,1,4,567,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2560,1,4,568,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2561,1,4,569,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2562,1,4,570,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2563,1,4,571,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2564,1,4,572,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2565,1,4,573,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2566,1,4,574,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2567,1,4,575,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2568,1,4,576,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2569,1,4,577,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2570,1,4,578,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2571,1,4,579,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2572,1,4,580,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2573,1,4,581,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2574,1,4,582,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2575,1,4,583,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2576,1,4,584,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2577,1,4,585,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2578,1,4,586,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2579,1,4,587,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2580,1,4,588,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2581,1,4,589,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2582,1,4,590,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2583,1,4,591,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2584,1,4,592,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2585,1,4,593,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2586,1,4,594,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2587,1,4,595,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2588,1,4,596,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2589,1,4,28,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2590,1,4,597,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2591,1,4,598,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2592,1,4,599,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2593,1,4,600,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2594,1,4,601,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2595,1,4,602,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2596,1,4,603,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2597,1,4,604,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2598,1,4,605,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2599,1,4,606,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2600,1,4,607,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2601,1,4,608,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2602,1,4,609,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2603,1,4,610,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2604,1,4,611,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2605,1,4,612,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2606,1,4,613,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2607,1,4,614,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2608,1,4,615,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2609,1,4,616,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2610,1,4,617,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2611,1,4,618,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2612,1,4,619,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2613,1,4,620,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2614,1,4,621,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2615,1,4,622,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2616,1,4,623,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2617,1,4,624,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2618,1,4,625,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2619,1,4,626,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2620,1,4,627,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2621,1,4,628,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2622,1,4,629,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2623,1,4,630,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2624,1,4,631,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2625,1,4,632,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2626,1,4,633,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2681,2,3,3,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2682,2,3,563,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2683,2,3,564,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2684,2,3,565,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2685,2,3,566,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2686,2,3,567,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2687,2,3,568,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2688,2,3,569,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2689,2,3,570,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2690,2,3,571,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2691,2,3,572,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2692,2,3,573,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2693,2,3,574,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2694,2,3,575,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2695,2,3,576,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2696,2,3,577,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2697,2,3,578,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2698,2,3,579,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2699,2,3,580,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2700,2,3,581,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2701,2,3,582,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2702,2,3,583,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2703,2,3,584,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2704,2,3,585,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2705,2,3,586,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2706,2,3,587,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2707,2,3,588,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2708,2,3,589,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2709,2,3,590,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2710,2,3,591,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2711,2,3,592,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2712,2,3,593,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2713,2,3,594,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2714,2,3,595,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2715,2,3,596,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2716,2,3,28,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2717,2,3,597,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2718,2,3,598,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2719,2,3,599,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2720,2,3,600,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2721,2,3,601,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2722,2,3,602,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2723,2,3,603,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2724,2,3,604,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2725,2,3,605,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2726,2,3,606,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2727,2,3,607,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2728,2,3,608,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2729,2,3,609,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2730,2,3,610,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2731,2,3,611,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2732,2,3,612,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2733,2,3,613,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2734,2,3,614,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2735,2,3,615,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2736,2,3,616,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2737,2,3,617,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2738,2,3,618,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2739,2,3,619,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2740,2,3,620,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2741,2,3,621,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2742,2,3,622,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2743,2,3,623,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2744,2,3,624,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2745,2,3,625,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2746,2,3,626,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2747,2,3,627,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2748,2,3,628,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2749,2,3,629,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2750,2,3,630,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2751,2,3,631,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2752,2,3,632,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2753,2,3,633,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2808,3,2,3,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2809,3,2,563,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2810,3,2,564,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2811,3,2,565,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2812,3,2,566,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2813,3,2,567,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2814,3,2,568,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2815,3,2,569,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2816,3,2,570,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2817,3,2,571,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2818,3,2,572,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2819,3,2,573,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2820,3,2,574,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2821,3,2,575,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2822,3,2,576,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2823,3,2,577,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2824,3,2,578,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2825,3,2,579,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2826,3,2,580,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2827,3,2,581,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2828,3,2,582,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2829,3,2,583,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2830,3,2,584,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2831,3,2,585,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2832,3,2,586,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2833,3,2,587,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2834,3,2,588,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2835,3,2,589,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2836,3,2,590,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2837,3,2,591,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2838,3,2,592,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2839,3,2,593,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2840,3,2,594,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2841,3,2,595,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2842,3,2,596,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2843,3,2,28,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2844,3,2,597,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2845,3,2,598,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2846,3,2,599,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2847,3,2,600,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2848,3,2,601,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2849,3,2,602,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2850,3,2,603,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2851,3,2,604,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2852,3,2,605,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2853,3,2,606,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2854,3,2,607,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2855,3,2,608,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2856,3,2,609,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2857,3,2,610,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2858,3,2,611,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2859,3,2,612,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2860,3,2,613,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2861,3,2,614,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2862,3,2,615,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2863,3,2,616,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2864,3,2,617,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2865,3,2,618,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2866,3,2,619,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2867,3,2,620,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2868,3,2,621,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2869,3,2,622,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2870,3,2,623,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2871,3,2,624,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2872,3,2,625,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2873,3,2,626,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2874,3,2,627,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2875,3,2,628,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2876,3,2,629,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2877,3,2,630,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2878,3,2,631,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2879,3,2,632,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2880,3,2,633,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2935,4,1,3,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2936,4,1,563,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2937,4,1,564,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2938,4,1,565,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2939,4,1,566,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2940,4,1,567,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2941,4,1,568,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2942,4,1,569,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2943,4,1,570,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2944,4,1,571,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2945,4,1,572,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2946,4,1,573,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2947,4,1,574,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2948,4,1,575,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2949,4,1,576,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2950,4,1,577,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2951,4,1,578,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2952,4,1,579,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2953,4,1,580,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2954,4,1,581,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2955,4,1,582,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2956,4,1,583,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2957,4,1,584,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2958,4,1,585,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2959,4,1,586,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2960,4,1,587,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2961,4,1,588,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2962,4,1,589,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2963,4,1,590,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2964,4,1,591,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2965,4,1,592,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2966,4,1,593,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2967,4,1,594,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2968,4,1,595,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2969,4,1,596,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2970,4,1,28,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2971,4,1,597,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2972,4,1,598,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2973,4,1,599,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2974,4,1,600,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2975,4,1,601,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2976,4,1,602,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2977,4,1,603,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2978,4,1,604,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2979,4,1,605,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2980,4,1,606,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2981,4,1,607,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2982,4,1,608,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2983,4,1,609,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2984,4,1,610,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2985,4,1,611,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2986,4,1,612,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2987,4,1,613,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2988,4,1,614,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2989,4,1,615,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2990,4,1,616,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2991,4,1,617,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2992,4,1,618,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2993,4,1,619,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2994,4,1,620,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2995,4,1,621,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2996,4,1,622,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2997,4,1,623,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2998,4,1,624,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(2999,4,1,625,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3000,4,1,626,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3001,4,1,627,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3002,4,1,628,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3003,4,1,629,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3004,4,1,630,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3005,4,1,631,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3006,4,1,632,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3007,4,1,633,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3008,5,5,399,0.190000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3009,5,5,616,0.350000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3010,1,4,634,0.050000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3011,2,3,634,0.050000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3012,3,2,634,0.050000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3013,4,1,634,0.050000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3014,1,4,635,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3015,2,3,635,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3016,3,2,635,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3017,4,1,635,0.530000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3018,1,4,637,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3019,2,3,637,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3020,3,2,637,0.110000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL),(3021,4,1,637,0.150000,30,6,0.00000,0.00000,'0',0,0,1,NULL,NULL);
/*!40000 ALTER TABLE `pkg_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_rate_agent`
--

DROP TABLE IF EXISTS `pkg_rate_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_rate_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_plan` int(11) NOT NULL,
  `id_prefix` int(11) NOT NULL,
  `rateinitial` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `initblock` int(11) NOT NULL DEFAULT 0,
  `billingblock` int(11) NOT NULL DEFAULT 0,
  `minimal_time_charge` smallint(2) NOT NULL DEFAULT 0,
  `package_offer` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_plan_pkg_rate_agent` (`id_plan`),
  KEY `fk_pkg_prefix_pkg_rate_agent` (`id_prefix`),
  CONSTRAINT `fk_pkg_plan_pkg_rate_agent` FOREIGN KEY (`id_plan`) REFERENCES `pkg_plan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_prefix_pkg_rate_agent` FOREIGN KEY (`id_prefix`) REFERENCES `pkg_prefix` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_rate_agent`
--

LOCK TABLES `pkg_rate_agent` WRITE;
/*!40000 ALTER TABLE `pkg_rate_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_rate_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_rate_callshop`
--

DROP TABLE IF EXISTS `pkg_rate_callshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_rate_callshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `dialprefix` char(30) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `buyrate` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `minimo` int(10) NOT NULL DEFAULT 1,
  `block` int(10) NOT NULL DEFAULT 1,
  `minimal_time_charge` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `dialprefix` (`dialprefix`),
  KEY `fk_pkg_user_pkg_rate_callshop` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_rate_callshop` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_rate_callshop`
--

LOCK TABLES `pkg_rate_callshop` WRITE;
/*!40000 ALTER TABLE `pkg_rate_callshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_rate_callshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_rate_provider`
--

DROP TABLE IF EXISTS `pkg_rate_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_rate_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_provider` int(11) NOT NULL,
  `id_prefix` int(11) NOT NULL,
  `buyrate` decimal(15,6) DEFAULT 0.000000,
  `buyrateinitblock` int(11) NOT NULL DEFAULT 1,
  `buyrateincrement` int(11) NOT NULL DEFAULT 1,
  `minimal_time_buy` int(2) NOT NULL DEFAULT 0,
  `dialprefix` bigint(20) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_prefix_pkg_rate` (`id_prefix`),
  KEY `dialprefix` (`dialprefix`),
  KEY `fk_pkg_provider_pkg_rate_provider` (`id_provider`),
  KEY `id_prefix` (`id_prefix`),
  CONSTRAINT `fk_pkg_provider_pkg_rate_provider` FOREIGN KEY (`id_provider`) REFERENCES `pkg_provider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3703 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_rate_provider`
--

LOCK TABLES `pkg_rate_provider` WRITE;
/*!40000 ALTER TABLE `pkg_rate_provider` DISABLE KEYS */;
INSERT INTO `pkg_rate_provider` VALUES (1,1,2,0.041000,30,6,0,NULL,NULL),(2,1,3,0.041000,30,6,0,NULL,NULL),(3,1,4,0.041000,30,6,0,NULL,NULL),(4,1,5,0.041000,30,6,0,NULL,NULL),(5,1,6,0.041000,30,6,0,NULL,NULL),(6,1,7,0.041000,30,6,0,NULL,NULL),(7,1,8,0.041000,30,6,0,NULL,NULL),(8,1,9,0.041000,30,6,0,NULL,NULL),(9,1,10,0.041000,30,6,0,NULL,NULL),(10,1,11,0.041000,30,6,0,NULL,NULL),(11,1,12,0.041000,30,6,0,NULL,NULL),(12,1,13,0.041000,30,6,0,NULL,NULL),(13,1,14,0.041000,30,6,0,NULL,NULL),(14,1,15,0.041000,30,6,0,NULL,NULL),(15,1,16,0.041000,30,6,0,NULL,NULL),(16,1,17,0.041000,30,6,0,NULL,NULL),(17,1,18,0.041000,30,6,0,NULL,NULL),(18,1,19,0.041000,30,6,0,NULL,NULL),(19,1,20,0.041000,30,6,0,NULL,NULL),(20,1,21,0.041000,30,6,0,NULL,NULL),(21,1,22,0.041000,30,6,0,NULL,NULL),(22,1,23,0.041000,30,6,0,NULL,NULL),(23,1,24,0.041000,30,6,0,NULL,NULL),(24,1,25,0.041000,30,6,0,NULL,NULL),(25,1,26,0.041000,30,6,0,NULL,NULL),(26,1,27,0.041000,30,6,0,NULL,NULL),(27,1,28,0.041000,30,6,0,NULL,NULL),(28,1,29,0.041000,30,6,0,NULL,NULL),(29,1,30,0.041000,30,6,0,NULL,NULL),(30,1,31,0.041000,30,6,0,NULL,NULL),(31,1,32,0.041000,30,6,0,NULL,NULL),(32,1,33,0.041000,30,6,0,NULL,NULL),(33,1,34,0.041000,30,6,0,NULL,NULL),(34,1,35,0.041000,30,6,0,NULL,NULL),(35,1,36,0.041000,30,6,0,NULL,NULL),(36,1,37,0.041000,30,6,0,NULL,NULL),(37,1,38,0.041000,30,6,0,NULL,NULL),(38,1,39,0.041000,30,6,0,NULL,NULL),(39,1,40,0.041000,30,6,0,NULL,NULL),(40,1,41,0.041000,30,6,0,NULL,NULL),(41,1,42,0.041000,30,6,0,NULL,NULL),(42,1,43,0.041000,30,6,0,NULL,NULL),(43,1,44,0.041000,30,6,0,NULL,NULL),(44,1,45,0.041000,30,6,0,NULL,NULL),(45,1,46,0.041000,30,6,0,NULL,NULL),(46,1,47,0.041000,30,6,0,NULL,NULL),(47,1,48,0.041000,30,6,0,NULL,NULL),(48,1,49,0.041000,30,6,0,NULL,NULL),(49,1,50,0.041000,30,6,0,NULL,NULL),(50,1,51,0.041000,30,6,0,NULL,NULL),(51,1,52,0.041000,30,6,0,NULL,NULL),(52,1,53,0.041000,30,6,0,NULL,NULL),(53,1,54,0.041000,30,6,0,NULL,NULL),(54,1,55,0.041000,30,6,0,NULL,NULL),(55,1,56,0.041000,30,6,0,NULL,NULL),(56,1,57,0.041000,30,6,0,NULL,NULL),(57,1,58,0.041000,30,6,0,NULL,NULL),(58,1,59,0.041000,30,6,0,NULL,NULL),(59,1,60,0.041000,30,6,0,NULL,NULL),(60,1,61,0.041000,30,6,0,NULL,NULL),(61,1,62,0.041000,30,6,0,NULL,NULL),(62,1,63,0.041000,30,6,0,NULL,NULL),(63,1,64,0.041000,30,6,0,NULL,NULL),(64,1,65,0.041000,30,6,0,NULL,NULL),(65,1,66,0.041000,30,6,0,NULL,NULL),(66,1,67,0.041000,30,6,0,NULL,NULL),(67,1,68,0.041000,30,6,0,NULL,NULL),(68,1,69,0.041000,30,6,0,NULL,NULL),(69,1,70,0.041000,30,6,0,NULL,NULL),(70,1,71,0.041000,30,6,0,NULL,NULL),(71,1,72,0.041000,30,6,0,NULL,NULL),(72,1,73,0.041000,30,6,0,NULL,NULL),(73,1,74,0.041000,30,6,0,NULL,NULL),(74,1,75,0.041000,30,6,0,NULL,NULL),(75,1,76,0.041000,30,6,0,NULL,NULL),(76,1,77,0.041000,30,6,0,NULL,NULL),(77,1,78,0.041000,30,6,0,NULL,NULL),(78,1,79,0.041000,30,6,0,NULL,NULL),(79,1,80,0.041000,30,6,0,NULL,NULL),(80,1,81,0.041000,30,6,0,NULL,NULL),(81,1,82,0.041000,30,6,0,NULL,NULL),(82,1,83,0.041000,30,6,0,NULL,NULL),(83,1,84,0.041000,30,6,0,NULL,NULL),(84,1,85,0.041000,30,6,0,NULL,NULL),(85,1,86,0.041000,30,6,0,NULL,NULL),(86,1,87,0.041000,30,6,0,NULL,NULL),(87,1,88,0.041000,30,6,0,NULL,NULL),(88,1,89,0.041000,30,6,0,NULL,NULL),(89,1,90,0.041000,30,6,0,NULL,NULL),(90,1,91,0.041000,30,6,0,NULL,NULL),(91,1,92,0.041000,30,6,0,NULL,NULL),(92,1,93,0.041000,30,6,0,NULL,NULL),(93,1,94,0.041000,30,6,0,NULL,NULL),(94,1,95,0.041000,30,6,0,NULL,NULL),(95,1,96,0.041000,30,6,0,NULL,NULL),(96,1,97,0.041000,30,6,0,NULL,NULL),(97,1,98,0.041000,30,6,0,NULL,NULL),(98,1,99,0.041000,30,6,0,NULL,NULL),(99,1,100,0.041000,30,6,0,NULL,NULL),(100,1,101,0.041000,30,6,0,NULL,NULL),(101,1,102,0.041000,30,6,0,NULL,NULL),(102,1,103,0.041000,30,6,0,NULL,NULL),(103,1,104,0.041000,30,6,0,NULL,NULL),(104,1,105,0.041000,30,6,0,NULL,NULL),(105,1,106,0.041000,30,6,0,NULL,NULL),(106,1,107,0.041000,30,6,0,NULL,NULL),(107,1,108,0.041000,30,6,0,NULL,NULL),(108,1,109,0.041000,30,6,0,NULL,NULL),(109,1,110,0.041000,30,6,0,NULL,NULL),(110,1,111,0.041000,30,6,0,NULL,NULL),(111,1,112,0.041000,30,6,0,NULL,NULL),(112,1,113,0.041000,30,6,0,NULL,NULL),(113,1,114,0.041000,30,6,0,NULL,NULL),(114,1,115,0.041000,30,6,0,NULL,NULL),(115,1,116,0.041000,30,6,0,NULL,NULL),(116,1,117,0.041000,30,6,0,NULL,NULL),(117,1,118,0.041000,30,6,0,NULL,NULL),(118,1,119,0.041000,30,6,0,NULL,NULL),(119,1,120,0.041000,30,6,0,NULL,NULL),(120,1,121,0.041000,30,6,0,NULL,NULL),(121,1,122,0.041000,30,6,0,NULL,NULL),(122,1,123,0.041000,30,6,0,NULL,NULL),(123,1,124,0.041000,30,6,0,NULL,NULL),(124,1,125,0.041000,30,6,0,NULL,NULL),(125,1,126,0.041000,30,6,0,NULL,NULL),(126,1,127,0.041000,30,6,0,NULL,NULL),(127,1,128,0.041000,30,6,0,NULL,NULL),(128,1,129,0.041000,30,6,0,NULL,NULL),(129,1,130,0.041000,30,6,0,NULL,NULL),(130,1,131,0.041000,30,6,0,NULL,NULL),(131,1,132,0.041000,30,6,0,NULL,NULL),(132,1,133,0.041000,30,6,0,NULL,NULL),(133,1,134,0.041000,30,6,0,NULL,NULL),(134,1,135,0.041000,30,6,0,NULL,NULL),(135,1,136,0.041000,30,6,0,NULL,NULL),(136,1,137,0.041000,30,6,0,NULL,NULL),(137,1,138,0.041000,30,6,0,NULL,NULL),(138,1,139,0.041000,30,6,0,NULL,NULL),(139,1,140,0.041000,30,6,0,NULL,NULL),(140,1,141,0.041000,30,6,0,NULL,NULL),(141,1,142,0.041000,30,6,0,NULL,NULL),(142,1,143,0.041000,30,6,0,NULL,NULL),(143,1,144,0.041000,30,6,0,NULL,NULL),(144,1,145,0.041000,30,6,0,NULL,NULL),(145,1,146,0.041000,30,6,0,NULL,NULL),(146,1,147,0.041000,30,6,0,NULL,NULL),(147,1,148,0.041000,30,6,0,NULL,NULL),(148,1,149,0.041000,30,6,0,NULL,NULL),(149,1,150,0.041000,30,6,0,NULL,NULL),(150,1,151,0.041000,30,6,0,NULL,NULL),(151,1,152,0.041000,30,6,0,NULL,NULL),(152,1,153,0.041000,30,6,0,NULL,NULL),(153,1,154,0.041000,30,6,0,NULL,NULL),(154,1,155,0.041000,30,6,0,NULL,NULL),(155,1,156,0.041000,30,6,0,NULL,NULL),(156,1,157,0.041000,30,6,0,NULL,NULL),(157,1,158,0.041000,30,6,0,NULL,NULL),(158,1,159,0.041000,30,6,0,NULL,NULL),(159,1,160,0.041000,30,6,0,NULL,NULL),(160,1,161,0.041000,30,6,0,NULL,NULL),(161,1,162,0.041000,30,6,0,NULL,NULL),(162,1,163,0.041000,30,6,0,NULL,NULL),(163,1,164,0.041000,30,6,0,NULL,NULL),(164,1,165,0.041000,30,6,0,NULL,NULL),(165,1,166,0.041000,30,6,0,NULL,NULL),(166,1,167,0.041000,30,6,0,NULL,NULL),(167,1,168,0.041000,30,6,0,NULL,NULL),(168,1,169,0.041000,30,6,0,NULL,NULL),(169,1,170,0.041000,30,6,0,NULL,NULL),(170,1,171,0.041000,30,6,0,NULL,NULL),(171,1,172,0.041000,30,6,0,NULL,NULL),(172,1,173,0.041000,30,6,0,NULL,NULL),(173,1,174,0.041000,30,6,0,NULL,NULL),(174,1,175,0.041000,30,6,0,NULL,NULL),(175,1,176,0.041000,30,6,0,NULL,NULL),(176,1,177,0.041000,30,6,0,NULL,NULL),(177,1,178,0.041000,30,6,0,NULL,NULL),(178,1,179,0.041000,30,6,0,NULL,NULL),(179,1,180,0.041000,30,6,0,NULL,NULL),(180,1,181,0.041000,30,6,0,NULL,NULL),(181,1,182,0.041000,30,6,0,NULL,NULL),(182,1,183,0.041000,30,6,0,NULL,NULL),(183,1,184,0.041000,30,6,0,NULL,NULL),(184,1,185,0.041000,30,6,0,NULL,NULL),(185,1,186,0.041000,30,6,0,NULL,NULL),(186,1,187,0.041000,30,6,0,NULL,NULL),(187,1,188,0.041000,30,6,0,NULL,NULL),(188,1,189,0.041000,30,6,0,NULL,NULL),(189,1,190,0.041000,30,6,0,NULL,NULL),(190,1,191,0.041000,30,6,0,NULL,NULL),(191,1,192,0.041000,30,6,0,NULL,NULL),(192,1,193,0.041000,30,6,0,NULL,NULL),(193,1,194,0.041000,30,6,0,NULL,NULL),(194,1,195,0.041000,30,6,0,NULL,NULL),(195,1,196,0.041000,30,6,0,NULL,NULL),(196,1,197,0.041000,30,6,0,NULL,NULL),(197,1,198,0.041000,30,6,0,NULL,NULL),(198,1,199,0.041000,30,6,0,NULL,NULL),(199,1,200,0.041000,30,6,0,NULL,NULL),(200,1,201,0.041000,30,6,0,NULL,NULL),(201,1,202,0.041000,30,6,0,NULL,NULL),(202,1,203,0.041000,30,6,0,NULL,NULL),(203,1,204,0.041000,30,6,0,NULL,NULL),(204,1,205,0.041000,30,6,0,NULL,NULL),(205,1,206,0.041000,30,6,0,NULL,NULL),(206,1,207,0.041000,30,6,0,NULL,NULL),(207,1,208,0.041000,30,6,0,NULL,NULL),(208,1,209,0.041000,30,6,0,NULL,NULL),(209,1,210,0.041000,30,6,0,NULL,NULL),(210,1,211,0.041000,30,6,0,NULL,NULL),(211,1,212,0.041000,30,6,0,NULL,NULL),(212,1,213,0.041000,30,6,0,NULL,NULL),(213,1,214,0.041000,30,6,0,NULL,NULL),(214,1,215,0.041000,30,6,0,NULL,NULL),(215,1,216,0.041000,30,6,0,NULL,NULL),(216,1,217,0.041000,30,6,0,NULL,NULL),(217,1,218,0.041000,30,6,0,NULL,NULL),(218,1,219,0.041000,30,6,0,NULL,NULL),(219,1,220,0.041000,30,6,0,NULL,NULL),(220,1,221,0.041000,30,6,0,NULL,NULL),(221,1,222,0.041000,30,6,0,NULL,NULL),(222,1,223,0.041000,30,6,0,NULL,NULL),(223,1,224,0.041000,30,6,0,NULL,NULL),(224,1,225,0.041000,30,6,0,NULL,NULL),(225,1,226,0.041000,30,6,0,NULL,NULL),(226,1,227,0.041000,30,6,0,NULL,NULL),(227,1,228,0.041000,30,6,0,NULL,NULL),(228,1,229,0.041000,30,6,0,NULL,NULL),(229,1,230,0.041000,30,6,0,NULL,NULL),(230,1,231,0.041000,30,6,0,NULL,NULL),(231,1,232,0.041000,30,6,0,NULL,NULL),(232,1,233,0.041000,30,6,0,NULL,NULL),(233,1,234,0.041000,30,6,0,NULL,NULL),(234,1,235,0.041000,30,6,0,NULL,NULL),(235,1,236,0.041000,30,6,0,NULL,NULL),(236,1,237,0.041000,30,6,0,NULL,NULL),(237,1,238,0.041000,30,6,0,NULL,NULL),(238,1,239,0.041000,30,6,0,NULL,NULL),(239,1,240,0.041000,30,6,0,NULL,NULL),(240,1,241,0.041000,30,6,0,NULL,NULL),(241,1,242,0.041000,30,6,0,NULL,NULL),(242,1,243,0.041000,30,6,0,NULL,NULL),(243,1,244,0.041000,30,6,0,NULL,NULL),(244,1,245,0.041000,30,6,0,NULL,NULL),(245,1,246,0.041000,30,6,0,NULL,NULL),(246,1,247,0.041000,30,6,0,NULL,NULL),(247,1,248,0.041000,30,6,0,NULL,NULL),(248,1,249,0.041000,30,6,0,NULL,NULL),(249,1,250,0.041000,30,6,0,NULL,NULL),(250,1,251,0.041000,30,6,0,NULL,NULL),(251,1,252,0.041000,30,6,0,NULL,NULL),(252,1,253,0.041000,30,6,0,NULL,NULL),(253,1,254,0.041000,30,6,0,NULL,NULL),(254,1,255,0.041000,30,6,0,NULL,NULL),(255,1,256,0.041000,30,6,0,NULL,NULL),(256,1,257,0.041000,30,6,0,NULL,NULL),(257,1,258,0.041000,30,6,0,NULL,NULL),(258,1,259,0.041000,30,6,0,NULL,NULL),(259,1,260,0.041000,30,6,0,NULL,NULL),(260,1,261,0.041000,30,6,0,NULL,NULL),(261,1,262,0.041000,30,6,0,NULL,NULL),(262,1,263,0.041000,30,6,0,NULL,NULL),(263,1,264,0.041000,30,6,0,NULL,NULL),(264,1,265,0.041000,30,6,0,NULL,NULL),(265,1,266,0.041000,30,6,0,NULL,NULL),(266,1,267,0.041000,30,6,0,NULL,NULL),(267,1,268,0.041000,30,6,0,NULL,NULL),(268,1,269,0.041000,30,6,0,NULL,NULL),(269,1,270,0.041000,30,6,0,NULL,NULL),(270,1,271,0.041000,30,6,0,NULL,NULL),(271,1,272,0.041000,30,6,0,NULL,NULL),(272,1,273,0.041000,30,6,0,NULL,NULL),(273,1,274,0.041000,30,6,0,NULL,NULL),(274,1,275,0.041000,30,6,0,NULL,NULL),(275,1,276,0.041000,30,6,0,NULL,NULL),(276,1,277,0.041000,30,6,0,NULL,NULL),(277,1,278,0.041000,30,6,0,NULL,NULL),(278,1,279,0.041000,30,6,0,NULL,NULL),(279,1,280,0.041000,30,6,0,NULL,NULL),(280,1,281,0.041000,30,6,0,NULL,NULL),(281,1,282,0.041000,30,6,0,NULL,NULL),(282,1,283,0.041000,30,6,0,NULL,NULL),(283,1,284,0.041000,30,6,0,NULL,NULL),(284,1,285,0.041000,30,6,0,NULL,NULL),(285,1,286,0.041000,30,6,0,NULL,NULL),(286,1,287,0.041000,30,6,0,NULL,NULL),(287,1,288,0.041000,30,6,0,NULL,NULL),(288,1,289,0.041000,30,6,0,NULL,NULL),(289,1,290,0.041000,30,6,0,NULL,NULL),(290,1,291,0.041000,30,6,0,NULL,NULL),(291,1,292,0.041000,30,6,0,NULL,NULL),(292,1,293,0.041000,30,6,0,NULL,NULL),(293,1,294,0.041000,30,6,0,NULL,NULL),(294,1,295,0.041000,30,6,0,NULL,NULL),(295,1,296,0.041000,30,6,0,NULL,NULL),(296,1,297,0.041000,30,6,0,NULL,NULL),(297,1,298,0.041000,30,6,0,NULL,NULL),(298,1,299,0.041000,30,6,0,NULL,NULL),(299,1,300,0.041000,30,6,0,NULL,NULL),(300,1,301,0.041000,30,6,0,NULL,NULL),(301,1,302,0.041000,30,6,0,NULL,NULL),(302,1,303,0.041000,30,6,0,NULL,NULL),(303,1,304,0.041000,30,6,0,NULL,NULL),(304,1,305,0.041000,30,6,0,NULL,NULL),(305,1,306,0.041000,30,6,0,NULL,NULL),(306,1,307,0.041000,30,6,0,NULL,NULL),(307,1,308,0.041000,30,6,0,NULL,NULL),(308,1,309,0.041000,30,6,0,NULL,NULL),(309,1,310,0.041000,30,6,0,NULL,NULL),(310,1,311,0.041000,30,6,0,NULL,NULL),(311,1,312,0.041000,30,6,0,NULL,NULL),(312,1,313,0.041000,30,6,0,NULL,NULL),(313,1,314,0.041000,30,6,0,NULL,NULL),(314,1,315,0.041000,30,6,0,NULL,NULL),(315,1,316,0.041000,30,6,0,NULL,NULL),(316,1,317,0.041000,30,6,0,NULL,NULL),(317,1,318,0.041000,30,6,0,NULL,NULL),(318,1,319,0.041000,30,6,0,NULL,NULL),(319,1,320,0.041000,30,6,0,NULL,NULL),(320,1,321,0.041000,30,6,0,NULL,NULL),(321,1,322,0.041000,30,6,0,NULL,NULL),(322,1,323,0.041000,30,6,0,NULL,NULL),(323,1,324,0.041000,30,6,0,NULL,NULL),(324,1,325,0.041000,30,6,0,NULL,NULL),(325,1,326,0.041000,30,6,0,NULL,NULL),(326,1,327,0.041000,30,6,0,NULL,NULL),(327,1,328,0.041000,30,6,0,NULL,NULL),(328,1,329,0.041000,30,6,0,NULL,NULL),(329,1,330,0.041000,30,6,0,NULL,NULL),(330,1,331,0.041000,30,6,0,NULL,NULL),(331,1,332,0.041000,30,6,0,NULL,NULL),(332,1,333,0.041000,30,6,0,NULL,NULL),(333,1,334,0.041000,30,6,0,NULL,NULL),(334,1,335,0.041000,30,6,0,NULL,NULL),(335,1,336,0.041000,30,6,0,NULL,NULL),(336,1,337,0.041000,30,6,0,NULL,NULL),(337,1,338,0.041000,30,6,0,NULL,NULL),(338,1,339,0.041000,30,6,0,NULL,NULL),(339,1,340,0.041000,30,6,0,NULL,NULL),(340,1,341,0.041000,30,6,0,NULL,NULL),(341,1,342,0.041000,30,6,0,NULL,NULL),(342,1,343,0.041000,30,6,0,NULL,NULL),(343,1,344,0.041000,30,6,0,NULL,NULL),(344,1,345,0.041000,30,6,0,NULL,NULL),(345,1,346,0.041000,30,6,0,NULL,NULL),(346,1,347,0.041000,30,6,0,NULL,NULL),(347,1,348,0.041000,30,6,0,NULL,NULL),(348,1,349,0.041000,30,6,0,NULL,NULL),(349,1,350,0.041000,30,6,0,NULL,NULL),(350,1,351,0.041000,30,6,0,NULL,NULL),(351,1,352,0.041000,30,6,0,NULL,NULL),(352,1,353,0.041000,30,6,0,NULL,NULL),(353,1,354,0.041000,30,6,0,NULL,NULL),(354,1,355,0.041000,30,6,0,NULL,NULL),(355,1,356,0.041000,30,6,0,NULL,NULL),(356,1,357,0.041000,30,6,0,NULL,NULL),(357,1,358,0.041000,30,6,0,NULL,NULL),(358,1,359,0.041000,30,6,0,NULL,NULL),(359,1,360,0.041000,30,6,0,NULL,NULL),(360,1,361,0.041000,30,6,0,NULL,NULL),(361,1,362,0.041000,30,6,0,NULL,NULL),(362,1,363,0.041000,30,6,0,NULL,NULL),(363,1,364,0.041000,30,6,0,NULL,NULL),(364,1,365,0.041000,30,6,0,NULL,NULL),(365,1,366,0.041000,30,6,0,NULL,NULL),(366,1,367,0.041000,30,6,0,NULL,NULL),(367,1,368,0.041000,30,6,0,NULL,NULL),(368,1,369,0.041000,30,6,0,NULL,NULL),(369,1,370,0.041000,30,6,0,NULL,NULL),(370,1,371,0.041000,30,6,0,NULL,NULL),(371,1,372,0.041000,30,6,0,NULL,NULL),(372,1,373,0.041000,30,6,0,NULL,NULL),(373,1,374,0.041000,30,6,0,NULL,NULL),(374,1,375,0.041000,30,6,0,NULL,NULL),(375,1,376,0.041000,30,6,0,NULL,NULL),(376,1,377,0.041000,30,6,0,NULL,NULL),(377,1,378,0.041000,30,6,0,NULL,NULL),(378,1,379,0.041000,30,6,0,NULL,NULL),(379,1,380,0.041000,30,6,0,NULL,NULL),(380,1,381,0.041000,30,6,0,NULL,NULL),(381,1,382,0.041000,30,6,0,NULL,NULL),(382,1,383,0.041000,30,6,0,NULL,NULL),(383,1,384,0.041000,30,6,0,NULL,NULL),(384,1,385,0.041000,30,6,0,NULL,NULL),(385,1,386,0.041000,30,6,0,NULL,NULL),(386,1,387,0.041000,30,6,0,NULL,NULL),(387,1,388,0.041000,30,6,0,NULL,NULL),(388,1,389,0.041000,30,6,0,NULL,NULL),(389,1,390,0.041000,30,6,0,NULL,NULL),(390,1,391,0.041000,30,6,0,NULL,NULL),(391,1,392,0.041000,30,6,0,NULL,NULL),(392,1,393,0.041000,30,6,0,NULL,NULL),(393,1,394,0.041000,30,6,0,NULL,NULL),(394,1,395,0.041000,30,6,0,NULL,NULL),(395,1,396,0.041000,30,6,0,NULL,NULL),(396,1,397,0.041000,30,6,0,NULL,NULL),(397,1,398,0.041000,30,6,0,NULL,NULL),(398,1,399,0.041000,30,6,0,NULL,NULL),(399,1,400,0.041000,30,6,0,NULL,NULL),(400,1,401,0.041000,30,6,0,NULL,NULL),(401,1,402,0.041000,30,6,0,NULL,NULL),(402,1,403,0.041000,30,6,0,NULL,NULL),(403,1,404,0.041000,30,6,0,NULL,NULL),(404,1,405,0.041000,30,6,0,NULL,NULL),(405,1,406,0.041000,30,6,0,NULL,NULL),(406,1,407,0.041000,30,6,0,NULL,NULL),(407,1,408,0.041000,30,6,0,NULL,NULL),(408,1,409,0.041000,30,6,0,NULL,NULL),(409,1,410,0.041000,30,6,0,NULL,NULL),(410,1,411,0.041000,30,6,0,NULL,NULL),(411,1,412,0.041000,30,6,0,NULL,NULL),(412,1,413,0.041000,30,6,0,NULL,NULL),(413,1,414,0.041000,30,6,0,NULL,NULL),(414,1,415,0.041000,30,6,0,NULL,NULL),(415,1,416,0.041000,30,6,0,NULL,NULL),(416,1,417,0.041000,30,6,0,NULL,NULL),(417,1,418,0.041000,30,6,0,NULL,NULL),(418,1,419,0.041000,30,6,0,NULL,NULL),(419,1,420,0.041000,30,6,0,NULL,NULL),(420,1,421,0.041000,30,6,0,NULL,NULL),(421,1,422,0.041000,30,6,0,NULL,NULL),(422,1,423,0.041000,30,6,0,NULL,NULL),(423,1,424,0.041000,30,6,0,NULL,NULL),(424,1,425,0.041000,30,6,0,NULL,NULL),(425,1,426,0.041000,30,6,0,NULL,NULL),(426,1,427,0.041000,30,6,0,NULL,NULL),(427,1,428,0.041000,30,6,0,NULL,NULL),(428,1,429,0.041000,30,6,0,NULL,NULL),(429,1,430,0.041000,30,6,0,NULL,NULL),(430,1,431,0.041000,30,6,0,NULL,NULL),(431,1,432,0.041000,30,6,0,NULL,NULL),(432,1,433,0.041000,30,6,0,NULL,NULL),(433,1,434,0.041000,30,6,0,NULL,NULL),(434,1,435,0.041000,30,6,0,NULL,NULL),(435,1,436,0.041000,30,6,0,NULL,NULL),(436,1,437,0.041000,30,6,0,NULL,NULL),(437,1,438,0.041000,30,6,0,NULL,NULL),(438,1,439,0.041000,30,6,0,NULL,NULL),(439,1,440,0.041000,30,6,0,NULL,NULL),(440,1,441,0.041000,30,6,0,NULL,NULL),(441,1,442,0.041000,30,6,0,NULL,NULL),(442,1,443,0.041000,30,6,0,NULL,NULL),(443,1,444,0.041000,30,6,0,NULL,NULL),(444,1,445,0.041000,30,6,0,NULL,NULL),(445,1,446,0.041000,30,6,0,NULL,NULL),(446,1,447,0.041000,30,6,0,NULL,NULL),(447,1,448,0.041000,30,6,0,NULL,NULL),(448,1,449,0.041000,30,6,0,NULL,NULL),(449,1,450,0.041000,30,6,0,NULL,NULL),(450,1,451,0.041000,30,6,0,NULL,NULL),(451,1,452,0.041000,30,6,0,NULL,NULL),(452,1,453,0.041000,30,6,0,NULL,NULL),(453,1,454,0.041000,30,6,0,NULL,NULL),(454,1,455,0.041000,30,6,0,NULL,NULL),(455,1,456,0.041000,30,6,0,NULL,NULL),(456,1,457,0.041000,30,6,0,NULL,NULL),(457,1,458,0.041000,30,6,0,NULL,NULL),(458,1,459,0.041000,30,6,0,NULL,NULL),(459,1,460,0.041000,30,6,0,NULL,NULL),(460,1,461,0.041000,30,6,0,NULL,NULL),(461,1,462,0.041000,30,6,0,NULL,NULL),(462,1,463,0.041000,30,6,0,NULL,NULL),(463,1,464,0.041000,30,6,0,NULL,NULL),(464,1,465,0.041000,30,6,0,NULL,NULL),(465,1,466,0.041000,30,6,0,NULL,NULL),(466,1,467,0.041000,30,6,0,NULL,NULL),(467,1,468,0.041000,30,6,0,NULL,NULL),(468,1,469,0.041000,30,6,0,NULL,NULL),(469,1,470,0.041000,30,6,0,NULL,NULL),(470,1,471,0.041000,30,6,0,NULL,NULL),(471,1,472,0.041000,30,6,0,NULL,NULL),(472,1,473,0.041000,30,6,0,NULL,NULL),(473,1,474,0.041000,30,6,0,NULL,NULL),(474,1,475,0.041000,30,6,0,NULL,NULL),(475,1,476,0.041000,30,6,0,NULL,NULL),(476,1,477,0.041000,30,6,0,NULL,NULL),(477,1,478,0.041000,30,6,0,NULL,NULL),(478,1,479,0.041000,30,6,0,NULL,NULL),(479,1,480,0.041000,30,6,0,NULL,NULL),(480,1,481,0.041000,30,6,0,NULL,NULL),(481,1,482,0.041000,30,6,0,NULL,NULL),(482,1,483,0.041000,30,6,0,NULL,NULL),(483,1,484,0.041000,30,6,0,NULL,NULL),(484,1,485,0.041000,30,6,0,NULL,NULL),(485,1,486,0.041000,30,6,0,NULL,NULL),(486,1,487,0.041000,30,6,0,NULL,NULL),(487,1,488,0.041000,30,6,0,NULL,NULL),(488,1,490,0.041000,30,6,0,NULL,NULL),(489,1,491,0.041000,30,6,0,NULL,NULL),(490,1,492,0.041000,30,6,0,NULL,NULL),(491,1,493,0.041000,30,6,0,NULL,NULL),(492,1,494,0.041000,30,6,0,NULL,NULL),(493,1,495,0.041000,30,6,0,NULL,NULL),(494,1,496,0.041000,30,6,0,NULL,NULL),(495,1,497,0.041000,30,6,0,NULL,NULL),(496,1,498,0.041000,30,6,0,NULL,NULL),(497,1,499,0.041000,30,6,0,NULL,NULL),(498,1,500,0.041000,30,6,0,NULL,NULL),(499,1,501,0.041000,30,6,0,NULL,NULL),(500,1,502,0.041000,30,6,0,NULL,NULL),(501,1,503,0.041000,30,6,0,NULL,NULL),(502,1,504,0.041000,30,6,0,NULL,NULL),(503,1,505,0.041000,30,6,0,NULL,NULL),(504,1,506,0.041000,30,6,0,NULL,NULL),(505,1,507,0.041000,30,6,0,NULL,NULL),(506,1,508,0.041000,30,6,0,NULL,NULL),(507,1,509,0.041000,30,6,0,NULL,NULL),(508,1,510,0.041000,30,6,0,NULL,NULL),(509,1,511,0.041000,30,6,0,NULL,NULL),(510,1,512,0.041000,30,6,0,NULL,NULL),(511,1,513,0.041000,30,6,0,NULL,NULL),(512,1,514,0.041000,30,6,0,NULL,NULL),(513,1,515,0.041000,30,6,0,NULL,NULL),(514,1,516,0.041000,30,6,0,NULL,NULL),(515,1,517,0.041000,30,6,0,NULL,NULL),(516,1,518,0.041000,30,6,0,NULL,NULL),(517,1,519,0.041000,30,6,0,NULL,NULL),(518,1,520,0.041000,30,6,0,NULL,NULL),(519,1,521,0.041000,30,6,0,NULL,NULL),(520,1,522,0.041000,30,6,0,NULL,NULL),(521,1,523,0.041000,30,6,0,NULL,NULL),(522,1,524,0.041000,30,6,0,NULL,NULL),(523,1,525,0.041000,30,6,0,NULL,NULL),(524,1,526,0.041000,30,6,0,NULL,NULL),(525,1,527,0.041000,30,6,0,NULL,NULL),(526,1,528,0.041000,30,6,0,NULL,NULL),(527,1,529,0.041000,30,6,0,NULL,NULL),(528,1,530,0.041000,30,6,0,NULL,NULL),(529,1,531,0.041000,30,6,0,NULL,NULL),(530,1,532,0.041000,30,6,0,NULL,NULL),(531,1,533,0.041000,30,6,0,NULL,NULL),(532,1,534,0.041000,30,6,0,NULL,NULL),(533,1,535,0.041000,30,6,0,NULL,NULL),(534,1,536,0.041000,30,6,0,NULL,NULL),(535,1,537,0.041000,30,6,0,NULL,NULL),(536,1,538,0.041000,30,6,0,NULL,NULL),(537,1,539,0.041000,30,6,0,NULL,NULL),(538,1,540,0.041000,30,6,0,NULL,NULL),(539,1,541,0.041000,30,6,0,NULL,NULL),(540,1,542,0.041000,30,6,0,NULL,NULL),(541,1,543,0.041000,30,6,0,NULL,NULL),(542,1,544,0.041000,30,6,0,NULL,NULL),(543,1,545,0.041000,30,6,0,NULL,NULL),(544,1,546,0.041000,30,6,0,NULL,NULL),(545,1,547,0.041000,30,6,0,NULL,NULL),(546,1,548,0.041000,30,6,0,NULL,NULL),(547,1,549,0.041000,30,6,0,NULL,NULL),(548,1,550,0.041000,30,6,0,NULL,NULL),(549,1,551,0.041000,30,6,0,NULL,NULL),(550,1,552,0.041000,30,6,0,NULL,NULL),(551,1,553,0.041000,30,6,0,NULL,NULL),(552,1,554,0.041000,30,6,0,NULL,NULL),(553,1,555,0.041000,30,6,0,NULL,NULL),(554,1,556,0.041000,30,6,0,NULL,NULL),(555,1,557,0.041000,30,6,0,NULL,NULL),(556,1,558,0.041000,30,6,0,NULL,NULL),(557,1,559,0.041000,30,6,0,NULL,NULL),(558,1,560,0.041000,30,6,0,NULL,NULL),(559,1,561,0.041000,30,6,0,NULL,NULL),(560,1,562,0.041000,30,6,0,NULL,NULL),(561,1,3,0.041000,30,6,0,NULL,NULL),(562,1,563,0.041000,30,6,0,NULL,NULL),(563,1,564,0.041000,30,6,0,NULL,NULL),(564,1,565,0.041000,30,6,0,NULL,NULL),(565,1,566,0.041000,30,6,0,NULL,NULL),(566,1,567,0.041000,30,6,0,NULL,NULL),(567,1,568,0.041000,30,6,0,NULL,NULL),(568,1,569,0.041000,30,6,0,NULL,NULL),(569,1,570,0.041000,30,6,0,NULL,NULL),(570,1,571,0.041000,30,6,0,NULL,NULL),(571,1,572,0.041000,30,6,0,NULL,NULL),(572,1,573,0.041000,30,6,0,NULL,NULL),(573,1,574,0.041000,30,6,0,NULL,NULL),(574,1,575,0.041000,30,6,0,NULL,NULL),(575,1,576,0.041000,30,6,0,NULL,NULL),(576,1,577,0.041000,30,6,0,NULL,NULL),(577,1,578,0.041000,30,6,0,NULL,NULL),(578,1,579,0.041000,30,6,0,NULL,NULL),(579,1,580,0.041000,30,6,0,NULL,NULL),(580,1,581,0.041000,30,6,0,NULL,NULL),(581,1,582,0.041000,30,6,0,NULL,NULL),(582,1,583,0.041000,30,6,0,NULL,NULL),(583,1,584,0.041000,30,6,0,NULL,NULL),(584,1,585,0.041000,30,6,0,NULL,NULL),(585,1,586,0.041000,30,6,0,NULL,NULL),(586,1,587,0.041000,30,6,0,NULL,NULL),(587,1,588,0.041000,30,6,0,NULL,NULL),(588,1,589,0.041000,30,6,0,NULL,NULL),(589,1,590,0.041000,30,6,0,NULL,NULL),(590,1,591,0.041000,30,6,0,NULL,NULL),(591,1,592,0.041000,30,6,0,NULL,NULL),(592,1,593,0.041000,30,6,0,NULL,NULL),(593,1,594,0.041000,30,6,0,NULL,NULL),(594,1,595,0.041000,30,6,0,NULL,NULL),(595,1,596,0.041000,30,6,0,NULL,NULL),(596,1,28,0.041000,30,6,0,NULL,NULL),(597,1,597,0.041000,30,6,0,NULL,NULL),(598,1,598,0.041000,30,6,0,NULL,NULL),(599,1,599,0.041000,30,6,0,NULL,NULL),(600,1,600,0.041000,30,6,0,NULL,NULL),(601,1,601,0.041000,30,6,0,NULL,NULL),(602,1,602,0.041000,30,6,0,NULL,NULL),(603,1,603,0.041000,30,6,0,NULL,NULL),(604,1,604,0.041000,30,6,0,NULL,NULL),(605,1,605,0.041000,30,6,0,NULL,NULL),(606,1,606,0.041000,30,6,0,NULL,NULL),(607,1,607,0.041000,30,6,0,NULL,NULL),(608,1,608,0.041000,30,6,0,NULL,NULL),(609,1,609,0.041000,30,6,0,NULL,NULL),(610,1,610,0.041000,30,6,0,NULL,NULL),(611,1,611,0.041000,30,6,0,NULL,NULL),(612,1,612,0.041000,30,6,0,NULL,NULL),(613,1,613,0.041000,30,6,0,NULL,NULL),(614,1,614,0.041000,30,6,0,NULL,NULL),(615,1,615,0.041000,30,6,0,NULL,NULL),(616,1,616,0.041000,30,6,0,NULL,NULL),(617,1,617,0.041000,30,6,0,NULL,NULL),(618,1,618,0.041000,30,6,0,NULL,NULL),(619,1,619,0.041000,30,6,0,NULL,NULL),(620,1,620,0.041000,30,6,0,NULL,NULL),(621,1,621,0.041000,30,6,0,NULL,NULL),(622,1,622,0.041000,30,6,0,NULL,NULL),(623,1,623,0.041000,30,6,0,NULL,NULL),(624,1,624,0.041000,30,6,0,NULL,NULL),(625,1,625,0.041000,30,6,0,NULL,NULL),(626,1,626,0.041000,30,6,0,NULL,NULL),(627,1,627,0.041000,30,6,0,NULL,NULL),(628,1,628,0.041000,30,6,0,NULL,NULL),(629,1,629,0.041000,30,6,0,NULL,NULL),(630,1,630,0.041000,30,6,0,NULL,NULL),(631,1,631,0.041000,30,6,0,NULL,NULL),(632,1,632,0.041000,30,6,0,NULL,NULL),(633,1,633,0.041000,30,6,0,NULL,NULL),(1024,2,2,0.045000,30,6,0,NULL,NULL),(1025,2,3,0.045000,30,6,0,NULL,NULL),(1026,2,4,0.045000,30,6,0,NULL,NULL),(1027,2,5,0.045000,30,6,0,NULL,NULL),(1028,2,6,0.045000,30,6,0,NULL,NULL),(1029,2,7,0.045000,30,6,0,NULL,NULL),(1030,2,8,0.045000,30,6,0,NULL,NULL),(1031,2,9,0.045000,30,6,0,NULL,NULL),(1032,2,10,0.045000,30,6,0,NULL,NULL),(1033,2,11,0.045000,30,6,0,NULL,NULL),(1034,2,12,0.045000,30,6,0,NULL,NULL),(1035,2,13,0.045000,30,6,0,NULL,NULL),(1036,2,14,0.045000,30,6,0,NULL,NULL),(1037,2,15,0.045000,30,6,0,NULL,NULL),(1038,2,16,0.045000,30,6,0,NULL,NULL),(1039,2,17,0.045000,30,6,0,NULL,NULL),(1040,2,18,0.045000,30,6,0,NULL,NULL),(1041,2,19,0.045000,30,6,0,NULL,NULL),(1042,2,20,0.045000,30,6,0,NULL,NULL),(1043,2,21,0.045000,30,6,0,NULL,NULL),(1044,2,22,0.045000,30,6,0,NULL,NULL),(1045,2,23,0.045000,30,6,0,NULL,NULL),(1046,2,24,0.045000,30,6,0,NULL,NULL),(1047,2,25,0.045000,30,6,0,NULL,NULL),(1048,2,26,0.045000,30,6,0,NULL,NULL),(1049,2,27,0.045000,30,6,0,NULL,NULL),(1050,2,28,0.045000,30,6,0,NULL,NULL),(1051,2,29,0.045000,30,6,0,NULL,NULL),(1052,2,30,0.045000,30,6,0,NULL,NULL),(1053,2,31,0.045000,30,6,0,NULL,NULL),(1054,2,32,0.045000,30,6,0,NULL,NULL),(1055,2,33,0.045000,30,6,0,NULL,NULL),(1056,2,34,0.045000,30,6,0,NULL,NULL),(1057,2,35,0.045000,30,6,0,NULL,NULL),(1058,2,36,0.045000,30,6,0,NULL,NULL),(1059,2,37,0.045000,30,6,0,NULL,NULL),(1060,2,38,0.045000,30,6,0,NULL,NULL),(1061,2,39,0.045000,30,6,0,NULL,NULL),(1062,2,40,0.045000,30,6,0,NULL,NULL),(1063,2,41,0.045000,30,6,0,NULL,NULL),(1064,2,42,0.045000,30,6,0,NULL,NULL),(1065,2,43,0.045000,30,6,0,NULL,NULL),(1066,2,44,0.045000,30,6,0,NULL,NULL),(1067,2,45,0.045000,30,6,0,NULL,NULL),(1068,2,46,0.045000,30,6,0,NULL,NULL),(1069,2,47,0.045000,30,6,0,NULL,NULL),(1070,2,48,0.045000,30,6,0,NULL,NULL),(1071,2,49,0.045000,30,6,0,NULL,NULL),(1072,2,50,0.045000,30,6,0,NULL,NULL),(1073,2,51,0.045000,30,6,0,NULL,NULL),(1074,2,52,0.045000,30,6,0,NULL,NULL),(1075,2,53,0.045000,30,6,0,NULL,NULL),(1076,2,54,0.045000,30,6,0,NULL,NULL),(1077,2,55,0.045000,30,6,0,NULL,NULL),(1078,2,56,0.045000,30,6,0,NULL,NULL),(1079,2,57,0.045000,30,6,0,NULL,NULL),(1080,2,58,0.045000,30,6,0,NULL,NULL),(1081,2,59,0.045000,30,6,0,NULL,NULL),(1082,2,60,0.045000,30,6,0,NULL,NULL),(1083,2,61,0.045000,30,6,0,NULL,NULL),(1084,2,62,0.045000,30,6,0,NULL,NULL),(1085,2,63,0.045000,30,6,0,NULL,NULL),(1086,2,64,0.045000,30,6,0,NULL,NULL),(1087,2,65,0.045000,30,6,0,NULL,NULL),(1088,2,66,0.045000,30,6,0,NULL,NULL),(1089,2,67,0.045000,30,6,0,NULL,NULL),(1090,2,68,0.045000,30,6,0,NULL,NULL),(1091,2,69,0.045000,30,6,0,NULL,NULL),(1092,2,70,0.045000,30,6,0,NULL,NULL),(1093,2,71,0.045000,30,6,0,NULL,NULL),(1094,2,72,0.045000,30,6,0,NULL,NULL),(1095,2,73,0.045000,30,6,0,NULL,NULL),(1096,2,74,0.045000,30,6,0,NULL,NULL),(1097,2,75,0.045000,30,6,0,NULL,NULL),(1098,2,76,0.045000,30,6,0,NULL,NULL),(1099,2,77,0.045000,30,6,0,NULL,NULL),(1100,2,78,0.045000,30,6,0,NULL,NULL),(1101,2,79,0.045000,30,6,0,NULL,NULL),(1102,2,80,0.045000,30,6,0,NULL,NULL),(1103,2,81,0.045000,30,6,0,NULL,NULL),(1104,2,82,0.045000,30,6,0,NULL,NULL),(1105,2,83,0.045000,30,6,0,NULL,NULL),(1106,2,84,0.045000,30,6,0,NULL,NULL),(1107,2,85,0.045000,30,6,0,NULL,NULL),(1108,2,86,0.045000,30,6,0,NULL,NULL),(1109,2,87,0.045000,30,6,0,NULL,NULL),(1110,2,88,0.045000,30,6,0,NULL,NULL),(1111,2,89,0.045000,30,6,0,NULL,NULL),(1112,2,90,0.045000,30,6,0,NULL,NULL),(1113,2,91,0.045000,30,6,0,NULL,NULL),(1114,2,92,0.045000,30,6,0,NULL,NULL),(1115,2,93,0.045000,30,6,0,NULL,NULL),(1116,2,94,0.045000,30,6,0,NULL,NULL),(1117,2,95,0.045000,30,6,0,NULL,NULL),(1118,2,96,0.045000,30,6,0,NULL,NULL),(1119,2,97,0.045000,30,6,0,NULL,NULL),(1120,2,98,0.045000,30,6,0,NULL,NULL),(1121,2,99,0.045000,30,6,0,NULL,NULL),(1122,2,100,0.045000,30,6,0,NULL,NULL),(1123,2,101,0.045000,30,6,0,NULL,NULL),(1124,2,102,0.045000,30,6,0,NULL,NULL),(1125,2,103,0.045000,30,6,0,NULL,NULL),(1126,2,104,0.045000,30,6,0,NULL,NULL),(1127,2,105,0.045000,30,6,0,NULL,NULL),(1128,2,106,0.045000,30,6,0,NULL,NULL),(1129,2,107,0.045000,30,6,0,NULL,NULL),(1130,2,108,0.045000,30,6,0,NULL,NULL),(1131,2,109,0.045000,30,6,0,NULL,NULL),(1132,2,110,0.045000,30,6,0,NULL,NULL),(1133,2,111,0.045000,30,6,0,NULL,NULL),(1134,2,112,0.045000,30,6,0,NULL,NULL),(1135,2,113,0.045000,30,6,0,NULL,NULL),(1136,2,114,0.045000,30,6,0,NULL,NULL),(1137,2,115,0.045000,30,6,0,NULL,NULL),(1138,2,116,0.045000,30,6,0,NULL,NULL),(1139,2,117,0.045000,30,6,0,NULL,NULL),(1140,2,118,0.045000,30,6,0,NULL,NULL),(1141,2,119,0.045000,30,6,0,NULL,NULL),(1142,2,120,0.045000,30,6,0,NULL,NULL),(1143,2,121,0.045000,30,6,0,NULL,NULL),(1144,2,122,0.045000,30,6,0,NULL,NULL),(1145,2,123,0.045000,30,6,0,NULL,NULL),(1146,2,124,0.045000,30,6,0,NULL,NULL),(1147,2,125,0.045000,30,6,0,NULL,NULL),(1148,2,126,0.045000,30,6,0,NULL,NULL),(1149,2,127,0.045000,30,6,0,NULL,NULL),(1150,2,128,0.045000,30,6,0,NULL,NULL),(1151,2,129,0.045000,30,6,0,NULL,NULL),(1152,2,130,0.045000,30,6,0,NULL,NULL),(1153,2,131,0.045000,30,6,0,NULL,NULL),(1154,2,132,0.045000,30,6,0,NULL,NULL),(1155,2,133,0.045000,30,6,0,NULL,NULL),(1156,2,134,0.045000,30,6,0,NULL,NULL),(1157,2,135,0.045000,30,6,0,NULL,NULL),(1158,2,136,0.045000,30,6,0,NULL,NULL),(1159,2,137,0.045000,30,6,0,NULL,NULL),(1160,2,138,0.045000,30,6,0,NULL,NULL),(1161,2,139,0.045000,30,6,0,NULL,NULL),(1162,2,140,0.045000,30,6,0,NULL,NULL),(1163,2,141,0.045000,30,6,0,NULL,NULL),(1164,2,142,0.045000,30,6,0,NULL,NULL),(1165,2,143,0.045000,30,6,0,NULL,NULL),(1166,2,144,0.045000,30,6,0,NULL,NULL),(1167,2,145,0.045000,30,6,0,NULL,NULL),(1168,2,146,0.045000,30,6,0,NULL,NULL),(1169,2,147,0.045000,30,6,0,NULL,NULL),(1170,2,148,0.045000,30,6,0,NULL,NULL),(1171,2,149,0.045000,30,6,0,NULL,NULL),(1172,2,150,0.045000,30,6,0,NULL,NULL),(1173,2,151,0.045000,30,6,0,NULL,NULL),(1174,2,152,0.045000,30,6,0,NULL,NULL),(1175,2,153,0.045000,30,6,0,NULL,NULL),(1176,2,154,0.045000,30,6,0,NULL,NULL),(1177,2,155,0.045000,30,6,0,NULL,NULL),(1178,2,156,0.045000,30,6,0,NULL,NULL),(1179,2,157,0.045000,30,6,0,NULL,NULL),(1180,2,158,0.045000,30,6,0,NULL,NULL),(1181,2,159,0.045000,30,6,0,NULL,NULL),(1182,2,160,0.045000,30,6,0,NULL,NULL),(1183,2,161,0.045000,30,6,0,NULL,NULL),(1184,2,162,0.045000,30,6,0,NULL,NULL),(1185,2,163,0.045000,30,6,0,NULL,NULL),(1186,2,164,0.045000,30,6,0,NULL,NULL),(1187,2,165,0.045000,30,6,0,NULL,NULL),(1188,2,166,0.045000,30,6,0,NULL,NULL),(1189,2,167,0.045000,30,6,0,NULL,NULL),(1190,2,168,0.045000,30,6,0,NULL,NULL),(1191,2,169,0.045000,30,6,0,NULL,NULL),(1192,2,170,0.045000,30,6,0,NULL,NULL),(1193,2,171,0.045000,30,6,0,NULL,NULL),(1194,2,172,0.045000,30,6,0,NULL,NULL),(1195,2,173,0.045000,30,6,0,NULL,NULL),(1196,2,174,0.045000,30,6,0,NULL,NULL),(1197,2,175,0.045000,30,6,0,NULL,NULL),(1198,2,176,0.045000,30,6,0,NULL,NULL),(1199,2,177,0.045000,30,6,0,NULL,NULL),(1200,2,178,0.045000,30,6,0,NULL,NULL),(1201,2,179,0.045000,30,6,0,NULL,NULL),(1202,2,180,0.045000,30,6,0,NULL,NULL),(1203,2,181,0.045000,30,6,0,NULL,NULL),(1204,2,182,0.045000,30,6,0,NULL,NULL),(1205,2,183,0.045000,30,6,0,NULL,NULL),(1206,2,184,0.045000,30,6,0,NULL,NULL),(1207,2,185,0.045000,30,6,0,NULL,NULL),(1208,2,186,0.045000,30,6,0,NULL,NULL),(1209,2,187,0.045000,30,6,0,NULL,NULL),(1210,2,188,0.045000,30,6,0,NULL,NULL),(1211,2,189,0.045000,30,6,0,NULL,NULL),(1212,2,190,0.045000,30,6,0,NULL,NULL),(1213,2,191,0.045000,30,6,0,NULL,NULL),(1214,2,192,0.045000,30,6,0,NULL,NULL),(1215,2,193,0.045000,30,6,0,NULL,NULL),(1216,2,194,0.045000,30,6,0,NULL,NULL),(1217,2,195,0.045000,30,6,0,NULL,NULL),(1218,2,196,0.045000,30,6,0,NULL,NULL),(1219,2,197,0.045000,30,6,0,NULL,NULL),(1220,2,198,0.045000,30,6,0,NULL,NULL),(1221,2,199,0.045000,30,6,0,NULL,NULL),(1222,2,200,0.045000,30,6,0,NULL,NULL),(1223,2,201,0.045000,30,6,0,NULL,NULL),(1224,2,202,0.045000,30,6,0,NULL,NULL),(1225,2,203,0.045000,30,6,0,NULL,NULL),(1226,2,204,0.045000,30,6,0,NULL,NULL),(1227,2,205,0.045000,30,6,0,NULL,NULL),(1228,2,206,0.045000,30,6,0,NULL,NULL),(1229,2,207,0.045000,30,6,0,NULL,NULL),(1230,2,208,0.045000,30,6,0,NULL,NULL),(1231,2,209,0.045000,30,6,0,NULL,NULL),(1232,2,210,0.045000,30,6,0,NULL,NULL),(1233,2,211,0.045000,30,6,0,NULL,NULL),(1234,2,212,0.045000,30,6,0,NULL,NULL),(1235,2,213,0.045000,30,6,0,NULL,NULL),(1236,2,214,0.045000,30,6,0,NULL,NULL),(1237,2,215,0.045000,30,6,0,NULL,NULL),(1238,2,216,0.045000,30,6,0,NULL,NULL),(1239,2,217,0.045000,30,6,0,NULL,NULL),(1240,2,218,0.045000,30,6,0,NULL,NULL),(1241,2,219,0.045000,30,6,0,NULL,NULL),(1242,2,220,0.045000,30,6,0,NULL,NULL),(1243,2,221,0.045000,30,6,0,NULL,NULL),(1244,2,222,0.045000,30,6,0,NULL,NULL),(1245,2,223,0.045000,30,6,0,NULL,NULL),(1246,2,224,0.045000,30,6,0,NULL,NULL),(1247,2,225,0.045000,30,6,0,NULL,NULL),(1248,2,226,0.045000,30,6,0,NULL,NULL),(1249,2,227,0.045000,30,6,0,NULL,NULL),(1250,2,228,0.045000,30,6,0,NULL,NULL),(1251,2,229,0.045000,30,6,0,NULL,NULL),(1252,2,230,0.045000,30,6,0,NULL,NULL),(1253,2,231,0.045000,30,6,0,NULL,NULL),(1254,2,232,0.045000,30,6,0,NULL,NULL),(1255,2,233,0.045000,30,6,0,NULL,NULL),(1256,2,234,0.045000,30,6,0,NULL,NULL),(1257,2,235,0.045000,30,6,0,NULL,NULL),(1258,2,236,0.045000,30,6,0,NULL,NULL),(1259,2,237,0.045000,30,6,0,NULL,NULL),(1260,2,238,0.045000,30,6,0,NULL,NULL),(1261,2,239,0.045000,30,6,0,NULL,NULL),(1262,2,240,0.045000,30,6,0,NULL,NULL),(1263,2,241,0.045000,30,6,0,NULL,NULL),(1264,2,242,0.045000,30,6,0,NULL,NULL),(1265,2,243,0.045000,30,6,0,NULL,NULL),(1266,2,244,0.045000,30,6,0,NULL,NULL),(1267,2,245,0.045000,30,6,0,NULL,NULL),(1268,2,246,0.045000,30,6,0,NULL,NULL),(1269,2,247,0.045000,30,6,0,NULL,NULL),(1270,2,248,0.045000,30,6,0,NULL,NULL),(1271,2,249,0.045000,30,6,0,NULL,NULL),(1272,2,250,0.045000,30,6,0,NULL,NULL),(1273,2,251,0.045000,30,6,0,NULL,NULL),(1274,2,252,0.045000,30,6,0,NULL,NULL),(1275,2,253,0.045000,30,6,0,NULL,NULL),(1276,2,254,0.045000,30,6,0,NULL,NULL),(1277,2,255,0.045000,30,6,0,NULL,NULL),(1278,2,256,0.045000,30,6,0,NULL,NULL),(1279,2,257,0.045000,30,6,0,NULL,NULL),(1280,2,258,0.045000,30,6,0,NULL,NULL),(1281,2,259,0.045000,30,6,0,NULL,NULL),(1282,2,260,0.045000,30,6,0,NULL,NULL),(1283,2,261,0.045000,30,6,0,NULL,NULL),(1284,2,262,0.045000,30,6,0,NULL,NULL),(1285,2,263,0.045000,30,6,0,NULL,NULL),(1286,2,264,0.045000,30,6,0,NULL,NULL),(1287,2,265,0.045000,30,6,0,NULL,NULL),(1288,2,266,0.045000,30,6,0,NULL,NULL),(1289,2,267,0.045000,30,6,0,NULL,NULL),(1290,2,268,0.045000,30,6,0,NULL,NULL),(1291,2,269,0.045000,30,6,0,NULL,NULL),(1292,2,270,0.045000,30,6,0,NULL,NULL),(1293,2,271,0.045000,30,6,0,NULL,NULL),(1294,2,272,0.045000,30,6,0,NULL,NULL),(1295,2,273,0.045000,30,6,0,NULL,NULL),(1296,2,274,0.045000,30,6,0,NULL,NULL),(1297,2,275,0.045000,30,6,0,NULL,NULL),(1298,2,276,0.045000,30,6,0,NULL,NULL),(1299,2,277,0.045000,30,6,0,NULL,NULL),(1300,2,278,0.045000,30,6,0,NULL,NULL),(1301,2,279,0.045000,30,6,0,NULL,NULL),(1302,2,280,0.045000,30,6,0,NULL,NULL),(1303,2,281,0.045000,30,6,0,NULL,NULL),(1304,2,282,0.045000,30,6,0,NULL,NULL),(1305,2,283,0.045000,30,6,0,NULL,NULL),(1306,2,284,0.045000,30,6,0,NULL,NULL),(1307,2,285,0.045000,30,6,0,NULL,NULL),(1308,2,286,0.045000,30,6,0,NULL,NULL),(1309,2,287,0.045000,30,6,0,NULL,NULL),(1310,2,288,0.045000,30,6,0,NULL,NULL),(1311,2,289,0.045000,30,6,0,NULL,NULL),(1312,2,290,0.045000,30,6,0,NULL,NULL),(1313,2,291,0.045000,30,6,0,NULL,NULL),(1314,2,292,0.045000,30,6,0,NULL,NULL),(1315,2,293,0.045000,30,6,0,NULL,NULL),(1316,2,294,0.045000,30,6,0,NULL,NULL),(1317,2,295,0.045000,30,6,0,NULL,NULL),(1318,2,296,0.045000,30,6,0,NULL,NULL),(1319,2,297,0.045000,30,6,0,NULL,NULL),(1320,2,298,0.045000,30,6,0,NULL,NULL),(1321,2,299,0.045000,30,6,0,NULL,NULL),(1322,2,300,0.045000,30,6,0,NULL,NULL),(1323,2,301,0.045000,30,6,0,NULL,NULL),(1324,2,302,0.045000,30,6,0,NULL,NULL),(1325,2,303,0.045000,30,6,0,NULL,NULL),(1326,2,304,0.045000,30,6,0,NULL,NULL),(1327,2,305,0.045000,30,6,0,NULL,NULL),(1328,2,306,0.045000,30,6,0,NULL,NULL),(1329,2,307,0.045000,30,6,0,NULL,NULL),(1330,2,308,0.045000,30,6,0,NULL,NULL),(1331,2,309,0.045000,30,6,0,NULL,NULL),(1332,2,310,0.045000,30,6,0,NULL,NULL),(1333,2,311,0.045000,30,6,0,NULL,NULL),(1334,2,312,0.045000,30,6,0,NULL,NULL),(1335,2,313,0.045000,30,6,0,NULL,NULL),(1336,2,314,0.045000,30,6,0,NULL,NULL),(1337,2,315,0.045000,30,6,0,NULL,NULL),(1338,2,316,0.045000,30,6,0,NULL,NULL),(1339,2,317,0.045000,30,6,0,NULL,NULL),(1340,2,318,0.045000,30,6,0,NULL,NULL),(1341,2,319,0.045000,30,6,0,NULL,NULL),(1342,2,320,0.045000,30,6,0,NULL,NULL),(1343,2,321,0.045000,30,6,0,NULL,NULL),(1344,2,322,0.045000,30,6,0,NULL,NULL),(1345,2,323,0.045000,30,6,0,NULL,NULL),(1346,2,324,0.045000,30,6,0,NULL,NULL),(1347,2,325,0.045000,30,6,0,NULL,NULL),(1348,2,326,0.045000,30,6,0,NULL,NULL),(1349,2,327,0.045000,30,6,0,NULL,NULL),(1350,2,328,0.045000,30,6,0,NULL,NULL),(1351,2,329,0.045000,30,6,0,NULL,NULL),(1352,2,330,0.045000,30,6,0,NULL,NULL),(1353,2,331,0.045000,30,6,0,NULL,NULL),(1354,2,332,0.045000,30,6,0,NULL,NULL),(1355,2,333,0.045000,30,6,0,NULL,NULL),(1356,2,334,0.045000,30,6,0,NULL,NULL),(1357,2,335,0.045000,30,6,0,NULL,NULL),(1358,2,336,0.045000,30,6,0,NULL,NULL),(1359,2,337,0.045000,30,6,0,NULL,NULL),(1360,2,338,0.045000,30,6,0,NULL,NULL),(1361,2,339,0.045000,30,6,0,NULL,NULL),(1362,2,340,0.045000,30,6,0,NULL,NULL),(1363,2,341,0.045000,30,6,0,NULL,NULL),(1364,2,342,0.045000,30,6,0,NULL,NULL),(1365,2,343,0.045000,30,6,0,NULL,NULL),(1366,2,344,0.045000,30,6,0,NULL,NULL),(1367,2,345,0.045000,30,6,0,NULL,NULL),(1368,2,346,0.045000,30,6,0,NULL,NULL),(1369,2,347,0.045000,30,6,0,NULL,NULL),(1370,2,348,0.045000,30,6,0,NULL,NULL),(1371,2,349,0.045000,30,6,0,NULL,NULL),(1372,2,350,0.045000,30,6,0,NULL,NULL),(1373,2,351,0.045000,30,6,0,NULL,NULL),(1374,2,352,0.045000,30,6,0,NULL,NULL),(1375,2,353,0.045000,30,6,0,NULL,NULL),(1376,2,354,0.045000,30,6,0,NULL,NULL),(1377,2,355,0.045000,30,6,0,NULL,NULL),(1378,2,356,0.045000,30,6,0,NULL,NULL),(1379,2,357,0.045000,30,6,0,NULL,NULL),(1380,2,358,0.045000,30,6,0,NULL,NULL),(1381,2,359,0.045000,30,6,0,NULL,NULL),(1382,2,360,0.045000,30,6,0,NULL,NULL),(1383,2,361,0.045000,30,6,0,NULL,NULL),(1384,2,362,0.045000,30,6,0,NULL,NULL),(1385,2,363,0.045000,30,6,0,NULL,NULL),(1386,2,364,0.045000,30,6,0,NULL,NULL),(1387,2,365,0.045000,30,6,0,NULL,NULL),(1388,2,366,0.045000,30,6,0,NULL,NULL),(1389,2,367,0.045000,30,6,0,NULL,NULL),(1390,2,368,0.045000,30,6,0,NULL,NULL),(1391,2,369,0.045000,30,6,0,NULL,NULL),(1392,2,370,0.045000,30,6,0,NULL,NULL),(1393,2,371,0.045000,30,6,0,NULL,NULL),(1394,2,372,0.045000,30,6,0,NULL,NULL),(1395,2,373,0.045000,30,6,0,NULL,NULL),(1396,2,374,0.045000,30,6,0,NULL,NULL),(1397,2,375,0.045000,30,6,0,NULL,NULL),(1398,2,376,0.045000,30,6,0,NULL,NULL),(1399,2,377,0.045000,30,6,0,NULL,NULL),(1400,2,378,0.045000,30,6,0,NULL,NULL),(1401,2,379,0.045000,30,6,0,NULL,NULL),(1402,2,380,0.045000,30,6,0,NULL,NULL),(1403,2,381,0.045000,30,6,0,NULL,NULL),(1404,2,382,0.045000,30,6,0,NULL,NULL),(1405,2,383,0.045000,30,6,0,NULL,NULL),(1406,2,384,0.045000,30,6,0,NULL,NULL),(1407,2,385,0.045000,30,6,0,NULL,NULL),(1408,2,386,0.045000,30,6,0,NULL,NULL),(1409,2,387,0.045000,30,6,0,NULL,NULL),(1410,2,388,0.045000,30,6,0,NULL,NULL),(1411,2,389,0.045000,30,6,0,NULL,NULL),(1412,2,390,0.045000,30,6,0,NULL,NULL),(1413,2,391,0.045000,30,6,0,NULL,NULL),(1414,2,392,0.045000,30,6,0,NULL,NULL),(1415,2,393,0.045000,30,6,0,NULL,NULL),(1416,2,394,0.045000,30,6,0,NULL,NULL),(1417,2,395,0.045000,30,6,0,NULL,NULL),(1418,2,396,0.045000,30,6,0,NULL,NULL),(1419,2,397,0.045000,30,6,0,NULL,NULL),(1420,2,398,0.045000,30,6,0,NULL,NULL),(1421,2,399,0.045000,30,6,0,NULL,NULL),(1422,2,400,0.045000,30,6,0,NULL,NULL),(1423,2,401,0.045000,30,6,0,NULL,NULL),(1424,2,402,0.045000,30,6,0,NULL,NULL),(1425,2,403,0.045000,30,6,0,NULL,NULL),(1426,2,404,0.045000,30,6,0,NULL,NULL),(1427,2,405,0.045000,30,6,0,NULL,NULL),(1428,2,406,0.045000,30,6,0,NULL,NULL),(1429,2,407,0.045000,30,6,0,NULL,NULL),(1430,2,408,0.045000,30,6,0,NULL,NULL),(1431,2,409,0.045000,30,6,0,NULL,NULL),(1432,2,410,0.045000,30,6,0,NULL,NULL),(1433,2,411,0.045000,30,6,0,NULL,NULL),(1434,2,412,0.045000,30,6,0,NULL,NULL),(1435,2,413,0.045000,30,6,0,NULL,NULL),(1436,2,414,0.045000,30,6,0,NULL,NULL),(1437,2,415,0.045000,30,6,0,NULL,NULL),(1438,2,416,0.045000,30,6,0,NULL,NULL),(1439,2,417,0.045000,30,6,0,NULL,NULL),(1440,2,418,0.045000,30,6,0,NULL,NULL),(1441,2,419,0.045000,30,6,0,NULL,NULL),(1442,2,420,0.045000,30,6,0,NULL,NULL),(1443,2,421,0.045000,30,6,0,NULL,NULL),(1444,2,422,0.045000,30,6,0,NULL,NULL),(1445,2,423,0.045000,30,6,0,NULL,NULL),(1446,2,424,0.045000,30,6,0,NULL,NULL),(1447,2,425,0.045000,30,6,0,NULL,NULL),(1448,2,426,0.045000,30,6,0,NULL,NULL),(1449,2,427,0.045000,30,6,0,NULL,NULL),(1450,2,428,0.045000,30,6,0,NULL,NULL),(1451,2,429,0.045000,30,6,0,NULL,NULL),(1452,2,430,0.045000,30,6,0,NULL,NULL),(1453,2,431,0.045000,30,6,0,NULL,NULL),(1454,2,432,0.045000,30,6,0,NULL,NULL),(1455,2,433,0.045000,30,6,0,NULL,NULL),(1456,2,434,0.045000,30,6,0,NULL,NULL),(1457,2,435,0.045000,30,6,0,NULL,NULL),(1458,2,436,0.045000,30,6,0,NULL,NULL),(1459,2,437,0.045000,30,6,0,NULL,NULL),(1460,2,438,0.045000,30,6,0,NULL,NULL),(1461,2,439,0.045000,30,6,0,NULL,NULL),(1462,2,440,0.045000,30,6,0,NULL,NULL),(1463,2,441,0.045000,30,6,0,NULL,NULL),(1464,2,442,0.045000,30,6,0,NULL,NULL),(1465,2,443,0.045000,30,6,0,NULL,NULL),(1466,2,444,0.045000,30,6,0,NULL,NULL),(1467,2,445,0.045000,30,6,0,NULL,NULL),(1468,2,446,0.045000,30,6,0,NULL,NULL),(1469,2,447,0.045000,30,6,0,NULL,NULL),(1470,2,448,0.045000,30,6,0,NULL,NULL),(1471,2,449,0.045000,30,6,0,NULL,NULL),(1472,2,450,0.045000,30,6,0,NULL,NULL),(1473,2,451,0.045000,30,6,0,NULL,NULL),(1474,2,452,0.045000,30,6,0,NULL,NULL),(1475,2,453,0.045000,30,6,0,NULL,NULL),(1476,2,454,0.045000,30,6,0,NULL,NULL),(1477,2,455,0.045000,30,6,0,NULL,NULL),(1478,2,456,0.045000,30,6,0,NULL,NULL),(1479,2,457,0.045000,30,6,0,NULL,NULL),(1480,2,458,0.045000,30,6,0,NULL,NULL),(1481,2,459,0.045000,30,6,0,NULL,NULL),(1482,2,460,0.045000,30,6,0,NULL,NULL),(1483,2,461,0.045000,30,6,0,NULL,NULL),(1484,2,462,0.045000,30,6,0,NULL,NULL),(1485,2,463,0.045000,30,6,0,NULL,NULL),(1486,2,464,0.045000,30,6,0,NULL,NULL),(1487,2,465,0.045000,30,6,0,NULL,NULL),(1488,2,466,0.045000,30,6,0,NULL,NULL),(1489,2,467,0.045000,30,6,0,NULL,NULL),(1490,2,468,0.045000,30,6,0,NULL,NULL),(1491,2,469,0.045000,30,6,0,NULL,NULL),(1492,2,470,0.045000,30,6,0,NULL,NULL),(1493,2,471,0.045000,30,6,0,NULL,NULL),(1494,2,472,0.045000,30,6,0,NULL,NULL),(1495,2,473,0.045000,30,6,0,NULL,NULL),(1496,2,474,0.045000,30,6,0,NULL,NULL),(1497,2,475,0.045000,30,6,0,NULL,NULL),(1498,2,476,0.045000,30,6,0,NULL,NULL),(1499,2,477,0.045000,30,6,0,NULL,NULL),(1500,2,478,0.045000,30,6,0,NULL,NULL),(1501,2,479,0.045000,30,6,0,NULL,NULL),(1502,2,480,0.045000,30,6,0,NULL,NULL),(1503,2,481,0.045000,30,6,0,NULL,NULL),(1504,2,482,0.045000,30,6,0,NULL,NULL),(1505,2,483,0.045000,30,6,0,NULL,NULL),(1506,2,484,0.045000,30,6,0,NULL,NULL),(1507,2,485,0.045000,30,6,0,NULL,NULL),(1508,2,486,0.045000,30,6,0,NULL,NULL),(1509,2,487,0.045000,30,6,0,NULL,NULL),(1510,2,488,0.045000,30,6,0,NULL,NULL),(1511,2,490,0.045000,30,6,0,NULL,NULL),(1512,2,491,0.045000,30,6,0,NULL,NULL),(1513,2,492,0.045000,30,6,0,NULL,NULL),(1514,2,493,0.045000,30,6,0,NULL,NULL),(1515,2,494,0.045000,30,6,0,NULL,NULL),(1516,2,495,0.045000,30,6,0,NULL,NULL),(1517,2,496,0.045000,30,6,0,NULL,NULL),(1518,2,497,0.045000,30,6,0,NULL,NULL),(1519,2,498,0.045000,30,6,0,NULL,NULL),(1520,2,499,0.045000,30,6,0,NULL,NULL),(1521,2,500,0.045000,30,6,0,NULL,NULL),(1522,2,501,0.045000,30,6,0,NULL,NULL),(1523,2,502,0.045000,30,6,0,NULL,NULL),(1524,2,503,0.045000,30,6,0,NULL,NULL),(1525,2,504,0.045000,30,6,0,NULL,NULL),(1526,2,505,0.045000,30,6,0,NULL,NULL),(1527,2,506,0.045000,30,6,0,NULL,NULL),(1528,2,507,0.045000,30,6,0,NULL,NULL),(1529,2,508,0.045000,30,6,0,NULL,NULL),(1530,2,509,0.045000,30,6,0,NULL,NULL),(1531,2,510,0.045000,30,6,0,NULL,NULL),(1532,2,511,0.045000,30,6,0,NULL,NULL),(1533,2,512,0.045000,30,6,0,NULL,NULL),(1534,2,513,0.045000,30,6,0,NULL,NULL),(1535,2,514,0.045000,30,6,0,NULL,NULL),(1536,2,515,0.045000,30,6,0,NULL,NULL),(1537,2,516,0.045000,30,6,0,NULL,NULL),(1538,2,517,0.045000,30,6,0,NULL,NULL),(1539,2,518,0.045000,30,6,0,NULL,NULL),(1540,2,519,0.045000,30,6,0,NULL,NULL),(1541,2,520,0.045000,30,6,0,NULL,NULL),(1542,2,521,0.045000,30,6,0,NULL,NULL),(1543,2,522,0.045000,30,6,0,NULL,NULL),(1544,2,523,0.045000,30,6,0,NULL,NULL),(1545,2,524,0.045000,30,6,0,NULL,NULL),(1546,2,525,0.045000,30,6,0,NULL,NULL),(1547,2,526,0.045000,30,6,0,NULL,NULL),(1548,2,527,0.045000,30,6,0,NULL,NULL),(1549,2,528,0.045000,30,6,0,NULL,NULL),(1550,2,529,0.045000,30,6,0,NULL,NULL),(1551,2,530,0.045000,30,6,0,NULL,NULL),(1552,2,531,0.045000,30,6,0,NULL,NULL),(1553,2,532,0.045000,30,6,0,NULL,NULL),(1554,2,533,0.045000,30,6,0,NULL,NULL),(1555,2,534,0.045000,30,6,0,NULL,NULL),(1556,2,535,0.045000,30,6,0,NULL,NULL),(1557,2,536,0.045000,30,6,0,NULL,NULL),(1558,2,537,0.045000,30,6,0,NULL,NULL),(1559,2,538,0.045000,30,6,0,NULL,NULL),(1560,2,539,0.045000,30,6,0,NULL,NULL),(1561,2,540,0.045000,30,6,0,NULL,NULL),(1562,2,541,0.045000,30,6,0,NULL,NULL),(1563,2,542,0.045000,30,6,0,NULL,NULL),(1564,2,543,0.045000,30,6,0,NULL,NULL),(1565,2,544,0.045000,30,6,0,NULL,NULL),(1566,2,545,0.045000,30,6,0,NULL,NULL),(1567,2,546,0.045000,30,6,0,NULL,NULL),(1568,2,547,0.045000,30,6,0,NULL,NULL),(1569,2,548,0.045000,30,6,0,NULL,NULL),(1570,2,549,0.045000,30,6,0,NULL,NULL),(1571,2,550,0.045000,30,6,0,NULL,NULL),(1572,2,551,0.045000,30,6,0,NULL,NULL),(1573,2,552,0.045000,30,6,0,NULL,NULL),(1574,2,553,0.045000,30,6,0,NULL,NULL),(1575,2,554,0.045000,30,6,0,NULL,NULL),(1576,2,555,0.045000,30,6,0,NULL,NULL),(1577,2,556,0.045000,30,6,0,NULL,NULL),(1578,2,557,0.045000,30,6,0,NULL,NULL),(1579,2,558,0.045000,30,6,0,NULL,NULL),(1580,2,559,0.045000,30,6,0,NULL,NULL),(1581,2,560,0.045000,30,6,0,NULL,NULL),(1582,2,561,0.045000,30,6,0,NULL,NULL),(1583,2,562,0.045000,30,6,0,NULL,NULL),(1584,2,3,0.045000,30,6,0,NULL,NULL),(1585,2,563,0.045000,30,6,0,NULL,NULL),(1586,2,564,0.045000,30,6,0,NULL,NULL),(1587,2,565,0.045000,30,6,0,NULL,NULL),(1588,2,566,0.045000,30,6,0,NULL,NULL),(1589,2,567,0.045000,30,6,0,NULL,NULL),(1590,2,568,0.045000,30,6,0,NULL,NULL),(1591,2,569,0.045000,30,6,0,NULL,NULL),(1592,2,570,0.045000,30,6,0,NULL,NULL),(1593,2,571,0.045000,30,6,0,NULL,NULL),(1594,2,572,0.045000,30,6,0,NULL,NULL),(1595,2,573,0.045000,30,6,0,NULL,NULL),(1596,2,574,0.045000,30,6,0,NULL,NULL),(1597,2,575,0.045000,30,6,0,NULL,NULL),(1598,2,576,0.045000,30,6,0,NULL,NULL),(1599,2,577,0.045000,30,6,0,NULL,NULL),(1600,2,578,0.045000,30,6,0,NULL,NULL),(1601,2,579,0.045000,30,6,0,NULL,NULL),(1602,2,580,0.045000,30,6,0,NULL,NULL),(1603,2,581,0.045000,30,6,0,NULL,NULL),(1604,2,582,0.045000,30,6,0,NULL,NULL),(1605,2,583,0.045000,30,6,0,NULL,NULL),(1606,2,584,0.045000,30,6,0,NULL,NULL),(1607,2,585,0.045000,30,6,0,NULL,NULL),(1608,2,586,0.045000,30,6,0,NULL,NULL),(1609,2,587,0.045000,30,6,0,NULL,NULL),(1610,2,588,0.045000,30,6,0,NULL,NULL),(1611,2,589,0.045000,30,6,0,NULL,NULL),(1612,2,590,0.045000,30,6,0,NULL,NULL),(1613,2,591,0.045000,30,6,0,NULL,NULL),(1614,2,592,0.045000,30,6,0,NULL,NULL),(1615,2,593,0.045000,30,6,0,NULL,NULL),(1616,2,594,0.045000,30,6,0,NULL,NULL),(1617,2,595,0.045000,30,6,0,NULL,NULL),(1618,2,596,0.045000,30,6,0,NULL,NULL),(1619,2,28,0.045000,30,6,0,NULL,NULL),(1620,2,597,0.045000,30,6,0,NULL,NULL),(1621,2,598,0.045000,30,6,0,NULL,NULL),(1622,2,599,0.045000,30,6,0,NULL,NULL),(1623,2,600,0.045000,30,6,0,NULL,NULL),(1624,2,601,0.045000,30,6,0,NULL,NULL),(1625,2,602,0.045000,30,6,0,NULL,NULL),(1626,2,603,0.045000,30,6,0,NULL,NULL),(1627,2,604,0.045000,30,6,0,NULL,NULL),(1628,2,605,0.045000,30,6,0,NULL,NULL),(1629,2,606,0.045000,30,6,0,NULL,NULL),(1630,2,607,0.045000,30,6,0,NULL,NULL),(1631,2,608,0.045000,30,6,0,NULL,NULL),(1632,2,609,0.045000,30,6,0,NULL,NULL),(1633,2,610,0.045000,30,6,0,NULL,NULL),(1634,2,611,0.045000,30,6,0,NULL,NULL),(1635,2,612,0.045000,30,6,0,NULL,NULL),(1636,2,613,0.045000,30,6,0,NULL,NULL),(1637,2,614,0.045000,30,6,0,NULL,NULL),(1638,2,615,0.045000,30,6,0,NULL,NULL),(1639,2,616,0.045000,30,6,0,NULL,NULL),(1640,2,617,0.045000,30,6,0,NULL,NULL),(1641,2,618,0.045000,30,6,0,NULL,NULL),(1642,2,619,0.045000,30,6,0,NULL,NULL),(1643,2,620,0.045000,30,6,0,NULL,NULL),(1644,2,621,0.045000,30,6,0,NULL,NULL),(1645,2,622,0.045000,30,6,0,NULL,NULL),(1646,2,623,0.045000,30,6,0,NULL,NULL),(1647,2,624,0.045000,30,6,0,NULL,NULL),(1648,2,625,0.045000,30,6,0,NULL,NULL),(1649,2,626,0.045000,30,6,0,NULL,NULL),(1650,2,627,0.045000,30,6,0,NULL,NULL),(1651,2,628,0.045000,30,6,0,NULL,NULL),(1652,2,629,0.045000,30,6,0,NULL,NULL),(1653,2,630,0.045000,30,6,0,NULL,NULL),(1654,2,631,0.045000,30,6,0,NULL,NULL),(1655,2,632,0.045000,30,6,0,NULL,NULL),(1656,2,633,0.045000,30,6,0,NULL,NULL),(2047,3,2,0.033000,30,6,0,NULL,NULL),(2048,3,3,0.033000,30,6,0,NULL,NULL),(2049,3,4,0.033000,30,6,0,NULL,NULL),(2050,3,5,0.033000,30,6,0,NULL,NULL),(2051,3,6,0.033000,30,6,0,NULL,NULL),(2052,3,7,0.033000,30,6,0,NULL,NULL),(2053,3,8,0.033000,30,6,0,NULL,NULL),(2054,3,9,0.033000,30,6,0,NULL,NULL),(2055,3,10,0.033000,30,6,0,NULL,NULL),(2056,3,11,0.033000,30,6,0,NULL,NULL),(2057,3,12,0.033000,30,6,0,NULL,NULL),(2058,3,13,0.033000,30,6,0,NULL,NULL),(2059,3,14,0.033000,30,6,0,NULL,NULL),(2060,3,15,0.033000,30,6,0,NULL,NULL),(2061,3,16,0.033000,30,6,0,NULL,NULL),(2062,3,17,0.033000,30,6,0,NULL,NULL),(2063,3,18,0.033000,30,6,0,NULL,NULL),(2064,3,19,0.033000,30,6,0,NULL,NULL),(2065,3,20,0.033000,30,6,0,NULL,NULL),(2066,3,21,0.033000,30,6,0,NULL,NULL),(2067,3,22,0.033000,30,6,0,NULL,NULL),(2068,3,23,0.033000,30,6,0,NULL,NULL),(2069,3,24,0.033000,30,6,0,NULL,NULL),(2070,3,25,0.033000,30,6,0,NULL,NULL),(2071,3,26,0.033000,30,6,0,NULL,NULL),(2072,3,27,0.033000,30,6,0,NULL,NULL),(2073,3,28,0.033000,30,6,0,NULL,NULL),(2074,3,29,0.033000,30,6,0,NULL,NULL),(2075,3,30,0.033000,30,6,0,NULL,NULL),(2076,3,31,0.033000,30,6,0,NULL,NULL),(2077,3,32,0.033000,30,6,0,NULL,NULL),(2078,3,33,0.033000,30,6,0,NULL,NULL),(2079,3,34,0.033000,30,6,0,NULL,NULL),(2080,3,35,0.033000,30,6,0,NULL,NULL),(2081,3,36,0.033000,30,6,0,NULL,NULL),(2082,3,37,0.033000,30,6,0,NULL,NULL),(2083,3,38,0.033000,30,6,0,NULL,NULL),(2084,3,39,0.033000,30,6,0,NULL,NULL),(2085,3,40,0.033000,30,6,0,NULL,NULL),(2086,3,41,0.033000,30,6,0,NULL,NULL),(2087,3,42,0.033000,30,6,0,NULL,NULL),(2088,3,43,0.033000,30,6,0,NULL,NULL),(2089,3,44,0.033000,30,6,0,NULL,NULL),(2090,3,45,0.033000,30,6,0,NULL,NULL),(2091,3,46,0.033000,30,6,0,NULL,NULL),(2092,3,47,0.033000,30,6,0,NULL,NULL),(2093,3,48,0.033000,30,6,0,NULL,NULL),(2094,3,49,0.033000,30,6,0,NULL,NULL),(2095,3,50,0.033000,30,6,0,NULL,NULL),(2096,3,51,0.033000,30,6,0,NULL,NULL),(2097,3,52,0.033000,30,6,0,NULL,NULL),(2098,3,53,0.033000,30,6,0,NULL,NULL),(2099,3,54,0.033000,30,6,0,NULL,NULL),(2100,3,55,0.033000,30,6,0,NULL,NULL),(2101,3,56,0.033000,30,6,0,NULL,NULL),(2102,3,57,0.033000,30,6,0,NULL,NULL),(2103,3,58,0.033000,30,6,0,NULL,NULL),(2104,3,59,0.033000,30,6,0,NULL,NULL),(2105,3,60,0.033000,30,6,0,NULL,NULL),(2106,3,61,0.033000,30,6,0,NULL,NULL),(2107,3,62,0.033000,30,6,0,NULL,NULL),(2108,3,63,0.033000,30,6,0,NULL,NULL),(2109,3,64,0.033000,30,6,0,NULL,NULL),(2110,3,65,0.033000,30,6,0,NULL,NULL),(2111,3,66,0.033000,30,6,0,NULL,NULL),(2112,3,67,0.033000,30,6,0,NULL,NULL),(2113,3,68,0.033000,30,6,0,NULL,NULL),(2114,3,69,0.033000,30,6,0,NULL,NULL),(2115,3,70,0.033000,30,6,0,NULL,NULL),(2116,3,71,0.033000,30,6,0,NULL,NULL),(2117,3,72,0.033000,30,6,0,NULL,NULL),(2118,3,73,0.033000,30,6,0,NULL,NULL),(2119,3,74,0.033000,30,6,0,NULL,NULL),(2120,3,75,0.033000,30,6,0,NULL,NULL),(2121,3,76,0.033000,30,6,0,NULL,NULL),(2122,3,77,0.033000,30,6,0,NULL,NULL),(2123,3,78,0.033000,30,6,0,NULL,NULL),(2124,3,79,0.033000,30,6,0,NULL,NULL),(2125,3,80,0.033000,30,6,0,NULL,NULL),(2126,3,81,0.033000,30,6,0,NULL,NULL),(2127,3,82,0.033000,30,6,0,NULL,NULL),(2128,3,83,0.033000,30,6,0,NULL,NULL),(2129,3,84,0.033000,30,6,0,NULL,NULL),(2130,3,85,0.033000,30,6,0,NULL,NULL),(2131,3,86,0.033000,30,6,0,NULL,NULL),(2132,3,87,0.033000,30,6,0,NULL,NULL),(2133,3,88,0.033000,30,6,0,NULL,NULL),(2134,3,89,0.033000,30,6,0,NULL,NULL),(2135,3,90,0.033000,30,6,0,NULL,NULL),(2136,3,91,0.033000,30,6,0,NULL,NULL),(2137,3,92,0.033000,30,6,0,NULL,NULL),(2138,3,93,0.033000,30,6,0,NULL,NULL),(2139,3,94,0.033000,30,6,0,NULL,NULL),(2140,3,95,0.033000,30,6,0,NULL,NULL),(2141,3,96,0.033000,30,6,0,NULL,NULL),(2142,3,97,0.033000,30,6,0,NULL,NULL),(2143,3,98,0.033000,30,6,0,NULL,NULL),(2144,3,99,0.033000,30,6,0,NULL,NULL),(2145,3,100,0.033000,30,6,0,NULL,NULL),(2146,3,101,0.033000,30,6,0,NULL,NULL),(2147,3,102,0.033000,30,6,0,NULL,NULL),(2148,3,103,0.033000,30,6,0,NULL,NULL),(2149,3,104,0.033000,30,6,0,NULL,NULL),(2150,3,105,0.033000,30,6,0,NULL,NULL),(2151,3,106,0.033000,30,6,0,NULL,NULL),(2152,3,107,0.033000,30,6,0,NULL,NULL),(2153,3,108,0.033000,30,6,0,NULL,NULL),(2154,3,109,0.033000,30,6,0,NULL,NULL),(2155,3,110,0.033000,30,6,0,NULL,NULL),(2156,3,111,0.033000,30,6,0,NULL,NULL),(2157,3,112,0.033000,30,6,0,NULL,NULL),(2158,3,113,0.033000,30,6,0,NULL,NULL),(2159,3,114,0.033000,30,6,0,NULL,NULL),(2160,3,115,0.033000,30,6,0,NULL,NULL),(2161,3,116,0.033000,30,6,0,NULL,NULL),(2162,3,117,0.033000,30,6,0,NULL,NULL),(2163,3,118,0.033000,30,6,0,NULL,NULL),(2164,3,119,0.033000,30,6,0,NULL,NULL),(2165,3,120,0.033000,30,6,0,NULL,NULL),(2166,3,121,0.033000,30,6,0,NULL,NULL),(2167,3,122,0.033000,30,6,0,NULL,NULL),(2168,3,123,0.033000,30,6,0,NULL,NULL),(2169,3,124,0.033000,30,6,0,NULL,NULL),(2170,3,125,0.033000,30,6,0,NULL,NULL),(2171,3,126,0.033000,30,6,0,NULL,NULL),(2172,3,127,0.033000,30,6,0,NULL,NULL),(2173,3,128,0.033000,30,6,0,NULL,NULL),(2174,3,129,0.033000,30,6,0,NULL,NULL),(2175,3,130,0.033000,30,6,0,NULL,NULL),(2176,3,131,0.033000,30,6,0,NULL,NULL),(2177,3,132,0.033000,30,6,0,NULL,NULL),(2178,3,133,0.033000,30,6,0,NULL,NULL),(2179,3,134,0.033000,30,6,0,NULL,NULL),(2180,3,135,0.033000,30,6,0,NULL,NULL),(2181,3,136,0.033000,30,6,0,NULL,NULL),(2182,3,137,0.033000,30,6,0,NULL,NULL),(2183,3,138,0.033000,30,6,0,NULL,NULL),(2184,3,139,0.033000,30,6,0,NULL,NULL),(2185,3,140,0.033000,30,6,0,NULL,NULL),(2186,3,141,0.033000,30,6,0,NULL,NULL),(2187,3,142,0.033000,30,6,0,NULL,NULL),(2188,3,143,0.033000,30,6,0,NULL,NULL),(2189,3,144,0.033000,30,6,0,NULL,NULL),(2190,3,145,0.033000,30,6,0,NULL,NULL),(2191,3,146,0.033000,30,6,0,NULL,NULL),(2192,3,147,0.033000,30,6,0,NULL,NULL),(2193,3,148,0.033000,30,6,0,NULL,NULL),(2194,3,149,0.033000,30,6,0,NULL,NULL),(2195,3,150,0.033000,30,6,0,NULL,NULL),(2196,3,151,0.033000,30,6,0,NULL,NULL),(2197,3,152,0.033000,30,6,0,NULL,NULL),(2198,3,153,0.033000,30,6,0,NULL,NULL),(2199,3,154,0.033000,30,6,0,NULL,NULL),(2200,3,155,0.033000,30,6,0,NULL,NULL),(2201,3,156,0.033000,30,6,0,NULL,NULL),(2202,3,157,0.033000,30,6,0,NULL,NULL),(2203,3,158,0.033000,30,6,0,NULL,NULL),(2204,3,159,0.033000,30,6,0,NULL,NULL),(2205,3,160,0.033000,30,6,0,NULL,NULL),(2206,3,161,0.033000,30,6,0,NULL,NULL),(2207,3,162,0.033000,30,6,0,NULL,NULL),(2208,3,163,0.033000,30,6,0,NULL,NULL),(2209,3,164,0.033000,30,6,0,NULL,NULL),(2210,3,165,0.033000,30,6,0,NULL,NULL),(2211,3,166,0.033000,30,6,0,NULL,NULL),(2212,3,167,0.033000,30,6,0,NULL,NULL),(2213,3,168,0.033000,30,6,0,NULL,NULL),(2214,3,169,0.033000,30,6,0,NULL,NULL),(2215,3,170,0.033000,30,6,0,NULL,NULL),(2216,3,171,0.033000,30,6,0,NULL,NULL),(2217,3,172,0.033000,30,6,0,NULL,NULL),(2218,3,173,0.033000,30,6,0,NULL,NULL),(2219,3,174,0.033000,30,6,0,NULL,NULL),(2220,3,175,0.033000,30,6,0,NULL,NULL),(2221,3,176,0.033000,30,6,0,NULL,NULL),(2222,3,177,0.033000,30,6,0,NULL,NULL),(2223,3,178,0.033000,30,6,0,NULL,NULL),(2224,3,179,0.033000,30,6,0,NULL,NULL),(2225,3,180,0.033000,30,6,0,NULL,NULL),(2226,3,181,0.033000,30,6,0,NULL,NULL),(2227,3,182,0.033000,30,6,0,NULL,NULL),(2228,3,183,0.033000,30,6,0,NULL,NULL),(2229,3,184,0.033000,30,6,0,NULL,NULL),(2230,3,185,0.033000,30,6,0,NULL,NULL),(2231,3,186,0.033000,30,6,0,NULL,NULL),(2232,3,187,0.033000,30,6,0,NULL,NULL),(2233,3,188,0.033000,30,6,0,NULL,NULL),(2234,3,189,0.033000,30,6,0,NULL,NULL),(2235,3,190,0.033000,30,6,0,NULL,NULL),(2236,3,191,0.033000,30,6,0,NULL,NULL),(2237,3,192,0.033000,30,6,0,NULL,NULL),(2238,3,193,0.033000,30,6,0,NULL,NULL),(2239,3,194,0.033000,30,6,0,NULL,NULL),(2240,3,195,0.033000,30,6,0,NULL,NULL),(2241,3,196,0.033000,30,6,0,NULL,NULL),(2242,3,197,0.033000,30,6,0,NULL,NULL),(2243,3,198,0.033000,30,6,0,NULL,NULL),(2244,3,199,0.033000,30,6,0,NULL,NULL),(2245,3,200,0.033000,30,6,0,NULL,NULL),(2246,3,201,0.033000,30,6,0,NULL,NULL),(2247,3,202,0.033000,30,6,0,NULL,NULL),(2248,3,203,0.033000,30,6,0,NULL,NULL),(2249,3,204,0.033000,30,6,0,NULL,NULL),(2250,3,205,0.033000,30,6,0,NULL,NULL),(2251,3,206,0.033000,30,6,0,NULL,NULL),(2252,3,207,0.033000,30,6,0,NULL,NULL),(2253,3,208,0.033000,30,6,0,NULL,NULL),(2254,3,209,0.033000,30,6,0,NULL,NULL),(2255,3,210,0.033000,30,6,0,NULL,NULL),(2256,3,211,0.033000,30,6,0,NULL,NULL),(2257,3,212,0.033000,30,6,0,NULL,NULL),(2258,3,213,0.033000,30,6,0,NULL,NULL),(2259,3,214,0.033000,30,6,0,NULL,NULL),(2260,3,215,0.033000,30,6,0,NULL,NULL),(2261,3,216,0.033000,30,6,0,NULL,NULL),(2262,3,217,0.033000,30,6,0,NULL,NULL),(2263,3,218,0.033000,30,6,0,NULL,NULL),(2264,3,219,0.033000,30,6,0,NULL,NULL),(2265,3,220,0.033000,30,6,0,NULL,NULL),(2266,3,221,0.033000,30,6,0,NULL,NULL),(2267,3,222,0.033000,30,6,0,NULL,NULL),(2268,3,223,0.033000,30,6,0,NULL,NULL),(2269,3,224,0.033000,30,6,0,NULL,NULL),(2270,3,225,0.033000,30,6,0,NULL,NULL),(2271,3,226,0.033000,30,6,0,NULL,NULL),(2272,3,227,0.033000,30,6,0,NULL,NULL),(2273,3,228,0.033000,30,6,0,NULL,NULL),(2274,3,229,0.033000,30,6,0,NULL,NULL),(2275,3,230,0.033000,30,6,0,NULL,NULL),(2276,3,231,0.033000,30,6,0,NULL,NULL),(2277,3,232,0.033000,30,6,0,NULL,NULL),(2278,3,233,0.033000,30,6,0,NULL,NULL),(2279,3,234,0.033000,30,6,0,NULL,NULL),(2280,3,235,0.033000,30,6,0,NULL,NULL),(2281,3,236,0.033000,30,6,0,NULL,NULL),(2282,3,237,0.033000,30,6,0,NULL,NULL),(2283,3,238,0.033000,30,6,0,NULL,NULL),(2284,3,239,0.033000,30,6,0,NULL,NULL),(2285,3,240,0.033000,30,6,0,NULL,NULL),(2286,3,241,0.033000,30,6,0,NULL,NULL),(2287,3,242,0.033000,30,6,0,NULL,NULL),(2288,3,243,0.033000,30,6,0,NULL,NULL),(2289,3,244,0.033000,30,6,0,NULL,NULL),(2290,3,245,0.033000,30,6,0,NULL,NULL),(2291,3,246,0.033000,30,6,0,NULL,NULL),(2292,3,247,0.033000,30,6,0,NULL,NULL),(2293,3,248,0.033000,30,6,0,NULL,NULL),(2294,3,249,0.033000,30,6,0,NULL,NULL),(2295,3,250,0.033000,30,6,0,NULL,NULL),(2296,3,251,0.033000,30,6,0,NULL,NULL),(2297,3,252,0.033000,30,6,0,NULL,NULL),(2298,3,253,0.033000,30,6,0,NULL,NULL),(2299,3,254,0.033000,30,6,0,NULL,NULL),(2300,3,255,0.033000,30,6,0,NULL,NULL),(2301,3,256,0.033000,30,6,0,NULL,NULL),(2302,3,257,0.033000,30,6,0,NULL,NULL),(2303,3,258,0.033000,30,6,0,NULL,NULL),(2304,3,259,0.033000,30,6,0,NULL,NULL),(2305,3,260,0.033000,30,6,0,NULL,NULL),(2306,3,261,0.033000,30,6,0,NULL,NULL),(2307,3,262,0.033000,30,6,0,NULL,NULL),(2308,3,263,0.033000,30,6,0,NULL,NULL),(2309,3,264,0.033000,30,6,0,NULL,NULL),(2310,3,265,0.033000,30,6,0,NULL,NULL),(2311,3,266,0.033000,30,6,0,NULL,NULL),(2312,3,267,0.033000,30,6,0,NULL,NULL),(2313,3,268,0.033000,30,6,0,NULL,NULL),(2314,3,269,0.033000,30,6,0,NULL,NULL),(2315,3,270,0.033000,30,6,0,NULL,NULL),(2316,3,271,0.033000,30,6,0,NULL,NULL),(2317,3,272,0.033000,30,6,0,NULL,NULL),(2318,3,273,0.033000,30,6,0,NULL,NULL),(2319,3,274,0.033000,30,6,0,NULL,NULL),(2320,3,275,0.033000,30,6,0,NULL,NULL),(2321,3,276,0.033000,30,6,0,NULL,NULL),(2322,3,277,0.033000,30,6,0,NULL,NULL),(2323,3,278,0.033000,30,6,0,NULL,NULL),(2324,3,279,0.033000,30,6,0,NULL,NULL),(2325,3,280,0.033000,30,6,0,NULL,NULL),(2326,3,281,0.033000,30,6,0,NULL,NULL),(2327,3,282,0.033000,30,6,0,NULL,NULL),(2328,3,283,0.033000,30,6,0,NULL,NULL),(2329,3,284,0.033000,30,6,0,NULL,NULL),(2330,3,285,0.033000,30,6,0,NULL,NULL),(2331,3,286,0.033000,30,6,0,NULL,NULL),(2332,3,287,0.033000,30,6,0,NULL,NULL),(2333,3,288,0.033000,30,6,0,NULL,NULL),(2334,3,289,0.033000,30,6,0,NULL,NULL),(2335,3,290,0.033000,30,6,0,NULL,NULL),(2336,3,291,0.033000,30,6,0,NULL,NULL),(2337,3,292,0.033000,30,6,0,NULL,NULL),(2338,3,293,0.033000,30,6,0,NULL,NULL),(2339,3,294,0.033000,30,6,0,NULL,NULL),(2340,3,295,0.033000,30,6,0,NULL,NULL),(2341,3,296,0.033000,30,6,0,NULL,NULL),(2342,3,297,0.033000,30,6,0,NULL,NULL),(2343,3,298,0.033000,30,6,0,NULL,NULL),(2344,3,299,0.033000,30,6,0,NULL,NULL),(2345,3,300,0.033000,30,6,0,NULL,NULL),(2346,3,301,0.033000,30,6,0,NULL,NULL),(2347,3,302,0.033000,30,6,0,NULL,NULL),(2348,3,303,0.033000,30,6,0,NULL,NULL),(2349,3,304,0.033000,30,6,0,NULL,NULL),(2350,3,305,0.033000,30,6,0,NULL,NULL),(2351,3,306,0.033000,30,6,0,NULL,NULL),(2352,3,307,0.033000,30,6,0,NULL,NULL),(2353,3,308,0.033000,30,6,0,NULL,NULL),(2354,3,309,0.033000,30,6,0,NULL,NULL),(2355,3,310,0.033000,30,6,0,NULL,NULL),(2356,3,311,0.033000,30,6,0,NULL,NULL),(2357,3,312,0.033000,30,6,0,NULL,NULL),(2358,3,313,0.033000,30,6,0,NULL,NULL),(2359,3,314,0.033000,30,6,0,NULL,NULL),(2360,3,315,0.033000,30,6,0,NULL,NULL),(2361,3,316,0.033000,30,6,0,NULL,NULL),(2362,3,317,0.033000,30,6,0,NULL,NULL),(2363,3,318,0.033000,30,6,0,NULL,NULL),(2364,3,319,0.033000,30,6,0,NULL,NULL),(2365,3,320,0.033000,30,6,0,NULL,NULL),(2366,3,321,0.033000,30,6,0,NULL,NULL),(2367,3,322,0.033000,30,6,0,NULL,NULL),(2368,3,323,0.033000,30,6,0,NULL,NULL),(2369,3,324,0.033000,30,6,0,NULL,NULL),(2370,3,325,0.033000,30,6,0,NULL,NULL),(2371,3,326,0.033000,30,6,0,NULL,NULL),(2372,3,327,0.033000,30,6,0,NULL,NULL),(2373,3,328,0.033000,30,6,0,NULL,NULL),(2374,3,329,0.033000,30,6,0,NULL,NULL),(2375,3,330,0.033000,30,6,0,NULL,NULL),(2376,3,331,0.033000,30,6,0,NULL,NULL),(2377,3,332,0.033000,30,6,0,NULL,NULL),(2378,3,333,0.033000,30,6,0,NULL,NULL),(2379,3,334,0.033000,30,6,0,NULL,NULL),(2380,3,335,0.033000,30,6,0,NULL,NULL),(2381,3,336,0.033000,30,6,0,NULL,NULL),(2382,3,337,0.033000,30,6,0,NULL,NULL),(2383,3,338,0.033000,30,6,0,NULL,NULL),(2384,3,339,0.033000,30,6,0,NULL,NULL),(2385,3,340,0.033000,30,6,0,NULL,NULL),(2386,3,341,0.033000,30,6,0,NULL,NULL),(2387,3,342,0.033000,30,6,0,NULL,NULL),(2388,3,343,0.033000,30,6,0,NULL,NULL),(2389,3,344,0.033000,30,6,0,NULL,NULL),(2390,3,345,0.033000,30,6,0,NULL,NULL),(2391,3,346,0.033000,30,6,0,NULL,NULL),(2392,3,347,0.033000,30,6,0,NULL,NULL),(2393,3,348,0.033000,30,6,0,NULL,NULL),(2394,3,349,0.033000,30,6,0,NULL,NULL),(2395,3,350,0.033000,30,6,0,NULL,NULL),(2396,3,351,0.033000,30,6,0,NULL,NULL),(2397,3,352,0.033000,30,6,0,NULL,NULL),(2398,3,353,0.033000,30,6,0,NULL,NULL),(2399,3,354,0.033000,30,6,0,NULL,NULL),(2400,3,355,0.033000,30,6,0,NULL,NULL),(2401,3,356,0.033000,30,6,0,NULL,NULL),(2402,3,357,0.033000,30,6,0,NULL,NULL),(2403,3,358,0.033000,30,6,0,NULL,NULL),(2404,3,359,0.033000,30,6,0,NULL,NULL),(2405,3,360,0.033000,30,6,0,NULL,NULL),(2406,3,361,0.033000,30,6,0,NULL,NULL),(2407,3,362,0.033000,30,6,0,NULL,NULL),(2408,3,363,0.033000,30,6,0,NULL,NULL),(2409,3,364,0.033000,30,6,0,NULL,NULL),(2410,3,365,0.033000,30,6,0,NULL,NULL),(2411,3,366,0.033000,30,6,0,NULL,NULL),(2412,3,367,0.033000,30,6,0,NULL,NULL),(2413,3,368,0.033000,30,6,0,NULL,NULL),(2414,3,369,0.033000,30,6,0,NULL,NULL),(2415,3,370,0.033000,30,6,0,NULL,NULL),(2416,3,371,0.033000,30,6,0,NULL,NULL),(2417,3,372,0.033000,30,6,0,NULL,NULL),(2418,3,373,0.033000,30,6,0,NULL,NULL),(2419,3,374,0.033000,30,6,0,NULL,NULL),(2420,3,375,0.033000,30,6,0,NULL,NULL),(2421,3,376,0.033000,30,6,0,NULL,NULL),(2422,3,377,0.033000,30,6,0,NULL,NULL),(2423,3,378,0.033000,30,6,0,NULL,NULL),(2424,3,379,0.033000,30,6,0,NULL,NULL),(2425,3,380,0.033000,30,6,0,NULL,NULL),(2426,3,381,0.033000,30,6,0,NULL,NULL),(2427,3,382,0.033000,30,6,0,NULL,NULL),(2428,3,383,0.033000,30,6,0,NULL,NULL),(2429,3,384,0.033000,30,6,0,NULL,NULL),(2430,3,385,0.033000,30,6,0,NULL,NULL),(2431,3,386,0.033000,30,6,0,NULL,NULL),(2432,3,387,0.033000,30,6,0,NULL,NULL),(2433,3,388,0.033000,30,6,0,NULL,NULL),(2434,3,389,0.033000,30,6,0,NULL,NULL),(2435,3,390,0.033000,30,6,0,NULL,NULL),(2436,3,391,0.033000,30,6,0,NULL,NULL),(2437,3,392,0.033000,30,6,0,NULL,NULL),(2438,3,393,0.033000,30,6,0,NULL,NULL),(2439,3,394,0.033000,30,6,0,NULL,NULL),(2440,3,395,0.033000,30,6,0,NULL,NULL),(2441,3,396,0.033000,30,6,0,NULL,NULL),(2442,3,397,0.033000,30,6,0,NULL,NULL),(2443,3,398,0.033000,30,6,0,NULL,NULL),(2444,3,399,0.033000,30,6,0,NULL,NULL),(2445,3,400,0.033000,30,6,0,NULL,NULL),(2446,3,401,0.033000,30,6,0,NULL,NULL),(2447,3,402,0.033000,30,6,0,NULL,NULL),(2448,3,403,0.033000,30,6,0,NULL,NULL),(2449,3,404,0.033000,30,6,0,NULL,NULL),(2450,3,405,0.033000,30,6,0,NULL,NULL),(2451,3,406,0.033000,30,6,0,NULL,NULL),(2452,3,407,0.033000,30,6,0,NULL,NULL),(2453,3,408,0.033000,30,6,0,NULL,NULL),(2454,3,409,0.033000,30,6,0,NULL,NULL),(2455,3,410,0.033000,30,6,0,NULL,NULL),(2456,3,411,0.033000,30,6,0,NULL,NULL),(2457,3,412,0.033000,30,6,0,NULL,NULL),(2458,3,413,0.033000,30,6,0,NULL,NULL),(2459,3,414,0.033000,30,6,0,NULL,NULL),(2460,3,415,0.033000,30,6,0,NULL,NULL),(2461,3,416,0.033000,30,6,0,NULL,NULL),(2462,3,417,0.033000,30,6,0,NULL,NULL),(2463,3,418,0.033000,30,6,0,NULL,NULL),(2464,3,419,0.033000,30,6,0,NULL,NULL),(2465,3,420,0.033000,30,6,0,NULL,NULL),(2466,3,421,0.033000,30,6,0,NULL,NULL),(2467,3,422,0.033000,30,6,0,NULL,NULL),(2468,3,423,0.033000,30,6,0,NULL,NULL),(2469,3,424,0.033000,30,6,0,NULL,NULL),(2470,3,425,0.033000,30,6,0,NULL,NULL),(2471,3,426,0.033000,30,6,0,NULL,NULL),(2472,3,427,0.033000,30,6,0,NULL,NULL),(2473,3,428,0.033000,30,6,0,NULL,NULL),(2474,3,429,0.033000,30,6,0,NULL,NULL),(2475,3,430,0.033000,30,6,0,NULL,NULL),(2476,3,431,0.033000,30,6,0,NULL,NULL),(2477,3,432,0.033000,30,6,0,NULL,NULL),(2478,3,433,0.033000,30,6,0,NULL,NULL),(2479,3,434,0.033000,30,6,0,NULL,NULL),(2480,3,435,0.033000,30,6,0,NULL,NULL),(2481,3,436,0.033000,30,6,0,NULL,NULL),(2482,3,437,0.033000,30,6,0,NULL,NULL),(2483,3,438,0.033000,30,6,0,NULL,NULL),(2484,3,439,0.033000,30,6,0,NULL,NULL),(2485,3,440,0.033000,30,6,0,NULL,NULL),(2486,3,441,0.033000,30,6,0,NULL,NULL),(2487,3,442,0.033000,30,6,0,NULL,NULL),(2488,3,443,0.033000,30,6,0,NULL,NULL),(2489,3,444,0.033000,30,6,0,NULL,NULL),(2490,3,445,0.033000,30,6,0,NULL,NULL),(2491,3,446,0.033000,30,6,0,NULL,NULL),(2492,3,447,0.033000,30,6,0,NULL,NULL),(2493,3,448,0.033000,30,6,0,NULL,NULL),(2494,3,449,0.033000,30,6,0,NULL,NULL),(2495,3,450,0.033000,30,6,0,NULL,NULL),(2496,3,451,0.033000,30,6,0,NULL,NULL),(2497,3,452,0.033000,30,6,0,NULL,NULL),(2498,3,453,0.033000,30,6,0,NULL,NULL),(2499,3,454,0.033000,30,6,0,NULL,NULL),(2500,3,455,0.033000,30,6,0,NULL,NULL),(2501,3,456,0.033000,30,6,0,NULL,NULL),(2502,3,457,0.033000,30,6,0,NULL,NULL),(2503,3,458,0.033000,30,6,0,NULL,NULL),(2504,3,459,0.033000,30,6,0,NULL,NULL),(2505,3,460,0.033000,30,6,0,NULL,NULL),(2506,3,461,0.033000,30,6,0,NULL,NULL),(2507,3,462,0.033000,30,6,0,NULL,NULL),(2508,3,463,0.033000,30,6,0,NULL,NULL),(2509,3,464,0.033000,30,6,0,NULL,NULL),(2510,3,465,0.033000,30,6,0,NULL,NULL),(2511,3,466,0.033000,30,6,0,NULL,NULL),(2512,3,467,0.033000,30,6,0,NULL,NULL),(2513,3,468,0.033000,30,6,0,NULL,NULL),(2514,3,469,0.033000,30,6,0,NULL,NULL),(2515,3,470,0.033000,30,6,0,NULL,NULL),(2516,3,471,0.033000,30,6,0,NULL,NULL),(2517,3,472,0.033000,30,6,0,NULL,NULL),(2518,3,473,0.033000,30,6,0,NULL,NULL),(2519,3,474,0.033000,30,6,0,NULL,NULL),(2520,3,475,0.033000,30,6,0,NULL,NULL),(2521,3,476,0.033000,30,6,0,NULL,NULL),(2522,3,477,0.033000,30,6,0,NULL,NULL),(2523,3,478,0.033000,30,6,0,NULL,NULL),(2524,3,479,0.033000,30,6,0,NULL,NULL),(2525,3,480,0.033000,30,6,0,NULL,NULL),(2526,3,481,0.033000,30,6,0,NULL,NULL),(2527,3,482,0.033000,30,6,0,NULL,NULL),(2528,3,483,0.033000,30,6,0,NULL,NULL),(2529,3,484,0.033000,30,6,0,NULL,NULL),(2530,3,485,0.033000,30,6,0,NULL,NULL),(2531,3,486,0.033000,30,6,0,NULL,NULL),(2532,3,487,0.033000,30,6,0,NULL,NULL),(2533,3,488,0.033000,30,6,0,NULL,NULL),(2534,3,490,0.033000,30,6,0,NULL,NULL),(2535,3,491,0.033000,30,6,0,NULL,NULL),(2536,3,492,0.033000,30,6,0,NULL,NULL),(2537,3,493,0.033000,30,6,0,NULL,NULL),(2538,3,494,0.033000,30,6,0,NULL,NULL),(2539,3,495,0.033000,30,6,0,NULL,NULL),(2540,3,496,0.033000,30,6,0,NULL,NULL),(2541,3,497,0.033000,30,6,0,NULL,NULL),(2542,3,498,0.033000,30,6,0,NULL,NULL),(2543,3,499,0.033000,30,6,0,NULL,NULL),(2544,3,500,0.033000,30,6,0,NULL,NULL),(2545,3,501,0.033000,30,6,0,NULL,NULL),(2546,3,502,0.033000,30,6,0,NULL,NULL),(2547,3,503,0.033000,30,6,0,NULL,NULL),(2548,3,504,0.033000,30,6,0,NULL,NULL),(2549,3,505,0.033000,30,6,0,NULL,NULL),(2550,3,506,0.033000,30,6,0,NULL,NULL),(2551,3,507,0.033000,30,6,0,NULL,NULL),(2552,3,508,0.033000,30,6,0,NULL,NULL),(2553,3,509,0.033000,30,6,0,NULL,NULL),(2554,3,510,0.033000,30,6,0,NULL,NULL),(2555,3,511,0.033000,30,6,0,NULL,NULL),(2556,3,512,0.033000,30,6,0,NULL,NULL),(2557,3,513,0.033000,30,6,0,NULL,NULL),(2558,3,514,0.033000,30,6,0,NULL,NULL),(2559,3,515,0.033000,30,6,0,NULL,NULL),(2560,3,516,0.033000,30,6,0,NULL,NULL),(2561,3,517,0.033000,30,6,0,NULL,NULL),(2562,3,518,0.033000,30,6,0,NULL,NULL),(2563,3,519,0.033000,30,6,0,NULL,NULL),(2564,3,520,0.033000,30,6,0,NULL,NULL),(2565,3,521,0.033000,30,6,0,NULL,NULL),(2566,3,522,0.033000,30,6,0,NULL,NULL),(2567,3,523,0.033000,30,6,0,NULL,NULL),(2568,3,524,0.033000,30,6,0,NULL,NULL),(2569,3,525,0.033000,30,6,0,NULL,NULL),(2570,3,526,0.033000,30,6,0,NULL,NULL),(2571,3,527,0.033000,30,6,0,NULL,NULL),(2572,3,528,0.033000,30,6,0,NULL,NULL),(2573,3,529,0.033000,30,6,0,NULL,NULL),(2574,3,530,0.033000,30,6,0,NULL,NULL),(2575,3,531,0.033000,30,6,0,NULL,NULL),(2576,3,532,0.033000,30,6,0,NULL,NULL),(2577,3,533,0.033000,30,6,0,NULL,NULL),(2578,3,534,0.033000,30,6,0,NULL,NULL),(2579,3,535,0.033000,30,6,0,NULL,NULL),(2580,3,536,0.033000,30,6,0,NULL,NULL),(2581,3,537,0.033000,30,6,0,NULL,NULL),(2582,3,538,0.033000,30,6,0,NULL,NULL),(2583,3,539,0.033000,30,6,0,NULL,NULL),(2584,3,540,0.033000,30,6,0,NULL,NULL),(2585,3,541,0.033000,30,6,0,NULL,NULL),(2586,3,542,0.033000,30,6,0,NULL,NULL),(2587,3,543,0.033000,30,6,0,NULL,NULL),(2588,3,544,0.033000,30,6,0,NULL,NULL),(2589,3,545,0.033000,30,6,0,NULL,NULL),(2590,3,546,0.033000,30,6,0,NULL,NULL),(2591,3,547,0.033000,30,6,0,NULL,NULL),(2592,3,548,0.033000,30,6,0,NULL,NULL),(2593,3,549,0.033000,30,6,0,NULL,NULL),(2594,3,550,0.033000,30,6,0,NULL,NULL),(2595,3,551,0.033000,30,6,0,NULL,NULL),(2596,3,552,0.033000,30,6,0,NULL,NULL),(2597,3,553,0.033000,30,6,0,NULL,NULL),(2598,3,554,0.033000,30,6,0,NULL,NULL),(2599,3,555,0.033000,30,6,0,NULL,NULL),(2600,3,556,0.033000,30,6,0,NULL,NULL),(2601,3,557,0.033000,30,6,0,NULL,NULL),(2602,3,558,0.033000,30,6,0,NULL,NULL),(2603,3,559,0.033000,30,6,0,NULL,NULL),(2604,3,560,0.033000,30,6,0,NULL,NULL),(2605,3,561,0.033000,30,6,0,NULL,NULL),(2606,3,562,0.033000,30,6,0,NULL,NULL),(2607,3,3,0.033000,30,6,0,NULL,NULL),(2608,3,563,0.033000,30,6,0,NULL,NULL),(2609,3,564,0.033000,30,6,0,NULL,NULL),(2610,3,565,0.033000,30,6,0,NULL,NULL),(2611,3,566,0.033000,30,6,0,NULL,NULL),(2612,3,567,0.033000,30,6,0,NULL,NULL),(2613,3,568,0.033000,30,6,0,NULL,NULL),(2614,3,569,0.033000,30,6,0,NULL,NULL),(2615,3,570,0.033000,30,6,0,NULL,NULL),(2616,3,571,0.033000,30,6,0,NULL,NULL),(2617,3,572,0.033000,30,6,0,NULL,NULL),(2618,3,573,0.033000,30,6,0,NULL,NULL),(2619,3,574,0.033000,30,6,0,NULL,NULL),(2620,3,575,0.033000,30,6,0,NULL,NULL),(2621,3,576,0.033000,30,6,0,NULL,NULL),(2622,3,577,0.033000,30,6,0,NULL,NULL),(2623,3,578,0.033000,30,6,0,NULL,NULL),(2624,3,579,0.033000,30,6,0,NULL,NULL),(2625,3,580,0.033000,30,6,0,NULL,NULL),(2626,3,581,0.033000,30,6,0,NULL,NULL),(2627,3,582,0.033000,30,6,0,NULL,NULL),(2628,3,583,0.033000,30,6,0,NULL,NULL),(2629,3,584,0.033000,30,6,0,NULL,NULL),(2630,3,585,0.033000,30,6,0,NULL,NULL),(2631,3,586,0.033000,30,6,0,NULL,NULL),(2632,3,587,0.033000,30,6,0,NULL,NULL),(2633,3,588,0.033000,30,6,0,NULL,NULL),(2634,3,589,0.033000,30,6,0,NULL,NULL),(2635,3,590,0.033000,30,6,0,NULL,NULL),(2636,3,591,0.033000,30,6,0,NULL,NULL),(2637,3,592,0.033000,30,6,0,NULL,NULL),(2638,3,593,0.033000,30,6,0,NULL,NULL),(2639,3,594,0.033000,30,6,0,NULL,NULL),(2640,3,595,0.033000,30,6,0,NULL,NULL),(2641,3,596,0.033000,30,6,0,NULL,NULL),(2642,3,28,0.033000,30,6,0,NULL,NULL),(2643,3,597,0.033000,30,6,0,NULL,NULL),(2644,3,598,0.033000,30,6,0,NULL,NULL),(2645,3,599,0.033000,30,6,0,NULL,NULL),(2646,3,600,0.033000,30,6,0,NULL,NULL),(2647,3,601,0.033000,30,6,0,NULL,NULL),(2648,3,602,0.033000,30,6,0,NULL,NULL),(2649,3,603,0.033000,30,6,0,NULL,NULL),(2650,3,604,0.033000,30,6,0,NULL,NULL),(2651,3,605,0.033000,30,6,0,NULL,NULL),(2652,3,606,0.033000,30,6,0,NULL,NULL),(2653,3,607,0.033000,30,6,0,NULL,NULL),(2654,3,608,0.033000,30,6,0,NULL,NULL),(2655,3,609,0.033000,30,6,0,NULL,NULL),(2656,3,610,0.033000,30,6,0,NULL,NULL),(2657,3,611,0.033000,30,6,0,NULL,NULL),(2658,3,612,0.033000,30,6,0,NULL,NULL),(2659,3,613,0.033000,30,6,0,NULL,NULL),(2660,3,614,0.033000,30,6,0,NULL,NULL),(2661,3,615,0.033000,30,6,0,NULL,NULL),(2662,3,616,0.033000,30,6,0,NULL,NULL),(2663,3,617,0.033000,30,6,0,NULL,NULL),(2664,3,618,0.033000,30,6,0,NULL,NULL),(2665,3,619,0.033000,30,6,0,NULL,NULL),(2666,3,620,0.033000,30,6,0,NULL,NULL),(2667,3,621,0.033000,30,6,0,NULL,NULL),(2668,3,622,0.033000,30,6,0,NULL,NULL),(2669,3,623,0.033000,30,6,0,NULL,NULL),(2670,3,624,0.033000,30,6,0,NULL,NULL),(2671,3,625,0.033000,30,6,0,NULL,NULL),(2672,3,626,0.033000,30,6,0,NULL,NULL),(2673,3,627,0.033000,30,6,0,NULL,NULL),(2674,3,628,0.033000,30,6,0,NULL,NULL),(2675,3,629,0.033000,30,6,0,NULL,NULL),(2676,3,630,0.033000,30,6,0,NULL,NULL),(2677,3,631,0.033000,30,6,0,NULL,NULL),(2678,3,632,0.033000,30,6,0,NULL,NULL),(2679,3,633,0.033000,30,6,0,NULL,NULL),(3070,4,2,1.170000,30,6,0,NULL,NULL),(3071,4,3,1.170000,30,6,0,NULL,NULL),(3072,4,4,1.170000,30,6,0,NULL,NULL),(3073,4,5,1.170000,30,6,0,NULL,NULL),(3074,4,6,1.170000,30,6,0,NULL,NULL),(3075,4,7,1.170000,30,6,0,NULL,NULL),(3076,4,8,1.170000,30,6,0,NULL,NULL),(3077,4,9,1.170000,30,6,0,NULL,NULL),(3078,4,10,1.170000,30,6,0,NULL,NULL),(3079,4,11,1.170000,30,6,0,NULL,NULL),(3080,4,12,1.170000,30,6,0,NULL,NULL),(3081,4,13,1.170000,30,6,0,NULL,NULL),(3082,4,14,1.170000,30,6,0,NULL,NULL),(3083,4,15,1.170000,30,6,0,NULL,NULL),(3084,4,16,1.170000,30,6,0,NULL,NULL),(3085,4,17,1.170000,30,6,0,NULL,NULL),(3086,4,18,1.170000,30,6,0,NULL,NULL),(3087,4,19,1.170000,30,6,0,NULL,NULL),(3088,4,20,1.170000,30,6,0,NULL,NULL),(3089,4,21,1.170000,30,6,0,NULL,NULL),(3090,4,22,1.170000,30,6,0,NULL,NULL),(3091,4,23,1.170000,30,6,0,NULL,NULL),(3092,4,24,1.170000,30,6,0,NULL,NULL),(3093,4,25,1.170000,30,6,0,NULL,NULL),(3094,4,26,1.170000,30,6,0,NULL,NULL),(3095,4,27,1.170000,30,6,0,NULL,NULL),(3096,4,28,1.170000,30,6,0,NULL,NULL),(3097,4,29,0.370000,30,6,0,NULL,NULL),(3098,4,30,0.370000,30,6,0,NULL,NULL),(3099,4,31,0.370000,30,6,0,NULL,NULL),(3100,4,32,0.370000,30,6,0,NULL,NULL),(3101,4,33,0.370000,30,6,0,NULL,NULL),(3102,4,34,0.370000,30,6,0,NULL,NULL),(3103,4,35,0.370000,30,6,0,NULL,NULL),(3104,4,36,0.370000,30,6,0,NULL,NULL),(3105,4,37,0.370000,30,6,0,NULL,NULL),(3106,4,38,0.370000,30,6,0,NULL,NULL),(3107,4,39,0.370000,30,6,0,NULL,NULL),(3108,4,40,0.370000,30,6,0,NULL,NULL),(3109,4,41,0.370000,30,6,0,NULL,NULL),(3110,4,42,0.370000,30,6,0,NULL,NULL),(3111,4,43,0.370000,30,6,0,NULL,NULL),(3112,4,44,0.370000,30,6,0,NULL,NULL),(3113,4,45,0.370000,30,6,0,NULL,NULL),(3114,4,46,0.370000,30,6,0,NULL,NULL),(3115,4,47,0.370000,30,6,0,NULL,NULL),(3116,4,48,0.370000,30,6,0,NULL,NULL),(3117,4,49,0.370000,30,6,0,NULL,NULL),(3118,4,50,0.370000,30,6,0,NULL,NULL),(3119,4,51,0.370000,30,6,0,NULL,NULL),(3120,4,52,0.370000,30,6,0,NULL,NULL),(3121,4,53,0.370000,30,6,0,NULL,NULL),(3122,4,54,0.370000,30,6,0,NULL,NULL),(3123,4,55,0.370000,30,6,0,NULL,NULL),(3124,4,56,0.370000,30,6,0,NULL,NULL),(3125,4,57,0.370000,30,6,0,NULL,NULL),(3126,4,58,0.370000,30,6,0,NULL,NULL),(3127,4,59,0.370000,30,6,0,NULL,NULL),(3128,4,60,0.370000,30,6,0,NULL,NULL),(3129,4,61,0.370000,30,6,0,NULL,NULL),(3130,4,62,0.370000,30,6,0,NULL,NULL),(3131,4,63,0.370000,30,6,0,NULL,NULL),(3132,4,64,0.370000,30,6,0,NULL,NULL),(3133,4,65,0.370000,30,6,0,NULL,NULL),(3134,4,66,0.370000,30,6,0,NULL,NULL),(3135,4,67,0.370000,30,6,0,NULL,NULL),(3136,4,68,0.370000,30,6,0,NULL,NULL),(3137,4,69,0.370000,30,6,0,NULL,NULL),(3138,4,70,0.370000,30,6,0,NULL,NULL),(3139,4,71,0.370000,30,6,0,NULL,NULL),(3140,4,72,0.370000,30,6,0,NULL,NULL),(3141,4,73,0.370000,30,6,0,NULL,NULL),(3142,4,74,0.370000,30,6,0,NULL,NULL),(3143,4,75,0.370000,30,6,0,NULL,NULL),(3144,4,76,0.370000,30,6,0,NULL,NULL),(3145,4,77,0.370000,30,6,0,NULL,NULL),(3146,4,78,0.370000,30,6,0,NULL,NULL),(3147,4,79,0.370000,30,6,0,NULL,NULL),(3148,4,80,0.370000,30,6,0,NULL,NULL),(3149,4,81,0.370000,30,6,0,NULL,NULL),(3150,4,82,0.370000,30,6,0,NULL,NULL),(3151,4,83,0.370000,30,6,0,NULL,NULL),(3152,4,84,0.370000,30,6,0,NULL,NULL),(3153,4,85,0.370000,30,6,0,NULL,NULL),(3154,4,86,0.370000,30,6,0,NULL,NULL),(3155,4,87,0.370000,30,6,0,NULL,NULL),(3156,4,88,0.370000,30,6,0,NULL,NULL),(3157,4,89,0.370000,30,6,0,NULL,NULL),(3158,4,90,0.370000,30,6,0,NULL,NULL),(3159,4,91,0.370000,30,6,0,NULL,NULL),(3160,4,92,0.370000,30,6,0,NULL,NULL),(3161,4,93,0.370000,30,6,0,NULL,NULL),(3162,4,94,0.370000,30,6,0,NULL,NULL),(3163,4,95,0.370000,30,6,0,NULL,NULL),(3164,4,96,0.370000,30,6,0,NULL,NULL),(3165,4,97,0.370000,30,6,0,NULL,NULL),(3166,4,98,0.370000,30,6,0,NULL,NULL),(3167,4,99,0.370000,30,6,0,NULL,NULL),(3168,4,100,0.370000,30,6,0,NULL,NULL),(3169,4,101,0.370000,30,6,0,NULL,NULL),(3170,4,102,0.370000,30,6,0,NULL,NULL),(3171,4,103,0.370000,30,6,0,NULL,NULL),(3172,4,104,0.370000,30,6,0,NULL,NULL),(3173,4,105,0.370000,30,6,0,NULL,NULL),(3174,4,106,0.370000,30,6,0,NULL,NULL),(3175,4,107,0.370000,30,6,0,NULL,NULL),(3176,4,108,0.370000,30,6,0,NULL,NULL),(3177,4,109,0.370000,30,6,0,NULL,NULL),(3178,4,110,0.370000,30,6,0,NULL,NULL),(3179,4,111,0.370000,30,6,0,NULL,NULL),(3180,4,112,0.370000,30,6,0,NULL,NULL),(3181,4,113,0.370000,30,6,0,NULL,NULL),(3182,4,114,0.370000,30,6,0,NULL,NULL),(3183,4,115,0.370000,30,6,0,NULL,NULL),(3184,4,116,0.370000,30,6,0,NULL,NULL),(3185,4,117,0.370000,30,6,0,NULL,NULL),(3186,4,118,0.370000,30,6,0,NULL,NULL),(3187,4,119,0.370000,30,6,0,NULL,NULL),(3188,4,120,0.370000,30,6,0,NULL,NULL),(3189,4,121,0.370000,30,6,0,NULL,NULL),(3190,4,122,0.370000,30,6,0,NULL,NULL),(3191,4,123,0.370000,30,6,0,NULL,NULL),(3192,4,124,0.370000,30,6,0,NULL,NULL),(3193,4,125,0.370000,30,6,0,NULL,NULL),(3194,4,126,0.370000,30,6,0,NULL,NULL),(3195,4,127,0.370000,30,6,0,NULL,NULL),(3196,4,128,0.370000,30,6,0,NULL,NULL),(3197,4,129,0.370000,30,6,0,NULL,NULL),(3198,4,130,0.370000,30,6,0,NULL,NULL),(3199,4,131,0.370000,30,6,0,NULL,NULL),(3200,4,132,0.370000,30,6,0,NULL,NULL),(3201,4,133,0.370000,30,6,0,NULL,NULL),(3202,4,134,0.370000,30,6,0,NULL,NULL),(3203,4,135,0.370000,30,6,0,NULL,NULL),(3204,4,136,0.370000,30,6,0,NULL,NULL),(3205,4,137,0.370000,30,6,0,NULL,NULL),(3206,4,138,0.370000,30,6,0,NULL,NULL),(3207,4,139,0.370000,30,6,0,NULL,NULL),(3208,4,140,0.370000,30,6,0,NULL,NULL),(3209,4,141,0.370000,30,6,0,NULL,NULL),(3210,4,142,0.370000,30,6,0,NULL,NULL),(3211,4,143,0.370000,30,6,0,NULL,NULL),(3212,4,144,0.370000,30,6,0,NULL,NULL),(3213,4,145,0.370000,30,6,0,NULL,NULL),(3214,4,146,0.370000,30,6,0,NULL,NULL),(3215,4,147,0.370000,30,6,0,NULL,NULL),(3216,4,148,0.370000,30,6,0,NULL,NULL),(3217,4,149,0.370000,30,6,0,NULL,NULL),(3218,4,150,0.370000,30,6,0,NULL,NULL),(3219,4,151,0.370000,30,6,0,NULL,NULL),(3220,4,152,0.370000,30,6,0,NULL,NULL),(3221,4,153,0.370000,30,6,0,NULL,NULL),(3222,4,154,0.370000,30,6,0,NULL,NULL),(3223,4,155,0.370000,30,6,0,NULL,NULL),(3224,4,156,0.370000,30,6,0,NULL,NULL),(3225,4,157,0.370000,30,6,0,NULL,NULL),(3226,4,158,0.370000,30,6,0,NULL,NULL),(3227,4,159,0.370000,30,6,0,NULL,NULL),(3228,4,160,0.370000,30,6,0,NULL,NULL),(3229,4,161,0.370000,30,6,0,NULL,NULL),(3230,4,162,0.370000,30,6,0,NULL,NULL),(3231,4,163,0.370000,30,6,0,NULL,NULL),(3232,4,164,0.370000,30,6,0,NULL,NULL),(3233,4,165,0.370000,30,6,0,NULL,NULL),(3234,4,166,0.370000,30,6,0,NULL,NULL),(3235,4,167,0.370000,30,6,0,NULL,NULL),(3236,4,168,0.370000,30,6,0,NULL,NULL),(3237,4,169,0.370000,30,6,0,NULL,NULL),(3238,4,170,0.370000,30,6,0,NULL,NULL),(3239,4,171,0.370000,30,6,0,NULL,NULL),(3240,4,172,0.370000,30,6,0,NULL,NULL),(3241,4,173,0.370000,30,6,0,NULL,NULL),(3242,4,174,0.370000,30,6,0,NULL,NULL),(3243,4,175,0.370000,30,6,0,NULL,NULL),(3244,4,176,0.370000,30,6,0,NULL,NULL),(3245,4,177,0.370000,30,6,0,NULL,NULL),(3246,4,178,0.370000,30,6,0,NULL,NULL),(3247,4,179,0.370000,30,6,0,NULL,NULL),(3248,4,180,0.370000,30,6,0,NULL,NULL),(3249,4,181,0.370000,30,6,0,NULL,NULL),(3250,4,182,0.370000,30,6,0,NULL,NULL),(3251,4,183,0.370000,30,6,0,NULL,NULL),(3252,4,184,0.370000,30,6,0,NULL,NULL),(3253,4,185,0.370000,30,6,0,NULL,NULL),(3254,4,186,0.370000,30,6,0,NULL,NULL),(3255,4,187,0.370000,30,6,0,NULL,NULL),(3256,4,188,0.370000,30,6,0,NULL,NULL),(3257,4,189,0.370000,30,6,0,NULL,NULL),(3258,4,190,0.370000,30,6,0,NULL,NULL),(3259,4,191,0.370000,30,6,0,NULL,NULL),(3260,4,192,0.370000,30,6,0,NULL,NULL),(3261,4,193,0.370000,30,6,0,NULL,NULL),(3262,4,194,0.370000,30,6,0,NULL,NULL),(3263,4,195,0.370000,30,6,0,NULL,NULL),(3264,4,196,0.370000,30,6,0,NULL,NULL),(3265,4,197,0.370000,30,6,0,NULL,NULL),(3266,4,198,0.370000,30,6,0,NULL,NULL),(3267,4,199,0.370000,30,6,0,NULL,NULL),(3268,4,200,0.370000,30,6,0,NULL,NULL),(3269,4,201,0.370000,30,6,0,NULL,NULL),(3270,4,202,0.370000,30,6,0,NULL,NULL),(3271,4,203,0.370000,30,6,0,NULL,NULL),(3272,4,204,0.370000,30,6,0,NULL,NULL),(3273,4,205,0.370000,30,6,0,NULL,NULL),(3274,4,206,0.370000,30,6,0,NULL,NULL),(3275,4,207,0.370000,30,6,0,NULL,NULL),(3276,4,208,0.370000,30,6,0,NULL,NULL),(3277,4,209,0.370000,30,6,0,NULL,NULL),(3278,4,210,0.370000,30,6,0,NULL,NULL),(3279,4,211,0.370000,30,6,0,NULL,NULL),(3280,4,212,0.370000,30,6,0,NULL,NULL),(3281,4,213,0.370000,30,6,0,NULL,NULL),(3282,4,214,0.370000,30,6,0,NULL,NULL),(3283,4,215,0.370000,30,6,0,NULL,NULL),(3284,4,216,0.370000,30,6,0,NULL,NULL),(3285,4,217,0.370000,30,6,0,NULL,NULL),(3286,4,218,0.370000,30,6,0,NULL,NULL),(3287,4,219,0.370000,30,6,0,NULL,NULL),(3288,4,220,0.370000,30,6,0,NULL,NULL),(3289,4,221,0.370000,30,6,0,NULL,NULL),(3290,4,222,0.370000,30,6,0,NULL,NULL),(3291,4,223,0.370000,30,6,0,NULL,NULL),(3292,4,224,0.370000,30,6,0,NULL,NULL),(3293,4,225,0.370000,30,6,0,NULL,NULL),(3294,4,226,0.370000,30,6,0,NULL,NULL),(3295,4,227,0.370000,30,6,0,NULL,NULL),(3296,4,228,0.370000,30,6,0,NULL,NULL),(3297,4,229,0.370000,30,6,0,NULL,NULL),(3298,4,230,0.370000,30,6,0,NULL,NULL),(3299,4,231,0.370000,30,6,0,NULL,NULL),(3300,4,232,0.370000,30,6,0,NULL,NULL),(3301,4,233,0.370000,30,6,0,NULL,NULL),(3302,4,234,0.370000,30,6,0,NULL,NULL),(3303,4,235,0.370000,30,6,0,NULL,NULL),(3304,4,236,0.370000,30,6,0,NULL,NULL),(3305,4,237,0.370000,30,6,0,NULL,NULL),(3306,4,238,0.370000,30,6,0,NULL,NULL),(3307,4,239,0.370000,30,6,0,NULL,NULL),(3308,4,240,0.370000,30,6,0,NULL,NULL),(3309,4,241,0.370000,30,6,0,NULL,NULL),(3310,4,242,0.370000,30,6,0,NULL,NULL),(3311,4,243,0.370000,30,6,0,NULL,NULL),(3312,4,244,0.370000,30,6,0,NULL,NULL),(3313,4,245,0.370000,30,6,0,NULL,NULL),(3314,4,246,0.370000,30,6,0,NULL,NULL),(3315,4,247,0.370000,30,6,0,NULL,NULL),(3316,4,248,0.370000,30,6,0,NULL,NULL),(3317,4,249,0.370000,30,6,0,NULL,NULL),(3318,4,250,0.370000,30,6,0,NULL,NULL),(3319,4,251,0.370000,30,6,0,NULL,NULL),(3320,4,252,0.370000,30,6,0,NULL,NULL),(3321,4,253,0.370000,30,6,0,NULL,NULL),(3322,4,254,0.370000,30,6,0,NULL,NULL),(3323,4,255,0.370000,30,6,0,NULL,NULL),(3324,4,256,0.370000,30,6,0,NULL,NULL),(3325,4,257,0.370000,30,6,0,NULL,NULL),(3326,4,258,0.370000,30,6,0,NULL,NULL),(3327,4,259,0.370000,30,6,0,NULL,NULL),(3328,4,260,0.370000,30,6,0,NULL,NULL),(3329,4,261,0.370000,30,6,0,NULL,NULL),(3330,4,262,0.370000,30,6,0,NULL,NULL),(3331,4,263,0.370000,30,6,0,NULL,NULL),(3332,4,264,0.370000,30,6,0,NULL,NULL),(3333,4,265,0.370000,30,6,0,NULL,NULL),(3334,4,266,0.370000,30,6,0,NULL,NULL),(3335,4,267,0.370000,30,6,0,NULL,NULL),(3336,4,268,0.370000,30,6,0,NULL,NULL),(3337,4,269,0.370000,30,6,0,NULL,NULL),(3338,4,270,0.370000,30,6,0,NULL,NULL),(3339,4,271,0.370000,30,6,0,NULL,NULL),(3340,4,272,0.370000,30,6,0,NULL,NULL),(3341,4,273,0.370000,30,6,0,NULL,NULL),(3342,4,274,0.370000,30,6,0,NULL,NULL),(3343,4,275,0.370000,30,6,0,NULL,NULL),(3344,4,276,0.370000,30,6,0,NULL,NULL),(3345,4,277,0.370000,30,6,0,NULL,NULL),(3346,4,278,0.370000,30,6,0,NULL,NULL),(3347,4,279,0.370000,30,6,0,NULL,NULL),(3348,4,280,0.370000,30,6,0,NULL,NULL),(3349,4,281,0.370000,30,6,0,NULL,NULL),(3350,4,282,0.370000,30,6,0,NULL,NULL),(3351,4,283,0.370000,30,6,0,NULL,NULL),(3352,4,284,0.370000,30,6,0,NULL,NULL),(3353,4,285,0.370000,30,6,0,NULL,NULL),(3354,4,286,0.370000,30,6,0,NULL,NULL),(3355,4,287,0.370000,30,6,0,NULL,NULL),(3356,4,288,0.370000,30,6,0,NULL,NULL),(3357,4,289,0.370000,30,6,0,NULL,NULL),(3358,4,290,0.370000,30,6,0,NULL,NULL),(3359,4,291,0.370000,30,6,0,NULL,NULL),(3360,4,292,0.370000,30,6,0,NULL,NULL),(3361,4,293,0.370000,30,6,0,NULL,NULL),(3362,4,294,0.370000,30,6,0,NULL,NULL),(3363,4,295,0.370000,30,6,0,NULL,NULL),(3364,4,296,0.370000,30,6,0,NULL,NULL),(3365,4,297,0.370000,30,6,0,NULL,NULL),(3366,4,298,0.370000,30,6,0,NULL,NULL),(3367,4,299,0.370000,30,6,0,NULL,NULL),(3368,4,300,0.370000,30,6,0,NULL,NULL),(3369,4,301,0.370000,30,6,0,NULL,NULL),(3370,4,302,0.370000,30,6,0,NULL,NULL),(3371,4,303,0.370000,30,6,0,NULL,NULL),(3372,4,304,0.370000,30,6,0,NULL,NULL),(3373,4,305,0.370000,30,6,0,NULL,NULL),(3374,4,306,0.370000,30,6,0,NULL,NULL),(3375,4,307,0.370000,30,6,0,NULL,NULL),(3376,4,308,0.370000,30,6,0,NULL,NULL),(3377,4,309,0.370000,30,6,0,NULL,NULL),(3378,4,310,0.370000,30,6,0,NULL,NULL),(3379,4,311,0.370000,30,6,0,NULL,NULL),(3380,4,312,0.370000,30,6,0,NULL,NULL),(3381,4,313,0.370000,30,6,0,NULL,NULL),(3382,4,314,0.370000,30,6,0,NULL,NULL),(3383,4,315,0.370000,30,6,0,NULL,NULL),(3384,4,316,0.370000,30,6,0,NULL,NULL),(3385,4,317,0.370000,30,6,0,NULL,NULL),(3386,4,318,0.370000,30,6,0,NULL,NULL),(3387,4,319,0.370000,30,6,0,NULL,NULL),(3388,4,320,0.370000,30,6,0,NULL,NULL),(3389,4,321,0.370000,30,6,0,NULL,NULL),(3390,4,322,0.370000,30,6,0,NULL,NULL),(3391,4,323,0.370000,30,6,0,NULL,NULL),(3392,4,324,0.370000,30,6,0,NULL,NULL),(3393,4,325,0.370000,30,6,0,NULL,NULL),(3394,4,326,0.370000,30,6,0,NULL,NULL),(3395,4,327,0.370000,30,6,0,NULL,NULL),(3396,4,328,0.370000,30,6,0,NULL,NULL),(3397,4,329,0.370000,30,6,0,NULL,NULL),(3398,4,330,0.370000,30,6,0,NULL,NULL),(3399,4,331,0.370000,30,6,0,NULL,NULL),(3400,4,332,0.370000,30,6,0,NULL,NULL),(3401,4,333,0.370000,30,6,0,NULL,NULL),(3402,4,334,0.370000,30,6,0,NULL,NULL),(3403,4,335,0.370000,30,6,0,NULL,NULL),(3404,4,336,0.370000,30,6,0,NULL,NULL),(3405,4,337,0.370000,30,6,0,NULL,NULL),(3406,4,338,0.370000,30,6,0,NULL,NULL),(3407,4,339,0.370000,30,6,0,NULL,NULL),(3408,4,340,0.370000,30,6,0,NULL,NULL),(3409,4,341,0.370000,30,6,0,NULL,NULL),(3410,4,342,0.370000,30,6,0,NULL,NULL),(3411,4,343,0.370000,30,6,0,NULL,NULL),(3412,4,344,0.370000,30,6,0,NULL,NULL),(3413,4,345,0.370000,30,6,0,NULL,NULL),(3414,4,346,0.370000,30,6,0,NULL,NULL),(3415,4,347,0.370000,30,6,0,NULL,NULL),(3416,4,348,0.370000,30,6,0,NULL,NULL),(3417,4,349,0.370000,30,6,0,NULL,NULL),(3418,4,350,0.370000,30,6,0,NULL,NULL),(3419,4,351,0.370000,30,6,0,NULL,NULL),(3420,4,352,0.370000,30,6,0,NULL,NULL),(3421,4,353,0.370000,30,6,0,NULL,NULL),(3422,4,354,0.370000,30,6,0,NULL,NULL),(3423,4,355,0.370000,30,6,0,NULL,NULL),(3424,4,356,0.370000,30,6,0,NULL,NULL),(3425,4,357,0.370000,30,6,0,NULL,NULL),(3426,4,358,0.370000,30,6,0,NULL,NULL),(3427,4,359,0.370000,30,6,0,NULL,NULL),(3428,4,360,0.370000,30,6,0,NULL,NULL),(3429,4,361,0.370000,30,6,0,NULL,NULL),(3430,4,362,0.370000,30,6,0,NULL,NULL),(3431,4,363,0.370000,30,6,0,NULL,NULL),(3432,4,364,0.370000,30,6,0,NULL,NULL),(3433,4,365,0.370000,30,6,0,NULL,NULL),(3434,4,366,0.370000,30,6,0,NULL,NULL),(3435,4,367,0.370000,30,6,0,NULL,NULL),(3436,4,368,0.370000,30,6,0,NULL,NULL),(3437,4,369,0.370000,30,6,0,NULL,NULL),(3438,4,370,0.370000,30,6,0,NULL,NULL),(3439,4,371,0.370000,30,6,0,NULL,NULL),(3440,4,372,0.370000,30,6,0,NULL,NULL),(3441,4,373,0.370000,30,6,0,NULL,NULL),(3442,4,374,0.370000,30,6,0,NULL,NULL),(3443,4,375,0.370000,30,6,0,NULL,NULL),(3444,4,376,0.370000,30,6,0,NULL,NULL),(3445,4,377,0.370000,30,6,0,NULL,NULL),(3446,4,378,0.370000,30,6,0,NULL,NULL),(3447,4,379,0.370000,30,6,0,NULL,NULL),(3448,4,380,0.370000,30,6,0,NULL,NULL),(3449,4,381,0.370000,30,6,0,NULL,NULL),(3450,4,382,0.370000,30,6,0,NULL,NULL),(3451,4,383,0.370000,30,6,0,NULL,NULL),(3452,4,384,0.370000,30,6,0,NULL,NULL),(3453,4,385,0.370000,30,6,0,NULL,NULL),(3454,4,386,0.370000,30,6,0,NULL,NULL),(3455,4,387,0.370000,30,6,0,NULL,NULL),(3456,4,388,0.370000,30,6,0,NULL,NULL),(3457,4,389,0.370000,30,6,0,NULL,NULL),(3458,4,390,0.370000,30,6,0,NULL,NULL),(3459,4,391,0.370000,30,6,0,NULL,NULL),(3460,4,392,0.370000,30,6,0,NULL,NULL),(3461,4,393,0.370000,30,6,0,NULL,NULL),(3462,4,394,0.370000,30,6,0,NULL,NULL),(3463,4,395,0.370000,30,6,0,NULL,NULL),(3464,4,396,0.370000,30,6,0,NULL,NULL),(3465,4,397,0.370000,30,6,0,NULL,NULL),(3466,4,398,0.370000,30,6,0,NULL,NULL),(3467,4,399,0.370000,30,6,0,NULL,NULL),(3468,4,400,0.370000,30,6,0,NULL,NULL),(3469,4,401,0.370000,30,6,0,NULL,NULL),(3470,4,402,0.370000,30,6,0,NULL,NULL),(3471,4,403,0.370000,30,6,0,NULL,NULL),(3472,4,404,0.370000,30,6,0,NULL,NULL),(3473,4,405,0.370000,30,6,0,NULL,NULL),(3474,4,406,0.370000,30,6,0,NULL,NULL),(3475,4,407,0.370000,30,6,0,NULL,NULL),(3476,4,408,0.370000,30,6,0,NULL,NULL),(3477,4,409,0.370000,30,6,0,NULL,NULL),(3478,4,410,0.370000,30,6,0,NULL,NULL),(3479,4,411,0.370000,30,6,0,NULL,NULL),(3480,4,412,0.370000,30,6,0,NULL,NULL),(3481,4,413,0.370000,30,6,0,NULL,NULL),(3482,4,414,0.370000,30,6,0,NULL,NULL),(3483,4,415,0.370000,30,6,0,NULL,NULL),(3484,4,416,0.370000,30,6,0,NULL,NULL),(3485,4,417,0.370000,30,6,0,NULL,NULL),(3486,4,418,0.370000,30,6,0,NULL,NULL),(3487,4,419,0.370000,30,6,0,NULL,NULL),(3488,4,420,0.370000,30,6,0,NULL,NULL),(3489,4,421,0.370000,30,6,0,NULL,NULL),(3490,4,422,0.370000,30,6,0,NULL,NULL),(3491,4,423,0.370000,30,6,0,NULL,NULL),(3492,4,424,0.370000,30,6,0,NULL,NULL),(3493,4,425,0.370000,30,6,0,NULL,NULL),(3494,4,426,0.370000,30,6,0,NULL,NULL),(3495,4,427,0.370000,30,6,0,NULL,NULL),(3496,4,428,0.370000,30,6,0,NULL,NULL),(3497,4,429,0.370000,30,6,0,NULL,NULL),(3498,4,430,0.370000,30,6,0,NULL,NULL),(3499,4,431,0.370000,30,6,0,NULL,NULL),(3500,4,432,0.370000,30,6,0,NULL,NULL),(3501,4,433,0.370000,30,6,0,NULL,NULL),(3502,4,434,0.370000,30,6,0,NULL,NULL),(3503,4,435,0.370000,30,6,0,NULL,NULL),(3504,4,436,0.370000,30,6,0,NULL,NULL),(3505,4,437,0.370000,30,6,0,NULL,NULL),(3506,4,438,0.370000,30,6,0,NULL,NULL),(3507,4,439,0.370000,30,6,0,NULL,NULL),(3508,4,440,0.370000,30,6,0,NULL,NULL),(3509,4,441,0.370000,30,6,0,NULL,NULL),(3510,4,442,0.370000,30,6,0,NULL,NULL),(3511,4,443,0.370000,30,6,0,NULL,NULL),(3512,4,444,0.370000,30,6,0,NULL,NULL),(3513,4,445,0.370000,30,6,0,NULL,NULL),(3514,4,446,0.370000,30,6,0,NULL,NULL),(3515,4,447,0.370000,30,6,0,NULL,NULL),(3516,4,448,0.370000,30,6,0,NULL,NULL),(3517,4,449,0.370000,30,6,0,NULL,NULL),(3518,4,450,0.370000,30,6,0,NULL,NULL),(3519,4,451,0.370000,30,6,0,NULL,NULL),(3520,4,452,0.370000,30,6,0,NULL,NULL),(3521,4,453,0.370000,30,6,0,NULL,NULL),(3522,4,454,0.370000,30,6,0,NULL,NULL),(3523,4,455,0.370000,30,6,0,NULL,NULL),(3524,4,456,0.370000,30,6,0,NULL,NULL),(3525,4,457,0.370000,30,6,0,NULL,NULL),(3526,4,458,0.370000,30,6,0,NULL,NULL),(3527,4,459,0.370000,30,6,0,NULL,NULL),(3528,4,460,0.370000,30,6,0,NULL,NULL),(3529,4,461,0.370000,30,6,0,NULL,NULL),(3530,4,462,0.370000,30,6,0,NULL,NULL),(3531,4,463,0.370000,30,6,0,NULL,NULL),(3532,4,464,0.370000,30,6,0,NULL,NULL),(3533,4,465,0.370000,30,6,0,NULL,NULL),(3534,4,466,0.370000,30,6,0,NULL,NULL),(3535,4,467,0.370000,30,6,0,NULL,NULL),(3536,4,468,0.370000,30,6,0,NULL,NULL),(3537,4,469,0.370000,30,6,0,NULL,NULL),(3538,4,470,0.370000,30,6,0,NULL,NULL),(3539,4,471,0.370000,30,6,0,NULL,NULL),(3540,4,472,0.370000,30,6,0,NULL,NULL),(3541,4,473,0.370000,30,6,0,NULL,NULL),(3542,4,474,0.370000,30,6,0,NULL,NULL),(3543,4,475,0.370000,30,6,0,NULL,NULL),(3544,4,476,0.370000,30,6,0,NULL,NULL),(3545,4,477,0.370000,30,6,0,NULL,NULL),(3546,4,478,0.370000,30,6,0,NULL,NULL),(3547,4,479,0.370000,30,6,0,NULL,NULL),(3548,4,480,0.370000,30,6,0,NULL,NULL),(3549,4,481,0.370000,30,6,0,NULL,NULL),(3550,4,482,0.370000,30,6,0,NULL,NULL),(3551,4,483,0.370000,30,6,0,NULL,NULL),(3552,4,484,0.370000,30,6,0,NULL,NULL),(3553,4,485,0.370000,30,6,0,NULL,NULL),(3554,4,486,0.370000,30,6,0,NULL,NULL),(3555,4,487,0.370000,30,6,0,NULL,NULL),(3556,4,488,0.370000,30,6,0,NULL,NULL),(3557,4,490,0.370000,30,6,0,NULL,NULL),(3558,4,491,0.370000,30,6,0,NULL,NULL),(3559,4,492,0.370000,30,6,0,NULL,NULL),(3560,4,493,0.370000,30,6,0,NULL,NULL),(3561,4,494,0.370000,30,6,0,NULL,NULL),(3562,4,495,0.370000,30,6,0,NULL,NULL),(3563,4,496,0.370000,30,6,0,NULL,NULL),(3564,4,497,0.370000,30,6,0,NULL,NULL),(3565,4,498,0.370000,30,6,0,NULL,NULL),(3566,4,499,0.370000,30,6,0,NULL,NULL),(3567,4,500,0.370000,30,6,0,NULL,NULL),(3568,4,501,0.370000,30,6,0,NULL,NULL),(3569,4,502,0.370000,30,6,0,NULL,NULL),(3570,4,503,0.370000,30,6,0,NULL,NULL),(3571,4,504,0.370000,30,6,0,NULL,NULL),(3572,4,505,0.370000,30,6,0,NULL,NULL),(3573,4,506,0.370000,30,6,0,NULL,NULL),(3574,4,507,0.370000,30,6,0,NULL,NULL),(3575,4,508,0.370000,30,6,0,NULL,NULL),(3576,4,509,0.370000,30,6,0,NULL,NULL),(3577,4,510,0.370000,30,6,0,NULL,NULL),(3578,4,511,0.370000,30,6,0,NULL,NULL),(3579,4,512,0.370000,30,6,0,NULL,NULL),(3580,4,513,0.370000,30,6,0,NULL,NULL),(3581,4,514,0.370000,30,6,0,NULL,NULL),(3582,4,515,0.370000,30,6,0,NULL,NULL),(3583,4,516,0.370000,30,6,0,NULL,NULL),(3584,4,517,0.370000,30,6,0,NULL,NULL),(3585,4,518,0.370000,30,6,0,NULL,NULL),(3586,4,519,0.370000,30,6,0,NULL,NULL),(3587,4,520,0.370000,30,6,0,NULL,NULL),(3588,4,521,0.370000,30,6,0,NULL,NULL),(3589,4,522,0.370000,30,6,0,NULL,NULL),(3590,4,523,0.370000,30,6,0,NULL,NULL),(3591,4,524,0.370000,30,6,0,NULL,NULL),(3592,4,525,0.370000,30,6,0,NULL,NULL),(3593,4,526,0.370000,30,6,0,NULL,NULL),(3594,4,527,0.370000,30,6,0,NULL,NULL),(3595,4,528,0.370000,30,6,0,NULL,NULL),(3596,4,529,0.370000,30,6,0,NULL,NULL),(3597,4,530,0.370000,30,6,0,NULL,NULL),(3598,4,531,0.370000,30,6,0,NULL,NULL),(3599,4,532,0.370000,30,6,0,NULL,NULL),(3600,4,533,0.370000,30,6,0,NULL,NULL),(3601,4,534,0.370000,30,6,0,NULL,NULL),(3602,4,535,0.370000,30,6,0,NULL,NULL),(3603,4,536,0.370000,30,6,0,NULL,NULL),(3604,4,537,0.370000,30,6,0,NULL,NULL),(3605,4,538,0.370000,30,6,0,NULL,NULL),(3606,4,539,0.370000,30,6,0,NULL,NULL),(3607,4,540,0.370000,30,6,0,NULL,NULL),(3608,4,541,0.370000,30,6,0,NULL,NULL),(3609,4,542,0.370000,30,6,0,NULL,NULL),(3610,4,543,0.370000,30,6,0,NULL,NULL),(3611,4,544,0.370000,30,6,0,NULL,NULL),(3612,4,545,0.370000,30,6,0,NULL,NULL),(3613,4,546,0.370000,30,6,0,NULL,NULL),(3614,4,547,0.370000,30,6,0,NULL,NULL),(3615,4,548,0.370000,30,6,0,NULL,NULL),(3616,4,549,0.370000,30,6,0,NULL,NULL),(3617,4,550,0.370000,30,6,0,NULL,NULL),(3618,4,551,0.370000,30,6,0,NULL,NULL),(3619,4,552,0.370000,30,6,0,NULL,NULL),(3620,4,553,0.370000,30,6,0,NULL,NULL),(3621,4,554,0.370000,30,6,0,NULL,NULL),(3622,4,555,0.370000,30,6,0,NULL,NULL),(3623,4,556,0.370000,30,6,0,NULL,NULL),(3624,4,557,0.370000,30,6,0,NULL,NULL),(3625,4,558,0.370000,30,6,0,NULL,NULL),(3626,4,559,0.370000,30,6,0,NULL,NULL),(3627,4,560,0.370000,30,6,0,NULL,NULL),(3628,4,561,0.370000,30,6,0,NULL,NULL),(3629,4,562,0.370000,30,6,0,NULL,NULL),(3630,4,3,0.370000,30,6,0,NULL,NULL),(3631,4,563,0.370000,30,6,0,NULL,NULL),(3632,4,564,0.370000,30,6,0,NULL,NULL),(3633,4,565,0.370000,30,6,0,NULL,NULL),(3634,4,566,0.370000,30,6,0,NULL,NULL),(3635,4,567,0.370000,30,6,0,NULL,NULL),(3636,4,568,0.370000,30,6,0,NULL,NULL),(3637,4,569,0.370000,30,6,0,NULL,NULL),(3638,4,570,0.370000,30,6,0,NULL,NULL),(3639,4,571,0.370000,30,6,0,NULL,NULL),(3640,4,572,0.370000,30,6,0,NULL,NULL),(3641,4,573,0.370000,30,6,0,NULL,NULL),(3642,4,574,0.370000,30,6,0,NULL,NULL),(3643,4,575,0.370000,30,6,0,NULL,NULL),(3644,4,576,0.370000,30,6,0,NULL,NULL),(3645,4,577,0.370000,30,6,0,NULL,NULL),(3646,4,578,0.370000,30,6,0,NULL,NULL),(3647,4,579,0.370000,30,6,0,NULL,NULL),(3648,4,580,0.370000,30,6,0,NULL,NULL),(3649,4,581,0.370000,30,6,0,NULL,NULL),(3650,4,582,0.370000,30,6,0,NULL,NULL),(3651,4,583,0.370000,30,6,0,NULL,NULL),(3652,4,584,0.370000,30,6,0,NULL,NULL),(3653,4,585,0.370000,30,6,0,NULL,NULL),(3654,4,586,0.370000,30,6,0,NULL,NULL),(3655,4,587,0.370000,30,6,0,NULL,NULL),(3656,4,588,0.370000,30,6,0,NULL,NULL),(3657,4,589,0.370000,30,6,0,NULL,NULL),(3658,4,590,0.370000,30,6,0,NULL,NULL),(3659,4,591,0.370000,30,6,0,NULL,NULL),(3660,4,592,0.370000,30,6,0,NULL,NULL),(3661,4,593,0.370000,30,6,0,NULL,NULL),(3662,4,594,0.370000,30,6,0,NULL,NULL),(3663,4,595,0.370000,30,6,0,NULL,NULL),(3664,4,596,0.370000,30,6,0,NULL,NULL),(3665,4,28,0.370000,30,6,0,NULL,NULL),(3666,4,597,0.370000,30,6,0,NULL,NULL),(3667,4,598,0.370000,30,6,0,NULL,NULL),(3668,4,599,0.370000,30,6,0,NULL,NULL),(3669,4,600,0.370000,30,6,0,NULL,NULL),(3670,4,601,0.370000,30,6,0,NULL,NULL),(3671,4,602,0.370000,30,6,0,NULL,NULL),(3672,4,603,0.370000,30,6,0,NULL,NULL),(3673,4,604,0.370000,30,6,0,NULL,NULL),(3674,4,605,0.370000,30,6,0,NULL,NULL),(3675,4,606,0.370000,30,6,0,NULL,NULL),(3676,4,607,0.370000,30,6,0,NULL,NULL),(3677,4,608,0.370000,30,6,0,NULL,NULL),(3678,4,609,0.370000,30,6,0,NULL,NULL),(3679,4,610,0.370000,30,6,0,NULL,NULL),(3680,4,611,0.370000,30,6,0,NULL,NULL),(3681,4,612,0.370000,30,6,0,NULL,NULL),(3682,4,613,0.370000,30,6,0,NULL,NULL),(3683,4,614,0.370000,30,6,0,NULL,NULL),(3684,4,615,0.370000,30,6,0,NULL,NULL),(3685,4,616,0.370000,30,6,0,NULL,NULL),(3686,4,617,0.370000,30,6,0,NULL,NULL),(3687,4,618,0.370000,30,6,0,NULL,NULL),(3688,4,619,0.370000,30,6,0,NULL,NULL),(3689,4,620,0.370000,30,6,0,NULL,NULL),(3690,4,621,0.370000,30,6,0,NULL,NULL),(3691,4,622,0.370000,30,6,0,NULL,NULL),(3692,4,623,0.370000,30,6,0,NULL,NULL),(3693,4,624,0.370000,30,6,0,NULL,NULL),(3694,4,625,0.370000,30,6,0,NULL,NULL),(3695,4,626,0.370000,30,6,0,NULL,NULL),(3696,4,627,0.370000,30,6,0,NULL,NULL),(3697,4,628,0.370000,30,6,0,NULL,NULL),(3698,4,629,0.370000,30,6,0,NULL,NULL),(3699,4,630,0.370000,30,6,0,NULL,NULL),(3700,4,631,0.370000,30,6,0,NULL,NULL),(3701,4,632,0.370000,30,6,0,NULL,NULL),(3702,4,633,0.370000,30,6,0,NULL,NULL);
/*!40000 ALTER TABLE `pkg_rate_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_refill`
--

DROP TABLE IF EXISTS `pkg_refill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_refill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `credit` decimal(15,5) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `refill_type` tinyint(4) NOT NULL DEFAULT 0,
  `payment` tinyint(1) DEFAULT 0,
  `invoice_number` varchar(50) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_logrefill` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_logrefill` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_refill`
--

LOCK TABLES `pkg_refill` WRITE;
/*!40000 ALTER TABLE `pkg_refill` DISABLE KEYS */;
INSERT INTO `pkg_refill` VALUES (1,2,'2023-02-25 23:16:53',15.00000,'sdfsdfsgrege, Crédito anterior 0',0,1,'',''),(2,3,'2023-02-25 23:16:53',11.00000,'regehrthtrtrthrth, Crédito anterior 0',0,1,'',''),(3,4,'2023-03-20 05:23:42',50.00000,'dsdsadasdasdasdasd, Crédito anterior 0',0,1,'','');
/*!40000 ALTER TABLE `pkg_refill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_refill_icepay`
--

DROP TABLE IF EXISTS `pkg_refill_icepay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_refill_icepay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `credit` decimal(15,5) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_refill_icepay`
--

LOCK TABLES `pkg_refill_icepay` WRITE;
/*!40000 ALTER TABLE `pkg_refill_icepay` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_refill_icepay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_refill_provider`
--

DROP TABLE IF EXISTS `pkg_refill_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_refill_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_provider` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `credit` decimal(15,5) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `payment` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_provider_pkg_logrefill_provider` (`id_provider`),
  CONSTRAINT `fk_pkg_provider_pkg_logrefill_provider` FOREIGN KEY (`id_provider`) REFERENCES `pkg_provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_refill_provider`
--

LOCK TABLES `pkg_refill_provider` WRITE;
/*!40000 ALTER TABLE `pkg_refill_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_refill_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_restrict_phone`
--

DROP TABLE IF EXISTS `pkg_restrict_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_restrict_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `number` varchar(20) NOT NULL,
  `direction` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_restricted_phonenumber` (`id_user`),
  KEY `number` (`number`),
  CONSTRAINT `fk_pkg_user_pkg_restricted_phonenumber` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_restrict_phone`
--

LOCK TABLES `pkg_restrict_phone` WRITE;
/*!40000 ALTER TABLE `pkg_restrict_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_restrict_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_send_credit`
--

DROP TABLE IF EXISTS `pkg_send_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_send_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `service` varchar(50) NOT NULL,
  `number` varchar(30) NOT NULL,
  `profit` varchar(10) DEFAULT '0',
  `earned` varchar(20) DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `total_sale` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_send_credit`
--

LOCK TABLES `pkg_send_credit` WRITE;
/*!40000 ALTER TABLE `pkg_send_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_send_credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_servers`
--

DROP TABLE IF EXISTS `pkg_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `host` varchar(100) NOT NULL,
  `public_ip` varchar(80) DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL,
  `port` char(10) NOT NULL,
  `sip_port` int(7) NOT NULL DEFAULT 5060,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) NOT NULL DEFAULT 'freeswitch',
  `weight` int(1) NOT NULL DEFAULT 1,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_servers`
--

LOCK TABLES `pkg_servers` WRITE;
/*!40000 ALTER TABLE `pkg_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_services`
--

DROP TABLE IF EXISTS `pkg_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `description` text DEFAULT NULL,
  `disk_space` int(11) DEFAULT NULL,
  `sipaccountlimit` int(11) DEFAULT NULL,
  `calllimit` int(11) DEFAULT NULL,
  `return_credit` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_services`
--

LOCK TABLES `pkg_services` WRITE;
/*!40000 ALTER TABLE `pkg_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_services_module`
--

DROP TABLE IF EXISTS `pkg_services_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_services_module` (
  `id_services` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `action` varchar(45) NOT NULL,
  `show_menu` tinyint(1) NOT NULL DEFAULT 1,
  `createShortCut` tinyint(1) NOT NULL DEFAULT 0,
  `createQuickStart` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_services`,`id_module`),
  KEY `fk_pkg_services_module_pkg_module` (`id_module`),
  CONSTRAINT `fk_pkg_services_module_pkg_module` FOREIGN KEY (`id_module`) REFERENCES `pkg_module` (`id`),
  CONSTRAINT `fk_pkg_services_pkg_services_module` FOREIGN KEY (`id_services`) REFERENCES `pkg_services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_services_module`
--

LOCK TABLES `pkg_services_module` WRITE;
/*!40000 ALTER TABLE `pkg_services_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_services_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_services_plan`
--

DROP TABLE IF EXISTS `pkg_services_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_services_plan` (
  `id_services` int(11) NOT NULL,
  `id_plan` int(11) NOT NULL,
  PRIMARY KEY (`id_services`,`id_plan`),
  KEY `fk_pkg_services_pkg_services_plan` (`id_services`),
  KEY `fk_pkg_plan_pkg_services_plan` (`id_plan`),
  CONSTRAINT `fk_pkg_plan_pkg_services_plan` FOREIGN KEY (`id_plan`) REFERENCES `pkg_plan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_services_pkg_services_plan` FOREIGN KEY (`id_services`) REFERENCES `pkg_services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_services_plan`
--

LOCK TABLES `pkg_services_plan` WRITE;
/*!40000 ALTER TABLE `pkg_services_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_services_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_services_use`
--

DROP TABLE IF EXISTS `pkg_services_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_services_use` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_services` int(11) NOT NULL,
  `reservationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `releasedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contract_period` datetime DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `month_payed` int(11) DEFAULT 0,
  `reminded` tinyint(4) NOT NULL DEFAULT 0,
  `id_method` int(11) DEFAULT NULL,
  `next_due_date` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_services_use` (`id_user`),
  KEY `fk_pkg_services_pkg_services_use` (`id_services`),
  CONSTRAINT `fk_pkg_services_pkg_services_use` FOREIGN KEY (`id_services`) REFERENCES `pkg_services` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_services_use` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_services_use`
--

LOCK TABLES `pkg_services_use` WRITE;
/*!40000 ALTER TABLE `pkg_services_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_services_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_sip`
--

DROP TABLE IF EXISTS `pkg_sip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_sip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `accountcode` varchar(30) DEFAULT NULL,
  `alias` varchar(10) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int(11) DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `videosupport` enum('yes','no') DEFAULT 'no',
  `callgroup` char(10) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `context` varchar(80) DEFAULT NULL,
  `DEFAULTip` char(15) DEFAULT NULL,
  `dtmfmode` char(7) DEFAULT 'RFC2833',
  `fromuser` varchar(80) DEFAULT NULL,
  `fromdomain` varchar(80) DEFAULT NULL,
  `host` varchar(31) DEFAULT NULL,
  `insecure` varchar(20) DEFAULT NULL,
  `language` char(2) DEFAULT NULL,
  `mailbox` varchar(50) DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int(11) DEFAULT NULL,
  `session-minse` int(11) DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `md5secret` varchar(80) DEFAULT NULL,
  `nat` varchar(25) DEFAULT 'force_rport,comedia',
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `pickupgroup` char(10) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `qualify` char(7) DEFAULT 'yes',
  `rtptimeout` int(11) DEFAULT NULL,
  `rtpholdtimeout` int(11) DEFAULT NULL,
  `secret` varchar(80) DEFAULT NULL,
  `type` char(6) DEFAULT 'friend',
  `disallow` varchar(100) DEFAULT 'all',
  `allow` varchar(100) DEFAULT NULL,
  `regseconds` int(11) DEFAULT 0,
  `ipaddr` char(45) DEFAULT NULL,
  `fullcontact` varchar(80) DEFAULT NULL,
  `setvar` varchar(100) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `lastms` varchar(11) DEFAULT NULL,
  `defaultuser` varchar(40) DEFAULT NULL,
  `auth` varchar(10) DEFAULT NULL,
  `subscribemwi` varchar(10) DEFAULT NULL,
  `vmexten` varchar(20) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` varchar(20) DEFAULT NULL,
  `usereqphone` varchar(10) DEFAULT NULL,
  `mohsuggest` varchar(20) DEFAULT NULL,
  `allowtransfer` varchar(20) DEFAULT 'no',
  `autoframing` varchar(10) DEFAULT NULL,
  `maxcallbitrate` int(11) DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `rtpkeepalive` int(11) DEFAULT NULL,
  `useragent` varchar(100) DEFAULT NULL,
  `calllimit` int(11) DEFAULT NULL,
  `status` smallint(1) DEFAULT 1,
  `directmedia` varchar(10) DEFAULT 'no',
  `sippasswd` varchar(50) DEFAULT NULL,
  `callshopnumber` varchar(15) DEFAULT NULL,
  `callshoptime` int(11) DEFAULT 0,
  `callbackextension` varchar(40) DEFAULT NULL,
  `sip_group` varchar(20) DEFAULT NULL,
  `ringfalse` tinyint(1) NOT NULL DEFAULT 0,
  `record_call` tinyint(1) NOT NULL DEFAULT 0,
  `voicemail` tinyint(1) NOT NULL DEFAULT 0,
  `voicemail_email` varchar(100) DEFAULT NULL,
  `voicemail_password` int(11) DEFAULT NULL,
  `forward` varchar(50) NOT NULL DEFAULT '',
  `url_events` varchar(150) DEFAULT NULL,
  `block_call_reg` varchar(100) NOT NULL DEFAULT '',
  `dial_timeout` int(11) NOT NULL DEFAULT 60,
  `techprefix` int(6) DEFAULT NULL,
  `trace` tinyint(1) NOT NULL DEFAULT 0,
  `addparameter` varchar(50) NOT NULL DEFAULT '',
  `amd` int(11) NOT NULL DEFAULT 0,
  `sip_config` text DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `id_trunk_group` int(11) DEFAULT NULL,
  `cnl` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `techprefix` (`techprefix`),
  KEY `host` (`host`),
  KEY `ipaddr` (`ipaddr`),
  KEY `port` (`port`),
  KEY `pkg_sip_hp_index` (`host`,`port`),
  KEY `pkg_sip_ip_index` (`ipaddr`,`port`),
  KEY `fk_pkg_user_pkg_sip_buddies` (`id_user`),
  KEY `name` (`name`),
  CONSTRAINT `fk_pkg_user_pkg_sip_buddies` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_sip`
--

LOCK TABLES `pkg_sip` WRITE;
/*!40000 ALTER TABLE `pkg_sip` DISABLE KEYS */;
INSERT INTO `pkg_sip` VALUES (1,2,'621105','621105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'no',NULL,'981343410','billing',NULL,'RFC2833','',NULL,'dynamic','no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'force_rport,comedia',NULL,NULL,NULL,NULL,'yes',NULL,NULL,'passion11','friend','all','g723,gsm,g726,opus,alaw,ulaw,g722',0,NULL,NULL,NULL,NULL,NULL,'621105',NULL,NULL,NULL,'981343410',NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'no',NULL,NULL,0,NULL,NULL,0,1,0,'',NULL,'',NULL,'',60,NULL,0,'',0,'',NULL,NULL,''),(2,3,'623781','623781',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'no',NULL,'991261195','billing',NULL,'RFC2833','',NULL,'dynamic','no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'force_rport,comedia',NULL,NULL,NULL,NULL,'yes',NULL,NULL,'passion11','friend','all','g723,gsm,g726,opus,alaw,ulaw,g722',0,NULL,NULL,NULL,NULL,NULL,'623781',NULL,NULL,NULL,'991261195',NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'no',NULL,NULL,0,NULL,NULL,0,1,0,'',NULL,'',NULL,'',60,NULL,0,'',0,'',NULL,NULL,'');
/*!40000 ALTER TABLE `pkg_sip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_sipura`
--

DROP TABLE IF EXISTS `pkg_sipura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_sipura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `macadr` varchar(12) NOT NULL DEFAULT '',
  `senha_admin` varchar(8) NOT NULL DEFAULT '',
  `senha_user` varchar(8) NOT NULL DEFAULT '',
  `antireset` char(3) NOT NULL DEFAULT '',
  `lastmov` varchar(20) NOT NULL DEFAULT '',
  `estado` char(2) NOT NULL DEFAULT '',
  `obs` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `DHCP` char(3) NOT NULL DEFAULT 'yes',
  `Static_IP` varchar(15) NOT NULL DEFAULT '',
  `NetMask` varchar(15) NOT NULL DEFAULT '',
  `Gateway` varchar(15) NOT NULL DEFAULT '',
  `Primary_DNS` varchar(15) NOT NULL DEFAULT '',
  `Secondary_DNS` varchar(15) NOT NULL DEFAULT '',
  `Provision_Enable` char(3) NOT NULL DEFAULT 'yes',
  `Profile_Rule` varchar(60) DEFAULT 'http://billing.magnusbilling.com/x.php',
  `SIP_Port_1` varchar(5) NOT NULL DEFAULT '5060',
  `Proxy_1` varchar(60) NOT NULL DEFAULT '',
  `Use_Outbound_Proxy_1` char(3) NOT NULL DEFAULT 'no',
  `Outbound_Proxy_1` varchar(60) NOT NULL DEFAULT '',
  `Use_OB_Proxy_In_Dialog_1` char(3) NOT NULL DEFAULT 'yes',
  `Register_1` char(3) NOT NULL DEFAULT 'yes',
  `Make_Call_Without_Reg_1` char(3) NOT NULL DEFAULT 'no',
  `Register_Expires_1` varchar(4) NOT NULL DEFAULT '90',
  `Ans_Call_Without_Reg_1` char(3) NOT NULL DEFAULT 'no',
  `Use_DNS_SRV_1` char(3) NOT NULL DEFAULT 'yes',
  `DNS_SRV_Auto_Prefix_1` char(3) NOT NULL DEFAULT 'no',
  `Proxy_Fallback_Intvl_1` varchar(4) NOT NULL DEFAULT '3600',
  `Voice_Mail_Server_1` varchar(30) NOT NULL DEFAULT '',
  `SIP_Port_2` varchar(5) NOT NULL DEFAULT '5061',
  `Proxy_2` varchar(60) NOT NULL DEFAULT '',
  `Use_Outbound_Proxy_2` char(3) NOT NULL DEFAULT 'no',
  `Outbound_Proxy_2` varchar(60) NOT NULL DEFAULT '',
  `Use_OB_Proxy_In_Dialog_2` char(3) NOT NULL DEFAULT 'yes',
  `Register_2` char(3) NOT NULL DEFAULT 'yes',
  `Make_Call_Without_Reg_2` char(3) NOT NULL DEFAULT 'no',
  `Register_Expires_2` varchar(4) NOT NULL DEFAULT '120',
  `Ans_Call_Without_Reg_2` char(3) NOT NULL DEFAULT 'no',
  `Use_DNS_SRV_2` char(3) NOT NULL DEFAULT 'yes',
  `DNS_SRV_Auto_Prefix_2` char(3) NOT NULL DEFAULT 'no',
  `Proxy_Fallback_Intvl_2` varchar(4) NOT NULL DEFAULT '3600',
  `Voice_Mail_Server_2` varchar(30) NOT NULL DEFAULT '',
  `Display_Name_1` varchar(30) NOT NULL DEFAULT '',
  `Display_Name_2` varchar(30) NOT NULL DEFAULT '',
  `User_ID_1` varchar(25) NOT NULL DEFAULT '',
  `User_ID_2` varchar(25) NOT NULL DEFAULT '',
  `Password_1` varchar(25) NOT NULL DEFAULT '',
  `Password_2` varchar(25) NOT NULL DEFAULT '',
  `Use_Auth_ID_1` char(3) NOT NULL DEFAULT 'no',
  `Use_Auth_ID_2` char(3) NOT NULL DEFAULT '',
  `Auth_ID_1` varchar(25) NOT NULL DEFAULT '',
  `Auth_ID_2` varchar(25) NOT NULL DEFAULT '',
  `Preferred_Codec_1` varchar(8) NOT NULL DEFAULT 'G729a',
  `Preferred_Codec_2` varchar(8) NOT NULL DEFAULT 'G729a',
  `Use_Pref_Codec_Only_1` char(3) NOT NULL DEFAULT 'no',
  `Use_Pref_Codec_Only_2` char(3) NOT NULL DEFAULT 'no',
  `Dial_Plan_1` longtext NOT NULL,
  `Dial_Plan_2` longtext NOT NULL,
  `Caller_Conn_Polarity_1` varchar(10) NOT NULL DEFAULT 'Forward',
  `Caller_Conn_Polarity_2` varchar(10) NOT NULL DEFAULT 'Forward',
  `altera` char(3) NOT NULL DEFAULT 'si',
  `fultmov` varchar(30) NOT NULL DEFAULT '0000-00-00',
  `fultlig` varchar(30) NOT NULL DEFAULT '0000-00-00',
  `Enable_Web_Server` char(3) NOT NULL DEFAULT 'yes',
  `origem` varchar(5) NOT NULL DEFAULT '',
  `username` varchar(20) NOT NULL DEFAULT 'patel',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `last_port` varchar(5) NOT NULL DEFAULT '',
  `Web_Server_Port` varchar(5) NOT NULL DEFAULT '80',
  `conf01` char(1) NOT NULL DEFAULT '',
  `conf02` char(1) NOT NULL DEFAULT '',
  `conf03` char(1) NOT NULL DEFAULT '',
  `borrado` char(2) NOT NULL DEFAULT '',
  `marca` char(2) NOT NULL DEFAULT 'X',
  `contador` int(5) NOT NULL DEFAULT 0,
  `nserie` varchar(15) NOT NULL DEFAULT '',
  `Callee_Conn_Polarity_1` varchar(10) NOT NULL DEFAULT 'Forward',
  `Callee_Conn_Polarity_2` varchar(10) NOT NULL DEFAULT 'Forward',
  `Idle_Conn_Polarity_1` varchar(10) NOT NULL DEFAULT 'Forward',
  `Idle_Conn_Polarity_2` varchar(10) NOT NULL DEFAULT 'Forward',
  `Jitter_1` varchar(20) NOT NULL DEFAULT 'high',
  `Jitter_2` varchar(20) NOT NULL DEFAULT 'high',
  `RTP_Packet_Size` varchar(10) NOT NULL DEFAULT '0.030',
  `AVT_Dynamic_Payload` varchar(10) NOT NULL DEFAULT '101',
  `STUN_Enable` char(3) NOT NULL DEFAULT 'no',
  `STUN_Server` varchar(80) NOT NULL DEFAULT '',
  `Dial_Tone` varchar(80) NOT NULL DEFAULT '420@-16;10(*/0/1)',
  `Busy_Tone` varchar(80) NOT NULL DEFAULT '480@-19,620@-19;10(.5/.5/1+2)',
  `Reorder_Tone` varchar(80) NOT NULL DEFAULT '480@-19,620@-19;10(.25/.25/1+2)',
  `Ring_Back_Tone` varchar(80) NOT NULL DEFAULT '440@-19,480@-19;*(2/4/1+2)',
  `Hook_Flash_Timer_Min` varchar(10) NOT NULL DEFAULT '.1',
  `Hook_Flash_Timer_Max` varchar(10) NOT NULL DEFAULT '.9',
  `Time_Zone` varchar(20) NOT NULL DEFAULT 'GMT',
  `FXS_Port_Input_Gain` varchar(10) NOT NULL DEFAULT '-3',
  `FXS_Port_Output_Gain` varchar(10) NOT NULL DEFAULT '-3',
  `Echo_Supp_Enable_1_` char(3) NOT NULL DEFAULT 'yes',
  `Echo_Supp_Enable_2_` char(3) NOT NULL DEFAULT 'yes',
  `NAT_Keep_Alive_Enable_1_` char(3) NOT NULL DEFAULT 'no',
  `NAT_Keep_Alive_Enable_2_` char(3) NOT NULL DEFAULT 'no',
  `NAT_Mapping_Enable_1_` char(3) NOT NULL DEFAULT 'no',
  `NAT_Mapping_Enable_2_` char(3) NOT NULL DEFAULT 'no',
  `NAT_Keep_Alive_Dest_1_` varchar(80) DEFAULT '$PROXY',
  `NAT_Keep_Alive_Dest_2_` varchar(80) DEFAULT '$PROXY',
  `SIP_TOS_DiffServ_Value_1_` varchar(20) NOT NULL DEFAULT '0x68',
  `SIP_TOS_DiffServ_Value_2_` varchar(20) NOT NULL DEFAULT '0x68',
  `RTP_TOS_DiffServ_Value_1_` varchar(20) NOT NULL DEFAULT '0xb8',
  `RTP_TOS_DiffServ_Value_2_` varchar(20) NOT NULL DEFAULT '0xb8',
  `Upgrade_Enable` char(3) NOT NULL DEFAULT 'no',
  `Upgrade_Rule` varchar(80) NOT NULL DEFAULT '',
  `falta` date NOT NULL DEFAULT '0000-00-00',
  `Silence_Supp_Enable_1_` char(3) NOT NULL DEFAULT 'no',
  `Silence_Supp_Enable_2_` char(3) NOT NULL DEFAULT 'no',
  `DTMF_Tx_Method_1_` varchar(20) NOT NULL DEFAULT 'Auto',
  `DTMF_Tx_Method_2_` varchar(20) NOT NULL DEFAULT 'Auto',
  `Enable_IP_Dialing_1_` char(3) NOT NULL DEFAULT 'no',
  `Enable_IP_Dialing_2_` char(3) NOT NULL DEFAULT 'no',
  `SAS_DLG_Refresh_Intvl_1_` varchar(10) NOT NULL DEFAULT '30',
  `SAS_DLG_Refresh_Intvl_2_` varchar(10) NOT NULL DEFAULT '30',
  `SAS_Enable_1_` char(3) NOT NULL DEFAULT 'no',
  `SAS_Enable_2_` char(3) NOT NULL DEFAULT 'no',
  `ruleb` varchar(20) NOT NULL DEFAULT '',
  `RTP_Port_Min` varchar(10) NOT NULL DEFAULT '16384',
  `RTP_Port_Max` varchar(10) NOT NULL DEFAULT '16482',
  `Syslog_Server` varchar(20) NOT NULL DEFAULT '',
  `Debug_Server` varchar(20) NOT NULL DEFAULT '',
  `Debug_Level` char(1) NOT NULL DEFAULT '0',
  `SIP_Debug_Option_1_` varchar(25) NOT NULL DEFAULT 'none',
  `SIP_Debug_Option_2_` varchar(25) NOT NULL DEFAULT 'none',
  `Blind_Attn_Xfer_Enable_1_` char(3) NOT NULL DEFAULT 'no',
  `Blind_Attn_Xfer_Enable_2_` char(3) NOT NULL DEFAULT 'no',
  `Xfer_When_Hangup_Conf_1_` char(3) NOT NULL DEFAULT 'yes',
  `Xfer_When_Hangup_Conf_2_` char(3) NOT NULL DEFAULT 'yes',
  `Three_Way_Call_Serv_1_` char(3) NOT NULL DEFAULT 'yes',
  `Three_Way_Call_Serv_2_` char(3) NOT NULL DEFAULT 'yes',
  `Attn_Transfer_Serv_1_` char(3) NOT NULL DEFAULT 'yes',
  `Attn_Transfer_Serv_2_` char(3) NOT NULL DEFAULT 'yes',
  `Three_Way_Conf_Serv_1_` char(3) NOT NULL DEFAULT 'yes',
  `Three_Way_Conf_Serv_2_` char(3) NOT NULL DEFAULT 'yes',
  `Unattn_Transfer_Serv_1_` char(3) NOT NULL DEFAULT 'yes',
  `Unattn_Transfer_Serv_2_` char(3) NOT NULL DEFAULT 'yes',
  `nombre` tinytext DEFAULT NULL,
  `Handle_VIA_received` char(3) NOT NULL DEFAULT 'no',
  `Handle_VIA_rport` char(3) NOT NULL DEFAULT 'no',
  `Insert_VIA_received` char(3) NOT NULL DEFAULT 'no',
  `Insert_VIA_rport` char(3) NOT NULL DEFAULT 'no',
  `Substitute_VIA_Addr` char(3) NOT NULL DEFAULT 'no',
  `Send_Resp_To_Src_Port` char(3) NOT NULL DEFAULT 'no',
  `STUN_Test_Enable` char(3) NOT NULL DEFAULT 'no',
  `Interdigit_Long_Timer` char(3) NOT NULL DEFAULT '10',
  `Speed_Dial_2_1_` tinytext DEFAULT NULL,
  `Speed_Dial_3_1_` tinytext DEFAULT NULL,
  `Speed_Dial_4_1_` tinytext DEFAULT NULL,
  `Speed_Dial_5_1_` tinytext DEFAULT NULL,
  `Speed_Dial_6_1_` tinytext DEFAULT NULL,
  `Speed_Dial_7_1_` tinytext DEFAULT NULL,
  `Speed_Dial_8_1_` tinytext DEFAULT NULL,
  `Speed_Dial_9_1_` tinytext DEFAULT NULL,
  `Speed_Dial_2_2_` tinytext DEFAULT NULL,
  `Speed_Dial_3_2_` tinytext DEFAULT NULL,
  `Speed_Dial_4_2_` tinytext DEFAULT NULL,
  `Speed_Dial_5_2_` tinytext DEFAULT NULL,
  `Speed_Dial_6_2_` tinytext DEFAULT NULL,
  `Speed_Dial_7_2_` tinytext DEFAULT NULL,
  `Speed_Dial_8_2_` tinytext DEFAULT NULL,
  `Speed_Dial_9_2_` tinytext DEFAULT NULL,
  `Caller_ID_Method` tinytext DEFAULT NULL,
  UNIQUE KEY `interno` (`id`),
  KEY `email` (`email`,`id_user`),
  KEY `username` (`username`),
  KEY `fk_pkg_user_sipuras` (`id_user`),
  CONSTRAINT `fk_pkg_user_sipuras` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_sipura`
--

LOCK TABLES `pkg_sipura` WRITE;
/*!40000 ALTER TABLE `pkg_sipura` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_sipura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_sms`
--

DROP TABLE IF EXISTS `pkg_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `prefix` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `sms` mediumtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `rate` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `sms_from` varchar(16) DEFAULT NULL,
  `result` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_sms` (`id_user`),
  KEY `prefix` (`prefix`),
  KEY `date` (`date`),
  CONSTRAINT `fk_pkg_user_pkg_sms` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_sms`
--

LOCK TABLES `pkg_sms` WRITE;
/*!40000 ALTER TABLE `pkg_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_smtp`
--

DROP TABLE IF EXISTS `pkg_smtp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_smtp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `host` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `port` varchar(10) NOT NULL,
  `encryption` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_smtp` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_smtp` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_smtp`
--

LOCK TABLES `pkg_smtp` WRITE;
/*!40000 ALTER TABLE `pkg_smtp` DISABLE KEYS */;
INSERT INTO `pkg_smtp` VALUES (1,1,'mail.magnusbilling.com','billing@magnusbilling.com','magnus','587','null');
/*!40000 ALTER TABLE `pkg_smtp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_status_system`
--

DROP TABLE IF EXISTS `pkg_status_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_status_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `cpuMediaUso` float NOT NULL DEFAULT 0,
  `cpuPercent` float NOT NULL DEFAULT 0,
  `memTotal` int(11) DEFAULT NULL,
  `memUsed` float NOT NULL DEFAULT 0,
  `networkin` float NOT NULL DEFAULT 0,
  `networkout` float NOT NULL DEFAULT 0,
  `cpuModel` varchar(200) DEFAULT NULL,
  `uptime` varchar(200) DEFAULT NULL,
  `cps` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_status_system`
--

LOCK TABLES `pkg_status_system` WRITE;
/*!40000 ALTER TABLE `pkg_status_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_status_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_templatemail`
--

DROP TABLE IF EXISTS `pkg_templatemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_templatemail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `mailtype` char(50) DEFAULT NULL,
  `fromemail` char(70) DEFAULT NULL,
  `fromname` char(70) DEFAULT NULL,
  `subject` varchar(130) DEFAULT NULL,
  `messagehtml` varchar(3000) DEFAULT NULL,
  `language` varchar(5) DEFAULT 'br',
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_templatemail`
--

LOCK TABLES `pkg_templatemail` WRITE;
/*!40000 ALTER TABLE `pkg_templatemail` DISABLE KEYS */;
INSERT INTO `pkg_templatemail` VALUES (1,1,'signup','noreply@site.com','VoIP','Ativação de conta','<p>$firstname$ $lastname$, bem vindo ao nosso sistema de comunicação IP!</p>\n<p>Para concluir o processo de ativação de sua conta por favor clique no link abaixo:</p>\n<p><a href=\"http://ip/mbilling//index.php/signup/$idcard$?username=$cardnumber$&password=$password$&loginkey=$loginkey$\">\nhttp://ip/mbilling/index.php/signup/$idcard$?username=$cardnumber$&password=$password$&loginkey=$loginkey$</a></p>\n<br>\n<p>Por favor não esqueça de ativar sua conta.</p>\n<br>\n<p>  Usuário=$login$  </p>\n<p> Senha:$password$  </p>\n<br> \n<p>Atenciosamente,<br>','br',1),(2,1,'reminder','noreply@site.com','VoIP','Sua conta esta com saldo baixo ( R$ $credit$)','<p>Olá $firstname$ $lastname$, </p>\n<p>Sua conta VoIP número $cardnumber$ está com saldo baixo.</p>\n<br>\n<p>Seu saldo atual é de R$ $credit$, valor abaixo do mánimo configurado em sua conta (R$ $credit_notification$,00).</p>\n<p>Adquiria novos créditos e não fique sem falar.</p>\n<br>  \n<p>Para adquirir créditos, entrar em contato conosco ou desativar o aviso de saldo baixo acesse sua Ã¡rea de cliente através de nosso site.</p>\n<p>Observação: Caso possua limite de crédito conosco ele Ã© somado ao seu saldo para o envio de notificação de saldo baixo.</p>\n<br> \n<p>Atenciosamente,<br>\n ','br',1),(3,1,'signupconfirmed','noreply@site.com','VoIP','Bem Vindo','<p>Bem vindo !</p>\n<p>Configure seu softphone com os dados abaixo e comece a ligar agora mesmo:</p>\n<br>\n<p>Usuário=$login$  </p>\n<p>Senha:$password$  </p>\n<br> \n<p>Atenciosamente,<br>','br',1),(4,1,'did_paid','noreply@site.com','VoIP','Pagamento de Numero Virtual - ($did$)','<p>SALDO DISPONÍVEL $balance_remaining$ $base_currency$</p>\n<p>Foi debitado automaticamente de seu saldo o valor de R$ $did_cost$,00   referente ao pagamento de seu número virtual (DID) ($did$).</p> <p>Custo mensal de seu número virtual: R$ $did_cost$,00</p> \n<br> \n<p>Atenciosamente,<br> ','br',1),(5,1,'did_unpaid','noreply@site.com','VoIP','Notificação para pagamento de Número Virtual ($did$)','<p>Olá.</p>\n<p>Seu crédito atual (R$ $balance_remaining$ $base_currency$) não é suficiente para o pagamento mensal de seu número virtual DID ($did$).</p>\n<p>O custo mensal de seu DID é  $did_cost$ $base_currency$</p>\n<br>\n<p>Você tem $days_remaining$ para efetuar uma recarga no valor suficiente para o pagamento do seu número virtual.</p>\n<p>Qualquer dúvida por favor entre em contato através de nosso suporte<br> </p> \n<br> \n<p>Atenciosamente,<br>','br',1),(6,1,'did_released','noreply@site.com','VoIP','Did Cancelado','<p>Olá</p> <p>Seu Número Virtual (DID) $did$ foi automaticamente cancelado até que o pagamento de sua sua ultima fatura seja confirmado. </p> <p>Durante esse período não será possí­vel receber chamadas através do mesmo.</p>\n<br> \n<p>Atenciosamente,<br>','br',1),(7,1,'did_confirmation','noreply@site.com','VoIP','Número DID $did$ ativado','<p>Olá  $firstname$ $lastname$</p>\n<p>O número  $did$ foi ativado para a conta $login$.</p>\n<br>\n<p>Usuário=$login$  </p>\n<p>Senha:$password$  </p>\n<br> \n<p>Atenciosamente,<br>','br',1),(8,1,'refill','noreply@site.com','VoIP','Recarga de crédito confirmada','<p>Olá $firstname$ $lastname$</p>\n<p>Uma recarga de crédito foi realizada com sucesso em sua conta $login$.</p>\n<p>Número da recarga = $itemID$</p>\n<br> \n<p>Valor = $itemAmount$ $base_currency$</p>\n<br>\n<p>Descrição= $description$</p>\n<br>\n<p>Seu crédito atual é de $credit$ $base_currency$</p>\n<br> \n<p>Atenciosamente,<br>\n','br',1),(9,1,'plan_unpaid','noreply@site.com','VoIP','Aviso de Vencimento do Plano Mensal','<p>Estimado $firstname$ $lastname$. <br>\n  Enviamos esta mensagem para avisar que seu plano esta por vencer e não tem crédito para efetuar o pagamento. </p>\n<p>Por favor, entre em sua área de cliente, menu, Comprar Crédito, e compre mínimo $plancost$  $base_currency$ de crédito. </p>\n<br>\n<p>Usário=$login$  </p>\n<p>Senha:$password$  </p>\n<br> \n<p>Você tem $days_to_pay$ dias para fazer o pagamento, ou seu plano sera cancelado.</p>\n<br> \n<p>Atenciosamente,<br>','br',1),(10,1,'plan_paid','noreply@site.com','VoIP','Pagamento do plano recebido','<p>Estimado $firstname$ $lastname$.</p>\n<p>O pagamento do seu plano já foi efetuado.</p>\n<br>\n<p>Seu crédito atual é de $credit$ $base_currency$</p>\n<p>Usuário=$login$  </p>\n<p>Senha:$password$  </p>\n<br> \n<p>Atenciosamente,<br>','br',1),(11,1,'plan_released','noreply@site.com','VoIP','Plano cancelado','<p>Estimado $firstname$ $lastname$.</p>\n<p>Seu plano foi cancelado por falta de pagamento</p>\n<br>\n<p>Usuário=$login$  </p>\n<p>Senha:$password$  </p>\n<br> \n<p>Atenciosamente,<br>','br',1),(32,1,'signup','noreply@site.com','VoIP','Confirmación de email','<p style=\"color: rgb(0, 0, 0);\">$lastname$ $firstname$, gracias por registrarse con nosotros.</p>\n<p style=\"color: rgb(0, 0, 0);\">Por favor, copie y pegue el código a continuación en la página de registro para activar su cuenta. <br></p>\n<p style=\"color: rgb(0, 0, 0);\">$loginkey$</p>\n<p style=\"color: rgb(0, 0, 0);\">o haga clic aquí &nbsp;<a href=\"http://SU_IP/mbilling/index.php/signup/$iduser$?username=$login$&amp;password=$password$&amp;loginkey=$loginkey$\">http://SU_IP/mbilling/index.php/signup/$iduser$?username=$login$&amp;password=$password$&amp;loginkey=$loginkey$</a></p>\n<p style=\"color: rgb(0, 0, 0);\"><br>\n  \n\n\n  Por favor, asegúrese de activar su cuenta.</p><p style=\"color: rgb(0, 0, 0);\">Un cordial saludo<br></p>','es',1),(33,1,'reminder','noreply@site.com','VoIP','Su cuenta VoIP tiene poco crédito ( $credit$ $currency$)','Hola $lastname$ $firstname$, su cuenta esta con poco crédito USUARIO $login$.\n\n<p>En la actualidad, solo hay $credit$ $currency$ en su cuenta, que es menor que el nivel de alerta definido por usted, que es de ($credit_notification$ ).</p>\n<p>Por favor recargue su cuenta lo antes posible para garantizar la continuidad del servicio.</p>\n<p><a href=\"http://SU_IP/mbilling\">http://SU_IP/mbilling</a><br></p><p>Nombre de usuario: $login$</p>\n<p>Contraseña: $password$</p>\n<p>Un cordial saludo</p>\n\n\n','es',1),(34,1,'signupconfirmed','noreply@site.com','VoIP','Confirmación de registro','<p><strong>Ahora usted es un usuario registrado.</strong></p>\n<p>Para entrar en su panel de cliente:</p><p><br>\n  <a href=\"http://SU_IP/mbilling\">http://SU_IP/mbilling</a><br>\n  Su usuario es: $login$<br>\n  Su clave es : $password$</p>\n<p></p><p><br></p>\n<p>Un cordial saludo</p>\n','es',1),(35,1,'did_paid','noreply@site.com','VoIP','Cobranza de su número DID - $did$','<p>Hola $lastname$ $firstname$.</p>\n<p>El importe de $did_cost$ $base_currency$ fue cobrado de su cuenta por el pago mensual de su DID  ($did$)</p>\n<p>Costo mensual por su DID : $did_cost$ $base_currency$</p>\n<p>El crédito actual de su cuenta $login$, es de $credit$  $base_currency$</p>\n<p>Un cordial saludo</p>\n<p><b>$obs$</b><br></p>','es',1),(36,1,'did_unpaid','noreply@site.com','VoIP','Notificación de vencimiento de su número $did$','<p>Hola $firstname$ $lastname$, el crédito actual de su cuenta $login$ es de $balance_remaining$ $base_currency$</p>\n<p>Su crédito no es suficiente para pagar su número DID  ($did$), el costo mensual por su DID es de $did_cost$ $base_currency$</p>\n<p>Por favor agregue crédito a su cuenta antes del día de vencimiento del DID, o el DID será dado de baja automáticamente.</p>\n<p>Para cargar crédito, entre en su cuenta, y haga clic en el menú Comprar Crédito.<br>\n</p>\n<p>Un cordial saludo</p>\n<b>$obs$</b>','es',1),(37,1,'did_released','noreply@site.com','VoIP','DID desactivado - ($did$)','<p>Hola $firstname$ $lastname$</p>\n<p>Esta es una notificación que el número DID  $did$ ha sido desactivado de su cuenta $login$.</p>\n<p>Se dará de baja definitivamente si no se renueva inmediatamente.<br>\n  <br>Una notificación anterior ha sido enviada al correo electrónico de contacto que aparece en su cuenta.</p>\n<p>Un cordial saludo<br><br></p>\n<b>$obs$</b>\n','es',1),(38,1,'did_confirmation','noreply@site.com','VoIP','Activación de número Fijo DID','<p style=\"color: rgb(0, 0, 0);\">Hola  $firstname$ $lastname$, Felicitaciones! </p>\n<p style=\"color: rgb(0, 0, 0);\">El número  $did$ fue activado con éxito para la cuenta $login$.</p>\n<p style=\"color: rgb(0, 0, 0);\">Usted puede reenviar su número para un fijo o celular, para esto entre en su panel de cliente.</p><p style=\"color: rgb(0, 0, 0);\"><br><a href=\"http://SU_IP/mbilling\">\n  http://SU_IP/mbilling</a><br>\n  Nombre de usuario : $login$<br>\n  Contraseña : $password$</p>\n<p style=\"color: rgb(0, 0, 0);\">Un cordial saludo<br></p>','es',1),(39,1,'refill','noreply@site.com','VoIP','Recarga de crédito confirmada','<p>Hola $firstname$ $lastname$</p>\n<p>Una recarga de crédito fue realizada con éxito en su cuenta $login$.</p>\n\n<p>Número de la recarga = $itemID$</p>\n<p>Importe = $itemAmount$ $base_currency$</p>\n<p>Descripción = $description$</p>\n\n<p>Su crédito actual es de $credit$ $base_currency$</p>\n<br>\nUn cordial saludo<br>\n','es',1),(40,1,'plan_unpaid','noreply@site.com','VoIP','Aviso de Vencimiento del Plan Mensual','<p>Estimado $firstname$ $lastname$. <br>\n  Le enviamos este mensaje para comunicarle que su plan esta por vencer y no posee crédito para efectuar el pago. </p>\n<p>Ud. puede ingresar a su área de Cliente con estos datos:<br></p><p><br><a href=\"http://SU_IP/mbilling\">http://SU_IP/mbilling</a><br>\n  Usuario=$login$ <br>\n  Clave:$password$ </p>\n<p>Por favor recargue su cuenta o su plan sera dado de baja automáticamente en el dia del vencimiento. </p>\n<p>Un cordial saludo<br></p>\n<p><br></p>\n\n<b>$obs$</b>','es',1),(41,1,'plan_paid','noreply@site.com','VoIP','Confirmación de pago del plan mensual recibido','<p>Estimado $firstname$ $lastname$.</p>\n<p>El pago de su plan mensual ya fue efectuado.</p>\n<p>Su crédito actual es de $credit$ $base_currency$</p>\n<p>Quedamos a su entera disposición ante  cualquier inquietud.</p>\n<p>Un cordial saludo</p>\n<b>$obs$</b>','es',1),(42,1,'plan_released','noreply@site.com','VoIP','Su plan fue dado de baja.','<p>Estimado $firstname$ $lastname$.</p>\n<p>Su plan venció hoy y no recibimos la confirmación de pago.</p>\n<p>Su plan fue suspendido automáticamente hasta que nos sea informado el pago.</p>\n<p>Ud. puede ingresar a su Área de Cliente con estos datos:&nbsp;<br></p><p><a href=\"http://SU_IP/mbilling\">http://SU_IP/mbilling</a><br>\n  Usuario=$login$<br>\n  Clave:$password$</p>\n<p>Un cordial saludo<br></p>\n$obs$','es',1),(43,1,'signup','noreply@site.com','VoIP','Account Activation','<p><span style=\"font-family: arial, sans, sans-serif;\">$lastname$ $firstname$, thank you for signing up with us</span><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Please click in this link to activate your account.</span><br style=\"font-family: arial, sans, sans-serif;\"><font face=\"arial, sans, sans-serif\"><a href=\"http://your_ip/mbilling/index.php/signup/$iduser$?username=$login$&amp;password=$password$&amp;loginkey=$loginkey$\">http://your_ip/mbilling/index.php/signup/$iduser$?username=$login$&amp;password=$password$&amp;loginkey=$loginkey$</a></font><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Please make sure to activate your account.</span><br style=\"font-family: arial, sans, sans-serif;\"><br></p><p><span style=\"font-family: arial, sans, sans-serif;\">Best regards</span></p>','en',1),(44,1,'reminder','noreply@site.com','VoIP','Your VOIP Account has a low credit balance of ( $credit$ $currency$)','<span style=\"font-family: arial, sans, sans-serif;\">Hello $lastname$ $firstname$, your account is low on credit. User $login$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Right now, there is $credit$ $currency$ in your account, which is lower than the alert level you defined, ($credit_notification$ ).</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">To make sure your account continues working, please recharge your account as soon as possible.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">If you don\'t want to receive this notification any longer or want to change the balance amount for this alert, please login in the customer web page and change the alerts settings as needed.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><a moz-do-not-send=\"true\" href=\"http://your_ip/mbilling\" style=\"font-family: arial, sans, sans-serif;\">http://your_ip/mbilling</a><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Username: $login$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Password: $password$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br>\n\n\n','en',1),(45,1,'signupconfirmed','noreply@site.com','VoIP','Welcome. Your account login information in included','<p><span style=\"font-family: arial, sans, sans-serif;\">Hello $lastname$ $firstname$&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Here is you account infornation to access the client web site portal:</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><a moz-do-not-send=\"true\" href=\"http://your_ip/mbilling\" style=\"font-family: arial, sans, sans-serif;\">http://your_ip/mbilling</a><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Username : $login$&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Password : $password$&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>\n','en',1),(46,1,'did_paid','noreply@site.com','VoIP','Your DID number charges - $did$','<p><span style=\"font-family: arial, sans, sans-serif;\">Hello $lastname$ $firstname$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">The following charge $did_cost$ $base_currency$, was charged to your account for the monthly fees for your DID ($did$)</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">DID monthly fees: $did_cost$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your current credit balance for account $login$, is $credit$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(47,1,'did_unpaid','noreply@site.com','VoIP','Notification alert, DID due date $did$','<p><span style=\"font-family: arial, sans, sans-serif;\">Hello $firstname$ $lastname$, your account $login$ current credit is $balance_remaining$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your credit is insufficient to pay for your DID number ($did$), as the monthly cost is $did_cost$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Please add credit to your account so that the DID this is not released from your account automatically on the due date.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">To add credits to your account, login to the client web site and click on Buy Credits.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(48,1,'did_released','noreply@site.com','VoIP','Cancelled DID - ($did$)','<p><span style=\"font-family: arial, sans, sans-serif;\">Hello $firstname$ $lastname$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">This is a notification that the DID number $did$ has been deactivated from your account $login$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">It will be released if its not paid immediately.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Past notifications has been send to the contact Email address set in your account.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(49,1,'did_confirmation','noreply@site.com','VoIP','DID number $did$ activated','<p style=\"color: rgb(0, 0, 0);\"><span style=\"font-family: arial, sans, sans-serif;\">Hello $firstname$ $lastname$,&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Congratulations!&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">The DID number $did$ was successfully activated in your account $login$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">You can forward your DID number to a PSTN or Mobile number.&nbsp; If you wish to do this, login to your account at:</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><a moz-do-not-send=\"true\" href=\"http://your_ip/mbilling\" style=\"font-family: arial, sans, sans-serif;\">http://your_ip/mbilling</a><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Username : $login$</span><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Password : $password$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">If you have a problem getting it to forward to the desired number, please contact us.</span><br></p><p style=\"color: rgb(0, 0, 0);\"><span style=\"font-family: arial, sans, sans-serif;\"><br></span></p><p style=\"color: rgb(0, 0, 0);\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><span style=\"font-family: arial, sans, sans-serif;\"><br></span></p>','en',1),(50,1,'refill','noreply@site.com','VoIP','Credit recharge confirmed','<p><span style=\"font-family: arial, sans, sans-serif;\">Hello $firstname$ $lastname$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">A credit recharge was applied to the account $login$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Recharge number = $itemID$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Value = $itemAmount$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Description = $description$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your current account credit balance is $credit$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>\n','en',1),(51,1,'plan_unpaid','noreply@site.com','VoIP','Balance Due Alert for your Monthly plan','<p><span style=\"font-family: arial, sans, sans-serif;\">Dear $firstname$ $lastname$.&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">We are sending you this message to notify that your call plan is approaching the due date and your account does not have enough credit balance to make the payment.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Please, login in you account area, select: Menu, Buy Credits, and recharge your account with at least $plancost$ $base_currency$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">You can login the client are with the following data:</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><a moz-do-not-send=\"true\" href=\"http://your_ip/mbilling\" style=\"font-family: arial, sans, sans-serif;\">http://your_ip/mbilling</a><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Username=$login$&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Password=$password$&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Please recharge your account or your call plan will be deactivated automatically on the due date.</span><br style=\"font-family: arial, sans, sans-serif;\"><br><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(52,1,'plan_paid','noreply@site.com','VoIP','Confirmation of call plan payment','<p><span style=\"font-family: arial, sans, sans-serif;\">Dear $firstname$ $lastname$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">We have received your monthly call plan payment.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your current credit balance is $credit$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">If you have any questions or need additional help please contact us.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(53,1,'plan_released','noreply@site.com','VoIP','Your call plan has been suspended','<p><span style=\"font-family: arial, sans, sans-serif;\">Dear $firstname$ $lastname$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your call plan is due today and we have not receive a payment confirmation.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your plan has been automatically suspended until we receive a payment confirmation.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">To reactivate your call plan, please login in your account web site, select: Menu, Buy Credits and recharge your account with a minimum credit of $plancost$ $base_currency$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(54,1,'services_unpaid','usuario','VoIP','Aviso de Vencimento de serviço','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Você tem serviços com vencimento em aberto e não possiu saldo para o pagamento. Por favor entre no link $service_pending_url$ para iniciar o pagamento. </p>\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(55,1,'services_unpaid','usuario','VoIP','Aviso de Vencimiento de servicio','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Usted tien servicios por vencer o vencido. Por favor entre en este link $service_pending_url$ para iniciar el pago.</p> \r\n<p>Saludos,<br>\r\n ','es',1),(56,1,'services_unpaid','username','VoIP','Balance Due Alert for your','<p>Hello $firstname$ $lastname$, </p>\r\n<p>You have services pendent. Please use this link $service_pending_url$ to start the payment</p>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(57,1,'services_activation','usuario','VoIP','Ativação de serviço','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Foi ativado o serviço $service_name$ com valor de $service_price$. </p>\r\n<br>\r\n\r\n<p>Este valor sera descontado do credito de sua conta automaticamente todos os meses.</p>\r\n\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(58,1,'services_activation','usuario','VoIP','Activacion de servicio','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Fue activado el servicio $service_name$ con importe $service_price$.</p>\r\n<br>\r\n\r\n<p>Este importe sera descontado del credito de su cuenta automaticamente todos los meses..</p>\r\n\r\n<br> \r\n<p>Saludos,<br>\r\n ','es',1),(59,1,'services_activation','username','VoIP','Service activation','<p>Hello $firstname$ $lastname$, </p>\r\n<p>The service $service_name$ was activated. Service price: $service_price$ .</p>\r\n<br>\r\n\r\n<p>This amount will be charged of your account every month.</p>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(60,1,'services_pending','usuario','VoIP','Serviço pendente de pagamento','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Foi solicitado o serviço $service_name$ com valor de $service_price$. </p>\r\n\r\n        <p>A ativaçao do serviço esta pendente de pagamento.</p>\r\n\r\n        <p>Link para pagamento $service_pending_url$.</p>\r\n\r\n       <br>\r\n\r\n<p></p>\r\n\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(61,1,'services_pending','usuario','VoIP','Servicio pendente de pagao','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Fue solicitado la activacion del servicio $service_name$ con importe $service_price$.</p>\r\n<p>La activacion del servicio esta pendiente de pago.</p>\r\n\r\n        <p>Link para el pago: $service_pending_url$.</p>\r\n<br>\r\n\r\n<p>.</p>\r\n\r\n<br> \r\n<p>Saludos,<br>\r\n ','es',1),(62,1,'services_pending','username','VoIP','Service pending','<p>Hello $firstname$ $lastname$, </p>\r\n<p>The service $service_name$ was pending. Service price: $service_price$ .</p>\r\n\r\n       <p>Please make the payment to active the service.</p>\r\n\r\n       <p>Payment Link:  $service_pending_url$.</p>\r\n\r\n        <br>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(63,1,'services_released','usuario','VoIP','Cancelamento de serviço','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Foi desativado o serviço $service_name$ com valor de $service_price$. </p>\r\n<br>\r\n\r\n<p></p>\r\n\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(64,1,'services_released','usuario','VoIP','Baja de servicio','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Fue dado de baja el servicio $service_name$ con importe $service_price$.</p>\r\n<br>\r\n\r\n<p>.</p>\r\n\r\n<br> \r\n<p>Saludos,<br>\r\n ','es',1),(65,1,'services_released','username','VoIP','Service canceled','<p>Hello $firstname$ $lastname$, </p>\r\n<p>The service $service_name$ was canceled. Service price: $service_price$ .</p>\r\n<br>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(66,1,'services_paid','usuario','VoIP','Serviço Pago','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Foi pago o serviço $service_name$ com valor de $service_price$. </p>\r\n<br>\r\n\r\n<p></p>\r\n\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(67,1,'services_paid','usuario','VoIP','Servicio pago','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Fue pago el servicio $service_name$ con importe $service_price$.</p>\r\n<br>\r\n\r\n<p>.</p>\r\n\r\n<br> \r\n<p>Saludos,<br>\r\n ','es',1),(68,1,'services_paid','username','VoIP','Service paid','<p>Hello $firstname$ $lastname$, </p>\r\n<p>The service $service_name$ was paid. Service price: $service_price$ .</p>\r\n<br>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(69,1,'user_disk_space','usuario','VoIP','Armazenamento em disco superado','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Sua conta VoIP número $cardnumber$ superou o limite de $disk_usage_limit$ GB.</p>\r\n<br>\r\n\r\n<p>Para manter o serviço foi deletado automaticamente os audios anteriores a $time_deleted$.</p>\r\n\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(70,1,'user_disk_space','usuario','VoIP','Armazenamento en disco superado','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Su cuenta VoIP número $cardnumber$ supero el limite de $disk_usage_limit$ GB.</p>\r\n<br>\r\n\r\n<p>Para mantener el servicio fue borrado automaticamente los audios anteriores a $time_deleted$.</p>\r\n\r\n<br> \r\n<p>Saludos,<br>\r\n ','es',1),(71,1,'user_disk_space','username','VoIP','Disk space surpassed','<p>Hello $firstname$ $lastname$, </p>\r\n<p>Your account $cardnumber$ surpassed the disk space limit of $disk_usage_limit$ GB.</p>\r\n<br>\r\n\r\n<p>To keep the service was deleted the records before than $time_deleted$.</p>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(72,1,'forgetpassword','usuário','VoIP','Recuperação de senha','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Você solicitou sua senha por email. </p>\r\nSua senha é: $password$<br>\r\n \r\n<p>Atenciosamente,<br>\r\n ','br',1),(73,1,'forgetpassword','usuario','VoIP','Recuperacion de contraseña','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Usted solicito su contraseña por email. </p>\r\nSu contraseña es: $password$<br>\r\n \r\n<p>Saludos,<br>\r\n ','es',1),(74,1,'forgetpassword','username','VoIP','Password recovery','<p>Hello $firstname$ $lastname$, </p>\r\n<p>You request your password. </p>\r\nYour password is: $password$<br>\r\n \r\n<p>Best Regards,<br>\r\n ','en',1),(75,1,'credit','noreply@site.com','VoIP','Crédito atual da sua cuenta VoIP ( $credit$ $currency$)','<p>Olá $firstname$ $lastname$, </p> <br> <p>Seu saldo atual é de R$ $credit$.</p> <br> <p>Observação: Você pode desativar o recebimento deste email no seu painel de cliente.</p> <br> <p>Atenciosamente,<br>','br',1),(76,1,'credit','noreply@site.com','VoIP','Credito actual de su cuenta VoIP ( $credit$ $currency$)','<p>Hola $firstname$ $lastname$, </p> <br> <p>Su credito actual es de $credit$.</p> <br> <p>OBS: Puedes desactivar el envio de este email en su panel de cliente.</p> <br> <p>Saludos,<br>','es',1),(77,1,'credit','noreply@site.com','VoIP','You actual credit is ( $credit$ $currency$)','<p>Hello $firstname$ $lastname$, </p> <br> <p>Your credit is $credit$.</p> <br> <p>OBS: You can disable this email on your VoIP panel.</p> <br> <p>Atenciosamente,<br>','en',1);
/*!40000 ALTER TABLE `pkg_templatemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_trunk`
--

DROP TABLE IF EXISTS `pkg_trunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_trunk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_provider` int(11) NOT NULL,
  `failover_trunk` int(11) DEFAULT NULL,
  `trunkcode` varchar(50) DEFAULT NULL,
  `host` varchar(100) NOT NULL,
  `fromdomain` varchar(100) NOT NULL,
  `trunkprefix` char(20) DEFAULT NULL,
  `providertech` char(20) NOT NULL,
  `providerip` char(80) NOT NULL,
  `removeprefix` char(20) DEFAULT NULL,
  `secondusedreal` int(11) DEFAULT 0,
  `call_answered` int(11) DEFAULT 0,
  `call_total` int(11) DEFAULT 0,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `addparameter` char(120) DEFAULT NULL,
  `inuse` int(11) DEFAULT 0,
  `maxuse` int(11) DEFAULT -1,
  `status` int(11) DEFAULT 1,
  `if_max_use` int(11) DEFAULT 0,
  `user` varchar(80) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `allow` varchar(50) NOT NULL,
  `link_sms` varchar(250) NOT NULL,
  `directmedia` char(10) NOT NULL DEFAULT 'no',
  `context` char(20) NOT NULL DEFAULT 'billing',
  `dtmfmode` char(7) NOT NULL DEFAULT 'RFC2833',
  `insecure` varchar(20) NOT NULL DEFAULT 'port,invite',
  `nat` char(20) NOT NULL DEFAULT 'yes',
  `qualify` char(7) NOT NULL DEFAULT 'yes',
  `type` char(6) NOT NULL DEFAULT 'peer',
  `disallow` varchar(20) NOT NULL DEFAULT 'all',
  `sms_res` varchar(50) NOT NULL,
  `register` int(11) NOT NULL DEFAULT 0,
  `language` varchar(10) NOT NULL,
  `allow_error` int(11) NOT NULL DEFAULT 0 COMMENT 'Allow send for backup trunk incluse busy',
  `short_time_call` int(11) NOT NULL DEFAULT 0,
  `fromuser` varchar(80) NOT NULL DEFAULT '',
  `register_string` varchar(300) NOT NULL DEFAULT '',
  `transport` varchar(3) NOT NULL DEFAULT 'no',
  `encryption` varchar(3) NOT NULL DEFAULT 'no',
  `port` varchar(5) NOT NULL DEFAULT '5060',
  `sendrpid` varchar(10) NOT NULL DEFAULT 'no',
  `sip_config` text DEFAULT NULL,
  `cnl` int(11) NOT NULL DEFAULT 0,
  `cid_add` varchar(11) NOT NULL DEFAULT '',
  `cid_remove` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_provider_pkg_trunk` (`id_provider`),
  KEY `fk_pkg_trunk_pkg_trunk` (`failover_trunk`),
  CONSTRAINT `fk_pkg_provider_pkg_trunk` FOREIGN KEY (`id_provider`) REFERENCES `pkg_provider` (`id`),
  CONSTRAINT `fk_pkg_trunk_pkg_trunk` FOREIGN KEY (`failover_trunk`) REFERENCES `pkg_trunk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_trunk`
--

LOCK TABLES `pkg_trunk` WRITE;
/*!40000 ALTER TABLE `pkg_trunk` DISABLE KEYS */;
INSERT INTO `pkg_trunk` VALUES (1,1,NULL,'Vox-Gold','sbc.voxbeam.com','','0011101','sip','Vox-Gold','',0,0,0,'2023-02-25 22:00:19','',NULL,-1,1,NULL,'','','g723,gsm,g726,opus,alaw,ulaw,g722','','no','billing','RFC2833','port,invite','force_rport,comedia','yes','peer','all','',0,'',0,0,'','','','','5060','no','',0,'',''),(2,2,NULL,'Vox-Platinum','sbc.voxbeam.com','','0011102','sip','Vox-Platinum','',0,0,0,'2023-02-25 22:00:55','',NULL,-1,1,NULL,'','','g723,gsm,g726,opus,alaw,ulaw,g722','','no','billing','RFC2833','port,invite','force_rport,comedia','yes','peer','all','',0,'',0,0,'','','','','5060','no','',0,'',''),(3,3,NULL,'Vox-Silver','sbc.voxbeam.com','','0011103','sip','Vox-Silver','',0,0,0,'2023-02-25 22:01:53','',NULL,-1,1,NULL,'','','g723,gsm,g726,opus,alaw,ulaw,g722','','no','billing','RFC2833','port,invite','force_rport,comedia','yes','peer','all','',0,'',0,0,'','','','','5060','no','',0,'',''),(4,4,NULL,'Vox-Call-Center','sbc.voxbeam.com','','0011104','sip','Vox-Call-Center','',0,0,0,'2023-02-25 22:02:28','',NULL,-1,1,NULL,'','','g723,gsm,g726,opus,alaw,ulaw,g722','','no','billing','RFC2833','port,invite','force_rport,comedia','yes','peer','all','',0,'',0,0,'','','','','5060','no','',0,'',''),(5,5,NULL,'Bridge-Platinum','204.15.169.92','','1111','sip','Bridge-Platinum','0000',0,0,0,'2023-02-26 12:57:46','',NULL,-1,1,NULL,'','','g723,gsm,g726,opus,alaw,ulaw,g722','','no','billing','RFC2833','port,invite','force_rport,comedia','yes','peer','all','',0,'',0,0,'','','','','5060','no','',0,'','');
/*!40000 ALTER TABLE `pkg_trunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_trunk_error`
--

DROP TABLE IF EXISTS `pkg_trunk_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_trunk_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL,
  `code` int(5) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`ip`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_trunk_error`
--

LOCK TABLES `pkg_trunk_error` WRITE;
/*!40000 ALTER TABLE `pkg_trunk_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_trunk_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_trunk_group`
--

DROP TABLE IF EXISTS `pkg_trunk_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_trunk_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_trunk_group`
--

LOCK TABLES `pkg_trunk_group` WRITE;
/*!40000 ALTER TABLE `pkg_trunk_group` DISABLE KEYS */;
INSERT INTO `pkg_trunk_group` VALUES (1,'Vox-Call-Center',1,'',''),(2,'Vox-Silver',1,'',''),(3,'Vox-Platinum',1,'',''),(4,'Vox-Gold',1,'',''),(5,'Bridge-Platinum',1,'','');
/*!40000 ALTER TABLE `pkg_trunk_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_trunk_group_trunk`
--

DROP TABLE IF EXISTS `pkg_trunk_group_trunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_trunk_group_trunk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_trunk_group` int(11) NOT NULL,
  `id_trunk` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_trunk_group` (`id_trunk_group`),
  KEY `id_trunk` (`id_trunk`),
  CONSTRAINT `fk_pkg_trunk_group_trunk_pkg_trunk` FOREIGN KEY (`id_trunk`) REFERENCES `pkg_trunk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_trunk_group_trunk_pkg_trunk_group` FOREIGN KEY (`id_trunk_group`) REFERENCES `pkg_trunk_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_trunk_group_trunk`
--

LOCK TABLES `pkg_trunk_group_trunk` WRITE;
/*!40000 ALTER TABLE `pkg_trunk_group_trunk` DISABLE KEYS */;
INSERT INTO `pkg_trunk_group_trunk` VALUES (1,1,4,1),(2,2,3,1),(3,3,2,1),(4,4,1,1),(5,5,5,1);
/*!40000 ALTER TABLE `pkg_trunk_group_trunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_user`
--

DROP TABLE IF EXISTS `pkg_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_group` int(11) NOT NULL,
  `id_group_agent` int(11) DEFAULT NULL,
  `id_plan` int(11) DEFAULT NULL,
  `id_offer` int(11) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `credit` decimal(15,4) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `firstusedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expirationdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enableexpire` tinyint(1) DEFAULT 0,
  `expiredays` int(11) DEFAULT 0,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) NOT NULL DEFAULT '',
  `neighborhood` varchar(50) DEFAULT NULL,
  `state` varchar(50) NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL DEFAULT '',
  `zipcode` varchar(20) DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(20) DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `vat` varchar(50) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `commercial_name` varchar(100) DEFAULT NULL,
  `company_website` varchar(60) DEFAULT NULL,
  `state_number` varchar(40) DEFAULT NULL,
  `dist` varchar(100) DEFAULT NULL,
  `contract_value` float DEFAULT 0,
  `lastuse` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `typepaid` tinyint(1) DEFAULT 0,
  `creditlimit` int(11) NOT NULL DEFAULT 0,
  `language` char(5) DEFAULT 'en',
  `redial` varchar(50) DEFAULT NULL,
  `loginkey` varchar(40) DEFAULT NULL,
  `last_notification` timestamp NULL DEFAULT NULL,
  `credit_notification` int(11) NOT NULL DEFAULT 10,
  `credit_notification_daily` int(1) NOT NULL DEFAULT 0,
  `restriction` tinyint(4) NOT NULL DEFAULT 0,
  `callingcard_pin` int(6) NOT NULL,
  `prefix_local` varchar(50) NOT NULL DEFAULT '',
  `callshop` varchar(20) DEFAULT '',
  `plan_day` tinyint(1) DEFAULT NULL,
  `record_call` tinyint(1) NOT NULL DEFAULT 0,
  `active_paypal` tinyint(1) NOT NULL DEFAULT 0,
  `boleto` tinyint(1) NOT NULL DEFAULT 0,
  `boleto_day` smallint(2) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `googleAuthenticator_enable` tinyint(1) NOT NULL DEFAULT 0,
  `google_authenticator_key` varchar(50) NOT NULL DEFAULT '',
  `doc` varchar(50) DEFAULT NULL,
  `id_sacado_sac` int(11) DEFAULT NULL,
  `disk_space` int(10) NOT NULL DEFAULT -1,
  `sipaccountlimit` int(10) NOT NULL DEFAULT -1,
  `calllimit` int(10) NOT NULL DEFAULT -1,
  `cpslimit` int(11) NOT NULL DEFAULT -1,
  `calllimit_error` varchar(3) NOT NULL DEFAULT '503',
  `mix_monitor_format` varchar(5) DEFAULT 'gsm',
  `transfer_show_selling_price` tinyint(1) DEFAULT 0,
  `transfer_bdservice_rate` int(11) DEFAULT 0,
  `transfer_dbbl_rocket_profit` int(11) DEFAULT 0,
  `transfer_bkash_profit` int(11) DEFAULT 0,
  `transfer_flexiload_profit` int(11) DEFAULT 0,
  `transfer_international_profit` int(11) DEFAULT 0,
  `transfer_dbbl_rocket` tinyint(1) NOT NULL DEFAULT 0,
  `transfer_bkash` tinyint(1) DEFAULT 0,
  `transfer_flexiload` tinyint(1) DEFAULT 0,
  `transfer_international` tinyint(1) DEFAULT 0,
  `restriction_use` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `callingcard_pin` (`callingcard_pin`),
  KEY `fk_pkg_group_user_pkg_user` (`id_group`),
  KEY `fk_pkg_plan_pkg_user` (`id_plan`),
  KEY `username` (`username`),
  KEY `fk_pkg_user_pkg_user` (`id_user`),
  KEY `fk_pkg_group_user_pkg_user_agent` (`id_group_agent`),
  CONSTRAINT `fk_pkg_group_user_pkg_user` FOREIGN KEY (`id_group`) REFERENCES `pkg_group_user` (`id`),
  CONSTRAINT `fk_pkg_group_user_pkg_user_agent` FOREIGN KEY (`id_group_agent`) REFERENCES `pkg_group_user` (`id`),
  CONSTRAINT `fk_pkg_plan_pkg_user` FOREIGN KEY (`id_plan`) REFERENCES `pkg_plan` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_user` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_user`
--

LOCK TABLES `pkg_user` WRITE;
/*!40000 ALTER TABLE `pkg_user` DISABLE KEYS */;
INSERT INTO `pkg_user` VALUES (1,1,1,NULL,NULL,NULL,'root','d9d14371a7109a073e7a72aec59552e7ac96200c',0.0000,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,'','','','',NULL,'','','','','','','0','',NULL,'',NULL,NULL,0,'0000-00-00 00:00:00',0,0,'en','','',NULL,10,0,0,534565,'21','0',1,0,0,0,0,'','0000-00-00 00:00:00',0,'',NULL,NULL,-1,-1,-1,-1,'503','gsm',0,0,0,0,0,0,0,0,0,0,1),(2,1,3,NULL,3,NULL,'621105','passion11',5.1040,1,'2023-02-25 23:17:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,'','','','','','','55','','','','','','','','',NULL,'',0,'0000-00-00 00:00:00',0,0,'br','','',NULL,-1,0,0,996481,'0/55/11,0/55/12,*/5562/8,*/5562/9,*/55/11','0',0,0,0,0,0,'','0000-00-00 00:00:00',0,'','',NULL,-1,-1,-1,-1,'503','gsm',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1),(3,1,3,NULL,4,NULL,'623781','passion11',9.3570,1,'2023-02-25 23:17:44','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,'','','','','','','55','','','','','','','','',NULL,'',0,'0000-00-00 00:00:00',0,0,'br','','',NULL,-1,0,0,797278,'0/55/11,0/55/12,*/5562/8,*/5562/9,*/55/11','0',0,0,0,0,0,'','0000-00-00 00:00:00',0,'','',NULL,-1,-1,-1,-1,'503','gsm',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1),(4,1,2,3,3,NULL,'6230856855','passion-11',50.0000,1,'2023-03-20 05:22:10','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,'Master Voip','','','','','','55','','','','','','','','',NULL,'',0,'0000-00-00 00:00:00',0,0,'br','','',NULL,-1,0,0,889453,'0/55/11,0/55/12,*/5562/8,*/5562/9,*/55/11','0',0,0,0,0,0,'','0000-00-00 00:00:00',0,'','',NULL,-1,-1,-1,-1,'503','gsm',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1);
/*!40000 ALTER TABLE `pkg_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_user_history`
--

DROP TABLE IF EXISTS `pkg_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_user_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_user_history` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_user_history` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_user_history`
--

LOCK TABLES `pkg_user_history` WRITE;
/*!40000 ALTER TABLE `pkg_user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_user_rate`
--

DROP TABLE IF EXISTS `pkg_user_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_user_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_prefix` int(11) NOT NULL,
  `rateinitial` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `initblock` int(11) NOT NULL DEFAULT 0,
  `billingblock` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_user_rate` (`id_user`),
  KEY `fk_pkg_prefix_pkg_user_rate` (`id_prefix`),
  CONSTRAINT `fk_pkg_prefix_pkg_user_rate` FOREIGN KEY (`id_prefix`) REFERENCES `pkg_prefix` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_user_rate` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_user_rate`
--

LOCK TABLES `pkg_user_rate` WRITE;
/*!40000 ALTER TABLE `pkg_user_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_user_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_user_type`
--

DROP TABLE IF EXISTS `pkg_user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(18) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_user_type`
--

LOCK TABLES `pkg_user_type` WRITE;
/*!40000 ALTER TABLE `pkg_user_type` DISABLE KEYS */;
INSERT INTO `pkg_user_type` VALUES (1,'t(\'admin\')'),(2,'t(\'agent\')'),(3,'t(\'client\')');
/*!40000 ALTER TABLE `pkg_user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `pkg_voicemail_users`
--

DROP TABLE IF EXISTS `pkg_voicemail_users`;
/*!50001 DROP VIEW IF EXISTS `pkg_voicemail_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pkg_voicemail_users` AS SELECT
 1 AS `id`,
  1 AS `customer_id`,
  1 AS `context`,
  1 AS `mailbox`,
  1 AS `password`,
  1 AS `fullname`,
  1 AS `email`,
  1 AS `pager`,
  1 AS `stamp`,
  1 AS `uniqueid` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pkg_voucher`
--

DROP TABLE IF EXISTS `pkg_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkg_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_plan` int(11) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `usedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expirationdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voucher` int(6) NOT NULL,
  `tag` char(50) DEFAULT NULL,
  `credit` float NOT NULL DEFAULT 0,
  `used` int(11) DEFAULT 0,
  `prefix_local` varchar(50) DEFAULT NULL,
  `language` char(5) NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cons_pkg_voucher_voucher` (`voucher`),
  KEY `fk_pkg_user_pkg_voucher` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_voucher` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_voucher`
--

LOCK TABLES `pkg_voucher` WRITE;
/*!40000 ALTER TABLE `pkg_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `pkg_voicemail_users`
--

/*!50001 DROP VIEW IF EXISTS `pkg_voicemail_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pkg_voicemail_users` AS select `pkg_sip`.`id` AS `id`,`pkg_sip`.`id_user` AS `customer_id`,'billing' AS `context`,`pkg_sip`.`name` AS `mailbox`,`pkg_sip`.`voicemail_password` AS `password`,`pkg_user`.`firstname` AS `fullname`,`pkg_sip`.`voicemail_email` AS `email`,`pkg_sip`.`md5secret` AS `pager`,`pkg_user`.`creationdate` AS `stamp`,'' AS `uniqueid` from (`pkg_sip` join `pkg_user` on(`pkg_sip`.`id_user` = `pkg_user`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-29 19:08:05
