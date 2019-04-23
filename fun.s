.global horizontal, vertical, conversion

horizontal:
push {lr}
@agregar horizontalmente
@ ro contiene la direccion de memoria del vector
@ r1 contiene un int con la casilla que el usuario selecciono
@sumo las direcciones de memoria
add r0, r0, r1
mov r2,#'+'
@se itera 3 veces por el espacio que ocupa el barco
mov r3,#3
repetir: strb r2, [r0], #1
subs r3, r3, #1
bne repetir
pop {pc}


vertical:
push {lr}
@agregar verticalmente
@ ro contiene la direccion de memoria del vector
@ r1 contiene un int con la casilla que el usuario selecciono
add r0, r0, r1
mov r2,#'+'
mov r3,#3
repet: strb r2, [r0], #5
subs r3, r3, #1
bne repet
pop {pc}

conversion:
push {lr}
@r0 contiene la direccion de la letra
ldrb r0, [r0]
cmp r0, #'A'
moveq r2, #0
cmp r0, #'B'
moveq r2, #1
cmp r0, #'C'
moveq r2, #2
cmp r0, #'D'
moveq r2, #3
cmp r0, #'E'
moveq r2, #4
cmp r0, #'F'
moveq r2, #5
cmp r0, #'G'
moveq r2, #6
cmp r0, #'H'
moveq r2, #7
cmp r0, #'I'
moveq r2, #8
cmp r0, #'J'
moveq r2, #9
cmp r0, #'K'
moveq r2, #10
cmp r0, #'L'
moveq r2, #11
cmp r0, #'M'
moveq r2, #12
cmp r0, #'N'
moveq r2, #13
cmp r0, #'O'
moveq r2, #14
cmp r0, #'P'
moveq r2, #15
cmp r0, #'Q'
moveq r2, #16
cmp r0, #'R'
moveq r2, #17
cmp r0, #'S'
moveq r2, #18
cmp r0, #'T'
moveq r2, #19
cmp r0, #'U'
moveq r2, #20
cmp r0, #'V'
moveq r2, #21
cmp r0, #'W'
moveq r2, #22
cmp r0, #'X'
moveq r2, #23
cmp r0, #'Y'
moveq r2, #24


mov r0, r2
pop {pc}


