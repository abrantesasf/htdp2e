;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise038) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 38
;;; Design Sistemático: Receita de Design de Função (RDF)
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Função: string-remove-last
;; ==========================
;; Recebe uma string e retorna a mesma string, sem o último caractere.
;; String -> String
;;    Inputs: uma palavra/frase, como String
;;    Output: uma palavra/frase, como String, sem o último caractere
;; Exemplos funcionais:
;;     in: banana
;;    out: banan
;; Requisitos especiais:
;;    nenhum
(define (string-remove-last s)
  (substring s 0 (- (string-length s) 1)))

;; Testes funcionais:
(string-remove-last "banana")