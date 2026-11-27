/* cap input rows for the captured run */
options obs=100;

libname MYLIB_DM '.';

/* every 7th row of TRAINING_DS.csv and TESTING_DS.csv, plus rows with a missing value */
data MYLIB_DM.TRAINING_DS;
  infile datalines dsd dlm=',' truncover;
  length SME_LOAN_ID_NO $ 10 GENDER $ 8 MARITAL_STATUS $ 12 LOAN_LOCATION $ 10 LOAN_APPROVAL_STATUS $ 1;
  input SME_LOAN_ID_NO $ GENDER $ MARITAL_STATUS $ CANDIDATE_INCOME LOAN_AMOUNT LOAN_DURATION LOAN_HISTORY LOAN_LOCATION $ LOAN_APPROVAL_STATUS $;
datalines;
LP001002,Male,Not Married,5849,,360,1,City,Y
LP001014,Male,Married,3036,158,360,0,Town,N
LP001030,Male,Married,1299,17,120,1,City,Y
LP001046,Male,Married,5955,315,360,1,City,Y
LP001086,Male,Not Married,1442,35,360,1,City,N
LP001106,Male,Married,2275,,360,1,City,Y
LP001123,Male,Married,2400,75,360,,City,Y
LP001151,Female,Not Married,4000,144,360,1,Town,Y
LP001195,Male,Married,2132,96,360,1,Town,Y
LP001213,Male,Married,4945,,360,0,Village,N
LP001243,Male,Married,3208,172,360,1,City,Y
LP001259,Male,Married,1000,110,360,1,City,N
LP001275,Male,Married,3988,50,240,1,City,Y
LP001318,Male,Married,6250,188,180,1,Town,Y
LP001334,Male,Married,4188,115,180,1,Town,Y
LP001367,Male,Married,3052,100,360,1,City,Y
LP001391,Male,Married,3572,152,,0,Village,N
LP001422,Female,Not Married,10408,259,360,1,City,Y
LP001448,,Married,23803,370,360,1,Village,Y
LP001482,Male,Married,3459,25,120,1,Town,Y
LP001497,Male,Married,5042,185,360,1,Village,N
LP001518,Male,Married,1538,30,360,1,City,Y
LP001535,Male,Not Married,3254,50,360,1,City,Y
LP001562,Male,Married,7933,275,360,1,City,N
LP001579,Male,Not Married,2237,63,480,0,Town,N
LP001606,Male,Married,3497,116,360,1,Village,Y
LP001636,Male,Married,4600,73,180,1,Town,Y
LP001647,Male,Married,9328,188,180,1,Village,Y
LP001666,Male,Not Married,8333,187,360,1,Village,Y
LP001688,Male,Married,3500,135,360,1,City,Y
LP001708,Female,Not Married,10000,214,360,1,Town,N
LP001726,Male,Married,3727,131,360,1,Town,Y
LP001750,Male,Married,6250,128,360,1,Town,Y
LP001768,Male,Married,3716,42,180,1,Village,Y
LP001790,Female,Not Married,3812,112,360,1,Village,Y
LP001813,Male,Not Married,6050,120,180,1,City,N
LP001841,Male,Not Married,2583,104,360,1,Village,Y
LP001864,Male,Married,4931,128,360,,Town,N
LP001877,Male,Married,4708,150,360,1,Town,Y
LP001894,Male,Married,2620,150,360,1,Town,Y
LP001910,Male,Not Married,4053,158,360,0,City,N
LP001926,Male,Married,3704,120,360,1,Village,Y
LP001947,Male,Married,2383,172,360,1,Town,Y
LP001972,Male,Married,2875,105,360,1,Town,Y
LP001996,Male,Not Married,20233,480,360,1,Village,N
LP002031,Male,Married,3399,111,180,1,City,Y
LP002054,Male,Married,3601,,360,1,Village,Y
LP002087,Female,Not Married,2500,67,360,1,City,Y
LP002110,Male,Married,5250,160,360,1,Village,Y
LP002126,Male,Married,3173,74,360,1,Town,Y
LP002139,Male,Married,9083,228,360,1,Town,Y
LP002151,Male,Married,3875,67,360,1,City,N
LP002180,Male,Not Married,6822,141,360,1,Village,Y
LP002197,Male,Married,5185,155,360,1,Town,Y
LP002224,Male,Not Married,3069,71,480,1,City,N
LP002237,Male,Not Married,3667,113,180,1,City,Y
LP002263,Male,Married,2583,120,360,,City,Y
LP002287,Female,Not Married,1500,103,360,0,Town,N
LP002308,Male,Married,2167,115,360,1,City,Y
LP002332,Male,Married,2253,110,360,1,Village,Y
LP002348,Male,Married,5829,138,360,1,Village,Y
LP002368,Male,Married,5935,133,360,1,Town,Y
LP002390,Male,Not Married,3750,100,360,1,City,Y
LP002409,Male,Married,7901,180,360,1,Village,Y
LP002443,Male,Married,3340,150,360,0,Village,N
LP002455,Male,Married,3859,96,360,1,Town,Y
LP002487,Male,Married,3015,153,360,1,Village,Y
LP002505,Male,Married,4333,110,360,1,City,N
LP002529,Male,Married,6700,230,300,1,Town,Y
LP002541,Male,Married,10833,234,360,1,Town,Y
LP002560,Male,Not Married,2699,96,360,,Town,Y
LP002588,Male,Married,4625,111,12,,City,Y
LP002619,Male,Married,3814,124,300,1,Town,Y
LP002640,Male,Married,6065,250,360,1,Town,Y
LP002683,Male,Not Married,4683,185,360,1,Town,N
LP002699,Male,Married,17500,400,360,1,Village,Y
LP002723,Male,Not Married,3588,110,360,0,Village,N
LP002740,Male,Married,6417,157,180,1,Village,Y
LP002768,Male,Not Married,3358,80,36,1,Town,N
LP002788,Male,Married,2454,181,360,0,City,N
LP001041,Male,Married,2600,115,,1,City,Y
LP001050,,Married,3365,112,360,0,Village,N
LP001109,Male,Married,1828,100,,0,City,N
LP001136,Male,Married,4695,96,,1,City,Y
LP001137,Female,Not Married,3410,88,,1,City,Y
LP001250,Male,Married,4755,95,,0,Town,N
LP001266,Male,Married,2395,,360,1,Town,Y
LP001326,Male,Not Married,6782,,360,,City,N
LP001350,Male,Married,13650,,360,1,City,Y
LP001356,Male,Married,4652,,360,1,Town,Y
;
run;

