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
(Usando_mucho_el_celebro "B")
(tipo_de_juego_puzzles "A")
(desarrollo_lineal "A")
(estilo_retro "A")
(dw_preferenciaFramework "A"))
=>
(printout t "Se recomienda el mitico juego de Tetris" crlf)
(retract *)
(assert(iniciar))
)

;Regla 2
(defrule R1 "Tetris"
(condiciones
(Usando_mucho_el_celebro "B")
(tipo_de_juego_puzzles "A")
(desarrollo_lineal "A")
(estilo_retro "A")
(dw_preferenciaFramework "A"))
=>
(printout t "Se recomienda el mitico juego de Tetris" crlf)
(retract *)
(assert(iniciar))
)

