-- Create Brands Table
CREATE TABLE brands (
    brandid INT PRIMARY KEY,
    brandname VARCHAR(255)
);

-- Create Models Table
CREATE TABLE models (
    modelid INT PRIMARY KEY,
    modelname VARCHAR(255)
);

-- Create Options Table
CREATE TABLE options (
    optionid INT PRIMARY KEY,
    color VARCHAR(255),
    engine VARCHAR(255),
    transmission VARCHAR(255)
);
ALTER TABLE options
ADD COLUMN supplierid INT,
ADD CONSTRAINT fk_supplier_options
    FOREIGN KEY (supplierid)
    REFERENCES supplier(supplierid);

UPDATE options
SET supplierid = CASE 
    WHEN optionid = 1 THEN 1
    WHEN optionid = 2 THEN 2
    WHEN optionid = 3 THEN 3
    WHEN optionid = 4 THEN 4
    WHEN optionid = 5 THEN 5
    WHEN optionid = 6 THEN 1
    WHEN optionid = 7 THEN 2
    WHEN optionid = 8 THEN 3
    WHEN optionid = 9 THEN 4
    WHEN optionid = 10 THEN 5
    ELSE NULL
END;

-- Create Supplier Table
CREATE TABLE supplier (
    supplierid INT PRIMARY KEY,
    sname VARCHAR(255)
);

-- Create Vehicle Table
CREATE TABLE vehicle (
    VIN VARCHAR(17) PRIMARY KEY,
    modelID INT,
    brandid INT,
    optionid INT,
    Price DECIMAL(10, 2),
    SupplierID INT,
    FOREIGN KEY (modelID) REFERENCES models(modelid),
    FOREIGN KEY (brandid) REFERENCES brands(brandid),
    FOREIGN KEY (optionid) REFERENCES options(optionid),
    FOREIGN KEY (SupplierID) REFERENCES supplier(supplierid)
);

-- Create Customer Table
CREATE TABLE customer (
    customerid INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(15),
    gender CHAR(1),
    annual_income DECIMAL(15, 2)
);

-- Create Sales Table
CREATE TABLE sales (
    salesid INT PRIMARY KEY,
    VIN VARCHAR(17),
    dispatch_date DATE,
    arrival_date DATE,
    dealerid INT,
    customerid INT,
    FOREIGN KEY (VIN) REFERENCES vehicle(VIN),
    FOREIGN KEY (dealerid) REFERENCES dealers(dealid),
    FOREIGN KEY (customerid) REFERENCES customer(customerid)
);

-- Create Dealers Table
CREATE TABLE dealers (
    dealid INT PRIMARY KEY,
    dealername VARCHAR(255)
);
-- Insert data into Brands Table
INSERT INTO brands (brandid, brandname)
VALUES
(1, 'Ferrari'),
(2, 'Bugatti'),
(3, 'Lamborghini'),
(4, 'Porsche'),
(5, 'McLaren'),
(6, 'Ford'),
(7, 'Mercedes'),
(8, 'Audi'),
(9, 'BMW'),
(10, 'Tesla');
-- Insert data into Models Table
INSERT INTO models (modelid, modelname)
VALUES
(1, 'Huracan'),
(2, 'Veneno'),
(3, 'M8'),
(4, 'Tesla Model X'),
(5, 'Fiesta'),
(6, 'F1 GTR'),
(7, 'Audi S5'),
(8, 'Ferrari F8'),
(9, 'Taycan'),
(10, 'Chiron');
-- Insert data into Supplier Table
INSERT INTO supplier (supplierid, sname)
VALUES
(1, 'Getrag'),
(2, 'Jack'),
(3, 'Philip'),
(4, 'Mary'),
(5, 'John');
-- Insert data into Options Table
INSERT INTO options (optionid, color, engine, transmission)
VALUES
(1, 'Red', 'V6', 'Automatic'),
(2, 'Blue', 'V8', 'Manual'),
(3, 'Green', 'Inline-4', 'Automatic'),
(4, 'Black', 'V6', 'Manual'),
(5, 'Silver', 'V8', 'Automatic'),
(6, 'White', 'V6', 'Manual'),
(7, 'Yellow', 'Inline-4', 'Automatic'),
(8, 'Orange', 'V8', 'Manual'),
(9, 'Purple', 'Inline-4', 'Automatic'),
(10, 'Gray', 'V6', 'Automatic');
-- Insert data into Dealers Table
INSERT INTO dealers (dealid, dealername)
VALUES
(1, 'Mark'),
(2, 'Mathew'),
(3, 'Jane'),
(4, 'Robert'),
(5, 'Paul');
-- Insert data into Vehicle Table
INSERT INTO vehicle (VIN, modelID, brandid, optionid, Price, SupplierID)
VALUES
('VIN1', 1, 1, 1, 25000.00, 1),
('VIN2', 2, 2, 2, 28000.00, 2),
('VIN3', 3, 1, 3, 30000.00, 1),
('VIN4', 4, 3, 4, 27000.00, 3),
('VIN5', 5, 2, 5, 32000.00, 2),
('VIN6', 6, 1, 6, 26000.00, 1),
('VIN7', 7, 3, 7, 31000.00, 3),
('VIN8', 8, 2, 8, 29000.00, 2),
('VIN9', 9, 1, 9, 27000.00, 1),
('VIN10', 10, 3, 10, 33000.00, 3);

