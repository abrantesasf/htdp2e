;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise014) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 14
;;; Funções e Variáveis
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Função que retorna o último caracter de uma string não nula
(define string-last
  (lambda (s)
    (substring s (- (string-length s) 1))))
(string-last "abrantes")