#lang scribble/manual

@(require "../utils.rkt")

@title{Milestone 1}

@section{Freestanding Binary}

@plain-codeblock{
// TODO: This is a sample C program.
}

Operating systems come with C compilers and a C implementation.
The compiler compiles C into assembly for the specific operating system architecture.
From there, the assembly in translated into machine code.

@code{gcc foo.c -S}

@code{gcc foo.c -mno-red-zone -S}

@code{objdump -d ...}

Talk about the binaries vs. JVM model.

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

