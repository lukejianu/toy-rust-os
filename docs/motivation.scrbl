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

"And that is a problem, because code is written for others to understand the
developer's thoughts, and it accidentally runs on computers." —
@hyperlink["https://felleisen.org/matthias/"]{Matthias Felleisen}


@margin-note["This quote comes from Matthias's talk "
@hyperlink["https://felleisen.org/matthias/Presentations/16-west.html"]{Types
are like the Weather, Type Systems are like Weathermen} ". He admits he wasn't
the first to say this, but we can't find the original quote."]


We needed a systems programming language, in which we could express our ideas
clearly. C is too close to assembly. C++ suffers because of its history with C.
We wanted features commonly associated with functional programming
languages—expressive types, pattern matching, default immutability, and macros
(C-style macros don't count). We aren't particularly concerned with performance,
but the fact that Rust mostly provides these features as @italic{zero cost
abstractions} is satisfying. Rust's compiler also emits excellent error
messages, and its design offers arguably better memory-safety, which would be
helpful during the development of an OS. We are happy to wrestle with
@code{rustc}, if it means less issues at runtime.

@subsection{Why Systematic Design?}

The preface of
@link["https://htdp.org/2023-8-14/Book/part_preface.html"]{How to Design Programs}
describes the philosophy behind how we approach our project:

@nested{By “good programming,” we mean an approach to the creation of software
that relies on systematic thought, planning, and understanding from the very
beginning, at every stage, and for every step.}

In our introductory computer science course, we learned the @deftech{design
recipe}: systematic design that started with small functions. In that course,
the essence of it boiled down to the idea that @italic{functions follow their
data}.

@subsubsection{}

Let's give an example by implementing @racket[_length], which takes the length
of a list.

@bold{Step 1}: Data Definitions

We first want to study the @italic{data definition} of a list.

@codeblock|{
;; A [Listof X] is one of:
;; - '()
;; - (cons X [Listof X])
;; and represents a sequence of ordered data.
(struct cons (el lst))
}|

For any @italic{action} we want to perform on a list, there are two different
cases we need to handle. The case where it's an empty list, and the case where
it's a non-empty list (a @racket[cons]).

The design recipe specifies a @deftech{template} that acts as a blueprint for a
function that applies an action on a data structure. For a list, that would look
like the following:

@codeblock|{
(define (list-temp lst)
  (cond [(empty? lst) ...]
        [(cons? lst)  ... (first lst) ... (rest lst) ...]))
}|

Then, when we want to write a function on a list, we can copy this template and
fill in the blanks to perform the action we want.

@margin-note{To dive deeper, you can read @italic{How to Design Programs} or
@link["https://priime.dev/blog/recursion.html"]{Recursion as Structural
Decomposition.}}

@bold{Step 2}: Signature, Purpose Statement, Header

We're writing @racket[_length], which takes in a list and produces a number
representing its length. If we assume @racket[Natural] to represent non-negative
integers, then we can write the signature of @racket[_length] as follows:

@codeblock|{
;; length : [Listof X] -> Natural
}|

We also want to write what the @italic{purpose} of the function is -- why does
it need to exist? What is its use-case?

@codeblock|{
;; Computes the length of the given list.
}|

The purpose statement is concise. Note that this example is somewhat contrived
-- it just reiterates the name of the function. After a copy-paste of the
template and renaming the function, we get this so far:

@codeblock|{
;; length : [Listof X] -> Natural
;; Computes the length of the given list.
(define (length lst)
  (cond [(empty? lst) ...]
        [(cons? lst)  ... (first lst) ... (rest lst) ...]))
}|

We're off to a great start!

@subsubsection{Systematic Design in our OS}

An operating system is considerably larger than a function, consisting of
numerous complex components. As a group, we want to use this as an opportunity
to systematically design and implement a reasonably challenging project, testing
the accumulation of ideas we learned in Northeastern's CS curriculum.
