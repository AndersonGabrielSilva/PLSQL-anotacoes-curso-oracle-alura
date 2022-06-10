# Curso PLSQL Alura
Anotaçoes referente ao meu curso de PL/SQL da plataforma Alura 

## Curso: Oracle PL/SQL: Procedures, funções e exceções
  ### → Conteudo do Curso
  ####      → Aula 01 - Instalando e configurando ambiente
  - A instalar e configurar o Oracle
  - Como criar um novo usuário e dar privilégios de acessos
  - Como criar uma nova conexão usando este novo usuário
  - A criar as tabelas a serem usadas neste curso
  - Como criar um bloco simples de PL/SQL
  
  ####      → Aula 02 - Comandos de SQL no PL/SQL
  - A construir blocos de programas PL/SQL, para a inclusão de registros
  - A importância de encerrar a transação dentro do PL/SQL quando o mesmo manipular dados em tabela
  - A criar vários exemplos de PL/SQL, para alterar e excluir dados da tabela
  - A incluir funções dentro dos comandos PL/SQL
  - No caso, foi criada uma função para forçar o nome do segmento de mercado a ser todo em letras maiúsculas
  
  ####      → Aula 03 - Procedures e funções
  - A criar procedures
  - A modificar uma procedure, usando o comando CREATE OR REPLACE PROCEDURE
  - O conceito de funções, sua criação e execução
  
  ####      → Aula 04 - Condicionais e Parametros
  - Como usar o comando IF
  - Como passar e retornar valores através de uma procedure
  - Como usar uma procedure dentro de outra procedure
  
  ####      → Aula 05 - Extrutura de repetição
  - A usar o LOOP para repetir comandos até uma condição ser satisfeita
  - A usar o FOR
  - A nomear parâmetros
  
  ####      → Aula 06 - Acesso aos dados com Cursor
  - Como funciona um cursor
  - Que o cursor, sendo utilizado juntamente com um FOR, simplifica e muito o código PL/SQL

  ####      → Aula 07 - Tratando exceçoes
  - O conceito de exceções
  - Como tratar exceções com erros conhecidos, existentes na documentação da Oracle
  - Como tratar exceções usando a variável do tipo Exception
  - Como tratar erros inesperados
  - Como tratar erros de usuários



## Curso: Dominando package
 ### → Conteudo do Curso
  ####      → Aula 01 - Instalação e ambiente
  - A instalar e configurar o Oracle e o SQL Developer
  - A criar o ambiente do curso
  - Como damos acesso a objetos de um usuário para outro usuário
    
  ####      → Aula 02 - Sinônimos e dependências
  - Como funcionam os sinônimos
  - Como criar e utilizar sinônimos
  - O mapa de relacionamento entre as procedures e as funções que acessam a tabela Cliente
  - A hierarquia de acesso à tabela Cliente
  - Como montar uma estrutura de gerenciamento de dependências
  
  ####      → Aula 03 - Pacotes e sobrecargas
  - O conceito de packages
  - Como o package é dividido
  - Como criar um package
  - Como executar as rotinas do package
  - Como criar um sinônimo para o package
  - Como funciona a sobrecarga de rotinas
  - Como aplicar a sobrecarga de rotinas
  
  ####      → Aula 04 - Rotinas internas 
  - As rotinas internas
  - Como descobrir onde uma rotina é referenciada
  - Como apagar rotinas
  
  ####      → Aula 05 - Excecoes e constantes
  - Exceções
  - Como adicionar exceções
  - Como criar um acesso público
  - Como criar constantes
  - Como utilizar constantes
  - Como ver o conteúdo de uma constante
#### *Mensagem do curso*
  - Daqui para a frente, quando você desenvolver coisas em PSQL, a regra é empacotar. É manter dentro dos pacotes objetos que tenham um objetivo em comum. 
  Estando juntos, vamos oferecer um ganho na gerência para as aplicações. É essa a grande mensagem desse treinamento, em cima do pacote com PSQL.
