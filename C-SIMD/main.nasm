	[bits 64]

	org 0x400000

elf_header:
	db 0x7f, "ELF"
	db 1  ; class: 32-bit
	db 1  ; endianness: little
	db 1  ; version: 1

_start:
	; Exactly 9 bytes. Overlaps with: OS ABI (u8), ABI version (u8), padding ([u8; 7])
	mov ebx, ebx_base
	inc eax  ; SYS_write = 1
	jmp stage2

	dw 2  ; type: EXEC
	dw 0x3e  ; ISA: x86-64
	dd 1  ; version: 1
	dd _start  ; entry point
	dd program_header - elf_header  ; program header table offset

stage2:
	; Exactly 10 bytes. Overlaps with:
	; - section header table offset (u32): ignored
	; - flags (u32): ignored
	; - ELF header size (u16): ignored
	vpbroadcastb ymm0, [rbx]
	lea esi, [rbx + input_prompt - ebx_base]
	jmp stage3

	dw program_header_end - program_header  ; program header entry size
program_header:
	dd 1  ; In ELF header: program header entry count (u16): 1, section header entry size (u16): 0
		  ; In program header: type: PT_LOAD
	dd 0  ; In ELF header: section header entry count (u16): 0, section name entry index (u16): 0
		  ; In program header: file offset: 0
elf_header_end:
	dd elf_header ; virtual address

	; Overlap with physical address (u32)
ebx_base:
lit_0x0d:
	db 0x0d
lit_0xc1:
	db 0xc1
lit_0x9a:
	db 0x9a
lit_0x4e:
	db 0x4e

	dd buffer - elf_header ; file size
	dd end - elf_header  ; size in memory: can be clobbered maybe
	db 0x7  ; flags: rwx
input_prompt:
	db "Enter s"  ; continuation of flags (u32-u8): ignored, alignment (u32): ignored
program_header_end:
	db "tring to encode:", 0x0a
	input_prompt_len equ $ - input_prompt

stage3:
	inc edi
	mov dl, input_prompt_len
	syscall

	vpbroadcastb ymm2, [rbx + lit_0xdf - ebx_base]
	vpbroadcastb ymm3, [rbx + lit_0xc1 - ebx_base]
	vpbroadcastb ymm5, [rbx + lit_0x9a - ebx_base]
	vpbroadcastb ymm6, [rbx + lit_0x4e - ebx_base]
	vpsubb ymm7, ymm0

	xor eax, eax  ; SYS_read = 0
	xor edi, edi
	mov esi, buffer
	not dx
	syscall

	lea edx, [rax + output_prompt_len]

loop:
	vpand ymm1, ymm2, [rsi]
	vpsubb ymm4, ymm1, ymm3
	vpcmpgtb ymm4, ymm5
	vpsubb ymm1, ymm6
	vpblendvb ymm1, ymm7, ymm0, ymm1
	lit_0xdf equ $ + 2  ; aren't we lucky?
	vpandn ymm4, ymm1
	vpaddb ymm4, [rsi]
	vmovdqa [rsi], ymm4
	add esi, 0x20
	sub eax, 0x20
	jnb loop

	inc edi
	mov eax, edi  ; SYS_write = 1
	mov esi, output_prompt
	syscall

	push 60  ; SYS_exit = 60
	pop rax
	xor edi, edi
	syscall

	; padding
	times 4 db 0

output_prompt:
	db "Encoded string:", 0x0a
	output_prompt_len equ $ - output_prompt

buffer:
	end equ buffer + 65535