data MYLIB_DM.TESTING_DS;
  infile datalines dsd dlm=',' truncover;
  length SME_LOAN_ID_NO $ 10 GENDER $ 8 MARITAL_STATUS $ 12 LOAN_LOCATION $ 10 LOAN_APPROVAL_STATUS $ 1;
  input SME_LOAN_ID_NO $ GENDER $ MARITAL_STATUS $ CANDIDATE_INCOME LOAN_AMOUNT LOAN_DURATION LOAN_HISTORY LOAN_LOCATION $ LOAN_APPROVAL_STATUS $;
datalines;
LP001015,Male,Married,5720,110,360,1,City,
LP001054,Male,Married,2165,152,360,1,City,
LP001078,Male,Not Married,3091,90,360,1,City,
LP001099,Male,Not Married,5667,131,360,1,City,
LP001121,Male,Married,1888,48,360,1,City,
LP001153,Male,Not Married,0,148,360,0,Village,
LP001177,Female,Not Married,2478,75,360,1,Town,
LP001203,Male,Not Married,3150,176,360,0,Town,
LP001220,Male,Married,5629,100,360,1,City,
LP001232,Male,Married,4260,185,,,City,
LP001284,Male,Married,2419,124,360,1,City,
LP001313,Male,Not Married,2750,130,360,0,City,
LP001332,Male,Married,2415,110,360,1,Town,
LP001351,Male,Married,2917,138,360,1,Town,
LP001366,Female,Not Married,3250,95,360,1,Town,
LP001400,Male,Not Married,3583,155,360,1,City,
LP001420,Male,Married,3829,163,360,0,City,
LP001452,Male,Married,4635,102,180,1,Village,
LP001475,Male,Married,3188,130,360,,Village,
LP001499,Female,Married,6260,110,360,1,Town,
LP001534,Male,Not Married,4452,131,360,1,Village,
LP001561,Female,Married,3417,200,360,1,Town,
LP001584,Female,Not Married,4742,108,360,1,Town,
LP001601,Male,Not Married,4243,157,360,,Town,
LP001627,Male,Not Married,3125,65,360,1,City,
LP001660,Male,Not Married,4667,120,360,1,Town,
LP001703,Male,Married,3333,124,360,1,City,
LP001739,Male,Married,4258,125,360,1,City,
LP001785,Male,Not Married,4727,150,360,0,Village,
LP001797,Female,Not Married,12941,150,300,1,City,
LP001827,Male,Not Married,3071,180,360,1,City,
LP001857,Male,Not Married,1599,125,300,1,Town,
LP001886,Male,Not Married,4150,209,360,1,Village,
LP001923,Male,Not Married,2268,170,360,0,Town,
LP001961,Female,Not Married,3958,110,360,1,Village,
LP001999,Male,Married,4912,160,360,1,Village,
LP002018,Male,Married,3958,160,360,1,Town,
LP002046,Male,Married,4483,135,360,,Town,
LP002062,Female,Married,4333,132,84,1,Village,
LP002083,Male,Not Married,5833,116,360,1,City,
LP002105,Male,Married,8706,108,480,1,Village,
LP002123,Male,Married,2613,123,360,1,Town,
LP002167,Female,Not Married,2362,55,360,1,City,
LP002184,Male,Married,2914,150,300,1,City,
LP002212,Male,Married,2166,108,360,,City,
LP002257,Female,Not Married,2545,74,360,1,City,
LP002294,Male,Not Married,14911,130,360,1,Town,
LP002316,Male,Not Married,2231,176,360,0,City,
LP002333,Male,Not Married,3844,105,360,1,City,
LP002355,,Married,3186,150,180,0,Town,
LP002383,Male,Married,3242,142,480,0,City,
LP002399,Male,Not Married,2858,123,360,0,Village,
LP002417,Male,Married,2792,171,360,1,Town,
LP002441,Male,Not Married,3579,138,360,,Town,
LP002476,Female,Married,1635,99,360,1,City,
LP002523,Male,Married,2773,108,360,1,Town,
LP002554,Male,Not Married,2166,122,360,1,Town,
LP002572,Male,Married,8750,297,360,1,City,
LP002599,Male,Married,3667,170,360,1,Town,
LP002612,Female,Married,2666,84,480,1,Town,
LP002644,Male,Married,7500,75,360,1,City,
LP002712,Male,Not Married,2733,180,360,,Town,
LP002746,Male,Not Married,5314,147,360,1,City,
LP002766,Female,Married,7859,165,180,1,Town,
LP002782,Male,Married,2667,148,360,1,Village,
LP002802,Male,Not Married,2875,95,6,0,Town,
LP002823,Male,Married,5509,143,360,1,Village,
LP002850,Male,Not Married,2400,46,360,1,City,
LP002860,Male,Married,2623,122,180,1,Town,
LP002878,Male,Married,8334,260,360,1,City,
LP002899,Male,Married,8667,254,360,1,Village,
LP002932,Male,Married,7603,197,360,1,City,
LP002965,Female,Married,8550,96,360,,City,
LP002986,Male,Married,5000,158,360,1,Village,
LP001128,,Not Married,3909,101,360,1,City,
LP001268,Male,Not Married,6792,187,,1,City,
LP001287,,Married,3500,120,360,1,Town,
LP001415,Male,Married,3413,,360,1,Town,
LP001542,Female,Married,2262,,480,0,Town,
LP001563,,Not Married,1596,119,360,0,City,
LP001611,Male,Married,1516,80,,0,Village,
LP001695,Male,Married,3321,70,,1,Town,
LP001769,,Not Married,3333,110,360,1,Town,
LP002045,Male,Married,10166,150,,1,City,
LP002057,Male,Married,13083,,360,1,Village,
LP002165,,Not Married,2038,100,360,1,Village,
LP002183,Male,Married,3754,118,,1,Village,
LP002298,,Not Married,2860,138,360,1,City,
LP002360,Male,Married,10000,,360,1,City,
LP002553,,Not Married,29167,185,360,1,Town,
;
run;
