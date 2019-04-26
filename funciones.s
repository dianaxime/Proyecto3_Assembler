.global atacar, contar, barcovertical, barcohorizontal

atacar:
@@@CAMILA
	push {lr}
	@ r0 contiene la direccion del vector de barcos del oponente
	@ r1 contiene la direccion del vector aciertos/fallos
	@ r2 contiene la posicion del vector 
	@sumo las direcciones de memoria
	add r0, r0, r2
	add r1, r1, r2
	ldrb r0, [r0]
	cmp r0, #'+'
	moveq r3, #'@'
	movne r3, #'%'
	strb r3, [r1]
	pop {pc}


contar:
@@@MARIA INES
	push {lr}
	@ r0 contiene la direccion del vector
	@recorre todo el vector y cuando encuentra un "@" suma uno al contador 
	mov r2, #25
	mov r3,#0
	repite: ldrb r1, [r0], #1
		cmp r1, #'@'
		addeq r3, r3, #1
		subs r2, r2, #1
		bne repite
	@mueve el resultado del contador a r0
	mov r0, r3
	pop {pc}

barcohorizontal:
@@@DIANA
	push {lr}
	@validar que no haya un barco horizontalmente
	@ r0 contiene la direccion de memoria del vector
	@ r1 contiene un int con la casilla que el usuario selecciono
	@sumo las direcciones de memoria
	@verifica el vector que no haya un "+" en alguna de las casillas
	@y avanza 1 espacios para la proxima casilla
	add r0, r0, r1
	@reinicio a r1 en 0
	mov r1,#0
	@se itera 3 veces por el espacio que ocupa el barco
	mov r3,#3
	volver: ldrb r1, [r0], #1
		cmp r1, #'+'
		moveq r2, #-1
		beq salir
		subs r3, r3, #1
		bne volver
	salir: mov r0, r2
	pop {pc}

barcovertical:
@@@MARIA INES
	push {lr}
	@validar que no haya un barco verticalmente
	@ r0 contiene la direccion de memoria del vector
	@ r1 contiene un int con la casilla que el usuario selecciono
	@sumo las direcciones de memoria
	@verifica el vector que no haya un "+" en alguna de las casillas
	@y avanza 5 espacios para la proxima casilla
	add r0, r0, r1
	@reinicio a r1 en 0
	mov r1,#0
	@se itera 3 veces por el espacio que ocupa el barco
	mov r3,#3
	volver1: ldrb r1, [r0], #5
		cmp r1, #'+'
		moveq r2, #-1
		beq salir1
		subs r3, r3, #1
		bne volver1
	salir1: mov r0, r2
	pop {pc}

