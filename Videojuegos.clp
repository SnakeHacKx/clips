(deftemplate condiciones
	(slot general_tipoDesarrollo (type STRING)(default "ninguno"))
    
    ;Desarrollo Web
	(slot dw_tipoDesarrollador (type STRING)(default "ninguno"))
	(slot dw_experienciaFrontend (type STRING)(default "ninguno")) 
	(slot dw_utilizaFrameworks (type STRING)(default "ninguno")) 
	(slot dw_preferenciaFramework (type STRING)(default "ninguno"))
	(slot dw_gestorBaseDeDatos (type STRING)(default "ninguno"))
	(slot dw_SOUtilizado (type STRING)(default "ninguno"))


    ;Aplicaciones Escritorio
	(slot ae_perfilDesarrollador (type STRING)(default "ninguno"))
	(slot ae_xpEnProgramacion (type STRING)(default "ninguno"))
	(slot ae_paradigmaProgPreferido (type STRING)(default "ninguno"))
	(slot ae_conoceFundamentosProg (type STRING)(default "ninguno"))
	(slot ae_SOObjetivo (type STRING)(default "ninguno"))
	(slot ae_areaDeAplicacion (type STRING)(default "ninguno"))
	(slot ae_paraManejoServidores (type STRING)(default "ninguno"))
	(slot ae_requiereScripts (type STRING)(default "ninguno"))
)
;REGLAS DE CONTROL
















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