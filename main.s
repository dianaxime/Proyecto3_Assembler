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

@bl asciiart

ldr r0, =mensaje_bj1
bl puts


mov r11, #0
navesjuno: ldr r0, =mensaje_ingreso
	bl puts
	@Ingresa la letra correspondiente a la casilla y la guarda en memoria
	ldr r0, =formato
	ldr r1, =letra
	bl scanf
	@Ingresa la orientacion del barco con una letra y lo guarda en memoria
	ldr r0, =mensaje_orientacion
	bl puts
	ldr r0, =formato
	ldr r1, =orientacion
	bl scanf
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

ldr r0, =mensaje_bj2
bl puts

/*mov r11, #0
navesjdos: ldr r0, =mensaje_ingreso
	bl puts
	@Ingresa la letra correspondiente a la casilla y la guarda en memoria
	ldr r0, =formato
	ldr r1, =letra
	bl scanf
	@Ingresa la orientacion del barco con una letra y lo guarda en memoria
	ldr r0, =mensaje_orientacion
	bl puts
	ldr r0, =formato
	ldr r1, =orientacion
	bl scanf
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
	bne navesjdos*/


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
ldr r0, =mapa1j1
bl atacar
subs r10, r10, #1
bne atacajuno


ldr r0, =mapa2j1
bl cuadro


/*ldr r4, [r0]
ldr r0, =formato1
bl printf*/
ldr r0, =mapa2j1
bl contar
mov r4, r0
cmp r4, #2
beq prueba
bne fin
prueba:
ldr r0, =impresion
bl puts
ldr r0, =cuenta
str r4, [r0]
ldr r0, =cuenta
ldr r1, [r0]
ldr r0, =formato1
@mov r1, r4
bl printf


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

 formato1: .asciz "%d"
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
 impresion: .asciz "\nSi imprime algo"

