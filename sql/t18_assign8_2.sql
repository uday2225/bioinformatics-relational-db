SELECT 't18_disease' AS child, 't18_protein' AS parent
FROM t18_disease d
LEFT OUTER JOIN t18_protein p ON d.uniprotkb_entry = p.uniprotkb_entry
WHERE p.uniprotkb_entry IS NULL;

SELECT 't18_do_disease' AS child, 't18_disease' AS parent
FROM t18_do_disease dd
LEFT OUTER JOIN t18_disease d ON dd.disease_name = d.uniprot_disease_name
WHERE d.uniprot_disease_name IS NULL;

SELECT 't18_external_site' AS child, 't18_protein' AS parent
FROM t18_external_site es
LEFT OUTER JOIN t18_protein p ON es.site_id = p.hgnc_id
WHERE p.hgnc_id IS NULL;

SELECT 't18_gene' AS child, 't18_protein' AS parent
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
