--Вывести название и стоимость товаров от 20 EUR.
SELECT ProductName,
Price
FROM Products
Where
Price >=20

--Вывести страны поставщиков.
SELECT Country FROM Suppliers

--В упорядоченном по стоимости виде вывести название и стоимость товаров от всех поставщиков, кроме поставщика 1.
SELECT ProductName,
Price
FROM Products
WHERE
NOT SupplierID IN(1)
ORDER BY Price

--Вывести контактные имена клиентов, кроме тех, что из France и USA.
SELECT ContactName
FROM Customers
WHERE
NOT Country IN('France', 'USA')