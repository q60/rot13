all: rot13

rot13: main.o
	$(LD) $< -o $@ -n
	objcopy --strip-section-headers $@

main.o: main.nasm
	nasm $< -o $@ -f elf64
