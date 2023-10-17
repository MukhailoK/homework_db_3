--Вывести название и стоимость в USD одного самого дорогого проданного товара (не используя агрегацию)
SELECT ProductName,
Price * 1.4 AS Price_USD
FROM Products
ORDER BY Price DESC
LIMIT 1

--Вывести два самых дорогих товара из категории Beverages из USA
SELECT ProductName,
Price
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE
CategoryName = 'Beverages'
AND
Country = 'USA'
ORDER BY Price DESC
LIMIT 2

--Удалить товары с ценой менее 50 EUR
DELETE FROM Products
WHERE
    Price <=50

--Вывести список стран, которые поставляют морепродукты
SELECT Country FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE CategoryName = 'Seafood'

--Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET
    ContactName=''
WHERE
   NOT Country IN('China')

SELECT
	Products.ProductName,
	COUNT(Orders.OrderID) AS count_orders
FROM Orders
JOIN Products ON Orders.ProductID = Products.ProductID
GROUP BY Products.ProductID
ORDER BY count_orders DESC
LIMIT 3