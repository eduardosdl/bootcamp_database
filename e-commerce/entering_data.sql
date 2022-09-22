USE ecommerce;

SHOW TABLES;

-- first name, initial mid name, last name, cpf, addreess
INSERT INTO clients (fname, minit, lname, cpf, addrress) VALUES 
	('Maria', 'M', 'Silva', '1234567891', 'rua silva de prata 29, Carangola, Cidade das Flores'),
    ('Matheus', 'o', 'Pimentel', '9876543219', 'rua alameda 289, Centro, Cidade das Flores'),
    ('Ricardo', 'F', 'Silva', '4561237896', 'avenida alameda vinha 1009, Centro, Cidade das Flores'),
    ('Julia', 'S', 'França', '7894561237', 'rua laranjeiras 861, Centro, Cidade das Flores'),
    ('Roberta', 'G', 'Assis', '6549873216', 'avenida koller 19, Carangola, Cidade das Flores'),
    ('Isabela', 'M', 'Cruz', '12345678974', 'rua alameda das flores 28, Carangola, Cidade das Flores');

-- product name, kids classication, category, avaliation, size
INSERT INTO products (pname, classification_kids, category, avaliacao, size) VALUES
	('fone de ouvido', false, 'eletronico', '4', null),
    ('barbie elsa', true, 'brinquedos', '3', null),
    ('baby carters', true, 'vestimentas', '5', null),
    ('microfone vedo - youtuber', false, 'eletronico', '4', null),
    ('sofá retrátil', false, 'moveis', '3', '3x57x80'),
    ('farinha de arroz', false, 'alimentos', '2', null),
    ('fire stick amazon', false, 'eletronico', '3', null);

-- client id, type of pagament, available limit
INSERT INTO payments (idClient, typePayment, limitAvaliable) VALUES 
	(2, 'cartao', 150),
    (4, 'cartao', 400),
    (5, 'cartao', 320),
    (6, 'dois cartoes', 1000),
    (6, 'cartao', 1500);
    
-- client id, order status, order description, send value, cash payment, payment id
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash, idOrderPayment) VALUES
	(1, 'em processamento', 'compra via aplicativo', null, 1, null),
    (2, 'em processamento', 'compra via aplicativo', 50, 0, 1),
    (3, 'confirmado', null, null, 1, null),
    (4, 'em processamento', 'compra via web', 150, 0, 2),
    (6, 'confirmado', 'compra via aplicativo', 500, 0, 4);

-- storege location, quantity
INSERT INTO productStorege (storegeLcation, quantity) VALUES
	('rio de janeiro', 1000),
    ('rio de janeiro', 500),
    ('sao paulo', 10),
    ('sao paulo', 100),
    ('sao paulo', 20),
    ('brasilia', 60);

-- social name, cnpj, contact
INSERT INTO supplier (socialName, cnpj, contact) VALUES
	('almeida e filhos', '123456789234', '12345698753'),
    ('eletronicos silva', '7532159462864', '85213764952'),
    ('eletronicos valma', '15975348253684', '12345678952');
    
-- social name, abstract name, cnpj, cpf, location, location
INSERT INTO seller (socailName, abstName, cnpj, cpf, location, contact) VALUE
	('tech eletronics', null, 12345689456231, null, 'rio de janeiro', 12367984325),
    ('botique durgas', null, null, 12366875645, 'ri de janeiro', 98564379518),
    ('kids world', null, 25795462589663, null,'sao paulo', 11256479893);
    
-- seller id, product id, product quantity
INSERT INTO productSeller (idProductSeller, idProduct, productQuantity) VALUES
	(3, 1, 10),
    (1, 2, 100),
    (3, 3, 74),
	(2, 4, 80),
    (2, 5, 90),
    (1, 6, 10),
    (2, 7, 5);

-- product id, order id, product quantity
INSERT INTO productOrder (idOrderProduct, idOrder, productQuantity) VALUES
	(7, 1, 2),
    (5, 2, 1),
    (3, 3, 1),
    (1, 4, 2),
    (1, 5, 1),
    (7, 5, 3);

-- product id, storege id, location
INSERT INTO storegeLocation (idLocalProduct, idLocalStorege, location) VALUES
	(1, 2, 'RJ'),
    (2, 1, 'RJ'),
    (3, 5, 'SP'),
    (4, 5, 'SP'),
    (5, 3, 'SP'),
    (6, 2, 'RJ'),
    (7, 6,'GO');

-- supllier id, product id, quantity
INSERT INTO productSupllier (idPsSupllier, idPsProduct, quantity) VALUES
	(3, 2, 500),
    (2, 6, 400),
    (2, 4, 633),
    (2, 2, 5),
    (3, 7, 26),
    (1, 5, 30),
    (1, 3, 70),
    (3, 1, 10);