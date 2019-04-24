.text

.global main

main:

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

mov r11, #0
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
	bne navesjdos




@ Salida al S.O.

  MOV R7, #1

  SWI 0

 .data 

 mapa1j1: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 mapa2j1: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 mapa1j2: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 mapa2j2: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 formato: .asciz "   %c"
 letra: .byte 0
 orientacion: .byte 0
 mensaje_bj1: .asciz "Jugador 1: escoja sus naves"
 mensaje_bj2: .asciz "Jugador 2: escoja sus naves"
 mensaje_ingreso: .asciz "Ingrese una letra\n"
 mensaje_orientacion: .asciz "Ingrese V para vertical o H para horizontal"
