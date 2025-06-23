# 🧬 Relational Modeling and Database Design for Bioinformatics Data

A capstone-level database project focused on designing and implementing a normalized relational schema for integrating **UniProt**, **HGNC**, and **Disease Ontology (DO)** datasets. This project delivers a complete workflow—from raw data analysis and 1NF–3NF normalization to SQL schema development, referential integrity validation, and staging-to-production deployment using MySQL.

---

## 📘 Overview

This project simulates a real-world bioinformatics database pipeline, modeling and storing protein, gene, and disease information through:

- Conceptual and physical ER modeling  
- Multi-phase normalization (1NF → 3NF)  
- Schema design for development, staging, and production  
- SQL-based DDL and DML operations  
- View generation for integrated disease queries  
- Data validation and transformation workflows  
- Full database backup and recovery procedures

---

## 🗂️ Folder Structure

```bash
/docs              # Final report, design documents, feedback
/models            # MySQL Workbench (.mwb files) & ERD diagrams (PDF)
/sql               # SQL scripts: DDL, DML, views, validations
/backup            # mysqldump-based SQL backups (dev/staging/prod)
/view_output       # View query outputs (CSV/screenshots)
README.md          # Project documentation
```

---

## 🛠️ Technologies Used

- **MySQL 8.x**  
- **MySQL Workbench**  
- **SQL (DDL, DML, Views, Constraints)**  
- **Relational Theory & Normalization**  
- **Bioinformatics Curation (UniProt, HGNC, DOID)**

---

## 🔄 Key Tasks Completed

- 🧩 **Data Normalization**: Identified multivalued and derived attributes; normalized to 3NF.  
- 🧬 **Schema Design**: Created ERDs and functional dependency maps; applied composite and surrogate keys.  
- 🏗️ **ERD Modeling**: Built conceptual and physical diagrams using Workbench.  
- 🧾 **Scripted Development**: Wrote SQL for schema creation, data validation, and inserts.  
- 🔍 **View Creation**: Built `t18_vw_p2p` to combine protein, gene, and disease info.  
- 🔐 **PK/FK Integrity Validation**: Used `LEFT JOIN + IS NULL` to ensure referential accuracy.  
- 🔄 **Migration Pipelines**: Loaded from staging into production while filtering invalid data.  
- 🛡️ **Backup/Restore**: Performed complete `.sql` exports and tested database recovery.

---

## ✅ Final 3NF Table Summary

| Table                 | Primary Key(s)                                  | Foreign Key(s)                                         |
|----------------------|--------------------------------------------------|--------------------------------------------------------|
| **Protein**           | uniprotkb_entry                                  | hgnc_id → Gene                                         |
| **Gene**              | hgnc_id                                          | —                                                      |
| **Disease**           | uniprot_disease_name                             | uniprotkb_entry → Protein                              |
| **UniProt Disease**   | uniprot_disease_name                             | —                                                      |
| **DO Disease**        | doid                                             | —                                                      |
| **UniProt DO Disease**| uniprot_disease_name + doid + uniprotkb_entry   | doid → DO_Disease, uniprot_disease_name → Disease      |
| **Search Activity**   | item_number + data_collected_by + disease_search_term | uniprotkb_entry → Protein                        |
| **External Site**     | site_id                                          | —                                                      |
| **DB Statistics**     | id                                               | —                                                      |

---

## 💡 Skills Demonstrated

- Advanced relational database design (ER modeling, normalization)  
- SQL scripting for DDL, DML, data validation, and transformation  
- Schema engineering for production-scale data systems  
- Hands-on data curation using real-world bioinformatics ontologies  
- View optimization and referential integrity enforcement  
- Backup/restore automation for deployment-ready environments

---

## 🔗 License

This project is released under the [MIT License](https://opensource.org/licenses/MIT).

---

## 👨‍💻 Author

**Uday Kiran Gogineni**  
_M.S. in Bioinformatics_  
[LinkedIn Profile](https://www.linkedin.com/in/udaykiran01)
