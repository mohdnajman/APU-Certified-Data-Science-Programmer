/***********************************************************************

                 Name: Mohammad Najman Bin Md Noor
         Job position: Student
      Name of program: my_sas_program.sas
          Description: Programming tutorial
   Date first written: Tue,23-May-2023
    Date last updated: Tue,1-June-2023
  Project folder name: MYDMCLASS_MAY_2023
Permanent SAS library: MYLIB_DM

***********************************************************************/


/***********************************************************************
QUESTION 1.1

List employee number and employee name from the datasets given.

ANSWER:
***********************************************************************/

TITLE1 'List employee number and employee name from the datasets given';
TITLE2 'APU,TPM';
FOOTNOTE '------------------End--------------------';

PROC SQL;

SELECT 	e.emp_no Label = 'Employee Number',
		e.emp_name Label = 'Name'
FROM MYLIB_DM.EMPLOYEE_DS e;

QUIT;

/***********************************************************************
QUESTION 1.2

List department number and department name from the datasets given.

ANSWER:
***********************************************************************/


TITLE1 'List department number and department name from the datasets given';
FOOTNOTE '------------------End--------------------';

PROC SQL;

SELECT 	d.dept_no Label = 'Department Number',
		d.dept_name Label = 'Name'
FROM MYLIB_DM.DEPARTMENT_DS d;

QUIT;

/***********************************************************************
QUESTION 1.3 

List the details of all employees found in the datasets given.

ANSWER:
***********************************************************************/

TITLE1 'List the details of all employees found in the datasets give';
FOOTNOTE '------------------End--------------------';

PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e;

QUIT;

/***********************************************************************
QUESTION 2.1

List the details of all managers or salesmen whose salary is between 1500 and 2500.

ANSWER:
***********************************************************************/

TITLE1 'List the details of all managers or salesmen whose salary is between 1500 and 2500.';
FOOTNOTE '------------------End--------------------';

PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE 	( e.emp_job IN ('MANAGER','SALESMAN')) AND
		( e.emp_salary BETWEEN 1500 and 2500);

QUIT;

/***********************************************************************
QUESTION 2.2

List the employee number and name of all salesmen who work in the department 
number 30 and their salary is greater than or equal to 1500.


ANSWER:
***********************************************************************/

TITLE1 'List the employee number and name of all salesmen who work in the department number 30 and';
TITLE2 'their salary is greater than or equal to 1500';

PROC SQL;

SELECT 	e.emp_no Label = 'Employee Number',
		e.emp_name Label = 'Name'
		
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE 	(e.emp_job eq 'SALESMAN') and
		(e.dept_no eq 30) AND
		(e.emp_salary ge 1500);
		
QUIT;

/***********************************************************************
QUESTION 3.0
List the employee's name whose name starts with the letter ‘J’

ANSWER:
***********************************************************************/

PROC SQL;

SELECT e.emp_name
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE e.emp_name LIKE 'J%';

QUIT;



TITLE1 'List the employees name whose name starts with the letter [J]';

PROC SQL;

SELECT s.emp_name Label = 'Employee Name'
FROM MYLIB_DM.EMPLOYEE_DS s
WHERE (s.emp_name LIKE 'A%');

QUIT;

/****************************************************************
QUESTION 3.1
List the employee’s name whose name ends with the letter ‘R’

ANSWER:
****************************************************************/

PROC SQL;

SELECT s.emp_name Label = 'Employee Name'
FROM MYLIB_DM.EMPLOYEE_DS s
WHERE (s.emp_name LIKE '%R');

QUIT;

/****************************************************************
QUESTION 3.2
List the employee name whose name starts with the alphabet ‘M’ and ends with the alphabet ‘N’

ANSWER:
****************************************************************/

PROC SQL;

SELECT s.emp_name Label = 'Employee Name'
FROM MYLIB_DM.EMPLOYEE_DS s
WHERE (s.emp_name LIKE 'M%N');

QUIT;

/****************************************************************
QUESTION 3.3
List the employee name whose name starts with the alphabet, either ‘K’ or ‘G’

ANSWER:
****************************************************************/

PROC SQL;

SELECT s.emp_name Label = 'Employee Name'
FROM MYLIB_DM.EMPLOYEE_DS s
WHERE (s.emp_name LIKE 'K%') OR (s.emp_name LIKE 'G%');

QUIT;

/****************************************************************
QUESTION 3.4
List the employee name whose name has the alphabet ‘IN’ (in anywhere).

ANSWER:
****************************************************************/

