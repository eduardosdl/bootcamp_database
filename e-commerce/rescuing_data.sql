SHOW DATABASES;

USE ecommerce;

SHOW TABLES;

SELECT * FROM clients;

SELECT * FROM products;

SELECT * FROM payments;

SELECT * FROM orders;

SELECT * FROM productStorege;

SELECT * FROM supplier;

SELECT * FROM seller;

SELECT * FROM productSeller;

SELECT * FROM productOrder;

SELECT * FROM storegeLocation;

SELECT * FROM productSupllier;

-- order status with client name
SELECT c.idClient, CONCAT(c.fname, ' ', c.lname) AS name, o.orderStatus AS status_do_pedido FROM clients AS c INNER JOIN orders AS o ON c.idClient = o.idOrderClient;

-- clients registered cardholders with a limit above 350
SELECT c.idClient, CONCAT(c.fname, ' ', c.lname) AS name, p.typePayment AS tipo_de_pagamento, p.limitAvaliable AS limite FROM clients c INNER JOIN payments p ON c.idClient = p.idClient WHERE p.limitAvaliable > 350;

-- list of produtos pby seller
SELECT p.idProduct, p.pname, p.category, s.socailName AS seller_name, s.location FROM products p INNER JOIN productSeller ps ON p.idProduct = ps.idProduct INNER JOIN seller s ON ps.idProductSeller = s.idSeller ORDER BY (s.socailName);

-- list of products by supplier
SELECT p.idProduct, p.pname, s.socialName AS supplier_name FROM products p INNER JOIN productSupllier ps ON p.idProduct = ps.idPsProduct INNER JOIN supplier s ON ps.idPsSupllier = s.idSupplier ORDER BY (p.idProduct);