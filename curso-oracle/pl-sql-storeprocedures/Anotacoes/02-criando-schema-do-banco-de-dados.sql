
-- Criando Schema
CREATE TABLE SEG_MERCADO
(
    ID NUMBER(5),
    DESCRICAO VARCHAR2(100)
);

CREATE TABLE CLIENTE
(
    ID NUMBER(5),
    RAZAO_SOCIAL VARCHAR2(100),
    CNPJ VARCHAR2(20),
    SEQMERCADO_ID NUMBER(5),
    DATA_INCLUSAO DATE,
    FATURAMENTO_PREVISTO NUMBER(10,2),
    CATEGORIA VARCHAR2(20)
);

--

ALTER TABLE SEG_MERCADO ADD CONSTRAINT PK_SEGMERCADO PRIMARY KEY(ID);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE PRIMARY KEY (ID);
ALTER TABLE CLIENTE ADD CONSTRAINT FK_SEGMERCADO FOREIGN KEY (SEQMERCADO_ID) REFERENCES SEG_MERCADO (ID);