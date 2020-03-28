;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise018) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 18
;;; Funções e Variáveis
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Concatena duas strings, com underline entre elas
(define string-join
  (lambda (s1 s2)
    (string-append s1 "_" s2)))

(string-join "Hello" "World")