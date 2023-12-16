#lang scribble/manual
 
@(require racket/date)

@(define last-built (date->string (current-date) #true))

@title{Small Rust OS Documentation}

@author[@author+email["Luke Jianu" "jianuluke@gmail.com"]
        @author+email["Andrey Piterkin" "andrey.piterkin@gmail.com"]
        @author+email["Lucas Sta Maria" "lucas@priime.dev"]
        @author+email["Oleg Pavlenko" "oleg.pavlenko@outlook.com"]
        @author+email["James Sweeney" "sweeneyj202@gmail.com"]
        @author+email["Nishil Patel" "nishil.patel13@gmail.com"]]

This site contains documentation for the
@hyperlink["https://github.com/lukejianu/small-rust-os"]{small-rust-os}
project. This project is an attempt to systematically design and
implement a small operating system in the Rust programming language.
We are currently in the very early stages, still deciding
on the scope of the project.

This document is itself written using
@hyperlink["https://docs.racket-lang.org/scribble/index.html"]{Scribble}, a
Racket DSL for writing documentation.
You can see its source at
@hyperlink["https://github.com/lukejianu/small-rust-os/tree/main/docs"]{https://github.com/lukejianu/small-rust-os/tree/main/docs},
starting with the @filepath{index.scrbl} file.

@table-of-contents[]

@; ------------------------------------------------------------------------

@include-section["motivation.scrbl"]
@include-section["a-toy-os.scrbl"]
@include-section["the-components.scrbl"]
@include-section["the-plan.scrbl"]
@include-section["contributor-resources.scrbl"]


@linebreak{}
@smaller["Last built and deployed at " @last-built " PST."]
