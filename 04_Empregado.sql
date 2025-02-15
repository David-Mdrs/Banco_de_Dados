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