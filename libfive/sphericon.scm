;; A sphericon: https://en.wikipedia.org/wiki/Sphericon

(set-bounds! [-100 -100 -100] [100 100 100])
(set-quality! 11)
(set-resolution! 20)

(define (bicone r)
  (union
    (reflect-z (cone-z r r))
    (cone-z r r)))

(define (sphericon r)
  (let* ((bicone (bicone r))
         (half   (half-space [1 0 0])))
    (union
      (difference ; one half of the bicone
        bicone 
        half)
      (rotate-x
        (intersection ; the other half of the bicone
          bicone 
          half)
        (/ pi 2)))))

(sphericon 10)
