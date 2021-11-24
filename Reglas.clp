(deftemplate condiciones
	(slot general_tipoDesarrollo (type STRING)(default "ninguno"))
    
	(slot dw_tipoDesarrollador (type STRING)(default "ninguno"))
	(slot dw_experienciaFrontend (type STRING)(default "ninguno")) 
	(slot dw_utilizaFrameworks (type STRING)(default "ninguno")) 
	(slot dw_preferenciaFramework (type STRING)(default "ninguno"))
	(slot dw_gestorBaseDeDatos (type STRING)(default "ninguno"))
	(slot dw_SOUtilizado (type STRING)(default "ninguno"))

	(slot dv_plataforma (type STRING)(default "ninguno"))
	(slot dv_formato (type STRING)(default "ninguno"))
	(slot dv_motor (type STRING)(default "ninguno"))
	(slot dv_perfilDesarrollador (type STRING)(default "ninguno"))
	(slot dv_motorSegunPresupuesto (type STRING)(default "ninguno"))
	(slot dv_tipoVideojuego (type STRING)(default "ninguno"))

	(slot ae_perfilDesarrollador (type STRING)(default "ninguno"))
	(slot ae_experienciaEnProgramacion (type STRING)(default "ninguno"))
	(slot ae_paradigmaProgPreferido (type STRING)(default "ninguno"))
	(slot ae_conoceFundamentosProg (type STRING)(default "ninguno"))
	(slot ae_SOObjetivo (type STRING)(default "ninguno"))
	(slot ae_areaDeAplicacion (type STRING)(default "ninguno"))
	(slot ae_paraManejoServidores (type STRING)(default "ninguno"))
	(slot ae_requiereScripts (type STRING)(default "ninguno"))

	(slot am_SOObjetivo (type STRING)(default "ninguno"))
	(slot am_SOUtilizado (type STRING)(default "ninguno"))
	(slot am_IDEUtilizado (type STRING)(default "ninguno"))
	(slot am_UtilizaXamarin (type STRING)(default "ninguno"))
	(slot am_paraAplicacionesHibridas (type STRING)(default "ninguno"))
	(slot am_experienciaUtilizandoQT (type STRING)(default "ninguno"))
	(slot am_framework (type STRING)(default "ninguno"))
    
)

;REGLA 1 
(defrule R1 "JavaScript web"
(tipo web)
(tipo-desarollador frontend)
(experiencia-frontend si)
(utiliza-framework si)
(cual-prefiere angular)
=>
(printout t "se recomienda el lenguaje JavaScript" crlf))

;;Regla 2
(defrule R2 "Java web"
(tipo web)
(tipo-desarollador frontend)
(experiencia-frontend si)
(utiliza-framework si)
(cual-prefiere spring)
=>
(printout t "Se recomienda el lenguaje Java" crlf))

;;Regla 3
(defrule R3 "Sass web"
(tipo web)
(tipo-desarollador frontend)
(experiencia-frontend si)
(utiliza-framework no)
=>
(printout t "se recomienda el lenguaje Sass" crlf))

;Regla 4
(defrule R4 "html web"
(tipo web)
(tipo-desarollador frontend)
(experiencia-frontend no)
=>
(printout t "se recomienda el lenguaje html/css" crlf))

;Regla 5
(defrule R5 "PHP web"
(tipo web)
(tipo-desarollador backend)
(gestor-database mysql)
=>
(printout t "se recomienda el lenguaje PHP" crlf))

;Regla 6
(defrule R6 "C# web"
(tipo web)
(tipo-desarollador backend)
(gestor-database sqlserver)
(sistema-operativo windows)
=>
(printout t "se recomienda el lenguaje C#" crlf))

;Regla 7
(defrule R7 "python web"
(tipo web)
(tipo-desarollador backend)
(gestor-database sqlserver)
(sistema-operativo mac/linux)
=>
(printout t "se recomienda el lenguaje Python" crlf))

;Regla 8
(defrule R8 "C#juegos"
(tipo videojuegos)
(plataforma pc/mac)
(plataforma-ejecucion ejecutable)
(motor unity)
=>
(printout t "se recomienda el lenguaje C#" crlf))

;Regla 9
(defrule R9 "C++ juegos"
(tipo videojuegos)
(plataforma pc/mac)
(plataforma-ejecucion ejecutable)
(motor unreal-engine)
=>
(printout t "se recomienda el lenguaje C++" crlf))

;Regla 10
(defrule R10 "javascript juegos"
(tipo videojuegos)
(plataforma pc/mac)
(plataforma-ejecucion web)
=>
(printout t "se recomienda el lenguaje Javascript" crlf))

;Regla 11
(defrule R11 "Lua juegos"
(tipo videojuegos)
(plataforma moviles)
(perfil principiante)
(motor-presupuesto gratis)
=>
(printout t "se recomienda el lenguaje Lua" crlf))

