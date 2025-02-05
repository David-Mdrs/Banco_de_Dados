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

CREATE TABLE IF NOT EXISTS cd(
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    gravadora VARCHAR(30),
    data DATE
);
DESC cd;

CREATE TABLE IF NOT EXISTS cantor(
    codigo INT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    biografia TEXT
);
DESC cantor;

CREATE TABLE IF NOT EXISTS musica(
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


-- Adicionando dados

INSERT cd(codigo, nome, gravadora, data) VALUES
    (1, "Fantasia", "Som Preso", "2010-09-02"),
    (2, "Fantasia de Verão", "Som Preso", "2020-10-20"),
    (3, "Romantico Total", "RGB", "2022-09-21"),
    (4, "Popular", "2024 RGB", NULL);
SELECT *FROM cd;

INSERT cantor(codigo, nome, biografia) VALUES
    (1, "Marisa aos Montes", "Nasceu em João Pessoa em 1980. Gravou varios CDs. Formou recentemente os Carnabalistas."),
    (2, "Zeca Sertanejo", "Nasceu em Patos-PB. Não bebe. Nao fuma. Tem 3 filhos."),
    (3, "Alexandre Xicara", "Toca pagode desde os 12 anos. Comportamento calmo. Gravou tambem MPB."),
    (4, "Emerson Seringueira", "Canta MPB e sucessos internacionais desde 2000. Vendeu mais de 3 milhoes de discos."),
    (5, "Martinho do Bairro", "Alem de pagode, canta sertanejo desde crianca. Tem familia em Campina Grande.");
SELECT *FROM cantor;

