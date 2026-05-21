CREATE DATABASE EmpresaDB;

USE EmpresaDB;

CREATE TABLE Departamentos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(200) UNIQUE NOT NULL,
    DataCriacao DATE
);

CREATE TABLE Funcionarios (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(200) NOT NULL,
    Email VARCHAR(200) UNIQUE,
    Salario DECIMAL(10,2),
    DataAdmissao DATE,
    IdDepartamento INT NOT NULL,

    CONSTRAINT FK_Func_Dep
    FOREIGN KEY (IdDepartamento)
    REFERENCES Departamentos(Id)
);

CREATE TABLE Projetos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(200) NOT NULL,
    Orcamento DECIMAL(10,2),
    DataInicio DATE,
    DataFim DATE
);

CREATE TABLE FuncionariosProjetos (
    IdFuncionarioProjeto INT PRIMARY KEY IDENTITY(1,1),

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

INSERT INTO Departamentos (Nome, DataCriacao)
VALUES
('TI','2020-01-01'),
('RH','2021-03-15'),
('Financeiro','2019-07-10');

INSERT INTO Funcionarios
(Nome, Email, Salario, DataAdmissao, IdDepartamento)
VALUES

('Carlos Silva',
'carlos@empresa.com',
5000.00,
'2022-05-10',
1),

('Ana Souza',
'ana@empresa.com',
7000.00,
'2021-08-20',
2),

('Pedro Lima',
'pedro@empresa.com',
4500.00,
'2023-01-15',
3);

INSERT INTO Projetos
(Nome, Orcamento, DataInicio, DataFim)
VALUES

('Sistema ERP',
100000.00,
'2023-01-01',
'2023-12-31'),

('Recrutamento Digital',
50000.00,
'2023-06-01',
'2023-10-01'),

('Controle Financeiro',
75000.00,
'2023-03-01',
'2023-09-30');

INSERT INTO FuncionariosProjetos
(IdFuncionario, IdProjeto, DataEntrada)
VALUES

(1,1,GETDATE()),
(1,3,GETDATE()),
(2,2,GETDATE()),
(3,1,GETDATE()),
(3,3,GETDATE());

SELECT
f.Nome AS Funcionario,
d.Nome AS Departamento,
p.Nome AS Projeto

FROM FuncionariosProjetos fp

INNER JOIN Funcionarios f
ON fp.IdFuncionario = f.Id

INNER JOIN Departamentos d
ON f.IdDepartamento = d.Id

INNER JOIN Projetos p
ON fp.IdProjeto = p.Id;