/***********************************************************************
QUESTION 9.2

Increase all managers’ salary by 10%.

ANSWER:
***********************************************************************/

/* STEP 1: List all details of managers */
PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE ( e.emp_job eq 'MANAGER' );

QUIT;

/* STEP 2: Create backup */
PROC SQL;

CREATE TABLE MYLIB_DM.EMPLOYEE_BK_DS AS
SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e;

QUIT;

/* STEP 2: Increase all manager's salary by 10% */
PROC SQL;

UPDATE MYLIB_DM.EMPLOYEE_DS e
SET emp_salary = ( emp_salary * 1.1 )
WHERE ( emp_job eq 'MANAGER' );

QUIT;


/* STEP 4: Check the result */
PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE ( e.emp_job eq 'MANAGER');

QUIT;

/***********************************************************************
QUESTION 9.3

Increase staff salary by 10% for those who are working in the ‘NEW YORK’ 
department.

ANSWER:
***********************************************************************/

/* STEP 1: Find department no (PK) */
PROC SQL;

SELECT d.dept_no Label = 'Department Number'
FROM MYLIB_DM.DEPARTMENT_DS d
WHERE ( d.dept_loc eq 'NEW YORK' );

QUIT;

/*STEP 2: Find all employees who work in NY */
PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE ( e.dept_no eq 10 );

QUIT;

PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE ( e.dept_no eq ( SELECT d.dept_no Label = 'Department Number'
					   FROM MYLIB_DM.DEPARTMENT_DS d
					   WHERE ( d.dept_loc eq 'NEW YORK' ) ) );

QUIT;

/*STEP 3: Create backup */
PROC SQL;

CREATE TABLE MYLIB_DM.EMPLOYEE_BK_DS AS
SELECT *
FROM MYLIB_DM.EMPLOYEE_DS;

QUIT;

/* STEP 4: Create a big program */
PROC SQL;

UPDATE MYLIB_DM.EMPLOYEE_DS
SET emp_salary = ( emp_salary * 1.1 )
WHERE ( dept_no eq ( SELECT d.dept_no Label = 'Department Number'
					   FROM MYLIB_DM.DEPARTMENT_DS d
					   WHERE ( d.dept_loc eq 'NEW YORK' ) ) ); 

QUIT;


/* Restore the dataset from backup copy of the dataset */
PROC SQL;

CREATE TABLE MYLIB_DM.EMPLOYEE_DS AS
SELECT *
FROM MYLIB_DM.EMPLOYEE_BK_DS e;

QUIT;

/***********************************************************************
Question 10.1

Add a new department to the DEPARTMENT_DS. 
Details: 
(dept_no = 50; dept_name=’Physics’; 	
dept_location = ‘Kuala Lumpur’)

Answer:
***********************************************************************/

PROC SQL;

INSERT INTO MYLIB_DM.DEPARTMENT_DS(dept_loc,dept_name,dept_no)
VALUES('Kuala Lumpur','Physics',50);

QUIT;

/***********************************************************************
QUESTION 11.1

Delete the employee whose name is ‘JONES’.

ANSWER:
***********************************************************************/

/* STEP 1: Find the details of Jones */
PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE ( e.emp_name eq 'JONES');

QUIT;

/* STEP 2: Create backup */
PROC SQL;

CREATE TABLE MYLIB_DM.EMPLOYEE_BK_DS AS
SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e;

QUIT;

/* STEP 3: Delete the details of Jones */
PROC SQL;

DELETE
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE ( e.emp_name eq 'JONES');

QUIT;

/***********************************************************************
QUESTION 11.2

Delete the employees whose salary is between 1200 and 1500.

ANSWER:
***********************************************************************/

/* Find which employee has salary 1200-1500 */
PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS 
WHERE ( emp_salary BETWEEN 1200 AND 1500 );

QUIT;

/* Create backup */
PROC SQL;

CREATE TABLE MYLIB_DM.EMPLOYEE_BK_DS AS
SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e;

QUIT;

/* Delete */
PROC SQL;

DELETE
FROM MYLIB_DM.EMPLOYEE_DS
WHERE ( emp_salary BETWEEN 1200 AND 1500 );

QUIT;


/***********************************************************************
QUESTION 11.3  

Delete the employees who work in department number 10.

ANSWER:
***********************************************************************/

/* Find the employees that work in dept 10 */
PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS
WHERE ( dept_no eq 10 );

QUIT;

/* Create backup */
PROC SQL;

CREATE TABLE MYLIB_DM.EMPLOYEE_BK_DS AS
SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e;

QUIT;

/* Delete */
PROC SQL;

DELETE
FROM MYLIB_DM.EMPLOYEE_DS
WHERE ( dept_no eq 10 );

QUIT;

/***********************************************************************
QUESTION 11.4

Delete the employees who work in CHICAGO.

ANSWER:
***********************************************************************/

/* Find CHICAGO department number */
PROC SQL;

SELECT dept_no Label = 'Department Number'
FROM MYLIB_DM.DEPARTMENT_DS
WHERE ( dept_loc eq 'CHICAGO' );

QUIT;

/* Find employee who works in CHICAGO department */
PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS
WHERE ( dept_no eq ( SELECT dept_no Label = 'Department Number'
				   FROM MYLIB_DM.DEPARTMENT_DS
				   WHERE ( dept_loc eq 'CHICAGO' ) ) );

QUIT;

PROC SQL;

DELETE
FROM MYLIB_DM.EMPLOYEE_DS
WHERE ( dept_no eq ( SELECT dept_no Label = 'Department Number'
				   FROM MYLIB_DM.DEPARTMENT_DS
				   WHERE ( dept_loc eq 'CHICAGO' ) ) );
				   
QUIT;

/***********************************************************************
QUESTION 11.5
 
Delete all employees’ details without deleting the data dictionary 
(meta data) of the EMPLOYEE_DS dataset. 

ANSWER:
***********************************************************************/