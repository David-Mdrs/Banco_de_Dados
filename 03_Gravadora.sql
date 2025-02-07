/* =======================================================
   Projeto: Gravadora - Disciplina de Banco de Dados
   Autor: David Medeiros Santos
   Data de Criação: 05/02/2025
   Descrição: Banco de dados para gravadora de músicas
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
SELECT * FROM cd;

-- 3) Adicionando dados a tabela CANTOR

INSERT cantor(codigo, nome, biografia) VALUES
    (1, "Marisa aos Montes", "Nasceu em João Pessoa em 1980. Gravou varios CDs. Formou recentemente os Carnabalistas."),
    (2, "Zeca Sertanejo", "Nasceu em Patos-PB. Não bebe. Nao fuma. Tem 3 filhos."),
    (3, "Alexandre Xicara", "Toca pagode desde os 12 anos. Comportamento calmo. Gravou tambem MPB."),
    (4, "Emerson Seringueira", "Canta MPB e sucessos internacionais desde 2000. Vendeu mais de 3 milhoes de discos."),
    (5, "Martinho do Bairro", "Alem de pagode, canta sertanejo desde crianca. Tem familia em Campina Grande.");
SELECT * FROM cantor;


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
SELECT * FROM musica;

-- 5) Alterando dados
UPDATE cantor SET nome = "Martinho do Zepa" where nome = "Martinho do Bairro";
SELECT * FROM cantor WHERE nome = "Martinho do Zepa";

-- 6) Alterando dados
UPDATE musica SET cantor = 1 WHERE titulo = "Nova infancia";
SELECT * FROM musica WHERE titulo = "Nova infancia";

-- 7) Alterando dados
UPDATE cd SET data = "2024-06-10" WHERE nome = "Popular 2024";
SELECT * FROM cd WHERE nome = "Popular 2024";

-- 8) Visualizando músicas em ordem crescente de duração
SELECT * FROM musica ORDER BY tempo ASC;

-- 9) Exibindo os gêneros em ordem alfabética, seguido dos títulos em ordem alfabética das músicas
SELECT genero, titulo FROM musica ORDER BY genero ASC, titulo ASC;

-- 10) Selecionando CDs da gravadora 'Som Preso'
SELECT * FROM cd WHERE gravadora = "Som Preso";

-- 11) Exibindo músicas do CD 'Fantasia de Verao'
SELECT * FROM MUSICA WHERE CD = 2;

-- 12) Exiba as músicas que não tem genero cadastrado
SELECT * FROM musica WHERE genero IS NULL;

-- 13) Altere o gênero da música Irmao do coracao e Mulheres apaixonadas para MPB
UPDATE musica SET genero = "MPB" WHERE titulo IN ("Irmao do coracao", "Mulheres apaixonadas");
SELECT genero FROM musica WHERE titulo IN ("Irmao do coracao", "Mulheres apaixonadas");

-- 14) Exiba todas as músicas que contém a palavra irmao
SELECT * FROM musica WHERE titulo LIKE '%irmao%';

-- 15) Exibindo músicas do gênero MPB
SELECT * FROM musica WHERE genero = "MPB";

-- 16) Exibindo músicas com duração entre 2 e 4 minutos
SELECT * FROM musica WHERE tempo BETWEEN 200 and 400;

-- 17) Selecionando os CDs lançados no mês de setembro
SELECT * FROM cd WHERE MONTH(data) = 9;

-- 18) Exibindo cantores cujo nome iniciam com a letra M
SELECT * FROM cantor WHERE nome LIKE 'M%';

-- 19) Exibindo dados dos CDs do mais recente para o mais antigo
SELECT * FROM cd ORDER BY data DESC;

-- 20) Exibindo o título, o gênero e o tempo de duração das músicas do gênero SAMBA, PAGODE e SERTANEJO
SELECT titulo, genero, tempo FROM musica WHERE genero IN ("SAMBA", "PAGODE", "SERTANEJO");

-- 21) Selecionando todas as músicas que os títulos tenham somente uma palavra
SELECT * FROM musica WHERE titulo NOT LIKE '% %';

-- 22) Exibindo o nome do CD, o nome da gravadora e há tempo (em anos) os CDs foram lançados em ordem descrescente de tempo
SELECT nome, gravadora, YEAR(data) FROM cd ORDER BY YEAR(data) DESC;

-- 23) Exclua a música Vou embora. O que aconteceu? Explique
DELETE FROM musica WHERE titulo = 'Vou embora';
SELECT * FROM musica;

-- RESPOSTA: A exclusão foi concluída com sucesso