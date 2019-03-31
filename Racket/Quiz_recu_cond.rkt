;Parcial de recursividad Santiago Sosa Herrera 1004752258
;4
(define (piramide a b c d)
  (if (and (< b c) (< d a))
      (begin
        (display "*")
        (piramide a (+ b 1) c d)
      )

      (if (>= b c)
          (begin
            (newline)
            (piramide a 0 (+ c 1) (+ d 1))
           )
      )
  )


  (if (= d a)
      (begin
        (newline)
      )

      (if)
  )
  
)

(define (pira a)
  (define d 0)
  (define c 1)
  (define b 0)
  (piramide a b c d)
)

(display "Este programa crea un triangulo, como una piramide\n Ingrese el valor de la piramide: ")
(pira (read))

;3.1 Porque no c que hice:


(define (triangulo2 a b c d)
  (if (and (< b d) (<= c a))
      (begin
        (display "*")
        (triangulo2 a (+ b 1) c d)
      )
      
      (if (>= b d) 
         (begin
           (newline)
           (triangulo2 a 1 (+ c 1) (+ d 1))
         ) 
      )
  )

  

  

)

(define (triangulo a)
  (define c 1)
  (define b 1)
  (define d 2)
  (triangulo2 a b c d)
)

(newline)
(newline)
(display "Este programa dibuja un triangulo rectangulo: ")
(newline)
(display "Ingrese el valor del triangulo: ")
(triangulo (read))


;3
(define (triangulo2 a b c d)
  (if (and (<= c d) (<= b a))
      (begin
        (display "*")
        (triangulo2 a b (+ c 1) d)
      )

      (if (and (> c 1) (< b a))
          (begin
            (newline)
            (display "*")
            (triangulo2 a (+ b 1) 2 (+ d 1))
          )
      )    
  )
)
   

(define (triangulo a)
  (define b 1)
  (define c 1)
  (define d 1)
  (triangulo2 a b c d)
)

(newline)
(newline)
(display "Este programa dibuja un triangulo rectangulo: ")
(newline)
(display "Ingrese el valor del triangulo: ")
(triangulo (read))


;2
(define (rectangulo a b c d e )
   (if (and (< b (/ a c)) (<= d (* c e))) 
      (begin
        (display "*")
        (rectangulo a (+ b 1) c (+ d 1) e )
      )

      (if (= b (/ a c))
          (begin
            (display "*")
            (newline)
            (rectangulo a 1 c (+ d 1) e )
          )
      )
  ) 
)

(define (rectan a b c d e )
(rectangulo (expt a 2) 1 c 1 e )
)


(define (largo a d)
  (define b 1)
  (define c a)
  (define e d)

  (rectan a b c d e )
)


(define (ancho a)
(display "Ingrese el valor de la altura: ")
(largo a (read))
)  

(newline)
(newline)
(display "Esta funcion dibuja un rectangulo")
(newline)
(display "Ingrese el valor del ancho: ")
(ancho (read))




;1

(define (cuadrado2 a b c d)
  (if (and (< b (/ a c)) (<= d a)) 
      (begin
        (display "*")
        (cuadrado2 a (+ b 1) c (+ d 1))
      )

      (if (= b (/ a c))
          (begin
            (display "*")
            (newline)
            (cuadrado2 a 1 c (+ d 1))
          )
      )
  )    

  
)

(define (cuadrado a)
  (define d 1)
  (define b 1)
  (define c a)
  (cuadrado2 (expt a 2) b c d)
)

(newline)
(newline)
(display "Esta funcion dibuja un cuadrado")
(newline)
(display "Ingrese el valor del cuadrado: ")
(cuadrado (read))
