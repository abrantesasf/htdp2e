;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise034) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 34
;;; Design Sistemático: Receita de Design de Função (RDF)
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com


;; Função: string-first
;; ====================
;; Retorna o 1º caractere de uma palavra/frase.
;;
;; String -> 1String
;;    Inputs: uma palavra/frase, como STRING
;;    Output: a primeira letra da palvra/frase, como STRING
;;
;; Exemplos funcionais:
;;     in: casa de praia
;;    out: c
(define (string-first s)
  (substring s 0 1))

;; Teste funcional:
(string-first "casa de praia")