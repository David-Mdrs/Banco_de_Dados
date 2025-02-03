CREATE DATABASE IF NOT EXISTS bd_roteiro_01;

CREATE TABLE IF NOT EXISTS candidato_funcionario(
    funcionario INTEGER,
    candidato INTEGER,
    dt_inscricao DATE
);

DESC candidato_funcionario;