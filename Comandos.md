## 📑 Resumo dos comandos SQL

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