;Taller condicionales------

;21

;El precio de 2 dias antes del viaje a bogota cuesta 135
;El precio de 1 dia antes del iaje en San Andres es de 395000
(define (viajec a b)
  (newline)
  (cond

    [(and (= a 1) (= b 1))
     (display "Su compra es exitosa, acaba de adquirir un viaje a Bogota 1 dia antes, con el precio de: ")
     (display (* (+ 135.0 (/ (* 135 5) 100.0)) 2800.0)) (display "$")(display " Pesos Colombianos.")]

    [(and (= a 1) (= b 2))
     (display "Su compra es exitosa, acaba de adquirir un viaje a Bogota 2 dias antes, con el precio de: ")
     (display (* 135.0 2800.0)) (display "$")(display " Pesos Colombianos.")]

    [(and (= a 1) (= b 0))
     (display "Su compra es exitosa, acaba de adquirir un viaje a Bogota del dia de hoy, con el precio de: ")
     (display (* (+ 141.75 (/ (* 141.75 8) 100)) 2800.0)) (display "$")(display " Pesos Colombianos.")]


    [(and (= a 2) (= b 1))
     (display "Su compra es exitosa, acaba de adquirir un viaje a San Andres 1 dia antes, con el precio de: ")
     (display 395000) (display "$")(display " Pesos Colombianos.")]

    [(and (= a 2) (= b 2))
     (display "Su compra es exitosa, acaba de adquirir un viaje a San Andres 2 dias antes, con el precio de: ")
     (display (- 395000 (/ (* 395000 7) 100))) (display "$")(display " Pesos Colombianos.")]

    [(and (= a 2) (= b 0))
     (display "Su compra es exitosa, acaba de adquirir un viaje a San Andres del dia de hoy, con el precio de: ")
     (display (* (+ (/ 395000 2800) (/ (* (/ 395000 2800) 5) 100)) 2800)) (display "$")(display " Pesos Colombianos.")]
    
  )
)

(define (viaje a)
  (newline)
  (display "El precio del tiquete varia segun que dia lo compres; elige el dia en que lo vas a comprar: ")
  (newline)
       (display "-Escriba 2 para, comprarlo 2 dias antes de la salida")
       (newline)
           (display "  En bogota su precio es de: ")(display (* (+ 135.0 (/ (* 135 5) 100.0)) 2800.0))
           (newline)
           (display "  En San Andres su precio es de: ")(display (- 395000 (/ (* 395000 7) 100)))
  (newline)
  (newline)
       (display "-Escriba 1 para, comprarlo 1 dia antes de la salida")
       (newline)
           (display "  En bogota su precio es de: ")(display (* 135.0 2800.0))
           (newline)
           (display "  En San Andres su precio es de: ")(display 395000 )
  (newline)
  (newline)
       (display "-Escriba 0 para, comprarlo el mismo dia de la salida")
       (newline)
           (display "  En bogota su precio es de: ")(display (* (+ 141.75 (/ (* 141.75 8) 100)) 2800.0))
           (newline)
           (display "  En San Andres su precio es de: ")(display (* (+ (/ 395000 2800) (/ (* (/ 395000 2800) 5) 100)) 2800))
  (newline)
  (display "Ingrese el numero aquí: ")
  (viajec a (read))
)

  

(display "Bienvenido a esta aerolinea, favor de escojer el lugar de viaje: ")
(newline)
(display "Ingrese el numero 1, para Bogota")
(newline)
(display "Ingrese el numero 2, para San Andres")
(newline)
(display "Ingrese el numero aquí: ")
(viaje (read))


;20
(define (primo a)
  (newline)
     (cond

       [(or (= a 2) (= a 3) (= a 5) (= a 7) (= a 11))
        (display "Es primo")]

       [(<= a 1)
        (display "Indeterminado")]

       [(even? a) (> a 2)
        (display "Es Compuesto")]

       [(or (= (remainder a 2) 0) (= (remainder a 3) 0) (= (remainder a 5) 0)
            (= (remainder a 7) 0) (= (remainder a 11) 0) (= (remainder a 13) 0)
            (= (remainder a 17) 0) (= (remainder a 19) 0) (= (remainder a 23) 0))
        (display "Es Compuesto")]

       [else (display "Posiblemete sea primo")]
       
     )
)

