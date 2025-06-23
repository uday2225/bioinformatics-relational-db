/*
File:  t18_assign7_5.sql
Author: Uday.
First version date: 04/25/2024
Last version date:04/25/2024
Revision notes.
These sample scripts demonstrate how to count the number of rows in each table in these
three schemas tn_dev_p2p, tn_staging_p2p, and tn_staging_1
*/

SELECT 't18_dev_p2p' AS schema_name, 't18_db_statistics' AS table_name, COUNT(*) AS number_of_records FROM t18_dev_p2p.t18_db_statistics
UNION ALL
SELECT 't18_dev_p2p' AS schema_name, 't18_disease' AS table_name, COUNT(*) AS number_of_records FROM t18_dev_p2p.t18_disease
UNION ALL
SELECT 't18_dev_p2p' AS schema_name, 't18_do_disease' AS table_name, COUNT(*) AS number_of_records FROM t18_dev_p2p.t18_do_disease
UNION ALL
SELECT 't18_dev_p2p' AS schema_name, 't18_external_site' AS table_name, COUNT(*) AS number_of_records FROM t18_dev_p2p.t18_external_site
UNION ALL
SELECT 't18_dev_p2p' AS schema_name, 't18_gene' AS table_name, COUNT(*) AS number_of_records FROM t18_dev_p2p.t18_gene
UNION ALL
SELECT 't18_dev_p2p' AS schema_name, 't18_protein' AS table_name, COUNT(*) AS number_of_records FROM t18_dev_p2p.t18_protein
UNION ALL
SELECT 't18_dev_p2p' AS schema_name, 't18_search_activity' AS table_name, COUNT(*) AS number_of_records FROM t18_dev_p2p.t18_search_activity
UNION ALL
SELECT 't18_dev_p2p' AS schema_name, 't18_uniprot_disease' AS table_name, COUNT(*) AS number_of_records FROM t18_dev_p2p.t18_uniprot_disease
UNION ALL
SELECT 't18_dev_p2p' AS schema_name, 't18_uniprot_do_disease' AS table_name, COUNT(*) AS number_of_records FROM t18_dev_p2p.t18_uniprot_do_disease
UNION ALL
SELECT 't18_staging_p2p' AS schema_name, 't18_db_statistics' AS table_name, COUNT(*) AS number_of_records FROM t18_staging_p2p.t18_db_statistics
UNION ALL
SELECT 't18_staging_p2p' AS schema_name, 't18_disease' AS table_name, COUNT(*) AS number_of_records FROM t18_staging_p2p.t18_disease
UNION ALL
SELECT 't18_staging_p2p' AS schema_name, 't18_do_disease' AS table_name, COUNT(*) AS number_of_records FROM t18_staging_p2p.t18_do_disease
UNION ALL
SELECT 't18_staging_p2p' AS schema_name, 't18_external_site' AS table_name, COUNT(*) AS number_of_records FROM t18_staging_p2p.t18_external_site
UNION ALL
SELECT 't18_staging_p2p' AS schema_name, 't18_gene' AS table_name, COUNT(*) AS number_of_records FROM t18_staging_p2p.t18_gene
UNION ALL
SELECT 't18_staging_p2p' AS schema_name, 't18_protein' AS table_name, COUNT(*) AS number_of_records FROM t18_staging_p2p.t18_protein
UNION ALL
SELECT 't18_staging_p2p' AS schema_name, 't18_search_activity' AS table_name, COUNT(*) AS number_of_records FROM t18_staging_p2p.t18_search_activity
UNION ALL
SELECT 't18_staging_p2p' AS schema_name, 't18_uniprot_disease' AS table_name, COUNT(*) AS number_of_records FROM t18_staging_p2p.t18_uniprot_disease
UNION ALL
SELECT 't18_staging_p2p' AS schema_name, 't18_uniprot_do_disease' AS table_name, COUNT(*) AS number_of_records FROM t18_staging_p2p.t18_uniprot_do_disease
UNION ALL
SELECT 't18_staging_1' AS schema_name, 'dt18_stg1_p2p' AS table_name, COUNT(*) AS number_of_records FROM t18_staging_1.dt18_stg1_p2p
