SELECT * FROM EMPLOYEES e ;


INSERT INTO EMPLOYEES e VALUES(EMPLOYEES_SEQ.nextval,
								'길동',
								'홍',
								'TEST',
								'010-5096-2429',
								sysdate,
								'IT_PROG',
								10000,
								0.5,
								NULL,
								60);
								
							
							
							 
-- EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID 만 넣기
INSERT INTO EMPLOYEES (EMPLOYEE_ID,
						 LAST_NAME,
						 EMAIL,
						 HIRE_DATE,
						 JOB_ID)
			VALUES(EMPLOYEES_SEQ.nextval,
					'은식',
					'test@test.com',
					sysdate,
					'IT_PROG');




 							