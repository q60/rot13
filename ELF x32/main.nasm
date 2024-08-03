	[bits 64]

	org 0x0d990000

elf_header:
	db 0x7f, "ELF"

	; Exactly 16 bytes. Overlaps with:
	; - class (u8): ignored
	; - endianness (u8): ignored
	; - version (u8): ignored
	; - OS ABI (u8): ignored
	; - ABI version (u8): ignored
	; - padding ([u8; 7]): ignored
	; - type (u16): EXEC, part of mov imm32
	; - ISA (u16): x86-64, part of mov imm32
	; - version (u64)
_start:
	mov ebx, ebx_base  ; 5 bytes
	vpbroadcastb ymm2, [rbx + lit_0x0d - ebx_base]  ; 6 bytes
	mov ecx, 0x003e0002  ; imm32: type, ISA
	inc edi  ; 2 bytes
	jmp stage2

	dd _start  ; entry point
	dd program_header - elf_header  ; program header table offset

stage2:
	; Exactly 10 bytes. Overlaps with:
	; - section header table offset (u32): ignored
	; - flags (u32): ignored
	; - ELF header size (u16): ignored
	mov dl, input_prompt_len  ; 2 bytes
	vpbroadcastb ymm4, [rbx + lit_0x99 - ebx_base]  ; 6 bytes
	jmp stage3

	dw 0x20  ; program header entry size
program_header:
	dd 1  ; In ELF header: program header entry count (u16): 1, section header entry size (u16): 0
		  ; In program header: type: PT_LOAD
	dd 0  ; In ELF header: section header entry count (u16): 0, section name entry index (u16): 0
		  ; In program header: file offset: 0
elf_header_end:
	lit_0x99 equ $ + 2
	lit_0x0d equ $ + 3
	dd elf_header ; virtual address

stage3:
	; Exactly 20 bytes. Overlaps with:
	; - physical address (u32): ignored
	; - file size (u32): <= 0x1000
	; - size in memory (u32): should just be large enough
	; - flags (u32): rwx, i.e. & 0x7 == 0x7
	; - alignment (u32): ignored
	vpaddb ymm1, ymm4, ymm4  ; 4 bytes
	db 0x05, 0x01, 0x00, 0x00  ; file size: add eax, 1 (imm32), as SYS_write = 1
	db 0x00
	lea esi, [rbx + input_prompt - ebx_base]  ; 3 bytes
	syscall  ; the first byte is 0xf, which has rwx bits set
	xor eax, eax  ; SYS_read = 0
	xor edi, edi
	not dx

	; Free code
	vpbroadcastb ymm0, [rbx]  ; 5 bytes
	lea esi, [rbx + buffer - ebx_base]
	syscall

	lea edx, [rax + output_prompt_len]

loop:
	vpand ymm7, ymm0, [rsi]
	vpaddb ymm6, ymm7, ymm1
	vpaddb ymm5, ymm6, ymm2
	vpsignb ymm6, ymm2, ymm6
	vpcmpgtb ymm5, ymm5, ymm4
	lit_0xdf equ $ + 2  ; aren't we lucky?
	ebx_base equ lit_0xdf
	vpandn ymm6, ymm5, ymm6
	vpaddb ymm6, [rsi]
	vmovdqa [rsi], ymm6
	add esi, 0x20
	sub eax, 0x20
	jnb loop

	inc edi
	mov eax, edi  ; SYS_write = 1
	lea esi, [rbx + output_prompt - ebx_base]
	syscall

	push 60  ; SYS_exit = 60
	pop rax
	xor edi, edi
	syscall

	; padding
	times 5 db 0

input_prompt:
	db "Enter string to encode:", 0x0a
	input_prompt_len equ $ - input_prompt

output_prompt:
	db "Encoded string:", 0x0a
	output_prompt_len equ $ - output_prompt

buffer:
