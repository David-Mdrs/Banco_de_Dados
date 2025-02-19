/* =======================================================
   Projeto: Corridas - Disciplina de Banco de Dados
   Autor: David Medeiros Santos
   Data de Criação: 19/02/2025
   Descrição: Banco de dados para gerenciamento de corridas
   Versão: 1.0
   ======================================================= */


-- Crianco novo banco de dados caso não exista

CREATE DATABASE IF NOT EXISTS 05_Corridas;


-- Criando tabelas do banco de dados caso não existam

CREATE TABLE IF NOT EXISTS equipe (
    id INT PRIMARY KEY,
    nome VARCHAR(30),
    pais INT	
);

CREATE TABLE IF NOT EXISTS piloto (
    id INT PRIMARY KEY,
    nome VARCHAR(40),
    equipe INT,
    pais INT
);

CREATE TABLE IF NOT EXISTS pais (
    id INT PRIMARY KEY,
    nome VARCHAR(30)	
);

CREATE TABLE IF NOT EXISTS circuito (
    id INT PRIMARY KEY,
    nome VARCHAR(30),
    pais INT	
);

CREATE TABLE IF NOT EXISTS prova (
    id INT PRIMARY KEY,
    data DATE,
    circuito INT	
);

CREATE TABLE IF NOT EXISTS piloto_pos (
    prova INT,
    piloto INT,
    posicao INT,
    PRIMARY KEY (prova, piloto)
);
