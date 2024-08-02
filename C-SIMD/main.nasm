	[bits 64]

	org 0x400000

elf_header:
	; ELF header
	db 0x7f, "ELF"
	db 1  ; class: 32-bit
	db 1  ; endianness: little
	db 1  ; version: 1
	db 0  ; OS ABI: SysV
	db 0  ; ABI version: ignored
	db 0, 0, 0, 0, 0, 0, 0  ; padding: ignored
	dw 2  ; type: EXEC
	dw 0x3e  ; ISA: x86-64
	dd 1  ; version: 1
	dd _start  ; entry point
	dd program_header - elf_header  ; program header table offset
	dd 0  ; section header table offset
	dd 0  ; flags
	dw 52  ; ELF header size
	dw _start - program_header  ; program header entry size
	dw 1  ; program header entry count
	dw 0  ; section header entry size
	dw 0  ; section header entry count
	dw 0  ; section name entry index

program_header:
	; Program header
	dd 1  ; type: PT_LOAD
	dd 0  ; file offset: 0
	dd elf_header ; virtual address
	dd 0  ; physical address: 0
	dd buffer - elf_header ; file size
	dd end - elf_header  ; size in memory
	dd 0x7  ; flags: rwx
	dd 0  ; alignment: none

_start:
	lea ebp, [rel buffer]

	inc eax  ; SYS_write = 1
	inc edi
	lea esi, [rbp + input_prompt - buffer]
	mov dl, input_prompt_len
	syscall

	vpbroadcastb ymm0, [rbp + lit_0x0d - buffer]
	vpbroadcastb ymm2, [rbp + lit_0xdf - buffer]
	vpbroadcastb ymm3, [rbp + lit_0xc1 - buffer]
	vpbroadcastb ymm5, [rbp + lit_0x9a - buffer]
	vpbroadcastb ymm6, [rbp + lit_0x4e - buffer]
	vpsubb ymm7, ymm0

	xor eax, eax  ; SYS_read = 0
	xor edi, edi
	mov esi, ebp
	not dx
	syscall

	lea edx, [rax + output_prompt_len]

loop:
	vpand ymm1, ymm2, [rsi]
	vpsubb ymm4, ymm1, ymm3
	vpcmpgtb ymm4, ymm5
	vpsubb ymm1, ymm6
	vpblendvb ymm1, ymm7, ymm0, ymm1
	vpandn ymm4, ymm1
	vpaddb ymm4, [rsi]
	vmovdqa [rsi], ymm4
	add esi, 0x20
	sub eax, 0x20
	jnb loop

	inc edi
	mov eax, edi  ; SYS_write = 1
	lea esi, [rbp + output_prompt - buffer]
	syscall

exit:
	push 60  ; SYS_exit = 60
	pop rax
	xor edi, edi
	syscall

input_prompt:
	db "Enter string to encode:", 0x0a
	input_prompt_len equ $ - input_prompt

lit_0x0d:
	db 0x0d
lit_0xdf:
	db 0xdf
lit_0xc1:
	db 0xc1
lit_0x9a:
	db 0x9a
lit_0x4e:
	db 0x4e

	; padding
	times 4 db 0

output_prompt:
	db "Encoded string:", 0x0a
	output_prompt_len equ $ - output_prompt

buffer:
	end equ buffer + 65535
