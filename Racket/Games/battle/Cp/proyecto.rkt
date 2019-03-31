#lang racket
;Kevin arley agudelo osorio
;universidad tecnologica de pereira

(require 2htdp/universe 2htdp/image  2htdp/batch-io lang/posn)



; Imagen de la arena del juego 
(define AREA_JUEGO 
(bitmap "imagenes/area_juego.jpg"))

; Dimensiones de la pantalla del juego 
(define ANCHO 1170)
(define ALTO 600)

; Imagenes del tanque del jugador
(define JUG_ARRIBA (bitmap "imagenes/jug_arriba.png"))
(define JUG_ABAJO(bitmap "imagenes/jug_abajo.png"))
(define JUG_IZQUIERDA (bitmap "imagenes/jug_izquierda.png"))
(define JUG_DERECHA (bitmap "imagenes/jug_derecha.png"))


; Imagenes del tanque enemigo
(define ENE_ARRIBA (bitmap "imagenes/ene_arriba.png"))
(define ENE_ABAJO (bitmap "imagenes/ene_abajo.png"))
(define ENE_IZQUIERDA (bitmap "imagenes/ene_izquierda.png"))
(define ENE_DERECHA (bitmap "imagenes/ene_derecha.png"))

; Imagen de la base del jugador 
(define BASE (bitmap "imagenes/jug_base.png"))

; Imagen de una bala 
(define BALA (circle 3 'solid 'red))

; Imagen ladrillo
(define LADRILLO (bitmap "imagenes/ladrillo1.png"))


;Mundo:

