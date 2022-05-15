%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% PRIMERA RAMA %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

forma_jugar(forma_jugar_casual).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

reflejos(forma_jugar_casual, reflejos_buenos).

timing(reflejos_buenos, timing_bueno).

tematica(timing_bueno, tematica_banda_rock).
tematica(timing_bueno, tematica_naves_espaciales).

juego_recomendado(tematica_banda_rock, 'Rock Band').
juego_recomendado(tematica_naves_espaciales, 'Ikaruga').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

timing(reflejos_buenos, timing_flojo).

botones(timing_flojo, dos_botones).
botones(timing_flojo, todos_botones).

juego_recomendado(dos_botones, 'Pac-Man').
juego_recomendado(todos_botones, 'Punch Out').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

reflejos(forma_jugar_casual, reflejos_regulares).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aventura_pref(reflejos_regulares, aventura_pref_mountruos).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

protagonista(aventura_pref_mountruos, protagonista_cuidador_nocturno)

juego_recomendado(protagonista_cuidador_nocturno, "Five Nights at Freddy's").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

protagonista(aventura_pref_mountruos, protagonista_brujo)

tipo_camara(protagonista_brujo, tipo_camara_tercera_persona).
tipo_camara(protagonista_brujo, tipo_camara_vista_aerea).

juego_recomendado(tipo_camara_tercera_persona, 'The Witcher III: Wild Hunt').
juego_recomendado(tipo_camara_vista_aerea, 'The Witcher I').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aventura_pref(reflejos_regulares, aventura_pref_carreras).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tipo_carrera(aventura_pref_carreras, tipo_carrera_simulador).
tipo_carrera(aventura_pref_carreras, tipo_carrera_callejera).

juego_recomendado(tipo_carrera_simulador, 'Gran Turismo').
juego_recomendado(tipo_carrera_callejera, 'Need For Speed Underground 2').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% SEGUNDA RAMA %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

forma_jugar(forma_jugar_usando_cerebro).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tipo_juego(forma_jugar_usando_cerebro, tipo_juego_puzzles).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

desarrollo_juego(tipo_juego_puzzles, desarrollo_juego_lineal).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

estilo_juego(desarrollo_juego_lineal, estilo_juego_retro).
estilo_juego(desarrollo_juego_lineal, estilo_juego_moderno).

juego_recomendado(tipo_carrera_simulador, 'Tetris').
juego_recomendado(tipo_carrera_callejera, 'Lumines Puzzle Fusion').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

desarrollo_juego(tipo_juego_puzzles, desarrollo_juego_historia_elaborada).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ambientacion(desarrollo_juego_historia_elaborada, ambientacion_osctura_tenebrosa).

juego_recomendado(ambientacion_osctura_tenebrosa, 'Limbo').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ambientacion(desarrollo_juego_historia_elaborada, ambientacion_colorida_alegre).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

estilo_desarrollo(ambientacion_colorida_alegre, estilo_desarrollo_oriental).

juego_recomendado(ambientacion_osctura_tenebrosa, 'KatamariDamacy Reroll').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

estilo_desarrollo(ambientacion_colorida_alegre, estilo_desarrollo_occidental).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tipo_texturas(estilo_desarrollo_occidental, tipo_texturas_indi).
tipo_texturas(estilo_desarrollo_occidental, tipo_texturas_elaboradas).

juego_recomendado(tipo_texturas_indi, 'Braid').
juego_recomendado(tipo_texturas_elaboradas, 'Portal 2').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tipo_juego(forma_jugar_usando_cerebro, tipo_juego_simulacion).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

control_en_simulacion(tipo_juego_simulacion, control_en_simulacion_humanos).
control_en_simulacion(tipo_juego_simulacion, control_en_simulacion_ciudades).

juego_recomendado(tipo_texturas_indi, 'The Sims 4').
juego_recomendado(tipo_texturas_elaboradas, 'SimCity Buildit').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Reglas del arbol
recomendacion(A,B,C,D,R):-forma_jugar(A),reflejos(A,B),timing(B, C),tematica(C, D),write('El juego recomendado es: '),juego_recomendado(D,R).

%preguntas
%recomendacion(forma_jugar_casual,reflejos_buenos,timing_bueno,tematica_banda_rock,R).
