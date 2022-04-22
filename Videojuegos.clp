(deftemplate condiciones
	(slot general_formaDeJugar (type STRING)(default "ninguno"))
    
    ;Casual
	(slot ca_reflejosBuenos (type STRING)(default "ninguno"))
	(slot ca_comoEsTuTiming (type STRING)(default "ninguno")) 
	(slot ca_tematicaPreferida (type STRING)(default "ninguno")) 
	(slot ca_cuantosBotones (type STRING)(default "ninguno"))
	(slot ca_aventuraPreferida (type STRING)(default "ninguno"))
	(slot ca_protaInteresante (type STRING)(default "ninguno"))
	(slot ca_tipoCamara (type STRING)(default "ninguno"))
	(slot ca_tipoCarrera (type STRING)(default "ninguno"))


    ;Usando Cerebro
	(slot uc_tipoJuego (type STRING)(default "ninguno"))
	(slot uc_desarrolloJuego (type STRING)(default "ninguno"))
	(slot uc_estiloJuego (type STRING)(default "ninguno"))
	(slot uc_estiloDibujo (type STRING)(default "ninguno"))
	(slot uc_estiloDesarrollo (type STRING)(default "ninguno"))
	(slot uc_tipoTexturas (type STRING)(default "ninguno"))
	(slot uc_controlEnSimulacion (type STRING)(default "ninguno"))
)
;REGLAS DE CONTROL

;DEFINIENDO REGLA INICIAL
(defrule regla_inicial
	(iniciar)
	=>
	(printout t crlf "Como es tu forma de jugar?" crlf)
	(printout t crlf "(A) Casual" crlf)
	(printout t crlf "(B) Usando mucho el cerebro" crlf)
	(bind ?general_formaDeJugar(readline))
	(assert(general_formaDeJugar ?general_formaDeJugar))
)

;REGLAS PARA JUGADOR CASUAL
;formato usado: tipoDesarrollo_numeroDeRegla
(defrule ca_regla1
	(general_formaDeJugar ?general_formaDeJugar)
	=>
	(if (eq ?general_formaDeJugar "A")
	then
		(printout t crlf "Como estan tus reflejos?" crlf)
		(printout t crlf "(A) Buenos" crlf)
		(printout t crlf "(B) Regulares" crlf)
		(bind ?reflejos(readline))
		(assert(ca_reflejosBuenos ?reflejos))
	(if (eq ?reflejos "A")
	then
		(printout t crlf "Como es tu timing?" crlf)
		(printout t crlf "(A) Suelo tener un buen timing" crlf)
		(printout t crlf "(B) Un poco flojo" crlf)
		(bind ?timing(readline))
		(assert(ca_comoEsTuTiming ?timing))
		)
	)
)

(defrule ca_regla2
	(general_formaDeJugar ?general_formaDeJugar)
	(ca_reflejosBuenos ?reflejos)
	(ca_comoEsTuTiming ?timing)
	=>
	(if (eq ?timing "A")
	then
		(printout t crlf "Que tematica te gusta?" crlf)
		(printout t crlf "(A) Bandas de rock" crlf)
		(printout t crlf "(B) Naves espaciales" crlf)
		(bind ?tematicaPref(readline))
		(assert(ca_tematicaPreferida ?tematicaPref))
		
	(if (eq ?tematicaPref "A")
	then
		;CONCLUSION: ROCK BAND
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(ca_reflejosBuenos ?reflejos)
			(ca_comoEsTuTiming ?timing)
			(ca_tematicaPreferida ?tematicaPref)))
		)

	(if (eq ?tematicaPref "B")
	then
		;CONCLUSION: IKARUGA
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(ca_reflejosBuenos ?reflejos)
			(ca_comoEsTuTiming ?timing)
			(ca_tematicaPreferida ?tematicaPref)))
		)
	)	
)

