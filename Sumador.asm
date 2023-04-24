.model small
.stack
.data
u db 0
d db 0 
c db 0
n db 0 
n2 db 0
msg db 10,13,17,'Ingrese un numero:','$'  
msg2 db 10,13,17,'Ingrese un segundo numero:','$'   
msg3: db "la respuesta es: $$$$$$$$$$$$$$"
.code
mov ax,data
mov ds,ax
mov ah,09h
lea dx,msg
int 21h 
mov ah,01h ;Introduzco las decenas
int 21h 
sub al,30h
mov d,al
mov ah,01h ;Introduzco las unidades
int 21h 
sub al,30h
mov u,al
mov al,d
mov bl,10
mul bl ; al = d * 10
add al,u ; al = d * 10 + u
mov n,al   
;segundo numero  
xor ax,ax
mov ax,data
mov ds,ax
mov ah,09h
lea dx,msg2
int 21h   
mov ah,01h ;Introduzco las decenas del segundo numero
int 21h 
sub al,30h
mov d,al
mov ah,01h ;Introduzco las unidades  del segundo numero
int 21h 
sub al,30h
mov u,al
mov al,d
mov bl,10
mul bl ; al = d * 10
add al,u ; al = d * 10 + u
mov n2,al  
mov ah,n
add al,ah 
;resultado
aam
mov u,al
mov al,ah
aam
mov d,al
mov c,ah
xor ax,ax
mov al,c
add al,30h
mov bx,17 
mov msg3(bx),al
mov al,d
add al,30h
mov msg3(bx+1),al
mov al,u
add al,30h
mov msg3(bx+2),al
xor ax,ax
mov ah,9h
mov dx,msg3
int 21h
end



