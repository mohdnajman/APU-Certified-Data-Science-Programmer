/***********************************************************************

                 Name: Mohammad Najman Bin Md Noor
         Job position: Student
      Name of program: my_dm_sas_program.sas
          Description: Loan approval project
   Date first written: Tue,6-May-2023
    Date last updated: Tue,8-July-2023
  Project folder name: MYDMCLASS_MAY_2023
Permanent SAS library: MYLIB_DM

***********************************************************************/

/* CHAPTER 3: Data exploration and analysis 

   Step 1: display the two data dictionaries */
PROC CONTENTS DATA = MYLIB_DM.TRAINING_DS;

RUN;

PROC CONTENTS DATA = MYLIB_DM.TESTING_DS;

RUN;

/* CHAPTER 3.1: Analysis of variables found in the MYLIB_DM.TRAINING_DS 
           3.2: Univariate Analysis of variables 
           3.3: Univariate Analysis of the Categorical variable - GENDER 
           
           Univariate is the analysis of one variable at a time */

TITLE '3.3 SAS CODES to do Univariate Analysis of the Categorical variable: GENDER';

PROC FREQ DATA = MYLIB_DM.TRAINING_DS;

TABLE GENDER;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TRAINING_DS;

VBAR GENDER;

TITLE '3.3 SAS CODES to do Univariate Analysis of the Categorical variable: GENDER';

RUN;

/* CHAPTER 3.4: Univariate Analysis of the Categorical variable - LOAN_APPROVAL_STATUS */

TITLE '3.4 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_APPROVAL_STATUS';
FOOTNOTE 'Good Variable';

PROC FREQ DATA = MYLIB_DM.TRAINING_DS;

TABLE LOAN_APPROVAL_STATUS;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TRAINING_DS;

VBAR LOAN_APPROVAL_STATUS;

TITLE '3.4 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_APPROVAL_STATUS';

RUN;

/* CHAPTER 3.5: Univariate Analysis of the Categorical variable - LOAN_HISTORY */

TITLE '3.5 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_HISTORY';

PROC FREQ DATA = MYLIB_DM.TRAINING_DS;

TABLE LOAN_HISTORY;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TRAINING_DS;

VBAR LOAN_HISTORY;

TITLE '3.5 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_HISTORY';

RUN;

/* CHAPTER 3.6: Univariate Analysis of the Categorical variable - LOAN_LOCATION */

TITLE '3.6 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_LOCATION';
FOOTNOTE 'Good Variable';

PROC FREQ DATA = MYLIB_DM.TRAINING_DS;

TABLE LOAN_LOCATION;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TRAINING_DS;

VBAR LOAN_LOCATION;

TITLE '3.6 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_LOCATION';

RUN;

/* CHAPTER 3.7: Univariate Analysis of the Categorical variable - MARITAL_STATUS */

TITLE '3.7 SAS CODES to do Univariate Analysis of the Categorical variable: MARITAL_STATUS';

PROC FREQ DATA = MYLIB_DM.TRAINING_DS;

TABLE MARITAL_STATUS;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TRAINING_DS;

VBAR MARITAL_STATUS;

TITLE '3.7 SAS CODES to do Univariate Analysis of the Categorical variable: MARITAL_STATUS';

RUN;

/* CHAPTER 3.8: Univariate Analysis of the Categorical variable - LOAN_DURATION */

TITLE '3.8 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_DURATION';

PROC FREQ DATA = MYLIB_DM.TRAINING_DS;

TABLE LOAN_DURATION;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TRAINING_DS;

VBAR LOAN_DURATION;

TITLE '3.8 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_DURATION';

RUN;

/* CHAPTER 3.9: Univariate Analysis of the Categorical variable - LOAN_AMOUNT */

TITLE '3.9 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_AMOUNT';

PROC FREQ DATA = MYLIB_DM.TRAINING_DS;

TABLE LOAN_AMOUNT;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TRAINING_DS;

VBAR LOAN_AMOUNT;

TITLE '3.9 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_AMOUNT';

RUN;

/* CHAPTER 3.10: Univariate Analysis of the Categorical variable - CANDIDATE_INCOME */

TITLE '3.10 SAS CODES to do Univariate Analysis of the Categorical variable: CANDIDATE_INCOME';
FOOTNOTE 'Good Variable';

PROC FREQ DATA = MYLIB_DM.TRAINING_DS;

TABLE CANDIDATE_INCOME;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TRAINING_DS;

VBAR CANDIDATE_INCOME;

TITLE '3.10 SAS CODES to do Univariate Analysis of the Categorical variable: CANDIDATE_INCOME';

RUN;

/* CHAPTER 3.11: Univariate Analysis of the Categorical variable - LOAN_APPROVAL_STATUS */

