SIZE:      equ      0h200
           bits     64
           %include "print.asm"
           global   _start
           section  .bss
text:      resb     SIZE
           section  .rodata
msg1:      db       "Enter string to encode:", 0hA, 0
msg2:      db       "Encoded string:",         0hA, 0
           section  .text
_start:    mov      rax, msg1
           call     print
           mov      rax, 0h00       ; read syscall
           mov      rdi, 0          ; stdin
           mov      rsi, text       ; char *buffer
           mov      rdx, SIZE       ; size_t count
           syscall
           mov      rdx, text
loop1:     cmp      byte [rdx], 10  ; '\n'
           je       quit
           jmp      loop2
loop2:     cmp      byte [rdx], 97  ; 'a'
           jge      loop3
           jle      loop5
loop3:     cmp      byte [rdx], 109 ; 'm'
           jle      rotp
           jg       loop4
loop4:     cmp      byte [rdx], 122 ; 'z'
           jle      rotm
           jg       rotn
loop5:     cmp      byte [rdx], 65  ; 'A'
           jge      loop6
           jl       rotn
loop6:     cmp      byte [rdx], 77  ; 'M'
           jle      rotp
           jg       loop7
loop7:     cmp      byte [rdx], 90  ; 'Z'
           jle      rotm
           jg       rotn
rotn:      inc      rdx
           inc      rdi
           jmp      loop1
rotp:      add      byte [rdx], 13
           inc      rdx
           inc      rdi
           jmp      loop1
rotm:      sub      byte [rdx], 13
           inc      rdx
           inc      rdi
           jmp      loop1
quit:      mov      rax, msg2
           call     print
           sub      rdx, rdi
           mov      rax, rdx
           call     print           ; print result
           call     exit
