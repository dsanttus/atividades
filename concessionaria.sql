-- criar banco de dados
CREATE DATABASE Concessionaria;

-- criar tabelas no banco de dados
USE Concessionaria;

CREATE TABLE Fabricante (
    FabricanteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Pais VARCHAR(100)
);

CREATE TABLE Carro (
    CarroID INT PRIMARY KEY AUTO_INCREMENT,
    FabricanteID INT,
    Modelo VARCHAR(100) NOT NULL,
    Ano INT,
    Preco DECIMAL(10, 2),
    FOREIGN KEY (FabricanteID) REFERENCES Fabricante(FabricanteID)
);

CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Telefone VARCHAR(15)
);

CREATE TABLE Venda (
    VendaID INT PRIMARY KEY AUTO_INCREMENT,
    CarroID INT,
    ClienteID INT,
    DataVenda DATE,
    PrecoVenda DECIMAL(10, 2),
    FOREIGN KEY (CarroID) REFERENCES Carro(CarroID),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

-- inserir dados nas tabelas
INSERT INTO Fabricante (Nome, Pais) VALUES 
('Toyota', 'Japão'),
('Ford', 'EUA'),
('Volkswagen', 'Alemanha'),
('Chevrolet', 'EUA');

INSERT INTO Carro (FabricanteID, Modelo, Ano, Preco) VALUES 
(1, 'Corolla', 2020, 20000),
(2, 'Mustang', 2021, 30000),
(3, 'Golf', 2019, 25000),
(4, 'Camaro', 2022, 40000),
(NULL, 'Modelo X', 2023, 50000);

INSERT INTO Cliente (Nome, Email, Telefone) VALUES 
('João Silva', 'joao@example.com', '123-456-7890'),
('Maria Oliveira', 'maria@example.com', '098-765-4321'),
('Carlos Santos', 'carlos@example.com', '111-222-3333');

INSERT INTO Venda (CarroID, ClienteID, DataVenda, PrecoVenda) VALUES 
(1, 1, '2023-01-15', 19500),
(2, 2, '2023-02-20', 29000),
(4, 3, '2023-03-25', 39000);

-- realizar as consultas

-- inner join 1
SELECT Carro.Modelo, Carro.Ano, Carro.Preco, Fabricante.Nome AS Fabricante
FROM Carro
INNER JOIN Fabricante ON Carro.FabricanteID = Fabricante.FabricanteID;

-- inner join 2
SELECT Venda.DataVenda, Venda.PrecoVenda, Carro.Modelo, Cliente.Nome AS Cliente
FROM Venda
INNER JOIN Carro ON Venda.CarroID = Carro.CarroID
INNER JOIN Cliente ON Venda.ClienteID = Cliente.ClienteID;

-- left join
SELECT Carro.Modelo, Carro.Ano, Carro.Preco, Fabricante.Nome AS Fabricante
FROM Carro
LEFT JOIN Fabricante ON Carro.FabricanteID = Fabricante.FabricanteID;

-- right join
SELECT Carro.Modelo, Carro.Ano, Carro.Preco, Fabricante.Nome AS Fabricante
FROM Carro
RIGHT JOIN Fabricante ON Carro.FabricanteID = Fabricante.FabricanteID;

-- full outer join utilizando union
SELECT Carro.Modelo, Carro.Ano, Carro.Preco, Fabricante.Nome AS Fabricante, Fabricante.Pais
FROM Carro
LEFT JOIN Fabricante ON Carro.FabricanteID = Fabricante.FabricanteID

UNION

SELECT Carro.Modelo, Carro.Ano, Carro.Preco, Fabricante.Nome AS Fabricante, Fabricante.Pais
FROM Carro
RIGHT JOIN Fabricante ON Carro.FabricanteID = Fabricante.FabricanteID;
