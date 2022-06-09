
-- O Oracle � case sensitive nas buscas
/*
    � uma boa pratica no banco oracle, semple padronizar o tipo de dado que ser� gravado
    no oracle, por exemplo:
    Ou tudo maicula, ou tudo minusculo.
*/


DECLARE    
    V_ID SEG_MERCADO.ID%TYPE := 3;
    V_DESCRICAO SEG_MERCADO.DESCRICAO%TYPE  := 'Atacado';    
BEGIN
    
    INSERT INTO SEG_MERCADO (ID,DESCRICAO) VALUES (V_ID,UPPER(V_DESCRICAO));
    COMMIT;
END;
