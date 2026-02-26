-- ==========================================
-- EXPLORACIÓN INICIAL DE LA BASE DE DATOS
-- Proyecto: Análisis Integral Northwind
-- Autor: Fabian Medina
-- ==========================================


-- ==========================================
-- 1. Tamaño general del negocio
-- ==========================================

-- Total clientes
SELECT COUNT(*) AS TotalClientes
FROM Customers;

-- Total órdenes
SELECT COUNT(*) AS TotalOrdenes
FROM Orders;

-- Total líneas de detalle
SELECT COUNT(*) AS TotalOrderDetails
FROM OrderDetails;

-- Total productos
SELECT COUNT(*) AS TotalProductos
FROM Products;



-- ==========================================
-- 2. Rango temporal de las órdenes
-- ==========================================

SELECT 
    MIN(OrderDate) AS PrimeraOrden,
    MAX(OrderDate) AS UltimaOrden
FROM Orders;



-- ==========================================
-- 3. Ventas totales históricas
-- ==========================================

SELECT 
    ROUND(SUM(od.Quantity * p.Price), 2) AS VentasTotales
FROM OrderDetails od
JOIN Products p 
    ON od.ProductID = p.ProductID;

-- ==========================================
-- 4. Métricas clave del negocio
-- ==========================================

SELECT 
    ROUND(SUM(od.Quantity * p.Price), 2) AS VentasTotales,
    COUNT(DISTINCT o.OrderID) AS TotalOrdenes,
    COUNT(DISTINCT o.CustomerID) AS TotalClientes,
    ROUND(SUM(od.Quantity * p.Price) / COUNT(DISTINCT o.OrderID), 2) AS TicketPromedio,
    ROUND(SUM(od.Quantity * p.Price) / COUNT(DISTINCT o.CustomerID), 2) AS IngresoPromedioPorCliente
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Orders o ON od.OrderID = o.OrderID;