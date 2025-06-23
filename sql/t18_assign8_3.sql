/*
File:  t18_assign8_3.sql
Author: Uday.
First version date: 05/05/2024
Last version date:05/05/2024
Revision notes.
This sample script demonstrate how to Copy data	to	the 3NF	tables	in	the	database	t18_staging_p2p	from	the	table	
t18_stg1_p2p	in the	database t18_staging_1.
*/
USE `t18_staging_p2p`;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE `t18_db_statistics`;
TRUNCATE TABLE `t18_disease`;
TRUNCATE TABLE `t18_do_disease`;
TRUNCATE TABLE `t18_external_site`;
TRUNCATE TABLE `t18_gene`;
TRUNCATE TABLE `t18_protein`;
TRUNCATE TABLE `t18_search_activity`;
TRUNCATE TABLE `t18_uniprot_disease`;
TRUNCATE TABLE `t18_uniprot_do_disease`;

SELECT 't18_db_statistics' AS `Table Name`, COUNT(*) AS `# of Records` FROM `t18_db_statistics`
UNION
SELECT 't18_disease', COUNT(*) FROM `t18_disease`
UNION
SELECT 't18_do_disease', COUNT(*) FROM `t18_do_disease`
UNION
SELECT 't18_external_site', COUNT(*) FROM `t18_external_site`
UNION
SELECT 't18_gene', COUNT(*) FROM `t18_gene`
UNION
SELECT 't18_protein', COUNT(*) FROM `t18_protein`
UNION
SELECT 't18_search_activity', COUNT(*) FROM `t18_search_activity`
UNION
SELECT 't18_uniprot_disease', COUNT(*) FROM `t18_uniprot_disease`
UNION
SELECT 't18_uniprot_do_disease', COUNT(*) FROM `t18_uniprot_do_disease`;

INSERT INTO `t18_staging_p2p`.`t18_disease` (uniprot_disease_name, uniprotkb_entry)
SELECT DISTINCT uniprot_disease_name1 AS uniprot_disease_name, uniportkb_entry FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE uniprot_disease_name1 IS NOT NULL
UNION 
SELECT DISTINCT uniprot_disease_name2, uniportkb_entry FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE uniprot_disease_name2 IS NOT NULL
UNION 
SELECT DISTINCT uniprot_disease_name3, uniportkb_entry FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE uniprot_disease_name3 IS NOT NULL
UNION 
SELECT DISTINCT uniprot_disease_name4, uniportkb_entry FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE uniprot_disease_name4 IS NOT NULL;


