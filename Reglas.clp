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

;DEFINIENDO REGLA INICIAL
(defrule regla_inicial
	(iniciar)
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
	(dw_utilizaFrameworks ?utilizaFramework)
	(dw_experienciaFrontend ?xp_frontend)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(dw_tipoDesarrollador ?tipoDes)
	=>
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
			(dw_preferenciaFramework ?prefFramework))
		)
	)
)

(defrule dw_n2_regla6
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(dw_tipoDesarrollador ?tipoDes)
	=>
	(if (eq ?tipoDes "B")
	then
		(printout t crlf "Que gestor de bases de datos desea utilizar?" crlf)
		(printout t crlf "(A) MySQL" crlf)
		(printout t crlf "(B) SQL Server" crlf)
		(bind ?gestorBD(readline))
		(assert(dw_gestorBaseDeDatos ?gestorBD))
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
	(if (eq ?tipoDes "B")
	then
		(printout t crlf "Que SO utilizara para desarrollar?" crlf)
		(printout t crlf "(A) Windows" crlf)
		(printout t crlf "(B) MacOS/Linux" crlf)
		(bind ?SOUtilizadoDesarrollar(readline))
		(assert(dw_SOUtilizado ?SOUtilizadoDesarrollar))
		
	(if (eq ?gestorBD "A")
	then
		;CONCLUSION: C#
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(dw_tipoDesarrollador ?tipoDes)
			(dw_gestorBaseDeDatos ?gestorBD)
			(dw_SOUtilizado ?SOUtilizadoDesarrollar)))
		)
	)	
)

(defrule dw_n4_regla9
	(dw_gestorBaseDeDatos ?gestorBD)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(dw_tipoDesarrollador ?tipoDes)
	(dw_SOUtilizado ?SOUtilizadoDesarrollar)
	=>
	(if (eq ?gestorBD "B")
	then
		;CONCLUSION: Python
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(dw_tipoDesarrollador ?tipoDes)
			(dw_gestorBaseDeDatos ?gestorBD)
			(dw_SOUtilizado ?SOUtilizadoDesarrollar)))
		)
)

(defrule dw_n4_regla10
	(dw_experienciaFrontend ?xp_frontend)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(dw_tipoDesarrollador ?tipoDes)
	=>
	(if (eq ?xp_frontend "B")
	then
		;CONCLUSION: HTML/CSS
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(dw_tipoDesarrollador ?tipoDes)
			(dw_experienciaFrontend ?xp_frontend)))
		)
)

;REGLAS PARA APLICACIONES DE ESCRITORIO
(defrule ae_n2_regla1
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	=>
	(if (eq ?general_tipoDesarrollo "B")
	then
		(printout t crlf "Cual es su perfil?" crlf)
		(printout t crlf "(A) Estudiante" crlf)
		(printout t crlf "(B) Profesional" crlf)
		(bind ?perfilDes(readline))
		(assert(ae_perfilDesarrollador ?perfilDes))
	(if (eq ?perfilDes "A")
	then
		(printout t crlf "Ha programado alguna vez?" crlf)
		(printout t crlf "(A) Si" crlf)
		(printout t crlf "(B) No" crlf)
		(bind ?xp_programacion(readline))
		(assert(ae_xpEnProgramacion ?xp_programacion))
		)
	)
)

(defrule ae_n4_regla2
	(ae_xpEnProgramacion ?xp_programacion)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(ae_perfilDesarrollador ?perfilDes)
	=>
	(if (eq ?xp_programacion "A")
	then
		(printout t crlf "Que paradigma de programacion prefiere?" crlf)
		(printout t crlf "(A) Estructurado" crlf)
		(printout t crlf "(B) Orientado a Objetos" crlf)
		(bind ?paradigmaPref(readline))
		(assert(ae_paradigmaProgPreferido ?paradigmaPref))
	(if (eq ?paradigmaPref "A")
	then
		;CONCLUSION: C
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(ae_perfilDesarrollador ?perfilDes)
			(ae_xpEnProgramacion ?xp_programacion)
			(ae_paradigmaProgPreferido ?paradigmaPref)))
		)

	(if (eq ?paradigmaPref "B")
	then
		;CONCLUSION: Rust
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(ae_perfilDesarrollador ?perfilDes)
			(ae_xpEnProgramacion ?xp_programacion)
			(ae_paradigmaProgPreferido ?paradigmaPref)))
		)
	)
)

