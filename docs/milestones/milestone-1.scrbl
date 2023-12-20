#lang scribble/manual

@(require "../utils.rkt")

@title{Milestone 1}

@section{Freestanding Binary}

@subsection{Binaries}

A @italic{binary} is a file that does not contain human-readable text. IE: Interpreting
the file contents as ASCII or UTF-8 yields un-printable characters.

@plain-codeblock|{
v=5�'�p���޸���?Te|��Ľo��yMMޭ��Xo��f����k�OX�|�|z�ڽ�H�
}|

Programmers typically use the term binary to refer to the files produced as a result of
program compilation—an executable is a common example.

@subsection{C Program to Binary}

@filepath{foo.c} contains a basic C program.

@plain-codeblock{
// foo.c
int main() {
        int x = 42;
        x += 1;
        return 0;
}
}

@margin-note["The "@code{-mno-red-zone} " flag disables the " @hyperlink["https://en.wikipedia.org/wiki/Red_zone_(computing)"]{red zone} " optimization in " @code{gcc}"."]

We can compile the program to assembly code: @code{gcc foo.c -mno-red-zone -S}.

@code{gcc} compiled @filepath{foo.c} into assembly specifically for a @italic{platform}.
In this case, x86-64 Linux.

@plain-codeblock{
# foo.s
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

Finally, we can @italic{assemble} (and link) @filepath{foo.s}:
@code{gcc foo.s -o foo} into a binary.
At this point, we have an executable—something we can run on our machine.

We use the @code{objdump} program on Linux to try to understand the contents
of the binary.

@code{objdump -d foo} will dissassemble the @filepath{foo} binary.

@plain-codeblock|{
0000000000400450 <_start>:                                             
  ...
  400463:       49 c7 c0 c0 05 40 00    mov    $0x4005c0,%r8           
  40046a:       48 c7 c1 50 05 40 00    mov    $0x400550,%rcx          
  400471:       48 c7 c7 36 05 40 00    mov    $0x400536,%rdi          
  400478:       ff 15 6a 0b 20 00       callq  *0x200b6a(%rip) # <__libc_start_main@GLIBC_2.2.5>
  ...

0000000000400536 <main>:
  400536:       55                      push   %rbp
  400537:       48 89 e5                mov    %rsp,%rbp
  40053a:       48 83 ec 10             sub    $0x10,%rsp
  40053e:       c7 45 fc 2a 00 00 00    movl   $0x2a,-0x4(%rbp)
  400545:       83 45 fc 01             addl   $0x1,-0x4(%rbp)
  400549:       b8 00 00 00 00          mov    $0x0,%eax
  40054e:       c9                      leaveq 
  40054f:       c3                      retq   
}|

Notice that @code{main} is not the only function! We also see the @code{_start}
function, that calls the @code{__lib_c_start_main} function, with the address of
@code{main} as its first argument (@code{%rdi}).

The @code{_start} function represents the @italic{C runtime}. Typically, a runtime
is an environment where code is executed, can provide features such as garbage
collection. For C, the runtime is minimal (and optional) and only performs simple
initialization—passing command-line arguments into the @code{main} function is
one example.

@subsection{Bare Metal Rust}

@italic{Bare metal} refers to execution of programs directly on computer hardware.

Our OS should also not make system calls, since that would mean our OS
runs on an OS, and not on the hardware directly.

Since, our OS doesn't link with the Rust standard library, we can't use the Rust
runtime. Instead, we simply implement our own @code{_start} function.

@subsection{Aside: The Java Virtual Machine}

Many programmers say that C doesn't really have a runtime, since
the runtime is a few minimal initialization steps. A common saying is that C's runtime
is the OS itself. However, note that C can run without a runtime, and it often does! Most
operating systems are written in C (bare metal).

A more classic example of a serious runtime system is the @italic{Java Virtual Machine} (JVM). Java code can only run on the JVM. The JVM provides automatic memory management
in the form of garbage collection.

Runtime System <- Java runs here.

Operating System <- "Standard C" runs here.

Hardware <- "Freestanding C" runs here.

We want our OS to run directly on the hardware, without any dependencies on a runtime
system or an OS.

@section{Hello World Bootable Disk Image}

We have a freestanding binary. Now what? We want to be able to put the binary on a USB,
and then @italic{boot} the OS.

What makes something bootable?

What is the @code{BIOS}?

What is the @code{bootloader} dependency?

What is the @code{bootimage} thingy?

@section{Testing}

@subsection{Booting}

@code{qemu}

@subsection{Unit Tests}

We write unit tests by...


