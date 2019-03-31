
; Operaciones matematicas
(define (divisiones a b c)
  (/ (+  (/ a b) (/ b c)) (- (/ a b) (/ b c)))
  )

(define (multitarea a b c d)
  (+ a (/ (+ a (/ (+ a b) (+ c d))) (+ a (/ a b))))
  )

(define (remultitarea a b c d)
  (+ (+ (+ a b) (/ c d)) (/ (/ a (- b c)) (/ a (+ b c)))) 
  )

(define (multiplicacion a b c d)
  (/ (+ (+ a b) (/ c (* d a)))(* (+ a b) (/ c d)))
  )


;Manejo de identificadores

(define peso 50)

(* 5 peso)

;taller funciones

;1
(define n 5)
(define expresion(+ (expt n 2) n 24))
expresion

;2
(define n 5)
(define operacion (* (expt n 3) 55 (- (/ 1 3)))
  )
operacion

;3
(define pi_ 3.14159)
(define radio 10)
(define circunferencia (* 2 pi_ radio)
  )
circunferencia


;4
(define elevar (* 5 5))

(+ 5 elevar)

;5
(define elpi 3.14159)
(define radio 12)
(define circulo(* elpi (expt radio 2))
  )
circulo

;6
(define area_exte 5)
(define area_inte 2)
(define p_i_ 3.14159)
(define area_anillo (* p_i_ (- 5 2))
 )

;7
(define celc 5)
(define faren 32)
(define fahrenheit (+ (/ (* 9 celc) 5) faren)
  )
fahrenheit

;8
(define celcius (/ (* (- fahrenheit 32) 5) 9)
  )
celcius

;9
(define baseM 10.0)
(define basem 5.0)
(define altura 7.0)

(define area_trapecio(* altura (/ (+ baseM basem) 2))
  )
area_trapecio

;10
;10.1 lado del trapecio
(define a 2.5)
(define elviejopita (sqrt (+ (expt a 2)(expt altura 2)))
  )
elviejopita

;10.2
(define perimetro (+ (* 2 elviejopita) baseM basem)
  )
perimetro

;11
(define radio 20)
(define volumen (* (* (/ 4 3) elpi) (expt radio 3))
  )
volumen

;12
(define area 5)
(define altura 9)
(define volumen (/ (* (expt area 2) 9) 3)
  )
volumen
;como es un volumen se expresa con cm^3


;13

;14(volumen) y 15(area)
(define diametro 2)
(define altura 4)
(define radio (/ diametro 2))
(define area (* elpi (expt radio 2))
  )
(define volumen (* area altura)
  )
volumen


;16 pulgadas a centimetros
(define pulgadas 190080)
(define centimetros (* pulgadas 2.5399999)
  )
centimetros

;16.5 centimetros a pulgadas
(define centim 482803.180)
(define pulgadas (/ centim 2.5399999)
  )
pulgadas


;17 Se toma las pulgadas dadas en los ejercicios anteriores
(define pies 15840)
(define pulgadas (* pies 12)
  )
pulgadas

;18
(define yarda 5280)
(define pies (* yarda 3)
  )
pies


;19
(define millas 3)
(define yardas (* millas 1760)
  )
yardas


;20
(define centimetros (* (* (* (* millas 1760) 3) 12) 2.5399999)
  )
centimetros


;21
(define b1 1000)
(define b2 2000)
(define b5 5000)
(define b10 10000)
(define b20 20000)
(define b50 50000)
(define Cantidadb (+ (* b1 6) (* b2 5) (* b5 4) (* b10 3) (* b20 2) (* b50 1))
  )
Cantidadb

;22

(define a 2)
(define b 3)
(define c 4)
(define solucion (/ (+ (expt b 2) (sqrt (* 4 a c)) ) (* 2 a) )
  )
solucion


;23
(define c1 5)
(define c2 4) 
(define triangul_o (sqrt (+ (expt c1 2) (expt c2 2) ))
  )
triangul_o

;24
(define radio_ 2)
(define pi_esfe 3.14159)
(define volumen_esfera (* (* (/ 4 3) (expt radio_ 3)) pi_esfe)
  )
volumen_esfera

;25
(define volumen_esfera_menor (/ (* (expt radio_ 3) pi (sqrt 3)) 2)
  )
volumen_esfera_menor


;26
(define lanzamientos 5)
(define probabilidad (* (/ 5 6) 100)
  )
probabilidad

;27
(define probabilidad 2)
(define proba (* (/ 1 (expt 6 2) ) 100)
  )
proba

