;13





;12
(define (eleva a b g w d)
  (if (> b 0)
      
      (begin
        (if (< g (expt w b))
            (eleva a b (* a g) w d)
            (begin
              (display "El resultado es: ")
              (display g)
            ) 
        )
      )

      (begin
        (if (< g (expt w d))
            (eleva a b (* a g) w d)
            (begin
              (display "El resultado es: ")
              (display (/ 1 g))
            ) 
        )
      )  
  )     
)  



(define (preeleva a b)
  (begin
    (define g a)
    (define w a)
    (define d (* -1 b))
    (eleva a b g w d)
  )
)  

  
  
(define (agr a)
  (begin
    (display "Digite la potencia: ")
    (preeleva a (read))
  )
)

(display "Con esta función vamos a elevar un numero que escoja a una potecia que escoja.")
(newline)
(display "1. La potencia puede ser positiva o negativa.")
(newline)
(newline)
(display "Ingrese el numero: ")
(agr (read))


;11
(define (eleva1 a b c g)
  (if (< g c)
     (eleva1 a b c (* a g))
     
     (begin
       (display "El resultado es: ")
       (display g)
     )
  )
)

(define (eleva a b)
  (begin
    (define g a)
    (define c (expt a b))
    (eleva1 a b c g)
  )
)
  
(define (agr a)
  (begin
    (display "Digite la potencia: ")
    (eleva a (read))
  )
)

(newline)
(newline) 
(display "Con esta función vamos a elevar un numero que escoja a una potecia que escoja.")
(newline)
(display "1. La potencia tiene que ser positiva.")
(newline)
(newline)
(display "Ingrese el numero: ")
(agr (read))



;10
(define (numb1 a b z)
  (if (<= z a)

     (begin
       (display (expt b z))
       (newline)
       (numb1 a (+ b 1) (+ z 1))
     )

     (display "Fin.")
  )
)

(define (numb a)
  (define z 1)
  (define b 1)
  (numb1 a b z)
)


(newline)
(newline)
(display "Con este programa vamos a dar la sumatoria de la expreción x^x hasta el numero que usted escoja")
(newline)
(display "Elija el numero, hasta que quiera que se realice la sumatoria: ")
(numb (read))


;9
(define (sumat2 a b z)
  
  (if (< b (/ (expt z 2) 2))
      
   (sumat2 (+ a (/ b 2))  (expt (+ b 1) 2) z)

   (begin
   (display "El resultado de la sumatoria de ") (display z) (display " es igual a: ")
   (display a)
   )

 )
  
)

(define (sumat a)
  (begin
    (define z a)
    (define b 0)
    (sumat2 (/ (expt a 2) 2) b z)
  )
)

(newline)
(newline)
(display "Este programa calcula la sumatoria de un numero con la operación x^2/2")
(newline)
(display "Ingrese el numero: ")
(sumat (read))

;8
(define (ggeasy a b z)
  (if (<= b a)
        (ggeasy a (+ b 1) (+ z b))
        (display z)
   )
)

(define (gg a)
  (begin
    (define z 0)
    (define b 0)
    (ggeasy a b z)
  )    
)

(newline)
(newline)
(display "Este programa calcula la sumatoria de los numeros hasta el que escoja: ")
(gg (read))

;7
(define (factorial a b z)
  (if (< b z)
      (factorial (* a b) (+ b 1) z)
      
      (display a)
  )
)

(define (num a)
  (begin
    (define b 1)
    (define z a)
    (factorial a b z)
  )
)

(newline)
(newline)
(display "Con este programa calcularemos el factorial de un numero")
(newline)
(display "Ingrese el numero: ")
(num (read))


;6
(define (ggeasy a b z)
  (if (< b z)
        (ggeasy (+ a b) (+ b 1) z)
        (display a)
  )
)

(define (gg a)
  (begin
    (define z a)
    (define b 0)
    (ggeasy a b z)
  )    
)

(newline)
(newline)
(display "Este programa calcula la sumatoria de el numero que escoja: ")
(gg (read))


;5
(define (tab2 a b c)
  (if (and (<= b 10) (<= c a))

      (begin
        (display c) (display " * ")
        (display b) (display " = ") (display (* c b))
        (newline)
        (tab2 a (+ b 1) c)
      )

    
        (if (and (> b 10) (<= c a))
           (begin
            (newline)
            (tab2 a (- b 10) (+ c 1)) 
           )
        )  
  )
)
 


(define (tab a)
  (begin
    (define b 1)
    (define c 1)
    (tab2 a b c)
  )
)  

(newline)
(newline)
(display "Con este programa podremos calcular las tablas de multiplicar")
(newline)
(display "Elige hasta que tabla quieres mostrar: ")
(tab (read))


;4
(define (tab2 a b)
  (if (<= b 10)
      (begin
        (display a)(display " * ")(display b)
        (display " = ")(display (* a b))
        (newline)
        (tab2 a (+ b 1))

      )  
  )      
)

(define (tab a)
  (begin
    (define b 1)
    (tab2 a b)
  )
)  

(newline)
(newline)
(display "Con este programa mostraremos la tabla de multiplicar que escoja hasta el 10: ")
(tab (read))



;3
(define (num a)
  (if (>= a 1)
      (begin
        (display a)
        (newline)
        (num (- a 1))
      )   
  )
    
    (if (<= a -1)
        (begin
          (display a)
          (newline)
          (num (+ a 1))
        )
     )
)  

(newline)
(newline)
(display "Con este programa se mostraran los primeros numeros enteros del numero que digite: ")
(num (read))


;2
(define (salu a)
  (if (>= a 1)
      (begin
        (display "Hola")
        (newline)
        (salu (- a 1))
      )  
  )    
)  

(newline)
(newline)
(display "Ingrese el numero de veces que quiere mostrar el mensaje hola :")
(salu (read))


;1.
(define (salu a)
  (if (>= a 1)
      (begin
        (display "hola")
        (newline)
        (salu (- a 1))
      )

      (display "Fin")
  )      
)  

(newline)
(newline)
(salu 10)