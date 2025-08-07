--Monthly temperature trends

 SELECT TO_CHAR("Date",'Month') as Month_Name,
        AVG("Temperature") AS Avg_Temperature
FROM "Climate Change"."Combine Data"
GROUP BY TO_CHAR("Date",'Month'), EXTRACT (Month FROM "Date")
ORDER BY EXTRACT (Month from "Date");

--Avg temperature by country
SELECT "Country",
      AVG ("Temperature") AS Avg_Temperature
FROM "Climate Change"."Combine Data"
GROUP BY "Country"
ORDER BY Avg_Temperature desc;

--Extreme weather event

SELECT TO_CHAR ("Date",'Month') as Month_Name,
       COUNT (*) AS Event_Count
FROM "Climate Change"."Combine Data"
WHERE "Extreme Weather Events" <> 'None'
GROUP BY TO_CHAR("Date",'Month')
ORDER BY Min("Date");

--Country_wise extreme weather events
SELECT "Country",
        COUNT(*) AS Event_Count
FROM "Climate Change"."Combine Data"
WHERE "Extreme Weather Events" <> 'None'
GROUP BY "Country"
ORDER BY Event_Count desc;

--Relationship between temperature & extreme weather events

SELECT
    Temperature_Range,
    "Extreme Weather Events",
    COUNT(*) AS Event_Count
FROM (
    SELECT
        CASE
            WHEN "Temperature" < -10 THEN 'Freezing (< -10°C)'
            WHEN "Temperature" BETWEEN -10 AND 0 THEN 'Very Cold (-10 to 0°C)'
            WHEN "Temperature" BETWEEN 1 AND 10 THEN 'Cold (1 to 10°C)'
            WHEN "Temperature" BETWEEN 11 AND 20 THEN 'Mild (11 to 20°C)'
            WHEN "Temperature" BETWEEN 21 AND 30 THEN 'Warm (21 to 30°C)'
            WHEN "Temperature" BETWEEN 31 AND 40 THEN 'Hot (31 to 40°C)'
            WHEN "Temperature" BETWEEN 41 AND 50 THEN 'Very Hot (41 to 50°C)'
            ELSE 'Out of Range'
        END AS Temperature_Range,
        "Extreme Weather Events"
    FROM "Climate Change"."Combine Data"
    WHERE "Extreme Weather Events" <> 'None'
) AS Sub
GROUP BY Temperature_Range, "Extreme Weather Events"
ORDER BY Temperature_Range, Event_Count DESC;

--Which cities are experiencing extreme waether events this week and whatare their economic and population impact?
SELECT "Country","City","Extreme Weather Events",
        COUNT (*) AS "Eventy Type",
		ROUND (avg("Temperature"),1) as "Average Temperature",
		sum("Population Exposure") as "Total Population Exposure",
		sum ("Economic Impact Estimate") as "Total Economic Impact",
		round (avg("Infrastructure Vulnerability Score"),0) as "Average Vulnerability"
FROM "Climate Change"."Combine Data"
WHERE "Date" between '2025-08-07' and '2025-08-15'
AND "Extreme Weather Events" != 'None'
GROUP BY "Country","City","Extreme Weather Events"
ORDER BY "Total Economic Impact" desc ;

--What are the top 5 cities with the highest air qquality concerns and their associate risks
SELECT 
    "Country",
    "City",
    ROUND(AVG("Air Quality Index (AQI)"), 0) AS "Average AQI",
    COUNT(CASE WHEN "Air Quality Index (AQI)" > 200 THEN 1 END) AS "Days above 200 AQI",
    SUM("Population Exposure") AS "Total Population Exposure",
    ROUND(AVG("Temperature"), 1) AS "Average Temperature"
FROM "Climate Change"."Combine Data"
WHERE "Date" BETWEEN '2025-08-07' AND '2025-08-14'
GROUP BY "Country", "City"
HAVING AVG("Air Quality Index (AQI)") > 100
ORDER BY "Average AQI" DESC
LIMIT 5;