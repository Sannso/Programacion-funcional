;PROYECTO FINAL DE PROGRAMACION I- 2017
;PRESENTADO POR: SANTIAGO SOSA HERRERA Y SANTIAGO PACHON SANTA
;PROFESOR FRANCISCO MEDINA

;Aca abrimos la libreria y la ventana de inicio
(require (lib "graphics.ss" "graphics"))
(open-graphics)
(define ventanaq (open-viewport "Minerman" 800 600))
((draw-solid-rectangle ventanaq)(make-posn 0 0) 800 600 "black")
((draw-pixmap ventanaq) "imagenes/TITULOO.jpg" (make-posn 0 0)) 

;Funcion de pantalla de creditos
(define (creditos) 
(define ventana3 (open-viewport "imagenes/Creditos" 800 600))
  ((draw-pixmap ventana3) "imagenes/creditos.jpg" (make-posn 0 0))
  )
  

;Cierra la ventana 
(define (cerrar)
  (close-viewport ventanaq))

;Funcion ventana de ayuda
(define (ayuda)
  (define ventana2 (open-viewport "imagenes/Ayuda" 800 600))
  (define (close) (close-viewport ventana2))
  (define (ayuda2)
  ((draw-pixmap ventana2) "imagenes/Mecanicas.jpg"(make-posn 0 0))
  )
((draw-solid-rectangle ventana2)(make-posn 0 0) 800 600 "black")
  ((draw-pixmap ventana2)"imagenes/Controles.jpg" (make-posn 0 0))
  (get-mouse-click ventana2)
  (define x (posn-x (query-mouse-posn ventana2)))
  (define y (posn-y (query-mouse-posn ventana2)))
  (display x)
  (newline)
  (display y)    
  (if (and (>= x 705)(<= x 770)(>= y 25)(<= y 130))
      (ayuda2)
  )
  (if (and (>= x 652)(<= x 786)(>= y 510)(<= y 590))
      (close)
      )
  (if (and (>= x 705)(<= x 770)(>= y 25)(<= y 130))
      (ayuda2)
  )
  )
(define (ayuda2)
  ((draw-pixmap ventana2) "imagenes/Mecanicas.jpg"(make-posn 0 0))
  )

;----------------------------------------------------------------Funcion del juego--------------------------------------------------------------------------

(define (laberinto)
  (define ventana (open-viewport "juego" 1100 782));nombre de la ventana
  (close-viewport ventanaq)
 ((draw-pixmap ventana) "imagenes/e1.png" (make-posn 0 0)) ;Dibujo del mapa
  ((draw-pixmap ventana) "imagenes/puerta.png" (make-posn 1047 624)) ;Dibujo de la puerta de victoria

  
;lo que mueve el personaje
(minerman ventana 50 55 0);este es el personaje en la posicion inicial 
 (moverpersonaje ventana 50 55 0) ;esto es lo que hace que se mueva - (contador)

 ((draw-line ventana) (make-posn 50 55) (make-posn 1048 55) "black")
  ((draw-line ventana) (make-posn 50 55) (make-posn 50 727) "black")
  ((draw-line ventana) (make-posn 50 727) (make-posn 1048 727) "black")
  ((draw-line ventana) (make-posn 1048 727) (make-posn 1048 55) "black")
  ((draw-line ventana) (make-posn 953 103) (make-posn 953 159) "red")
  
 )
;-----------------------------------------------
;funciones


