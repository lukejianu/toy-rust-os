#lang scribble/manual

@(require "utils.rkt") 

@title{A Toy Operating System}

@section{What is an OS?}
@margin-note[@image[#:scale 0.3 "img/OS_Layers.svg.png"]]

An OS is the software that acts as an intermediate layer between computer hardware and
user programs. The OS's job is to provide common services to users, such as running
programs and reading/writing to files.

Most computers "run" operating systems because they are an essential abstraction over
the computer hardware. Computer users (mostly) shouldn't have to think about the
physical device when reading from a file, for example.

@subsection{OS as an API}

An OS is an interface. The functions in the OS's interface are known as
@italic{system calls}. At the lowest level, system calls are invoked
by executing special instructions. At a higher level, operating systems ship with a C
implementation, which provide a more user-friendly API for system calls.

@subsubsection{System Calls}

Below is an example of an x86-64 program that prints @code{Hello, world!} on
the standard output stream. The program invokes the @code{write} Linux system call.

@codeblock[#:line-numbers 0]{
.global main

.text
main:
        mov $1, %rax
        mov $1, %rdi
        lea message(%rip), %rsi
        mov $14, %rdx
        syscall

.data
message:
        .asciz "Hello, world!\n"
}

On line 8, the @code{syscall} instruction is executed. The CPU then switches
to kernel mode and begins executing a kernel function.

Lines 4-7 set up the system call, specifying which system call should be executed and
passing the arguments. The @code{syscall} instruction expects the @code{%rax} to contain
a @italic{system call number}. The @code{write} system call has the system call number
@code{1}. Since @code{write} is invoked, the @code{syscall} instruction expects
the file descriptor to write to, a pointer to the buffer to read from, and
the number of bytes to write, which are stored in @code{%rdi}, @code{%rsi}, and
@code{%rdx}, respectively.

@subsubsection{POSIX}

The code snippet above is @bold{tighly coupled} with Linux. It relies on
implementation details of the Linux kernel. Namely, the fact that the @code{write}
system call exists. The snippet above would certainly fail with a microkernel
implementation, since file system operations are typically not system calls and
instead are satisfied by @italic{servers} running in user space.

In order to achieve program compatibility on different operating systems, most
operating systems implement a C API as defined by the
@hyperlink["https://en.wikipedia.org/wiki/POSIX"]{POSIX} specification.

There is an important distinction here—POSIX does not require operating systems
to implement certain system calls. As mentioned earlier, that would mean
microkernel implementations could never be POSIX-compliant. Instead, POSIX
defines the C API, which represent high-level pieces of functionality that all
operating systems should support.

Here is the @code{write} C function as defined by POSIX.

@plain-codeblock{ssize_t write(int fd, const void *buf, size_t count);}

The GNU C Library (glibc) is an implementation of the POSIX C API for Linux-based systems.
The glibc implementation of the @code{write} function will be a simple wrapper over the
corresponding @code{write} system call. However, an OS with a microkernel will
implement the @code{write} C function with a function call to a userspace file system
server.

@subsubsection{System Calls Are Everywhere!}
Below, the @code{cat} program is called with the file
@filepath{the-real-motivation.txt}. We use the common Linux utility @code{strace} to
trace the system calls that @code{cat} invokes. As expected, @code{cat} invokes
the @code{read} system call, to read the contents of @filepath{the-real-motivation.txt}
from the file system.

@codeblock[#:line-numbers 1]{
[lukejianu@"@"login-students ~]$ strace cat the-real-motivation.txt
...
read(3, "We are attempting to build a lar"..., 131072) = 84
We are attempting to build a large scale system ... without writing any unit tests.
...
+++ exited with 0 +++
}

The third line shows @code{strace} logging the system call, and the fourth line
shows the output from @code{cat}.

@subsection{OS Services}
Let's take a deeper dive into POSIX and organize the C functions into categories.

@margin-note{TODO: This section really sucks.}

@subsubsection{Processes}
Users want to run programs. An instance of a running program is called a @italic{process}.
Thus, an OS must support process creation—loading a program from the file system
into memory and executing instructions. Users also want to run multiple processes
concurrently, even on single core machines. This is accomplished by virtualizing the
CPU. If the CPU can switch between running many processes quickly, it provides the
illusion that they all execute at once. Since many processes run on single CPU,
a scheduler becomes necessary. A scheduler needs a mechanism to only run a process
for a small period time and cancel it, before switching to another process. We rely
on the hardware to implement this mechanism, in the form of timer interupts.

@subsubsection{Memory Management}
Programs need memory to run. Programs can also request for more memory at runtime. 
Paging is a common memory management technique.

@subsubsection{File Operations}
Users want to create files, write to files, read from files, etc. Typically,
these operations are implemented in the component known as the @italic{file system}.

Unix-like operating systems also define the notion of a @italic{file descriptor}.

To quote the xv6 paper: "the file descriptor interface abstracts away the differences
between files, pipes, and devices, making them all look like streams of bytes".

