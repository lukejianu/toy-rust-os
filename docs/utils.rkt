#lang racket/base

(require scribble/core scribble/manual)

(provide plain-codeblock)

;; codeblock without syntax highlighting
(define (plain-codeblock . cb)
  (nested #:style 'code-inset
          (apply verbatim cb)))

