# 📦 Prepare

## Objective

The purpose of this phase is to evaluate the dataset before starting the ETL process. This includes understanding its structure, validating its source, identifying its main characteristics, and ensuring that the data is suitable for building a Business Intelligence solution.

---

## Dataset Source

The dataset used in this project is the **SuperStore Sales Analytics Dataset**, publicly available on **Kaggle**. It contains transactional sales data from a fictional retail company and is widely used for learning and demonstrating Business Intelligence, Data Analytics, and Data Visualization concepts.

**Source:** Kaggle – SuperStore Sales Analytics

<p align="center">
    <img src="Images:\prepare:\kaggle_dataset.png" width="900">
</p>

---

## Dataset Overview

Before starting the ETL process, the dataset was analyzed to understand its structure and determine whether it was suitable for building a Business Intelligence solution.

### Dataset Summary

| Property | Value |
|----------|-------|
| Dataset Name | SuperStore Sales Analytics |
| Source | Kaggle |
| File Format | CSV |
| Total Records | 51,290 |
| Original Columns | 21 |
| Target Database | SQL Server (RetailDW) |

---

## Dataset Structure

The dataset contains transactional information that can be grouped into the following business areas:

| Category | Examples |
|-----------|----------|
| Dates | OrderDate, ShipDate |
| Customer Information | CustomerID, CustomerName, Segment |
| Product Information | ProductID, ProductName, Category, SubCategory |
| Geographic Information | Country, State, Region, Market |
| Sales Metrics | Sales, Quantity, Discount, Profit, ShippingCost |
| Shipping Information | ShipMode, OrderPriority |

---

## Dataset Preview

The following image shows a sample of the original dataset before any transformation.

<p align="center">
    <img src="Images:\prepare:\dataset_preview.png" width="900">
</p>

---

## Data Credibility

The dataset was obtained from Kaggle, one of the most recognized platforms for data science and analytics projects.

Although it represents a fictional retail company, it contains realistic transactional information that is appropriate for demonstrating Business Intelligence concepts such as dimensional modeling, ETL processes, SQL development, and dashboard creation.

For these reasons, the dataset was considered suitable for this project.

---

## Initial Observations

Before starting the ETL process, the following observations were identified:

- Each row represents a sales transaction.
- The dataset contains customer, product, geography, shipping and sales information.
- The available attributes are sufficient to build a dimensional model.
- Sales, Profit and Quantity will become business measures.
- Customer, Product, Geography and Shipping information will become dimension tables.
- Date fields will support time-based analysis in Power BI.

---

## Deliverables

At the end of this phase:

- ✔ Dataset source validated.
- ✔ Dataset structure analyzed.
- ✔ Business entities identified.
- ✔ Data suitable for dimensional modeling.
- ✔ Ready to begin the **Process** phase.

---

## Next Step

➡️ **Process**

During the next phase, the dataset will be transformed into a SQL Server Data Warehouse by implementing the ETL process, designing the Star Schema, creating dimension tables, loading the fact table, and validating the data model.