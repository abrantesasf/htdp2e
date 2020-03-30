;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise035) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 35
;;; Design Sistemático: Receita de Design de Função (RDF)
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com


;; Função: string-last
;; ===================
;; Retorna o último caractere de uma string.
;;
;; String -> 1String
;;    Inputs: uma palavra/frase como STRING
;;    Output: o último caractere da palavra/frase como STRING
;;
;; Exemplos funcionais:
;;     in: casa de praia
;;    out: a
(define (last-string s)
  (substring s (- (string-length s) 1)))

;; Testes funcionais:
(last-string "casa de praia")