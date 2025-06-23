/*
File:  t18_assign9_4.sql
Author: Uday.
First version date: 05/05/2024
Last version date:05/05/2024
Revision notes.
This sample script demonstrate how to Validate	the	PKs	and	FKs	in	the	staging	database tn_staging_p2p.
*/

SELECT id, COUNT(*)
FROM t18_db_statistics
GROUP BY id
HAVING COUNT(*) > 1;
SELECT uniprot_disease_name, uniprotkb_entry, COUNT(*)
FROM t18_disease
GROUP BY uniprot_disease_name, uniprotkb_entry
HAVING COUNT(*) > 1;
SELECT doid, COUNT(*)
FROM t18_do_disease
GROUP BY doid
HAVING COUNT(*) > 1;
SELECT site_id, COUNT(*)
FROM t18_external_site
GROUP BY site_id
HAVING COUNT(*) > 1;
SELECT hgnc_id, COUNT(*)
FROM t18_gene
GROUP BY hgnc_id
HAVING COUNT(*) > 1;
SELECT uniprotkb_entry, COUNT(*)
FROM t18_protein
GROUP BY uniprotkb_entry
HAVING COUNT(*) > 1;
SELECT item_number, data_collected_by, disease_search_term, uniprotkb_entry, COUNT(*)
FROM t18_search_activity
GROUP BY item_number, data_collected_by, disease_search_term, uniprotkb_entry
HAVING COUNT(*) > 1;
SELECT uniprot_disease_name, COUNT(*)
FROM t18_uniprot_disease
GROUP BY uniprot_disease_name
HAVING COUNT(*) > 1;
SELECT doid, uniprot_disease_name, uniprotkb_entry, COUNT(*)
FROM t18_uniprot_do_disease
GROUP BY doid, uniprot_disease_name, uniprotkb_entry
HAVING COUNT(*) > 1;

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



