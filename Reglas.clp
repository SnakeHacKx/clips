(deftemplate condiciones
	(slot general_tipoDesarrollo (type STRING)(default "ninguno"))
    
    ;Desarrollo Web
	(slot dw_tipoDesarrollador (type STRING)(default "ninguno"))
	(slot dw_experienciaFrontend (type STRING)(default "ninguno")) 
	(slot dw_utilizaFrameworks (type STRING)(default "ninguno")) 
	(slot dw_preferenciaFramework (type STRING)(default "ninguno"))
	(slot dw_gestorBaseDeDatos (type STRING)(default "ninguno"))
	(slot dw_SOUtilizado (type STRING)(default "ninguno"))

    ;Desarrollo de Videojuegos
	(slot dv_plataforma (type STRING)(default "ninguno"))
	(slot dv_formato (type STRING)(default "ninguno"))
	(slot dv_motor (type STRING)(default "ninguno"))
	(slot dv_perfilDesarrollador (type STRING)(default "ninguno"))
	(slot dv_motorSegunPresupuesto (type STRING)(default "ninguno"))
	(slot dv_tipoVideojuego (type STRING)(default "ninguno"))

    ;Aplicaciones Escritorio
	(slot ae_perfilDesarrollador (type STRING)(default "ninguno"))
	(slot ae_experienciaEnProgramacion (type STRING)(default "ninguno"))
	(slot ae_paradigmaProgPreferido (type STRING)(default "ninguno"))
	(slot ae_conoceFundamentosProg (type STRING)(default "ninguno"))
	(slot ae_SOObjetivo (type STRING)(default "ninguno"))
	(slot ae_areaDeAplicacion (type STRING)(default "ninguno"))
	(slot ae_paraManejoServidores (type STRING)(default "ninguno"))
	(slot ae_requiereScripts (type STRING)(default "ninguno"))

    ;Aplicaciones Moviles
	(slot am_SOObjetivo (type STRING)(default "ninguno"))
	(slot am_SOUtilizado (type STRING)(default "ninguno"))
	(slot am_IDEUtilizado (type STRING)(default "ninguno"))
	(slot am_UtilizaXamarin (type STRING)(default "ninguno"))
	(slot am_paraAplicacionesHibridas (type STRING)(default "ninguno"))
	(slot am_experienciaUtilizandoQT (type STRING)(default "ninguno"))
	(slot am_framework (type STRING)(default "ninguno"))
)

;DEFINIENDO REGLA INICIAL
(defrule regla_inicial
	(iniciar go)
	=>
	(printout t crlf "Para que tipo de desarrollo lo utilizara?" crlf)
	(printout t crlf "(A) Web" crlf)
	(printout t crlf "(B) Escritorio" crlf)
	(bind ?general_tipoDesarrollo(readline))
	(assert(general_tipoDesarrollo ?general_tipoDesarrollo))
)

;REGLAS PARA DESARROLLO WEB
;formato usado: tipoDesarrollo_nivelDelArbol_numeroDeRegla
(defrule dw_n2_regla1
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	=>
	(if (eq ?general_tipoDesarrollo "A")
	then
		(printout t crlf "Que tipo de desarrollador es?" crlf)
		(printout t crlf "(A) Frontend" crlf)
		(printout t crlf "(B) Backend" crlf)
		(bind ?tipoDes(readline))
		(assert(dw_tipoDesarrollador ?tipoDes))
	(if (eq ?tipoDes "A")
	then
		(printout t crlf "Ha trabajado en desarrollo Frontend anteriormente?" crlf)
		(printout t crlf "(A) Si" crlf)
		(printout t crlf "(B) No" crlf)
		(bind ?xp_frontend(readline))
		(assert(dw_experienciaFrontend ?xp_frontend))
		)
	)
)

(defrule dw_n4_regla2
	(dw_experienciaFrontend ?xp_frontend)
	=>
	(if (eq ?xp_frontend "A")
	then
		(printout t crlf "Utiliza Framework para trabajar?" crlf)
		(printout t crlf "(A) Si" crlf)
		(printout t crlf "(B) No" crlf)
		(bind ?utilizaFramework(readline))
		(assert(dw_utilizaFrameworks ?utilizaFramework))
	(if (eq ?utilizaFramework "A")
	then
		(printout t crlf "Cual prefiere?" crlf)
		(printout t crlf "(A) Angular" crlf)
		(printout t crlf "(B) Spring" crlf)
		(bind ?prefFramework(readline))
		(assert(dw_preferenciaFramework ?prefFramework))
		)
	)
)

