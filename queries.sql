-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT Product.ProductName, Category.CategoryName 
FROM Product
JOIN Category 
  ON Product.CategoryID = Category.ID;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT Orders.Id, Orders.OrderDate, Customer.CompanyName
FROM Orders
JOIN Customer
  ON Orders.CustomerId = Customer.Id
WHERE Orders.OrderDate < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT OrderDetail.Quantity, Product.ProductName 
FROM OrderDetail
JOIN Product
  ON OrderDetail.ProductId = Product.Id
WHERE OrderDetail.OrderId = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
// Order.OrderId as OrderID, Customer.CompanyName as Customer Company Name, Employee.EmployeeID as Employee ID

SELECT Orders.Id as "Order ID", 
       Customer.CompanyName as "Customer Company Name", 
       Employee.ID as "Employee ID"
FROM Orders
  JOIN Customer
    ON Customer.Id = Orders.CustomerId 
  JOIN Employee
    ON Employee.Id = Orders.EmployeeId;