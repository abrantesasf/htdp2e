;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise020) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 20
;;; Funções e Variáveis
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Recebe uma string s e um número i, apaga o caractere na
;; i-ésima posição da string
(define string-delete
  (lambda (s i)
    (string-append (substring s 0 (- i 1))
                   (substring s i))))

(string-delete "abrantes" 1)
(string-delete "abrantes" 2)
(string-delete "abrantes" 3)
(string-delete "abrantes" 4)
(string-delete "abrantes" 5)
(string-delete "abrantes" 6)
(string-delete "abrantes" 7)
(string-delete "abrantes" 8)