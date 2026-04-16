/*
CREATE TABLE PRODUTO (
    CODIGO NUMBER,
    CATEGORIA VARCHAR(10),
    VALOR NUMERIC(10,2)
);

INSERT INTO PRODUTO(CODIGO, CATEGORIA, VALOR) VALUES(1001, 'A', 7.55);
INSERT INTO PRODUTO(CODIGO, CATEGORIA, VALOR) VALUES(1002, 'B', 5.95);
INSERT INTO PRODUTO(CODIGO, CATEGORIA, VALOR) VALUES(1003, 'C', 3.45);
SELECT * FROM PRODUTO;
DELETE FROM PRODUTO WHERE valor = 3.97;
*/

SET SERVEROUTPUT ON
DECLARE 
    v_produto_rec PRODUTO%ROWTYPE;
    PROCEDURE REAJUSTE(p_codigo IN NUMBER, p_categoria IN VARCHAR, p_novo_valor IN NUMERIC) IS
    v_novo_valor NUMBER := p_novo_valor;
    BEGIN
    
        IF p_categoria = 'A' THEN
            DBMS_OUTPUT.PUT_LINE('=CATEGORIA: ' || p_categoria || '=');
            DBMS_OUTPUT.PUT_LINE('Valor Atual: ' || v_novo_valor);
            v_novo_valor := p_novo_valor*1.05;
            DBMS_OUTPUT.PUT_LINE('Novo Valor: ' || v_novo_valor);
            
        ELSIF p_categoria = 'B' THEN
            DBMS_OUTPUT.PUT_LINE('=CATEGORIA: ' || p_categoria || '=');
            DBMS_OUTPUT.PUT_LINE('Valor Atual: ' || v_novo_valor);
            v_novo_valor := p_novo_valor*1.1;
            DBMS_OUTPUT.PUT_LINE('Novo Valor: ' || v_novo_valor);
            
        ELSIF p_categoria = 'C' THEN
            DBMS_OUTPUT.PUT_LINE('=CATEGORIA: ' || p_categoria || '=');
            DBMS_OUTPUT.PUT_LINE('Valor Atual: ' || v_novo_valor);
            v_novo_valor := p_novo_valor*1.15;
            DBMS_OUTPUT.PUT_LINE('Novo Valor: ' || v_novo_valor);
        END IF;
        
        UPDATE PRODUTO 
        SET VALOR = v_novo_valor
        WHERE CODIGO = p_codigo;
        
    END REAJUSTE;
    
BEGIN

    FOR v_produto_rec IN (SELECT CODIGO, CATEGORIA, VALOR FROM PRODUTO) LOOP
        
        REAJUSTE(v_produto_rec.CODIGO, v_produto_rec.CATEGORIA, v_produto_rec.VALOR);
    
    END LOOP;
END;
