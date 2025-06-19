# Relational Modeling and Database Design for Bioinformatics Data

A capstone-level database project focused on designing and implementing a normalized relational schema to integrate UniProt, HGNC, and Disease Ontology datasets. This project demonstrates a full pipeline from data normalization (1NF to 3NF) to MySQL schema development, SQL scripting, FK/PK validation, view creation, and production-level backups.

---

## 📘 Overview
This project models and stores protein, gene, and disease data using industry-standard database practices. It simulates real-world bioinformatics data management through:

- Conceptual data modeling
- Normalization (1NF → 3NF)
- Logical and physical schema design
- Staging and production workflows
- SQL view creation
- Foreign key and primary key validation
- Backup and restore validation

---

## 🗂️ Folder Structure
```
/docs              # Reports, designs, feedback summaries
/models            # .mwb files and exported ER diagrams
/sql               # SQL scripts: DDL, DML, views, validation
/backup            # Full database backups
/view_output       # Query/view result samples
README.md          # Project documentation
```

---

## 🛠️ Technologies Used
- MySQL 8.x
- MySQL Workbench (.mwb modeling)
- SQL (DDL, DML, views, constraints)
- ER modeling
- Windows 10 + MySQL Local Server

---

## 🔄 Key Tasks
- **Data Normalization:** Identified and resolved atomicity violations, multivalued columns, and redundancy.
- **Entity Design:** Developed 3NF-compliant schema with audit fields.
- **ERD Modeling:** Created conceptual and physical diagrams using Workbench.
- **Scripted Schema Creation:** Forward-engineered development, staging, and production environments.
- **View Creation:** Consolidated protein-gene-disease info into a clean SQL view.
- **Validation Queries:** Checked FK/PK integrity across schemas.
- **Data Migration:** Inserted and filtered staging data into normalized production tables.
- **Backup & Restore:** Exported and tested full SQL dumps with schema and data.

---

## ✅ Final Tables Summary (3NF)
- **Protein** – uniprotkb_entry (PK), hgnc_id (FK), alt_names, mass, seq_len
- **Gene** – hgnc_id (PK), approved_symbol, approved_name, chromosomal_location
- **Disease** – uniprot_disease_name (PK), uniprotkb_entry (FK)
- **DO Disease** – doid (PK), name, definition, relationship
- **UniProt Disease** – uniprot_disease_name (PK), phenotype_mim_number
- **UniProt DO Disease** – Composite PK: uniprot_disease_name + doid + uniprotkb_entry
- **Search Activity** – Composite PK: item_number + data_collected_by + disease_search_term
- **External Site** – site_id (PK), site_name, url
- **DB Statistics** – id (PK), description, value

---


## 💡 Skills Demonstrated
- Relational DB design (ERD, normalization)
- SQL scripting (DDL, DML, views, joins)
- Bioinformatics domain modeling
- Data validation and transformation
- Backup strategy and integrity assurance

---

## 🔗 License
MIT License 

---

## 👨‍💻 Author

**Uday Kiran Gogineni** – Clustering & Modeling Lead  
_M.S. in Bioinformatics_  
[LinkedIn](https://www.linkedin.com/in/udaykiran01)
  
