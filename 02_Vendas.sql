/* =======================================================
   Projeto: Roteiro 02 - Disciplina de Banco de Dados
   Autor: David Medeiros Santos
   Data de Criação: 08/02/2025
   Descrição: Comandos SQL DDL para sistema simples de vendas
   Versão: 1.0
   ======================================================= */


-- Crianco novo banco de dados caso não exista

CREATE DATABASE IF NOT EXISTS vendas;


-- Criando tabelas do banco de dados caso não existam

CREATE TABLE IF NOT EXISTS cliente(
   codigoCli INT PRIMARY KEY,
   nome VARCHAR(30) NOT NULL,
   uf VARCHAR(2) NOT NULL
);
DESC cliente;

CREATE TABLE IF NOT EXISTS venda(
   numero INT PRIMARY KEY,
   data DATE,
   total REAL,
   codigoCli INT NOT NULL,
   FOREIGN KEY (codigoCli) REFERENCES cliente(codigoCli) 
);
DESC venda;

CREATE TABLE IF NOT EXISTS produto(
   codigo INT PRIMARY KEY,
   descricao VARCHAR(50) NOT NULL,
   precoCompra REAL,
   lucro REAL,
   quantidade REAL,
   categoria VARCHAR(30) NOT NULL
);
DESC produto;

CREATE TABLE IF NOT EXISTS item_venda(
   qnt REAL,
   precoUnitario REAL,
   codigo INT NOT NULL,
   numero INT NOT NULL,
   PRIMARY KEY (codigo, numero),
   FOREIGN KEY (codigo) REFERENCES produto(codigo),
   FOREIGN KEY (numero) REFERENCES venda(numero)
);
DESC item_venda;