-- Insert data into Sales Table
INSERT INTO sales (salesid, VIN, dispatch_date, arrival_date, dealerid, customerid)
VALUES
(1, 'VIN1', '2022-05-15', '2022-05-20', 1, 1),
(2, 'VIN2', '2022-06-10', '2022-06-15', 2, 2),
(3, 'VIN3', '2022-07-18', '2022-07-23', 1, 3),
(4, 'VIN4', '2022-08-21', '2022-08-26', 3, 4),
(5, 'VIN5', '2022-09-05', '2022-09-10', 2, 5),
(6, 'VIN6', '2023-01-12', '2023-01-17', 1, 6),
(7, 'VIN7', '2023-02-19', '2023-02-24', 3, 7),
(8, 'VIN8', '2023-03-08', '2023-03-13', 2, 8),
(9, 'VIN9', '2023-04-14', '2023-04-19', 1, 9),
(10, 'VIN10', '2023-05-22', '2023-05-27', 3, 10);


-- Insert data into Customer Table with American city names
INSERT INTO customer (customerid, name, address, phone, gender, annual_income)
VALUES
(1, 'Alice Johnson', '123 Main St, New York City, NY', '+1 456-7890', 'F', 60000.00),
(2, 'Bob Smith', '456 Elm St, Los Angeles, CA', '+1 567-8901', 'M', 75000.00),
(3, 'Eva Davis', '789 Oak St, Chicago, IL', '+1 678-9012', 'F', 90000.00),
(4, 'David Brown', '101 Pine St, Houston, TX', '+1 789-0123', 'M', 80000.00),
(5, 'Linda Wilson', '202 Cedar St, Philadelphia, PA', '+1 890-1234', 'F', 70000.00),
(6, 'Michael Lee', '303 Maple St, Phoenix, AZ', '+1 901-2345', 'M', 85000.00),
(7, 'Sophia Anderson', '404 Birch St, San Antonio, TX', '+1 012-3456', 'F', 95000.00),
(8, 'Christopher Clark', '505 Spruce St, San Diego, CA', '+1 123-4567', 'M', 72000.00),
(9, 'Olivia Turner', '606 Ash St, Dallas, TX', '+1 234-5678', 'F', 88000.00),
(10, 'James Baker', '707 Fir St, San Jose, CA', '+1 345-6789', 'M', 78000.00);

-- Query 1
SELECT 
    YEAR(s.dispatch_date) AS sales_year,
    MONTH(s.dispatch_date) AS sales_month,
    WEEK(s.dispatch_date) AS sales_week,
    b.brandname,
    c.gender,
    CASE 
        WHEN c.annual_income BETWEEN 0 AND 50000 THEN '0-50k'
        WHEN c.annual_income BETWEEN 50001 AND 100000 THEN '50k-100k'
        ELSE '100k+'
    END AS income_range,
    COUNT(*) AS total_sales
FROM 
    sales s
JOIN 
    vehicle v ON s.VIN = v.VIN
JOIN 
    brands b ON v.brandid = b.brandid
JOIN 
    customer c ON s.customerid = c.customerid
WHERE 
    s.dispatch_date BETWEEN '2022-01-01' AND '2023-12-30'
GROUP BY 
    sales_year, sales_month, sales_week, b.brandname, c.gender, income_range
ORDER BY 
    sales_year, sales_month, sales_week, b.brandname, c.gender, income_range;


-- QUERY 2
SELECT s.VIN, c.name AS customer_name
FROM sales s
JOIN vehicle v ON s.VIN = v.VIN
JOIN options o ON v.optionid = o.optionid
JOIN supplier sp ON o.supplierid = sp.supplierid
JOIN customer c ON s.customerid = c.customerid
WHERE sp.sname = 'Getrag'
AND s.dispatch_date BETWEEN '2022-05-15' AND '2023-05-27';

-- QUERY 3
SELECT 
    b.brandname,
    SUM(v.Price) AS total_sales_amount
FROM 
    sales s
JOIN 
    vehicle v ON s.VIN = v.VIN
JOIN 
    brands b ON v.brandid = b.brandid
WHERE 
    YEAR(s.dispatch_date) = YEAR(CURRENT_DATE()) - 1
GROUP BY 
    b.brandname
ORDER BY 
    total_sales_amount DESC
LIMIT 2;


-- QUERY 4
SELECT 
    b.brandname,
    COUNT(*) AS total_unit_sales
FROM 
    sales s
JOIN 
    vehicle v ON s.VIN = v.VIN
JOIN 
    brands b ON v.brandid = b.brandid
WHERE 
    YEAR(s.dispatch_date) = YEAR(CURRENT_DATE()) - 1
GROUP BY 
    b.brandname
ORDER BY 
    total_unit_sales DESC
LIMIT 2;

-- QUERY 5
SELECT 
    EXTRACT(MONTH FROM s.dispatch_date) AS sales_month,
    COUNT(*) AS total_convertible_sales
FROM 
    sales s
JOIN 
    vehicle v ON s.VIN = v.VIN
JOIN 
    models m ON v.modelID = m.modelid
JOIN 
    options o ON v.optionid = o.optionid
WHERE 
    m.modelname = 'M8'
GROUP BY 
    sales_month
ORDER BY 
    total_convertible_sales DESC
LIMIT 1;
 -- QUERY 6
 SELECT 
    d.dealername,
    AVG(DATEDIFF(s.arrival_date, s.dispatch_date)) AS average_inventory_time
FROM 
    sales s
JOIN 
    dealers d ON s.dealerid = d.dealid
GROUP BY 
    d.dealername
ORDER BY 
    average_inventory_time DESC
LIMIT 1;