(defrule ae_n4_regla3
	(ae_xpEnProgramacion ?xp_programacion)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(ae_perfilDesarrollador ?perfilDes)
	=>
	(if (eq ?xp_programacion "B")
	then
		(printout t crlf "Conoce los fundamentos de la programacion?" crlf)
		(printout t crlf "(A) Si" crlf)
		(printout t crlf "(B) No" crlf)
		(bind ?conoceFundProg(readline))
		(assert(ae_conoceFundamentosProg ?conoceFundProg))
	(if (eq ?conoceFundProg "A")
	then
		;CONCLUSION: Visual Basic .NET
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(ae_perfilDesarrollador ?perfilDes)
			(ae_xpEnProgramacion ?xp_programacion)
			(ae_conoceFundamentosProg ?conoceFundProg)))
		)

	(if (eq ?conoceFundProg "B")
	then
		;CONCLUSION: Scratch
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(ae_perfilDesarrollador ?perfilDes)
			(ae_xpEnProgramacion ?xp_programacion)
			(ae_conoceFundamentosProg ?conoceFundProg)))
		)
	)
)

(defrule ae_n2_regla4
	(ae_perfilDesarrollador ?perfilDes)
	=>
	(if (eq ?perfilDes "B")
	then
		(printout t crlf "Para cual SO esta dirigida la aplicacion?" crlf)
		(printout t crlf "(A) Windows" crlf)
		(printout t crlf "(B) MacOS" crlf)
		(bind ?SO_Objetivo(readline))
		(assert(ae_SOObjetivo ?SO_Objetivo))
	(if (eq ?SO_Objetivo "A")
	then
		(printout t crlf "Para que area esta dirigida la aplicacion?" crlf)
		(printout t crlf "(A) Seguridad" crlf)
		(printout t crlf "(B) Analisis de Datos" crlf)
		(printout t crlf "(C) Realidad Virtual" crlf)
		(bind ?areaAplicacion(readline))
		(assert(ae_areaDeAplicacion ?areaAplicacion))
		)
	)
)

(defrule ae_n4_regla5
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(ae_perfilDesarrollador ?perfilDes)
	(ae_SOObjetivo ?SO_Objetivo)
	(ae_areaDeAplicacion ?areaAplicacion)
	=>
	(if (eq ?areaAplicacion "A")
	then
		;CONCLUSION: Ruby
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(ae_perfilDesarrollador ?perfilDes)
			(ae_SOObjetivo ?SO_Objetivo)
			(ae_areaDeAplicacion ?areaAplicacion)))
		)
)

(defrule ae_n4_regla6
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(ae_perfilDesarrollador ?perfilDes)
	(ae_SOObjetivo ?SO_Objetivo)
	(ae_areaDeAplicacion ?areaAplicacion)
	=>
	(if (eq ?areaAplicacion "B")
	then
		;CONCLUSION: R
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(ae_perfilDesarrollador ?perfilDes)
			(ae_SOObjetivo ?SO_Objetivo)
			(ae_areaDeAplicacion ?areaAplicacion)))
		)
)

(defrule ae_n4_regla7
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(ae_perfilDesarrollador ?perfilDes)
	(ae_SOObjetivo ?SO_Objetivo)
	(ae_areaDeAplicacion ?areaAplicacion)
	=>
	(if (eq ?areaAplicacion "C")
	then
		;CONCLUSION: C++
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(ae_perfilDesarrollador ?perfilDes)
			(ae_SOObjetivo ?SO_Objetivo)
			(ae_areaDeAplicacion ?areaAplicacion)))
		)
)

