/*
    TRATAMENTO DE EXCEÇOES NÃO CADASTRADAS 

    PARA CAPTURAR UMA EXCEPTION NÃO MAPEADA PELO ORACLE:
    - será necessario criar uma variavel do tipo exception,
    e utilizando o comando:
        PRAGMA EXCEPTION_INIT (variavel_da_exception, codigo_capturado);
        
    - Com o comando "PRAGMA EXCEPTION_INIT" vinculamos o codigo de erro, com
      a variavel do tipo exception, sendo possivel assim capturar ela no bloco 
      de exception.
    
*/
EXECUTE INCLUIR_CLIENTE(NULL,'JOÃO AÇOGUE','165411621',3,9000);


SELECT*FROM CLIENTE;

-- ATUALIZANDO PROCEDURE 
CREATE OR REPLACE PROCEDURE INCLUIR_CLIENTE
(P_ID CLIENTE.ID%TYPE,
P_RAZAO_SOCIAL IN CLIENTE.RAZAO_SOCIAL%TYPE,
P_CNPJ IN CLIENTE.CNPJ%TYPE,
P_SEGMERCADO_ID IN CLIENTE.SEQMERCADO_ID%TYPE,
P_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%TYPE)
IS
    v_CATEGORIA CLIENTE.CATEGORIA%TYPE;
    v_CNPJ CLIENTE.CNPJ%TYPE := P_CNPJ;
    
    --VARIAVEL DO EXCEPTION
    E_NULL EXCEPTION;
    PRAGMA EXCEPTION_INIT (E_NULL,-1400); -- VINCULANDO A EXCEPTION AO ERRO -1400        
BEGIN    
    v_CATEGORIA := categoria_cliente(P_FATURAMENTO_PREVISTO);    
    FORMAT_CNPJ(v_CNPJ);
    INSERT INTO cliente (id,razao_social,cnpj,seqmercado_id,data_inclusao,faturamento_previsto,categoria)
              VALUES (P_ID,P_RAZAO_SOCIAL,v_CNPJ,P_SEGMERCADO_ID,SYSDATE,P_FATURAMENTO_PREVISTO,v_CATEGORIA);              
    COMMIT;

/* Quando ocorrer algum erro durante o procedimento o fluxo 
   irá pular para está linha.
   É semelhante ao CATCH das linguagens de programação
*/
EXCEPTION
    WHEN dup_val_on_index THEN 
     raise_application_error('-20010','CLIENTE JÁ CADASTRADO');
    WHEN E_NULL THEN 
     raise_application_error('-20015','O ID NÃO PODE SER NULO SEU MISERAVEL');     
END;

