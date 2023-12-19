#lang scribble/manual
 
@title{The Plan}

This page will explain the scope of our OS, the ordering of component implementations,
and a schedule organized into milestones.

@section{The Scope}
Our goal is to build an OS that can run on @italic{bare metal}, with a working shell.

The OS itself will be implemented as a monokernel.

Our OS will not be POSIX-compliant. However, the OS will be Unix-like, meaning
that implementing POSIX will not require major modification.

@section{Component Ordering}
The components are to be implemented in the following order...

@section{Milestones}
Each milestone is expected to take roughly a week.

@subsection{Milestone 1}

@itemlist[@item{Finish design and specification.}
          @item{Create a "Hello world" bootable disk image.}
          @item{Setup tests.}]


@subsection{Milestone 2}

@subsection{Milestone 3}

