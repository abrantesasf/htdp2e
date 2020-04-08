;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise044) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;;; Exercício 44
;;;; Design Sistemático: Receita de Design de Programa (RDP)
;;;; Abrantes Araújo Silva Filho
;;;; abrantesasf@gmail.com


;;; Programa: carrinho
;;; ==================
;;; Move um carro da esquerda para a direita no canvas do mundo,
;;; em um movimento senoidal.
;;; Estado do mundo:
;;;    Representação: o WorldState é um número
;;;    Interpretação: que corresponde ao número de clock ticks que se passaram
;;;                   desde o início da animação

;; Bibliotecas requeridas:
(require 2htdp/universe)
(require 2htdp/image)

;;; Propriedades Fixas: Físicas

;; Escala (usado para tamanhos relativos dos objetos do mundo):
(define ESCALA 10)

;; Velocidade do carrinho (quantos pixels ele anda a cada clock tick):
(define VELOCIDADE 3)

;; Tamanho do mundo:
(define COMPRIMENTO-DO-MUNDO (* 40 ESCALA))

;; Raio da roda do carro:
(define RAIO-DA-RODA ESCALA)

;; Distância entre as rodas. Deixei como 3 vezes o raio pois
;; achei que ficou bom assim:
(define DISTANCIA-ENTRE-RODAS (* RAIO-DA-RODA 3))


;;; Propriedades Fixas: Gráficas

;; Imagem da canvas da cena. A altura é 1/4 do comprimento (achei bom assim
;; para ilustrar o movimento senoidal) e o fundo é azul com transparência
;; de 70% (30% sólido):
(define BACKGROUND
  (rectangle COMPRIMENTO-DO-MUNDO (/ COMPRIMENTO-DO-MUNDO 4) 30 "blue"))

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

;; Imagem da árvore na cena:
(define ARVORE
  (underlay/xy (circle 10 "solid" "green")
                       9 15
                       (rectangle 2 20 "solid" "brown")))

;; Define a posição X e Y da árvore na cena:
(define POS-X-ARVORE (/ (image-width BACKGROUND) 2))
(define POS-Y-ARVORE
  (- (image-height BACKGROUND) (/ (image-height ARVORE) 2)))

;; Background com a árvore
(define BACKGROUND2
  (place-image ARVORE POS-X-ARVORE POS-Y-ARVORE BACKGROUND))


;;; Render do ESTADO ATUAL (WorldState):

;; Função: render
;; ==============
;; Exibe o carro na cena de acordo com o estado atual do mundo
;; WorldState -> Image
;;     Input: um número que representa o WorldState atual
;;    Output: uma imagem que representa a posição do carro no WS atual
;; Exemplos funcionais:
;;     in: 45
;;    out: imagem com o carrinho 45 pixels à direita da borda esquerda da cena
;;         e com altura calculada coforme a função seno.
;; Testes funcionais (testes unitários):
(check-expect (render 45)
              (place-image CARRO (pos-x-carro 45) (pos-y-carro 45) BACKGROUND2))
(check-expect (render 0)
              (place-image CARRO (pos-x-carro 0) (pos-y-carro 0) BACKGROUND2))
(check-expect (render 100)
              (place-image CARRO (pos-x-carro 100) (pos-y-carro 100) BACKGROUND2))
;; Requisitos especiais:
;;    pos-x-carro: função que calcula a posição x do carro com o WS
(define (pos-x-carro ws)
  (- ws (/ (image-width CARRO) 2)))
;;    pos-y-carro: função que calcula a posição y do carro com o WS
(define (pos-y-carro ws)
  (- (/ (image-height BACKGROUND2) 2)
     (* (- (/ (image-height BACKGROUND2) 2) (/ (image-height CARRO) 2))
        (sin (/ (* ws pi)
                180)))))
;;    render:
(define (render ws)
  (place-image CARRO (pos-x-carro ws) (pos-y-carro ws) BACKGROUND2))


;;; Event Handlers

;; Função: tock:
;; =============
;; A cada clock tick, soma 1 ao WS.
;; WorldState -> WorldState
;;    Inputs: um número que representa um WorldState
;;    Output: um número que representa a variável "x" em um eixo de coodenadas
;;            retangulares (indicará a POS-X do CARRO)
;; Exemplos Funcionais:
;;     in: 34
;;    out: 37
;; Testes funcionais (testes unitários):
(check-expect (tock 34) (+ 34 VELOCIDADE))
(check-expect (tock 0) (+ 0 VELOCIDADE))
(check-expect (tock -100) (+ -100 VELOCIDADE))
;; Requisitos especiais:
;;    2htdp/universe library (para a função big-bang)
(define (tock ws)
  (+ ws VELOCIDADE))

;; Função: zerar
;; =============
;; Coloca o carrinho novamente no início da cena
;; WorldState Key -> WorldState
;;     Inputs: o WorldState atual (número) e um keystroke
;;    Outputs: o WorldState 0 (número)
;; Exemplos funcionais:
;;     in: 34 "a"
;;    out: 0
;; Testes funcionais (testes unitários):
(check-expect (zerar 34 "a") 0)
(check-expect (zerar 0 "b") 0)
(check-expect (zerar 500 "q") 0)
;; Requisitos especiais:
(define (zerar ws key)
  0)

;; Função: hyper
;; =============
;; Coloca o carro na coordenada-x da posição do mouse, ao clicar
;; a botão "button-down". Outros eventos do mouse não alteram WS.
;; WorldState Number Number String -> WorldState
;;     Inputs: WS atual, coordenadas x e y do mouse, string event
;;    Outputs: WS na coordenada-x do mouse
;; Exemplos funcionais:
;;     in: 0 40 50 "button-down"
;;    out: 40
;;     in: 30 50 45 "move"
;;    out: 30
;; Testes funcionais:
(check-expect (hyper 0 40 50 "button-down") 40)
(check-expect (hyper 30 50 45 "move") 30)
;; Requisitos especiais:
;; Definição da função:
(define (hyper ws x-mouse y-mouse evento)
  (cond
    ((string=? "button-down" evento) x-mouse)
    (else ws)))

;; Função: stop
;; ============
;; Termina a execução do big-bang quando o carrinho sai da cena
;; WorldState -> Boolean
;;     Inputs: um número que representa o WorldState atual
;;    Outputs: um boolean que indica se o carrinho já saiu da cena
;; Exemplos funcionais (consideranco cena com 200 pixels):
;;     in: 40
;;    out: #false
;;     in: 250
;;    out: #true
;; Testes funcionais (testes unitários):
(check-expect (stop 30) #false)
(check-expect (stop 399) #false)
(check-expect (stop 400) #false)
(check-expect (stop (+ 800 VELOCIDADE)) #true)
;; Requisitos especiais:
(define (stop ws)
  (if (>= ws (+ (image-width BACKGROUND) VELOCIDADE)) #true #false))

;;; Função MAIN

;; Função: carrinho
;; Inicializa o programa do carrinho com uma expressão big-bang
;; WorldState -> big-bang
;;     Input: um número que representa o WorldState inicial
;;    Output: uma expressão big-bang que inicializa o mundo
;; Exemplos funcionais:
;;     in: 
;;    out:
;; Testes funcionais (testes unitários):
;; Requisitos especiais:
;;    2htdp/universe library (para a função big-bang)
(define (carrinho ws)
  (big-bang ws
    (on-tick tock)
    (on-key zerar)
    (on-mouse hyper)
    (to-draw render)
    (stop-when stop)))