-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema t18_staging_p2p
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema t18_staging_p2p
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `t18_staging_p2p` DEFAULT CHARACTER SET utf8 ;
USE `t18_staging_p2p` ;

-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_gene` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hgnc_id` INT(5) NOT NULL,
  `approved_symbol` VARCHAR(50) NULL,
  `approved_name` VARCHAR(50) NULL,
  `gene_synonyms` VARCHAR(50) NULL,
  `chromosomal_location` VARCHAR(50) NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table presents gene data including HGNC IDs, approved symbols, approved names, synonyms, and chromosomal locations\n';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_protein`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_protein` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `disease_search_term` VARCHAR(50) NULL,
  `alternative_names` VARCHAR(50) NULL,
  `sequence_length` INT NULL,
  `mass(da)` INT NULL,
  `t18_proteincol` VARCHAR(45) NULL,
  `hgnc_id` INT(5) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table presents UniProtKB entries, linking diseases';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_uniprot_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_uniprot_disease` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uniprot_disease_name` VARCHAR(50) NOT NULL,
  `Uniprot_disease_short_name` VARCHAR(50) NULL,
  `phenotype_mim_number` VARCHAR(50) NULL,
  `tn_uniprot_diseasecol` VARCHAR(45) NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table presents various UniProt Diseases along with their associated phenotype MIM numbers';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_disease` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uniprot_disease_name` VARCHAR(50) NOT NULL,
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table lists UniProtKB entries alongside associated diseases';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_do_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_do_disease` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `doid` INT NOT NULL,
  `disease_name` VARCHAR(50) NULL,
  `definition` VARCHAR(250) NULL,
  `relationship` VARCHAR(50) NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table presents DO Diseases with their corresponding DOIDs, disease names, definitions, and relationships';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_uniprot_do_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_uniprot_do_disease` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `doid` INT NOT NULL,
  `uniprot_disease_name` VARCHAR(50) NOT NULL,
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table provides UniProt entries linked with UniProt DO Diseases';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_search_activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_search_activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_number` INT NOT NULL,
  `data_collected_by` VARCHAR(10) NOT NULL,
  `disease_search_term` VARCHAR(50) NOT NULL,
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table summarizes search activities by for diseases';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_external_site`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_external_site` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `site_id` INT NOT NULL,
  `site_name` VARCHAR(50) NOT NULL,
  `url` VARCHAR(100) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_db_statistics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_db_statistics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NULL,
  `value` INT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_gene` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hgnc_id` INT(5) NOT NULL,
  `approved_symbol` VARCHAR(50) NULL,
  `approved_name` VARCHAR(50) NULL,
  `gene_synonyms` VARCHAR(50) NULL,
  `chromosomal_location` VARCHAR(50) NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table presents gene data including HGNC IDs, approved symbols, approved names, synonyms, and chromosomal locations\n';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_protein`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_protein` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `disease_search_term` VARCHAR(50) NULL,
  `alternative_names` VARCHAR(50) NULL,
  `sequence_length` INT NULL,
  `mass(da)` INT NULL,
  `t18_proteincol` VARCHAR(45) NULL,
  `hgnc_id` INT(5) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table presents UniProtKB entries, linking diseases';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_uniprot_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_uniprot_disease` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uniprot_disease_name` VARCHAR(50) NOT NULL,
  `Uniprot_disease_short_name` VARCHAR(50) NULL,
  `phenotype_mim_number` VARCHAR(50) NULL,
  `tn_uniprot_diseasecol` VARCHAR(45) NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table presents various UniProt Diseases along with their associated phenotype MIM numbers';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_disease` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uniprot_disease_name` VARCHAR(50) NOT NULL,
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table lists UniProtKB entries alongside associated diseases';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_do_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_do_disease` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `doid` INT NOT NULL,
  `disease_name` VARCHAR(50) NULL,
  `definition` VARCHAR(250) NULL,
  `relationship` VARCHAR(50) NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table presents DO Diseases with their corresponding DOIDs, disease names, definitions, and relationships';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_uniprot_do_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_uniprot_do_disease` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `doid` INT NOT NULL,
  `uniprot_disease_name` VARCHAR(50) NOT NULL,
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table provides UniProt entries linked with UniProt DO Diseases';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_search_activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_search_activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_number` INT NOT NULL,
  `data_collected_by` VARCHAR(10) NOT NULL,
  `disease_search_term` VARCHAR(50) NOT NULL,
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'The table summarizes search activities by for diseases';


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_external_site`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_external_site` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `site_id` INT NOT NULL,
  `site_name` VARCHAR(50) NOT NULL,
  `url` VARCHAR(100) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `t18_staging_p2p`.`t18_db_statistics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_staging_p2p`.`t18_db_statistics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NULL,
  `value` INT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  `is_valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
