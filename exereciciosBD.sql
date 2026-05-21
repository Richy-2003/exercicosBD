CREATE DATABASE EmpresaDB;

USE EmpresaDB;

CREATE TABLE Departamentos (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL UNIQUE,
    DataCriacao DATE
);

CREATE TABLE Funcionarios (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(150) NOT NULL,
    Email VARCHAR(150) UNIQUE,
    Salario DECIMAL(10,2),
    DataAdmissao DATE,
    IdDepartamento INT NOT NULL,

    CONSTRAINT FK_Funcionario_Departamento
    FOREIGN KEY (IdDepartamento)
    REFERENCES Departamentos(Id)
);

CREATE TABLE Projetos (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(150) NOT NULL,
    Orcamento DECIMAL(12,2),
    DataInicio DATE,
    DataFim DATE
);

CREATE TABLE FuncionariosProjetos (
    IdFuncionarioProjeto INT PRIMARY KEY AUTO_INCREMENT,
    IdFuncionario INT NOT NULL,
    IdProjeto INT NOT NULL,
    DataEntrada DATE,

    CONSTRAINT FK_FP_Funcionario
    FOREIGN KEY (IdFuncionario)
    REFERENCES Funcionarios(Id),

    CONSTRAINT FK_FP_Projeto
    FOREIGN KEY (IdProjeto)
    REFERENCES Projetos(Id)
);

INSERT INTO Departamentos
(Nome, DataCriacao)
VALUES
('TI','2020-01-01'),
('RH','2021-03-15'),
('Financeiro','2019-07-10');

INSERT INTO Funcionarios
(Nome, Email, Salario, DataAdmissao, IdDepartamento)
VALUES
(
'Carlos Silva',
'carlos@empresa.com',
5000.00,
'2022-05-10',
(SELECT Id FROM Departamentos WHERE Nome='TI')
),

(
'Ana Souza',
'ana@empresa.com',
7000.00,
'2021-08-20',
(SELECT Id FROM Departamentos WHERE Nome='RH')
),

(
'Pedro Lima',
'pedro@empresa.com',
4500.00,
'2023-01-15',
(SELECT Id FROM Departamentos WHERE Nome='Financeiro')
);

INSERT INTO Projetos
(Nome, Orcamento, DataInicio, DataFim)
VALUES
(
'Sistema ERP',
100000.00,
'2023-01-01',
'2023-12-31'
),

(
'Recrutamento Digital',
50000.00,
'2023-06-01',
'2023-10-01'
),

(
'Controle Financeiro',
75000.00,
'2023-03-01',
'2023-09-30'
);

INSERT INTO FuncionariosProjetos
(IdFuncionario, IdProjeto, DataEntrada)
VALUES

(
(SELECT Id FROM Funcionarios
WHERE Nome='Carlos Silva'),

(SELECT Id FROM Projetos
WHERE Nome='Sistema ERP'),

CURRENT_DATE
),

(
(SELECT Id FROM Funcionarios
WHERE Nome='Carlos Silva'),

(SELECT Id FROM Projetos
WHERE Nome='Controle Financeiro'),

CURRENT_DATE
),

(
(SELECT Id FROM Funcionarios
WHERE Nome='Ana Souza'),

(SELECT Id FROM Projetos
WHERE Nome='Recrutamento Digital'),

CURRENT_DATE
),

(
(SELECT Id FROM Funcionarios
WHERE Nome='Pedro Lima'),

(SELECT Id FROM Projetos
WHERE Nome='Sistema ERP'),

CURRENT_DATE
),

(
(SELECT Id FROM Funcionarios
WHERE Nome='Pedro Lima'),

(SELECT Id FROM Projetos
WHERE Nome='Controle Financeiro'),

CURRENT_DATE
);





