-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store

-- 1.1 Select the names of all the products in the store.

SELECT 
  Name 
FROM 
  coderhouse_gamers.products;

-- 1.2 Select the names and the prices of all the products in the store.

SELECT
  Name AS Nombre
, Price AS Precio
FROM
  coderhouse_gamers.products;

-- 1.3 Select the name of the products with a price less than or equal to $200.

SELECT
  Name AS Nombre
, Price 
FROM
  coderhouse_gamers.products
WHERE
  products.Price <= 200;

-- 1.4 Select all the products with a price between $60 and $120.

SELECT
  *
FROM
  coderhouse_gamers.products
WHERE
  products.Price BETWEEN 60 AND 120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).

SELECT
  products.Name AS Nombre
, products.Price * 100 AS Precio
FROM
  coderhouse_gamers.products;


-- 1.6 Compute the average price of all the products.

SELECT
  AVG(products.Price) AS Promedio
FROM
  coderhouse_gamers.products;


-- 1.7 Compute the average price of all products with manufacturer code equal to 2.

SELECT
  AVG(products.Price) AS Promedio
FROM
  coderhouse_gamers.products 
WHERE
  coderhouse_gamers.products.Manufacturer = 2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.

SELECT
  COUNT(*)
FROM
  coderhouse_gamers.products
WHERE
  products.Price >= 180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order)
-- , and then by name (in ascending order).

SELECT
  products.Name AS Nombre
, products.Price AS Precio
FROM
  coderhouse_gamers.products
WHERE
  products.Price >= 180
ORDER BY
  products.Price  DESC
, products.Name ASC;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.

SELECT
  * 
FROM
  products, manufacturers
WHERE
  products.Manufacturer = manufacturers.Code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.

SELECT
  p.Name AS Nombre_Producto
, CONCAT('$ ',p.price) AS Precio
, m.Name AS Nombre_Marca
FROM
  coderhouse_gamers.products AS p
JOIN
  coderhouse_gamers.manufacturers AS m
  ON
    p.Manufacturer = m.Code;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.

SELECT
  m.Code AS Codigo_Marca
, truncate(AVG(p.Price),2) AS Precio
FROM
  coderhouse_gamers.products AS p
LEFT JOIN
  coderhouse_gamers.manufacturers AS m
  ON
    p.Manufacturer = m.Code
GROUP BY
  m.Code;
;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.

SELECT
  m.Name AS Nombre_Marca
, CONCAT('$ ',TRUNCATE(AVG(p.Price),2)) AS Precio
FROM
  coderhouse_gamers.products AS p
LEFT JOIN
  coderhouse_gamers.manufacturers AS m
  ON
    p.Manufacturer = m.Code
GROUP BY
  m.Code;
;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.

SELECT
  m.Name AS Nombre_Marca
, AVG(p.Price) AS Precio
FROM
  coderhouse_gamers.products AS p
LEFT JOIN
  coderhouse_gamers.manufacturers AS m
  ON
    p.Manufacturer = m.Code
GROUP BY
  m.Code
HAVING 
  AVG(p.Price) >= 150
;

-- 1.15 Select the name and price of the cheapest product.

SELECT
  products.Name AS Nombre
, CONCAT('$ ',products.Price) AS Precio
FROM
  coderhouse_gamers.products
ORDER BY 
  products.Price
LIMIT 1;

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.

SELECT
  m.Name AS Nombre_Marca
, AVG(p.Price) AS Precio
FROM
  coderhouse_gamers.products AS p
LEFT JOIN
  coderhouse_gamers.manufacturers AS m
  ON
    p.Manufacturer = m.Code
GROUP BY
  m.Code
HAVING 
  AVG(p.Price) >= 150
;

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.

INSERT INTO coderhouse_gamers.products (Code,Name,Price,Manufacturer)
VALUES (15,'Loudspeakers',70,2);


SELECT * 
FROM coderhouse_gamers.products;

-- 1.18 Update the name of product 8 to "Laser Printer".

UPDATE 
  coderhouse_gamers.products 
SET
  products.Name = 'Laser Printer'
WHERE
  products.Code = 8;
 
UPDATE 
  coderhouse_gamers.products 
SET
  products.Code = 11
WHERE
  products.Code = 15;
  
-- 1.19 Apply a 10% discount to all products.

SELECT
  Name AS Nombre_Producto
, concat('$ ', Price) AS Precio
, concat('$ ', Price * 0.9) AS Precio_con_Descuento
FROM
  coderhouse_gamers.products
;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.

SELECT
  Name AS Nombre_Producto
, concat('$ ', Price) AS Precio
, concat('$ ', Price * 0.9) AS Precio_con_Descuento
FROM
  coderhouse_gamers.products
WHERE
  products.Price >= 120
;