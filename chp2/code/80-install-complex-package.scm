;;; 80-install-complex-package.scm

(load "p123-put-and-get.scm")
(load "p119-tag.scm")

(define (install-complex-package)

    ;;; imported procedures from rectangular and polar packages
    (define (make-from-real-imag x y)
        ((get 'make-from-real-imag 'rectangular) x y))

    (define (make-from-mag-ang r a)
        ((get 'make-from-mag-ang 'polar) r a))

    ;;; interface to rest of the system
    (define (tag z)
        (attach-tag 'complex z))

    (put 'make-from-real-imag 'complex
        (lambda (x y)
            (tag (make-from-real-imag x y))))

    (put 'make-from-mag-ang 'complex
        (lambda (r a)
            (tag (make-from-mag-ang r a))))
    
    ;; 补充完整缺少的选择函数（练习 2.77）
    (put 'real-part '(complex) real-part)

    (put 'imag-part '(complex) imag-part)

    (put 'magnitude '(complex) magnitude)

    (put 'angle '(complex) angle)

    ;;; 新增
    (put '=zero? '(complex)
        (lambda (c)
            (and (= 0 (real-part c))
                 (= 0 (imag-part c)))))

'done)

(define (make-complex-from-real-imag x y)
    ((get 'make-from-real-imag 'complex) x y))

(define (make-complex-from-mag-ang r a)
    ((get 'make-from-mag-ang 'complex) r a))
