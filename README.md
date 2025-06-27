# SQL DataWarehouse Project 

Welcome to the SQL DataWarehouse and Analytics Project repository! 
Consolidate Sales data from CRM and ERP to enable analytical reporting.Building a modern data warehouse with SQL server, including ETL processes, data modelling and analytics. 
This project demonstrates a comprehensive DWH and analytics solution, from building a DWH to generate actionable insights. Designed as a portfolio project highlighting industry best practices in data engineering and analyics.

Data Architecture
The data architecture for this project follows Medallion Architecture Bronze, Silver, and Gold layers: Data Architecture
![image](https://github.com/user-attachments/assets/1213e1c6-ec23-4735-8a94-6ecff821dc08)

1. Bronze Layer: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. Silver Layer: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. Gold Layer: Houses business-ready data modeled into a star schema required for reporting and analytics.

📖 **Project Overview**

This project involves:

Data Architecture: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.

ETL Pipelines: Extracting, transforming, and loading data from source systems into the warehouse.

Data Modeling: Developing fact and dimension tables optimised for analytical queries.

Analytics & Reporting: Creating SQL-based reports and dashboards for actionable insights.


SQL Development
Data Architect
Data Engineering
ETL Pipeline Developer
Data Modeling
Data Analytics


Datasets: Access to the project dataset (csv files).

SQL Server Express: Lightweight server for hosting your SQL database.

SQL Server Management Studio (SSMS): GUI for managing and interacting with databases.

Git Repository: Set up a GitHub account and repository to manage, version, and collaborate on your code efficiently.

DrawIO: Design data architecture, models, flows, and diagrams.

Notion: Get the Project Template from Notion

Notion Project Steps: Access to All Project Phases and Tasks.

🚀** Project Requirements**
Building the Data Warehouse (Data Engineering)

Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

Specifications
Data Sources: Import data from two source systems (ERP and CRM) provided as CSV files.

Data Quality: Cleanse and resolve data quality issues prior to analysis.

Integration: Combine both sources into a single, user-friendly data model designed for analytical queries.

Scope: Focus on the latest dataset only; historisation of data is not required.

Documentation: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

**BI: Analytics & Reporting (Data Analysis)**

Objective
Develop SQL-based analytics to deliver detailed insights into:

Customer Behavior
Product Performance
Sales Trends
These insights empower stakeholders with key business metrics, enabling strategic decision-making.

For more details, refer to docs/requirements.md.

📂 **Repository Structure**

![image](https://github.com/user-attachments/assets/00728aad-ae09-4be6-ae12-e733fc1dfb2d)



🛡️ License
This project is licensed under the MIT License. You are free to use, modify, and share this project with proper attribution.
