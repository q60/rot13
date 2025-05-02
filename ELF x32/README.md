The compiled ELF is only 184 bytes and includes an efficient AVX2-vectorized implementation of ROT13.

A prebuilt file is included in the repository. Use `make` to rebuild from scratch.

The x32 ABI is a way to use a 32-bit ELF format with 32-bit address space and 64-bit ISA. It is thus well-suitable for codegolfing. x32 binaries are supported on most x64 distributions by default. Set `CONFIG_X86_X32_ABI=y` if you get a ENOEXEC upon an attempt to run `rot13`.
