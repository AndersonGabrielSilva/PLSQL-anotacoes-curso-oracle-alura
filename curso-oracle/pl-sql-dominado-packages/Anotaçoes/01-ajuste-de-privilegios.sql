/*
    - Dando as permissoes para o usuario user_app, ter acesso as procedures e funcoes,
      somente, e não permitindo que tenha acesso as tabelas.
      
    - Dando permissão somente para vizualizar a tabela mais não manipular.
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

-- Permissão de consulta na tabela cliente.
GRANT SELECT ON CLIENTE TO user_app;

