.MODEL SMALL
PRINT MACRO MSG		;name of macro is print, print prints msg
PUSH DX			;so data is not lost, we push DX in stack
MOV AH,09H		;used to display msg on screen
LEA DX,MSG		;effective address of msg loaded in dx and then displayed
INT 21H
POP DX
ENDM
.DATA
MSG1 DB 10,13, "Enter a string : $"	;10,13 is ASCII value of line feed and carriage return
MSG2 DB 10,13, "The reversed string is : $"	
MSG3 DB 10,13, "String is a palindrome : $"
MSG4 DB 10,13, "String is not a palindrome : $"
STR DB 100 DUP(?)	;reserve 100 bytes reserved, and ?(junk value) is assigned to reserved memory
.CODE
MOV AX,@DATA	;can't give data directly to DS, as both of them are memory location
MOV DS,AX	;AX is used as intermediate register
PRINT MSG1
LEA SI,STR	;loads offset address of string str to SOURCE INDEX(Now SI points to first character of STR)
UP1: MOV AH,01H		;01H : used for read operations
INT 21H
CMP AL,0DH	;AL is character and 0DH is ASCII value of Enter, they both are checked to determine if we have come to end of the string.
J2 D1
MOV [SI],AL	
INC SI		;Increment to next character
JMP UP1
D1: DEC SI	;Now SI points to last character
MOV DI,SI	;SI moved to DI for comparison purpose
PRINT MSG2
DISP: MOV DL,[SI]
MOV AH,02H	;DOS Process for write process
INT 21H
DEC SI
CMP SI,OFFSET STR	;SI, which is pointing at last is compared with OFFSET of STR, which is pointing to beginning of string
JGE DISP	;SI is greater than or equal to offset of str, so jump to DISP Label
INC SI
NEXT: MOV DL,[SI]
CMP DL,[DI]
JZ SK
PRINT MSG4
JMP LAST
SK: INC SI
DEC DI
CMP SI,DI
JLE NEXT
PRINT MSG3
LAST: MOV AH,4CH
INT 21H
END