PROC SQL;

SELECT s.emp_name Label = 'Employee Name'
FROM MYLIB_DM.EMPLOYEE_DS s
WHERE (s.emp_name LIKE '%SC%');

QUIT;

/****************************************************************
QUESTION 4.1

List the employee details in descending order of their salary.

ANSWER:
****************************************************************/

PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS
ORDER BY emp_salary DESC;

QUIT;

/****************************************************************
QUESTION 4.2

List the employee details in ascending order of their names. Show employee number, name, and salary.

ANSWER:

****************************************************************/

PROC SQL;

SELECT 	emp_no Label = 'Employee Number',
		emp_name Label = 'Employee Name',
		emp_salary Label = 'Employee Salary'
FROM MYLIB_DM.EMPLOYEE_DS 
ORDER BY emp_name ASC;

QUIT;

/****************************************************************
QUESTION 5.1

Find out how many salesmen are working in department number 30.

ANSWER:
****************************************************************/

QUIT;
PROC SQL;

SELECT COUNT(*) Label = 'Number of Salesman'
FROM MYLIB_DM.EMPLOYEE_DS
WHERE (emp_job eq 'SALESMAN') and (dept_no eq 30);

QUIT;

/****************************************************************
QUESTION 5.2

Find out the highest and lowest salaries.

ANSWER:
****************************************************************/

PROC SQL;

SELECT 	MAX(emp_salary) Label = 'Highest salary',
		MIN(emp_salary) Label = 'Lowest salary'
FROM MYLIB_DM.EMPLOYEE_DS;

QUIT;

/****************************************************************
QUESTION 5.3

Find out the sum of the salaries of the employees who work in department numbers 10 or 20 and whose salaries are greater than or equal to $3000.

ANSWER:
****************************************************************/

PROC SQL;

SELECT SUM(emp_salary) Label = 'Total salary' /* the sum is an aggregate function */
FROM MYLIB_DM.EMPLOYEE_DS
WHERE (dept_no IN (10,20)) AND (emp_salary ge 3000);

QUIT;

/***********************************************************************
QUESTION 5.4

Count the number of staff whose salaries are between 1200 and 1500.

ANSWER:
***********************************************************************/

PROC SQL;

SELECT COUNT(*) Label = 'Number of staff whose salaries are between 1200 and 1500'
FROM MYLIB_DM.EMPLOYEE_DS
WHERE (emp_salary BETWEEN 1200 AND 1500);

QUIT;

/***********************************************************************
Find the name, salary, job position and department name of Salesmen, 
who work at ‘CHICAGO’.

ANSWER:
***********************************************************************/

TITLE1 'Find the name, salary, job position and department name of Salesmen, who work at ‘CHICAGO’';

PROC SQL;

SELECT 	e.emp_name Label = 'Employee Name',
		e.emp_salary Label = 'Employee Salary',
		e.emp_job Label = 'Job Position',
		d.dept_name Label = 'Department Name',
		d.dept_loc Label = 'Location'
FROM MYLIB_DM.EMPLOYEE_DS e, MYLIB_DM.DEPARTMENT_DS d
WHERE 	(d.dept_no eq d.dept_no) AND 
		(e.emp_job eq 'SALESMAN') AND
		(d.dept_loc eq 'CHICAGO');

QUIT;

/***********************************************************************
Find the employees (name, number, department name, salary) who earn 
more than ‘JONES’.

ANSWER:
***********************************************************************/

PROC SQL;

SELECT e.emp_name Label = 'Employee Name',
		 e.emp_no Label = 'Number',
	  d.dept_name Label = 'Department Name',
	 e.emp_salary Label = 'Salary'
FROM MYLIB_DM.EMPLOYEE_DS e, MYLIB_DM.DEPARTMENT_DS d
WHERE(	e.dept_no eq d.dept_no	) AND
	 ( e.emp_name ne 'JONES' ) AND
e.emp_salary ge	( SELECT e.emp_salary Label = 'Salary of Ms. Jones'
				FROM MYLIB_DM.EMPLOYEE_DS e
				WHERE (e.emp_name eq 'JONES' ) );

QUIT;


/***********************************************************************
QUESTION 7.1

List the department number, sum of salaries of all staff of each 
department and number of employees working in each department.

ANSWER:
***********************************************************************/

PROC SQL;

SELECT e.dept_no Label = 'Department Number',
SUM(e.emp_salary) Label = 'Total Salary'
FROM MYLIB_DM.EMPLOYEE_DS e
GROUP BY e.dept_no;

