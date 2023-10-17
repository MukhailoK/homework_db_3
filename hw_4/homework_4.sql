--Найти мин/стоимость товаров для каждой категории
SELECT
CategoryID,
MIN(Price) as min_price
FROM Products
GROUP BY CategoryID
ORDER BY min_price

--Вывести названия категорий, в которых более 10 товаров
SELECT
Categories.CategoryName,
SUM(Products.CategoryID) AS cout_prod
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
GROUP BY Categories.CategoryName
HAVING
cout_prod >= 10

--Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET
Phone = ''
WHERE Country IN('USA')
--Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT
Employees.FirstName,
Employees.LastName,
COUNT(Orders.EmployeeID) AS orders
FROM Orders
JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
GROUP BY Orders.EmployeeID
HAVING
orders < 15

