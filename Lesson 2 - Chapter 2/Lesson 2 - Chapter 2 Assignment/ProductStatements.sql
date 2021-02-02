SELECT ProductName, ListPrice, DateAdded
FROM Products
ORDER BY ProductName;

SELECT COUNT(*) AS NumberOfProducts,
       MAX(ListPrice) AS MostExpensiveProduct,
       MIN(DateAdded) AS OldestProduct
FROM Products;