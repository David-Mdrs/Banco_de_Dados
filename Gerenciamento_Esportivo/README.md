# ⚽ Modelo de Entidade e Relacionamento - Gerenciamento Esportivo

Considere o seguinte conjunto de requisitos e construa o MER correspondente ao banco
de dados relativo ao universo de um banco de dados referente à jogos de Futebol. É
importante que seja observada a cardinalidade e os limites dos relacionamentos, assim
como os atributos de cada entidade e dos relacionamentos.

Deseja-se modelar um banco de dados para gerar informações relativas à um jogo de futebol. Neste
banco temos times que possuem torcida, técnico, presidente e jogadores.

Um time tem um registro na federação de times (número), nome e data de fundação.

Registram-se os campeonatos ganhos por um time (título, ano, nível (local, regional ou nacional).
Registram-se os jogos que um time realizou com informação sobre placar, renda, data e público
pagante.

Um jogo acontece em um estádio. Cada estádio possui localização, capacidade e nome. Um time
realiza seus treinos em um estádio em uma determinada data.

Registram-se dados (nome, idade, sexo e CPF) dos torcedores, técnicos, jogadores e presidentes.
Cada um destes tem seus relacionamentos com os times.