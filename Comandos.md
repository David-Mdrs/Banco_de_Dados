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

>Principais tipos de dados mais utilizados para definir colunas em tabelas SQL:

```sql
INT:          Números inteiros.
VARCHAR(n):   Textos de tamanho variável, com tamanho "n" de caracteres.
TEXT:         Grandes quantidades de texto.
DATE:         Datas em formato YYYY-MM-DD.
DECIMAL(p,s): p é o total de dígitos e s é o número de casas decimais.
BOOLEAN:      Armazena valores TRUE ou FALSE.
FLOAT:        Armazena números de ponto flutuante com precisão simples.

```
</details>


## 🔒 Restrições de Integridade
>As restrições de integridade são essenciais para garantir a `qualidade` e `consistência` dos dados em um banco de dados. Elas definem `regras` que os dados devem seguir, assegurando a ausência de `informações incorretas` ou `inconsistentes`. A seguir, apresento os principais tipos de restrições e seus usos.

<details>
  <summary><strong> Unique ❗ </strong></summary><br>

>Garante que os valores de uma coluna sejam exclusivos.
```sql
-- Definindo restrição UNIQUE
CREATE TABLE IF NOT EXISTS nome_tabela (
    id INT PRIMARY KEY,
    nome VARCHAR(100) UNIQUE,
);
```

</details>

<details>
  <summary><strong> Not Null 🚫 </strong></summary><br>

>Impede que uma coluna aceite valores nulos.
```sql
-- Definindo restrição NOT NULL
CREATE TABLE IF NOT EXISTS nome_tabela (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
);
```

</details>

<details>
  <summary><strong> Check ⚖️ </strong></summary><br>

>Define uma condição que os valores devem cumprir.
```sql
-- Definindo restrição CHECK
CREATE TABLE IF NOT EXISTS nome_tabela (
    id INT PRIMARY KEY,
    idade INT CHECK (idade >= 18)
);
```

</details>

<details>
  <summary><strong> Default 🔄 </strong></summary><br>

>Atribui um valor automaticamente quando nenhum valor é fornecido.
```sql
-- Definindo valor padrão
CREATE TABLE IF NOT EXISTS nome_tabela (
    id INT PRIMARY KEY,
    data DATE DEFAULT CURRENT_DATE
);
```

</details>

<details>
  <summary><strong> Index 🔢 </strong></summary><br>

>Atualiza chaves estrangeiras, caso ocorra alguma mudança nas chaves primárias da tabela herdada.
```sql
-- Tabela com chave primária (tabela que vai ser herdada)
CREATE TABLE IF NOT EXISTS tabelaChaveP(INT chave PRIMARY KEY);
```
```sql
-- Tabela com chave estrangeira atualizada
CREATE TABLE tabela (
    id INT PRIMARY KEY,
    chaveEstrangeira INT,
    data DATE,
    FOREIGN KEY (chaveEstrangeira) REFERENCES clientes(chave)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);
```

</details>