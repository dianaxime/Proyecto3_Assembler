.text

.global main

main:
ldr r0, =mensaje_orientacion
bl puts
ldr r0, =formato
ldr r1, =orientacion
ldr r0, =mensaje_ingreso
bl puts
ldr r0, =formato
ldr r1, =letra
@bl asciiart
/*ldr r0, =mapa1j1
mov r1, #15
bl horizontal
ldr r0, =mapa1j1
mov r1, #3
bl vertical*/
ldr r0, =mapa1j1
bl cuadro







@ Salida al S.O.

  MOV R7, #1

  SWI 0

 .data 

 mapa1j1: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 mapa2j1: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 mapa1j2: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 mapa2j2: .byte 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
 formato: .asciz "%c"
 letra: .byte ' '
 orientacion: .byte ' '
 mensaje_ingreso: .asciz "Ingrese una letra\n"
 mensaje_orientacion: .asciz "Ingrese V para vertical o H para horizontal"
