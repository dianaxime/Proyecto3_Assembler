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
@r0 contiene la direccion de la orientacion
@r1 contiene la letra con la posicion
ldrb r0, [r0]
ldrb r1, [r1]
cmp r0, #'A'
moveq r2, #0
cmpne r0, #'B'
moveq r2, #1
cmpne r0, #'C'
moveq r2, #2
cmpne r0, #'D'
moveq r2, #3
cmpne r0, #'E'
moveq r2, #4
cmpne r0, #'F'
moveq r2, #5
cmpne r0, #'G'
moveq r2, #6
cmpne r0, #'H'
moveq r2, #7
cmpne r0, #'I'
moveq r2, #8
cmpne r0, #'J'
moveq r2, #9
cmpne r0, #'K'
moveq r2, #10
cmpne r0, #'L'
moveq r2, #11
cmpne r0, #'M'
moveq r2, #12
cmpne r0, #'N'
moveq r2, #13
cmpne r0, #'O'
moveq r2, #14
cmpne r0, #'P'
moveq r2, #15
cmpne r0, #'Q'
moveq r2, #16
cmpne r0, #'R'
moveq r2, #17
cmpne r0, #'S'
moveq r2, #18
cmpne r0, #'T'
moveq r2, #19
cmpne r0, #'U'
moveq r2, #20
cmpne r0, #'V'
moveq r2, #21
cmpne r0, #'W'
moveq r2, #22
cmpne r0, #'X'
moveq r2, #23
cmpne r0, #'Y'
moveq r2, #24
mov r0, r2
pop {pc}


