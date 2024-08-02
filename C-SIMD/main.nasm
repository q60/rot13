	[global _start]

	[section .text align=1]

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

output_prompt:
	db "Encoded string:", 0x0a
	output_prompt_len equ $ - output_prompt

buffer:

	[section .bss]
	resb 65535
