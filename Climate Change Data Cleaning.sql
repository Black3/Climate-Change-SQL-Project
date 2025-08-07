--Create a combined table

CREATE TABLE "Climate Change"."Combine Data" AS
SELECT * FROM "Climate Change"."Australia"
UNION
SELECT * FROM "Climate Change"."Brazil"
UNION
SELECT * FROM "Climate Change"."Canada"
UNION
SELECT * FROM "Climate Change"."Germany"
UNION
SELECT * FROM "Climate Change"."India"
UNION
SELECT * FROM "Climate Change"."South Africa"
UNION
SELECT * FROM "Climate Change"."USA";


--Check for duplicates

SELECT "Record ID"
FROM "Climate Change"."Combine Data"
GROUP BY "Record ID"
HAVING COUNT(*) > 1 ;

SELECT DISTINCT "Country"
FROM "Climate Change"."Combine Data"

--Update the country
UPDATE "Climate Change"."Combine Data"
SET "Country" = 'India'
WHERE "Country" = 'Inda';

--Check for null values
SELECT *
FROM "Climate Change"."Combine Data"
WHERE "Record ID" IS NULL
OR "Country" IS NULL
OR "Date" IS NULL
OR "City" IS NULL
OR "Population Exposure" IS NULL;

--Update null value population exposure
UPDATE "Climate Change"."Combine Data"
SET "Population Exposure" = 5275135
WHERE "Record ID" = 'aus_1338'

--Update null value city
UPDATE "Climate Change"."Combine Data"
SET "City" = 'Toronto'
WHERE "Record ID" = 'cnd_227'


