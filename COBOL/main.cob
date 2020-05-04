000100 IDENTIFICATION DIVISION.                                         00010000
000200 PROGRAM-ID. ROT13.                                               00020000
000300*> EMPTY LINE IS MANDATORY.                                       00030000
000400 ENVIRONMENT DIVISION.                                            00040000
000500 DATA DIVISION.                                                   00050000
000600   LOCAL-STORAGE SECTION.                                         00060000
000700     78 STRING-LENGTH   VALUE 512.                                00070000
000800     78 LOWERCASE       VALUE "abcdefghijklmnopqrstuvwxyz".       00080000
000900     78 ROT13-LOWERCASE VALUE "nopqrstuvwxyzabcdefghijklm".       00090000
001100     78 UPPERCASE       VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ".       00100000
001200     78 ROT13-UPPERCASE VALUE "NOPQRSTUVWXYZABCDEFGHIJKLM".       00110000
001300                                                                  00120000
001400     01 INPUT-STRING  PIC X(STRING-LENGTH).                       00130000
001500     01 OUTPUT-STRING PIC X(STRING-LENGTH).                       00140000
001600 PROCEDURE DIVISION.                                              00150000
001700   DISPLAY "Enter string to encode:".                             00160000
001800   ACCEPT INPUT-STRING.                                           00170000
001900   MOVE INPUT-STRING TO OUTPUT-STRING.                            00180000
002000   INSPECT OUTPUT-STRING CONVERTING LOWERCASE TO ROT13-LOWERCASE. 00190000
002100   INSPECT OUTPUT-STRING CONVERTING UPPERCASE TO ROT13-UPPERCASE. 00200000
002200   DISPLAY "Encoded string:".                                     00210000
002300   DISPLAY OUTPUT-STRING.                                         00220000
002400 STOP RUN.                                                        00230000
