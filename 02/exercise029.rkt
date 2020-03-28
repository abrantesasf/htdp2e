;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise029) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 29
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
(define custo-fixo-sessao 0)
(define custo-por-espectador 1.5)

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

;; Definição do livro para comparação
(define (profit price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 0
        (* 1.5
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

;; Lucro para diversos preços inteiros:
(lucro 1)
(profit 1)
(lucro 2)
(profit 2)
(lucro 3)
(profit 3)
(lucro 4)
(profit 4)
(lucro 5)
(profit 5)