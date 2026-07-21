## Objective

The objective of this phase was to transform the prepared dataset into a structured Data Warehouse optimized for Business Intelligence and reporting.

Using SQL Server, the raw data was processed through an ETL workflow, organized into a Star Schema, and stored in dimension and fact tables. Relationships, indexes, and validation procedures were implemented to ensure data integrity, optimize query performance, and provide a scalable foundation for Power BI dashboards.

---

## Preprocessing

Before importing the dataset into SQL Server, a light preprocessing step was performed to improve data consistency while preserving the original dataset.

The original CSV file was kept unchanged as a backup, and a working copy was created for the ETL process. During this step, the `Year` column was removed because its values could be derived directly from the `OrderDate` field, eliminating redundant information and following database normalization principles.

This preprocessing ensured that the dataset was clean, consistent, and ready for the Data Warehouse implementation without altering the original source data.

<h3 align="center">Before Preprocessing</h3>

<p align="center">
    <img src="Images/process/dataset_year.png"
         alt="Dataset before preprocessing"
         width="900">
</p>

<h3 align="center">After Preprocessing</h3>

<p align="center">
    <img src="Images/process/dataset_notyear.png"
         alt="Dataset after preprocessing"
         width="900">
</p>

---

## SQL Server Environment

Microsoft SQL Server was selected as the database management system for implementing the Data Warehouse due to its reliability, scalability, and strong integration with Business Intelligence tools.

SQL Server Management Studio (SSMS) was used to design the database, execute SQL scripts, manage objects, and validate the ETL process. This environment provided the necessary tools to efficiently build and maintain the relational data model that would later be connected to Power BI for reporting and analysis.

<p align="center">
    <img src="Images/process/sql_server_environment.png"
         alt="SQL Server Management Studio Environment"
         width="900">
</p>

<p align="center">
<i>Figure 3. SQL Server Management Studio (SSMS) environment used to develop the Data Warehouse.</i>
</p>

---

## Database Creation

A dedicated database named `RetailDW` was created to store and manage the Data Warehouse objects.

Creating a separate database provides better organization, simplifies maintenance, and isolates analytical workloads from operational systems. This approach follows common data warehousing best practices by keeping the analytical environment independent from the original data source.

This database serves as the foundation for all subsequent components, including schemas, staging tables, dimension tables, fact tables, and ETL processes.

<p align="center">
    <img src="Images/process/database_creation.png"
         alt="RetailDW database created in SQL Server"
         width="900">
</p>

<p align="center">
<i>Figure 4. Creation of the RetailDW database in SQL Server.</i>
</p>