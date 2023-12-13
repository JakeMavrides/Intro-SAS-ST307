**********************************************
* Liz Davis
* In-Class Activity 3: Importing BONANZA!
* Date: 9/6/2023
* Any Edits Since Original:
**********************************************;

* I set up my library. Your path will be different!;
LIBNAME docs "/home/u63033008/Fall 2023";

* After downloading hateCrime.tsv and *not* opening it, I can upload it to the server;
* Why not open it? I don't want to accidentally change the file type;

* Set up a nickname for the file:;
FILENAME my_file "/home/u63033008/Fall 2023/hateCrime (2).tsv";

* Import the tsv (tab-separated values);
PROC IMPORT DATAFILE = my_file
    DBMS = tab
    OUT = docs.hatecrimes
    REPLACE;
    GUESSINGROWS = max;
    GETNAMES = no;
RUN;

/* Let's consider some of what's happening above: the DATAFILE option
tells SAS which file to import. DBMS tells SAS how that import file is structured.
OUT tells us where SAS will save the newly created SAS dataset. REPLACE tells SAS
that we want to save over the top of any previously created doc.hatecrimes dataset - 
we want to include this because if we messed up on the import the first time around,
we want to be able to replace that bad data with the good data!

Then, the guessingrows = max statement tells SAS that we want it to look at all of the 
rows of the external data to decide how to format the SAS dataset, and GETNAMES = no tells
SAS that we did not have column headers in our original raw data.*/

* We want to use a DATA step to copy the data to a temporary dataset;
* We'll want to add names!;
data mycrimes;
    SET docs.hatecrimes;
    RENAME  var1 = state
            var2 = med_inc
            var3 = unemp
            var4 = pop_metro
            var5 = pop_hs
            var6 = non_citizen
            var7 = white_poverty
            var8 = non_white
            var9 = vote_trump
            var10 = hate_crimes_per_100k
            var11 = avg_hatecrimes_per_100k;
run;

** There are even more ways to do this, but we'll do that next week;

* Print the data with labels;
PROC PRINT DATA = mycrimes;
RUN;

/***** Problem 5 *****/
* Note: the comment on line 60 is a different type - it starts with /* and ends 
* with */. ;

/* I again download the data by copying the link into my browser and then
 not opening it! Then I upload to the SAS Studio server.

Where, specifically, do I upload it? I upload it into the same folder that
my LIBNAME statement above refers to! That way, when I look at my "docs" library,
the house dataset will already be there. */

PROC PRINT DATA = docs.house; 
RUN;

/***** Problem 6 ******/
* Create code to import the cheese csv straight from the world wide web:;
filename cheese url "https://www4.stat.ncsu.edu/~online/datasets/cheese.csv";

proc import datafile = cheese 
    dbms = csv
    out = cheese
    replace;
    getnames = yes;
    guessingrows = max;
run;
* Wow! Cheese data!;