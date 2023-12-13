******************
* Jake Mavrides
* ICA 2
* Date: 8/30/2023
* Edits since original: Changed 'insurance' to 'crabs' to fix errors
******************;

* Read crabs file in to work.crabs library;
FILENAME REFFILE '/home/u63547657/my_shared_file_links/u424592/01-ProgrammingInSASReadingData/crabs.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.crabs;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.crabs; 
RUN;
* Read in excel file 'crabs' into the name Work.crabs;

* Read in insurance csv file into the WORK library with a filename of 'insurance';
FILENAME REFFILE '/home/u63547657/my_shared_file_links/u424592/01-ProgrammingInSASReadingData/insurance.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.insurance;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.insurance; 
RUN;
* Finished reading in insurance comma separated value file;

*Print out summary statistics about the crabs data;
PROC FREQ DATA = crabs;
TABLES color*spine;
RUN;

*Print out summary statistics about the insurance data;
PROC UNIVARIATE DATA = insurance;
VAR AGE BMI Children;
RUN;
