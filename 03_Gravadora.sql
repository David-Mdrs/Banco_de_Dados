/* =======================================================
   Projeto: Roteiro 01 - Disciplina de Banco de Dados
   Autor: David Medeiros Santos
   Data de Criação: 02/02/2025
   Descrição: Explorando os primeiros comandos SQL DDL
   Versão: 1.0
   ======================================================= */


-- Crianco novo banco de dados caso não exista

CREATE DATABASE IF NOT EXISTS gravadora;


-- Criando tabelas do banco de dados caso não existam

CREATE TABLE IF NOT EXISTS cd (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    gravadora VARCHAR(30),
    data DATE
);
DESC cd;

CREATE TABLE cantor (
    codigo INT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    biografia TEXT
);
DESC cantor;

CREATE TABLE musica (
    cd INT,
    numero INT,
    titulo VARCHAR(40) NOT NULL,
    cantor INT NOT NULL,
    tempo INT,
    genero VARCHAR(20),
    PRIMARY KEY (cd, numero),
    FOREIGN KEY (cd) REFERENCES cd(codigo),
    FOREIGN KEY (cantor) REFERENCES cantor(codigo)
);
DESC musica;