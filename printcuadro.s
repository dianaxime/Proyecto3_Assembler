.global cuadro, fila

cuadro:
@r0 contiene la direccion del vector
push {lr}
push {r0}
ldr r0, =lineah
bl puts
mov r3, #5
pop {r0}
pcuadro: push {r3}
bl fila
push {r0}
ldr r0, =lineah
bl puts
pop {r0}
pop {r3}
subs r3, r3, #1
bne pcuadro
pop {pc}



fila:
push {lr}
mov r5, r0
ldr r0, =lineav
bl puts
mov r3,#5
pfila: 
ldrb r1, [r5], #1
ldr r0,=valor
push {r3}
bl printf
pop {r3}
subs r3, r3, #1
bne pfila
mov r0, r5
pop {pc}



.data
lineah: .asciz "\n"
lineav: .asciz "\t"
valor:	.asciz "%c\t"