(defrule ca_regla3
	(general_formaDeJugar ?general_formaDeJugar)
	(ca_reflejosBuenos ?reflejos)
	(ca_comoEsTuTiming ?timing)
	=>
	(if (eq ?timing "B")
	then
		(printout t crlf "Cuantos botones te parecen mucho?" crlf)
		(printout t crlf "(A) Dos" crlf)
		(printout t crlf "(B) Todos los del mando se me hacen poco" crlf)
		(bind ?cuantosBotones(readline))
		(assert(ca_cuantosBotones ?cuantosBotones))
		
	(if (eq ?cuantosBotones "A")
	then
		;CONCLUSION: PAC-MAN
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(ca_reflejosBuenos ?reflejos)
			(ca_comoEsTuTiming ?timing)
			(ca_cuantosBotones ?cuantosBotones)))
		)

	(if (eq ?cuantosBotones "B")
	then
		;CONCLUSION: Punch Out
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(ca_reflejosBuenos ?reflejos)
			(ca_comoEsTuTiming ?timing)
			(ca_cuantosBotones ?cuantosBotones)))
		)
	)	
)

(defrule ca_regla4
	(general_formaDeJugar ?general_formaDeJugar)
	(ca_reflejosBuenos ?reflejos)
	=>
	(if (eq ?reflejos "B")
	then
		(printout t crlf "Que aventura prefieres?" crlf)
		(printout t crlf "(A) Llena de mounstruos" crlf)
		(printout t crlf "(B) Carreras de autos" crlf)
		(bind ?aventuraPref(readline))
		(assert(ca_aventuraPreferida ?aventuraPref))
		)
)

(defrule ca_regla5
	(general_formaDeJugar ?general_formaDeJugar)
	(ca_reflejosBuenos ?reflejos)
	(ca_aventuraPreferida ?aventuraPref)
	=>
	(if (eq ?aventuraPref "A")
	then
		(printout t crlf "Cual protagonista te resulta mas interesante?" crlf)
		(printout t crlf "(A) Un brujo asesino de mounstruos" crlf)
		(printout t crlf "(B) Un cuidador nocturno en un almacen rodeado de animatronicos malignos" crlf)
		(bind ?protaInteresante(readline))
		(assert(ca_protaInteresante ?protaInteresante))

	(if (eq ?protaInteresante "B")
	then
		;CONCLUSION: FIVE NIGHTS AT FREDDYS
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(ca_reflejosBuenos ?reflejos)
			(ca_aventuraPreferida ?aventuraPref)
			(ca_protaInteresante ?protaInteresante)))
		)
	)	
)

(defrule ca_regla6
	(general_formaDeJugar ?general_formaDeJugar)
	(ca_reflejosBuenos ?reflejos)
	(ca_comoEsTuTiming ?timing)
	(ca_aventuraPreferida ?aventuraPref)
	(ca_protaInteresante ?protaInteresante)
	=>
	(if (eq ?timing "A")
	then
		(printout t crlf "Cual punto de vista de camara te gusta?" crlf)
		(printout t crlf "(A) Tercera persona" crlf)
		(printout t crlf "(B) Vista aerea" crlf)
		(bind ?tipoCamara(readline))
		(assert(ca_tipoCamara ?tipoCamara))
		
	(if (eq ?tipoCamara "A")
	then
		;CONCLUSION: THE WITCHER 3 WILD HUNT
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(ca_reflejosBuenos ?reflejos)
			(ca_aventuraPreferida ?aventuraPref)
			(ca_protaInteresante ?protaInteresante)
			(ca_tipoCamara ?tipoCamara)))
		)

	(if (eq ?tipoCamara "B")
	then
		;CONCLUSION: PTHE WITCHER
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(ca_reflejosBuenos ?reflejos)
			(ca_aventuraPreferida ?aventuraPref)
			(ca_protaInteresante ?protaInteresante)
			(ca_tipoCamara ?tipoCamara)))
		)
	)	
)

(defrule ca_regla7
	(general_formaDeJugar ?general_formaDeJugar)
	(ca_reflejosBuenos ?reflejos)
	(ca_aventuraPreferida ?aventuraPref)
	=>
	(if (eq ?aventuraPref "B")
	then
		(printout t crlf "Que tipo de carrera te gusta mas?" crlf)
		(printout t crlf "(A) Simulador de carreras oficiales" crlf)
		(printout t crlf "(B) Carreras callejeras" crlf)
		(bind ?tipoCarrera(readline))
		(assert(ca_tipoCarrera ?tipoCarrera))

	(if (eq ?tipoCarrera "A")
	then
		;CONCLUSION: GRAN TURISMO
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(ca_reflejosBuenos ?reflejos)
			(ca_aventuraPreferida ?aventuraPref)
			(ca_tipoCarrera ?tipoCarrera)))
		)

	(if (eq ?tipoCarrera "B")
	then
		;CONCLUSION: NEED FOR SPEED UNDERGROUND 2
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(ca_reflejosBuenos ?reflejos)
			(ca_aventuraPreferida ?aventuraPref)
			(ca_tipoCarrera ?tipoCarrera)))
		)
	)	
)

