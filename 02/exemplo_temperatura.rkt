;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exemplo_temperatura) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exemplo de conversão de temperatura, em batch
;;; Batch Programas
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Bibliotecas
(require 2htdp/batch-io)

;; Converte ºC em ºF
(define c->f
  (lambda (c)
    (+ 32 (* c 9/5))))

;; Converte ºF em ºC
(define f->c
  (lambda (f)
    (* 5/9 (- f 32))))

;; Converter (in/out podem ser arquivos ou 'stdin e 'stdout):
(define converter-temp
  (lambda (in out t)
    (cond
      ((string=? t "cf") (write-file out
                                     (string-append (number->string (c->f (string->number (read-file in))))
                                                    "\n")))
      ((string=? t "fc") (write-file out
                                     (string-append (number->string (f->c (string->number (read-file in))))
                                                    "\n")))
      (#true "Erro no formato da conversão: use 'cf' ou 'fc'"))))