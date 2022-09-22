SHOW DATABASES;

CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE clients (
	idClient INT AUTO_INCREMENT NOT NULL,
	fname VARCHAR(10),
	minit CHAR(3),
	lname VARCHAR(20),
	cpf CHAR(11) NOT NULL,
	addrress VARCHAR(255),
    PRIMARY KEY (idClient),
	CONSTRAINT unique_cpf_client UNIQUE (cpf)
);

ALTER TABLE clients AUTO_INCREMENT=1;

CREATE TABLE products (
	idProduct INT AUTO_INCREMENT NOT NULL,
	pname VARCHAR(50),
	classification_kids BOOLEAN,
	category VARCHAR(20),
	avaliacao FLOAT DEFAULT 0,
	size VARCHAR(10),
    PRIMARY KEY (idProduct)
);

ALTER TABLE products AUTO_INCREMENT=1;

CREATE TABLE payments (
	idPayment INT NOT NULL AUTO_INCREMENT,
	idClient INT,
	typePayment ENUM('cartao', 'dois cartoes') DEFAULT 'cartao',
	limitAvaliable FLOAT,
	PRIMARY KEY (idPayment, idClient),
	CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES clients(idClient)
);

ALTER TABLE payments AUTO_INCREMENT=1;

CREATE TABLE orders (
	idOrder INT AUTO_INCREMENT NOT NULL,
	idOrderClient INT,
	orderStatus ENUM('cancelado', 'confirmado','em processamento') NOT NULL,
	orderDescription VARCHAR(255),
	sendValue FLOAT,
	paymentCash BOOLEAN DEFAULT FALSE,
    idOrderPayment INT,
    PRIMARY KEY (idOrder),
	CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient),
    CONSTRAINT fk_order_payment FOREIGN KEY (idorderPayment) REFERENCES payments(idPayment)
);

ALTER TABLE orders AUTO_INCREMENT=1;
	
CREATE TABLE productStorege (
	idProductStorege INT AUTO_INCREMENT NOT NULL,
	storegeLcation varchar(255),
	quantity INT DEFAULT 0,
    PRIMARY KEY (idProductStorege)
);

ALTER TABLE productStorege AUTO_INCREMENT=1;

CREATE TABLE supplier (
	idSupplier INT AUTO_INCREMENT NOT NULL,
	socialName VARCHAR(255) NOT NULL,
	cnpj CHAR(14) NOT NULL,
	contact CHAR(11) NOT NULL,
    PRIMARY KEY (idSupplier),
	CONSTRAINT unique_supplier UNIQUE (cnpj)
);

ALTER TABLE supplier AUTO_INCREMENT=1;

CREATE TABLE seller (
	idSeller INT AUTO_INCREMENT NOT NULL,
	socailName VARCHAR(255) NOT NULL,
	abstName VARCHAR(255),
	cnpj CHAR(14),
	cpf CHAR(11),
	location VARCHAR(255),
	contact CHAR(11) NOT NULL,
    PRIMARY KEY (idSeller),
	CONSTRAINT unique_cnpj_seller UNIQUE (cnpj),
	CONSTRAINT unique_cpf_seller UNIQUE (cpf)
);

ALTER TABLE seller AUTO_INCREMENT=1;

CREATE TABLE productSeller (
	idProductSeller INT,
	idProduct INT,
	productQuantity INT DEFAULT 1,
	PRIMARY KEY (idProductSeller, idProduct),
	CONSTRAINT fk_product_seller FOREIGN KEY (idProductSeller) REFERENCES seller(idSeller),
	CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES products(idProduct)
 );
 
CREATE TABLE productOrder (
	idOrderProduct INT,
	idOrder INT,
	productQuantity INT DEFAULT 1,
	prodcutStatus ENUM('disponivel', 'sem estoque') DEFAULT 'disponivel',
	PRIMARY KEY (idOrderProduct, idOrder),
	CONSTRAINT fk_order_product FOREIGN KEY (idOrderProduct) REFERENCES products(idProduct),
	CONSTRAINT fk_product_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder)
);

CREATE TABLE storegeLocation (
	idLocalProduct INT,
	idLocalStorege INT,
	location VARCHAR(255) NOT NULL,
	PRIMARY KEY (idLocalProduct, idLocalStorege),
	CONSTRAINT fk_storege_location_product FOREIGN KEY (idLocalProduct) REFERENCES products(idProduct),
	CONSTRAINT fk_storege_location_storage FOREIGN KEY (idLocalStorege) REFERENCES productStorege(idProductStorege)
);

CREATE TABLE productSupllier (
	idPsSupllier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupllier,idPsProduct),
    CONSTRAINT fk_product_supplier FOREIGN KEY (idPsSupllier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES products(idProduct)
);