(newline)
(newline)
(newline)
(newline)
(display "Con este programa vamos a comprobar si un numero es posiblemente, un numero primo")
(newline)
(display "Ingrese el numero: ")
(primo (read))

;19
(define (prom a)
  (cond

    [(and (>= a 10) (< a 100))
     (display "el promedio de ") (display a) (display " es igual a: ")
     (display (/ (+ (remainder a 10) (quotient a 10)) 2))]

    [(and (>= a 100) (< a 1000))
     (display "el promedio de ") (display a) (display " es igual a: ")
     (display (/ (+ (quotient a 100) (quotient (remainder a 100) 10) (remainder (remainder a 100) 10)) 3))]
    
  )
)

(newline)
(newline)
(display "Con este programa calcualremos el promedio de un numero de digite de máximo 3 dígitos, ")
(display "esto consiste en coger un numero como 23 y separarlo 2 y 3 y sacar su promedio.")
(newline)
(display "Ingrese el digito")
(newline)
(prom (read))


;18
(define (ahorro a)
  (cond ((and(> a 0)(display "La tasa de interés será de: ")(display(* a 0.30))(newline)(display "Dando como total ahorrado en 10 años: ")(* (+ a(* a 0.30))12 10)))
        )
  )

;llamado
(newline)
(newline)
(display "Este programa calcula cuánto se tendrá ahorrado en unos 10 años luego de tener una tasa de interés del 3% por mes")
(newline)
(display "Ingrese el ahorro inicial que se hará: ")
(ahorro (read))



(newline)
(newline)
(display "Conoce cuanto tendrias ahorrado despues de 10 años con un ahorro inicial¡¡")
(newline)
(display "Ingrese su ahorro inicial, es decir con cunanto va a comenzar a ahorrar: ")
(cac (read))

;17
(define (numg a)
  (cond

    [(and (>= a 10) (< a 100))
     (display "La suma de ") (display a) (display " es igual a: ")
     (display (+ (remainder a 10) (quotient a 10)))]
    
  )  
)



(display "Con este programa vamos a separar un numero de dos digitos maximo, y efectuar su suma")
(newline)
(display "Inserete el numero: ")
(numg (read))

;16

(define (d2 a b)
  (cond

    
    [(= (remainder b 3) 0)
     (display "Como ") (display b) (display " es multiplo de 3 ") (display b)
     (display " se multiplica y da por resultado: ")
     (display (* a b))]
    
    [(> a b)
     (display "Como ") (display a) (display " es mayor que ") (display b)
     (display " se restan y da por resultado: ")
     (display (- a b))]

    [(= a b)
     (display "Como ") (display a) (display " y ") (display b) (display " son iguales ")
     (display " se suman y da por resultado: ")
     (display (+ a b))]

 )   
)  

(define (d1 a)
  (begin
    (display "Ingrese el segundo dígito: ")
    (d2 a (read))
  )  
)  


(newline)
(newline)
(display "En este programa haremos diferente operaciones de dos numeros, con diferentes condiciónes las cuales son: ")
(newline)
(display "1. Si el primero es mayor que el segundo se restan")
(newline)
(display "2. Si el  ultimo es multiplo de 3 se multiplican")
(newline)
(display "3. Si ambos son iguales se suman")
(newline)
(newline)
(display "Ingrese el primer dígito: ")
(d1 (read))


;15
(define (num a)
  (cond

    [(and (>= a 0) (= (remainder a 2)  0))
     (display "El numero ")
     (display a) (display " es positivo, par")]

     [(>= a 0)
     (display "El numero ")
     (display a) (display " es positivo, impar")]

     [(and (<= a 0) (= (remainder a 2)  0))
     (display "El numero ")
     (display a) (display " es negativo, par")]

     [(<= a 0)
     (display "El numero ")
     (display a) (display " es negativo, impar")]

   )  
)  

(newline)
(newline)
(display "Determinaremos si un numero es positivo o no y si es par o no")
(newline)
(display "Ingrese el numero: ")
(num (read))

;14
(define (p2 a b)
  (newline)
  
  (cond

    [(= a b)
     (display "Los digitos son iguales por lo que ninguno es mayor que el otro")]

    [(< a b)
     (display b)
     (display " es mayor que ")
     (display a)
     (display ", Por lo que no son iguales")]

    [(> a b)
     (display a)
     (display " es mayor que ")
     (display b)
     (display ", Por lo que no son iguales")]
  )   
)  

