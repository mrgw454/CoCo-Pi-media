10 REM THIS PROGRAM SWITCHES OUT
20 REM OF ALL-RAM MODE, WHICH
30 REM DISABLES 64-COLUMN TEXT
40 REM BY ERASING THE DECB PATCH
50 REM APPLIED BY WIDTH64.
60 REM NOTE THAT THIS DOES NOT
70 REM DISABLE 64-COLUMN TEXT
80 REM IN COCOVGA, BUT BECAUSE
90 REM BASIC DOES NOT USE 6847
100 REM MODE CG2, IT DOESN'T
110 REM MATTER.
120 POKE &HFFDE,0
130 CLS:PRINT "Type RUN <ENTER> to display CATALOG":PRINT:LOAD"CATLOG32.BAS:1"
140 END
