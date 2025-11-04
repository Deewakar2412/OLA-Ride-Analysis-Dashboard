# Ride-Hailing Performance Analysis & Insights Dashboard

End-to-end data analysis of a 100k ride-hailing dataset. Cleaned with Python (Pandas), analyzed with SQL (13 queries), and visualized in a performance dashboard.

![Final Dashboard Screenshot](3.%20Dashboard/Dashboard_Screenshots/01_Dashboard_Overview.png)

## 1. Project Overview

This project performs a comprehensive, end-to-end analysis of a 100,000-row dataset from a ride-hailing company. The goal was to transform raw, messy data into a clean, queryable database and finally into an interactive dashboard that reveals actionable insights for the Operations, Marketing, and Strategy teams.

## 2. Problem Statement

The raw data suffered from significant quality issues:
* **Missing Data:** Key fields like `Driver_Ratings`, `V_TAT`, and `Payment_Method` had many null values.
* **Irrelevant Data:** Columns like `Incomplete_Rides_Reason` were unusable due to high null percentages.
* **Flawed Metrics:** The initial "Top Customer" metric was based on *booking count* (including cancellations) instead of *total revenue*, giving a misleading view of customer value.
* **No Clear Insights:** The business could not answer basic questions like "Why are rides failing?" or "Where is our revenue coming from?".

## 3. Data Pipeline & Methodology

This project followed a 4-step data analysis pipeline:



[Image of an ETL (Extract, Transform, Load) data pipeline]


1.  **Data Cleaning (Python):** The raw `.xlsx` file was loaded into a Python (Pandas) script.
    * Dropped irrelevant columns (`Incomplete_Rides_Reason`, `Canceled_Rides_by...`).
    * Imputed missing numerical data (`Driver_Ratings`, `V_TAT`) with the **median**.
    * Imputed missing categorical data (`Payment_Method`) with the **mode**.
    * Standardized date and time formats.
    * Exported the final `cleaned_bookings.csv`.

2.  **Data Modeling (SQL):** A SQL database schema (`CREATE TABLE ride_bookings`) was designed to hold the cleaned data with appropriate data types (e.g., `NUMERIC` for currency, `DATE` for date).

3.  **Data Analysis (SQL):** A set of 13 comprehensive SQL queries were written to answer key business questions.

4.  **Data Visualization (Dashboard):** The results of the SQL analysis were used to build a final performance dashboard (using Power BI / Tableau / etc.).

## 4. Technology Stack

* **Data Cleaning:** Python (Pandas, NumPy)
* **Database & Analysis:** SQL (PostgreSQL / MySQL)
* **Data Visualization:** Power BI / Tableau (Aapne jo use kiya woh likhein)
* **Version Control:** Git & GitHub

## 5. Dashboard & Key Insights

### Insight 1: Operational Health (Booking Status)
A major finding was that **17.89%** of all bookings are **'Canceled by Driver'**, representing a significant revenue leak and poor customer experience.
![Overall Dashboard](Dashboard%20Screenshorts/overall.png)


### Insight 2: Revenue Drivers (Vehicle Type)
**'Prime Sedan'** is the most profitable category, generating **8.8M** in revenue, followed by 'Prime SUV' (5.5M).

`[YAHAN APNA 'Total Revenue by Vehicle Type' KA SCREENSHOT LAGAYEIN]`
*(File: 3. Dashboard/Dashboard_Screenshots/Screenshot 2025-11-03 193546.png)*

### Insight 3: True Customer Value
By switching the metric from "Booking Count" to **"Total Spending"** (on 'Success' rides only), we identified our *true* high-value customers.

`[YAHAN APNA 'Top 5 Customers by Total Spending' KA SCREENSHOT LAGAYEIN]`
*(File: 3. Dashboard/Dashboard_Screenshots/Screenshot 2025-11-03 193512.png)*

### Insight 4: Demand Hotspots
'Whitefield', 'Marathahalli', and 'Electronic City' are the top 3 pickup locations, indicating where driver allocation should be prioritized.

`[YAHAN APNA 'Top 5 Pickup Location' KA SCREENSHOT LAGAYEIN]`
*(File: 3. Dashboard/Dashboard_Screenshots/Screenshot 2025-11-03 193559.png)*

## 6. SQL Analysis Highlights (Business Questions Answered)

The core analysis was driven by 13 SQL queries designed to solve specific business problems:
1.  **Overall Booking Success Rate:** What percentage of bookings are successful?
2.  **Daily Revenue Trend:** How much revenue are we making each day?
3.  **Top Reasons for Failed Bookings:** Why are bookings not being completed?
4.  **Top 10 Most Valuable Customers:** Who are our best customers (by total spend)?
5.  **Average Driver Rating by Vehicle:** Which vehicle categories have the best drivers?
6.  **Top 10 Most Popular Pickup Locations:** Where is demand highest?
7.  **Top 10 Most Popular Routes:** Which A-to-B routes are most common?
8.  **Impact of Wait Time (V_TAT) on Ratings:** How does a long wait affect driver ratings?
9.  **Payment Method Distribution:** How are customers paying?
10. **Busiest Hours of the Day:** When do most bookings occur?
11. **Avg. Ride Distance & Value by Vehicle:** Are certain vehicles used for longer trips?
12. **Top Pickup Locations with High Driver Cancellation:** Where are drivers cancelling the most?
13. **Analysis of Incomplete Rides:** What are the characteristics of incomplete rides?

## 7. Project File Structure
