/*
    INTRODUÇÃO AS EXCEÇOES;
    É colocada antes do comando END do bloco do BEGIN;
    SINTAXE;
    
    EXCEPTION
    WHEN excecao_capturada THEN 
     DBMS_OUTPUT.PUT_LINE('mensagem de retorno');
    
    Quando a exception for do tipo da "excecao_capturada", faça isto .
    
    Documentação da oracle contendo todas as exceptions:
    https://docs.oracle.com/cd/E11882_01/timesten.112/e21639/exceptions.htm#TTPLS199
*/

SELECT*FROM CLIENTE;

--
EXEC incluir_cliente(7,'PANIFICADORA JOÃO','429134256',7,9500);

CREATE OR REPLACE PROCEDURE INCLUIR_CLIENTE
(P_ID CLIENTE.ID%TYPE,
P_RAZAO_SOCIAL IN CLIENTE.RAZAO_SOCIAL%TYPE,
P_CNPJ IN CLIENTE.CNPJ%TYPE,
P_SEGMERCADO_ID IN CLIENTE.SEQMERCADO_ID%TYPE,
P_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%TYPE)
IS
    v_CATEGORIA CLIENTE.CATEGORIA%TYPE;
    v_CNPJ CLIENTE.CNPJ%TYPE := P_CNPJ;
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
     DBMS_OUTPUT.PUT_LINE('CLIENTE JÁ CADASTRADO');
END;