INSERT INTO `t18_staging_p2p`.`t18_do_disease` (doid, disease_name,defination,relationship)
SELECT DISTINCT doid11 AS doid, disease_name11 AS disease_name,defination11 AS defination, relationship11 AS relationship FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid11 IS NOT NULL
UNION
SELECT DISTINCT doid12, disease_name12 ,defintion_12, relation_name12 FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid12 IS NOT NULL
UNION
SELECT DISTINCT doid21, disease_name21,definition21,rekationship21 FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid21 IS NOT NULL
UNION
SELECT DISTINCT doid22, disease_name22,defination_name22, relationship22 FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid22 IS NOT NULL
UNION
SELECT DISTINCT doid31, disease_name31,defination31, relationship31  FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid31 IS NOT NULL
UNION
SELECT DISTINCT doid32, disease_name32,defination32, relationship32 FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid32 IS NOT NULL
UNION
SELECT DISTINCT doid41, disease_name41,defination_41, relation_41 FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid41 IS NOT NULL
UNION
SELECT DISTINCT doid42, disease_name42 ,defination42, relation42  FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid42 IS NOT NULL;
INSERT INTO `t18_staging_p2p`.`t18_gene` (hgnc_id,approved_symbol,approved_name,gene_synonyms,chromosomal_location)
SELECT hgnc_id,approved_symbol,approved_name,gene_synonyms,chromosomal_location FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE hgnc_id IS NOT NULL;
INSERT INTO `t18_staging_p2p`.`t18_protein` (uniprotkb_entry,disease_search_term,alternative_names,sequence_length,mass,hgnc_id)
SELECT uniportkb_entry,disease_search_term,alternamtive_names,sequence_length,mass,hgnc_id FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE uniportkb_entry IS NOT NULL;
INSERT INTO `t18_staging_p2p`.`t18_search_activity` (item_number,data_collected_by,disease_search_term,uniprotkb_entry)
SELECT item_number,data_collected_by,disease_search_term,uniportkb_entry FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE item_number IS NOT NULL AND data_collected_by IS NOT NULL AND disease_search_term IS NOT NULL AND uniportkb_entry IS NOT NULL;
INSERT INTO `t18_staging_p2p`.`t18_uniprot_disease` (uniprot_disease_name,Uniprot_disease_short_name,phenotype_mim_number)
SELECT DISTINCT  uniprot_disease_name1 AS uniprot_disease_name , NULL ,phenotype_mim_number1  AS phenotype_mim_number FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE uniprot_disease_name1 IS NOT NULL
UNION
SELECT DISTINCT uniprot_disease_name2,NULL,phenotype_mim_name2 FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE uniprot_disease_name2 IS NOT NULL
UNION
SELECT DISTINCT uniprot_disease_name3,NULL,phenotype_mim_name3 FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE uniprot_disease_name3 IS NOT NULL
UNION
SELECT DISTINCT uniprot_disease_name4,NULL,phenotype_mim_number4 FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE uniprot_disease_name4 IS NOT NULL;
INSERT INTO `t18_staging_p2p`.`t18_uniprot_do_disease` (doid, uniprot_disease_name,uniprotkb_entry)
SELECT DISTINCT doid11 AS doid, uniprot_disease_name1 AS uniprot_disease_name, uniportkb_entry FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid11 IS NOT NULL AND uniprot_disease_name1 IS NOT NULL AND uniportkb_entry IS NOT NULL
UNION
SELECT DISTINCT doid12, uniprot_disease_name1,uniportkb_entry  FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid12 IS NOT NULL AND uniprot_disease_name1 IS NOT NULL AND uniportkb_entry IS NOT NULL
UNION
SELECT DISTINCT doid21, uniprot_disease_name2,uniportkb_entry FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid21 IS NOT NULL AND uniprot_disease_name2 IS NOT NULL AND uniportkb_entry IS NOT NULL
UNION
SELECT DISTINCT doid22, uniprot_disease_name2,uniportkb_entry FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid22 IS NOT NULL AND uniprot_disease_name2 IS NOT NULL AND uniportkb_entry IS NOT NULL
UNION
SELECT DISTINCT doid31, uniprot_disease_name3, uniportkb_entry FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid31 IS NOT NULL AND uniprot_disease_name3 IS NOT NULL AND uniportkb_entry IS NOT NULL
UNION
SELECT DISTINCT doid32, uniprot_disease_name3, uniportkb_entry FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid32 IS NOT NULL AND uniprot_disease_name3 IS NOT NULL AND uniportkb_entry IS NOT NULL
UNION
SELECT DISTINCT doid41,uniprot_disease_name4,uniportkb_entry FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid41 IS NOT NULL AND uniprot_disease_name4 IS NOT NULL AND uniportkb_entry IS NOT NULL
UNION
SELECT DISTINCT doid42, uniprot_disease_name4,uniportkb_entry  FROM `t18_staging_1`.`t18_stg1_p2p`
WHERE doid42 IS NOT NULL AND uniprot_disease_name4 IS NOT NULL AND uniportkb_entry IS NOT NULL;


SELECT 't18_db_statistics' AS `Table Name`, COUNT(*) AS `# of Records` FROM `t18_db_statistics`
UNION
SELECT 't18_disease', COUNT(*) FROM `t18_disease`
UNION
SELECT 't18_do_disease', COUNT(*) FROM `t18_do_disease`
UNION
SELECT 't18_external_site', COUNT(*) FROM `t18_external_site`
UNION
SELECT 't18_gene', COUNT(*) FROM `t18_gene`
UNION
SELECT 't18_protein', COUNT(*) FROM `t18_protein`
UNION
SELECT 't18_search_activity', COUNT(*) FROM `t18_search_activity`
UNION
SELECT 't18_uniprot_disease', COUNT(*) FROM `t18_uniprot_disease`
UNION
SELECT 't18_uniprot_do_disease', COUNT(*) FROM `t18_uniprot_do_disease`;

SET FOREIGN_KEY_CHECKS = 1;
