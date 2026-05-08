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