TITLE '3.11 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_APPROVAL_STATUS';
FOOTNOTE 'Good Variable';

PROC FREQ DATA = MYLIB_DM.TESTING_DS;

TABLE LOAN_APPROVAL_STATUS;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TESTING_DS;

VBAR LOAN_APPROVAL_STATUS;

TITLE '3.11 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_APPROVAL_STATUS';

RUN;

/* CHAPTER 3.12: Univariate Analysis of the Categorical variable - LOAN_HISTORY */

TITLE '3.12 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_HISTORY';

PROC FREQ DATA = MYLIB_DM.TESTING_DS;

TABLE LOAN_HISTORY;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TESTING_DS;

VBAR LOAN_HISTORY;

TITLE '3.12 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_HISTORY';

RUN;

/* CHAPTER 3.13: Univariate Analysis of the Categorical variable - LOAN_LOCATION */

TITLE '3.13 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_LOCATION';
FOOTNOTE 'Good Variable';

PROC FREQ DATA = MYLIB_DM.TESTING_DS;

TABLE LOAN_LOCATION;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TESTING_DS;

VBAR LOAN_LOCATION;

TITLE '3.13 SAS CODES to do Univariate Analysis of the Categorical variable: LOAN_LOCATION';

RUN;

/* CHAPTER 3.14: Univariate Analysis of the Categorical variable - MARITAL_STATUS */

TITLE '3.14 SAS CODES to do Univariate Analysis of the Categorical variable: MARITAL_STATUS';
FOOTNOTE 'Good Variable';

PROC FREQ DATA = MYLIB_DM.TESTING_DS;

TABLE MARITAL_STATUS;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB_DM.TESTING_DS;

VBAR MARITAL_STATUS;

TITLE '3.14 SAS CODES to do Univariate Analysis of the Categorical variable: MARITAL_STATUS';

RUN;

/* TRAINING_DS variable value status */
/* MISSING: GENDER, LOAN_HISTORY, MARITAL_STATUS */

/* TESTING_DS variable value status */
/* MISSING: GENDER, LOAN_HISTORY */

/* STEP 3.15: Univariate Analysis of the continuous  or numerical variables */
/* STEP 3.15.1: Univariate Analysis of the continuous  or numerical variables - LOAN_AMOUNT */

TITLE 'STEP 3.15.1: Univariate Analysis of the continuous  or numerical variables - LOAN_AMOUNT';
FOOTNOTE '22 Observations with missing values';

PROC MEANS DATA = MYLIB_DM.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR LOAN_AMOUNT;

RUN;

/* STEP 3.15.2: Univariate Analysis of the continuous  or numerical variables - CANDIDATE_INCOME */

TITLE 'STEP 3.15.2: Univariate Analysis of the continuous  or numerical variables - CANDIDATE_INCOME';
FOOTNOTE 'Good variable';

PROC MEANS DATA = MYLIB_DM.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR CANDIDATE_INCOME;

RUN;

/* STEP 3.15.3: Univariate Analysis of the continuous  or numerical variables - LOAN_DURATION */

TITLE 'STEP 3.15.3: Univariate Analysis of the continuous  or numerical variables - LOAN_DURATION';
FOOTNOTE '14 Observations with missing values';

PROC MEANS DATA = MYLIB_DM.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR LOAN_DURATION;

RUN;

/* STEP 3.16.1: Univariate Analysis of the continuous  or numerical variables - LOAN_AMOUNT */

TITLE 'STEP 3.16.1: Univariate Analysis of the continuous  or numerical variables - LOAN_AMOUNT';
FOOTNOTE '5 Observations with missing values';

PROC MEANS DATA = MYLIB_DM.TESTING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR LOAN_AMOUNT;

RUN;

/* STEP 3.16.2: Univariate Analysis of the continuous  or numerical variables - LOAN_DURATION */

TITLE 'STEP 3.16.2: Univariate Analysis of the continuous  or numerical variables - LOAN_DURATION';
FOOTNOTE '6 Observations with missing values';

PROC MEANS DATA = MYLIB_DM.TESTING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR LOAN_DURATION;

RUN;

/* STEP 3.16.3: Univariate Analysis of the continuous  or numerical variables - CANDIDATE_INCOME */

TITLE 'STEP 3.16.3: Univariate Analysis of the continuous  or numerical variables - CANDIDATE_INCOME';
FOOTNOTE 'Good variable';

PROC MEANS DATA = MYLIB_DM.TESTING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR CANDIDATE_INCOME;

RUN;

/* Variable with missing value found in TRAINING_DS */
/* LOAN_DURATION & LOAN_AMOUNT */
/* Variable with missing value found in TESTING_DS */
/* LOAN_DURATION & LOAN_AMOUNT*/

