#lang scribble/manual
 
@title{Small Rust OS Documentation}

This site contains documentation for the
@hyperlink["https://github.com/lukejianu/small-rust-os"]{small-rust-os}
project. This project is an attempt to systematically design and
implement a small operating system in the Rust programming language.
We are currently in the very early stages, still deciding
on the scope of the project.

This project takes inspiration from many sources. 

For one, the idea came from Philipp Oppermann's
@hyperlink["https://os.phil-opp.com/"]{Writing an OS in Rust}
blog series.

We first became interested in operating systems after exploring
@hyperlink["https://pdos.csail.mit.edu/6.828/2012/xv6.html"]{xv6},
which is an OS used as a teaching tool in systems courses.

Our interest in systematic design comes from our experience
in Northeastern University's computer science curriculum.

@include-section["the-idea.scrbl"]
@include-section["the-plan.scrbl"]

