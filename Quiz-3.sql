--1. EMPLOYEES 테이블과 JOB_HISTORY 테이블을 조인하여 각 직원의 이름 (FIRST_NAME 및 LAST_NAME)을 조회하세요.
SELECT
	FIRST_NAME,
	LAST_NAME
FROM
	EMPLOYEES e
JOIN JOB_HISTORY jh ON
	e.JOB_ID = jh.JOB_ID;


--2. JOBS 테이블과 EMPLOYEES 테이블을 조인하여 각 직원의 이름 (FIRST_NAME 및 LAST_NAME)과 해당 직원의 직무 타이틀 (JOB_TITLE)을 조회하세요.
SELECT
	FIRST_NAME || LAST_NAME,
	j.JOB_TITLE
FROM
	JOBS j
JOIN EMPLOYEES e ON
	e.JOB_ID = j.JOB_ID ;


--3.  EMPLOYEES 테이블과 DEPARTMENTS 테이블을 조인하여 각 직원의 이름 (FIRST_NAME 및 LAST_NAME)과 해당 직원이 속한 부서의 위치 (LOCATION_ID)를 조회하세요.
SELECT
	FIRST_NAME,
	LAST_NAME,
	d.LOCATION_ID
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID;


--4.  EMPLOYEES 테이블과 DEPARTMENTS 테이블을 조인하여 각 직원의 이름 (FIRST_NAME 및 LAST_NAME) 및 해당 부서의 이름 (DEPARTMENT_NAME)을 조회하되, DEPARTMENT_ID가 50 또는 80인 직원만 조회하세요.
SELECT
	FIRST_NAME,
	LAST_NAME,
	DEPARTMENT_NAME
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE
	d.DEPARTMENT_ID IN(50, 80);


--5.  EMPLOYEES 테이블과 JOBS 테이블을 조인하여 각 직원의 이름 (FIRST_NAME 및 LAST_NAME) 및 해당 직무의 최소 급여 (MIN_SALARY)을 조회하되, 최소 급여가 3000 이상인 직무만 조회하세요.
SELECT
	FIRST_NAME,
	LAST_NAME,
	j.MIN_SALARY
FROM
	EMPLOYEES e
JOIN JOBS j ON
	e.JOB_ID = j.JOB_ID
WHERE
	j.MIN_SALARY >= 3000;


--6. EMPLOYEES 테이블과 DEPARTMENTS 테이블을 조인하여 부서 이름 (DEPARTMENT_NAME) 및 해당 부서의 관리자의 이름 (MANAGER_ID)을 조회하되, 부서 이름이 'Sales' 이거나 관리자의 이름이 'Steven King'인 데이터만 조회하세요.
SELECT
	FIRST_NAME,
	LAST_NAME ,
	DEPARTMENT_NAME,
	e.MANAGER_ID
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE
	d.DEPARTMENT_NAME = 'Sales'
	OR (e.FIRST_NAME = 'Steven'
		AND e.LAST_NAME = 'King');
	
	
--7. EMPLOYEES 테이블과 JOB_HISTORY 테이블을 조인하여 각 직원의 이름 (FIRST_NAME 및 LAST_NAME) 및 해당 직무 이력의 시작일 (START_DATE)을 조회하되, 직무 이력의 시작일이 2005-01-01 이후이거나 직원의 이름이 'Steven'으로 시작하는 데이터만 조회하세요.
SELECT
	e.FIRST_NAME,
	e.LAST_NAME,
	jh.START_DATE
FROM
	EMPLOYEES e
LEFT JOIN JOB_HISTORY jh ON
	e.EMPLOYEE_ID = jh.EMPLOYEE_ID
WHERE
	jh.START_DATE > '2005-01-01'
	OR FIRST_NAME LIKE 'Steven%';


