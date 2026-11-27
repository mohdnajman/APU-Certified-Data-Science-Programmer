/* cap input rows for the captured run */
options obs=100;

libname MYLIB_DM '.';

/* EMPLOYEE_FILE.txt and DEPARTMENT_FILE.txt from the course materials, inline */
data MYLIB_DM.EMPLOYEE_DS;
  infile datalines dsd dlm=',' truncover;
  length emp_name $ 10 emp_job $ 10;
  input emp_no emp_name $ emp_job $ emp_salary emp_comm dept_no;
datalines;
7369,SMITH,CLERK,800,.,20
7499,ALLEN,SALESMAN,1600,300,30
7521,WARD,SALESMAN,1250,500,30
7566,JONES,MANAGER,2975,.,20
7654,MARTIN,SALESMAN,1250,1400,30
7698,BLAKE,MANAGER,2850,.,30
7782,CLARK,MANAGER,2450,.,10
7788,SCOTT,ANALYST,3000,.,20
7839,KING,PRESIDENT,5000,.,10
7844,TURNER,SALESMAN,1500,0,30
7876,ADAMS,CLERK,1100,.,20
7900,JAMES,CLERK,950,.,30
7902,FORD,ANALYST,3000,.,20
7934,MILLER,CLERK,1300,.,10
;
run;

data MYLIB_DM.DEPARTMENT_DS;
  infile datalines dsd dlm=',' truncover;
  length dept_name $ 20 dept_loc $ 20;
  input dept_no dept_name $ dept_loc $;
datalines;
10,ACCOUNTING,NEW YORK
20,RESEARCH,DALLAS
30,SALES,CHICAGO
40,OPERATIONS,BOSTON
;
run;
