;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exemplo_programa_interativo) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exemplo de Prorama Interativo
;;; Interactive Programs
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com


;; Função para pegar um número e desenhar um quadrado
(define numero->quadrado
  (lambda (n)
    (square n "solid" "red")))

;; Chamada ao big-bang
(big-bang 100
  [to-draw numero->quadrado])

;; Outra chamada
(big-bang 100
  [to-draw numero->quadrado]
  [on-tick sub1]
  [stop-when zero?])

;; Definindo um mecanismo para o reset:
(define (recomecar s kbd)
  100)

;; Outra chamada acrescentado o reset
(big-bang 100
  [to-draw numero->quadrado]
  [on-tick sub1]
  [stop-when zero?]
  [on-key recomecar])