(newline)
(newline)
(define (p1 a)
 (begin
   (display "Ingrese el segundo numero: ")
   (p2 a (read))
 )  
)  

(display "Con este programa calcularemos lo siguiete: ")
(newline)
(display "1. Vamos a determinar si los numeros son iguales")
(newline)
(display "2. Determinaremos que numero es mayor")
(newline)
(display "Ingrese el primer numero: ")
(p1 (read))

;13
(define (p2 a b)
  (cond

    [(and (>= a 10) (<= a 100) (>= b 50) (<= b 1000))
     (display (+ (+ a a) (expt b 2)))]

    [(and (< a 10) (> a 100) (< b 50) (> b 1000))
     (display (+ a b))]
 
  )
)
    
(define (p1 a)
  (begin
    (display "digite el segundo digito: ")
    (p2 a (read))
   ) 
)

(newline)
(newline)
(display "Este programa realizara una suma de dos digitos, que tiene 2 condiciones")
(newline)
(display "1. Si el primer digito esta entre 10 y 100, se doblara y se sumara")
(newline)
(display "2. si el segundo digito esta entre 50 y 1000, se elvara al cuadrado y se sumara")
(newline)
(display "Digite el primer numero: ")
(p1 (read))



;12
(define (p2 a b)
  (if (< b 0)
      (begin
        (display "El resultado es: ")
        (display (* a b))
       ) 
      (display "El segundo digito no es negativo")
  )    
)

(define (p1 a)
  (begin
    (display "digite el segundo digito ")
    (p2 a (read))
   )
)

(newline)
(newline)
(display "Con este programa multiplicaremos dos numero solo si el segundo digito es negativo")
(newline)
(display "digite el primer digito: ")
(p1 (read))




;11
(define (estrato c e)
  (cond

    [(and (= c 1) (= e 1))
             (display "Tienes un descuento de 20%, por lo que la carrera de licenciatura matematica te costara: ")
             (display (-  1200000 (/ (* 20 1200000) 100)))
             ]

    [(and (= c 1) (= e 2))
             (display "Tienes un descuento de 10%, por lo que la carrera de licenciatura matematica te costara: ")
             (display (-  1200000 (/ (* 10 1200000) 100)))
             ]
    
    [(and (= c 2) (= e 1))
             (display "Tienes un descuento de 20%, por lo que la carrera tecnologia en electronica te costara: ")
             (display (-  1000000 (/ (* 20 1000000) 100)))
             ]

    [(and (= c 2) (= e 2))
             (display "Tienes un descuento de 10%, por lo que la carrera tecnologia en electronica te costara: ")
             (display (-  1000000 (/ (* 10 1000000) 100)))
             ]

    [(and (= c 3) (= e 1))
             (display "Tienes un descuento de 20%, por lo que la carrera tecnologia en sistemas te costara: ")
             (display (-  1300000 (/ (* 20 1300000) 100)))
             ]

    [(and (= c 3) (= e 2))
             (display "Tienes un descuento de 10%, por lo que la carrera tecnologia en sistemas te costara: ")
             (display (-  1300000 (/ (* 10 1300000) 100)))
             ]
        

    [else (display "Ingresaste algun dato incorrecto, vuelve a responder a las preguntas, gracias")]
   ) 
)

(define (carrera c)
  (begin
    (display "Ingrese su estrato: ")
    (estrato c (read))
   ) 
)

(newline)
(newline)
(display "Bienvenido a la universidad UniversidadDeLaCalle")
(newline)
(display "1-Para licenciaturas matematicas, que cuesta 1,200,000")
(newline)
(display "2-Para tecnologia en electronica, que cuesta 1,000,000")
(newline)
(display "3-Para tecnologia en sistemas, que cuesta 1,300,000")
(newline)
(display "Que carrera, quieres cursar?: ")
(carrera (read))



