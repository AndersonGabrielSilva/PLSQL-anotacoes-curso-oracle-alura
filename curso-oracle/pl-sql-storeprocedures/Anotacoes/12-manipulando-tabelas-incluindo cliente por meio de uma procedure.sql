-- Manipulando Tabelas
CREATE OR REPLACE PROCEDURE INCLUIR_CLIENTE
(P_ID CLIENTE.ID%TYPE,
P_RAZAO_SOCIAL IN CLIENTE.RAZAO_SOCIAL%TYPE,
P_CNPJ IN CLIENTE.CNPJ%TYPE,
P_SEGMERCADO_ID IN CLIENTE.SEQMERCADO_ID%TYPE,
P_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%TYPE)
IS
BEGIN
    INSERT INTO cliente (id,razao_social,cnpj,seqmercado_id,data_inclusao,faturamento_previsto,categoria)
              VALUES (P_ID,P_RAZAO_SOCIAL,P_CNPJ,P_SEGMERCADO_ID,SYSDATE,P_FATURAMENTO_PREVISTO,'0000');
    COMMIT;
END;

EXEC incluir_cliente(1,'SUPERMERCADO IJK','428.137.1365',2,90000);

SELECT*FROM CLIENTE;