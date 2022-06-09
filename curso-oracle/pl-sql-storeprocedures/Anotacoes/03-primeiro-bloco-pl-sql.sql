/*
    O PL/SQL é limitado a 3 blocos
    Declare => Definição dos componente de trabalho. (Variaveis, constantes e etc).
    
    --Possui o bloco de codigo dentro--
    Begin => Inicio do programa
    End => termino do programa    
*/

-- --Primeiro Bloco PL/SQL
SET SERVEROUTPUT ON;

DECLARE
    --Declaração de uma variavel
    v_ID number(5) := 1;
BEGIN
    
    -- ATRIBUIR VALOR A VARIAVEL    
    -- [ := ] => Atribui o valor a propriedade;    
   v_ID := 2107;    
    
    -- EXIBIR NA SAIDA A MENSAGEM / SEMELHANTE AO "Console.WriteLine()"
    DBMS_OUTPUT.PUT_LINE(v_ID);    
END;