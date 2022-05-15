%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% REGLAS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

forma_jugar(forma_jugar_casual).
forma_jugar(forma_jugar_usando_cerebro).

%%%%%%%%%%%%%%%%%%%% PRIMERA RAMA %%%%%%%%%%%%%%%%%%%%%%%%%

reflejos(forma_jugar_casual, reflejos_buenos).
reflejos(forma_jugar_casual, reflejos_regulares).

timing(reflejos_buenos, timing_bueno).
timing(reflejos_buenos, timing_flojo).

tematica(timing_bueno, tematica_banda_rock).
tematica(timing_bueno, tematica_naves_espaciales).

botones(timing_flojo, dos_botones).
botones(timing_flojo, todos_botones).

aventura_pref(reflejos_regulares, aventura_pref_mountruos).
aventura_pref(reflejos_regulares, aventura_pref_carreras).

protagonista(aventura_pref_mountruos, protagonista_cuidador_nocturno).
protagonista(aventura_pref_mountruos, protagonista_brujo).

tipo_camara(protagonista_brujo, tipo_camara_tercera_persona).
tipo_camara(protagonista_brujo, tipo_camara_vista_aerea).

tipo_carrera(aventura_pref_carreras, tipo_carrera_simulador).
tipo_carrera(aventura_pref_carreras, tipo_carrera_callejera).

%%%%%%%%%%%%%%%%%%%%%% SEGUNDA RAMA %%%%%%%%%%%%%%%%%%%%%%%%%%%%

tipo_juego(forma_jugar_usando_cerebro, tipo_juego_puzzles).
tipo_juego(forma_jugar_usando_cerebro, tipo_juego_simulacion).

desarrollo_juego(tipo_juego_puzzles, desarrollo_juego_lineal).
desarrollo_juego(tipo_juego_puzzles, desarrollo_juego_historia_elaborada).

estilo_juego(desarrollo_juego_lineal, estilo_juego_retro).
estilo_juego(desarrollo_juego_lineal, estilo_juego_moderno).

ambientacion(desarrollo_juego_historia_elaborada, ambientacion_osctura_tenebrosa).
ambientacion(desarrollo_juego_historia_elaborada, ambientacion_colorida_alegre).

estilo_desarrollo(ambientacion_colorida_alegre, estilo_desarrollo_oriental).
estilo_desarrollo(ambientacion_colorida_alegre, estilo_desarrollo_occidental).

tipo_texturas(estilo_desarrollo_occidental, tipo_texturas_indi).
tipo_texturas(estilo_desarrollo_occidental, tipo_texturas_elaboradas).

control_en_simulacion(tipo_juego_simulacion, control_en_simulacion_humanos).
control_en_simulacion(tipo_juego_simulacion, control_en_simulacion_ciudades).

%%%%%%%%%%%%%%%%%%%%% REGLAS DE CONCLUSION %%%%%%%%%%%%%%%%%%%%%

juego_recomendado(tematica_banda_rock, 'Rock Band').
juego_recomendado(tematica_naves_espaciales, 'Ikaruga').
juego_recomendado(dos_botones, 'Pac-Man').
juego_recomendado(todos_botones, 'Punch Out').
juego_recomendado(protagonista_cuidador_nocturno, "Five Nights at Freddy's").
juego_recomendado(tipo_camara_tercera_persona, 'The Witcher III: Wild Hunt').
juego_recomendado(tipo_camara_vista_aerea, 'The Witcher I').
juego_recomendado(tipo_carrera_simulador, 'Gran Turismo').
juego_recomendado(tipo_carrera_callejera, 'Need For Speed Underground 2').

juego_recomendado(estilo_juego_retro, 'Tetris').
juego_recomendado(estilo_juego_moderno, 'Lumines Puzzle Fusion').
juego_recomendado(ambientacion_osctura_tenebrosa, 'Limbo').
juego_recomendado(estilo_desarrollo_oriental, 'KatamariDamacy Reroll').
juego_recomendado(tipo_texturas_indi, 'Braid').
juego_recomendado(tipo_texturas_elaboradas, 'Portal 2').
juego_recomendado(control_en_simulacion_humanos, 'The Sims 4').
juego_recomendado(control_en_simulacion_ciudades, 'SimCity Buildit').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% REGLAS DEL ARBOL %%%%%%%%%%%%%%%%%%%%%%%%%%

