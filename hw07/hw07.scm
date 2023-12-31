(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cddr s))
)


(define (sign num)
  'YOUR-CODE-HERE
  (cond ((< num 0) -1) ((= num 0) 0) ((> num 0) 1))
)


(define (square x) (* x x))

(define (pow x y)
  'YOUR-CODE-HERE
  (cond ((= y 1) x) ((odd? y) (* x (square (pow x (/ (- y 1) 2))))) ((even? y) (square (pow x (/ y 2)))))
)


(define (unique s)
  'YOUR-CODE-HERE
  (define (member e s) (if (null? s) #f (if (equal? (car s) e) #t (or #f (member e (cdr s)) ))))
  (define (helper seen s)
    (cond
      ((null? s) '())         
      ((member (car s) seen)     
       (helper seen (cdr s)))      
      (else
       (cons (car s)            
             (helper (cons (car s) seen)
                     (cdr s))))))

  (helper '() s)
)


(define (replicate x n)
    (define (helper x n result) (if (= n 0) result (helper x (- n 1) (cons x result))))
    (helper x n '())

)


(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (define (helper combiner n term result)
      (if (= n 0) result (helper combiner (- n 1) term (combiner result (term n)))))
  (helper combiner n term start)
)


(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
    (define (helper combiner n term result)
      (if (= n 0) result (helper combiner (- n 1) term (combiner result (term n)))))
  (helper combiner n term start)
)


(define-macro (list-of map-expr for var in lst if filter-expr)
  'YOUR-CODE-HERE
  `(let ((result '()))
     (for-each
      (lambda (,var)
        (if ,filter-expr
            (set! result (append result (list ,map-expr))))) 
      ,lst)
     result)
)

