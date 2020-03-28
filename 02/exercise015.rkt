;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise015) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 15
;;; Funções e Variáveis
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Ensolarado ou sexta?
;; Retorna #true se:
;;    - sunny for #false
;;            OR
;;    - friday for #true
(define ==>
  (lambda (sunny friday)
    (or friday
        (not sunny))))

;; Testes
;; Friday = #true, então tem que retornar TRUE independende de sunny:
(==> #true #true)
(==> #false #true)

;; Friday = #false, então retorna TRUE apenas se sunny for false:
(==> #true #false)
(==> #false #false)