10 CLS
20 ' storage device detection
30 ' assumes MPI with storage device in SLOT 3
40 '
50 IF PEEK(65407)=34 THEN SD$="CoCoSDC":GOTO 110
60 IF PEEK(65407)=238 THEN SD$="IDE":GOTO 110
70 IF PEEK(65407)=221 THEN SD$="SD card":GOTO 110
75 IF PEEK(65407)=126 THEN SD$="EMU":GOTO 110
75 IF PEEK(65407)=255 THEN SD$="EMU":GOTO 110
80 '
90 PRINT "Storage device not detected in MPI.  Aborting.":END
100 '
110 ' Coco detection
120 IF PEEK(&HFFF0)=67 THEN CC$="CoCo3FPGA":GOTO 630
130 IF PEEK(63234)=77 THEN CC$="Coco 3":GOTO 470
140 IF PEEK(63234)<>77 THEN CC$="Coco 1 or 2":GOTO 200
150 END
160 '
170 '
180 ' set up YA-DOS mounts based on Coco platform
190 '
200 ' real Coco 1 or 2
210 '
220 IF PEEK(41301)=49 THEN CC$="Coco 1"
230 IF PEEK(41301)=50 THEN CC$="Coco 2"
240 '
250 ' when using the DRIVE I command with a Coco 1 and DW,
260 ' make sure the MSC field is set to 3 for bit-banger only (for 38,400 support)
270 '
280 PRINT CC$;" with ";SD$;" detected.  Setting up YA-DOS mounts...":PRINT
290 '
300 ' add slight delay to allow for proper YA-DOS mounting, etc., when using CoCoSDC
310 FOR D=0 TO 2000
320 NEXT D
330 '
340 IF SD$<>"EMU" THEN DRIVE U 0 'umount DW
350 '
380 IF SD$="IDE" THEN DRIVE I 1,4,0 'SuperIDE / Glenside IDE controller
390 IF SD$="CoCoSDC" THEN DRIVE I 1,3,2 'CoCoSDC controller
400 IF SD$<>"EMU" THEN DRIVE M 1,0,0 'remount DW
410 IF SD$<>"EMU" THEN DRIVE M 0,1,0,11:DRIVE.250
420 '
430 INPUT "Do you have a CoCoVGA";CV$
440 IF CV$="Y" THEN RUN "WIDTH64.BAS:1":END
450 IF SD$<>"EMU" THEN RUN"WIDTH32.BAS:1":END
455 IF SD$="EMU" THEN END
460 '
470 ' real Coco 3
480 '
490 PRINT CC$;" with ";SD$;" detected.  Setting up YA-DOS mounts...":PRINT
500 '
510 ' add slight delay to allow for proper YA-DOS mounting, etc., when using CoCoSDC
520 FOR D=0 TO 2000
530 NEXT D
540 '
550 IF SD$<>"EMU" THEN DRIVE U 0 'unmount DW
560 IF SD$="IDE" THEN DRIVE I 1,4,0 'SuperIDE / Glenside IDE controller
570 IF SD$="CoCoSDC" THEN DRIVE I 1,3,2 'CoCoSDC controller
580 IF SD$<>"EMU" THEN DRIVE M 1,0,0 'remount DW
590 IF SD$<>"EMU" THEN DRIVE M 0,1,0,11:DRIVE.250
600 '
610 IF SD$<>"EMU" THEN RUN"WIDTH80.BAS:1":END
615 IF SD$="EMU" THEN END
620 '
630 ' Coco3FPGA (SD card)
640 '
650 PRINT CC$;" detected.  Setting up YA-DOS mounts...":PRINT
660 DRIVE U 0      'umount DW'
670 DRIVE I 1,5,1  'CoCo3FPGA SD card slot
680 DRIVE M 1,0,0  'remount DW
690 DRIVE M 0,1,0,11:DRIVE.250
700 '
710 RUN"WIDTH80.BAS:1":END
