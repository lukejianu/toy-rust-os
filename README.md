# Toy Rust OS
This repository is an in-progress attempt of systematically designing and implementing
a toy operating system using the Rust programming language.

We've extensively documented this project, including the motivations, necessary
background information, component and project specifications, and much more.
You can read all of this documentation at

[https://www.lukejianu.com/small-rust-os/](https://www.lukejianu.com/small-rust-os/)


## Quick Start
First, make sure you have [Rust](https://www.rust-lang.org/tools/install) and [QEMU](https://www.qemu.org/download/) installed. Then, set up the build tools:

```
cargo install bootimage
``` 
(We are trying to remove this step)

You can now run the OS by running:

```
cargo run
```
