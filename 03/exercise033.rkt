;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise033) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;;; Exercício 33
;;; Bug do ano 2000
;;; Abrantes Araújo Silva Filho
;;; abrantesasf@gmail.com


; Foi um problema que ocorreu devido ao formato de representação
; do ano, com apenas 2 dígitos, por exemplo: 31/12/99. O bug ocorria
; em programas que, na virada do ano 2000, passavam a interpretar a
; data 01/01/00 como o ano 1900, e não como o ano 2000.
;
; Isso ilustra a necessidade de que um programa seja sistematicamente
; desenhado e bem escrito, pois outras pessoas (incluindo uma versão
; mais velha de você mesmo) poderá ter que corrigir um problema dias,
; meses ou até mesmo anos depois do programa estar pronto.