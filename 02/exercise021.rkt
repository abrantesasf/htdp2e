;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise021) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 21
;;; Avaliação das funções
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Multiplica o argumento por 10
(define ff
  (lambda (x)
    (* x 10)))

;; Avaliação com o stepper:
(ff (ff 1))

(+ (ff 1)
   (ff (ff 1)))