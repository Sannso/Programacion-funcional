(require (lib "graphics.ss" "graphics"))

(open-graphics)

  (define ventana (open-viewport "laberinto" 1100 782));nombre de la ventana
  ((draw-pixmap ventana) "imagenes/e1.png" (make-posn 0 0))



(define (click)
  (get-mouse-click ventana) 
  (define x (posn-x (query-mouse-posn ventana)))
  (define y (posn-y (query-mouse-posn ventana)))
  (display "x--")
  (display x)
  (newline)
  (display "y--")
  (display y)
  (newline)
  (newline)
  (click)
  )
   
(click)