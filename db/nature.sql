DROP TABLE IF EXISTS `wp_ai1ec_event_category_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ai1ec_event_category_meta` (
  `term_id` bigint(20) NOT NULL,
  `term_color` varchar(255) NOT NULL,
  `term_image` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ai1ec_event_category_meta`
--

LOCK TABLES `wp_ai1ec_event_category_meta` WRITE;
/*!40000 ALTER TABLE `wp_ai1ec_event_category_meta` DISABLE KEYS */;
INSERT INTO `wp_ai1ec_event_category_meta` VALUES (528,'#27ae60',''),(529,'#2273a8',''),(533,'',''),(534,'',''),(536,'',''),(537,'',''),(557,'#3498db',''),(559,'#832d51',''),(564,'','');
/*!40000 ALTER TABLE `wp_ai1ec_event_category_meta` ENABLE KEYS */;
UNLOCK TABLES;
