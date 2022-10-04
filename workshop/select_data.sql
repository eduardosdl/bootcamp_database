USE workshop;

SHOW TABLES;

SELECT * FROM clients;

SELECT * FROM employee;

SELECT * FROM departament;

SELECT * FROM service_order;

SELECT * FROM order_analysis;

-- get all services for clients
SELECT name_client, service FROM client AS c INNER JOIN service_order AS so ON c.idclient = so.idClient;

-- get all services, creation date, status and dapartament name, order by creation date
SELECT service, createdAt, status, name_departament FROM service_order so INNER JOIN order_analysis oa ON so.idOrder = oa.idOrder INNER JOIN departament d ON oa.idDepartament = d.idDepartament ORDER BY createdAt;