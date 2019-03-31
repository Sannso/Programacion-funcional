
(define (estudiante a b c d e f g)
  (define promedio (/ (+ c d e) 3))
              (if (>= g 1)
                       (begin
                          (if (< promedio 3)
                             (begin 
                              (display b)
                              (display " No aprobo")
                             ) 
                          )

                          (if (and (>= promedio 3) (<= promedio 4))
                             (begin 
                              (display b)
                              (display " Aprobo")
                             ) 
                          )

                          (if (< promedio 3)
                              (begin 
                              (display b)
                              (display " Aprobo sobresalientemente")
                             ) 
                          )
                          (newline)
                          (display "Digite los datos del siguiente estudiante: ")
                          (estudiante (read) (read) (read) (read) (read) (+ f promedio) (- d 1))
                          (newline)
                       )

                      (if (= g 0)
                       (begin
                          (if (< promedio 3)
                             (begin 
                              (display b)
                              (display " No aprobo")
                             ) 
                          )

                          (if (and (>= promedio 3) (<= promedio 4))
                             (begin 
                              (display b)
                              (display " Aprobo")
                             ) 
                          )

                          (if (< promedio 3)
                              (begin 
                              (display b)
                              (display " Aprobo sobresalientemente")
                             ) 
                          )
                          (newline)
                          (newline)
                          (display "El promedio de el grupo es: ") (display (/ (+ f promedio) 4))
                       )
                     )
                 )
 )

  



(display "Este programa muestra el promedio de la nota de cada estudiante y al final el promedio de los 4 ")
(newline)
(display "Ingrese los datos de esta manera: ")
(newline)
(display "codigo")
(newline)
(display "nombre")
(newline)
(display "nota 1")
(newline)
(display "nota 2")
(newline)
(display "nota 3")
(newline)
(newline)
(display "Digite los datos del estudiante: ")
(newline)
(define codi (read))
(define nom (read))
(define n1 (read))
(define n2 (read))
(define n3 (read))

(estudiante codi nom n1 n2 n3 0 3)
