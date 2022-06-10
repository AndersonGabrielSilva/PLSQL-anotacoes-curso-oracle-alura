/*
    Dependencias
    
    - Para mapear todas as dependencias de uma tabela é necessario utilizar 
      um script que o proprio oracle disponibiliza, "utldtree".
    - Este script irá gerar tabelas, views e procedures para que possamos 
      realizar este mapeamento.
      
    - Para realizar o rastreamento é preciso execultar a procedure "deptree_fill";
     passando como parametro o tipo do alvo, o usuario dono, e o nome do objeto.
     deptree_fill(type,user,name_objeto);
     
    - Vizualizando o resultado:
    - Basta consultar a view "DEPTREE", com o seguinte comando
        SELECT nested_level, schema, type, name 
        FROM DEPTREE 
        ORDER BY SEQ#
        
    nested_level - É o nivel de profundidade em relação ao foco da analise.
    schema - 
    type - Tipo do objeto
    name - Nome do objeto
    
*/

--Tabela criada 
select*from DEPTREE_TEMPTAB;



SELECT nested_level, schema, type, name 
FROM DEPTREE 
ORDER BY SEQ#

EXECUTE deptree_fill('table','user_dev','cliente');