(defrule dw_n4_regla3
	(dw_experienciaFrontend ?xp_frontend)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(dw_tipoDesarrollador ?tipoDes)
	=>
	(if (eq ?xp_frontend "A")
	then
		(printout t crlf "Utiliza Framework para trabajar?" crlf)
		(printout t crlf "(A) Si" crlf)
		(printout t crlf "(B) No" crlf)
		(bind ?utilizaFramework(readline))
		(assert(dw_utilizaFrameworks ?utilizaFramework))
	(if (eq ?utilizaFramework "B")
	then
		;CONCLUSION: SASS
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(dw_tipoDesarrollador ?tipoDes)
			(dw_experienciaFrontend ?xp_frontend)
			(dw_utilizaFrameworks ?utilizaFramework)))
		)
	)
)

(defrule dw_n5_regla4
	(dw_preferenciaFramework ?prefFramework)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(dw_tipoDesarrollador ?tipoDes)
	(dw_experienciaFrontend ?xp_frontend)
	(dw_utilizaFrameworks ?utilizaFramework)
	=>
	(if (eq ?prefFramework "A")
	then
		;CONCLUSION: JavaScript
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(dw_tipoDesarrollador ?tipoDes)
			(dw_experienciaFrontend ?xp_frontend)
			(dw_utilizaFrameworks ?utilizaFramework)
			(dw_preferenciaFramework ?prefFramework))
		)
	)
)

(defrule dw_n5_regla5
	(dw_preferenciaFramework ?prefFramework)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(dw_tipoDesarrollador ?tipoDes)
	(dw_experienciaFrontend ?xp_frontend)
	(dw_utilizaFrameworks ?utilizaFramework)
	=>
	(if (eq ?prefFramework "B")
	then
		;CONCLUSION: Java
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(dw_tipoDesarrollador ?tipoDes)
			(dw_experienciaFrontend ?xp_frontend)
			(dw_utilizaFrameworks ?utilizaFramework)
			(dw_preferenciaFramework ?prefFramework)))
	)
)

(defrule dw_n2_regla6
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	=>
	(if (eq ?general_tipoDesarrollo "A")
	then
		(printout t crlf "Que tipo de desarrollador es?" crlf)
		(printout t crlf "(A) Frontend" crlf)
		(printout t crlf "(B) Backend" crlf)
		(bind ?tipoDes(readline))
		(assert(dw_tipoDesarrollador ?tipoDes))
	(if (eq ?tipoDes "B")
	then
		(printout t crlf "Que gestor de bases de datos desea utilizar?" crlf)
		(printout t crlf "(A) MySQL" crlf)
		(printout t crlf "(B) SQL Server" crlf)
		(bind ?gestorBD(readline))
		(assert(dw_gestorBaseDeDatos ?gestorBD))
		)
	)
)

(defrule dw_n3_regla7
	(dw_gestorBaseDeDatos ?gestorBD)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(dw_tipoDesarrollador ?tipoDes)
	=>
	(if (eq ?gestorBD "A")
	then
		;CONCLUSION: PHP
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(dw_tipoDesarrollador ?tipoDes)
			(dw_gestorBaseDeDatos ?gestorBD))
		)
	)
)

(defrule dw_n4_regla8
	(dw_gestorBaseDeDatos ?gestorBD)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(dw_tipoDesarrollador ?tipoDes)
	=>
	(if (eq ?gestorBD "B")
	then
		(printout t crlf "Que SO utilizara para desarrollar?" crlf)
		(printout t crlf "(A) Windows" crlf)
		(printout t crlf "(B) MacOS/Linux" crlf)
		(bind ?SOUtilizadoDesarrollar(readline))
		(assert(dw_SOUtilizado ?SOUtilizadoDesarrollar))
		)
	)
	(if (eq ?gestorBD "A")
	then
		;CONCLUSION: C#
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(dw_tipoDesarrollador ?tipoDes)
			(dw_gestorBaseDeDatos ?gestorBD)
			(dw_SOUtilizado ?SOUtilizadoDesarrollar))
		)
	)	
)

