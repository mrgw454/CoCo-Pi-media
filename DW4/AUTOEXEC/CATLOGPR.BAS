10 CLEAR 500
20 CLS
30 INPUT "Starting partition (0-13):";SP
40 INPUT "Ending partition (0-13)  :";EP
45 PRINT
50 PRINT #-2,"YA-DOS HDD Catalog - Partitions (";SP;" - ";EP")"
55 PRINT #-2,""
60 T=17:S=17
90 FOR D=(SP*256) TO ((EP*256)+256)
100 DRIVE ,D
120 DSKI$ 0,T,S,S1$,S2$
130 P=INSTR(1,S1$,(CHR$(0)))
140 IF P=0 THEN L$="N/A":GOTO 170
141 IF P>78 THEN P=78
150 L$=LEFT$(S1$,(P-1))
170 PRINT "DSK";D;"- ";L$
180 PRINT #-2,"DSK";D;"- ";L$
190 NEXT D
194 PRINT #-2,""
195 PRINT #-2,"YA-DOS HDD Catalog - Partitions (";SP;" - ";EP")"
210 PRINT
220 PRINT "Done!"
225 CLOSE #-2
230 END
 