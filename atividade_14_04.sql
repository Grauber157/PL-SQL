--SELECT * FROM ALUNO
SET SERVEROUTPUT ON
DECLARE
    rec_aluno ALUNO%ROWTYPE;
    
    PROCEDURE ESCREVER(p_id_aluno IN NUMBER, p_nome_aluno IN VARCHAR2) IS
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('ID Aluno: ' || p_id_aluno);
        DBMS_OUTPUT.PUT_LINE('Nome Aluno: ' || p_nome_aluno);
    END ESCREVER;
        
BEGIN

    FOR rec_aluno IN (SELECT id_aluno, nome_aluno FROM ALUNO) LOOP
    
        ESCREVER(rec_aluno.id_aluno, rec_aluno.nome_aluno);    

    END LOOP;

END;