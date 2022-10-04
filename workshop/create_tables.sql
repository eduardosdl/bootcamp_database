SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS workshop;

USE workshop;

CREATE TABLE IF NOT EXISTS client (
  idClient INT NOT NULL AUTO_INCREMENT,
  name_client VARCHAR(45) NOT NULL,
  cpf CHAR(11) NOT NULL,
  contact CHAR(11),
  PRIMARY KEY (idClient),
  CONSTRAINT unique_client_cpf UNIQUE (cpf)
);

CREATE TABLE IF NOT EXISTS service_order (
  idOrder INT NOT NULL AUTO_INCREMENT,
  idClient INT,
  service VARCHAR(45),
  createdAt DATE,
  PRIMARY KEY (idOrder),
  CONSTRAINT fk_order_client FOREIGN KEY (idClient) REFERENCES client (idClient)
);

CREATE TABLE IF NOT EXISTS departament (
  idDepartament INT NOT NULL AUTO_INCREMENT,
  idManeger INT,
  name_departament VARCHAR(45),
  describe_services VARCHAR(45),
  PRIMARY KEY (idDepartament),
  CONSTRAINT unique_name_departament UNIQUE (name_departament)
);

CREATE TABLE IF NOT EXISTS employee (
  idEmployee INT NOT NULL AUTO_INCREMENT,
  name_employee VARCHAR(45),
  cpf CHAR(11),
  salary FLOAT,
  idDepartament INT,
  PRIMARY KEY (idEmployee),
  CONSTRAINT fk_employee_departament FOREIGN KEY (idDepartament) REFERENCES departament (idDepartament)
);

CREATE TABLE IF NOT EXISTS order_analysis (
  idOrder_analysis INT NOT NULL AUTO_INCREMENT,
  idOrder INT NULL,
  idDepartament INT NULL,
  status ENUM('analisando', 'cancelado', 'confirmado', 'em andamento', 'concluido') NOT NULL,
  PRIMARY KEY (idorder_analysis),
  CONSTRAINT fk_orderAnalysis_order FOREIGN KEY (idOrder) REFERENCES service_order (idOrder),
  CONSTRAINT fk_orderAnalysis_departament FOREIGN KEY (idDepartament) REFERENCES departament (idDepartament)
);