(defrule dw_n4_regla9
	(dw_gestorBaseDeDatos ?gestorBD)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(dw_tipoDesarrollador ?tipoDes)
	=>
	(if (eq ?gestorBD "B")
	then
		(printout t crlf "Que SO utilizara para desarrollar?" crlf)
		(printout t crlf "(A) Windows" crlf)
		(printout t crlf "(B) MacOS/Linux" crlf)
		(bind ?SOUtilizadoDesarrollar(readline))
		(assert(dw_SOUtilizado ?SOUtilizadoDesarrollar))
		)
	)
	(if (eq ?gestorBD "B")
	then
		;CONCLUSION: Python
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(dw_tipoDesarrollador ?tipoDes)
			(dw_gestorBaseDeDatos ?gestorBD)
			(dw_SOUtilizado ?SOUtilizadoDesarrollar))
		)
	)
)


;REGLA 1 
(defrule R1 "JavaScript web"
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "A")
(dw_experienciaFrontend "A")
(dw_utilizaFrameworks "A")
(dw_preferenciaFramework "A")
=>
(printout t "se recomienda el lenguaje JavaScript" crlf))

;;Regla 2
(defrule R2 "Java web"
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "A")
(dw_experienciaFrontend "A")
(dw_utilizaFrameworks "A")
(dw_preferenciaFramework "B")
=>
(printout t "Se recomienda el lenguaje Java" crlf))

;;Regla 3
(defrule R3 "Sass web"
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "A")
(dw_experienciaFrontend "A")
(dw_utilizaFrameworks "B")
=>
(printout t "se recomienda el lenguaje Sass" crlf))

;Regla 4
(defrule R4 "html web"
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "A")
(dw_experienciaFrontend "B")
=>
(printout t "se recomienda el lenguaje html/css" crlf))

;Regla 5
(defrule R5 "PHP web"
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "B")
(dw_gestorBaseDeDatos "A")
=>
(printout t "se recomienda el lenguaje PHP" crlf))

;Regla 6
(defrule R6 "C# web"
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "B")
(dw_gestorBaseDeDatos "B")
(dw_SOUtilizado "A")
=>
(printout t "se recomienda el lenguaje C#" crlf))

;Regla 7
(defrule R7 "python web"
(defrule R6 "C# web"
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "B")
(dw_gestorBaseDeDatos "B")
(dw_SOUtilizado "B")
=>
(printout t "se recomienda el lenguaje Python" crlf))

;Regla 8
(defrule R8 "C#juegos"
(general_tipoDesarrollo "B")
(dv_plataforma "A")
(dv_formato "B")
(dv_motor "A")
=>
(printout t "se recomienda el lenguaje C#" crlf))

;Regla 9
(defrule R9 "C++ juegos"
(general_tipoDesarrollo "B")
(dv_plataforma "A")
(dv_formato "B")
(dv_motor "B")
=>
(printout t "se recomienda el lenguaje C++" crlf))

;Regla 10
(defrule R10 "javascript juegos"
(general_tipoDesarrollo "B")
(dv_plataforma "A")
(dv_formato "A")
=>
(printout t "se recomienda el lenguaje Javascript" crlf))

;Regla 11
(defrule R11 "Lua juegos"
(general_tipoDesarrollo "B")
(dv_plataforma "B")
(dv_perfilDesarrollador "A")
(dv_motorSegunPresupuesto "A")
=>
(printout t "se recomienda el lenguaje Lua" crlf))

;Regla 12
(defrule R12 "C++ juegos"
(general_tipoDesarrollo "B")
(dv_plataforma "B")
(dv_perfilDesarrollador "A")
(dv_motorSegunPresupuesto "B")
=>
(printout t "se recomienda el lenguaje C++" crlf))

;Regla 13
(defrule R13 "C# juegos"
(general_tipoDesarrollo "B")
(dv_plataforma "B")
(dv_perfilDesarrollador "B")
(dv_tipoVideojuego "A")
=>
(printout t "se recomienda el lenguaje C#" crlf))

;Regla 14
(defrule R14 "Python juegos"
(general_tipoDesarrollo "B")
(dv_plataforma "B")
(dv_perfilDesarrollador "B")
(dv_tipoVideojuego "B")
=>
(printout t "se recomienda el lenguaje Python" crlf))

;Regla 15
(defrule R15 "C escritorio"
(general_tipoDesarrollo "C")
(ae_perfilDesarrollador "A")
(ae_experienciaEnProgramacion "A")
(ae_paradigmaProgPreferido "A")
=>
(printout t "se recomienda el lenguaje C" crlf))