;9
(define (compra c)
  (cond

    [(< c 5)
     (display "Obtuviste un descuento del 10%, felicidades")
     (newline)
     (display "El valor de las computadoras es de:")
     (display (* c 1100000))
     (display " $")
     (newline)
     (display "Pero con un descuento de: ")
     (display (/ (* 10 1100000) 100))
     (display " $")]

    [(and (>= c 5) (< c 10))
     (display "Obtuviste un descuento del 20%, felicidades")
     (newline)
     (display "El valor de las computadoras es de:")
     (display (* c 1100000))
     (display " $")
     (newline)
     (display "Pero con un descuento de: ")
     (display (/ (* 20 1100000) 100))
     (display " $")]

    [(>= c 10)
     (display "Obtuviste un descuento del 40%, felicidades")
     (newline)
     (display "Es decir de: ")
     (display (/ (* 40 1100000) 100))
     (display " $")]
  )  
)

(newline)
(newline)
(display "Compre sus computadoras ahora¡¡¡")
(display "Cada computador cuesta 1100000")
(newline)
(display "Cuantas computadoras va a comprar?: ")
(compra (read))


;8
(define (precio a b)
  (cond

    [(> a b)
     (display "No le conviene adquirir este automovil, asi que compre el terreno o pruebe con otro.")]

    [(< a b)
     (display "Le conviene comprar este automovil.")]
    
  )
)

;Hubiera usado recursividad pero como es solo condicionales.....
(define (terre a b)
  (begin
    (precio (- a (- (- (- a (/ (* a 20) 100)) (/ (* (- a (/ (* a 20) 100)) 20) 100))(/ (* (- (- a (/ (* a 20) 100)) (/ (* (- a (/ (* a 20) 100)) 20) 100)) 20) 100)))
            (/ (- (+ (/ (* (+ (/ (* (+ (/ (* a 20) 100) a) 20) 100) (+ (/ (* a 20) 100) a) ) 20) 100) (+ (/ (* (+ (/ (* a 20) 100) a) 20) 100) (+ (/ (* a 20) 100) a) )) a) 2) )
  )
)

(define (auto a)
  (begin
    (display "Ingrese el valor del terreno: ")
    (terre a (read))
  )
)

(display "Decide si comprar el auto o el terreno, ahora mismo¡¡¡")
(newline)
(display "De la siguiente forma, vamos a ver cuanto de devalua el automovil al cabo de 3 años y cuanto incrementa el del terreno en este tiempo.")
(newline)
(newline)
(display "Favor de que el valor del carro y el terreno sean los mismos, si no es asi igualmente le sirve este medio.")
(newline)
(newline)
(display "Recuerde que se incremente y se desincrementa el 20% por año.")
(newline)
(display "Ingrese el valor de automovil: ")
(auto (read))




;7
(define (men a s)
  (cond

    [(< a 12)
     (display "Tienes una utilidad del 5% del salario¡¡")
     (newline)
     (display "Es decir de: ")
     (display (/ (* 5 s) 100))
     (display " $")]
    
    [(and (>= a 12) (< a 24))
     (display "Tienes una utilidad del 7% del salario¡¡")
     (newline)
     (display "Es decir de: ")
     (display (/ (* 7 s) 100))
     (display " $")]

    [(and (>= a 24) (< a 60))
     (display "Tienes una utilidad del 10% del salario¡¡")
     (newline)
     (display "Es decir de: ")
     (display (/ (* 10 s) 100))
     (display " $")]

    [(and (>= a 60) (< a 120))
     (display "Tienes una utilidad del 15% del salario¡¡")
     (newline)
     (display "Es decir de: ")
     (display (/ (* 15 s) 100))
     (display " $")]

    [(>= a 120)
     (display "Tienes una utilidad del 20% del salario¡¡")
     (newline)
     (display "Es decir de: ")
     (display (/ (* 20 s) 100))
     (display " $")]
    
  )
)

(define (años a)
  (display "Ingrese su salario mensual: ")
  (men a (read))
)

(newline)
(newline)
(newline)
(display "Este programa calcula la utilidad de un empleado de acuerdo a su antiguedad en la empresa")
(newline)
(display "cuantos años llevas en la empresa? Ingreselo en meses: ")
(años (read))



