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


-- Definindo chaves estrangeiras

ALTER TABLE piloto ADD CONSTRAINT FK_pe FOREIGN KEY (equipe) REFERENCES equipe (id);
ALTER TABLE equipe ADD CONSTRAINT FK_ep FOREIGN KEY (pais) REFERENCES pais (id);
ALTER TABLE circuito ADD CONSTRAINT FK_cp FOREIGN KEY (pais) REFERENCES pais (id);
ALTER TABLE prova ADD CONSTRAINT FK_pc FOREIGN KEY (circuito) REFERENCES circuito (id);
ALTER TABLE piloto_pos ADD CONSTRAINT FK_pp FOREIGN KEY (prova) REFERENCES prova (id);
ALTER TABLE piloto_pos ADD CONSTRAINT FK_pp2 FOREIGN KEY (piloto) REFERENCES piloto (id);
ALTER TABLE piloto ADD CONSTRAINT FK_pe2 FOREIGN KEY (pais) REFERENCES pais (id);