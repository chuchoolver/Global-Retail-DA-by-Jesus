## Objective

The objective of this phase was to transform the prepared dataset into a structured Data Warehouse optimized for Business Intelligence and reporting.

Using SQL Server, the raw data was processed through an ETL workflow, organized into a Star Schema, and stored in dimension and fact tables. Relationships, indexes, and validation procedures were implemented to ensure data integrity, optimize query performance, and provide a scalable foundation for Power BI dashboards.

---

## Preprocessing

Before importing the dataset into SQL Server, a light preprocessing step was performed to improve data consistency while preserving the original dataset.

The original CSV file was kept unchanged as a backup, and a working copy was created for the ETL process. During this step, the `Year` column was removed because its values could be derived directly from the `OrderDate` field, eliminating redundant information and following database normalization principles.

This preprocessing ensured that the dataset was clean, consistent, and ready for the Data Warehouse implementation without altering the original source data.

<p>

<p align="center">
    <img src="Images/process/dataset_year.png"
         alt="Dataset before preprocessing"
         width="900">
</p>

<p align="center">
<i>Figure 1. Before Preprocessing.</i>
</p>

<p align="center">
    <img src="Images/process/dataset_notyear.png"
         alt="Dataset after preprocessing"
         width="900">
</p>

<p align="center">
<i>Figure 1.1 After Preprocessing.</i>
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

---

## Schema Design

To improve organization and maintainability, the database was divided into separate schemas based on the role of each object within the Data Warehouse architecture.

Three schemas were created:

- **stg**: Stores the raw data imported from the source file before transformation.
- **dim**: Contains dimension tables that describe business entities such as customers, products, and locations.
- **fact**: Contains the fact table, which stores measurable business events and references the dimension tables through foreign keys.

Separating objects into schemas improves readability, simplifies administration, and follows common data warehousing best practices.

```sql
CREATE SCHEMA stg;
GO

CREATE SCHEMA dim;
GO

CREATE SCHEMA fact;
GO
```

<p align="center">
    <img src="Images/process/schema_design.png"
         alt="Database schema structure"
         width="900">
</p>

<p align="center">
<i>Figure 5. Database schemas used to organize the Data Warehouse objects.</i>
</p>

> **💡 Design Insight**
>
> **Why use separate schemas instead of storing all tables under `dbo`?**
>
> Using dedicated schemas improves database organization by grouping objects according to their purpose. It also simplifies maintenance, enhances security management through schema-level permissions, and makes the Data Warehouse easier to scale as new objects are added. This logical separation is considered a best practice in enterprise database design.

---

## Staging Layer

A staging layer was implemented to serve as the initial landing area for the raw data imported from the CSV file.

The staging table preserves the original structure of the dataset, allowing the data to be validated, transformed, and cleansed before being loaded into the dimensional model. Keeping the staging layer separate from the analytical tables reduces the risk of data inconsistencies and provides a controlled environment for the ETL process.

For this project, the source data was imported into the `stg.SuperStore` table, which became the starting point for all subsequent transformations.

```sql
CREATE TABLE stg.SuperStore (
    OrderID NVARCHAR(50),
    OrderDate DATE,
    ShipDate DATE,
    CustomerID NVARCHAR(50),
    ProductID NVARCHAR(50),
    Sales DECIMAL(10,2),
    Quantity INT,
    Profit DECIMAL(10,2)
    -- Additional columns...
);
```

<p align="center">
    <img src="Images/process/staging_table.png"
         alt="Staging table in SQL Server"
         width="900">
</p>

<p align="center">
<i>Figure 6. Staging table containing the raw data imported from the source CSV file.</i>
</p>

> **💡 Design Insight**
>
> **Why use a staging layer instead of loading data directly into the dimension and fact tables?**
>
> A staging layer isolates the raw source data from the analytical model, making the ETL process safer and easier to manage. It allows data quality checks, transformations, and validation to be performed before loading the final tables, reducing the risk of introducing inconsistent or incomplete data into the Data Warehouse.

### 📌 Key Takeaways

- The staging layer is the first destination for the raw source data.
- It preserves the original dataset before any transformation is applied.
- Data validation and cleansing are performed before loading the dimensional model.
- Separating staging from analytical tables improves data quality and simplifies ETL maintenance.
- This approach follows common Data Warehouse and ETL best practices.