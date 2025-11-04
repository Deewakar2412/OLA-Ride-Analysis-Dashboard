# 🚖 Ride-Hailing Performance Analysis & Insights Dashboard  

![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/PostgreSQL-336791?logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?logo=power-bi&logoColor=black)
![MS Office](https://img.shields.io/badge/MS%20Office-D83B01?logo=microsoft-office&logoColor=white)

End-to-end data analysis of a **100k ride-hailing dataset**.  
Cleaned with **Python (Pandas)**, analyzed with **SQL (13 queries)**, and visualized in a **Power BI performance dashboard**.

---

## 1️⃣ Project Overview

This project performs a comprehensive, end-to-end analysis of a 100,000-row dataset from a ride-hailing company.  
The goal was to transform raw, messy data into a clean, queryable database and finally into an interactive dashboard that reveals actionable insights for the **Operations**, **Marketing**, and **Strategy** teams.

---

## 2️⃣ Problem Statement

The raw data suffered from significant quality issues:

- **Missing Data:** Key fields like `Driver_Ratings`, `V_TAT`, and `Payment_Method` had many null values.  
- **Irrelevant Data:** Columns like `Incomplete_Rides_Reason` were unusable due to high null percentages.  
- **Flawed Metrics:** The initial “Top Customer” metric was based on *booking count* (including cancellations) instead of *total revenue*, giving a misleading view of customer value.  
- **No Clear Insights:** The business could not answer basic questions like *“Why are rides failing?”* or *“Where is our revenue coming from?”*

---

## 3️⃣ Data Pipeline & Methodology

This project followed a **4-step data analysis pipeline:**

![ETL Pipeline](3.%20Dashboard/Dashboard_Screenshots/data_pipeline.png)

### 🔹 Step 1: Data Cleaning (Python)
- Loaded the raw `.xlsx` dataset into Pandas.
- Dropped irrelevant columns (`Incomplete_Rides_Reason`, `Canceled_Rides_by...`).
- Imputed missing numerical fields (`Driver_Ratings`, `V_TAT`) with **median**.
- Imputed categorical fields (`Payment_Method`) with **mode**.
- Standardized date/time formats.
- Exported the final `cleaned_bookings.csv`.

### 🔹 Step 2: Data Modeling (SQL)
Created a SQL schema (`CREATE TABLE ride_bookings`) with appropriate data types like `NUMERIC` for currency and `DATE` for booking dates.

### 🔹 Step 3: Data Analysis (SQL)
Wrote 13 SQL queries to answer critical business questions — covering performance, customers, and revenue metrics.

### 🔹 Step 4: Data Visualization (Power BI)
Visualized the SQL insights in an interactive **Power BI dashboard** for real-time decision-making.

---

## 4️⃣ Technology Stack

| Stage | Tools / Technologies Used |
|-------|----------------------------|
| **Data Cleaning** | Python (Pandas, NumPy) |
| **Database & Analysis** | SQL (PostgreSQL / MySQL) |
| **Data Visualization** | Power BI |
| **Version Control** | Git & GitHub |

---

## 5️⃣ Dashboard & Key Insights

### 📊 Insight 1: Operational Health (Booking Status)
**17.89%** of all bookings are **“Canceled by Driver”**, representing a significant revenue leak and poor customer experience.

![Overall Dashboard](Dashboard%20Screenshorts/overall.png)

---

### 💰 Insight 2: Revenue Drivers (Vehicle Type)
**‘Prime Sedan’** is the most profitable category, generating **₹8.8M**, followed by **‘Prime SUV’** at ₹5.5M.

![Vehicle Type Dashboard](Dashboard%20Screenshorts/vehicle%20type.png)

---

### 👥 Insight 3: True Customer Value
After switching from *booking count* to **“Total Spending on Successful Rides”**, we identified our *true* high-value customers.

![Revenue Dashboard](Dashboard%20Screenshorts/revenue.png)

---

### 📍 Insight 4: Demand Hotspots
**Whitefield**, **Marathahalli**, and **Electronic City** are top pickup zones — critical for driver allocation and incentive planning.

![Ratings Dashboard](Dashboard%20Screenshorts/rateings.png)

---

## 6️⃣ SQL Analysis Highlights (13 Business Questions Answered)

1. Overall Booking Success Rate  
2. Daily Revenue Trend  
3. Top Reasons for Failed Bookings  
4. Top 10 Most Valuable Customers  
5. Average Driver Rating by Vehicle Type  
6. Top 10 Pickup Locations  
7. Top 10 Most Popular Routes  
8. Impact of Wait Time (V_TAT) on Ratings  
9. Payment Method Distribution  
10. Busiest Hours of the Day  
11. Average Ride Distance & Value by Vehicle Type  
12. Pickup Locations with High Driver Cancellations  
13. Profile of Incomplete Rides  

---

## 👤 Author

**Deewakar Kumar**
* 📧 Email: `deewakar2412@gmail.com`
* 📍 Bokaro, Jharkhand, India
* [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/deewakarkumar2412/) 
* [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Deewakar2412)

