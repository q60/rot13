           .set     SIZE, 0x200
           .include "print.S"
           .global  _start
           .bss
           .lcomm   text SIZE
           .data
msg1:      .asciz   "Enter string to encode:\n"
msg2:      .asciz   "Encoded string:\n"
           .text
_start:    movq     $msg1, %rax
           call     print
           movq     $0x00, %rax  # read syscall
           movq     $0,    %rdi  # stdin
           movq     $text, %rsi  # char *buffer
           movq     $SIZE, %rdx  # size_t count
           syscall
           movq     $text, %rdx
loop1:     cmpb     $10,  (%rdx) # '\n'
           je       quit
           jmp      loop2
loop2:     cmpb     $97,  (%rdx) # 'a'
           jge      loop3
           jle      loop5
loop3:     cmpb     $109, (%rdx) # 'm'
           jle      rotp
           jg       loop4
loop4:     cmpb     $122, (%rdx) # 'z'
           jle      rotm
           jg       rotn
loop5:     cmpb     $65,  (%rdx) # 'A'
           jge      loop6
           jl       rotn
loop6:     cmpb     $77,  (%rdx) # 'M'
           jle      rotp
           jg       loop7
loop7:     cmpb     $90,  (%rdx) # 'Z'
           jle      rotm
           jg       rotn
rotn:      incq     %rdx
           incq     %rdi
           jmp      loop1
rotp:      addb     $13,  (%rdx)
           incq     %rdx
           incq     %rdi
           jmp      loop1
rotm:      subb     $13,  (%rdx)
           incq     %rdx
           incq     %rdi
           jmp      loop1
quit:      movq     $msg2, %rax
           call     print
           subq     %rdi,  %rdx
           movq     %rdx,  %rax
           call     print        # print result
           call     exit