--8. EMPLOYEES, DEPARTMENTS, 및 LOCATIONS 테이블을 사용하여 각 직원의 이름 (FIRST_NAME 및 LAST_NAME), 부서 이름 (DEPARTMENT_NAME), 그리고 해당 부서의 위치 (CITY)를 조회하세요.
SELECT
	e.FIRST_NAME,
	e.LAST_NAME,
	DEPARTMENT_NAME ,
	CITY
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN LOCATIONS l ON
	d.LOCATION_ID = l.LOCATION_ID ;


--9. EMPLOYEES, JOBS, 그리고 DEPARTMENTS 테이블을 사용하여 직무 (JOB_ID)가 'IT_PROG'이고 해당 직무를 수행하는 직원의 이름 (FIRST_NAME 및 LAST_NAME), 직무 (JOB_TITLE), 부서 이름 (DEPARTMENT_NAME)을 조회하세요.
SELECT
	FIRST_NAME,
	LAST_NAME,
	j.JOB_TITLE ,
	j.JOB_ID
FROM
	EMPLOYEES e
JOIN JOBS j ON
	e.JOB_ID = j.JOB_ID
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE
	j.JOB_ID = 'IT_PROG';


--10. EMPLOYEES, JOBS, 그리고 DEPARTMENTS, LOCAIONTS 테이블을 사용하여 직무 (JOB_ID)가 'SA_MAN'이거나 'AD_VP'이며 
--해당 부서의 위치 (CITY)가 'Oxford'인 직원의 이름 (FIRST_NAME 및 LAST_NAME), 직무 (JOB_TITLE), 부서 이름 (DEPARTMENT_NAME), 그리고 부서 위치 (CITY)를 조회하세요.
SELECT
	FIRST_NAME,
	LAST_NAME,
	j.JOB_TITLE,
	d.DEPARTMENT_NAME,
	l.CITY
FROM
	EMPLOYEES e
JOIN JOBS j ON
	e.JOB_ID = j.JOB_ID
JOIN DEPARTMENTS d ON
	d.DEPARTMENT_ID = e.DEPARTMENT_ID
JOIN LOCATIONS l ON
	d.LOCATION_ID = l.LOCATION_ID
WHERE
	j.JOB_ID IN ('SA_MAN', 'AD_VP')
	AND l.CITY = 'Oxford';


--11. EMPLOYEES, DEPARTMENTS, 및 JOBS 테이블을 사용하여 각 부서의 평균 월급(SALARY)을 조회하세요.
SELECT
	DEPARTMENT_NAME,
	AVG(SALARY)
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN JOBS j ON
	e.JOB_ID = j.JOB_ID
GROUP BY
	DEPARTMENT_NAME;


--12. EMPLOYEES, JOBS, 및 DEPARTMENTS 테이블을 사용하여 각 직무 (JOB_TITLE)의 평균 월급(SALARY)을 조회하세요.
SELECT
	j.JOB_TITLE,
	AVG(SALARY)
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN JOBS j ON
	e.JOB_ID = j.JOB_ID
GROUP BY
	j.JOB_TITLE;


--13. EMPLOYEES, DEPARTMENTS, 및 LOCATIONS 테이블을 사용하여 각 부서의 위치 (CITY)별로 직원 수를 조회하세요.
SELECT
	l.CITY,
	COUNT(*)
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN LOCATIONS l ON
	d.LOCATION_ID = l.LOCATION_ID
GROUP BY
	l.CITY ;


-- 부서 이름 (DEPARTMENT_NAME) 및 해당 부서의 관리자의 이름 (MANAGER_ID)을 조회하되,
-- 부서 이름이 'Sales' 이거나 관리자의 이름이 'Steven King'인 데이터만 조회하세요
SELECT
	*
FROM
	DEPARTMENTS d ;

SELECT
	*
FROM
	EMPLOYEES e ;

SELECT
	e.FIRST_NAME,
	e.LAST_NAME ,
	d.DEPARTMENT_NAME
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.EMPLOYEE_ID = d.MANAGER_ID
	--GROUP BY d.DEPARTMENT_NAME
WHERE
	DEPARTMENT_NAME = 'Sales'
	OR (e.FIRST_NAME = 'Steven'
		AND e.LAST_NAME = 'King');

