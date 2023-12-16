#lang scribble/manual
 
@title{Motivation}

First and foremost, the idea came from Philipp Oppermann's
@hyperlink["https://os.phil-opp.com/"]{Writing an OS in Rust}
blog series.

@section{Why?}

@subsection{Why Operating Systems?}
We first became interested in operating systems after exploring
@hyperlink["https://pdos.csail.mit.edu/6.828/2012/xv6.html"]{xv6},
which is an OS used as a teaching tool in systems courses.

@subsection{Why Rust?}
We chose Rust because...

@itemlist[@item{Zero-cost abstractions— Operating systems are complex and demand performance.
                Zero-cost abstractions allow developers to write high-lvel, readable,
                and maintainable code without compromising on performance. Being able to write 
                abstract code allows developers to code without the introduction of unnecessary
                overhead and errors that can arise from low level programming.}
          @item{Memory safety—...}
          @item{Borrow checker—...}
          @item{Immutable by default—...}
          @item{Type safety—...}]


@subsection{Why Systematic Design?}

Systematic design is ...

We're interested in designing systematically because ...

