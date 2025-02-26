## 📚 Resumo dos Comandos SQL
Este arquivo resume os principais comandos `SQL`, oferecendo uma consulta rápida para facilitar o `gerenciamento` e `manipulação` de dados em bancos de dados.

>Os `comandos SQL` são organizados em diferentes categorias, como `DDL`, `DML`, `DCL` e `TCL`. Abaixo, você encontrará um breve resumo de cada um desses tipos, com explicações e exemplos para facilitar o entendimento e aplicação.

<details>
  <summary><strong> Comandos DDL (Data Definition Language) 📂</strong></summary><br>

>Comandos utilizados para `definir`, `modificar` e `excluir` estruturas do banco de dados, incluindo tabelas, índices e esquemas. São essenciais para a organização do banco. <br>
Para isso, temos como exemplo os comandos:
`CREATE`, `ALTER` e `DROP`.
```sql
-- Criando tabela (CREATE)
CREATE TABLE cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE
);
```
```sql
-- Alterando estrutura (ALTER)
ALTER TABLE cliente ADD COLUMN telefone VARCHAR(15);
```
```sql
-- Excluindo tabela (DROP)
DROP TABLE cliente;
```
</details>


<details>
  <summary><strong> Comandos DML (Data Manipulation Language) 📝</strong></summary><br>

>Comandos utilizados para `inserir`, `atualizar`, `excluir` e `consultar` dados dentro das tabelas do banco. São essenciais para o manejo eficiente da informação. <br>
Para isso, temos como exemplo os comandos:
`INSERT`, `UPDATE`, `DELETE`, `SELECT`.

```sql
-- Inserindo novo cliente (INSERT)
INSERT INTO cliente (id, nome, email, telefone)
VALUES (1, 'João Silva', 'joao@email.com', '99999-9999');
```
```sql
-- Atualizando registro (UPDATE)
UPDATE cliente SET telefone = '98888-8888' WHERE id = 1;
```
```sql
-- Removendo registro (DELETE)
DELETE FROM cliente WHERE id = 1;
```
```sql
-- Buscando registros (SELECT)
SELECT * FROM cliente;
```
</details>


<details>
  <summary><strong> Comandos DDL (Data Definition Language) 🔐</strong></summary><br>

>Comandos usados para `definir permissões` e `controle de acesso` a dados e objetos no banco de dados. Garantem segurança e controle de quem pode acessar ou modificar informações. <br>
Para isso, temos como exemplo os comandos:
`GRANT`, `REVOKE`.

```sql
-- Concedendo permissão de leitura da tabela (GRANT)
GRANT SELECT ON cliente FROM PUBLIC;
```
```sql
-- Revogando permissão de leitura da tabela (REVOKE)
REVOKE SELECT ON cliente FROM PUBLIC;
</details>
```
</details>

<details>
  <summary><strong> Comandos TCL (Transaction Control Language) 🔄 </strong></summary><br>

> Comandos utilizados para `gerenciar transações`, garantindo que as operações de banco de dados sejam executadas de forma completa e consistente. <br>
Para isso, temos como exemplo os comandos:
`COMMIT`, `ROLLBACK`, `SAVEPOINT`, SET `TRANSACTION`.

```sql
-- Iniciando uma transação e inserindo um cliente
START TRANSACTION;
INSERT INTO cliente (id, nome, email) VALUES (2, 'Maria Souza', 'maria@email.com');
```
```sql
-- Confirmando alterações (COMMIT)
COMMIT;
```
```sql
-- Iniciando nova transação
START TRANSACTION;
DELETE FROM cliente WHERE id = 2;
```
```sql
-- Revertendo exclusão (ROLLBACK)
ROLLBACK;
```
</details>

## 🗂️ Comandos de Definição de Estruturas
>Os comandos que definem a estrutura do banco de dados são fundamentais para sua `organização` e `arquitetura`, garantindo sua `funcionalidade` e `integridade`. Abaixo, apresento exemplos práticos para ajudar no entendimento e aplicação desses comandos.

<details>
  <summary><strong> Banco de dados 🏛️ </strong></summary><br>

```sql
-- Criando novo banco de dados
CREATE DATABASE nome_do_banco;
--- ou
CREATE DATABASE IF NOT EXISTS nome_do_banco;
```
```sql
-- Iniciando banco de dados
USE nome_do_banco;
```
</details>

<details>
  <summary><strong> Tabelas 📊 </strong></summary><br>

```sql
-- Criando nova tabela sem dados
CREATE TABLE nome_tabela;
-- ou
CREATE TABLE IF NOT EXISTS nome_tabela;
```
```sql
-- Criando nova tabela com dados
CREATE TABLE nome_tabela(
    INT dado1,
    VARCHAR(10) dado2
);
-- ou
CREATE TABLE IF NOT EXISTS nome_tabela(
    INT dado1,
    VARCHAR(10) dado2
);
```
```sql
-- Visualizando campos da tabela
DESC nome_tabela;
```
</details>

<details>
  <summary><strong> Chaves primárias 🔑 </strong></summary><br>

```sql
-- Criando chaves primárias durante criação das tabelas
CREATE TABLE IF NOT EXISTS nome_tabela(
    INT dado1 PRIMARY KEY,
    VARCHAR(10) dado2
);
```
```sql
-- Criando chaves primárias após criação das tabelas
CREATE TABLE IF NOT EXISTS nome_tabela(
    INT dado1,
    VARCHAR(10) dado2
);
ALTER TABLE nome_tabela ADD PRIMARY KEY (dado1);
```
```sql
-- Chaves primária composta durante crianção das tabelas
CREATE TABLE IF NOT EXISTS nome_tabela(
    INT dado1,
    VARCHAR(10) dado2,
    PRIMARY KEY(dado1, dado2)
);
```
```sql
-- Chaves primária composta após criação das tabelas
CREATE TABLE IF NOT EXISTS nome_tabela(
    INT dado1,
    VARCHAR(10) dado2
);
ALTER TABLE nome_tabela ADD PRIMARY KEY (dado1, dado2);
```

</details>

<details>
  <summary><strong> Chaves estrangeiras 🔐 </strong></summary><br>

```sql
-- Tabela com chave primária (tabela que vai ser herdada)
CREATE TABLE IF NOT EXISTS tabelaChaveP(INT chave PRIMARY KEY);
```
```sql
-- Chave estrangeira durante a criação da tabela
-- Vale lembrar que não é uma boa prática.
-- Pode ocasionar em erro, caso chave primária não exista.
CREATE TABLE IF NOT EXISTS nome_tabela(
    INT dado1 PRIMARY KEY,
    chave_estrangeira INT,
    FOREIGN KEY (chave_estrangeira) REFERENCES tabelaChaveP(chave)
);
```
```sql
-- Chave estrangeira após a criação da tabela
CREATE TABLE IF NOT EXISTS nome_tabela(
    INT dado1 PRIMARY KEY,
    chave_estrangeira INT
);
-- Criando chave estrangeira
ALTER TABLE nome_tabela ADD CONSTRAINT fk_chave
FOREIGN KEY (chave_estrangeira) REFERENCES tabelaChaveP(chave);
```

</details>

<details>
  <summary><strong> Tipos de dados 🧮 </strong></summary><br>

</details>