/*
File:  t18_assign7_5.sql
Author: Uday.
First version date: 04/25/2024
Last version date:04/25/2024
Revision notes.
This sample script demonstrate how to add required rows in this schema t18_dev_p2p
*/
INSERT INTO t18_dev_p2p.t18_external_site
VALUES 
    (1,'UniProt', 'http://www.uniprot.org/uniprot/', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2,'HGNC', 'http://www.genenames.org/cgi-bin/gene_symbol_report?hgnc_id=', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
