/*
File:  t18_assign9_5.sql
Author: Uday.
First version date: 05/05/2024
Last version date:05/05/2024
Revision notes.
This sample script demonstrate how to Copy data	from the staging database to the production	database	
tn_prod_p2p
*/

USE t18_prod_p2p;
INSERT INTO t18_uniprot_disease (uniprot_disease_name, Uniprot_disease_short_name, phenotype_mim_number, create_time, update_time)
SELECT uniprot_disease_name, Uniprot_disease_short_name, phenotype_mim_number, create_time, update_time FROM t18_staging_p2p.t18_uniprot_disease
WHERE is_valid = 1;

INSERT INTO t18_gene (hgnc_id, approved_symbol, approved_name, gene_synonyms, chromosomal_location, create_time, update_time)
SELECT hgnc_id, approved_symbol, approved_name, gene_synonyms, chromosomal_location, create_time, update_time FROM t18_staging_p2p.t18_gene
WHERE is_valid = 1;
INSERT INTO t18_protein (uniprotkb_entry, disease_search_term, alternative_names, sequence_length, mass,  hgnc_id, create_time, update_time)
SELECT uniprotkb_entry, disease_search_term, alternative_names, sequence_length, mass,  hgnc_id, create_time, update_time FROM t18_staging_p2p.t18_protein
WHERE is_valid = 1;
INSERT INTO t18_search_activity (item_number, data_collected_by, disease_search_term, uniprotkb_entry, create_time, update_time)
SELECT item_number, data_collected_by, disease_search_term, uniprotkb_entry, create_time, update_time FROM t18_staging_p2p.t18_search_activity
WHERE is_valid = 1;
INSERT INTO t18_disease (uniprot_disease_name, uniprotkb_entry, create_time, update_time)
SELECT uniprot_disease_name, uniprotkb_entry, create_time, update_time FROM t18_staging_p2p.t18_disease
WHERE is_valid = 1;

INSERT INTO t18_do_disease (doid, disease_name, defination, relationship, create_time, update_time)
SELECT doid, disease_name, defination, relationship, create_time, update_time FROM t18_staging_p2p.t18_do_disease
WHERE is_valid = 1;
INSERT INTO t18_uniprot_do_disease (doid, uniprot_disease_name, uniprotkb_entry, create_time, update_time)
SELECT doid, uniprot_disease_name, uniprotkb_entry, create_time, update_time FROM t18_staging_p2p.t18_uniprot_do_disease
WHERE is_valid = 1;

SELECT 't18_disease' AS child, 't18_protein' AS parent
FROM t18_disease d
LEFT OUTER JOIN t18_protein p ON d.uniprotkb_entry = p.uniprotkb_entry
WHERE p.uniprotkb_entry IS NULL;

SELECT dd.doid AS child_id, dd.disease_name AS child_name, d.uniprot_disease_name AS parent_name
FROM t18_do_disease dd
LEFT OUTER JOIN t18_disease d ON dd.disease_name = d.uniprot_disease_name
WHERE d.uniprot_disease_name IS NULL;


SELECT 't18_external_site' AS child, 't18_protein' AS parent
FROM t18_external_site es
LEFT OUTER JOIN t18_protein p ON es.site_id = p.hgnc_id
WHERE p.hgnc_id IS NULL;

SELECT g.hgnc_id AS gene_id, g.approved_symbol AS gene_symbol, p.hgnc_id AS protein_hgnc_id
FROM t18_gene g
LEFT OUTER JOIN t18_protein p ON g.hgnc_id = p.hgnc_id
WHERE p.hgnc_id IS NULL;

SELECT 't18_search_activity' AS child, 't18_protein' AS parent
FROM t18_search_activity sa
LEFT OUTER JOIN t18_protein p ON sa.uniprotkb_entry = p.uniprotkb_entry
WHERE p.uniprotkb_entry IS NULL;

SELECT 't18_uniprot_do_disease' AS child, 't18_do_disease' AS parent
FROM t18_uniprot_do_disease udd
LEFT OUTER JOIN t18_do_disease dd ON udd.doid = dd.doid
WHERE dd.doid IS NULL;

