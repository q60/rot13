; FASM LINUX I386
               format  ELF

               public  _start

               section '.data' writeable
msg            db      "Hello, World!", 0xA, 0

               section '.text' executable
_start:        mov     eax, msg
               call    rot13
               call    print_string
               jmp     exit
; | input:
; eax = string
; | output:
; eax = string
rot13:         pushad
.next_iter:    cmp     [eax], byte 0
               je      .exit
               mov     bl, [eax]
               mov     ch, 0
               mov     cl, 'A'
               cmp     bl, byte 'A'
               jge     .gt_A
               jmp     .pass
.gt_A:         cmp     bl, byte 'Z'
               jle     .rot13
               jmp     .next_check
.next_check:   cmp     bl, byte 'a'
               jge     .gt_a
               jmp     .pass
.gt_a:         cmp     bl, byte 'z'
               jle     .lt_z
               jmp     .pass
.lt_z:         mov     ch, 20
               mov     cl, 'a'
.rot13:        push    eax
               xor     eax, eax
               xor     edx, edx
               mov     al, bl
               add     al, ch
               mov     bl, 26
               div     ebx
               mov     al, dl
               add     al, cl
               mov     bl, al
               pop     eax
               mov     [eax], bl
.pass:         inc     eax
               jmp     .next_iter
.exit:         popad
               ret
; | input
; eax = string
print_string:  pushad
               mov     ecx, eax
               call    length_string
               mov     edx, eax
               mov     eax, 4
               mov     ebx, 1
               int     0x80
               popad
               ret
; | input
; eax = string
; | output
; rax = length
length_string: push    ebx
               xor     ebx, ebx
.next_iter:    cmp     [eax+ebx], byte 0
               je      .close
               inc     ebx
               jmp     .next_iter
.close:        mov     eax, ebx
               pop     ebx
               ret
exit:          mov     eax, 1
               mov     ebx, 0
               int     0x80
