;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise040) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;;; Exercício 40
;;;; Design Sistemático: Receita de Design de Programa (RDP)
;;;; Abrantes Araújo Silva Filho
;;;; abrantesasf@gmail.com

(require 2htdp/universe)
(require 2htdp/image)

;;; Programa: carrinho
;;; ==================
;;; Move um carro da esquerda para a direita no canvas do mundo,
;;; 3 pixels a cada clock tick.
;;; Estado do mundo:
;;;    Representação: o WorldState é um número
;;;    Interpretação: quantidade de pixels a partir da borda esquerda

;;; Propriedades Fixas: Físicas
;; Escala (usado para tamanhos relativos dos objetos do mundo):
(define ESCALA 10)
;; Tamanho do mundo:
(define COMPRIMENTO-DO-MUNDO (* 40 ESCALA))
;; Raio da roda do carro:
(define RAIO-DA-RODA ESCALA)
;; Distância entre as rodas. Deixei como 3 vezes o raio pois
;; achei que ficou bom assim:
(define DISTANCIA-ENTRE-RODAS (* RAIO-DA-RODA 3))

;;; Propriedades Fixas: Gráficas
;; Imagem da canvas da cena. A altura é 1/8 do comprimento (achei bom assim),
;; e o fundo é azul com transparência de 70% (30% sólido):
(define BACKGROUND
  (rectangle COMPRIMENTO-DO-MUNDO (/ COMPRIMENTO-DO-MUNDO 8) 30 "blue"))
;; Imagem da roda
(define RODA
  (circle RAIO-DA-RODA "solid" "black"))
;; Imagem do espaço entre as rodas (0% sólido e branco):
(define ESPACO
  (rectangle DISTANCIA-ENTRE-RODAS RAIO-DA-RODA 0 "white"))
;; Imagem de ambas as rodas com o espaço no meio:
(define DUAS-RODAS
  (beside RODA ESPACO RODA))
;; Imagem da base do carro. É 20% mais comprido do que as duas rodas, e tem
;; a mesma altura que uma roda:
(define BASE-CARRO
  (rectangle (* 1.2 (image-width DUAS-RODAS)) (image-height RODA) "solid" "red"))
;; Imagem do teto do carro. É do comprimento do espaço entre as rodas mais metade
;; do comprimento da roda, e a altura é de metade da altura da roda:
(define TETO-CARRO
  (rectangle (+ (image-width ESPACO)
                (/ (image-width RODA) 2))
             (/ (image-height RODA) 2)
             "solid" "red"))
;; Imagem do carro
(define CARRO
  (above TETO-CARRO
         (overlay/offset DUAS-RODAS 0 (/ (image-height BASE-CARRO) -2) BASE-CARRO)))
;; A posição Y do carro na imagem é sempre junto à base da cena:
(define POS-Y-CARRO
  (- (image-height BACKGROUND) (/ (image-height CARRO) 2)))


;;; Event Handlers

;; Função: tock:
;; =============
;; Move o carro 3 pixels para a direita a cada clock tick
;; WorldState -> WorldState
;;    Inputs: um número que representa um WorldState
;;    Output: o WorldState (número) deslocado 3 pixels para a direita
;; Exemplos Funcionais:
;;     in: 34
;;    out: 37
;; Testes funcionais (testes unitários):
(check-expect (tock 34) 37)
(check-expect (tock 0) 3)
(check-expect (tock -100) -97)
;; Requisitos especiais:
;;    2htdp/universe library (para a função big-bang)
(define (tock ws)
  (+ ws 3))