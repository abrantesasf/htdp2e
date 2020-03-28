;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise026) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 26
;;; Avaliação das funções
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Verifique com o Stepper:
(define (string-insert s i)
  (string-append (substring s 0 (- i 1))
                 "_"
                 (substring s (- i 1))))

(string-insert "helloworld" 6)