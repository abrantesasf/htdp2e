;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise011) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 11
;;; Funções e Variáveis
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Função que recebe um par coordenado (x, y) que representa um ponto,
;; e um segundo par ordenado (x0, y0) que representa o ponto de origem.
;; Calcula a distância entre esses dois pontos.
(define distancia
  (lambda (x y x0 y0)
    (sqrt (+ (expt (- x x0) 2)
             (expt (- y y0) 2)))))

(distancia 3 4 0 0)