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
DESC empregado;

CREATE TABLE secao (
   idsec INTEGER PRIMARY KEY, 
   nome VARCHAR(20) NOT NULL, 
   cidade VARCHAR(20) NOT NULL
);
DESC secao;


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
SELECT * FROM secao;

INSERT INTO empregado VALUES 
   (3, 'Álvaro Dias', 50, 'Administrador', NULL, 2500, 0),
   (1, 'Ana Paula', 10, 'Programador', 3, 3000, 10), 
   (2, 'Gustavo Henrique', 70, 'Engenheiro', 1, 2500, 50), 
   (4, 'Antônio Carlos', 10, 'Engenheiro', 3, 2400, 20),  
   (5, 'Susana Silva', 20, 'Administrador', NULL, 2750, 30),
   (6, 'Cláudio José', 60, 'Vendedor', 4, 1000, 50);
SELECT * FROM empregado;


-- Lista de questões

-- 1. Exiba, para cada seção, o número da seção, a quantidade de empregados e total dos salários sem comissão.
SELECT secao, COUNT(*) AS qtd_empregados, SUM(salario) AS total_salarios
   FROM empregado GROUP BY secao;

-- 2. Exiba, para cada cargo, o nome do cargo, o número de empregados e salário médio.
SELECT cargo, COUNT(*) AS qnt_empregados, AVG(salario) AS media_salarios
   FROM empregado GROUP BY cargo;

-- 3. Mostre o cargo, número de empregados e o salário médio para cada cargo, desde que o cargo tenha pelo menos 2 empregados.
SELECT cargo, COUNT(*) AS qnt_empregados, AVG(salario) AS media_salarios
   FROM empregado GROUP BY cargo HAVING qnt_empregados >= 2;

-- 4. Exiba o valor do salário (incluindo a comissão) mais alto da empresa. A comissao na tabela Empregado está em valor percentual.
SELECT MAX(salario + (salario * (comissao / 100))) AS maior_salario
   FROM empregado;

-- 5. Exiba o valor do salário (incluindo a comissão) mais alto da empresa para cada cargo.
SELECT cargo, MAX(salario + (salario * (comissao / 100))) AS maior_salario
   FROM empregado GROUP BY cargo;

-- 6. Exiba o salário médio por cargo, exceto para o cargo o de Administrador.
SELECT cargo, AVG(salario) AS media_salario
   FROM empregado GROUP BY cargo HAVING cargo != "Administrador";

-- 7. Exiba a quantidade de cidades que a empresa atende, isto é, as cidades que possuem seção.
SELECT COUNT(DISTINCT cidade) AS qtd_cidades 
   FROM secao;

-- 8. Exiba a quantidade de empregados que não possui chefe.
SELECT COUNT(*) AS qnt_empregados
   FROM empregado WHERE chefe IS NULL;

-- 9. Exiba o custo total da empresa com pagamento de salário em cada seção,
--    mas apresente somente a seção (e o custo), onde o custo total é superior a R$2500,00.
SELECT secao, SUM(salario + (salario * (comissao / 100))) AS custo_total
   FROM empregado GROUP BY secao HAVING custo_total > 2500;

-- 10
SELECT cargo, SUM(salario) AS total_salario
   FROM empregado GROUP BY cargo ORDER BY total_salario ASC;