(struct mundo (jugador base balas ladrillos enemigos preguntas pregunta) #:transparent)

;Imagen Tanque

(struct imagen_tanque (arriba abajo izquierda derecha))

;Tanque

(struct tanque (tipo imagen posn direccion velocidad vidas))

;Bala

(struct bala (posn direccion destino))

;Ladrillo

(struct ladrillo (posn))

;Base

(struct base (posn vidas))

;Pregunta:

(struct pregunta (enunciado opciones respuesta) #:transparent)

;Indicador

(struct indicador (imagen posn))


;Identifican las posibilidades de movimiento del jugador o del enemigo
(define ARRIBA "up")
(define ABAJO "down")
(define IZQUIERDA "left")
(define DERECHA "right")

;indica cuantos pixeles los objetos
(define VELOCIDAD_JUGADOR 2)
(define VELOCIDAD_ENEMIGO 4)
(define VELOCIDAD_BALA 10)

;Indican las vidas de el jugador, cada enemigo y la base
(define VIDAS_JUGADOR 2)
(define VIDAS_ENEMIGO 1)
(define VIDAS_BASE 2)

;Identifican el tipo de tanque
(define TIPO_JUGADOR "jugador")
(define TIPO_ENEMIGO "enemigo")

;Variantes definidas para el movimieno de los enemigos y balas
(define RANGO_MOVIMIENTO 20)
(define RANGO_DISPARO 40)
(define DISTANCIA 10)
(define VELOCIDAD_TICK 1/28)
(define MOVIMIENTOS_ENEMIGO (list ARRIBA ABAJO IZQUIERDA DERECHA))

;Imagen y estructura jugador 
(define IMAGEN_JUGADOR (imagen_tanque JUG_ARRIBA JUG_ABAJO JUG_IZQUIERDA JUG_DERECHA))
(define JUGADOR (tanque TIPO_JUGADOR IMAGEN_JUGADOR (make-posn 550 550) ARRIBA VELOCIDAD_JUGADOR VIDAS_JUGADOR))

;Imagen y estructuras de los enemigos
(define IMAGEN_ENEMIGO (imagen_tanque ENE_ARRIBA ENE_ABAJO ENE_IZQUIERDA ENE_DERECHA))
(define ENEMIGOS (list (tanque TIPO_ENEMIGO IMAGEN_ENEMIGO (make-posn 80 50) ABAJO VELOCIDAD_ENEMIGO VIDAS_ENEMIGO)
                       (tanque TIPO_ENEMIGO IMAGEN_ENEMIGO (make-posn 360 50) ABAJO VELOCIDAD_ENEMIGO VIDAS_ENEMIGO)
                       (tanque TIPO_ENEMIGO IMAGEN_ENEMIGO (make-posn 610 50) ABAJO VELOCIDAD_ENEMIGO VIDAS_ENEMIGO)
                       (tanque TIPO_ENEMIGO IMAGEN_ENEMIGO (make-posn 890 50) ABAJO VELOCIDAD_ENEMIGO VIDAS_ENEMIGO)
                       (tanque TIPO_ENEMIGO IMAGEN_ENEMIGO (make-posn 470 278) ABAJO VELOCIDAD_ENEMIGO VIDAS_ENEMIGO)
                       (tanque TIPO_ENEMIGO IMAGEN_ENEMIGO (make-posn 838 278) ABAJO VELOCIDAD_ENEMIGO VIDAS_ENEMIGO)))

;Base del jugador y lista de ladrillos que la protegen
(define BASE_JUGADOR (base (make-posn 645 575) VIDAS_BASE))
(define PROTECCION_BASE (list (ladrillo (make-posn 600 575))
                              (ladrillo (make-posn 600 525))
                              (ladrillo (make-posn 650 525))
                              (ladrillo (make-posn 700 525))
                              (ladrillo (make-posn 700 575))
                                         (ladrillo (make-posn 150 400))
                                         (ladrillo (make-posn 150 350))
                                         (ladrillo (make-posn 150 300))
                                         (ladrillo (make-posn 150 250))
                                         (ladrillo (make-posn 150 200))
                                         (ladrillo (make-posn 150 150))
                                         (ladrillo (make-posn 150 100))
                                         (ladrillo (make-posn 275 400))
                                          (ladrillo (make-posn 275 350))
                                           (ladrillo (make-posn 275 300))
                                            (ladrillo (make-posn 275 250))
                                             (ladrillo (make-posn 275 200))
                                              (ladrillo (make-posn 275 150))
                                               (ladrillo (make-posn 275 100))
                                               (ladrillo (make-posn 400 400))
                                               (ladrillo (make-posn 400 350))
                                               (ladrillo (make-posn 400 300))
                                               (ladrillo (make-posn 400 250))
                                               (ladrillo (make-posn 400 200))
                                               (ladrillo (make-posn 400 150))
                                               
                                            (ladrillo (make-posn 525 400))
                                             (ladrillo (make-posn 575 400))
                                              (ladrillo (make-posn 625 400))
                                               (ladrillo (make-posn 675 400))
                                                (ladrillo (make-posn 725 400))
                                                  (ladrillo (make-posn 775 400))
                                                   (ladrillo (make-posn 525 275))
                                                   (ladrillo (make-posn 575 275))
                                                   (ladrillo (make-posn 625 275))
                                                   (ladrillo (make-posn 675 275))
                                                   (ladrillo (make-posn 725 275))
                                                   (ladrillo (make-posn 775 275))
                                                   (ladrillo (make-posn 525 150))
                                                    (ladrillo (make-posn 575 150))
                                                     (ladrillo (make-posn 625 150))
                                                      (ladrillo (make-posn 675 150))
                                                       (ladrillo (make-posn 725 150))
                                                        (ladrillo (make-posn 775 150))
                                                         (ladrillo (make-posn 900 400))
                                                          (ladrillo (make-posn 900 350))
                                                           (ladrillo (make-posn 900 300))
                                                            (ladrillo (make-posn 900 250))
                                                             (ladrillo (make-posn 900 200))
                                                              (ladrillo (make-posn 900 150))
                                                               (ladrillo (make-posn 900 100))
                                                               (ladrillo (make-posn 1025 400))
                                                               (ladrillo (make-posn 1025 350))
                                                               (ladrillo (make-posn 1025 300))
                                                               (ladrillo (make-posn 1025 250))
                                                               (ladrillo (make-posn 1025 200))
                                                               (ladrillo (make-posn 1025 150))
                                                               (ladrillo (make-posn 1025 100))   ))




;Balas
(define BALAS empty)


;Ladrillos 

(define (generadorLadrillos x y)
  (cond
    [(and (>= x 25) (>= y 400)) (cons (ladrillo (make-posn x y)) empty)]
    [(>= x 25) (cons (ladrillo (make-posn x y)) (generadorLadrillos 25 (+ y 50)))]
    [else (cons (ladrillo (make-posn x y)) (generadorLadrillos (+ x 50) y))]))

(define LADRILLOS (append (generadorLadrillos 25 100) PROTECCION_BASE))


;Banco preguntas

(define (cargarPreguntas archivo)
  (define lista_lineas (read-lines archivo))
  (let loop ((preguntas lista_lineas))
    (if (empty? preguntas)
        empty
        (cons 
         (pregunta 
          (list-ref preguntas 0)
          (string-append (list-ref preguntas 1)
                         " "
                         (list-ref preguntas 2)
                         " "
                         (list-ref preguntas 3)
                         " "
                         (list-ref preguntas 4))
          (list-ref preguntas 5))
         (loop (rest (rest (rest (rest (rest (rest preguntas)))))))))))

(define PREGUNTAS (cargarPreguntas "Banco Preguntas.txt"))
(define PREGUNTA_VACIA null)
(define POSN_ENUNCIADO_PREGUNTA (make-posn 550 350))
(define POSN_OPCIONES_PREGUNTA (make-posn 550 400))


;Primer estado del mundo
(define MUNDO_INICIAL (mundo JUGADOR BASE_JUGADOR BALAS LADRILLOS ENEMIGOS PREGUNTAS PREGUNTA_VACIA))


(define (imagenTanque tanque)
  (cond
    [(equal? (tanque-direccion tanque) ARRIBA) (imagen_tanque-arriba (tanque-imagen tanque))]
    [(equal? (tanque-direccion tanque) ABAJO) (imagen_tanque-abajo (tanque-imagen tanque))]
    [(equal? (tanque-direccion tanque) IZQUIERDA) (imagen_tanque-izquierda (tanque-imagen tanque))]
    [(equal? (tanque-direccion tanque) DERECHA) (imagen_tanque-derecha (tanque-imagen tanque))]))



(define (listaImagenes objetos)
  (cond
    [(empty? objetos) empty]
    [else (cons (objeto->imagen (first objetos)) (listaImagenes (rest objetos)))]))

;listaPosiciones: 
(define (listaPosiciones objetos)
  (cond
    [(empty? objetos) empty]
    [else (append (list (objeto->posn (first objetos))) (listaPosiciones (rest objetos)))]))

;imagenIndicador
(define (imagenIndicador mundo)
  (define jugador (mundo-jugador mundo))
  (define posn_jugador (tanque-posn jugador))
  (define vidas_jugador (tanque-vidas jugador))
  (define vidas_base (base-vidas (mundo-base mundo)))
  (define num_enemigos (length (mundo-enemigos mundo)))
  (place-images/align
   (list (text (string-append "Posicion: " (number->string (posn-x posn_jugador)) "," (number->string (posn-y posn_jugador))) 10 "yellowgreen")
         (text (string-append "Jugador: " (number->string vidas_jugador)) 10 "black") 
         (text (string-append "Base: " (number->string vidas_base)) 10 "black")
         (text (string-append "No.Enemigos: " (number->string num_enemigos)) 10 "black")
         (text (if (or (= 0 vidas_jugador) (= 0 vidas_base)) "¡¡GAME OVER!!" " ") 10 "black")
         (text (if (= 0 num_enemigos) "¡¡HAS GANADO!!" " ") 10 "black"))
   (list (make-posn 90 16) (make-posn 90 32) (make-posn 90 48) (make-posn 90 64) (make-posn 90 80) (make-posn 90 100))
   "right" "bottom" (bitmap "imagenes/area_indicador.png")))

;pintarJuego
(define (pintarJuego mundo)
  (define jugador (mundo-jugador mundo))
  (define base_jugador (mundo-base mundo))
  (define balas (mundo-balas mundo))
  (define ladrillos (mundo-ladrillos mundo))
  (define enemigos (mundo-enemigos mundo))
  (define estadoJuego (indicador (imagenIndicador mundo) (make-posn 1200 300)))
  (define objetos (append (list estadoJuego) (list jugador) (list base_jugador) balas ladrillos enemigos))
  (define imagenes (listaImagenes objetos))
  (define posiciones (listaPosiciones objetos))
  (place-images imagenes posiciones AREA_JUEGO))

;pintarPregunta
(define (pintarPregunta mundo)
  (define pregunta (mundo-pregunta mundo))
  (define enunciado (pregunta-enunciado pregunta))
  (define opciones (pregunta-opciones pregunta))
  (place-images/align
   (list (text enunciado 20 "white")
         (text opciones 20 "white")
         (imagenIndicador mundo))
   (list POSN_ENUNCIADO_PREGUNTA
         POSN_OPCIONES_PREGUNTA
         (make-posn 1200 300))
   "center" "center"
   (bitmap "imagenes/area_juego1.jpg")))


;pintarMundo
(define (pintarMundo mundo)
  (if (pregunta? (mundo-pregunta mundo))
      (pintarPregunta mundo)
      (pintarJuego mundo)))



;objeto->imagen:
(define (objeto->imagen objeto)
  (cond
    [(tanque? objeto) (imagenTanque objeto)]
    [(bala? objeto) BALA]
    [(ladrillo? objeto) LADRILLO]
    [(base? objeto) BASE]
    [(indicador? objeto) (indicador-imagen objeto)]))

;objeto->posn: 
(define (objeto->posn objeto)
  (cond
    [(tanque? objeto) (tanque-posn objeto)]
    [(bala? objeto) (bala-posn objeto)]
    [(ladrillo? objeto) (ladrillo-posn objeto)]
    [(base? objeto) (base-posn objeto)]
    [(indicador? objeto) (indicador-posn objeto)]))

;objeto->velocidad
(define (objeto->velocidad objeto)
  (cond
    [(tanque? objeto) (tanque-velocidad objeto)]
    [(bala? objeto) VELOCIDAD_BALA]))

;objeto->tamaño
(define (objeto->tamaño objeto)
  (cond
    [(tanque? objeto) (image-height JUG_ARRIBA)]
    [(bala? objeto) (image-height BALA)]
    [(ladrillo? objeto) (image-height LADRILLO)]
    [(base? objeto) (image-height BASE)]))



;distancia: posn * posn -> number

(define (distancia posn1 posn2)
  (sqrt (+ (expt (- (posn-x posn1) (posn-x posn2)) 2) (expt (- (posn-y posn1) (posn-y posn2)) 2))))

;colision?
(define (colision? objeto1 objeto2)
  (< (distancia (objeto->posn objeto1) 
                (objeto->posn objeto2)) 
     (+ (/ (objeto->tamaño objeto1) 2)
        (/ (objeto->tamaño objeto2) 2))))

;colisionObjetoPared? (tanque | bala) -> boolean 

(define (colisionObjetoPared? objeto)
  (define posn_objeto (objeto->posn objeto))
  (define mitad_tamaño_objeto (/ (objeto->tamaño objeto) 2))
  (define x (posn-x posn_objeto))
  (define y (posn-y posn_objeto))
  (or (< x mitad_tamaño_objeto) 
      (> (+ x mitad_tamaño_objeto) ANCHO) 
      (< y mitad_tamaño_objeto) 
      (> (+ y mitad_tamaño_objeto) ALTO)))


;colisionObjetoLadrillos?
(define (colisionObjetoLadrillos? objeto ladrillos)
  (cond
    [(empty? ladrillos) false]
    [(colision? objeto (first ladrillos)) (first ladrillos)]
    [else (colisionObjetoLadrillos? objeto (rest ladrillos))]))

;colisionObjetoBalas?:
(define (colisionObjetoBalas? objeto balas)
  (cond
    [(empty? balas) false]
    [(and (bala? objeto)
          (colision? objeto (first balas))
          (not (string=? (bala-destino objeto) 
                         (bala-destino (first balas))))) (first balas)]
    [(and (tanque? objeto)
          (colision? objeto (first balas))
          (string=? (tanque-tipo objeto)
                    (bala-destino (first balas)))) (first balas)]
    [(and (ladrillo? objeto)
          (colision? objeto (first balas))) (first balas)]
    [(and (base? objeto)
          (colision? objeto (first balas))) (first balas)]
    [else (colisionObjetoBalas? objeto (rest balas))]))

;colisionObjetoTanques?
(define (colisionObjetoTanques? objeto tanques)
  (cond
    [(empty? tanques) false]
    [(and (bala? objeto)
          (colision? objeto (first tanques))
          (string=? (bala-destino objeto) 
                    (tanque-tipo (first tanques)))) (first tanques)]
    [(and (tanque? objeto)
          (colision? objeto (first tanques))
          (not (string=? (tanque-tipo objeto)
                         (tanque-tipo (first tanques))))) (first tanques)]
    [else (colisionObjetoTanques? objeto (rest tanques))]))

(define (colisionTanquesBalas? tanques balas)
  (cond
    [(empty? balas) false]
    [(colisionObjetoTanques? (first balas) tanques) true]
    [else (colisionTanquesBalas? tanques (rest balas))]))



;MOVER TANQUES

(define (siguientePosicion objeto nueva_direccion)
  (define x (posn-x (objeto->posn objeto)))
  (define y (posn-y (objeto->posn objeto)))
  (define velocidad (objeto->velocidad objeto))
  (cond
    [(string=? nueva_direccion "up") (make-posn x (- y velocidad))]
    [(string=? nueva_direccion "down") (make-posn x (+ y velocidad))]
    [(string=? nueva_direccion "left") (make-posn (- x velocidad) y)]
    [(string=? nueva_direccion "right") (make-posn (+ x velocidad) y)]
    [else (objeto->posn objeto)]))

;moverTanque)
(define (moverTanque tanque_a_mover direccion ladrillos)
  (define tipo (tanque-tipo tanque_a_mover))
  (define imagen (tanque-imagen tanque_a_mover))
  (define nueva_posn (siguientePosicion tanque_a_mover direccion))
  (define velocidad (tanque-velocidad tanque_a_mover))
  (define vidas (tanque-vidas tanque_a_mover))
  (define nuevo_tanque (tanque tipo imagen nueva_posn direccion velocidad vidas))
  (if (or (colisionObjetoPared? nuevo_tanque) 
          (colisionObjetoLadrillos? nuevo_tanque ladrillos)) 
      tanque_a_mover nuevo_tanque ))

;moverTanqueJugado
(define (moverTaqueJugador mundo_anterior direccion)
  (define jugador (mundo-jugador mundo_anterior))
  (define ladrillos (mundo-ladrillos mundo_anterior))
  (define nuevo_jugador (moverTanque jugador direccion ladrillos))
  (define base (mundo-base mundo_anterior))
  (define balas (mundo-balas mundo_anterior))
  (define enemigos (mundo-enemigos mundo_anterior))
  (define preguntas (mundo-preguntas mundo_anterior))
  (define pregunta (mundo-pregunta mundo_anterior))
  (mundo nuevo_jugador base balas ladrillos enemigos preguntas pregunta))

;moverTanqueEnemigo
(define (moverTanqueEnemigo tanque trayectoria ladrillos)
  (cond
    [(empty? trayectoria) tanque]
    [else (let ((tanque_movido (moverTanque tanque (first trayectoria) ladrillos)))
            (moverTanqueEnemigo tanque_movido (rest trayectoria) ladrillos))]))


;moverTanquesEnemigos
(define (moverTanquesEnemigos enemigos ladrillos)
  (define direccion (list-ref MOVIMIENTOS_ENEMIGO (random (length MOVIMIENTOS_ENEMIGO))))
  (define trayectoria (build-list DISTANCIA (lambda (x) direccion)))
  (cond
    [(empty? enemigos) empty]
    [(= 0 (random RANGO_MOVIMIENTO)) 
     (cons (moverTanqueEnemigo (first enemigos) trayectoria ladrillos) 
           (moverTanquesEnemigos (rest enemigos) ladrillos)) ]
    [else (cons (first enemigos) (moverTanquesEnemigos (rest enemigos) ladrillos))]))


;DISPARAR BALAS
;colocarBala
(define (colocarBala tanque balas)
  (define posn (tanque-posn tanque))
  (define tipo (tanque-tipo tanque))
  (define direccion (tanque-direccion tanque))
  (if (string=? tipo TIPO_JUGADOR)
      (append (list (bala posn direccion TIPO_ENEMIGO)) balas)
      (append (list (bala posn direccion TIPO_JUGADOR)) balas)))

;colocarBalaJugador
(define (colocarBalaJugador mundo_anterior)
  (define jugador (mundo-jugador mundo_anterior))
  (define base (mundo-base mundo_anterior))
  (define balas (mundo-balas mundo_anterior))
  ;se adiccionan nuevas balas a las balas que hay en el mundo anteiror
  (define nuevas_balas (colocarBala jugador balas))
  (define ladrillos (mundo-ladrillos mundo_anterior))
  (define enemigos (mundo-enemigos mundo_anterior))
  (define preguntas (mundo-preguntas mundo_anterior))
  (define pregunta (mundo-pregunta mundo_anterior))
  (mundo jugador base nuevas_balas ladrillos enemigos preguntas pregunta))

;colocarBalasEnemigos
(define (colocarBalasEnemigos enemigos balas)
  (cond
    [(empty? enemigos) balas]
    [(= 0 (random RANGO_DISPARO)) 
     (colocarBalasEnemigos 
      (rest enemigos) 
      (colocarBala (first enemigos) balas))]
    [else (colocarBalasEnemigos (rest enemigos) balas)]))


;MOVER BALAS
;moverBala
(define (moverBala b)
  (define direccion (bala-direccion b))
  (define destino (bala-destino b))
  (define posn_nueva (siguientePosicion b direccion))
  (bala posn_nueva direccion destino))

;moverBalas
(define (moverBalas balas)
  (cond 
    [(empty? balas) empty]
    [else (cons (moverBala (first balas)) (moverBalas (rest balas)))]))


;ELIMINAR BALAS

(define (eliminarBalas balas ladrillos copia_balas jugador base)
  (cond 
    [(empty? balas) empty]
    [(colisionObjetoPared? (first balas)) (eliminarBalas (rest balas) ladrillos copia_balas jugador base)]
    [(colisionObjetoLadrillos? (first balas) ladrillos) (eliminarBalas (rest balas) ladrillos copia_balas jugador base)]
    [(colisionObjetoBalas? (first balas) copia_balas) (eliminarBalas (rest balas) ladrillos copia_balas jugador base)]
    [(colisionObjetoBalas? jugador (list (first balas))) (eliminarBalas (rest balas) ladrillos copia_balas jugador base)]
    [(colisionObjetoBalas? base (list (first balas))) (eliminarBalas (rest balas) ladrillos copia_balas jugador base)]
    [else (cons (first balas) (eliminarBalas (rest balas) ladrillos copia_balas jugador base))]))

(define (eliminarBalasAux balas enemigos)
  (cond
    [(empty? balas) empty]
    [(colisionObjetoTanques? (first balas) enemigos) (eliminarBalasAux (rest balas) enemigos)]
    [else (cons (first balas) (eliminarBalasAux (rest balas) enemigos))]))

;ELIMINAR LADRILLOS

(define (eliminarLadrillos ladrillos balas)
  (cond
    [(empty? ladrillos) empty]
    [(colisionObjetoBalas? (first ladrillos) balas) (eliminarLadrillos (rest ladrillos) balas)]
    [else (cons (first ladrillos) (eliminarLadrillos (rest ladrillos) balas))]))

;ELIMINAR ENEMIGOS
 
(define (eliminarEnemigos enemigos)
  (cond
    [(empty? enemigos) empty]
    [(= 0 (tanque-vidas (first enemigos))) (eliminarEnemigos (rest enemigos))]
    [else (cons (first enemigos) (eliminarEnemigos (rest enemigos)))]))

;QUITAR VIDAS JUGADOR, ENEMIGOS O BASE DEL JUGADOR

(define (quitarVidaTanque tanque_anterior balas)
  (define tipo (tanque-tipo tanque_anterior))
  (define imagen (tanque-imagen tanque_anterior))
  (define posn (tanque-posn tanque_anterior))
  (define direccion (tanque-direccion tanque_anterior))
  (define velocidad (tanque-velocidad tanque_anterior))
  (define vidas (tanque-vidas tanque_anterior))
  (cond
    [(colisionObjetoBalas? tanque_anterior balas) 
     (tanque tipo imagen posn direccion velocidad (- vidas 1))]
    [else tanque_anterior]))

;quitarVidaTanques
(define (quitarVidaTanques tanques balas)
  (cond
    [(empty? tanques) empty]
    [else (cons (quitarVidaTanque (first tanques) balas)
                (quitarVidaTanques (rest tanques) balas))]))

(define (quitarVidaEnemigos tanques balas pregunta seleccion )
  
  (define respuesta (pregunta-respuesta pregunta))
  (if (string=? respuesta seleccion)

                                       
      (quitarVidaTanques tanques balas)
      tanques))

;quitarVidasBaseJugador
(define (quitarVidaBase base_anterior balas)
  (define posn (base-posn base_anterior))
  (define vidas (base-vidas base_anterior))
  (if (colisionObjetoBalas? base_anterior balas)
      (base posn (- vidas 1))
      base_anterior))


;direccion?
(define (direccion? dir)
  (or (string=? dir "up") 
      (string=? dir "down") 
      (string=? dir "left") 
      (string=? dir "right")))

;respuesta?
(define (respuesta? respuesta)
  (cond
    [(string=? respuesta "1") true]
    [(string=? respuesta "2") true]
    [(string=? respuesta "3") true]
    [(string=? respuesta "4") true]
    [else false]))

(define (actualizarPreguntas pregunta preguntas seleccion)
  (define respuesta (pregunta-respuesta pregunta))
  
  
  (append (remove pregunta preguntas) (list pregunta)))


(define (evaluarPregunta mundo_anterior evento_tecla)
  (define jugador (mundo-jugador mundo_anterior))
  (define base (mundo-base mundo_anterior))
  (define balas (mundo-balas mundo_anterior))
  (define ladrillos (mundo-ladrillos mundo_anterior))
  (define enemigos (mundo-enemigos mundo_anterior))
  (define preguntas (mundo-preguntas mundo_anterior))
  (define pregunta (mundo-pregunta mundo_anterior))
  
  (define preguntas_nuevas (actualizarPreguntas pregunta preguntas evento_tecla))
  
  (define balas_restantes (eliminarBalasAux balas enemigos))
  
  (define enemigos_sin_vidas (quitarVidaEnemigos enemigos balas pregunta evento_tecla))
  
  (define enemigos_restantes (eliminarEnemigos enemigos_sin_vidas))
  
  (mundo jugador base  balas_restantes ladrillos enemigos_restantes preguntas_nuevas PREGUNTA_VACIA))

;cambiarMundoPorTeclado
(define (cambiarMundoPorTeclado mundo_anterior evento_tecla)
  (cond
    [(direccion? evento_tecla) 
     (moverTaqueJugador mundo_anterior evento_tecla)]
    [(string=? evento_tecla " ") 
     (colocarBalaJugador mundo_anterior)]
    [(respuesta? evento_tecla) (evaluarPregunta mundo_anterior evento_tecla)]
    [else mundo_anterior]))


;cambiarMundoPorTick
(define (cambiarMundoPorTick mundo_anterior)
  (define enemigos (mundo-enemigos mundo_anterior))
  (define balas (mundo-balas mundo_anterior))
  (if (colisionTanquesBalas? enemigos balas)
      (colocarUnaPreguntaEnElMundo mundo_anterior)
      (colocarMundoSinPreunta mundo_anterior)))

;colocarUnaPreguntaEnElMundo
(define (colocarUnaPreguntaEnElMundo mundo_anterior)
  (define jugador (mundo-jugador mundo_anterior))
  (define base (mundo-base mundo_anterior))
  (define ladrillos (mundo-ladrillos mundo_anterior))
  (define balas (mundo-balas mundo_anterior))
  (define enemigos (mundo-enemigos mundo_anterior))
  (define preguntas (mundo-preguntas mundo_anterior))
  (define pregunta (first preguntas))
  (mundo jugador base balas ladrillos enemigos  preguntas pregunta))

;permite colocar un mundo donde no hay preguntas para responder
(define (colocarMundoSinPreunta mundo_anterior)
  (define jugador (mundo-jugador mundo_anterior))
  (define base (mundo-base mundo_anterior))
  (define ladrillos (mundo-ladrillos mundo_anterior))
  (define balas (mundo-balas mundo_anterior))
  (define enemigos (mundo-enemigos mundo_anterior))
  (define preguntas (mundo-preguntas mundo_anterior))
  (define pregunta (mundo-pregunta mundo_anterior))
  
  (define balas_movidas (moverBalas balas))
  
  (define balas_restantes (eliminarBalas balas_movidas ladrillos balas_movidas jugador base))
  
  (define balas_nuevas (colocarBalasEnemigos enemigos balas_restantes))
  
  (define ladrillos_restantes (eliminarLadrillos ladrillos balas_movidas))
  
  (define enemigos_movidos (moverTanquesEnemigos enemigos ladrillos_restantes))
  
  (define base_sin_vidas (quitarVidaBase base balas_movidas))
  
  (define jugador_sin_vidas (quitarVidaTanque jugador balas_movidas))
  
  (mundo jugador_sin_vidas base_sin_vidas balas_nuevas ladrillos_restantes enemigos_movidos preguntas pregunta))


;stop when ?
(define (terminarJuego? mundo)
  (define vidas_jugador (tanque-vidas (mundo-jugador mundo)))
  (define vidas_base (base-vidas (mundo-base mundo)))
  (define num_enemigos (length (mundo-enemigos mundo)))
  (cond
    [(= 0 vidas_jugador) true]
    [(= 0 vidas_base) true]
    [(= 0 num_enemigos) true]
    [else false]))

;ejecutar
(big-bang MUNDO_INICIAL 
          (on-key cambiarMundoPorTeclado)
          (on-tick cambiarMundoPorTick VELOCIDAD_TICK)
          (to-draw pintarMundo)
          (stop-when terminarJuego?)
          (name "Proyect"))


