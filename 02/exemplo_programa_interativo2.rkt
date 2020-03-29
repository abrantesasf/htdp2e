;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exemplo_programa_interativo2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exemplo de Prorama Interativo: 2
;;; Interactive Programs
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com


;; Define algumas constantes para o programa
(define BACKGROUND (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))

;; Define os event handlers:
(define stop
  (lambda (y kbd)
    0))

(define place-dot-at
  (lambda (y)
    (place-image DOT 50 y BACKGROUND)))

;; Define a função MAIN:
(define main
  (lambda (y)
    (big-bang y
      (on-tick sub1)
      (on-key stop)
      (to-draw place-dot-at)
      (stop-when zero?))))

;; Chama a main passando o estado inicial:
(main 90)