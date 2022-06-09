/*
    EXCE�OES N�O PREVISTAS.
    
    WHEN OTHERS -> - Captura qualquer exce��o � semelhante a classe base do C#
                     Exception.
                   - O Comando Others sempre tem que ser o ultimo a ser tratado,
                     a regra � semelhante ao 
    
    [SQL ERROR MESSAGE]
    SQLERRM() -> -Fun��o do oracle que captura a mensagem de erro no momento dentro 
                  do bloco exception.
                 - SQLERRM = SQL ERROR MESSAGE
*/

--testes
select*from Cliente order by id;
select*From seg_mercado;

-- Teste - For�ando erro n�o mapeado no EXCEPTION
EXECUTE INCLUIR_CLIENTE(10,'JO�O padeiro','42813729865',8,9000);



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

EXCEPTION
    WHEN dup_val_on_index THEN 
     raise_application_error('-20010','CLIENTE J� CADASTRADO');
    WHEN E_NULL THEN 
     raise_application_error('-20015','O ID N�O PODE SER NULO SEU MISERAVEL'); 
    
    -- Quando n�o cair em nenhuma das alternativas a cima ser� executado este bloco
    WHEN OTHERS THEN 
     raise_application_error('-20020','ERRO GEN�RICO: ' || SQLERRM()); 
END;





