# Small Rust OS
This repository is an in-progress attempt of systematically designing and implementing
a small operating system using the Rust programming language.

## Quick Start
First, make sure you have [Rust](https://www.rust-lang.org/tools/install) and [QEMU](https://www.qemu.org/download/) installed. Then, set up the build tools:

```
rustup override set nightly
rustup component add llvm-tools-preview
cargo install bootloader
``` 

You can now run the OS by running:

```
cargo run
```

We've extensively documented this project, including the motivations, necessary
background information, component and project specifications, and much more.
You can read all of this documentation at

[https://www.lukejianu.com/small-rust-os/](https://www.lukejianu.com/small-rust-os/)

