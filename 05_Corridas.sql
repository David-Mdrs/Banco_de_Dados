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


-- Inserindo dados

INSERT INTO pais VALUES 
    (1, 'Brasil'), (2, 'Argentina'), (3, 'Alemanha'), (4, 'Inglaterra'),
    (5, 'Italia'), (6, 'Finlandia'), (7, 'Suiça'), (8, 'Canadá'), 
    (9, 'Dinamarca'), (10, 'Australia'), (11, 'Holanda'), (12, 'Mexico'), 
    (13, 'França'), (14, 'Espanha'), (15, 'Austria'), (16, 'Reino Unido'), 
    (17, 'Estados Unidos'), (18, 'Emirados Árabes Unidos'), 
    (19, 'Arabia Saudita'), (20, 'Catar'), (21, 'Turquia'), (22, 'Belgica');
SELECT * FROM pais;

INSERT INTO equipe VALUES 
    (1, 'Red Bull Racing', 15), (2, 'McLaren', 16), (3, 'Aston Martin Racing', 16),
    (4, 'Williams', 16), (5, 'Haas F1 Team', 17), (6, 'AlphaTauri', 5), 
    (7, 'Alpine', 13), (8, 'Ferrari', 5), (9, 'Alfa Romeo', 5), (10, 'Mercedes', 3);
SELECT * FROM equipe;

INSERT INTO piloto VALUES 
    (1, 'Max Verstappen', 1, 11), (2, 'Daniel Ricciardo', 2, 10), (3, 'Lando Norris', 2, 16),
    (4, 'Sebastian Vettel', 3, 3), (5, 'Nicholas Latifi', 4, 8), (6, 'Kevin Magnussen', 5, 9),
    (7, 'Pierre Gasly', 6, 13), (8, 'Fernando Alonso', 7, 14), (9, 'Sergio Perez', 1, 12),
    (10, 'Lance Stroll', 3, 8), (11, 'Carlos Sainz Jr.', 8, 14), (12, 'Lewis Hamilton', 10, 16),
    (13, 'Valtteri Bottas', 9, 6), (14, 'Mick Schumacher', 5, 3);
SELECT * FROM piloto;

INSERT INTO circuito VALUES 
    (1, 'GP de Abu Dhabi', 18), (2, 'GP da Arabia Saudita', 19), (3, 'GP do Catar', 20), 
    (4, 'GP do Brasil', 1), (5, 'GP do Mexico', 12), (6, 'GP dos EUA', 17), 
    (7, 'GP da Turquia', 21), (8, 'GP da Italia', 5), (9, 'GP da Holanda', 11), 
    (10, 'GP da Belgica', 22);
SELECT * FROM circuito;

INSERT INTO prova VALUES 
    (1, '2023-12-12', 1), (2, '2023-12-05', 2), (3, '2023-11-21', 3), 
    (4, '2021-11-14', 4), (5, '2023-11-07', 5), (6, '2023-10-24', 6), 
    (7, '2023-10-10', 7), (8, '2023-09-12', 8), (9, '2023-09-05', 9), 
    (10, '2023-08-29', 10);
SELECT * FROM prova;

INSERT INTO piloto_pos VALUES 
    (1, 1, 1), (1, 11, 2), (1, 12, 3), (1, 10, 4), (1, 4, 5),
    (2, 12, 1), (2, 1, 2), (2, 13, 3), (2, 11, 4), (2, 14, 5),
    (3, 12, 1), (3, 1, 2), (3, 8, 3), (3, 5, 4), (3, 6, 5),
    (4, 12, 1), (4, 1, 2), (4, 13, 3), (4, 11, 4), (4, 2, 5),
    (5, 1, 1), (5, 12, 2), (5, 9, 3), (5, 8, 4), (5, 7, 5),
    (6, 1, 1), (6, 12, 2), (6, 9, 3), (6, 7, 4), (6, 8, 5),
    (7, 13, 1), (7, 1, 2), (7, 12, 3), (7, 2, 4), (7, 7, 5),
    (8, 2, 1), (8, 3, 2), (8, 13, 3), (8, 14, 4), (8, 7, 5),
    (9, 1, 1), (9, 12, 2), (9, 13, 3), (9, 2, 4), (9, 4, 5),
    (10, 1, 1), (10, 12, 2), (10, 5, 3), (10, 3, 4), (10, 6, 5);
SELECT * FROM piloto_pos;