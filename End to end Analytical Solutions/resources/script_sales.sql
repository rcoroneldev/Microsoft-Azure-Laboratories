-- Create database

create database retail_db;
use retail_db;

-- Crear tabla de ventas
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    SaleDate DATETIME NOT NULL,
    CustomerName NVARCHAR(100) NOT NULL,
    ProductName NVARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18, 2) NOT NULL,
    TotalAmount AS (Quantity * UnitPrice)  -- Columna calculada
);

-- Poblar la tabla con datos de ejemplo
INSERT INTO Sales (SaleDate, CustomerName, ProductName, Quantity, UnitPrice)
VALUES 
    ('2024-09-01', 'John Doe', 'Laptop', 2, 1200.00),
    ('2024-09-02', 'Jane Smith', 'Smartphone', 5, 800.00),
    ('2024-09-03', 'Michael Johnson', 'Tablet', 3, 500.00),
    ('2024-09-04', 'Emily Davis', 'Headphones', 10, 150.00),
    ('2024-09-05', 'David Wilson', 'Monitor', 1, 300.00);