;6
(define (hemo a h)
  (cond

    [(and (> a 1) (<= a 5) (>= h 11.5) (<= h 15))
     (newline)
             (display "No tines anemia :D, felicidades: ")]

    [(and (> a 5) (<= a 10) (>= h 12.6) (<= h 15.5))
     (newline)
             (display "No tines anemia :D, felicidades: ")]

    [(and (> a 10) (<= a 15) (>= h 13.5) (<= h 15.5))
     (newline)
             (display "No tines anemia :D, felicidades: ")]

    [else
     (newline)
     (display "Tienes anemia :c")]
  )
)

(define (años a)
  (begin
    (newline)
    (display "Luego de los estudios de tu sangre, cual es tu nivel de hemoglobina.")
    (newline)
    (display "Ten encuenta que el porcentaje va de 5,0 a 20,0: ")
    (hemo a (read))
    )
  (newline)
    (newline)
)

(newline)
(newline)
(newline)
(display "Tengo anemia?")
(newline)
(newline)
(display "Cuantos años tengo?: ")
(años (read))

  
;5
(define (azar a z)
  (if (< z 74)
  (begin
    (newline)
    (display "Ganaste el 15% de la compra, felicidades¡ ")
    (newline)
    (display "El total a pagar es de: ")
    (- a (/ (* 15 a) 100))
    )
  
  (begin
    (display "Ganaste el 20% de la compra, felicidades¡ ")
    (display "El total a pagar es de: ")
    (- a (/ (* 20 a) 100))
    )
  )
) 

(define (compra a)
  (newline)
  (begin
    (display "Para obtener el descuento ingrese un numero del 1 a el 100: ")
    (azar a (read))
    )
)

(newline)
(newline)
(display "Cuanto va a ser el valor de tu compra?¡¡¡¡")
(newline)
(newline)
(display "Ingrese el valor de su compra: ")
(compra (read))



;4
(define (cos_ n)
 2(if (< n 5)
  (begin
    (display "Cada llanta sale a 30,000 pesos")
    (newline)
    (newline)
    (display "El total de la compra es: ")
    (* n 30000)
    )
  (begin
    (display "Cada llanta sale a 20,000 pesos")
    (newline)
    (newline)
    (display "El total de la compra es: ")
    (* n 20000)
    )
 )
)

 (newline)
 (newline)
(display "En esta funcion puedes calcular cuanto va a ser el costo de la compra de tu llantas: ")
(newline)
(newline)
(display "Cuantas llantas vas a comprar?: ")
(cos_ (read))



;3
(define (num n)
  (if (> n 0)
  (begin
    (display "El valor absoluto es: " )
    n
   )
  (begin
    (display "El valor absoluto es: ")
    (* -1 n)
  )
 )
  (newline)
  (newline)
)

  
(newline)
(newline)
(display "Ingrese el numero, el cual quiere conocer su valor absoluto: ")
(num (read))

;2
(define (vc a b c)
  (newline)
    (if (< (expt b 2) (* 4 a c))
      (display "No tiene solucion c: ")
  )
  
  (if (> (expt b 2) (* 4 a c))
  (begin
    (display "Tiene dos soluciones¡¡ porque: b^2 > 4ac")
  )
)
  (if (= (expt b 2) (* 4 a c))
  (begin
    (display "Tiene una solucion¡¡ porque: b^2 = 4ac" )
  )
 )

  (newline)
  (newline)
  (newline)
)  

(define (vb a b)
  (newline)
  (begin
    (display "Ingrese el valor de c: ")
    (vc a b (read))
   )
)


(define (va a)
  (newline)
  (begin
    (display "Ingrese el valor de b: ")
    (vb a (read))
  )
)  


;llamado
(display "Esta funcion calcula cuantas soluciones tiene la ecucion ax^2+bx+c")
(newline)
(display "Ingrese el valor de a: ")
(va (read))




;------------------------
;1
(define (solu x)
  (newline)
  (if (= x 10)
  (begin
    (display "La solucion para el n 10, de la ecuacion dada es: ")
    (+ (* 4 (expt x 2)) (* 6 x) 2)
   )
  (begin
    (display "La solucion para el n 12 o 14 de la ecuacion dada es erronea :c")
    )
  )
)  
;---------------------------------
;llamado
(display "Esta funcion calcula la solucion de n dado, en esta ecuación, 4n^2+6n+2")
(newline)
(newline)
(display "Escoja entre 10 12 o 14: ")
    (solu (read))

;---------------------------------
