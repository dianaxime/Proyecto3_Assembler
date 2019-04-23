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
cmp r0, #'V'







