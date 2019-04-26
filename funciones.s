.global atacar, contar

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






