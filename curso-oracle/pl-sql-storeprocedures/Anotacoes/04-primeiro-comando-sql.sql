
--ALTERANDO PERMISSOES DO USUARIO "CURSOPLSQL"
ALTER USER CURSOPLSQL QUOTA UNLIMITED ON USERS;

--INSERT COMUM
INSERT INTO seg_mercado (id,descricao) VALUES (1,'Varejo');
SELECT* FROM SEG_MERCADO;
DELETE FROM SEG_MERCADO;



--INSERINDO DADOS COM PL/SQL
DECLARE 
    V_ID NUMBER(5) :=1;
    V_DESCRICAO VARCHAR2(200) := 'VAREJO'; 
BEGIN 
    INSERT INTO seg_mercado (id,descricao) VALUES (V_ID,v_DESCRICAO);
    COMMIT;
END;
