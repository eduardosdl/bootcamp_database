USE workshop;

SHOW TABLES;

DESCRIBE client;
INSERT INTO client (name_client, cpf, contact) VALUES ("eduardo", 12345678910, 12345678910),
                                                      ("joão", 01987654321, 01987654321),
                                                      ("maria", 65749832758, 32647837632),
                                                      ("caio", 74623846376, 32648264732),
                                                      ("matheus", 5473637429, 43248293743);

DESCRIBE employee;
INSERT INTO employee (name_employee, cpf, salary) VALUES ("mario", 3672489326, 5000),
														 ("igor", 6897423642, 10000),
														 ("tiago", 6365882124, 7000);

DESCRIBE departament;
INSERT INTO departament (idManeger, name_departament, describe_services) VALUES (1, "funilaria", "conserto de lataria"),
																				(2, "pintura", "procura de cor e pintura"),
                                                                                (3, "macanica", "analise de requisitos, conserto mecanico");
                                                                                
UPDATE employee SET idDepartament = 1 WHERE idEmployee = 1;
UPDATE employee SET idDepartament = 2 WHERE idEmployee = 2;
UPDATE employee SET idDepartament = 3 WHERE idEmployee = 3;

INSERT INTO employee (name_employee, cpf, salary, idDepartament) VALUES ("vinivius", 6728384839, 3000, 3),
																	   ("luan", 8539472394, 2500, 1),
                                                                       ("fabio", 78468948732, 5000, 3),
                                                                       ("jose", 4738423934, 4500, 2),
                                                                       ("artur", 2184294874, 3000, 1);
DESC service_order;
INSERT INTO service_order (idClient, service, createdAt) VALUES (2, "troca de oleo", "2022-10-04"),
                                                                (1, "pintura de carro", "2021-05-10"),
                                                                (4, "troca de parabrisa e demassar teto", "2022-04-09"),
                                                                (2, "frocar pneus", "2022-05-20");
                                                                
DESC order_analysis;
INSERT INTO order_analysis (idOrder, idDepartament, status) VALUES (1, 3, "analisando"),
																   (2, 2, "concluido"),
                                                                   (3, 1, "em andamento"),
                                                                   (3, 2, "cancelado"),
                                                                   (3, 3, "confirmado"),
                                                                   (4, 3, "concluido");