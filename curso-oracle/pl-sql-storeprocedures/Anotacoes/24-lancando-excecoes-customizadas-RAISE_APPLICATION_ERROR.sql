/*
 [raise_application_error] 
    - � uma procedure interna do oracle,
    que nos permite lan�ar exce�oes customizadas.
    - Recebe dois parametroS:
    1- C�digo de erro. (os codigos disponiveis v�o de -20000 at� -20999).
    2- Mensagem personalizada 
*/

EXEC incluir_cliente(7,'PANIFICADORA JO�O','429134256',7,9500);

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
   ir� pular para est� linha.
   � semelhante ao CATCH das linguagens de programa��o
*/
EXCEPTION
    WHEN dup_val_on_index THEN 
     raise_application_error('-20010','CLIENTE J� CADASTRADO');
END;

execute raise_application_error()