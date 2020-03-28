;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise019) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 19
;;; Funções e Variáveis
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Recebe uma string s e um número i, e insere um underline na
;; i-ésima posição da string
(define string-insert
  (lambda (s i)
    (string-append (substring s 0 (- i 1))
                   "_"
                   (substring s (- i 1)))))

(string-insert "abrantes" 1)
(string-insert "abrantes" 2)
(string-insert "abrantes" 3)
(string-insert "abrantes" 4)
(string-insert "abrantes" 5)
(string-insert "abrantes" 6)
(string-insert "abrantes" 7)
(string-insert "abrantes" 8)