(defrule ae_n4_regla8
	(ae_SOObjetivo ?SO_Objetivo)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(ae_perfilDesarrollador ?perfilDes)
	=>
	(if (eq ?SO_Objetivo "B")
	then
		(printout t crlf "Es para manejo de servidores?" crlf)
		(printout t crlf "(A) Si" crlf)
		(printout t crlf "(B) No" crlf)
		(bind ?esParaServer(readline))
		(assert(ae_paraManejoServidores ?esParaServer))
	(if (eq ?esParaServer "A")
	then
		;CONCLUSION: Perl
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(ae_perfilDesarrollador ?perfilDes)
			(ae_SOObjetivo ?SO_Objetivo)
			(ae_paraManejoServidores ?esParaServer)))
		)
	)
)

(defrule ae_n5_regla9
	(ae_SOObjetivo ?SO_Objetivo)
	(general_tipoDesarrollo ?general_tipoDesarrollo)
	(ae_perfilDesarrollador ?perfilDes)
	(ae_paraManejoServidores ?esParaServer)
	=>
	(if (eq ?esParaServer "B")
	then
		(printout t crlf "Requiere de creacion de scripts?" crlf)
		(printout t crlf "(A) Si" crlf)
		(printout t crlf "(B) No" crlf)
		(bind ?requiereScripts(readline))
		(assert(ae_requiereScripts ?requiereScripts))
	(if (eq ?requiereScripts "A")
	then
		;CONCLUSION: AppleScript
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(ae_perfilDesarrollador ?perfilDes)
			(ae_SOObjetivo ?SO_Objetivo)
			(ae_paraManejoServidores ?esParaServer)
			(ae_requiereScripts ?requiereScripts)))
		)
	
	(if (eq ?requiereScripts "B")
	then
		;CONCLUSION: Java
		(assert (condiciones
			(general_tipoDesarrollo ?general_tipoDesarrollo)
			(ae_perfilDesarrollador ?perfilDes)
			(ae_SOObjetivo ?SO_Objetivo)
			(ae_paraManejoServidores ?esParaServer)
			(ae_requiereScripts ?requiereScripts)))
		)
	)
)


;REGLA 1 
(defrule R1 "JavaScript web"
(condiciones
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "A")
(dw_experienciaFrontend "A")
(dw_utilizaFrameworks "A")
(dw_preferenciaFramework "A"))
=>
(printout t "Se recomienda el lenguaje JavaScript" crlf)
(retract *)
(assert(iniciar))
)

;;Regla 2
(defrule R2 "Java web"
(condiciones
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "A")
(dw_experienciaFrontend "A")
(dw_utilizaFrameworks "A")
(dw_preferenciaFramework "B"))
=>
(printout t "Se recomienda el lenguaje Java" crlf)
(retract *)
(assert(iniciar))
)

;;Regla 3
(defrule R3 "Sass web"
(condiciones(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "A")
(dw_experienciaFrontend "A")
(dw_utilizaFrameworks "B"))
=>
(printout t "Se recomienda el lenguaje SASS" crlf)
(retract *)
(assert(iniciar))
)

;Regla 4
(defrule R4 "html web"
(condiciones
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "A")
(dw_experienciaFrontend "B"))
=>
(printout t "Se recomienda el lenguaje HTML/CSS" crlf)
(retract *)
(assert(iniciar))
)

;Regla 5
(defrule R5 "PHP web"
(condiciones
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "B")
(dw_gestorBaseDeDatos "A"))
=>
(printout t "Se recomienda el lenguaje PHP" crlf)
(retract *)
(assert(iniciar))
)

