

--[ANOTAÇOES]--

-- Mudando variavel interna do oracle
alter session set "_ORACLE_SCRIPT" = true;

-- Criar Usuario no Oracle
create user cursoplsql IDENTIFIED BY cursoplsql default TABLESPACE users;

-- Dando permissao total ao usuario [criar tabelas, procedures e etc]
grant connect, resource TO cursoplsql;