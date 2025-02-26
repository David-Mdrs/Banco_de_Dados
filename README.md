# **🛢️ Banco de Dados**
Disciplina de Banco de Dados realizada durante a graduação em Engenharia de Computação. ✅

## 📌 **Sobre este Repositório**
Este repositório é dedicado aos estudos da disciplina de Banco de Dados, reunindo materiais que abordam desde `conceitos fundamentais` até os `mais avançados` para o gerenciamento de dados.

Durante o curso, explorei `modelagem de dados, normalização, consultas SQL e otimização de desempenho`, aplicando esses conhecimentos na criação de estruturas bem definidas para diferentes cenários. Além disso, sempre procurei manter boas práticas no desenvolvimento.

## 🛠️ **Ferramentas Utilizadas**
Para isso, o uso de ferramentas como o `BrModelo` foi fundamental na construção dos diagramas relacionais, enquanto o `MySQL` foi essencial para a implementação desses diagramas no código. ⚙️

## 📜 **Lista de Conteúdos**

- Modelos de bancos de dados. 🗃️
- Scripts SQL organizados. 📝
- Exercícios e práticas de consultas. 🔍
- Diagramas para diferentes minimundos. 🌐

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

## 🤝 Contribuições

Para contribuir com `<Banco_de_Dados>`, siga estas etapas:

1. Bifurque este repositório em `fork`.
2. Clone seu repositório: `git clone <URL_do_repositório>`.
3. Crie um branch: `git checkout -b <nome_branch>`.
4. Faça suas alterações e crie um novo commit: `git commit -m '<mensagem_commit>'`.
5. Envie para o branch original: `git push origin <nome_branch>`.
6. Crie a solicitação de pull em `Compare & pull request`.

##
### `Foi um prazer compartilhar conhecimentos com vocês! 😁`