;--------funcion (minerman derecha)
 (define (minerman ventana a b numer)
   (if (= numer 0)
   ((draw-pixmap ventana) "imagenes/m1.png" (make-posn a b))
   )

   (if (= numer 1)
   ((draw-solid-rectangle ventana)(make-posn a b) 23 44 "white")
   )
   
;Derecha paso
   
   (if (= numer 10)
   ((draw-pixmap ventana) "imagenes/pasode.png" (make-posn a b))
   )
   
;---------funcion (minerman izquierda)

   (if (= numer 2)
   ((draw-pixmap ventana) "imagenes/izquierda.png" (make-posn a b))
   )

   (if (= numer 3)
   ((draw-solid-rectangle ventana)(make-posn a b) 23 44 "white")
   )
   
;Izquierda paso
   
   (if (= numer 20)
   ((draw-pixmap ventana) "imagenes/pasoiz.png" (make-posn a b))
   )

   
 ;-----------funcion (minerman arriba)

   (if (= numer 4)
   ((draw-pixmap ventana) "imagenes/espaldas.png" (make-posn a b))
   )

   (if (= numer 5)
   ((draw-solid-rectangle ventana)(make-posn a b) 23 44 "white")
   )

  ;Espaldas paso
   
   (if (= numer 40)
   ((draw-pixmap ventana) "imagenes/espaldapasoi.png" (make-posn a b))
   )

   (if (= numer 45)
   ((draw-pixmap ventana) "imagenes/espaldasd.png" (make-posn a b))
   )
 


;----------funcion (minerman frente)

 (if (= numer 6)
   ((draw-pixmap ventana) "imagenes/frente.png" (make-posn a b))
   )

   (if (= numer 7)
   ((draw-solid-rectangle ventana)(make-posn a b) 23 44 "white")
   )

  ;Espaldas paso
   
   (if (= numer 60)
   ((draw-pixmap ventana) "imagenes/frentepasoi.png" (make-posn a b))
   )

   (if (= numer 65)
   ((draw-pixmap ventana) "imagenes/frentepasod.png" (make-posn a b))
   )
 )

 
