--Вывести ко-во поставщиков не из UK и не из China
SELECT
    COUNT(*) AS suppliers_without_UK_and_China
FROM Suppliers
WHERE
    Country!='UK'
    AND
    Country!='China'

--Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT
COUNT(*) AS total_products,
    AVG(Price) AS avg_price,
    MAX(Price) AS max_price,
    MIN(Price) AS min_price
FROM Products
WHERE
    CategoryID IN (3, 5)

--Вывести общую сумму проданных товаров
SELECT SUM(Quantity * Price) AS TotalSales
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID

--Вывести данные о заказах (номер_заказа, имя_клиента, страна_клиента, фамилия_менеджера, название_компании_перевозчика)
SELECT OrderID,
CustomerName,
Country AS Customer_country,
LastName AS Name_employee,
ShipperName
FROM Orders
JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID

--Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT SUM(Quantity * Price) AS TotalSales
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Orders ON OrderDetails.OrderId = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
Country ='Germany'