;REGLAS PARA JUGADOR QUE USA MUCHO EL CEREBRO

(defrule uc_regla1
	(general_formaDeJugar ?general_formaDeJugar)
	=>
	(if (eq ?general_formaDeJugar "B")
	then
		(printout t crlf "Que tipo de juego prefiere?" crlf)
		(printout t crlf "(A) Puzzles" crlf)
		(printout t crlf "(B) Simulacion" crlf)
		(bind ?tipoJuego(readline))
		(assert(uc_tipoJuego ?tipoJuego))
	
	(if (eq ?tipoJuego "A")
	then
		(printout t crlf "Como prefiere el desarrollo del juego?" crlf)
		(printout t crlf "(A) Lineal" crlf)
		(printout t crlf "(B) Historia elaborada" crlf)
		(bind ?desJuego(readline))
		(assert(uc_desarrolloJuego ?desJuego))
		)
	)
)

(defrule uc_regla2
	(general_formaDeJugar ?general_formaDeJugar)
	(uc_tipoJuego ?tipoJuego)
	(uc_desarrolloJuego ?desJuego)
	=>
	(if (eq ?desJuego "A")
	then
		(printout t crlf "Cual estilo prefiere?" crlf)
		(printout t crlf "(A) Retro" crlf)
		(printout t crlf "(B) Moderno" crlf)
		(bind ?estiloJuego(readline))
		(assert(uc_estiloJuego ?estiloJuego))

	(if (eq ?estiloJuego "A")
	then
		;CONCLUSION: TETRIS
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(uc_tipoJuego ?tipoJuego)
			(uc_desarrolloJuego ?desJuego)
			(uc_estiloJuego ?estiloJuego)))
		)

	(if (eq ?estiloJuego "B")
	then
		;CONCLUSION: LUMINES PUZZLE FUSION
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(uc_tipoJuego ?tipoJuego)
			(uc_desarrolloJuego ?desJuego)
			(uc_estiloJuego ?estiloJuego)))
		)
	)	
)

(defrule ca_regla3
	(general_formaDeJugar ?general_formaDeJugar)
	(uc_tipoJuego ?tipoJuego)
	(uc_desarrolloJuego ?desJuego)
	=>
	(if (eq ?desJuego "B")
	then
		(printout t crlf "Cual ambientacion le atrae en el estilo de dibujo?" crlf)
		(printout t crlf "(A) Oscuro/Tenebroso" crlf)
		(printout t crlf "(B) Colorido/Alegre" crlf)
		(bind ?estiloDibujo(readline))
		(assert(uc_estiloDibujo ?estiloDibujo))

	(if (eq ?estiloDibujo "A")
	then
		;CONCLUSION: LIMBO
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(uc_tipoJuego ?tipoJuego)
			(uc_desarrolloJuego ?desJuego)
			(uc_estiloDibujo ?estiloDibujo)))
		)
	)	
)

(defrule ca_regla4
	(general_formaDeJugar ?general_formaDeJugar)
	(uc_tipoJuego ?tipoJuego)
	(uc_desarrolloJuego ?desJuego)
	(uc_estiloDibujo ?estiloDibujo)
	=>
	(if (eq ?estiloDibujo "B")
	then
		(printout t crlf "Estilo de desarrollo?" crlf)
		(printout t crlf "(A) Oriental" crlf)
		(printout t crlf "(B) Occidental" crlf)
		(bind ?estiloDes(readline))
		(assert(uc_estiloDesarrollo ?estiloDes))

	(if (eq ?estiloDes "A")
	then
		;CONCLUSION: REROLL
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(uc_tipoJuego ?tipoJuego)
			(uc_desarrolloJuego ?desJuego)
			(uc_estiloDibujo ?estiloDibujo)
			(uc_estiloDesarrollo ?estiloDes)))
		)
	)	
)

