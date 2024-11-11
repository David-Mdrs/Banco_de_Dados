# 🏥 Modelo de Entidade e Relacionamento - Clínica Oftalmológica

ㅤConsidere o seguinte conjunto de requisitos e construa o MER correspondente ao banco
de dados relativo ao universo de uma Clínica Oftalmológica. É importante que seja
observada a cardinalidade e os limites dos relacionamentos, assim como os atributos de
cada entidade e dos relacionamentos.

ㅤUma clínica oftalmológica deseja desenvolver um sistema para registrar o trabalho dos médicos,
controlar as consultas, os exames e os pagamentos (consultas e exames) dos pacientes
atendidos.

ㅤUma consulta envolve um médico da clínica e um paciente numa determinada data
(eventualmente o paciente pode se consultar com vários médicos ou com o mesmo médico em
diferentes datas).

ㅤO paciente pode ser submetido a exames em diferentes datas, que são classificados em 2 tipos:
exames laboratoriais (sangue ou urina) ou exames clínicos (pressão olhos ou acuidade visual),
estes últimos necessitando a presença de um médico da clínica. O paciente pode possuir ou não
um plano de saúde.

ㅤNesse sistema, cada exame deve possuir um nome e um código únicos. O paciente deve ser
identificado pelo seu CPF (Cadastro de Pessoa Física), o plano de saúde, por sua sigla e o médico
pelo seu CRM (número da inscrição no Conselho Regional de Medicina).
É importante destacar que o médico pode ter no máximo dois dependentes e isso deve constar no
sistema a ser desenvolvido.