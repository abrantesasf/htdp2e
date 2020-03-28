;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise002) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 1
;;; Calcular a distância de um ponto à origem
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com


;; Define onde está a origem:
(define x0 0)
(define y0 0)


;; Define onde está o ponto:
(define x 3)
(define y 4)


;; Calcula a distância do ponto à origem:
(sqrt (+ (sqr (- x x0))
         (sqr (- y y0))))