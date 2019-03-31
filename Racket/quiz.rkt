;Quiz con cond
;Yo escogi el punto 2 y 3
;3

(define (_km_ k_m)
  (cond
    [(< k_m 300)
    (display "El total a pagar es de: ")
    (display (+ 30000))
    (display "$")]
       

    [(and (>= k_m 300) (<= k_m 1000))
    (display "El total a pagar es de: ")
    (display (+ 30000 (* 1500 (- k_m 300))))
    (display "$")]
     
    
    [(> k_m 1000)
    (display "El total a pagar es de: ")
    (display (+ 30000 (* 1000 (- k_m 300))))
    (display "$") ] 
   )
)  

;llamado
(display "Alquile su auto ya¡¡")
(newline)
(newline)
(display "Cuantos kilometros recorrio, o piensa recorrer con el auto?: ")
(_km_ (read))
(newline)


;2
(define (sueldo_ s_b)
   (cond
     [(> s_b 100000)
      (display "Tiene un descuento por ISS de 2% ")
      (newline)
      (display "Es decir un descuento de: ")
      (display (/ (* s_b 2) 100))
      (display "$")]
  
   
       [(and (>= s_b 90000) (<= s_b 100000))
       (display "Tiene un descuento por ISS de 1% ")
       (newline)
       (display "Es decir un descuento de: ")
       (display (/ (* s_b 1) 100))
       (display " $")]
     
    
       [(< s_b 90000)
       (display "Tiene una bonificación del 4% ")
       (newline)
       (display "Es decir una bonificaion de: ")
       (display (/ (* s_b 2) 100))
       (display " $")]
     )
)  


;llamado
(newline)
(newline)
(display "Con este programa se quiere saber cual va a ser su descuento o bonificacion de acuerdo a su salario")
(newline)
(newline)
(display "Ingrese su sueldo basico: ")
(sueldo_ (read))





;Quiz con if

;3.Una compañía dedicada al alquiler de automóviles cobra un monto fijo de $30000
;para los primeros 300 km de recorrido. Para más de 300 km y hasta 1000 km,
;cobra un monto adicional de $ 1500 por cada kilómetro en exceso sobre 300.
;Para más de 1000 km cobra un monto adicional de $ 1000 por cada kilómetro en exceso
;sobre 1000. Diseñe un procedimiento (función sin parámetros y rin retorno)
;que determine el monto a pagar por el alquiler de un vehículo


(define (km_ km)
  (begin
    (if (< km 300)
       (begin 
         (display "El total a pagar es de: ")
         (display (300000))
         (display "$")
       )
     )  
   )
  
  (begin
    (if (and (>= km 300) (<= km 1000))
     (begin
       (display "El total a pagar es de: ")
       (display (+ 30000 (* 1500 (- km 300))))
       (display "$")
     )
    ) 
   ) 

     
  (begin
    (if (> km 1000)
     (begin
       (display "El total a pagar es de: ")
       (display (+ 30000 (* 1000 (- km 300))))
       (display "$")
     )
    )
   ) 
)     

;llamado
(newline)
(newline)
(newline)
(display "Alquile su auto ya¡¡")
(newline)
(newline)
(display "Cuantos kilometros recorrio, o piensa recorrer con el auto?: ")
(km_ (read))
(newline)







;2.  En  un  registro  se encuentra El Sueldo básico empleado (SB). Si su SB > 100.000 hacerle
;un descuento  por ISS de 2%. Si el sueldo básico es  >= 90.000  y  <= 100.000  descuento  ISS
;de 1% Si el sueldo básico es  <  90.000 tiene  una bonificación 4%.
;Se desea calcular el salario neto de este  empleado
;y  cual  fue el  valor  de  sus  deducciones   y bonificaciones si las tiene.


(define (sueldo sb)

  (begin
   (if (> sb 100000)
    (begin
    (display "Tiene un descuento por ISS de 2% ")
    (newline)
    (display "Es decir un descuento de: ")
     (display (/ (* sb 2) 100))
     (display " $")
    )
    )
   )
   
   (begin 
     (if (and (>= sb 90000) (<= sb 100000))
     (begin
    (display "Tiene un descuento por ISS de 1% ")
    (newline)
    (display "Es decir un descuento de: ")
     (display (/ (* sb 1) 100))
     (display " $")
     )
    )
   )
   (begin
     (if (< sb 90000)
     (begin
    (display "Tiene una bonificación del 4% ")
    (newline)
    (display "Es decir una bonificaion de: ")
     (display (/ (* sb 2) 100))
     (display " $")
     ) 
    )
   )
)


;llamado
(newline)
(newline)
(newline)
(display "Con este programa se quiere saber cual va a ser su descuento o bonificacion de acuerdo a su salario")
(newline)
(newline)
(display "Ingrese su sueldo basico: ")
(sueldo (read))





;1. De un grupo de 30 estudiantes se conocen los siguientes datos:   Código, Nombre, Nota1, Nota2, Nota3;
;diseñe un programa que calcule y que muestre en pantalla el promedio de sus notas,
;el programa debe mostrar en pantalla un mensaje que le indique al usuario el estado del estudiante de acuerdo a la siguiente tabla.

;llamado
    

(define (nota3 d name n1 n2 n3)
  (begin
    (display "El promedio del estudiante es: ")
    (display (/(+ n1 n2 n3) 3))
   )
  (begin
    (if (< (/(+ n1 n2 n3) 3) 3)
      (display " No aprobo")  
    )
   )
  
  (begin
    (if (and (>= (/(+ n1 n2 n3) 3) 3) (< (/(+ n1 n2 n3) 3) 4))
       (display " Aprobo sobresalinetemente")
    )
   )
  
  (begin
    (if (>= (/(+ n1 n2 n3) 3) 4)
        (display " Aprobo excelentemente")
     )
   ) 
)


(define (nota2 d name n1 n2)
  (begin
    (display "Ingrese la nota 3: ")
    (nota3 d name n1 n2 (read))
    (newline)
   ) 
)   
           

(define (nota1 d name n1)
  (begin
    (display "Ingrese la nota 2: ")
    (nota2 d name n1 (read))
    (newline)
   )
)  

(define (nom d name)
  (begin
    (display "Ingrese la nota 1: ")
    (nota1 d name (read))
    (newline)
  )
)  

(define (stu d)
  (begin
    (display "Ingrese el nombre del estudiante: ")
    (nom d (read))
    (newline)
   ) 
)

(newline)
(newline)
(newline)
(display "Con este programa se calcula el promedio del estudiante, para saber si aprueba o no.")
(newline)
(display "Ingrese el codigo del estudiante: ")
(stu (read))