(defrule uc_regla5
	(general_formaDeJugar ?general_formaDeJugar)
	(uc_tipoJuego ?tipoJuego)
	(uc_desarrolloJuego ?desJuego)
	(uc_estiloDibujo ?estiloDibujo)
	(uc_estiloDesarrollo ?estiloDes)
	=>
	(if (eq ?estiloDes "B")
	then
		(printout t crlf "Que tipo de texturas le gustan?" crlf)
		(printout t crlf "(A) Indi" crlf)
		(printout t crlf "(B) Elaboradas" crlf)
		(bind ?tipoTexturas(readline))
		(assert(uc_tipoTexturas ?tipoTexturas))
		
	(if (eq ?tipoTexturas "A")
	then
		;CONCLUSION: BRAID
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(uc_tipoJuego ?tipoJuego)
			(uc_desarrolloJuego ?desJuego)
			(uc_estiloDibujo ?estiloDibujo)
			(uc_estiloDesarrollo ?estiloDes)
			(uc_tipoTexturas ?tipoTexturas)))
		)

	(if (eq ?tipoTexturas "B")
	then
		;CONCLUSION: PORTAL 2
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(uc_tipoJuego ?tipoJuego)
			(uc_desarrolloJuego ?desJuego)
			(uc_estiloDibujo ?estiloDibujo)
			(uc_estiloDesarrollo ?estiloDes)
			(uc_tipoTexturas ?tipoTexturas)))
		)
	)	
)

(defrule uc_regla6
	(general_formaDeJugar ?general_formaDeJugar)
	(uc_tipoJuego ?tipoJuego)
	=>
	(if (eq ?tipoJuego "B")
	then
		(printout t crlf "Que le gustaria controlar en la simulacion?" crlf)
		(printout t crlf "(A) Humanos" crlf)
		(printout t crlf "(B) Ciudades" crlf)
		(bind ?controlEnSimulacion(readline))
		(assert(uc_controlEnSimulacion ?controlEnSimulacion))
		
	(if (eq ?controlEnSimulacion "A")
	then
		;CONCLUSION: THE SIMS 4
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(uc_tipoJuego ?tipoJuego)
			(uc_controlEnSimulacion ?controlEnSimulacion)))
		)

	(if (eq ?controlEnSimulacion "B")
	then
		;CONCLUSION: SIM CITY BUILDIT
		(assert (condiciones
			(general_formaDeJugar ?general_formaDeJugar)
			(uc_tipoJuego ?tipoJuego)
			(uc_controlEnSimulacion ?controlEnSimulacion)))
		)
	)	
)












;REGLAS DE CONCLUSION
;Regla 1
(defrule R1 "Tetris"
(condiciones
(general_formaDeJugar "B")
(uc_tipoJuego "A")
(uc_desarrolloJuego "A")
(uc_estiloJuego "A"))
=>
(printout t "Se recomienda el mitico juego de Tetris" crlf)
(retract *)
(assert(iniciar))
)

;Regla 2
(defrule R2 "Lumines"
(condiciones
(general_formaDeJugar "B")
(uc_tipoJuego "A")
(uc_desarrolloJuego "A")
(uc_estiloJuego "B"))
=>
(printout t "Se recomienda el juego Lumines" crlf)
(retract *)
(assert(iniciar))
)

;Regla 3
(defrule R3 "Limbo"
(condiciones
(general_formaDeJugar "B")
(uc_tipoJuego "A")
(uc_desarrolloJuego "B")
(uc_estiloDibujo "A"))
=>
(printout t "Se recomienda el juego Limbo" crlf)
(retract *)
(assert(iniciar))
)

;Regla 4
(defrule R4 "Reroll"
(condiciones
(general_formaDeJugar "B")
(uc_tipoJuego "A")
(uc_desarrolloJuego "B")
(uc_estiloDibujo "B")
(uc_estiloDesarrollo "A"))
=>
(printout t "Se recomienda el juego Reroll" crlf)
(retract *)
(assert(iniciar))
)

;Regla 5
(defrule R5 "Braid"
(condiciones
(general_formaDeJugar "B")
(uc_tipoJuego "A")
(uc_desarrolloJuego "B")
(uc_estiloDibujo "B")
(uc_estiloDesarrollo "B")
(uc_tipoTexturas "A"))
=>
(printout t "Se recomienda el juego Braid" crlf)
(retract *)
(assert(iniciar))
)

