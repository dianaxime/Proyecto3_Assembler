.global asciiart
@Todas
asciiart:
push {lr}
ldr r0, =titulo
bl puts
ldr r0, =miascii
mov r2, r0
mov r3, #24
imprimir: push {r2}
	push {r3}
	bl puts
	pop {r3}
	pop {r2}
	add r2, r2, #78
	mov r0, r2
	subs r3, r3, #1
	bne imprimir
pop {pc}

.data
miascii: .asciz "                                      ++                                      ",                               "                                      @@                                      ","                                      @@                                      ",                             "                              @@@@@@@@@@@@@@@@@@                              ","                              @@@@@@@@@@@@@@@@@@                              ","                              @@@            @@@       					   ","                              @@@            @@@                              ","               @@@@@@@@@      @@@            @@@                              ","     '@@@',   @@@@@@@@@@#     @@@            @@@                              ","     @@@@@@@@@@@@.   @@@#     @@@            @@@                              ",   "              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,     #@@@     ","              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+    ","              @@@,................,.........................,@@@@@@@@#        ","              @@@.                                          .@@@@@            ","              @@@.                                          .@@@.             "," #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# ",";@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  "," @@@                                                                   `@@@;  "," '@@@                                                                  @@@@   ","   @@@@                                                              +@@@     ","      @@@@                                                         @@@@       ","        @@@@ #@@@           @@@@          `@@@+              ,@@@,#@@@        ","        `@@@@@@@@@@.     `@@@@@@@@      ,@@@@@@@+          ;@@@@@@@@@         ","  @@#+#@@@@@@@@@@@@@@@@#+#@@@@@@@@@#+@@@@@@@@@@@@@@@#+@@@@@@@@@@@@@@@@@+#@@@  "," @@@@@@@@@@@@@@;@@@@@@@@@@@@@@@@+#@@@@@@@@@@@@@@@@@@:@@@@@@@@@@@@`@@@@@@@@@@@#\n"
titulo: .asciz "\n\t\tB A T T L E S H I P  - G A M E\t"
