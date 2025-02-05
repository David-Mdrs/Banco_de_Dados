/* =======================================================
   Projeto: Roteiro 01 - Disciplina de Banco de Dados
   Autor: David Medeiros Santos
   Data de Criação: 02/02/2025
   Descrição: Explorando os primeiros comandos SQL DDL
   Versão: 1.0
   ======================================================= */

-- Crianco novo banco de dados caso não exista

CREATE DATABASE IF NOT EXISTS bd_roteiro_01;


-- Criando tabelas do banco de dados caso não existam

CREATE TABLE IF NOT EXISTS candidato_funcionario(
    funcionario INTEGER,
    candidato INTEGER,
    dt_inscricao DATE
);
DESC candidato;

CREATE TABLE IF NOT EXISTS candidato(
    id_candidato INTEGER,
    nome VARCHAR(60),
    cpf VARCHAR(14)
);
DESC candidato_funcionario;


CREATE TABLE IF NOT EXISTS inscricao(
    id_inscricao INTEGER,
    candidato INTEGER,
    cargo INTEGER,
    dt_inscricao DATE
);
DESC inscricao;

CREATE TABLE IF NOT EXISTS teste(
    id_teste INTEGER,
    processo INTEGER,
    cargo INTEGER,
    inscricao INTEGER,
    dt_teste DATE
);
DESC teste;

CREATE TABLE IF NOT EXISTS cargo(
    id_cargo INTEGER,
    descricao VARCHAR(30)
);
DESC cargo;

CREATE TABLE IF NOT EXISTS departamento(
    id_depto INTEGER,
    descricao VARCHAR(30)
);
DESC departamento;

CREATE TABLE IF NOT EXISTS funcionario(
    id_func INTEGER,
    depto INTEGER,
    cargo INTEGER,
    nome VARCHAR(60),
    cpf VARCHAR(14)
);
DESC funcionario;

CREATE TABLE IF NOT EXISTS processo_seletivo(
    id_processo INTEGER,
    descricao VARCHAR(60)
);
DESC processo_seletivo;


-- Visualizando para confirmar existência das tabelas

SHOW TABLES;


-- Criando restrições

ALTER TABLE funcionario ADD CONSTRAINT PK_func PRIMARY KEY (id_func);
ALTER TABLE candidato ADD CONSTRAINT PK_candidato PRIMARY KEY (id_candidato);
ALTER TABLE inscricao ADD CONSTRAINT PK_inscricao PRIMARY KEY (id_inscricao);
ALTER TABLE cargo ADD CONSTRAINT PK_cargo PRIMARY KEY (id_cargo);
ALTER TABLE teste ADD CONSTRAINT PK_teste PRIMARY KEY (id_teste);
ALTER TABLE processo_seletivo ADD CONSTRAINT PRIMARY KEY (id_processo);
ALTER TABLE departamento ADD CONSTRAINT PRIMARY KEY (id_depto);

ALTER TABLE candidato_funcionario ADD CONSTRAINT PK_cand_func PRIMARY KEY(funcionario, candidato);
ALTER TABLE candidato_funcionario ADD CONSTRAINT FK_cand_func FOREIGN KEY (funcionario) REFERENCES funcionario(id_func);
ALTER TABLE candidato_funcionario ADD CONSTRAINT FK_cand_func_cand FOREIGN KEY (candidato) REFERENCES candidato(id_candidato);

ALTER TABLE inscricao ADD CONSTRAINT FK_insc_candidato FOREIGN KEY (candidato) REFERENCES CANDIDATO(id_candidato);
ALTER TABLE inscricao ADD CONSTRAINT FK_insc_cargo FOREIGN KEY (cago) REFERENCES CARGO(id_cargo);
ALTER TABLE teste ADD CONSTRAINT FK_teste_processo FOREIGN KEY (processo) REFERENCES processo_seletivo(id_processo);
ALTER TABLE teste ADD CONSTRAINT FK_teste_cargo FOREIGN KEY (cargo) REFERENCES cargo(id_cargo);
ALTER TABLE teste ADD CONSTRAINT FK_teste_inscricao FOREIGN KEY (inscricao) REFERENCES inscricao(id_inscricao);
