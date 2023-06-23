;;;;;;;;;;;;;;;;;;;;
; Hammad Khalid    ;
; SubString Search ;
;;;;;;;;;;;;;;;;;;;;
.model small
.stack 100h
.data 
; DECLERATION OF DATA...
string db 15 dup ('$')
substring db 8 dup ('$')
MSG DB "ENTER STRING AND THE SUB STRING TO CHECK..",10,13,'$'
MSG1 DB " IS A SUBSTRING",10,13,'$'
MSG2 DB " IS NOT A SUBSTRING",10,13,'$'
count db 3
.code 
start:
; JUMPING TO MAIN TO START CODE FROM START 
jmp main
; SEARCH PROCEDURE TO CHECK THE SUBSTRING OF A STRING...
Search proc
 ;MOVING BASE POINTER FOR USE IN THIS PROCEDURE...
 push bp
 mov bp,sp
 push ax
 push bx
 push cx
 push dx
 ; RE INTIALIZING VALUE FOR THERE USE IN LOOP PROPERLY....
 mov si,0
 mov di,0
 mov al,[string+si]
 mov ah,[substring+si]
 Loop1:
   cmp al,'$' ; CMP SONDITION TO CHECK THE WHOLE ARRAY OF STRING....
   je notfound
   mov cl,count
   cmp cl,0   ; COUNTER CHECK TO CHECK THE COUNT OF SUBSTRING....
   je Found
   cmp al,ah
   je increment_sub
   jmp increment_string
   ; CONDITION TO INCREMENT BOTH STRING AND SUBSTRING...
  increment_sub:
  inc si
  inc di
  mov al,[string+si]
  mov ah,[substring+di]
  dec count
  jmp Loop1
  ; CONDITION TO INCREMENT ONLY STRING....
  increment_string:  
  inc si
  mov di,0
  mov count,3
  mov al,[string+si]
  mov ah,[substring+di]
  jmp Loop1
 ; NOT FOUND LABEL TO DISPLAY WHEN CONDITION IS FALSE....
 Notfound:
 mov dx,offset MSG2
 mov ah,09H
 int 21h
 jmp EXIT
 ; FOUND LABEL TO DISPLAY WHEN CONDITION IS TRUE...
 found:
 mov dx,offset MSG1
 mov ah,09H
 int 21h
 EXIT: 
 pop ax
 pop bx 
 pop cx
 pop dx
 pop bp
 ; RETURNING TO THE MAIN PROC....
 ret 
Search endp
main proc
 ; MOVING DATA SEGMENT .....
 mov ax,@data
 mov ds,ax
 ; TAKING INPUT FROM THE USER.....
 mov dx,offset MSG
 mov ah,09H
 int 21h
 mov dx,offset string
 mov ah,3fh
 int 21h
 mov dx,offset substring
 mov ah,3fh
 int 21h
 ; PUSHING THE STRING INTO THE STACK....
 MOV SI, OFFSET STRING
 MOV DI, OFFSET SUBSTRING
 PUSH SI
 PUSH DI
 ; CALLING THE PROCEDURE.....
 call Search
 ; ENDING THE PROGRAM....
 mov ah,4ch
 int 21h
main endp
end start