;Regla 6
(defrule R6 "C# web"
(condiciones
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "B")
(dw_gestorBaseDeDatos "B")
(dw_SOUtilizado "A"))
=>
(printout t "Se recomienda el lenguaje C#" crlf)
(retract *)
(assert(iniciar))
)

;Regla 7
(defrule R7 "python web"
(condiciones
(general_tipoDesarrollo "A")
(dw_tipoDesarrollador "B")
(dw_gestorBaseDeDatos "B")
(dw_SOUtilizado "B"))
=>
(printout t "Se recomienda el lenguaje Python" crlf)
(retract *)
(assert(iniciar))
)



;Regla 15
(defrule R15 "C escritorio"
(condiciones
(general_tipoDesarrollo "B")
(ae_perfilDesarrollador "A")
(ae_xpEnProgramacion "A")
(ae_paradigmaProgPreferido "A"))
=>
(printout t "Se recomienda el lenguaje C" crlf)
(retract *)
(assert(iniciar))
)

;Regla 16
(defrule R16 "Rust escritorio"
(condiciones
(general_tipoDesarrollo "B")
(ae_perfilDesarrollador "A")
(ae_xpEnProgramacion "A")
(ae_paradigmaProgPreferido "B"))
=>
(printout t "Se recomienda el lenguaje Rust" crlf)
(retract *)
(assert(iniciar))
)

;Regla 17
(defrule R17 "VBN escritorio"
(condiciones
(general_tipoDesarrollo "B")
(ae_perfilDesarrollador "A")
(ae_xpEnProgramacion "B")
(ae_conoceFundamentosProg "A"))
=>
(printout t "Se recomienda el lenguaje Visual Basic.NET" crlf)
(retract *)
(assert(iniciar))
)

;regla 18
(defrule R18 "scratch escritorio"
(condiciones
(general_tipoDesarrollo "B")
(ae_perfilDesarrollador "A")
(ae_xpEnProgramacion "B")
(ae_conoceFundamentosProg "B"))
=>
(printout t "Se recomienda el lenguaje Scratch" crlf)
(retract *)
(assert(iniciar))
)

;regla 19
(defrule R19 "ruby escritorio"
(condiciones
(general_tipoDesarrollo "B")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "A")
(ae_areaDeAplicacion "A"))
=>
(printout t "Se recomienda el lenguaje Ruby" crlf)
(retract *)
(assert(iniciar))
)

;regla 20
(defrule R20 "R escritorio"
(condiciones
(general_tipoDesarrollo "B")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "A")
(ae_areaDeAplicacion "B"))
=>
(printout t "Se recomienda el lenguaje R" crlf)
(retract *)
(assert(iniciar))
)

;Regla 21
(defrule R21 "C++ escritorio"
(condiciones
(general_tipoDesarrollo "B")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "A")
(ae_areaDeAplicacion "C"))
=>
(printout t "Se recomienda el lenguaje C++" crlf)
(retract *)
(assert(iniciar))
)

;Regla 22 
(defrule R22 "Perl escritorio"
(condiciones
(general_tipoDesarrollo "B")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "B")
(ae_paraManejoServidores "A"))
=>
(printout t "Se recomienda el lenguaje Perl" crlf)
(retract *)
(assert(iniciar))
)

;Regla 23
(defrule R23 "java escritorio"
(condiciones
(general_tipoDesarrollo "B")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "B")
(ae_paraManejoServidores "B")
(ae_requiereScripts "B"))
=>
(printout t "Se recomienda el lenguaje Java" crlf)
(retract *)
(assert(iniciar))
)

;Regla 24
(defrule R24 "applescript escritorio"
(condiciones
(general_tipoDesarrollo "B")
(ae_perfilDesarrollador "B")
(ae_SOObjetivo "B")
(ae_paraManejoServidores "B")
(ae_requiereScripts "A"))
=>
(printout t "Se recomienda el lenguaje AppleScript" crlf)
(retract *)
(assert(iniciar))
)
