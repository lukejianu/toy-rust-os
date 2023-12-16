#lang scribble/manual
 
@title{A Toy Operating System}

@margin-note[@image[#:scale 0.3
                    "img/OS_Layers.svg.png"]]


@section{What is an OS?}

An OS is the software that acts as an intermediate layer between computer hardware and
user programs. The OS's job is to provide common services to users, such as ...

Most computers "run" operating systems because they are an essential abstraction over
the computer hardware. Computer users shouldn't have to think about...

@subsection{OS as an API}

An OS is an interface. The functions in the OS's interface are known as
@italic{system calls}. One common system call is @code{read}.

@codeblock{
// Read the count bytes from the specified file into the given buffer.
// Returns the number of bytes read.
ssize_t read(int fd, void *buf, size_t count);
}

The snippet above shows the system call @code{read}.
This raises the question, what makes this C function declaration a system call, and
why is @code{int add(int x, int y);} not a system call?

@margin-note{TODO: How does the linking actually work here? Does GCC link to some OS
syscall header?}

The answer is: the @hyperlink["https://en.wikipedia.org/wiki/POSIX"]{POSIX}
specification. POSIX specifies the names and signatures of system calls. Different
operating systems can implement the same interface, so that user programs can run
"the same" on all POSIX-compliant operating systems.

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

@subsection{Abstraction}
The OS abstracts away the hardware details from user programs...

A related topic is OS virtualization, the illusion that user processes have the
CPU and system memory all to themselves... 

@section{What does it mean to write an OS?}

Just implement POSIX!

