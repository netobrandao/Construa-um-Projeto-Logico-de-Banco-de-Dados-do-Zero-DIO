-- Criação das tabelas
create database oficina;
use oficina;
CREATE TABLE client (
  idClient INT PRIMARY KEY,
  name VARCHAR(100),
  address VARCHAR(200),
  phone VARCHAR(20),
  email VARCHAR(100)
);

CREATE TABLE vehicle (
  idVehicle INT PRIMARY KEY,
  brand VARCHAR(50),
  model VARCHAR(50),
  type enum("Passeio","Caminhão"),
  year INT not null,
  plate VARCHAR(10),
  idClient INT,
  FOREIGN KEY (idClient) REFERENCES client(idClient)
);

CREATE TABLE service (
  idService INT PRIMARY KEY,
  descript VARCHAR(200),
  serviceDate DATE,
  cash DECIMAL(10, 2),
  situacao VARCHAR(20),
  idVehicle INT,
  FOREIGN KEY (idVehicle) REFERENCES vehicle(idVehicle)
);

CREATE TABLE parts (
  idParts INT PRIMARY KEY,
  name VARCHAR(100),
  descript VARCHAR(200),
  quantity INT,
  idService INT,
  FOREIGN KEY (idService) REFERENCES service(idService)
);

-- Exemplos de queries

-- Recuperação simples com SELECT Statement
SELECT * FROM client;
SELECT * FROM parts

-- Filtros com WHERE Statement
SELECT * FROM vehicle WHERE brand = "Toyota";
SELECT * FROM vehicle WHERE brand = "Honda" ;

-- Criação de atributos derivados
SELECT CONCAT(name, ' - ', plate) AS client_vehicle FROM client INNER JOIN vehicle ON client.idClient = vehicle.idClient;

-- Ordenação dos dados com ORDER BY
SELECT * FROM service ORDER BY data DESC;

-- Condições de filtros aos grupos com HAVING Statement
SELECT idVehicle, COUNT(*) AS num_services FROM service GROUP BY idVehicle HAVING num_services > 3;

-- Junção entre tabelas para obter informações relacionadas
SELECT client.name, vehicle.brand, service.descript FROM client INNER JOIN vehicle ON client.idClient = vehicle.idClient INNER JOIN service ON vehicle.idVehicle = service.idVehicle;