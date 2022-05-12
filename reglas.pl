forma_jugar(forma_jugar_casual).
forma_jugar(forma_jugar_usando_cerebro).

reflejos(forma_jugar_casual, reflejos_buenos).
reflejos(forma_jugar_casual, reflejos_regulares).

timing(reflejos_buenos, timing_bueno).
timing(reflejos_buenos, timing_flojo).

tematica(timing_bueno, tematica_banda_rock).
tematica(timing_bueno, tematica_naves_espaciales).

juego_recomendado(tematica_banda_rock, 'Rock Band').