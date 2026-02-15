# 🧺 CS 432 – Assignment 1  
## FreshWash Laundry Management System  
IIT Gandhinagar – Database Systems

---

## 📌 Repository Link
GitHub:  
https://github.com/Vedant-VB07/Databases_Assignment_1.git

---

# 📖 Project Overview

FreshWash is a database-driven Laundry Management System designed to replace manual record-keeping with a structured, normalized relational database.

The system models the complete lifecycle of laundry operations, including:

- Member registration
- Order placement and tracking
- Multi-service selection per order
- Pricing management
- Staff assignment
- Payment processing
- Status logging
- Feedback and lost item reporting

This assignment focuses on **conceptual modeling (UML), ER design (Chen notation), and relational schema implementation using MySQL.**

---

# Assignment Requirements Fulfilled

✔ Minimum 5 core functionalities  
✔ More than 5 entities  
✔ 13 normalized tables (≥10 required)  
✔ Primary Keys and Foreign Keys implemented  
✔ Referential integrity enforced  
✔ Logical domain constraints applied  
✔ Synthetic data (10–20 rows per table) included  
✔ Complete MySQL dump file provided  
✔ UML → ER systematic transition documented  

---

# System Architecture

The database is structured into four logical modules:

## 👥 Stakeholders
- Member
- Employee

## 📋 Transactional
- Laundry_Order
- Order_Service
- Order_Assignment
- Order_Status_Log

## 🧾 Master Data
- Service
- Clothing_Type
- Price

## 💳 Finance & Exceptions
- Payment
- Payment_Status
- Feedback
- Lost_Item

---

# 🧩 UML Class Diagram

The UML Class Diagram was designed first using a UML-first modeling approach.

Key highlights:

- Object-level abstraction of system entities
- Explicit multiplicity (1:1, 1:M, M:N)
- Associative classes for M:N resolution
- Clear modular grouping

Major relationships:

- Member → Order (1:M)
- Order → Payment (1:1)
- Order ↔ Service (M:N resolved via Order_Service)
- Order ↔ Employee (M:N resolved via Order_Assignment)
- Payment → Payment_Status (1:M)

---

# 🔄 ER Diagram (Chen Notation)

The ER model was derived systematically from UML.

Mapping strategy:

| UML | ER |
|-----|----|
| Class | Entity |
| Attribute | Oval |
| Association | Diamond |
| Multiplicity | Cardinality (1, N) |
| M:N | Associative Entity |

The ER diagram includes:

- 13 entities
- 13 relationships
- Explicit cardinality
- Underlined primary keys
- Modular grouping for clarity

---

# 🗄️ Database Schema

The system is implemented in MySQL (8.0).

Key schema features:

- AUTO_INCREMENT primary keys
- NOT NULL enforcement (≥3 per table)
- UNIQUE constraints (email, contact number, service name)
- CHECK constraints (age, rating, quantity, price)
- ON DELETE CASCADE for dependent records
- Composite uniqueness in pricing table

---

# 📊 Synthetic Data & SQL Dump

A complete MySQL dump file is included:


It contains:

- All CREATE TABLE statements
- PK & FK definitions
- CHECK constraints
- UNIQUE constraints
- 10–20 realistic records per table
- Referential integrity validation

Synthetic data simulates real-world scenarios:

- Multi-service orders
- Employee task distribution
- Payment lifecycle tracking
- Feedback ratings
- Lost item compensation cases

The database can be recreated using:

sql
SOURCE laundrydb.sql;


It contains:

- All CREATE TABLE statements
- PK & FK definitions
- CHECK constraints
- UNIQUE constraints
- 10–20 realistic records per table
- Referential integrity validation

Synthetic data simulates real-world scenarios:

- Multi-service orders
- Employee task distribution
- Payment lifecycle tracking
- Feedback ratings
- Lost item compensation cases

The database can be recreated using:

sql
SOURCE laundrydb.sql;

Databases_Assignment_1

├── UML

├── ER_Diagram.pdf

├── Assignment_1_report.pdf

├── DumpLaundryDB.sql

└── Readme.md

🛠️ Technologies Used

MySQL 8.0

MySQL Workbench

draw.io (UML & ER modeling)

LaTeX / TikZ (documentation)

Visual Studio Code

Windows x86_64

👥 Team Contributions

-Kaushal

Designed ER Diagram (Chen notation)

Contributed to relational schema structuring


-Vedant

Designed UML Class Diagram

Contributed to schema alignment

-Anurag

Implemented MySQL database schema

Enforced integrity constraints

-Dhruv

Structured and formatted technical report

Assisted in schema ideation

-Pratik

Assisted in SQL implementation

Verified constraint enforcement

📜 Honor Code Declaration

We affirm that this project was completed in accordance with the IITGN Honor Code. No unauthorized assistance or external solutions were used.

Key Outcomes

- Fully normalized relational schema

- Correct M:N resolution via associative tables

- Enforced domain constraints

- Validated referential integrity

- Complete UML → ER → SQL pipeline
