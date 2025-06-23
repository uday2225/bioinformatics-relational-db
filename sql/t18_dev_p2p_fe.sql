-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema t18_dev_p2p
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema t18_dev_p2p
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `t18_dev_p2p` DEFAULT CHARACTER SET utf8 ;
USE `t18_dev_p2p` ;

-- -----------------------------------------------------
-- Table `t18_dev_p2p`.`t18_gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_dev_p2p`.`t18_gene` (
  `hgnc_id` INT(5) NOT NULL,
  `approved_symbol` VARCHAR(50) NULL,
  `approved_name` VARCHAR(50) NULL,
  `gene_synonyms` VARCHAR(50) NULL,
  `chromosomal_location` VARCHAR(50) NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  PRIMARY KEY (`hgnc_id`))
ENGINE = InnoDB
COMMENT = 'The table presents gene data including HGNC IDs, approved symbols, approved names, synonyms, and chromosomal locations\n';


-- -----------------------------------------------------
-- Table `t18_dev_p2p`.`t18_protein`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_dev_p2p`.`t18_protein` (
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `disease_search_term` VARCHAR(50) NULL,
  `alternative_names` VARCHAR(50) NULL,
  `sequence_length` INT NULL,
  `mass(da)` INT NULL,
  `t18_proteincol` VARCHAR(45) NULL,
  `hgnc_id` INT(5) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  PRIMARY KEY (`uniprotkb_entry`),
  INDEX `fk_t18_protein_t18_gene_idx` (`hgnc_id` ASC) VISIBLE,
  CONSTRAINT `fk_t18_protein_t18_gene`
    FOREIGN KEY (`hgnc_id`)
    REFERENCES `t18_dev_p2p`.`t18_gene` (`hgnc_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'The table presents UniProtKB entries, linking diseases';


-- -----------------------------------------------------
-- Table `t18_dev_p2p`.`t18_uniprot_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_dev_p2p`.`t18_uniprot_disease` (
  `uniprot_disease_name` VARCHAR(50) NOT NULL,
  `Uniprot_disease_short_name` VARCHAR(50) NULL,
  `phenotype_mim_number` VARCHAR(50) NULL,
  `tn_uniprot_diseasecol` VARCHAR(45) NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  PRIMARY KEY (`uniprot_disease_name`))
ENGINE = InnoDB
COMMENT = 'The table presents various UniProt Diseases along with their associated phenotype MIM numbers';


-- -----------------------------------------------------
-- Table `t18_dev_p2p`.`t18_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_dev_p2p`.`t18_disease` (
  `uniprot_disease_name` VARCHAR(50) NOT NULL,
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  INDEX `fk_t18_disease_tn_uniprot_disease1_idx` (`uniprot_disease_name` ASC) VISIBLE,
  PRIMARY KEY (`uniprot_disease_name`, `uniprotkb_entry`),
  INDEX `fk_t18_disease_t18_protein1_idx` (`uniprotkb_entry` ASC) VISIBLE,
  CONSTRAINT `fk_t18_disease_tn_uniprot_disease1`
    FOREIGN KEY (`uniprot_disease_name`)
    REFERENCES `t18_dev_p2p`.`t18_uniprot_disease` (`uniprot_disease_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t18_disease_t18_protein1`
    FOREIGN KEY (`uniprotkb_entry`)
    REFERENCES `t18_dev_p2p`.`t18_protein` (`uniprotkb_entry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'The table lists UniProtKB entries alongside associated diseases';


-- -----------------------------------------------------
-- Table `t18_dev_p2p`.`t18_do_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_dev_p2p`.`t18_do_disease` (
  `doid` INT NOT NULL,
  `disease_name` VARCHAR(50) NULL,
  `definition` VARCHAR(250) NULL,
  `relationship` VARCHAR(50) NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  PRIMARY KEY (`doid`))
ENGINE = InnoDB
COMMENT = 'The table presents DO Diseases with their corresponding DOIDs, disease names, definitions, and relationships';


-- -----------------------------------------------------
-- Table `t18_dev_p2p`.`t18_uniprot_do_disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_dev_p2p`.`t18_uniprot_do_disease` (
  `doid` INT NOT NULL,
  `uniprot_disease_name` VARCHAR(50) NOT NULL,
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  INDEX `fk_t18_uniprot_do_disease_t18_do_disease1_idx` (`doid` ASC) VISIBLE,
  PRIMARY KEY (`doid`, `uniprot_disease_name`, `uniprotkb_entry`),
  INDEX `fk_t18_uniprot_do_disease_t18_disease2_idx` (`uniprot_disease_name` ASC, `uniprotkb_entry` ASC) VISIBLE,
  CONSTRAINT `fk_t18_uniprot_do_disease_t18_do_disease1`
    FOREIGN KEY (`doid`)
    REFERENCES `t18_dev_p2p`.`t18_do_disease` (`doid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t18_uniprot_do_disease_t18_disease2`
    FOREIGN KEY (`uniprot_disease_name` , `uniprotkb_entry`)
    REFERENCES `t18_dev_p2p`.`t18_disease` (`uniprot_disease_name` , `uniprotkb_entry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'The table provides UniProt entries linked with UniProt DO Diseases';


-- -----------------------------------------------------
-- Table `t18_dev_p2p`.`t18_search_activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_dev_p2p`.`t18_search_activity` (
  `item_number` INT NOT NULL,
  `data_collected_by` VARCHAR(10) NOT NULL,
  `disease_search_term` VARCHAR(50) NOT NULL,
  `uniprotkb_entry` VARCHAR(50) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  PRIMARY KEY (`item_number`, `data_collected_by`, `disease_search_term`, `uniprotkb_entry`),
  INDEX `fk_t18_search_activity_t18_protein1_idx` (`uniprotkb_entry` ASC) VISIBLE,
  CONSTRAINT `fk_t18_search_activity_t18_protein1`
    FOREIGN KEY (`uniprotkb_entry`)
    REFERENCES `t18_dev_p2p`.`t18_protein` (`uniprotkb_entry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'The table summarizes search activities by for diseases';


-- -----------------------------------------------------
-- Table `t18_dev_p2p`.`t18_external_site`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_dev_p2p`.`t18_external_site` (
  `site_id` INT NOT NULL,
  `site_name` VARCHAR(50) NOT NULL,
  `url` VARCHAR(100) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  PRIMARY KEY (`site_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `t18_dev_p2p`.`t18_db_statistics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `t18_dev_p2p`.`t18_db_statistics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NULL,
  `value` INT NULL,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() on update now(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
