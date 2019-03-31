
;----------------------------------------------------------------
(define (esc p e)
  (if (= e 1)
  (begin
    (display "Su peso en marte es: ")
    (/ (* p 3.7) 9.8)
   )
  (begin
    (display "Su peso en jupiter es: ")
   (/ (* p 3.7) 24.8)
   ) 
  )
)
;---------------------------------------------------------------
(define (peso p)
  (begin
    (display "Si va a escojer marte escriba 1, si no escriba cualquier otra cosa")
    (display "escoja un planeta, entre marte y jupiter: ")
    (esc p (read))
  )
)

;llamado
(display "Este programa calcula tu peso en otro planeta")
(newline)
(display "Ingrese su peso: ")
(peso (read))