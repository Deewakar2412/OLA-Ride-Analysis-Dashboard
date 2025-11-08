<div align="center">
  <h1 align="center">🚕 OLA-Ride-Hailing Performance Analysis 🚕</h1>
  <p align="center">
    An end-to-end analysis of 100,000 booking records, from data cleaning (Python) and analysis (SQL) to a final performance dashboard (Power BI).
  </p>
</div>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
  <img src="https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white" alt="Pandas"/>
  <img src="https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL"/>
  <img src="https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" alt="Power BI"/>
  <img src="https://img.shields.io/badge/Google%20Colab-F9AB00?style=for-the-badge&logo=googlecolab&logoColor=black" alt="Google Colab"/>
</p>

---

## 📌 Table of Contents
- <a href="#overview">Overview</a>
- <a href="#business-problem">Business Problem</a>
- <a href="#dataset">Dataset</a>
- <a href="#tools--technologies">Tools & Technologies</a>
- <a href="#project-structure">Project Structure</a>
- <a href="#project-workflow--data-pipeline">Project Workflow & Data Pipeline</a>
- <a href="#key-performance-indicators-kpis">Key Performance Indicators (KPIs)</a>
- <a href="#research-questions--key-findings">Research Questions & Key Findings</a>
- <a href="#key-visualizations-dashboard">Key Visualizations (Dashboard)</a>
- <a href="#how-to-run-this-project">How to Run This Project</a>
- <a href="#final-recommendations">Final Recommendations</a>
- <a href="#author--contact">Author & Contact</a>

---
<h2><a class="anchor" id="overview"></a>Overview</h2>

This project is an end-to-end analysis of a 100,000-row dataset from a ride-hailing company. The primary goal is to transform raw, messy data into a clean, queryable database and, ultimately, into an interactive Power BI dashboard. This dashboard provides actionable insights to help management optimize operations, refine marketing strategies, and improve overall service quality.

---
<h2><a class="anchor" id="business-problem"></a>Business Problem</h2>

The management lacked clear, data-driven answers to critical business questions. This project was designed to solve that by addressing the following:
- What is our true booking success rate, and why are rides failing?
- Who are our most valuable customers (and is our current definition correct)?
- Where is our revenue coming from in terms of vehicle types?
- Where are our high-demand "hotspots," and where are driver cancellations most common?

---
<h2><a class="anchor" id="dataset"></a>Dataset</h2>

- **Source:** `1. Data/Raw_Data/Bookings-100000-Rows.xlsx`
- **Rows:** 100,000
- **Key Fields:**
  - `Booking_ID`: Unique identifier for each booking.
  - `Booking_Status`: 'Success', 'Canceled by Driver', 'Driver Not Found', etc.
  - `Customer_ID`: Unique ID for each customer.
  - `Vehicle_Type`: 'Prime Sedan', 'Prime SUV', 'Bike', etc.
  - `Pickup_Location`: Starting point of the ride.
  - `Booking_Value`: The revenue generated from the ride.
  - `V_TAT`: Vehicle Turnaround Time (wait time).
  - `Driver_Ratings`: Rating given to the driver.

---
<h2><a class="anchor" id="tools--technologies"></a>Tools & Technologies</h2>

- **Google Colab:** For data cleaning and preparation.
- **Python:** The core language for data cleaning.
- **Pandas:** For data loading, cleaning, and manipulation.
- **SQL (PostgreSQL/MySQL):** For database creation, schema design, and analytical queries.
- **Power BI:** For building the final interactive dashboard.

---
<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

---
<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

```
pizza-sales-analysis/
│
├── README.md
│
├── Data/                   
│   ├── pizza_sales (3).csv
│   ├── pizza_sales_excel_file (2).xlsx
│
├── Main Business Requirements Doc.pdf    
│   └── Pizza_Sales_EDA.ipynb
│
├── Pizza_Sales_EDA.ipy

```
---
<h2><a class="anchor" id="project-workflow--data-pipeline"></a>Project Workflow & Data Pipeline</h2>

This project followed a 4-step data pipeline:

1.  **Data Cleaning (Python):** The raw `.xlsx` file was loaded into a Python (Pandas) script in Google Colab.
    - Dropped unusable columns (`Incomplete_Rides_Reason`, `Canceled_Rides_by_Customer`).
    - Imputed missing numerical data (`Driver_Ratings`, `V_TAT`) with the **median**.
    - Imputed missing categorical data (`Payment_Method`) with the **mode**.
    - Exported the final `cleaned_bookings.csv`.

2.  **Data Modeling (SQL):** A SQL database schema (`CREATE TABLE ride_bookings`) was designed (see `2_Database_Schema.sql`) to store the cleaned data with appropriate data types.

3.  **Data Analysis (SQL):** A set of 13 comprehensive SQL queries (see `3_Business_Analysis_Queries.sql`) were written to answer all key business questions, such as Top 10 Customers, Daily Revenue Trends, and High Cancellation Locations.

4.  **Data Visualization (Power BI):** The SQL database was connected to Power BI. The SQL queries were used to create the final dashboard, visualizing all KPIs and findings.

---