;Regla 12
(defrule R12 "C++ juegos"
(tipo videojuegos)
(plataforma moviles)
(perfil principiante)
(motor-presupuesto de-pago)
=>
(printout t "se recomienda el lenguaje C++" crlf))

;Regla 13
(defrule R13 "C# juegos"
(tipo videojuegos)
(plataforma moviles)
(perfil avanzado)
(dimension 2d)
=>
(printout t "se recomienda el lenguaje C#" crlf))

;Regla 14
(defrule R14 "Python juegos"
(tipo videojuegos)
(plataforma moviles)
(perfil avanzado)
(dimension 3d)
=>
(printout t "se recomienda el lenguaje Python" crlf))

;Regla 15
(defrule R15 "C escritorio"
(tipo escritorio)
(perfil estudiante)
(tiene-experiencia si)
(paradigma estructurado)
=>
(printout t "se recomienda el lenguaje C" crlf))

;Regla 16
(defrule R16 "Rust escritorio"
(tipo escritorio)
(perfil estudiante)
(tiene-experiencia si)
(paradigma POO)
=>
(printout t "se recomienda el lenguaje rust" crlf))

;Regla 17
(defrule R17 "VBN escritorio"
(tipo escritorio)
(perfil estudiante)
(tiene-experiencia no)
(tiene-fundamentos si)
=>
(printout t "se recomienda el lenguaje visual basic.net" crlf))

;regla 18
(defrule R18 "scratch escritorio"
(tipo escritorio)
(perfil estudiante)
(tiene-experiencia no)
(tiene-fundamentos no)
=>
(printout t "se recomienda el lenguaje scratch" crlf))

;regla 19
(defrule R19 "ruby escritorio"
(tipo escritorio)
(perfil profesional)
(so-objetivo windows)
(area-objetivo seguridad)
=>
(printout t "se recomienda el lenguaje ruby" crlf))

;regla 20
(defrule R20 "R escritorio"
(tipo escritorio)
(perfil profesional)
(so-objetivo windows)
(area-objetivo analisis-datos)
=>
(printout t "se recomienda el lenguaje R" crlf))

;Regla 21
(defrule R21 "C++ escritorio"
(tipo escritorio)
(perfil profesional)
(so-objetivo windows)
(area-objetivo realidad-virtual)
=>
(printout t "se recomienda el lenguaje C++" crlf))

;Regla 22 
(defrule R22 "Perl escritorio"
(tipo escritorio)
(perfil profesional)
(so-objetivo windows)
(manejo-servidores si)
=>
(printout t "se recomienda el lenguaje Perl" crlf))

;Regla 23
(defrule R23 "java escritorio"
(tipo escritorio)
(perfil profesional)
(so-objetivo windows)
(manejo-servidores no)
(creacion-scripts no)
=>
(printout t "se recomienda el lenguaje Java" crlf))

;Regla 24
(defrule R24 "applescript escritorio"
(tipo escritorio)
(perfil profesional)
(so-objetivo windows)
(manejo-servidores no)
(creacion-scripts si)
=>
(printout t "se recomienda el lenguaje applescripts" crlf))

;Regla 25
(defrule R25 "actioncript movil"
(tipo movil)
(sistema ios)
(plataforma-desarrollo linux/windows)
(ide-utilizado adobleflex)
=>
(printout t "se recomienda el lenguaje actioncript" crlf))

;Regla 26
(defrule R26 "C# movil"
(tipo movil)
(sistema ios)
(plataforma-desarrollo linux/windows)
(ide-utilizado visual-studio)
(framework-xamarin si)
=>
(printout t "se recomienda el lenguaje C#" crlf))

;Regla 27
(defrule R27 "swift movil"
(tipo movil)
(sistema ios)
(plataforma-desarrollo linux/windows)
(ide-utilizado visual-studio)
(framework-xamarin no)
=>
(printout t "se recomienda el lenguaje swift" crlf))

;Regla 28
(defrule R28 "Objective-c movil"
(tipo movil)
(sistema ios)
(plataforma-desarrollo mac)
=>
(printout t "se recomienda el lenguaje Objective-c" crlf))

;Regla 29
(defrule R29 "QML movil"
(tipo movil)
(sistema android)
(hibrida-movil-web si)
(Experiencia-QT si)
=>
(printout t "se recomienda el lenguaje QML" crlf))

;Regla 30
(defrule R30 "javascript movil"
(tipo movil)
(sistema android)
(hibrida-movil-web si)
(Experiencia-QT no)
=>
(printout t "se recomienda el lenguaje Javascript" crlf))

;Regla 31
(defrule R31 "C# movil"
(tipo movil)
(sistema android)
(hibrida-movil-web no)
(framework xamarin)
=>
(printout t "se recomienda el lenguaje C#" crlf))

;Regla 32
(defrule R32 "kotlin movil"
(tipo movil)
(sistema android)
(hibrida-movil-web no)
(framework react-native)
=>
(printout t "se recomienda el lenguaje Kotlin" crlf))
