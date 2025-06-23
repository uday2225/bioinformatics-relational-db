CREATE DATABASE  IF NOT EXISTS `t18_dev_p2p` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `t18_dev_p2p`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: datascape.dbi.udel.edu    Database: t18_dev_p2p
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t18_db_statistics`
--

DROP TABLE IF EXISTS `t18_db_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t18_db_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t18_db_statistics`
--

LOCK TABLES `t18_db_statistics` WRITE;
/*!40000 ALTER TABLE `t18_db_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `t18_db_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t18_disease`
--

DROP TABLE IF EXISTS `t18_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t18_disease` (
  `uniprot_disease_name` varchar(200) NOT NULL,
  `uniprotkb_entry` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uniprot_disease_name`,`uniprotkb_entry`),
  KEY `fk_t18_disease_t18_protein1_idx` (`uniprotkb_entry`),
  KEY `fk_t18_disease_t18_uniprot_disease1_idx` (`uniprot_disease_name`),
  CONSTRAINT `fk_t18_disease_t18_protein1` FOREIGN KEY (`uniprotkb_entry`) REFERENCES `t18_protein` (`uniprotkb_entry`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t18_disease_t18_uniprot_disease1` FOREIGN KEY (`uniprot_disease_name`) REFERENCES `t18_uniprot_disease` (`uniprot_disease_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The table lists UniProtKB entries alongside associated diseases';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t18_disease`
--

LOCK TABLES `t18_disease` WRITE;
/*!40000 ALTER TABLE `t18_disease` DISABLE KEYS */;
INSERT INTO `t18_disease` VALUES ('ACTH-independent macronodular adrenal hyperplasia 1 ','P84996','2024-04-15 19:41:27','2024-04-15 19:41:27'),('Albright hereditary osteodystrophy ','P63092','2024-04-15 19:41:28','2024-04-15 19:41:28'),('Colorectal cancer ','P84996','2024-04-15 19:41:27','2024-04-15 19:41:27'),('GNAS hyperfunction','P84996','2024-04-15 19:41:27','2024-04-15 19:41:27'),('Joubert syndrome 19 ','Q2M1K9','2024-04-29 16:15:09','2024-04-29 16:15:09'),('McCune-Albright syndrome ','P63092','2024-04-15 19:41:28','2024-04-15 19:41:28'),('Nephronophthisis 14','Q2M1K9','2024-04-29 16:15:09','2024-04-29 16:15:09'),('Pituitary adenoma, growth hormone-secreting, 1','P63092','2024-04-15 19:41:28','2024-04-15 19:41:28'),('Pseudohypoparathyroidism 1B ','P63092','2024-04-15 19:41:28','2024-04-15 19:41:28'),('Pseudohypoparathyroidism 1B ','P84996','2024-04-15 19:41:27','2024-04-15 19:41:27');
/*!40000 ALTER TABLE `t18_disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t18_do_disease`
--

DROP TABLE IF EXISTS `t18_do_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t18_do_disease` (
  `doid` int(11) NOT NULL,
  `disease_name` varchar(200) DEFAULT NULL,
  `definition` varchar(500) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`doid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The table presents DO Diseases with their corresponding DOIDs, disease names, definitions, and relationships';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t18_do_disease`
--

LOCK TABLES `t18_do_disease` WRITE;
/*!40000 ALTER TABLE `t18_do_disease` DISABLE KEYS */;
INSERT INTO `t18_do_disease` VALUES (1520,'colon carcinoma','A colon cancer that has_material_basis_in abnormally proliferating cells derives_from epithelial cells. ','is_a colon cancer','2024-04-15 19:44:31','2024-04-15 19:44:31'),(1858,'McCune Albright syndrome','An autosomal dominant disease that involves skin pigmentation, bone and hormonal problems along with premature puberty. It has material basis in mutations in the GNAS1 gene.','is_a autosomal dominant disease','2024-04-15 19:44:32','2024-04-15 19:44:32'),(4184,'pseudohypoparathyroidism','','is_a metal metabolism disorder','2024-04-15 19:44:32','2024-04-15 19:44:32'),(4964,'neurotic disorder','An anxiety disorder that involves discress but neither delusions nor hallucinations.','is_a anxiety disorder','2024-04-15 19:44:31','2024-04-15 19:44:31'),(8912,'tinea nigra','A superficial mycosis that is a superficial fungal infection of the skin characterized by brown to black macules which usually occur on the palmar aspects of hands and occasionally the plantar and other surfaces of the skin, caused by Hortaea werneckii, which is a common saprophytic fungus believed to occur in soil, compost, humus and on wood in humid tropical and sub-tropical regions.','is_a superficial mycosis','2024-04-15 19:44:32','2024-04-15 19:44:32'),(9256,'colorectal cancer','A large intestine cancer that is located_in the colon and/or located_in the rectum. ','is_a large intestine cancer','2024-04-15 19:44:31','2024-04-15 19:44:31'),(12712,'nephronophthisis','An autosomal recessive disease that is characterized by a chronic tubulointerstitial nephritis that progress to terminal renal failure during the second decade (juvenile form) or before the age of 5 years (infantile form) resulting from dysfunction of ciliary proteins (ciliopathy).','is_a autosomal recessive disease','2024-04-15 19:44:32','2024-04-15 19:44:32'),(13270,'erythropoietic protoporphyria','An acute porphyria characterized by a deficiency in the enzyme ferrochelatase, leading to abnormally high levels of protoporphyrin in the tissue.','is_a acute porphyria','2024-04-15 19:44:31','2024-04-15 19:44:31'),(80053,'Albright\'s hereditary osteodystrophy','An osteochondrodysplasia that has_material_basis_in lack of responsiveness to parathyroid hormone which results_in shortening and widening of long bones of the located_in hand or located_in foot along with short stature, obesity, and rounded face.','is_a pseudohypoparathyroidism','2024-04-15 19:44:31','2024-04-15 19:44:31');
/*!40000 ALTER TABLE `t18_do_disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t18_external_site`
--

DROP TABLE IF EXISTS `t18_external_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t18_external_site` (
  `site_id` int(11) NOT NULL,
  `site_name` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t18_external_site`
--

LOCK TABLES `t18_external_site` WRITE;
/*!40000 ALTER TABLE `t18_external_site` DISABLE KEYS */;
INSERT INTO `t18_external_site` VALUES (1,'UniProt','http://www.uniprot.org/uniprot/','2024-04-29 16:15:44','2024-04-29 16:15:44'),(2,'HGNC','http://www.genenames.org/cgi-bin/gene_symbol_report?hgnc_id=','2024-04-29 16:15:44','2024-04-29 16:15:44');
/*!40000 ALTER TABLE `t18_external_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t18_gene`
--

DROP TABLE IF EXISTS `t18_gene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t18_gene` (
  `hgnc_id` int(5) NOT NULL,
  `approved_symbol` varchar(50) DEFAULT NULL,
  `approved_name` varchar(50) DEFAULT NULL,
  `gene_synonyms` varchar(50) DEFAULT NULL,
  `chromosomal_location` varchar(50) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`hgnc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The table presents gene data including HGNC IDs, approved symbols, approved names, synonyms, and chromosomal locations\\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t18_gene`
--

LOCK TABLES `t18_gene` WRITE;
/*!40000 ALTER TABLE `t18_gene` DISABLE KEYS */;
INSERT INTO `t18_gene` VALUES (4392,'GNAS','GNAS complex locus','G protein subunit alpha S, GNASXL, GPSA','20q13.32','2024-04-15 19:37:31','2024-04-15 19:37:31'),(16762,'ZNF423','zinc finger protein 423','Ebfaz, JBTS19, KIAA0760','16q12','2024-04-15 19:37:31','2024-04-15 19:37:31');
/*!40000 ALTER TABLE `t18_gene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t18_protein`
--

DROP TABLE IF EXISTS `t18_protein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t18_protein` (
  `uniprotkb_entry` varchar(50) NOT NULL,
  `disease_search_term` varchar(50) DEFAULT NULL,
  `alternative_names` varchar(200) DEFAULT NULL,
  `sequence_length` varchar(10) DEFAULT NULL,
  `mass` varchar(10) DEFAULT NULL,
  `hgnc_id` int(5) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uniprotkb_entry`),
  KEY `fk_t18_protein_t18_gene_idx` (`hgnc_id`),
  CONSTRAINT `fk_t18_protein_t18_gene` FOREIGN KEY (`hgnc_id`) REFERENCES `t18_gene` (`hgnc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The table presents UniProtKB entries, linking diseases';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t18_protein`
--

LOCK TABLES `t18_protein` WRITE;
/*!40000 ALTER TABLE `t18_protein` DISABLE KEYS */;
INSERT INTO `t18_protein` VALUES ('P63092','osteoporosis','Adenylate cyclase-stimulating G alpha protein','394','45,665',4392,'2024-04-15 19:38:00','2024-04-15 19:38:00'),('P84996','colon cancer','Alternative gene product encoded by XL-exon','626','67,948',4392,'2024-04-15 19:38:00','2024-04-15 19:38:00'),('Q2M1K9','Kidney Disease','Olf1/EBF-associated zinc finger protein, Smad- and Olf-interacting zinc finger protein','1,284','1,44,605',16762,'2024-04-15 19:38:01','2024-04-15 19:38:01');
/*!40000 ALTER TABLE `t18_protein` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t18_search_activity`
--

DROP TABLE IF EXISTS `t18_search_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t18_search_activity` (
  `item_number` int(11) NOT NULL,
  `data_collected_by` varchar(10) NOT NULL,
  `disease_search_term` varchar(50) NOT NULL,
  `uniprotkb_entry` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`item_number`,`data_collected_by`,`disease_search_term`,`uniprotkb_entry`),
  KEY `fk_t18_search_activity_t18_protein1_idx` (`uniprotkb_entry`),
  CONSTRAINT `fk_t18_search_activity_t18_protein1` FOREIGN KEY (`uniprotkb_entry`) REFERENCES `t18_protein` (`uniprotkb_entry`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The table summarizes search activities by for diseases';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t18_search_activity`
--

LOCK TABLES `t18_search_activity` WRITE;
/*!40000 ALTER TABLE `t18_search_activity` DISABLE KEYS */;
INSERT INTO `t18_search_activity` VALUES (2,'h.s. kuyuk','colon cancer','P84996','2024-04-29 16:16:58','2024-04-29 16:16:58'),(7,'h.s. kuyuk','osteoporosis','P63092','2024-04-29 16:16:59','2024-04-29 16:16:59'),(10,'h.s. kuyuk','Kidney Disease','Q2M1K9','2024-04-29 16:16:59','2024-04-29 16:16:59');
/*!40000 ALTER TABLE `t18_search_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t18_uniprot_disease`
--

DROP TABLE IF EXISTS `t18_uniprot_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t18_uniprot_disease` (
  `uniprot_disease_name` varchar(200) NOT NULL,
  `Uniprot_disease_short_name` varchar(50) DEFAULT NULL,
  `phenotype_mim_number` varchar(50) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uniprot_disease_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The table presents various UniProt Diseases along with their associated phenotype MIM numbers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t18_uniprot_disease`
--

LOCK TABLES `t18_uniprot_disease` WRITE;
/*!40000 ALTER TABLE `t18_uniprot_disease` DISABLE KEYS */;
INSERT INTO `t18_uniprot_disease` VALUES ('ACTH-independent macronodular adrenal hyperplasia 1 ','AIMAH1','219080','2024-04-15 19:39:16','2024-04-15 19:39:16'),('Albright hereditary osteodystrophy ','AHO','103580','2024-04-15 19:39:16','2024-04-15 19:39:16'),('Colorectal cancer ','CRC','114500','2024-04-15 19:39:15','2024-04-15 19:39:15'),('GNAS hyperfunction','GNASHYP','139320','2024-04-15 19:39:16','2024-04-15 19:39:16'),('Joubert syndrome 19 ','JBTS19','614844','2024-04-29 16:14:28','2024-04-29 16:14:28'),('McCune-Albright syndrome ','MAS','174800','2024-04-15 19:39:16','2024-04-15 19:39:16'),('Nephronophthisis 14','NPHP14','614844','2024-04-29 16:14:28','2024-04-29 16:14:28'),('Pituitary adenoma, growth hormone-secreting, 1','','102200','2024-04-15 19:39:16','2024-04-15 19:39:16'),('Pseudohypoparathyroidism 1B ','PHP1B','603233','2024-04-15 19:39:16','2024-04-15 19:39:16');
/*!40000 ALTER TABLE `t18_uniprot_disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t18_uniprot_do_disease`
--

DROP TABLE IF EXISTS `t18_uniprot_do_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t18_uniprot_do_disease` (
  `doid` int(11) NOT NULL,
  `uniprot_disease_name` varchar(200) NOT NULL,
  `uniprotkb_entry` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`doid`,`uniprot_disease_name`,`uniprotkb_entry`),
  KEY `fk_t18_uniprot_do_disease_t18_do_disease1_idx` (`doid`),
  KEY `fk_t18_uniprot_do_disease_t18_disease2_idx` (`uniprot_disease_name`,`uniprotkb_entry`),
  KEY `fk_t18_uniprot_do_disease_t18_disease2` (`uniprotkb_entry`),
  CONSTRAINT `fk_t18_uniprot_do_disease_t18_disease2` FOREIGN KEY (`uniprotkb_entry`) REFERENCES `t18_disease` (`uniprotkb_entry`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t18_uniprot_do_disease_t18_do_disease1` FOREIGN KEY (`doid`) REFERENCES `t18_do_disease` (`doid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The table provides UniProt entries linked with UniProt DO Diseases';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t18_uniprot_do_disease`
--

LOCK TABLES `t18_uniprot_do_disease` WRITE;
/*!40000 ALTER TABLE `t18_uniprot_do_disease` DISABLE KEYS */;
INSERT INTO `t18_uniprot_do_disease` VALUES (1520,'Colorectal cancer ','P84996','2024-04-29 16:20:18','2024-04-29 16:20:18'),(1858,'McCune-Albright syndrome ','P63092','2024-04-29 16:20:18','2024-04-29 16:20:18'),(4184,'Pseudohypoparathyroidism 1B ','P63092','2024-04-29 16:20:18','2024-04-29 16:20:18'),(4964,'McCune-Albright syndrome ','P63092','2024-04-29 16:20:18','2024-04-29 16:20:18'),(8912,'McCune-Albright syndrome ','P63092','2024-04-29 16:20:18','2024-04-29 16:20:18'),(9256,'Colorectal cancer ','P84996','2024-04-29 16:20:18','2024-04-29 16:20:18'),(12712,'Joubert syndrome 19 ','Q2M1K9','2024-04-29 16:20:18','2024-04-29 16:20:18'),(12712,'Nephronophthisis 14','Q2M1K9','2024-04-29 16:20:18','2024-04-29 16:20:18'),(13270,'Pituitary adenoma, growth hormone-secreting, 1','P63092','2024-04-29 16:20:18','2024-04-29 16:20:18'),(80053,'Albright hereditary osteodystrophy ','P63092','2024-04-29 16:20:18','2024-04-29 16:20:18');
/*!40000 ALTER TABLE `t18_uniprot_do_disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 't18_dev_p2p'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29 16:27:15