;funcion 2 (lo que lo mueve)

 (define (moverpersonaje ventana a b pres)
   
  (define pres 0)
  (set! pres (key-value (get-key-press ventana))); lo que hace que ud al oprimir una flecha
   ;el personaje se mueve en la direccion de la flecha
    
    (if (equal? pres 'right) ;si opime flecha a la DERECHA
         (begin
           
              (if (and(>= a 1019)(>= b 626))
              
              (begin
                ((draw-pixmap ventana) "imagenes/win.png" (make-posn 0 0))              
                (sleep 6)
                (close-viewport ventana)
                (close-graphics)
                )
              (begin
                (void)
                )            
             )
              


        
        (begin
                  ;columna 1  eso es (a - 28) (b - 47)                       columna 2                                                coluimna 3
          (if (or (and (>= a 1020) (>= b 50) (<= b 725))       
                  (and (>= a 67) (<= a 143) (>= b 57) (<= b 154))          (and (>= a 163) (<= a 240) (>= b 57) (<= b 154))          (and (>= a 256) (<= a 336) (>= b 57) (<= b 154))
                  (and (>= a 67) (<= a 143) (>= b 166) (<= b 261))         (and (>= a 163) (<= a 240) (>= b 166) (<= b 261))         (and (>= a 256) (<= a 336) (>= b 166) (<= b 261))
                  (and (>= a 67) (<= a 143) (>= b 267) (<= b 365))         (and (>= a 163) (<= a 240) (>= b 267) (<= b 365))         (and (>= a 256) (<= a 336) (>= b 267) (<= b 365)) 
                  (and (>= a 67) (<= a 143) (>= b 373) (<= b 468))         (and (>= a 163) (<= a 240) (>= b 373) (<= b 468))         (and (>= a 256) (<= a 336) (>= b 373) (<= b 468))  
                  (and (>= a 67) (<= a 143) (>= b 476) (<= b 572))         (and (>= a 163) (<= a 240) (>= b 476) (<= b 573))         (and (>= a 256) (<= a 336) (>= b 476) (<= b 573)) 
                  (and (>= a 73) (<= a 143) (>= b 581) (<= b 678))         (and (>= a 163) (<= a 240) (>= b 581) (<= b 678))         (and (>= a 256) (<= a 336) (>= b 581) (<= b 678))


                   ;columna 4                                                columna 5                                                 columa 6 
                  (and (>= a 352) (<= a 430) (>= b 57) (<= b 154))          (and (>= a 448) (<= a 526) (>= b 57) (<= b 154))          (and (>= a 543) (<= a 621) (>= b 57) (<= b 154))
                  (and (>= a 352) (<= a 430) (>= b 166) (<= b 261))         (and (>= a 448) (<= a 526) (>= b 166) (<= b 261))         (and (>= a 543) (<= a 621) (>= b 166) (<= b 261))
                  (and (>= a 352) (<= a 430) (>= b 267) (<= b 365))         (and (>= a 448) (<= a 526) (>= b 267) (<= b 365))         (and (>= a 543) (<= a 621) (>= b 267) (<= b 365)) 
                  (and (>= a 352) (<= a 430) (>= b 373) (<= b 468))         (and (>= a 448) (<= a 526) (>= b 373) (<= b 468))         (and (>= a 543) (<= a 621) (>= b 373) (<= b 468))  
                  (and (>= a 352) (<= a 430) (>= b 476) (<= b 572))         (and (>= a 448) (<= a 526) (>= b 476) (<= b 573))         (and (>= a 543) (<= a 621) (>= b 476) (<= b 573)) 
                  (and (>= a 352) (<= a 430) (>= b 581) (<= b 678))         (and (>= a 448) (<= a 526) (>= b 581) (<= b 678))         (and (>= a 543) (<= a 621) (>= b 581) (<= b 678))


                   ;columna 7                                                columna 8                                                 columa 9 
                  (and (>= a 638) (<= a 714) (>= b 57) (<= b 154))          (and (>= a 733) (<= a 810) (>= b 57) (<= b 154))          (and (>= a 828) (<= a 906) (>= b 57) (<= b 154))
                  (and (>= a 638) (<= a 714) (>= b 166) (<= b 261))         (and (>= a 733) (<= a 810) (>= b 166) (<= b 261))         (and (>= a 828) (<= a 906) (>= b 166) (<= b 261))
                  (and (>= a 638) (<= a 714) (>= b 267) (<= b 365))         (and (>= a 733) (<= a 810) (>= b 267) (<= b 365))         (and (>= a 828) (<= a 906) (>= b 267) (<= b 365)) 
                  (and (>= a 638) (<= a 714) (>= b 373) (<= b 468))         (and (>= a 733) (<= a 810) (>= b 373) (<= b 468))         (and (>= a 828) (<= a 906) (>= b 373) (<= b 468))  
                  (and (>= a 638) (<= a 714) (>= b 476) (<= b 572))         (and (>= a 733) (<= a 810) (>= b 476) (<= b 573))         (and (>= a 828) (<= a 906) (>= b 476) (<= b 573)) 
                  (and (>= a 638) (<= a 714) (>= b 581) (<= b 678))         (and (>= a 733) (<= a 810) (>= b 581) (<= b 678))         (and (>= a 828) (<= a 906) (>= b 581) (<= b 678))


                  ;columna 10                                             
                  (and (>= a 923) (<= a 1000) (>= b 57) (<= b 154))        
                  (and (>= a 923) (<= a 1000) (>= b 166) (<= b 261))       
                  (and (>= a 923) (<= a 1000) (>= b 267) (<= b 365))       
                  (and (>= a 923) (<= a 1000) (>= b 373) (<= b 468))          
                  (and (>= a 923) (<= a 1000) (>= b 476) (<= b 572))         
                  (and (>= a 923) (<= a 1000) (>= b 581) (<= b 678))         
          
                

)


              (begin
                ()                
                )

              
              (begin
                (minerman ventana a b 1)
                (minerman ventana (+ a 2) b 0)
                (sleep 0.03)
                (minerman ventana (+ a 4) b 10)
                (sleep 0.03)
                (minerman ventana (+ a 6) b 0)
                (moverpersonaje ventana (+ a 6) b 0)
                )
              
          )
      )
        )
    )    
    

   
     (if (equal? pres 'down) ;si oprime flecha ABAJO
         (begin
          (if (or (and (>= b 679) (>= a 50) (<= a 1046)) ;lateral inferior

                  ;Colummna 1                                                 ;Colummna 2                                              ;Colummna 3
                  (and (>= b 54)(<= b 160) (>= a 70) (<= a 142))             (and (>= b 54)(<= b 160) (>= a 166)(<= a 237))              (and (>= b 54)(<= b 160) (>= a 259) (<= a 334))
                  (and (>= b 160)(<= b 261) (>= a 70) (<= a 142))            (and (>= b 160)(<= b 261) (>= a 166) (<= a 237))            (and (>= b 160)(<= b 261) (>= a 259) (<= a 334))
                  (and (>= b 263)(<= b 365) (>= a 70) (<= a 142))            (and (>= b 263)(<= b 365) (>= a 166) (<= a 237))            (and (>= b 263)(<= b 365) (>= a 259) (<= a 334))
                  (and (>= b 366)(<= b 468) (>= a 70) (<= a 142))            (and (>= b 366)(<= b 468) (>= a 166) (<= a 237))            (and (>= b 366)(<= b 468) (>= a 259) (<= a 334))
                  (and (>= b 467)(<= b 572) (>= a 70) (<= a 142))            (and (>= b 467)(<= b 572) (>= a 166) (<= a 237))            (and (>= b 467)(<= b 572) (>= a 259) (<= a 334))
                  (and (>= b 575)(<= b 656) (>= a 75) (<= a 149))            (and (>= b 575)(<= b 656) (>= a 166) (<= a 237))            (and (>= b 575)(<= b 656) (>= a 259) (<= a 334))
                                                 
                                                                
                 ;Columna 4                                                    ;Columna 5                                               ;Columna 6 
                  (and (>= b 54) (<= b 160) (>= a 354) (<= a 429))           (and (>= b 54) (<= b 160) (>= a 451) (<= a 524))             (and (>= b 54) (<= b 160) (>= a 547) (<= a 620))
                  (and (>= b 160)(<= b 261) (>= a 354) (<= a 429))           (and (>= b 160)(<= b 261) (>= a 451) (<= a 524))             (and (>= b 160)(<= b 261) (>= a 547) (<= a 620))
                  (and (>= b 263)(<= b 365) (>= a 354) (<= a 429))           (and (>= b 263)(<= b 365) (>= a 451) (<= a 524))             (and (>= b 263)(<= b 365) (>= a 547) (<= a 620))
                  (and (>= b 366)(<= b 468) (>= a 354) (<= a 429))           (and (>= b 366)(<= b 468) (>= a 451) (<= a 524))             (and (>= b 366)(<= b 468) (>= a 547) (<= a 620))
                  (and (>= b 467)(<= b 572) (>= a 354) (<= a 429))           (and (>= b 467)(<= b 572) (>= a 451) (<= a 524))             (and (>= b 467)(<= b 572) (>= a 547) (<= a 620))
                  (and (>= b 575)(<= b 656) (>= a 354) (<= a 429))           (and (>= b 575)(<= b 656) (>= a 451) (<= a 524))             (and (>= b 575)(<= b 656) (>= a 547) (<= a 620))
                               
                  
                 ;Columna 7                                                    ;Columna 8                                               ;Columna 9 
                  (and (>= b 54) (<= b 160) (>= a 641) (<= a 714))           (and (>= b 54) (<= b 160) (>= a 737) (<= a 810))              (and (>= b 54) (<= b 160) (>= a 832) (<= a 905))
                  (and (>= b 160)(<= b 261) (>= a 641) (<= a 714))           (and (>= b 160)(<= b 261) (>= a 737) (<= a 810))              (and (>= b 160)(<= b 261) (>= a 832) (<= a 905))
                  (and (>= b 263)(<= b 365) (>= a 641) (<= a 714))           (and (>= b 263)(<= b 365) (>= a 737) (<= a 810))              (and (>= b 263)(<= b 365) (>= a 832) (<= a 905))
                  (and (>= b 366)(<= b 468) (>= a 641) (<= a 714))           (and (>= b 366)(<= b 468) (>= a 737) (<= a 810))              (and (>= b 366)(<= b 468) (>= a 832) (<= a 905))
                  (and (>= b 467)(<= b 572) (>= a 641) (<= a 714))           (and (>= b 467)(<= b 572) (>= a 737) (<= a 810))              (and (>= b 467)(<= b 572) (>= a 832) (<= a 905))
                  (and (>= b 575)(<= b 656) (>= a 641) (<= a 714))           (and (>= b 575)(<= b 656) (>= a 737) (<= a 810))              (and (>= b 575)(<= b 656) (>= a 832) (<= a 905))
            
                 
                 ;Columna 10 
                  (and (>= b 54) (<= b 160) (>= a 927) (<= a 1000))
                  (and (>= b 160)(<= b 261) (>= a 927) (<= a 1000))
                  (and (>= b 263)(<= b 365) (>= a 927) (<= a 1000))
                  (and (>= b 366)(<= b 468) (>= a 927) (<= a 1000))
                  (and (>= b 467)(<= b 572) (>= a 927) (<= a 1000))
                  (and (>= b 575)(<= b 656) (>= a 927) (<= a 1000))
              ) 


              (begin
                ()
                )
         
               (begin
                (minerman ventana a b 7)
                (minerman ventana a (+ b 3) 6)
                (sleep 0.02)
                (minerman ventana a (+ b 4) 60)
                (sleep 0.02)
                (minerman ventana a (+ b 5) 65)
                (sleep 0.02)
                (minerman ventana a (+ b 6) 6)
                (moverpersonaje ventana a (+ b 6) 0)
                )

             
     )
      )
    )

   
      (if (equal? pres 'left); si oprime flecha a la IZQUIERDA
               (begin
                 (if (or (and (<= a 53) (>= b 50) (<= b 727)) ;laterar izquierdo

                  ;columa 1                                                  columna 2                                                 columna 3                  
                  (and (>= a 94)  (<= a 146) (>= b 57)  (<= b 154))         (and (>= a 189) (<= a 243) (>= b 57) (<= b 154))          (and (>= a 283) (<= a 339) (>= b 57) (<= b 154))
                  (and (>= a 94)  (<= a 146) (>= b 166) (<= b 261))         (and (>= a 189) (<= a 243) (>= b 166) (<= b 261))         (and (>= a 283) (<= a 339) (>= b 166) (<= b 261))
                  (and (>= a 94)  (<= a 146) (>= b 267) (<= b 365))         (and (>= a 189) (<= a 243) (>= b 267) (<= b 365))         (and (>= a 283) (<= a 339) (>= b 267) (<= b 365)) 
                  (and (>= a 94)  (<= a 146) (>= b 373) (<= b 468))         (and (>= a 189) (<= a 243) (>= b 373) (<= b 468))         (and (>= a 283) (<= a 339) (>= b 373) (<= b 468))  
                  (and (>= a 94)  (<= a 146) (>= b 476) (<= b 572))         (and (>= a 189) (<= a 243) (>= b 476) (<= b 573))         (and (>= a 283) (<= a 339) (>= b 476) (<= b 573)) 
                  (and (>= a 100) (<= a 146) (>= b 581) (<= b 678))         (and (>= a 189) (<= a 243) (>= b 581) (<= b 678))         (and (>= a 283) (<= a 339) (>= b 581) (<= b 678))


                   ;columna 4                                                columna 5                                                 columa 6 
                  (and (>= a 379) (<= a 433) (>= b 57) (<= b 154))          (and (>= a 474) (<= a 531) (>= b 57) (<= b 154))          (and (>= a 570) (<= a 627) (>= b 57) (<= b 154))
                  (and (>= a 379) (<= a 433) (>= b 166) (<= b 261))         (and (>= a 474) (<= a 531) (>= b 166) (<= b 261))         (and (>= a 570) (<= a 627) (>= b 166) (<= b 261))
                  (and (>= a 379) (<= a 433) (>= b 267) (<= b 365))         (and (>= a 474) (<= a 531) (>= b 267) (<= b 365))         (and (>= a 570) (<= a 627) (>= b 267) (<= b 365)) 
                  (and (>= a 379) (<= a 433) (>= b 373) (<= b 468))         (and (>= a 474) (<= a 531) (>= b 373) (<= b 468))         (and (>= a 570) (<= a 627) (>= b 373) (<= b 468))  
                  (and (>= a 379) (<= a 433) (>= b 476) (<= b 572))         (and (>= a 474) (<= a 531) (>= b 476) (<= b 573))         (and (>= a 570) (<= a 627) (>= b 476) (<= b 573)) 
                  (and (>= a 379) (<= a 433) (>= b 581) (<= b 678))         (and (>= a 474) (<= a 531) (>= b 581) (<= b 678))         (and (>= a 570) (<= a 627) (>= b 581) (<= b 678))


                   ;columna 7                                                columna 8                                                 columa 9 
                  (and (>= a 665) (<= a 716) (>= b 57) (<= b 154))          (and (>= a 760) (<= a 812) (>= b 57) (<= b 154))          (and (>= a 856) (<= a 908) (>= b 57) (<= b 154))
                  (and (>= a 665) (<= a 716) (>= b 166) (<= b 261))         (and (>= a 760) (<= a 812) (>= b 166) (<= b 261))         (and (>= a 856) (<= a 908) (>= b 166) (<= b 261))
                  (and (>= a 665) (<= a 716) (>= b 267) (<= b 365))         (and (>= a 760) (<= a 812) (>= b 267) (<= b 365))         (and (>= a 856) (<= a 908) (>= b 267) (<= b 365)) 
                  (and (>= a 665) (<= a 716) (>= b 373) (<= b 468))         (and (>= a 760) (<= a 812) (>= b 373) (<= b 468))         (and (>= a 856) (<= a 908) (>= b 373) (<= b 468))  
                  (and (>= a 665) (<= a 716) (>= b 476) (<= b 572))         (and (>= a 760) (<= a 812) (>= b 476) (<= b 573))         (and (>= a 856) (<= a 908) (>= b 476) (<= b 573)) 
                  (and (>= a 665) (<= a 716) (>= b 581) (<= b 678))         (and (>= a 760) (<= a 812) (>= b 581) (<= b 678))         (and (>= a 856) (<= a 908) (>= b 581) (<= b 678))


                  ;columna 10                                             
                  (and (>= a 951) (<= a 1005) (>= b 57) (<= b 154))        
                  (and (>= a 951) (<= a 1005) (>= b 166) (<= b 261))       
                  (and (>= a 951) (<= a 1005) (>= b 267) (<= b 365))       
                  (and (>= a 951) (<= a 1005) (>= b 373) (<= b 468))          
                  (and (>= a 951) (<= a 1005) (>= b 476) (<= b 572))         
                  (and (>= a 951) (<= a 1005) (>= b 581) (<= b 678)) 
              ) 
                     
                     (begin
                     ()                
                     )

                     
                     (begin
                 (minerman ventana a b 3)
                (minerman ventana (- a 2) b 2)
                (sleep 0.03)
                (minerman ventana (- a 4) b 20)
                (sleep 0.03)
                (minerman ventana (- a 6) b 2)
                (moverpersonaje ventana (- a 6) b 0)
                )

                
      )
     )
    )

       


    (if (equal? pres 'up); si oprime flecha ARRIBA

        (begin
          (if (or (and (<= b 55) (>= a 50) (<= a 1046)) ;lateral superior

                   ;Colummna 1                                               ;Colummna 2                                                   ;Colummna 3
                  (and (>= b 54)(<= b 160) (>= a 70) (<= a 142))             (and (>= b 54)(<= b 160) (>= a 166)(<= a 237))                (and (>= b 54)(<= b 160) (>= a 259) (<= a 334))
                  (and (>= b 160)(<= b 261) (>= a 70) (<= a 142))            (and (>= b 160)(<= b 261) (>= a 166) (<= a 237))              (and (>= b 160)(<= b 261) (>= a 259) (<= a 334))
                  (and (>= b 263)(<= b 365) (>= a 70) (<= a 142))            (and (>= b 263)(<= b 365) (>= a 166) (<= a 237))              (and (>= b 263)(<= b 365) (>= a 259) (<= a 334))
                  (and (>= b 366)(<= b 468) (>= a 70) (<= a 142))            (and (>= b 366)(<= b 468) (>= a 166) (<= a 237))              (and (>= b 366)(<= b 468) (>= a 259) (<= a 334))
                  (and (>= b 467)(<= b 572) (>= a 70) (<= a 142))            (and (>= b 467)(<= b 572) (>= a 166) (<= a 237))              (and (>= b 467)(<= b 572) (>= a 259) (<= a 334))
                  (and (>= b 575)(<= b 680) (>= a 75) (<= a 149))            (and (>= b 575)(<= b 680) (>= a 166) (<= a 237))              (and (>= b 575)(<= b 680) (>= a 259) (<= a 334))
                                                             
                  
                 ;Columna 4                                                   ;Columna 5                                                   ;Columna 6 
                  (and (>= b 54) (<= b 160) (>= a 354) (<= a 429))            (and (>= b 54) (<= b 160) (>= a 451) (<= a 524))             (and (>= b 54) (<= b 160) (>= a 547) (<= a 620))
                  (and (>= b 160)(<= b 261) (>= a 354) (<= a 429))            (and (>= b 160)(<= b 261) (>= a 451) (<= a 524))             (and (>= b 160)(<= b 261) (>= a 547) (<= a 620))
                  (and (>= b 263)(<= b 365) (>= a 354) (<= a 429))            (and (>= b 263)(<= b 365) (>= a 451) (<= a 524))             (and (>= b 263)(<= b 365) (>= a 547) (<= a 620))
                  (and (>= b 366)(<= b 468) (>= a 354) (<= a 429))            (and (>= b 366)(<= b 468) (>= a 451) (<= a 524))             (and (>= b 366)(<= b 468) (>= a 547) (<= a 620))
                  (and (>= b 467)(<= b 572) (>= a 354) (<= a 429))            (and (>= b 467)(<= b 572) (>= a 451) (<= a 524))             (and (>= b 467)(<= b 572) (>= a 547) (<= a 620))
                  (and (>= b 575)(<= b 680) (>= a 354) (<= a 429))            (and (>= b 575)(<= b 680) (>= a 451) (<= a 524))             (and (>= b 575)(<= b 680) (>= a 547) (<= a 620))
                                                  
                                    
                 ;Columna 7                                                   ;Columna 8                                                    ;Columna 9
                  (and (>= b 54) (<= b 160) (>= a 641) (<= a 714))            (and (>= b 54) (<= b 160) (>= a 737) (<= a 810))             (and (>= b 54) (<= b 160) (>= a 832) (<= a 905))
                  (and (>= b 160)(<= b 261) (>= a 641) (<= a 714))            (and (>= b 160)(<= b 261) (>= a 737) (<= a 810))             (and (>= b 160)(<= b 261) (>= a 832) (<= a 905))
                  (and (>= b 263)(<= b 365) (>= a 641) (<= a 714))            (and (>= b 263)(<= b 365) (>= a 737) (<= a 810))             (and (>= b 263)(<= b 365) (>= a 832) (<= a 905))
                  (and (>= b 366)(<= b 468) (>= a 641) (<= a 714))            (and (>= b 366)(<= b 468) (>= a 737) (<= a 810))             (and (>= b 366)(<= b 468) (>= a 832) (<= a 905))
                  (and (>= b 467)(<= b 572) (>= a 641) (<= a 714))            (and (>= b 467)(<= b 572) (>= a 737) (<= a 810))             (and (>= b 467)(<= b 572) (>= a 832) (<= a 905))
                  (and (>= b 575)(<= b 680) (>= a 641) (<= a 714))            (and (>= b 575)(<= b 680) (>= a 737) (<= a 810))             (and (>= b 575)(<= b 680) (>= a 832) (<= a 905))
                                
                  
                 ;Columna 10 
                  (and (>= b 54) (<= b 160) (>= a 927) (<= a 1000))
                  (and (>= b 160)(<= b 261) (>= a 927) (<= a 1000))
                  (and (>= b 263)(<= b 365) (>= a 927) (<= a 1000))
                  (and (>= b 366)(<= b 468) (>= a 927) (<= a 1000))
                  (and (>= b 467)(<= b 572) (>= a 927) (<= a 1000))
                  (and (>= b 575)(<= b 680) (>= a 927) (<= a 1000))
              ) 


              (begin
                ()
                )
        
             (begin
                (minerman ventana a b 5)
                (minerman ventana a (- b 2) 4)
                (sleep 0.02)
                (minerman ventana a (- b 3) 40)
                (sleep 0.02)
                (minerman ventana a (- b 4) 45)
                (sleep 0.02)
                (minerman ventana a (- b 6) 4)
                (moverpersonaje ventana a (- b 6) 0)
                )

             
       )
      )
    )

   

   (moverpersonaje ventana a b 0)
    
)

;Funcion del click, que permite interactuar en las ventanas del menu.
 (define (click)
  (get-mouse-click ventanaq) 
  (define x (posn-x (query-mouse-posn ventanaq)))
  (define y (posn-y (query-mouse-posn ventanaq)))
  (display x)
  (newline)
  (newline)
  (display y)
  (if (and (>= x 257)(<= x 532) (>= y 243)(<= y 319))
      (laberinto)
      )
  (if (and (>= x 275)(<= x 531) (>= y 396)(>= y 449))
      (creditos)
      )
  (if (and (>= x 652)(<= x 786) (>= y 490)(<= y 590))
      (cerrar)
      )
  (if (and (>= x 266)(<= x 535) (>= y 373)(<= y 437))
      (ayuda)
      )
      (click)
  )
 
 (click)      
;ggeasy