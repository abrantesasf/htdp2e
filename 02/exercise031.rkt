;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise031) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 31
;;; Batch Programas
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Bibliotecas
(require 2htdp/batch-io)

;; Define a carta:
(define carta
  (lambda (nome sobrenome assinatura)
    (string-append (abertura nome)
                   "\n\n"
                   (corpo nome sobrenome)
                   "\n\n"
                   (encerramento assinatura))))

;; Define a abertura:
(define abertura
  (lambda (nome)
    (string-append "Dear " nome ",")))

;; Define o corpo:
(define corpo
  (lambda (nome sobrenome)
    (string-append "We have discovered that all people with the" "\n"
                   "last name " sobrenome " have won our lottery. So, " "\n"
                   nome ", hurry and pick up your prize.")))

;; Define o encerramento
(define encerramento
  (lambda (assinatura)
    (string-append "Sincerely,"
                   "\n\n"
                   assinatura
                   "\n")))

;; Define carta em "batch"
(define gera-carta
  (lambda (in-nome in-sobrenome in-assinatura out)
    (write-file out (carta (read-file in-nome)
                           (read-file in-sobrenome)
                           (read-file in-assinatura)))))

;; Gera a carta e grava no arquivo carta.txt
(gera-carta "nome.txt" "sobrenome.txt" "assinatura.txt" "carta.txt")