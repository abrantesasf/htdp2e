;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise037) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 37
;;; Design Sistemático: Receita de Design de Função (RDF)
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Função: string-rest
;; ===================
;; Retorna uma string sem o 1º caractere.
;; String -> String
;;    Inputs: palavra/frase como Strint
;;    Output: palavra/frase, como String, sem o 1º caractere
;; Exemplos funcionais:
;;     in: banana caramelada
;;    out: anana caramelada
;; Requisitos especiais:
;;    nenhum
(define (string-rest s)
  (substring s 1))

;; Testes funcionais:
(string-rest "banana caramelada")