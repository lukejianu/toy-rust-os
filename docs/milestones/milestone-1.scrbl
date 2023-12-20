#lang scribble/manual

@(require "../utils.rkt")

@title{Milestone 1}

@section{Freestanding Binary}

A @italic{binary} refers to a file that does not contain human-readable text. Programmers
typically use the term binary to refer to the files produced as a result of program
compilation—an executable is a common example.

@subsection{C Program to Binary}

@plain-codeblock{
// foo.c
int main() {
        int x = 42;
        x += 1;
        return 0;
}
}

@code{gcc foo.c -mno-red-zone -S}

@plain-codeblock{
main:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $16, %rsp
        movl    $42, -4(%rbp)
        addl    $1, -4(%rbp)
        movl    $0, %eax
        leave
        ret
}

@code{gcc foo.s -o foo}
@code{objdump -d foo}

@margin-note{TODO: Explain simple C binaries in more depth. It contains much more than
just main...}

@plain-codeblock{
0000000000400536 <main>:
  400536:       55                      push   %rbp
  400537:       48 89 e5                mov    %rsp,%rbp
  40053a:       48 83 ec 10             sub    $0x10,%rsp
  40053e:       c7 45 fc 2a 00 00 00    movl   $0x2a,-0x4(%rbp)
  400545:       83 45 fc 01             addl   $0x1,-0x4(%rbp)
  400549:       b8 00 00 00 00          mov    $0x0,%eax
  40054e:       c9                      leaveq 
  40054f:       c3                      retq   
}

An @italic{application binary interface} is...

A @italic{runtime system} is...


@bold{Resources to Write This Section}
@itemlist[@item[@hyperlink["https://en.wikipedia.org/wiki/Runtime_system"]{https://en.wikipedia.org/wiki/Runtime_system}]
          @item[@hyperlink["https://scottc130.medium.com/introduction-to-reverse-engineering-understanding-basic-compiled-code-69975cf2ef82"]{https://scottc130.medium.com/introduction-to-reverse-engineering-understanding-basic-compiled-code-69975cf2ef82}]
          @item[@hyperlink["https://stackoverflow.com/questions/68217885/how-do-call-start-of-a-binary-from-another-executable"]{https://stackoverflow.com/questions/68217885/how-do-call-start-of-a-binary-from-another-executable}]
          @item[@hyperlink["https://en.wikipedia.org/wiki/Crt0"]{https://en.wikipedia.org/wiki/Crt0}]
          @item[@hyperlink["https://www.embecosm.com/appnotes/ean9/html/ch05s02.html"]{https://www.embecosm.com/appnotes/ean9/html/ch05s02.html}]]

@subsection{Aside: The Java Virtual Machine}

@subsection{Bare Metal Rust}

@italic{Bare metal} means...


@section{Hello World Bootable Disk Image}

We have a freestanding binary. Now what? We want to be able to put the binary on a USB,
and then @italic{boot} the OS.

What makes something bootable?

What is the @code{BIOS}?

What is the @code{bootloader} dependency?

What is the @code{bootimage} thingy?

@code{qemu}

@section{Testing}

