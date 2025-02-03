/* =======================================================
   Projeto: Roteiro 01 - Disciplina de Banco de Dados
   Autor: David Medeiros Santos
   Data de Criação: 02/02/2025
   Descrição: Exp´lorando os primeiros comandos SQL DDL
   Versão: 1.0
   ======================================================= */


CREATE DATABASE IF NOT EXISTS bd_roteiro_01;

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

