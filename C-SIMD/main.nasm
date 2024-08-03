	[bits 64]

	org 0x400000

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
	mov ebx, ebx_base
	vpbroadcastb ymm1, [rbx + lit_0x32 - ebx_base]
	mov ecx, 0x003e0002  ; imm32: type, ISA
	inc eax  ; SYS_write = 1
	jmp stage2

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
lit_0x32:
	db 0x32
lit_0x0d:
	db 0x0d
lit_0xc1:
	db 0xc1
lit_0x99:
	db 0x99

	dd buffer - elf_header ; file size

stage3:
	; Exactly 12 bytes. Overlays with
	; - size in memory (u32): should just be large enough
	; - flags (u32): rwx, i.e. & 0x7 == 0x7
	; - alignment (u32): ignored
	mov dl, input_prompt_len
	inc edi
	syscall
	vpbroadcastb ymm2, [rbx + lit_0x0d - ebx_base]
program_header_end:

	; Free code
	vpbroadcastb ymm3, [rbx + lit_0xc1 - ebx_base]
	vpbroadcastb ymm4, [rbx + lit_0x99 - ebx_base]

	xor eax, eax  ; SYS_read = 0
	xor edi, edi
	mov esi, buffer
	not dx
	syscall

	lea edx, [rax + output_prompt_len]

loop:
	vpand ymm7, ymm0, [rsi]
	vpaddb ymm6, ymm7, ymm1
	vpsignb ymm6, ymm2, ymm6
	vpsubb ymm5, ymm7, ymm3
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

input_prompt:
	db "Enter string to encode:", 0x0a
	input_prompt_len equ $ - input_prompt

	; padding
	times 22 db 0

output_prompt:
	db "Encoded string:", 0x0a
	output_prompt_len equ $ - output_prompt

buffer:
