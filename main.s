/*.text

.global main*/

@@ codigo de assembler: se coloca en la seccion .text
	.text
	.align		2
	@@ etiqueta "main" llama a la funcion global
	.global		main
	.type		main, %function


main:


@@ grabar registro de enlace en la pila
	stmfd	sp!, {lr}

bl asciiart

ldr r0, =mensaje_bj1
bl puts

ldr r0, =mapa1j1
bl cuadro

mov r11, #0
navesjuno: ldr r0, =mensaje_ingreso
	bl puts
	@Ingresa la letra correspondiente a la casilla y la guarda en memoria
	ldr r0, =formato
	ldr r1, =letra
	bl scanf
	ldr r0, =letra
	bl conversion
	cmp r0, #-1
	beq navesjuno
	@Ingresa la orientacion del barco con una letra y lo guarda en memoria
	otravez1: ldr r0, =mensaje_orientacion
		bl puts
		ldr r0, =formato
		ldr r1, =orientacion
		bl scanf
		ldr r0, =orientacion
		ldr r9, [r0]
		ldr r0, =letra
		cmp r9, #'V'
		cmpne r9, #'H'
		bne otravez1
		cmp r9,#'V'
		bleq vvertical
		cmpne r9, #'H'
		bleq vhorizontal
		cmp r0, #-1
		beq navesjuno
		
	@Convierte la letra de la casilla a un numero
	ldr r0, =letra
	bl conversion
	@Carga el valor de la casilla y la direccion de memoria del vector
	mov r1, r0
	ldr r0, =mapa1j1
	@Compara si es horizontal o vertical y llama a la subrutina segun sea el caso
	ldr r4, =orientacion
	ldrb r4, [r4]
	cmp r4, #'V'
	bleq vertical
	cmp r4, #'H'
	bleq horizontal
	ldr r0, =mapa1j1
	bl cuadro
	add r11, r11, #1
	cmp r11,#2
	bne navesjuno

ldr r0, =limpiar
bl puts

ldr r0, =mapa1j2
bl cuadro

ldr r0, =mensaje_bj2
bl puts

mov r11, #0
navesjdos: ldr r0, =mensaje_ingreso
	bl puts
	@Ingresa la letra correspondiente a la casilla y la guarda en memoria
	ldr r0, =formato
	ldr r1, =letra
	bl scanf
	ldr r0, =letra
	bl conversion
	cmp r0, #-1
	beq navesjdos
	@Ingresa la orientacion del barco con una letra y lo guarda en memoria
	otravez3: ldr r0, =mensaje_orientacion
		bl puts
		ldr r0, =formato
		ldr r1, =orientacion
		bl scanf
		ldr r0, =orientacion
		ldr r9, [r0]
		ldr r0, =letra
		cmp r9, #'V'
		cmpne r9, #'H'
		bne otravez3
		cmp r9, #'V'
		bleq vvertical
		cmpne r9, #'H'
		bleq vhorizontal
		cmp r0, #-1
		beq navesjdos
	@Convierte la letra de la casilla a un numero
	ldr r0, =letra
	bl conversion
	@Carga el valor de la casilla y la direccion de memoria del vector
	mov r1, r0
	ldr r0, =mapa1j2
	@Compara si es horizontal o vertical y llama a la subrutina segun sea el caso
	ldr r4, =orientacion
	ldrb r4, [r4]
	cmp r4, #'V'
	bleq vertical
	cmp r4, #'H'
	bleq horizontal
	ldr r0, =mapa1j2
	bl cuadro
	add r11, r11, #1
	cmp r11,#2
	bne navesjdos

ldr r0, =limpiar
bl puts

	regresar: ldr r0, =messagej1
	bl puts

	mov r10, #3
	atacajuno: ldr r0, =mensaje_ataque
		bl puts
		ldr r0, =formato
		ldr r1, =letra
		bl scanf
		ldr r0, =letra
		bl conversion
		mov r2, r0
		ldr r0, =mapa2j1
		mov r1, r0
		ldr r0, =mapa1j2
		bl atacar
		subs r10, r10, #1
		bne atacajuno

	ldr r0, =mapa2j1
	bl contar

	mov r4, r0
	ldr r0, =cuenta
	str r4, [r0]
	ldr r0, =cuenta
	ldr r1, [r0]
	ldr r0, =formato1
	bl printf

	cmp r4, #6
	beq gano1

	mov r11, #5
	ldr r0, =mapa2j1
	bl cuadro
		mostrar1:
		subs r11, r11, #1
		bne mostrar1

	ldr r0, =limpiar
	bl puts

	ldr r0, =messagej2
	bl puts

	mov r10, #3
	atacajdos: ldr r0, =mensaje_ataque
		bl puts
		ldr r0, =formato
		ldr r1, =letra
		bl scanf
		ldr r0, =letra
		bl conversion
		mov r2, r0
		ldr r0, =mapa2j2
		mov r1, r0
		ldr r0, =mapa1j1
		bl atacar
		subs r10, r10, #1
		bne atacajdos

	ldr r0, =mapa2j2
	bl contar
	mov r4, r0

	ldr r0, =cuenta
	str r4, [r0]
	ldr r0, =cuenta
	ldr r1, [r0]
	ldr r0, =formato1
	bl printf

	cmp r4, #6
	beq gano2

	mov r11, #5
	ldr r0, =mapa2j2
	bl cuadro
		mostrar2:
		subs r11, r11, #1
		bne mostrar2

	ldr r0, =limpiar
	bl puts

	b regresar

gano1: 
ldr r0, =ganouno
bl puts
b fin

gano2:
ldr r0, =ganodos
bl puts
b fin


fin:
@ Salida al S.O.

 /* MOV R7, #1

  SWI 0 */

@@ r0, r3 <- 0 como sennal de no error al sistema operativo
	mov	r3, #0
	mov	r0, r3
  @ colocar registro de enlace para desactivar la pila y retorna al SO
	ldmfd	sp!, {lr}
	bx	lr

 .data 
 .align 2

 formato1: .asciz "\nAciertos: %d \n"
 mapa1j1: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 mapa2j1: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 mapa1j2: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 mapa2j2: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 formato: .asciz "   %c"
 letra: .byte 0
 orientacion: .byte 0
 cuenta: .word 0
 mensaje_bj1: .asciz "Jugador 1: escoja sus naves"
 mensaje_bj2: .asciz "Jugador 2: escoja sus naves"
 mensaje_ingreso: .asciz "Ingrese una letra entre A-Y\n"
 mensaje_orientacion: .asciz "Ingrese V para vertical o H para horizontal"
 mensaje_ataque: .asciz "Ingrese una letra entre A-Y para atacar"
 ganouno: .asciz "Gano el jugador 1\n"
 ganodos: .asciz "Gano el jugador 2\n"
messagej1: .asciz "Jugador 1 te toca atacar\n"
messagej2: .asciz "Jugador 2 te toca atacar\n"
limpiar: .asciz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"


