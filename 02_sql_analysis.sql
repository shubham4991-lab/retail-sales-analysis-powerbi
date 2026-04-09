SELECT
    SUM(TotalPrice) As NetRevenue
FROM
    peppy-myth-476612-a6.retail_analysis.retail_data

SELECT
    SUM(TotalPrice) As NetRevenue
FROM
    peppy-myth-476612-a6.retail_analysis.retail_data
WHERE Quantity>0

SELECT
    SUM(TotalPrice) As NetRevenue
FROM
    peppy-myth-476612-a6.retail_analysis.retail_data
WHERE Quantity<0

SELECT 
    FORMAT_TIMESTAMP('%Y-%m',InvoiceDate) AS Month,SUM(TotalPrice) AS NetRevenue
FROM peppy-myth-476612-a6.retail_analysis.retail_data
GROUP BY Month
ORDER BY Month

SELECT
    Country,SUM(TotalPrice) AS Revenue
FROM peppy-myth-476612-a6.retail_analysis.retail_data
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 10

SELECT
    Country,SUM(TotalPrice) AS ReturnRevenue
FROM peppy-myth-476612-a6.retail_analysis.retail_data
WHERE Quantity<0
GROUP BY Country
ORDER BY ReturnRevenue ASC

SELECT
      Country,
      SUM(CASE WHEN Quantity>0 THEN
      TotalPrice ELSE 0 END) AS Sales,
      SUM(CASE WHEN Quantity<0 THEN
      TotalPrice ELSE 0 END) AS Returns,
      SAFE_DIVIDE(ABS(SUM(CASE WHEN Quantity<0 THEN
      TotalPrice ELSE 0 END)),SUM(CASE WHEN Quantity>0 THEN
      TotalPrice ELSE 0 END)) AS ReturnRate
FROM peppy-myth-476612-a6.retail_analysis.retail_data
GROUP BY Country
ORDER BY ReturnRate DESC

SELECT
    CustomerID,SUM(TotalPrice) AS Revenue
FROM peppy-myth-476612-a6.retail_analysis.retail_data
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10

SELECT
      CustomerID,
      SUM(CASE WHEN Quantity>0 THEN
      TotalPrice ELSE 0 END) AS Sales,
      SUM(CASE WHEN Quantity<0 THEN
      TotalPrice ELSE 0 END) AS Returns,
      SUM(TotalPrice) AS NetRevenue
FROM peppy-myth-476612-a6.retail_analysis.retail_data
GROUP BY CustomerID
ORDER BY NetRevenue DESC
LIMIT 10;

SELECT
    Description,
    SUM(Quantity) AS TotalQuantity,
    SUM(TotalPrice) AS Revenue
FROM peppy-myth-476612-a6.retail_analysis.retail_data
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;

