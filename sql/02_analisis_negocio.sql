-- ==========================================
-- 1. Top 5 productos por ingresos
-- ==========================================

SELECT 
    p.ProductName,
    ROUND(SUM(od.Quantity * p.Price), 2) AS Revenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC
LIMIT 5;

-- ==========================================
-- 1.1 Precio y cantidad del Top 5
-- ==========================================

SELECT 
    p.ProductName,
    p.Price,
    SUM(od.Quantity) AS TotalUnitsSold,
    ROUND(SUM(od.Quantity * p.Price), 2) AS Revenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC
LIMIT 5;


-- ==========================================
-- 2. Ventas por categoría
-- ==========================================

SELECT 
    c.CategoryName,
    ROUND(SUM(od.Quantity * p.Price), 2) AS Revenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY Revenue DESC;


-- ==========================================
-- 3. Ventas por país
-- ==========================================

SELECT 
    cu.Country,
    ROUND(SUM(od.Quantity * p.Price), 2) AS Revenue
FROM Orders o
JOIN Customers cu ON o.CustomerID = cu.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY cu.Country
ORDER BY Revenue DESC;

-- ==========================================
-- 4. Desempeño por empleado
-- ==========================================

SELECT 
    e.FirstName || ' ' || e.LastName AS Employee,
    ROUND(SUM(od.Quantity * p.Price), 2) AS Revenue
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY Employee
ORDER BY Revenue DESC;

-- ==========================================
-- 5. Tendencia mensual de ventas
-- ==========================================

SELECT 
    strftime('%Y-%m', o.OrderDate) AS YearMonth,
    ROUND(SUM(od.Quantity * p.Price), 2) AS Revenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY YearMonth
ORDER BY YearMonth;