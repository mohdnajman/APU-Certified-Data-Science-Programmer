/* CHAPTER 4: Data Cleasing */
/* 4.1 Impute (cleanse) the Categorical variables found in the MYLIB_DM.TRAINING_DS */

/* 4.1.1 Impute (cleanse) the Categorical variable - GENDER */

TITLE '4.1.1 List the details of the applicants (observation) with missing values';

PROC SQL;

SELECT *
FROM MYLIB_DM.TRAINING_DS e
WHERE ( e.gender eq '' ) OR ( e.gender IS MISSING );

QUIT;

/* 4.1.2 Count the total number of missing values */

TITLE '4.1.1 List the details of the applicants (observation) with missing values';

PROC SQL;

SELECT COUNT(*) Label = 'Total of missing value'
FROM MYLIB_DM.TRAINING_DS e
WHERE ( e.gender eq '' ) OR ( e.gender IS MISSING );

QUIT;

/* 4.1.3 Store the statistics (gender vs counts) in a dataset */

TITLE '4.1.1 List the details of the applicants (observation) with missing values';

PROC SQL;

CREATE TABLE MYLIB_DM.TRAINING_GENDER_DS AS
SELECT e.gender AS gender,
	   COUNT(*) AS no_of_applicants
FROM MYLIB_DM.TRAINING_DS e
WHERE ( ( e.gender ne '' ) OR 
		( e.gender IS NOT MISSING ) )
GROUP BY e.gender;

QUIT;

/* 4.1.3.1 Make a backup copy of the ds */

PROC SQL;

CREATE TABLE  MYLIB_DM.TRAINING_BK_DS AS
SELECT *
FROM MYLIB_DM.TRAINING_DS;

QUIT;

/* 4.1.4 Impute the missing values found in the variable gender */
/* replace the MISSING gender with 'male' */

PROC SQL;

UPDATE MYLIB_DM.TRAINING_DS
SET gender = 
( SELECT e.gender AS gender
  FROM MYLIB_DM.TRAINING_GENDER_DS e
  WHERE e.no_of_applicants eq ( SELECT MAX(e.no_of_applicants) AS no_of_applicants
							  FROM MYLIB_DM.TRAINING_GENDER_DS e ) )
							  /* sub-program to choose gender that has highest value */
WHERE ( ( gender eq '' ) OR
	    ( gender IS MISSING ) );
	    
QUIT;

/* 5.1 Impute (cleanse) the Categorical variables found in the TESTING_DS */

/* 5.1.1 Impute (cleanse) the Categorical variables - GENDER */
/* 5.1.2 Find the missing GENDER */
PROC SQL;

SELECT COUNT(*) Label = 'Number of observations/applicants'
FROM MYLIB_DM.TESTING_DS e
WHERE ( ( gender eq '' ) OR
		( gender IS MISSING ) );

QUIT;

/* 5.1.3 Store the statistics in a ds */

PROC SQL;

CREATE TABLE MYLIB_DM.TESTING_GENDER_DS AS
SELECT  e.gender AS gender,
		COUNT(*) AS no_of_applicants
FROM MYLIB_DM.TESTING_DS e
WHERE ( ( e.gender ne '' ) OR
		( e.gender IS NOT MISSING ) )
GROUP BY e.gender;
		
QUIT;

/* 5.1.3 Create a backup DS copy */

PROC SQL;

CREATE TABLE MYLIB_DM.TESTING_BK_DS AS
SELECT *
FROM MYLIB_DM.TESTING_DS e;

QUIT;

/* 5.1.4 Impute the missing values found in the variable gender */
/* replace the MISSING gender with 'male' */

PROC SQL;

UPDATE MYLIB_DM.TESTING_DS
SET gender = 
( SELECT e.gender AS gender
  FROM MYLIB_DM.TESTING_GENDER_DS e
  WHERE e.no_of_applicants eq ( SELECT MAX(e.no_of_applicants) AS no_of_applicants
							  FROM MYLIB_DM.TESTING_GENDER_DS e ) )
							  /* sub-program to choose gender that has highest value */
