/* =======================================================
   Projeto: Roteiro 01 - Disciplina de Banco de Dados
   Autor: David Medeiros Santos
   Data de Criação: 02/02/2025
   Descrição: Explorando os primeiros comandos SQL DDL
   Versão: 1.0
   ======================================================= */


-- Crianco novo banco de dados caso não exista

CREATE DATABASE IF NOT EXISTS gravadora;


-- 1) Criando tabelas do banco de dados caso não existam

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


-- 2) Adicionando dados a tabela CD

INSERT cd(codigo, nome, gravadora, data) VALUES
    (1, "Fantasia", "Som Preso", "2010-09-02"),
    (2, "Fantasia de Verão", "Som Preso", "2020-10-20"),
    (3, "Romantico Total", "RGB", "2022-09-21"),
    (4, "Popular 2024", "RGB", NULL);
SELECT *FROM cd;

-- 3) Adicionando dados a tabela CANTOR

INSERT cantor(codigo, nome, biografia) VALUES
    (1, "Marisa aos Montes", "Nasceu em João Pessoa em 1980. Gravou varios CDs. Formou recentemente os Carnabalistas."),
    (2, "Zeca Sertanejo", "Nasceu em Patos-PB. Não bebe. Nao fuma. Tem 3 filhos."),
    (3, "Alexandre Xicara", "Toca pagode desde os 12 anos. Comportamento calmo. Gravou tambem MPB."),
    (4, "Emerson Seringueira", "Canta MPB e sucessos internacionais desde 2000. Vendeu mais de 3 milhoes de discos."),
    (5, "Martinho do Bairro", "Alem de pagode, canta sertanejo desde crianca. Tem familia em Campina Grande.");
SELECT *FROM cantor;


-- 4) Adicionando dados a tabela MUSICA

INSERT musica(cd, numero, titulo, cantor, tempo, genero) VALUES
    (1, 1, "Coracao apaixonado", 1, 120, "MPB"),
    (1, 2, "Coracao dilacerado", 2, 180, "MPB"),
    (1, 3, "Mulher", 1, 120, "PAGODE"),
    (1, 4, "Mulheres apaixonadas", 4, 178, NULL),
    (1, 5, "Vou embora", 5, 300, "SAMBA"),
    (2, 1, "Adeus para sempre", 2, 180, "SAMBA"),
    (2, 2, "Nova infancia", 4, 198, "MPB"),
    (2, 3, "Eu voltei", 5, 345, "MPB"),
    (2, 4, "Volta para mim", 5, 532, "SAMBA"),
    (3, 1, "Amor de irmao", 4, 123, "SAMBA"),
    (3, 2, "Amigo", 3, 452, "SERTANEJO"),
    (3, 3, "Amigo para sempre", 2, 89, "SERTANEJO"),
    (3, 4, "Cancao para o amigo", 1, 365, "MPB"),
    (4, 1, "Andancas", 2, 320, "MPB"),
    (4, 2, "Irmao do coracao", 4, 180, NULL),
    (4, 3, "Amor de mae", 3, 124, "PAGODE");
SELECT *FROM musica;

-- 5) 
UPDATE cantor SET nome = "Martinho do Zepa" where nome = "Martinho do Bairro";
SELECT *FROM cantor WHERE nome = "Martinho do Zepa";

-- 6)
UPDATE musica SET cantor = 1 WHERE titulo = "Nova infancia";
SELECT *FROM musica WHERE titulo = "Nova infancia";

-- 7)
UPDATE cd SET data = "2024-06-10" WHERE nome = "Popular 2024";
SELECT *FROM cd WHERE nome = "Popular 2024";
