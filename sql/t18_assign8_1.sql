/*
File:  t18_assign9_4.sql
Author: Uday.
First version date: 05/05/2024
Last version date:05/05/2024
Revision notes.
This sample script demonstrate how to Create a view	t18_vw_p2p	in	t18_dev_p2p.
*/
CREATE VIEW t18_dev_p2p.t18_vw_p2p AS
SELECT distinct
    p.uniprotkb_entry AS `UniProtKB Entry`,
    p.alternative_names AS `Protein Name`,
    p.alternative_names AS `Alternative Protein Names`,
    g.hgnc_id AS `HGNC ID`,
    g.approved_symbol AS `Approved Gene Symbol`,
    g.chromosomal_location AS `Chromosomal Location`,
    d.uniprot_disease_name AS `UniProt Disease Name`,
    u.phenotype_mim_number AS `Phenotype MIM #`,
    do.doid AS `DOID`,
    do.disease_name AS `DO Disease Name`
FROM 
    t18_protein p
LEFT OUTER JOIN
    t18_gene g ON p.hgnc_id = g.hgnc_id
LEFT OUTER JOIN
    t18_disease d ON p.uniprotkb_entry = d.uniprotkb_entry
LEFT OUTER JOIN
    t18_uniprot_disease u ON d.uniprot_disease_name = u.uniprot_disease_name
LEFT OUTER JOIN
    t18_uniprot_do_disease udo ON udo.uniprotkb_entry = p.uniprotkb_entry
LEFT OUTER JOIN
    t18_do_disease do ON udo.doid = do.doid;
