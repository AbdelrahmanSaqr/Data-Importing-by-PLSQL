DECLARE

CURSOR EMP_CUR IS
                    SELECT * FROM EMPLOYEES_TEMP;
              
--declare variable to store Job ID          
    V_JOB_ID VARCHAR(20);
--declare variable to store Location ID      
    V_LOCATION_ID  NUMBER(4);
--declare variable to store the Department ID       
    V_DEPARTMENT_ID NUMBER(4);

BEGIN

    FOR V_EMP_RECORD IN EMP_CUR LOOP
    
    --check if the Email is Valid
    IF INSTR(V_EMP_RECORD.EMAIL, '@') = 0 THEN
            
            CONTINUE;
    END IF;
    
    --check for Job ID
    BEGIN
                SELECT JOB_ID INTO V_JOB_ID FROM JOBS WHERE JOB_TITLE = V_EMP_RECORD.JOB_TITLE;

            EXCEPTION 
                WHEN NO_DATA_FOUND THEN
                
                    INSERT INTO JOBS (JOB_ID, JOB_TITLE) VALUES (SUBSTR(V_EMP_RECORD.JOB_TITLE,1,3), V_EMP_RECORD.JOB_TITLE);
                    SELECT JOB_ID INTO V_JOB_ID FROM JOBS WHERE JOB_TITLE = V_EMP_RECORD.JOB_TITLE;
    END;
     
    --check for Location ID
    BEGIN


                SELECT LOCATION_ID INTO V_LOCATION_ID FROM LOCATIONS WHERE CITY = V_EMP_RECORD.CITY;
                
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN
                
                 INSERT INTO LOCATIONS (CITY) VALUES (V_EMP_RECORD.CITY);
                SELECT LOCATION_ID INTO V_LOCATION_ID FROM LOCATIONS WHERE CITY = V_EMP_RECORD.CITY;
      

    END;                 
    
    --check for Department ID
    BEGIN
                SELECT DEPARTMENT_ID INTO V_DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = V_EMP_RECORD.DEPARTMENT_NAME;

            EXCEPTION 
                WHEN NO_DATA_FOUND THEN
                
                    INSERT INTO DEPARTMENTS (DEPARTMENT_NAME, LOCATION_ID) VALUES (V_EMP_RECORD.DEPARTMENT_NAME, V_LOCATION_ID);
                    SELECT DEPARTMENT_ID INTO V_DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = V_EMP_RECORD.DEPARTMENT_NAME; 
    END;    
        
    --insert to Employee table
    INSERT INTO EMPLOYEES (FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
    VALUES (V_EMP_RECORD.FIRST_NAME, V_EMP_RECORD.LAST_NAME, V_EMP_RECORD.EMAIL,to_date(V_EMP_RECORD.HIRE_DATE, 'dd-mm-yyyy'), V_JOB_ID, V_EMP_RECORD.SALARY, V_DEPARTMENT_ID );
    
   END LOOP;

END;
