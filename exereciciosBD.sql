CREATE DATABASE EmpresaDB

USE EmpresaDB

CREATE TABLE Departamentos (
Id INT PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR(200) UNIQUE NOT NULL,
DataCriacao DATE)

CREATE TABLE Funcionarios (
Id INT PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR(200) NOT NULL,
Email VARCHAR(200) UNIQUE,
Salario DECIMAL(8,2),
DataAdimissao DATE,
IdDepartamento INT NOT NULL
CONSTRAINT FK_Func_Dep
FOREIGN KEY (IdDepartamento)
REFERENCES Departamentos (Id))

CREATE TABLE Projetos (
Id INT PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR(200) NOT NULL,
Orcamento DECIMAL(10,2),
DataInicio DATE,
DataFim DATE)

CREATE TABLE FuncionariosProjetos (
IdFuncionarioProjeto INT PRIMARY KEY IDENTITY(1,1),
IdFuncionario INT,
IdProjetos INT,
DataEntrada DATE)

INSERT INTO Departamentos (Id, Nome, DataCriacao)
VALUES 
	(TI, 01/01/2026),
	(RH,15/03/2021),
	(Financeiro, 10/07/2026);

INSERT INTO Funcionarios (Id, Nome, Email, Salario, DataAdimissao, IdDepartamento)
VALUES 
	(Carlos Silva, carlos@empresa.com, 5000,00, 10/05/2022, TI),
	(Ana Souza, ana@empresa.com, 7000,00, 20/08/2021, RH),
	(Pedro Lima, pedro@empresa.com, 4500,00, Financeiro);

INSERT INTO Projetos (Nome, Orcamento, DataInicio, DataFim)
VALUES 
	(Sistemas ERP, 100,000,00, 01/10/2023, 31/12/2023),
	(Recrutamento Digital, 50,000,00, 01/06/2023, 01/10/2023),
	(Controle Financeiro, 75,000,00, 01/03/2023, 30/09/2023);






