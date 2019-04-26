.global cuadro, fila

cuadro:
@@@CAMILA
	@r0 contiene la direccion del vector
	push {r4-r12,lr}
	push {r0}
	ldr r0, =lineah
	bl puts
	mov r3, #5
	@Imprime las 5 columnas de la matriz
	@Por cada columna llama a la subrutina fila
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
	pop {r4-r12,pc}



fila:
@@@DIANA
	@r0 contiene la direccion del vector
	push {r4-r12,lr}
	mov r5, r0
	ldr r0, =lineav
	bl puts
	@Imprime las 5 celdas de la fila con una tabulacion de por medio
	mov r3,#5
	pfila: 
		ldrb r1, [r5], #1
		ldr r0,=valor
		push {r3}
		bl printf
		pop {r3}
		subs r3, r3, #1
		bne pfila
	@regresamos por r0 el valor de direccion de memoria actualizado
	mov r0, r5
	pop {r4-r12,pc}



.data
lineah: .asciz "\n"
lineav: .asciz "\t"
valor:	.asciz "%c\t"

