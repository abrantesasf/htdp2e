;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise005) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 5
;;; Criação de imagens
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Carrega biblioteca para imagens
(require 2htdp/image)

;; Escala da figura
(define ESCALA 2)

;; Define as dimensões do retângulo que representa o tronco da árvore:
(define BASE (* 20 ESCALA))
(define ALTURA (* 50 ESCALA))

;; Define o raio do círculo que representa a copa da árvore (a copa terá um
;; raio 30% maior do que o tronco):
(define RAIO (* BASE 1.3))

;; Cria o tronco:
(define TRONCO (rectangle BASE ALTURA "solid" "brown"))

;; Cria a copa:
(define COPA (circle RAIO "solid" "green"))

;; Combina as figuras da copa e do tronco (copa sobre o tronco):
(overlay/xy COPA
            (- (/ (image-width COPA) 2) (/ (image-width TRONCO) 2)) ; posição X do tronco
            (- (image-height COPA) (* 0.1 (image-height COPA)))     ; posição Y do tronco (10% dentro da copa)
            TRONCO)