;Regla 16
(defrule R16 "Rust escritorio"
(general_tipoDesarrollo "C")
(ae_perfilDesarrollador "A")
(ae_experienciaEnProgramacion "A")
(ae_paradigmaProgPreferido "B")
=>
(printout t "se recomienda el lenguaje rust" crlf))

;Regla 17
(defrule R17 "VBN escritorio"
(general_tipoDesarrollo "C")
(ae_perfilDesarrollador "A")
(ae_experienciaEnProgramacion "B")
(ae_conoceFundamentosProg "A")
=>
(printout t "se recomienda el lenguaje visual basic.net" crlf))

;regla 18
(defrule R18 "scratch escritorio"
(general_tipoDesarrollo "C")
(ae_perfilDesarrollador "A")
(ae_experienciaEnProgramacion "B")
(ae_conoceFundamentosProg "B")
=>
(printout t "se recomienda el lenguaje scratch" crlf))

;regla 19
(defrule R19 "ruby escritorio"
(general_tipoDesarrollo "C")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "A")
(ae_areaDeAplicacion "A")
=>
(printout t "se recomienda el lenguaje ruby" crlf))

;regla 20
(defrule R20 "R escritorio"
(general_tipoDesarrollo "C")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "A")
(ae_areaDeAplicacion "B")
=>
(printout t "se recomienda el lenguaje R" crlf))

;Regla 21
(defrule R21 "C++ escritorio"
(general_tipoDesarrollo "C")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "A")
(ae_areaDeAplicacion "C")
=>
(printout t "se recomienda el lenguaje C++" crlf))

;Regla 22 
(defrule R22 "Perl escritorio"
(general_tipoDesarrollo "C")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "B")
(ae_paraManejoServidores "A")
=>
(printout t "se recomienda el lenguaje Perl" crlf))

;Regla 23
(defrule R23 "java escritorio"
(general_tipoDesarrollo "C")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "B")
(ae_paraManejoServidores "B")
(ae_requiereScripts "A")
=>
(printout t "se recomienda el lenguaje Java" crlf))

;Regla 24
(defrule R24 "applescript escritorio"
(general_tipoDesarrollo "C")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "B")
(ae_paraManejoServidores "B")
(ae_requiereScripts "B")
=>
(printout t "se recomienda el lenguaje applescripts" crlf))

;Regla 25
(defrule R25 "actioncript movil"
(general_tipoDesarrollo "D")
(am_SOObjetivo "A")
(am_SOUtilizado "A")
(am_IDEUtilizado "A")
=>
(printout t "se recomienda el lenguaje actioncript" crlf))

;Regla 26
(defrule R26 "C# movil"
(general_tipoDesarrollo "D")
(am_SOObjetivo "A")
(am_SOUtilizado "A")
(am_IDEUtilizado "B")
(am_UtilizaXamarin "A")
=>
(printout t "se recomienda el lenguaje C#" crlf))

;Regla 27
(defrule R27 "swift movil"
(general_tipoDesarrollo "D")
(am_SOObjetivo "A")
(am_SOUtilizado "A")
(am_IDEUtilizado "B")
(am_UtilizaXamarin "B")
=>
(printout t "se recomienda el lenguaje swift" crlf))

;Regla 28
(defrule R28 "Objective-c movil"
(general_tipoDesarrollo "D")
(am_SOObjetivo "A")
(am_SOUtilizado "B")
=>
(printout t "se recomienda el lenguaje Objective-c" crlf))

;Regla 29
(defrule R29 "QML movil"
(general_tipoDesarrollo "D")
(am_SOObjetivo "B")
(am_paraAplicacionesHibridas "A")
(am_experienciaUtilizandoQT "A")
=>
(printout t "se recomienda el lenguaje QML" crlf))

;Regla 30
(defrule R30 "javascript movil"
(general_tipoDesarrollo "D")
(am_SOObjetivo "B")
(am_paraAplicacionesHibridas "A")
(am_experienciaUtilizandoQT "B")
=>
(printout t "se recomienda el lenguaje Javascript" crlf))

;Regla 31
(defrule R31 "C# movil"
(general_tipoDesarrollo "D")
(am_SOObjetivo "B")
(am_paraAplicacionesHibridas "B")
(am_framework "A")
=>
(printout t "se recomienda el lenguaje C#" crlf))

;Regla 32
(defrule R32 "kotlin movil"
(general_tipoDesarrollo "D")
(am_SOObjetivo "B")
(am_paraAplicacionesHibridas "B")
(am_framework "B")
=>
(printout t "se recomienda el lenguaje Kotlin" crlf))
