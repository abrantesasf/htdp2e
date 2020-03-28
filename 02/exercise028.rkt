;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise028) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 28
;;; Composição de funções
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com

;; Número médio de espectadores
(define media-de-espectadores 120)

;; Preço médio do ingresso:
(define preco-medio-ingresso 5)

;; A cada 0.10 centavos de variação, 15 espectadores a mais ou a menos:
(define bloco-variacao-preco 0.1)
(define bloco-variacao-espectadores 15)

;; Custo da sessão:
(define custo-fixo-sessao 180)
(define custo-por-espectador 0.04)

;; Calcula o número médio de espectadores baseados preço cobrado:
(define espectadores
  (lambda (preco-cobrado)
    (- media-de-espectadores
       (* (/ (- preco-cobrado preco-medio-ingresso)
             bloco-variacao-preco)
          bloco-variacao-espectadores))))

;; Calcula a renda esperada baseada no preço cobrado:
(define renda
  (lambda (preco-cobrado)
    (* preco-cobrado (espectadores preco-cobrado))))

;; Calcula o custo da sessão baseado no preço cobrado:
(define custo
  (lambda (preco-cobrado)
    (+ custo-fixo-sessao
       (* custo-por-espectador (espectadores preco-cobrado)))))

;; Calcula o lucro esperado da sessão baseado no preço cobrado:
(define lucro
  (lambda (preco-cobrado)
    (- (renda preco-cobrado)
       (custo preco-cobrado))))

;; Lucro para diversos preços inteiros:
(lucro 1)
(lucro 2)
(lucro 3)
(lucro 4)
(lucro 5)

;; Lucro em décimos:
(define lucros
  (lambda (preco-cobrado)
    (cond
      [(> preco-cobrado preco-medio-ingresso) (quote ())]
      [#true (cons (lucro preco-cobrado) (lucros (+ preco-cobrado bloco-variacao-preco)))])))

;; Lucros para décimos:
(lucros 1)