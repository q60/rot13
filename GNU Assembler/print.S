len:    push    %rdi
        mov     %rax, %rdi
nextch: cmpb    $0,  (%rax)
        jz      finish
        inc     %rax
        jmp     nextch
finish: sub     %rdi, %rax
        pop     %rdi
        ret
 print: push    %rdx
        push    %rsi
        push    %rdi
        push    %rax
        call    len
        mov     %rax, %rdx  # size_t count
        pop     %rax
        mov     %rax, %rsi  # const char *buffer
        mov     $1,   %rdi  # stdout
        mov     $1,   %rax  # write syscall
        syscall
        pop     %rdi
        pop     %rsi
        pop     %rdx
        ret
  exit: mov     $0,    %rdi # int exit_code
        mov     $0x3C, %rax # exit syscall
        syscall
        ret