%%SIMS 4 / SIM CITY
recomendacion(A,B,C,R):-forma_jugar(A),tipo_juego(A,B),control_en_simulacion(B, C),write('El juego recomendado es: '),juego_recomendado(C,R).
%%ROCK BAND / IKARUGA
recomendacion(A,B,C,D,R):-forma_jugar(A),reflejos(A,B),timing(B, C),tematica(C, D),write('El juego recomendado es: '),juego_recomendado(D,R). 
%%PAC-MA / PUNCH OUT
recomendacion(A,B,C,D,R):-forma_jugar(A),reflejos(A,B),timing(B, C),botones(C, D),write('El juego recomendado es: '),juego_recomendado(D,R).
%%FNAF
recomendacion(A,B,C,D,R):-forma_jugar(A),reflejos(A,B),aventura_pref(B, C),protagonista(C, D),write('El juego recomendado es: '),juego_recomendado(D,R).
%%GRAN TURISMO / NEED FOR SPEED
recomendacion(A,B,C,D,R):-forma_jugar(A),reflejos(A,B),aventura_pref(B, C),tipo_carrera(C, D),write('El juego recomendado es: '),juego_recomendado(D,R).
%%TETRIS / LUMINES
recomendacion(A,B,C,D,R):-forma_jugar(A),tipo_juego(A,B),desarrollo_juego(B, C),estilo_juego(C, D),write('El juego recomendado es: '),juego_recomendado(D,R).
%%LIMBO
recomendacion(A,B,C,D,R):-forma_jugar(A),tipo_juego(A,B),desarrollo_juego(B, C),ambientacion(C, D),write('El juego recomendado es: '),juego_recomendado(D,R).
%%KATAMARI DOMACY REROLL
recomendacion(A,B,C,D,E,R):-forma_jugar(A),tipo_juego(A,B),desarrollo_juego(B, C),ambientacion(C, D),estilo_desarrollo(D,E),write('El juego recomendado es: '),juego_recomendado(E,R).
%%THE WITCHER / THE WITCHER WILD HUNT
recomendacion(A,B,C,D,E,R):-forma_jugar(A),reflejos(A,B),aventura_pref(B, C),protagonista(C, D),tipo_camara(D,E),write('El juego recomendado es: '),juego_recomendado(E,R).
%%BRAID / PORTAL 2
recomendacion(A,B,C,D,E,F,R):-forma_jugar(A),tipo_juego(A,B),desarrollo_juego(B, C),ambientacion(C, D),estilo_desarrollo(D,E),tipo_texturas(E,F),write('El juego recomendado es: '),juego_recomendado(F,R).




%%%%%%%%%%%%%%%%%%%%% PREGUNTAS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% ROCK BAND %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_casual,reflejos_buenos,timing_bueno,tematica_banda_rock,R).

%%%%%%%%%%%%%%%%%%%%% IKARUGA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_casual,reflejos_buenos,timing_bueno,tematica_naves_espaciales,R).

%%%%%%%%%%%%%%%%%%%%% PACK MAN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_casual,reflejos_buenos,timing_flojo,dos_botones,R).

%%%%%%%%%%%%%%%%%%%%% PUNCH OUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_casual,reflejos_buenos,timing_flojo,todos_botones,R).

%%%%%%%%%%%%%%%%%%%%% THE WITCHER WILD HUNT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_casual,reflejos_regulares,aventura_pref_mountruos,protagonista_brujo,tipo_camara_tercera_persona,R).

%%%%%%%%%%%%%%%%%%%%% THE WITCHER 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_casual,reflejos_regulares,aventura_pref_mountruos,protagonista_brujo,tipo_camara_vista_aerea,R).

%%%%%%%%%%%%%%%%%%%%% FIVE NIGHT AT FREDY'S %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_casual,reflejos_regulares,aventura_pref_mountruos,protagonista_cuidador_nocturno,R).

%%%%%%%%%%%%%%%%%%%%% GRAN TURISMO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_casual,reflejos_regulares,aventura_pref_carreras,tipo_carrera_simulador,R).

%%%%%%%%%%%%%%%%%%%%% NEED FOR SPEED %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_casual,reflejos_regulares,aventura_pref_carreras,tipo_carrera_callejera,R).

%%%%%%%%%%%%%%%%%%%%% TETRIS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_usando_cerebro,tipo_juego_puzzles,desarrollo_juego_lineal,estilo_juego_retro,R).

%%%%%%%%%%%%%%%%%%%%% LUMINES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_usando_cerebro,tipo_juego_puzzles,desarrollo_juego_lineal,estilo_juego_moderno,R).

%%%%%%%%%%%%%%%%%%%%% LIMBO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_usando_cerebro,tipo_juego_puzzles,desarrollo_juego_historia_elaborada,ambientacion_osctura_tenebrosa,R).

%%%%%%%%%%%%%%%%%%%%% KATAMARY DOMACY REROLL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_usando_cerebro,tipo_juego_puzzles,desarrollo_juego_historia_elaborada,ambientacion_colorida_alegre,estilo_desarrollo_oriental,R).

%%%%%%%%%%%%%%%%%%%%% BRAID %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_usando_cerebro,tipo_juego_puzzles,desarrollo_juego_historia_elaborada,ambientacion_colorida_alegre,estilo_desarrollo_occidental,tipo_texturas_indi,R).

%%%%%%%%%%%%%%%%%%%%% PORTAL 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_usando_cerebro,tipo_juego_puzzles,desarrollo_juego_historia_elaborada,ambientacion_colorida_alegre,estilo_desarrollo_occidental,tipo_texturas_elaboradas,R).

%%%%%%%%%%%%%%%%%%%%% SIMS 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_usando_cerebro,tipo_juego_simulacion,control_en_simulacion_humanos,R).

%%%%%%%%%%%%%%%%%%%%% SIM CITY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recomendacion(forma_jugar_usando_cerebro,tipo_juego_simulacion,control_en_simulacion_ciudades,R).

