len:    push    %rdi
        mov     %rax, %rdi
nextch: cmpb    $0,  (%rax)
        jz      finish
        inc     %rax
        jmp     nextch
finish: sub     %rdi, %rax
        pop     %rdi
        ret
print:  push    %rdx
        push    %rsi
        push    %rdi
        push    %rax
        call    len
        mov     %rax, %rdx
        pop     %rax
        mov     %rax, %rsi
        mov     $1,   %rdi
        mov     $1,   %rax
        syscall
        pop     %rdi
        pop     %rsi
        pop     %rdx
        ret
exit:   mov     $0,    %rdi
        mov     $0x3C, %rax
        syscall
        ret
