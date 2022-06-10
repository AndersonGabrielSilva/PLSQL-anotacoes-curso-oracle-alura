/*
    - Dando as permissoes para o usuario user_app, ter acesso as procedures e funcoes,
      somente, e n�o permitindo que tenha acesso as tabelas.
      
    - Dando permiss�o somente para vizualizar a tabela mais n�o manipular.
*/

--Permisoes para executar as procedures
GRANT EXECUTE ON ATUALIZAR_CLI_SEG_MERCADO TO user_app;
GRANT EXECUTE ON ATUALIZAR_FATURAMENTO_PREVISTO TO user_app;
GRANT EXECUTE ON EXCLUIR_CLIENTE TO user_app;
GRANT EXECUTE ON INCLUIR_CLIENTE TO user_app;
GRANT EXECUTE ON INCLUIR_SEGMERCADO TO user_app;

INSERT INTO CLIENTE(ID,RAZAO_SOCIAL) VALUES (5,'TESTE');
ROLLBACK;

SELECT*FROM CLIENTE;

-- Permiss�o de consulta na tabela cliente.
GRANT SELECT ON CLIENTE TO user_app;

