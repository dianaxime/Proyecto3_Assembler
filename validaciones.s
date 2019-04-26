.global vhorizontal, vvertical

vhorizontal:
@r0 contiene la direccion de la letra
@carga el valor de la letra
@se predefinieron los casos horizontales imposibles
@compara y si es un caso imposible devuelve "-1"
push {lr}
ldrb r1, [r0]
cmp r1, #'D'
moveq r0, #-1
cmp r1, #'E'
moveq r0, #-1
cmp r1, #'I'
moveq r0, #-1
cmp r1, #'J'
moveq r0, #-1
cmp r1, #'N'
moveq r0, #-1
cmp r1, #'O'
moveq r0, #-1
cmp r1, #'S'
moveq r0, #-1
cmp r1, #'T'
moveq r0, #-1
cmp r1, #'X'
moveq r0, #-1
cmp r1, #'Y'
moveq r0, #-1
pop {pc}

vvertical:
@r0 contiene la direccion de la letra
@r0 contiene la direccion de la letra
@carga el valor de la letra
@se predefinieron los casos verticales imposibles
@compara y si es un caso imposible devuelve "-1"
push {lr}
ldrb r1, [r0]
cmp r1, #'P'
moveq r0, #-1
cmp r1, #'Q'
moveq r0, #-1
cmp r1, #'R'
moveq r0, #-1
cmp r1, #'S'
moveq r0, #-1
cmp r1, #'T'
moveq r0, #-1
cmp r1, #'U'
moveq r0, #-1
cmp r1, #'V'
moveq r0, #-1
cmp r1, #'W'
moveq r0, #-1
cmp r1, #'X'
moveq r0, #-1
cmp r1, #'Y'
moveq r0, #-1
pop {pc}