;Regla 6
(defrule R6 "Portal"
(condiciones
(general_formaDeJugar "B")
(uc_tipoJuego "B")
(uc_desarrolloJuego "B")
(uc_estiloDibujo "B")
(uc_estiloDesarrollo "B")
(uc_tipoTexturas "B"))
=>
(printout t "Se recomienda el juego Portal" crlf)
(retract *)
(assert(iniciar))
)

;Regla 7
(defrule R7 "Sims4"
(condiciones
(general_formaDeJugar "B")
(uc_tipoJuego "B")
(uc_controlEnSimulacion "A"))
=>
(printout t "Se recomienda el juego Sims4" crlf)
(retract *)
(assert(iniciar))
)

;Regla 8
(defrule R8 "Sim city"
(condiciones
(general_formaDeJugar "B")
(uc_tipoJuego "B")
(uc_controlEnSimulacion "B"))
=>
(printout t "Se recomienda el juego Sim city" crlf)
(retract *)
(assert(iniciar))
)

;Regla 9
(defrule R9 "rock band"
(condiciones
(general_formaDeJugar "A")
(ca_reflejosBuenos "A")
(ca_comoEsTuTiming "A")
(ca_tematicaPreferida "A"))
=>
(printout t "Se recomienda el juego Rock Band" crlf)
(retract *)
(assert(iniciar))
)

;Regla 10
(defrule R10 "Pac-man"
(condiciones
(general_formaDeJugar "A")
(ca_reflejosBuenos "A")
(ca_comoEsTuTiming "B")
(ca_cuantosBotones "A"))
=>
(printout t "Se recomienda el juego Pac-Man" crlf)
(retract *)
(assert(iniciar))
)

;Regla 11
(defrule R11 "Punch out"
(condiciones
(general_formaDeJugar "A")
(ca_reflejosBuenos "A")
(ca_comoEsTuTiming "B")
(ca_cuantosBotones "B"))
=>
(printout t "Se recomienda el juego Punch out" crlf)
(retract *)
(assert(iniciar))
)

;Regla 12
(defrule R12 "The witcher wild hunt"
(condiciones
(general_formaDeJugar "A")
(ca_reflejosBuenos "B")
(ca_aventuraPreferida "A")
(ca_protaInteresante "A")
(ca_tipoCamara "A"))
=>
(printout t "Se recomienda el juego The Witcher wild hunt" crlf)
(retract *)
(assert(iniciar))
)
;Regla 13
(defrule R13 "The witcher enhanced edition"
(condiciones
(general_formaDeJugar "A")
(ca_reflejosBuenos "B")
(ca_aventuraPreferida "A")
(ca_protaInteresante "A")
(ca_tipoCamara "B"))
=>
(printout t "Se recomienda el juego The Witcher Enhanced edition" crlf)
(retract *)
(assert(iniciar))
)

;Regla 14
(defrule R14 "FNAF"
(condiciones
(general_formaDeJugar "A")
(ca_reflejosBuenos "B")
(ca_aventuraPreferida "A")
(ca_protaInteresante "B"))
=>
(printout t "Se recomienda el juego Five night at Freddy's" crlf)
(retract *)
(assert(iniciar))
)
;Regla 15
(defrule R15 "Grand turismo"
(condiciones
(general_formaDeJugar "A")
(ca_reflejosBuenos "B")
(ca_aventuraPreferida "B")
(ca_tipoCarrera "A"))
=>
(printout t "Se recomienda el juego Grand turismo" crlf)
(retract *)
(assert(iniciar))
)
;Regla 16
(defrule R16 "Need for speed"
(condiciones
(general_formaDeJugar "A")
(ca_reflejosBuenos "B")
(ca_aventuraPreferida "B")
(ca_tipoCarrera "B"))
=>
(printout t "Se recomienda el juego Need for speed underground" crlf)
(retract *)
(assert(iniciar))
)
;Regla 17
(defrule R17 "Ikaruga"
(condiciones
(general_formaDeJugar "A")
(ca_reflejosBuenos "A")
(ca_comoEsTuTiming "A")
(ca_tematicaPreferida "B"))
=>
(printout t "Se recomienda el juego Ikaruga" crlf)
(retract *)
(assert(iniciar))
)