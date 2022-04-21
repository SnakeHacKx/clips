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
	(slot uc_perfilDesarrollador (type STRING)(default "ninguno"))
	(slot ae_xpEnProgramacion (type STRING)(default "ninguno"))
	(slot ae_paradigmaProgPreferido (type STRING)(default "ninguno"))
	(slot ae_conoceFundamentosProg (type STRING)(default "ninguno"))
	(slot ae_SOObjetivo (type STRING)(default "ninguno"))
	(slot ae_areaDeAplicacion (type STRING)(default "ninguno"))
	(slot ae_paraManejoServidores (type STRING)(default "ninguno"))
	(slot ae_requiereScripts (type STRING)(default "ninguno"))
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













;REGLAS DE CONCLUSION
;Regla 1
(defrule R1 "Tetris"
(condiciones
(modo_de_juego "B")
(tipo_de_juego "A")
(desarrollo_lineal "A")
(estilo_retro "A")
=>
(printout t "Se recomienda el mitico juego de Tetris" crlf)
(retract *)
(assert(iniciar))
)

;Regla 2
(defrule R2 "Lumines"
(condiciones
(modo_de_juego "B")
(tipo_de_juego "A")
(desarrollo_lineal "A")
(estilo_retro "B")
=>
(printout t "Se recomienda el juego Lumines" crlf)
(retract *)
(assert(iniciar))
)

;Regla 3
(defrule R3 "Limbo"
(condiciones
(modo_de_juego "B")
(tipo_de_juego "A")
(desarrollo_lineal "B")
(Ambientacion_en_el_dibujo "A")
=>
(printout t "Se recomienda el juego Limbo" crlf)
(retract *)
(assert(iniciar))
)

;Regla 4
(defrule R4 "Reroll"
(condiciones
(modo_de_juego "B")
(tipo_de_juego "A")
(desarrollo_lineal "B")
(Ambientacion_en_el_dibujo "B")
(Estilo_de_desarrollo "A")
=>
(printout t "Se recomienda el juego Reroll" crlf)
(retract *)
(assert(iniciar))
)

;Regla 5
(defrule R5 "Braid"
(condiciones
(modo_de_juego "B")
(tipo_de_juego "A")
(desarrollo_lineal "B")
(Ambientacion_en_el_dibujo "B")
(Estilo_de_desarrollo "B")
(tipo_de_texturas "A")
=>
(printout t "Se recomienda el juego Braid" crlf)
(retract *)
(assert(iniciar))
)

;Regla 6
(defrule R6 "Portal"
(condiciones
(modo_de_juego "B")
(tipo_de_juego "B")
(desarrollo_lineal "B")
(Ambientacion_en_el_dibujo "B")
(Estilo_de_desarrollo "B")
(tipo_de_texturas "B")
=>
(printout t "Se recomienda el juego Portal" crlf)
(retract *)
(assert(iniciar))
)

;Regla 7
(defrule R7 "Sims4"
(condiciones
(modo_de_juego "B")
(tipo_de_juego "B")
(que_controlar_simulacion "A")
=>
(printout t "Se recomienda el juego Sims4" crlf)
(retract *)
(assert(iniciar))
)

;Regla 8
(defrule R8 "Sim city"
(condiciones
(modo_de_juego "B")
(tipo_de_juego "B")
(que_controlar_simulacion "B")
=>
(printout t "Se recomienda el juego Sim city" crlf)
(retract *)
(assert(iniciar))
)

;Regla 9
(defrule R9 "rock band"
(condiciones
(modo_de_juego "A")
(reflejos "A")
(timing "A")
(tematica "A")
=>
(printout t "Se recomienda el juego Rock Band" crlf)
(retract *)
(assert(iniciar))
)

;Regla 10
(defrule R10 "Pac-man"
(condiciones
(modo_de_juego "A")
(reflejos "A")
(timing "B")
(cantidad_botones "A")
=>
(printout t "Se recomienda el juego Pac-Man" crlf)
(retract *)
(assert(iniciar))
)

;Regla 11
(defrule R11 "Punch out"
(condiciones
(modo_de_juego "A")
(reflejos "A")
(timing "B")
(cantidad_botones "B")
=>
(printout t "Se recomienda el juego Punch out" crlf)
(retract *)
(assert(iniciar))
)

;Regla 12
(defrule R12 "The witcher wild hunt"
(condiciones
(modo_de_juego "A")
(reflejos "B")
(montruos_carreras "A")
(protagonista "A")
(perspectiva "A")
=>
(printout t "Se recomienda el juego The Witcher wild hunt" crlf)
(retract *)
(assert(iniciar))
)
;Regla 13
(defrule R13 "The witcher enhanced edition"
(condiciones
(modo_de_juego "A")
(reflejos "B")
(montruos_carreras "A")
(protagonista "A")
(perspectiva "B")
=>
(printout t "Se recomienda el juego The Witcher Enhanced edition" crlf)
(retract *)
(assert(iniciar))
)

;Regla 14
(defrule R14 "FNAF"
(condiciones
(modo_de_juego "A")
(reflejos "B")
(montruos_carreras "A")
(protagonista "B")
=>
(printout t "Se recomienda el juego Five night at Freddy's" crlf)
(retract *)
(assert(iniciar))
)
;Regla 15
(defrule R15 "Grand turismo"
(condiciones
(modo_de_juego "A")
(reflejos "B")
(montruos_carreras "B")
(tipo_de_carreras "A")
=>
(printout t "Se recomienda el juego Grand turismo" crlf)
(retract *)
(assert(iniciar))
)
;Regla 16
(defrule R16 "Need for speed"
(condiciones
(modo_de_juego "A")
(reflejos "B")
(montruos_carreras "B")
(tipo_de_carreras "B")
=>
(printout t "Se recomienda el juego Need for speed underground" crlf)
(retract *)
(assert(iniciar))
)