QUIT;

/****************************************************************
QUESTION 7.2

List the department number, which has a minimum of four employees.

ANSWER:
****************************************************************/

PROC SQL;

SELECT e.dept_no Label = 'Department Number',
		COUNT(*) Label = 'Number of Employees'
FROM MYLIB_DM.EMPLOYEE_DS e
GROUP BY e.dept_no
HAVING COUNT(*) ge 4;

QUIT;


/****************************************************************
QUESTION 7.3

List the department number, which has at least two clerks.

ANSWER:
****************************************************************/

PROC SQL;

SELECT e.dept_no Label = 'Department Number',
		COUNT(*) Label = 'Number of Employees'
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE (e.emp_job eq 'CLERK')
GROUP BY e.dept_no
HAVING COUNT(*) ge 2;

QUIT;


/****************************************************************
QUESTION 8.1

List the name and job of employees who have the same job as ‘JONES’.

ANSWER:
****************************************************************/

PROC SQL;

SELECT e.emp_name Label = 'Employee Name',
	    e.emp_job Label = 'Job'
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE ( e.emp_name ne 'JONES' ) AND 
		e.emp_job eq ( SELECT e.emp_job Label = 'Job of Ms. Jones'
					   FROM MYLIB_DM.EMPLOYEE_DS e
					   WHERE ( e.emp_name eq 'JONES' ) ); /* sub-program to find Ms. Jones job */

QUIT;


/****************************************************************
QUESTION 8.2 

Find the staff-name who receives the highest salary.

ANSWER:
****************************************************************/

PROC SQL;

SELECT e.emp_name Label = 'Employee Name'
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE e.emp_salary eq
( SELECT MAX(e.emp_salary) Label = 'Salary'
FROM MYLIB_DM.EMPLOYEE_DS e );

QUIT;


/***********************************************************************
QUESTION 8.3   

List the name, job, and salary of employees who have the same job 
and salary as ‘FORD.’

ANSWER:
***********************************************************************/

PROC SQL;

/* sub-program to list everyones name, job and salary */
SELECT e.emp_name Label = 'Employee Name',
	    e.emp_job Label = 'Employee Job',
	 e.emp_salary Label = 'Employee Salary'
FROM MYLIB_DM.EMPLOYEE_DS e

/* sub-program to find Mr. Ford's Salary */
WHERE	 e.emp_salary eq ( SELECT e.emp_salary Label = 'Mr. Ford Salary'
							  FROM MYLIB_DM.EMPLOYEE_DS e
							  WHERE ( e.emp_name eq 'FORD' ) ) AND

/* sub-program to find Mr. Ford's Job */
		e.emp_job eq ( SELECT e.emp_job Label = 'Mr. Ford Job'
					  FROM MYLIB_DM.EMPLOYEE_DS e
					  WHERE ( e.emp_name eq 'FORD' ) ) ;

QUIT;


/***********************************************************************
QUESTION 8.4

List the name, job, and department of employee, whose salary is greater 
than or equal to ‘FORD’.

ANSWER:
***********************************************************************/

PROC SQL;

/* sub-program to list everyones name, job and salary */
SELECT e.emp_name Label = 'Employee Name',
	    e.emp_job Label = 'Employee Job',
	 d.dept_name Label = 'Employee Department'
FROM MYLIB_DM.EMPLOYEE_DS e, MYLIB_DM.DEPARTMENT_DS d
WHERE e.emp_salary ge
( SELECT e.emp_salary Label = 'Mr. Ford Salary'
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE ( e.emp_name eq 'FORD' ) );


QUIT;
/***********************************************************************
QUESTION 8.5

Find the employees located in Chicago and who have the same job as 
Allen. List the results in an alphabetical order by employee name.

ANSWER:
***********************************************************************/

PROC SQL;

SELECT *
FROM MYLIB_DM.EMPLOYEE_DS e
WHERE
( e.emp_name ne 'ALLEN' ) AND
e.dept_no eq ( SELECT d.dept_no Label = 'Department No'
			   FROM MYLIB_DM.DEPARTMENT_DS d
			   WHERE ( d.dept_loc eq 'CHICAGO' ) ) AND/* sub-program to find department no */

e.emp_job eq ( SELECT e.emp_job Label = 'Allens Job'
			   FROM MYLIB_DM.EMPLOYEE_DS e
			   WHERE ( e.emp_name eq 'ALLEN' ) )/* sub-program to find Allen's job */

ORDER BY e.emp_name ASC;

QUIT;

