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
				
				

INSERT INTO COUNTRIES (COUNTRY_ID,
					   COUNTRY_NAME,
					   REGION_ID)
			VALUES( 'KR',
					'Korea',
					 3);
SELECT * FROM COUNTRIES c ;



INSERT INTO LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY)
	   VALUES(LOCATIONS_SEQ.nextval, 'ANYANG SI', 13902, 'MANAN-GU' );
SELECT * FROM LOCATIONS ;

INSERT INTO DEPARTMENTS(DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID)
			VALUES(DEPARTMENTS_SEQ.nextval, '개발자', NULL, 3300);
SELECT * FROM DEPARTMENTS;



 							