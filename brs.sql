-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: brs
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routeid` int(11) NOT NULL,
  `ac` tinyint(1) NOT NULL,
  `fare` int(11) NOT NULL,
  `departuretime` varchar(6) NOT NULL,
  `ARRIVALTIME` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `route_id` (`routeid`),
  CONSTRAINT `route_id` FOREIGN KEY (`routeid`) REFERENCES `route` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(32) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!50001 DROP VIEW IF EXISTS `reservation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `reservation` AS SELECT 
 1 AS `id`,
 1 AS `passengerid`,
 1 AS `busid`,
 1 AS `seat`,
 1 AS `dt`,
 1 AS `tstamp`,
 1 AS `origin`,
 1 AS `destination`,
 1 AS `departuretime`,
 1 AS `ARRIVALTIME`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reserve`
--

DROP TABLE IF EXISTS `reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passengerid` int(11) NOT NULL,
  `busid` int(11) NOT NULL,
  `dt` date NOT NULL,
  `tstamp` date NOT NULL,
  `seat` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SEAT_UNIQUE` (`busid`,`dt`,`seat`),
  KEY `passengerid` (`passengerid`),
  CONSTRAINT `reserve_ibfk_1` FOREIGN KEY (`passengerid`) REFERENCES `passenger` (`id`),
  CONSTRAINT `reserve_ibfk_2` FOREIGN KEY (`busid`) REFERENCES `bus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve`
--

LOCK TABLES `reserve` WRITE;
/*!40000 ALTER TABLE `reserve` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin` varchar(20) NOT NULL,
  `destination` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ROUTE_UNIQUE` (`origin`,`destination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `reservation`
--

/*!50001 DROP VIEW IF EXISTS `reservation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservation` AS select `reserve`.`id` AS `id`,`reserve`.`passengerid` AS `passengerid`,`reserve`.`busid` AS `busid`,`reserve`.`seat` AS `seat`,`reserve`.`dt` AS `dt`,`reserve`.`tstamp` AS `tstamp`,`route`.`origin` AS `origin`,`route`.`destination` AS `destination`,`bus`.`departuretime` AS `departuretime`,`bus`.`ARRIVALTIME` AS `ARRIVALTIME` from ((`reserve` join `bus` on((`reserve`.`busid` = `bus`.`id`))) join `route` on((`route`.`id` = `bus`.`routeid`))) order by `reserve`.`id` */;
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

-- Dump completed on 2019-02-26  8:20:59
