
SELECT * FROM `online retail`.online_retails;

##############################################  What is the distribution of order values across all customers in the dataset?
SELECT CustomerID, SUM(Quantity * UnitPrice) AS OrderValue
FROM `online retail`.online_retails
GROUP BY CustomerID
ORDER BY OrderValue DESC;







############################################## Count unique products 
SELECT CustomerID, COUNT(DISTINCT StockCode) AS UniqueProducts
FROM `online retail`.online_retails
GROUP BY CustomerID;



















#############################              How many unique products has each customer purchased?
SELECT COUNT(StockCode) as StockCode, CustomerID
FROM `online retail`.online_retails 
GROUP BY CustomerID;










############################################### Which customers have only made a single purchase from the company?
SELECT CustomerID,COUNT(StockCode)
FROM  `online retail`.online_retails
GROUP BY CustomerID
HAVING COUNT(StockCode)=1;





################################    Which products are most commonly purchased together by customers in the dataset?

SELECT Description, COUNT(*) as PurchaseCount
FROM `online retail`.online_retails
GROUP BY Description
ORDER BY PurchaseCount DESC
LIMIT 4;







#################################     Advance Queries ###########################################################3


#####################       1.      Customer Segmentation by Purchase Frequency (Group customers into segments based on their purchase frequency, such as high, medium, and low frequency customers. This can help you identify your most loyal customers and those who need more attention)

SELECT CustomerID, 
       CASE 
           WHEN COUNT(DISTINCT InvoiceNo) >= 10 THEN 'High Frequency'
           WHEN COUNT(DISTINCT InvoiceNo) >= 5 THEN 'Medium Frequency'
           ELSE 'Low Frequency'
       END AS Frequencies
FROM `online retail`.online_retails
GROUP BY CustomerID;

#############################################  2. Average Order Value by Country (Calculate the average order value for each country to identify where your most valuable customers are located.)

 SELECT Country, AVG(Quantity * UnitPrice) AS AverageOrderValue
 FROM `online retail`.online_retails
 GROUP BY Country;



###########################################  3. Customer Churn Analysis (Identify customers who haven't made a purchase in a specific period (e.g., last 6 months) to assess churn.) 
SELECT CustomerID
FROM `online retail`.online_retails
WHERE InvoiceDate < DATE_SUB(NOW(), INTERVAL 6 MONTH)
GROUP BY CustomerID;





