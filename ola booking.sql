DROP TABLE IF EXISTS bookings;

CREATE TABLE ride_bookings (
    "Date" DATE NOT NULL,
    "Time" TIME NOT NULL,
    "Booking_ID" VARCHAR(25) PRIMARY KEY,
    "Booking_Status" VARCHAR(50), -- e.g., 'Success', 'Canceled by Driver'
    "Customer_ID" VARCHAR(20),
    "Vehicle_Type" VARCHAR(25), -- e.g., 'Auto', 'Prime SUV'
    "Pickup_Location" VARCHAR(100),
    "Drop_Location" VARCHAR(100),
    "V_TAT" NUMERIC(10, 2), -- Vehicle Turnaround Time (assuming minutes or seconds)
    "C_TAT" NUMERIC(10, 2), -- Customer Turnaround Time (assuming minutes or seconds)
    "Incomplete_Rides" VARCHAR(3), -- Stores 'Yes' or 'No'
    "Booking_Value" NUMERIC(10, 2), -- Using NUMERIC for currency
    "Payment_Method" VARCHAR(20), -- e.g., 'UPI', 'Cash'
    "Ride_Distance" INTEGER, -- Assuming in km or meters
    "Driver_Ratings" NUMERIC(3, 1),
    "Customer_Rating" NUMERIC(3, 1)
);

--1. Overall Booking Success Rate
--Business Question: 
--What percentage of all bookings are successfully completed?

SELECT
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN "Booking_Status" = 'Success' THEN 1 ELSE 0 END) AS successful_bookings,
    (SUM(CASE WHEN "Booking_Status" = 'Success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS success_rate_percent
FROM ride_bookings;


--2. Daily Revenue Trend
--Business Question: 
--How much revenue are we making each day from successful rides?

SELECT
    "Date",
    SUM("Booking_Value") AS total_revenue
FROM ride_bookings
WHERE "Booking_Status" = 'Success'
GROUP BY "Date"
ORDER BY "Date" DESC;

--3. Top Reasons for Failed Bookings
--Business Question: 
--Why are bookings not being completed? (e.g., driver cancel, user cancel, no driver found)

SELECT
    "Booking_Status",
    COUNT(*) AS booking_count
FROM ride_bookings
WHERE "Booking_Status" != 'Success'
GROUP BY "Booking_Status"
ORDER BY booking_count DESC;

--4. Top 10 Most Valuable Customers (by Total Spend)
--Business Question: Who are our most valuable customers?

SELECT
    "Customer_ID",
    SUM("Booking_Value") AS total_spent,
    COUNT(*) AS total_rides
FROM ride_bookings
WHERE "Booking_Status" = 'Success'
GROUP BY "Customer_ID"
ORDER BY total_spent DESC
LIMIT 10;

--5. Average Driver Rating by Vehicle Type
--Business Question: 
--Which vehicle categories have the best (or worst) driver ratings?

SELECT
    "Vehicle_Type",
    AVG("Driver_Ratings") AS avg_driver_rating,
    COUNT(*) AS num_rides
FROM ride_bookings
WHERE "Booking_Status" = 'Success' AND "Driver_Ratings" > 0
GROUP BY "Vehicle_Type"
ORDER BY avg_driver_rating DESC;

--6. Top 10 Most Popular Pickup Locations
-- Business Question: Where is demand highest?

SELECT
    "Pickup_Location",
    COUNT(*) AS pickup_count
FROM ride_bookings
GROUP BY "Pickup_Location"
ORDER BY pickup_count DESC
LIMIT 10;

--7. Top 10 Most Popular Routes
--Business Question: 
--Which specific routes (A to B) are most common?

SELECT
    "Pickup_Location",
    "Drop_Location",
    COUNT(*) AS route_count
FROM ride_bookings
WHERE "Booking_Status" = 'Success'
GROUP BY "Pickup_Location", "Drop_Location"
ORDER BY route_count DESC
LIMIT 10;

--8. Impact of Vehicle Wait Time (V_TAT) on Driver Ratings
--Business Question: 
--How much does a long wait for the driver affect their rating?

SELECT
    CASE
        WHEN "V_TAT" <= 60 THEN '0-1 min'
        WHEN "V_TAT" <= 180 THEN '1-3 mins'
        WHEN "V_TAT" <= 300 THEN '3-5 mins'
        WHEN "V_TAT" <= 600 THEN '5-10 mins'
        ELSE '10+ mins'
    END AS arrival_time_bucket,
    AVG("Driver_Ratings") AS avg_driver_rating,
    COUNT(*) AS num_rides
FROM ride_bookings
WHERE "Booking_Status" = 'Success'
GROUP BY arrival_time_bucket
ORDER BY arrival_time_bucket;

--9. Payment Method Distribution
--Business Question:
--How are customers paying? (e.g., Cash vs. UPI)

SELECT
    "Payment_Method",
    COUNT(*) AS usage_count,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ride_bookings)) AS percentage_usage
FROM ride_bookings
GROUP BY "Payment_Method"
ORDER BY usage_count DESC;

--10. Busiest Hours of the Day
--Business Question: 
--When do most bookings occur?

SELECT
    EXTRACT(HOUR FROM "Time") AS hour_of_day,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN "Booking_Status" = 'Success' THEN 1 ELSE 0 END) AS successful_bookings
FROM ride_bookings
GROUP BY hour_of_day
ORDER BY hour_of_day;

--11. Average Ride Distance & Value by Vehicle Type
--Business Question: 
--Are certain vehicles used for longer or more expensive trips?

SELECT
    "Vehicle_Type",
    AVG("Ride_Distance") AS avg_distance,
    AVG("Booking_Value") AS avg_booking_value
FROM ride_bookings
WHERE "Booking_Status" = 'Success' AND "Ride_Distance" > 0
GROUP BY "Vehicle_Type"
ORDER BY avg_distance DESC;

--12. Top Pickup Locations with High Driver Cancellation
--Business Question: 
--Are drivers frequently cancelling in certain areas (which might indicate traffic, safety, or payment issues)?

SELECT
    "Pickup_Location",
    COUNT(*) AS total_bookings_from_location,
    SUM(CASE WHEN "Booking_Status" = 'Canceled by Driver' THEN 1 ELSE 0 END) AS driver_cancellations,
    (SUM(CASE WHEN "Booking_Status" = 'Canceled by Driver' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS driver_cancel_rate_pct
FROM ride_bookings
GROUP BY "Pickup_Location"
HAVING COUNT(*) > 50 -- Only show locations with a meaningful number of bookings
ORDER BY driver_cancel_rate_pct DESC
LIMIT 10;

--13. Analysis of Incomplete Rides
--Business Question: 
--What are the characteristics of rides marked as 'Incomplete'?

SELECT
    "Incomplete_Rides",
    COUNT(*) as ride_count,
    AVG("Booking_Value") as avg_value,
    AVG("Ride_Distance") as avg_distance,
    AVG("Driver_Ratings") as avg_driver_rating
FROM ride_bookings
WHERE "Incomplete_Rides" = 'Yes'
GROUP BY "Incomplete_Rides";

