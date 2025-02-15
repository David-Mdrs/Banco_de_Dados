/* =======================================================
   Projeto: Empregado - Disciplina de Banco de Dados
   Autor: David Medeiros Santos
   Data de Criação: 15/02/2025
   Descrição: Banco de dados para registro de empregados e suas sessões
   Versão: 1.0
   ======================================================= */


-- Crianco novo banco de dados caso não exista

CREATE DATABASE IF NOT EXISTS empregado;


-- Criando tabelas do banco de dados caso não existam

CREATE TABLE empregado (
   idemp INTEGER PRIMARY KEY, 
   nome VARCHAR(20) NOT NULL, 
   secao INTEGER NOT NULL, 
   cargo VARCHAR(15) NOT NULL, 
   chefe INTEGER, 
   salario DECIMAL(7,2) NOT NULL,
   comissao DECIMAL(7,2) NOT NULL
);

CREATE TABLE secao (
   idsec INTEGER PRIMARY KEY, 
   nome VARCHAR(20) NOT NULL, 
   cidade VARCHAR(20) NOT NULL
);


-- Definindo chaves estrangeiras

ALTER TABLE empregado ADD CONSTRAINT FOREIGN KEY (secao) REFERENCES secao(idsec);
ALTER TABLE empregado ADD CONSTRAINT FOREIGN KEY (chefe) REFERENCES empregado (idemp);


-- Inserindo dados

INSERT INTO secao VALUES 
   (10, 'Fabrica', 'Recife'),
   (20, 'Comercial', 'Recife'), 
   (30, 'Marketing', 'Campina Grande'), 
   (40, 'Planejamento', 'João Pessoa'), 
   (50, 'Administração', 'Recife'), 
   (60, 'Informática', 'Campina Grande'), 
   (70, 'Recursos Humanos', 'João Pessoa');

INSERT INTO empregado VALUES 
   (3, 'Álvaro Dias', 50, 'Administrador', NULL, 2500, 0),
   (1, 'Ana Paula', 10, 'Programador', 3, 3000, 10), 
   (2, 'Gustavo Henrique', 70, 'Engenheiro', 1, 2500, 50), 
   (4, 'Antônio Carlos', 10, 'Engenheiro', 3, 2400, 20),  
   (5, 'Susana Silva', 20, 'Administrador', NULL, 2750, 30),
   (6, 'Cláudio José', 60, 'Vendedor', 4, 1000, 50);