10 CLEAR 500
20 CLS
30 PRINT "Please have your SD/CF or HD image mounted prior"
40 PRINT "to running this program."
50 PRINT
60 T=17:S=17
70 'LINE INPUT "Output catalog filename: ";C$
80 'OPEN "O",#1,C$
90 FOR D=0 TO 255
100 DRIVE.D
110 PRINT "DSK";D;"- ";
120 DSKI$ 0,T,S,S1$,S2$
130 P=INSTR(1,S1$,(CHR$(0)))
140 IF P=0 THEN L$="N/A":GOTO 160
150 L$=LEFT$(S1$,(P-1))
160 PRINT L$
165 R=R+1
166 IF R=23 GOTO 300
170 'PRINT #1,"DSK";D;"- ";L$
190 NEXT D
200 'CLOSE #1
210 PRINT
220 PRINT "Done!"
230 END
300 PRINT "<press any key to continue>"
310 K$=INKEY$:IF K$="" GOTO 310
320 R=1
330 GOTO 190
 