WHERE ( ( gender eq '' ) OR
	    ( gender IS MISSING ) );
	    
QUIT;

/* 6.1 Impute (cleanse) the Continuous/Numeric variables found in the TRAINING_DS */
/* 6.1.1 Impute (cleanse) the Continuous/Numeric variables - loan_amount */
/* 6.1.1 Find the missing loan_amount */

TITLE 'STEP 6.1.1: Find the missing loan_amount';

PROC SQL;

SELECT *
FROM MYLIB_DM.TRAINING_DS e
WHERE ( ( e.loan_amount eq . ) OR
		( e.loan_amount IS MISSING ) );
QUIT;

/* 6.1.2 Count the total missing Continuous/Numeric variables - loan_amount */

PROC SQL;

SELECT COUNT(*) Label = 'Number of observations'
FROM MYLIB_DM.TRAINING_DS e
WHERE ( ( e.loan_amount eq . ) OR
		( e.loan_amount IS MISSING ) );
		
QUIT;

/* 6.1.3 Impute the missing values found in Continuous/Numeric variables - loan_amount */

PROC STDIZE DATA = MYLIB_DM.TRAINING_DS REPONLY

METHOD = MEAN OUT = MYLIB_DM.TRAINING_DS;
VAR loan_amount;

QUIT;

PROC SQL;

SELECT COUNT(*) Label = 'Number of observations'
FROM MYLIB_DM.TRAINING_DS e
WHERE ( ( e.loan_amount eq . ) OR
		( e.loan_amount IS MISSING ) );
		
QUIT;

/* 7.1 Impute (cleanse) the Continuous/Numeric variables found in the TESTING_DS */
/* 7.1.1 Impute (cleanse) the Continuous/Numeric variables - loan_amount */

/* 7.1.1 Find the missing loan_amount */

TITLE 'STEP 7.1.1: Missing loan_amount';

PROC SQL;

SELECT *
FROM MYLIB_DM.TESTING_DS e
WHERE ( ( e.loan_amount eq . ) OR
		( e.loan_amount IS MISSING ) );
QUIT;

/* 7.1.2 Make a backup copy */
PROC SQL;

CREATE TABLE MYLIB_DM.TESTING_BK2_DS AS
SELECT *
FROM MYLIB_DM.TESTING_DS;

QUIT;

/* 7.1.3 Impute the missing values found in Continuous/Numeric variables - loan_amount */

PROC STDIZE DATA = MYLIB_DM.TESTING_DS REPONLY

METHOD = MEAN OUT = MYLIB_DM.TESTING_DS;
VAR loan_amount;

QUIT;

TITLE 'Missing loan_amount';

PROC SQL;

SELECT COUNT(*) Label = 'No of observations'
FROM MYLIB_DM.TESTING_DS e
WHERE ( ( e.loan_amount eq . ) OR
		( e.loan_amount IS MISSING ) );
QUIT;

/* Create LR model */
PROC LOGISTIC DATA = MYLIB_DM.TRAINING_DS OUTMODEL = MYLIB_DM.TRAINING_LR_MODEL;  
CLASS 
GENDER 
LOAN_LOCATION  
LOAN_HISTORY
MARITAL_STATUS
;
/* Above are categorical variables */ 
MODEL LOAN_APPROVAL_STATUS = /*place here all independent variables */
/* LOAN_APPLICATION_STATUS is a dependent variable */
GENDER 
LOAN_LOCATION  
LOAN_HISTORY
MARITAL_STATUS 
LOAN_AMOUNT
LOAN_DURATION;
OUTPUT OUT = MYLIB_DM.TRAINING_OUT_DS P = PRED_PROB;
/*PRED_PROB ->Predicted probability - variable to hold predicted probability 
OUT -> the output will be stored in the dataset 
Akaike Information criterion must ( AIC ) < SC (Schwarz Criterion) */
/*If Pr > ChiSq is <= 0.05, it means that that independent variable is an 
important variable and as is truely contributing to predite dependent varibale*/
RUN;