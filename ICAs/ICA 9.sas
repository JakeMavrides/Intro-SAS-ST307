******************
* Jake Mavrides
* Purpose ICA 7
* Date: 11/15/2023
* Edits since original: None
******************;
LIBNAME NCSU '/home/u63547657/myLib';
FILENAME sdata URL 'https://www4.stat.ncsu.edu/~online/datasets/abalone.csv';

* Import our datafile with a custom delimiter
* and specify output library. Replace option
* is included. Delimiter is then specified
* and getnames=yes indicates first row contains var names;
PROC IMPORT DATAFILE=sdata
	DBMS=CSV
	OUT=NCSU.sdata
	REPLACE;
	GETNAMES=YES;
	* guessing rows = max will use max length for num of chars in a row;
RUN;

* Step 3:;
PROC GLM DATA=NCSU.sdata PLOTS=ALL;
	MODEL WholeWeight = Length/CLPARM /*CLM*/;
RUN;
quit;
* Small p-value indicates relationship is significant, slope indicates
approx 4 unit increase in weight per unit increase in length;


* Step 4:;
PROC GLM DATA=NCSU.sdata PLOTS=ALL;
	MODEL WholeWeight = Height/CLPARM /*CLM*/;
RUN;
quit;

* Step 5:;
PROC GLM DATA=NCSU.sdata PLOTS=ALL;
	MODEL WholeWeight = Height Length/CLPARM /*CLM*/;
RUN;
quit;

* Step 6:;
PROC GLM DATA=NCSU.sdata PLOTS=ALL;
	MODEL WholeWeight = Length Height*Length/CLPARM /*CLM*/;
RUN;
quit;