; FASM LINUX I386
               format  ELF

               public  _start

               section '.data' writeable
ent            db      "Enter string to encode:", 0xA, 0
enc            db      "Encoded string:", 0xA, 0

               section '.bss' writeable
bufsiz         equ     1024
buffer         rb      bufsiz
_tchar         rb      1     

               section '.text' executable
_start:        mov     eax, ent
               call    print_string
               mov     eax, buffer
               mov     ebx, bufsiz
               call    input_string
               mov     eax, enc 
               call    print_string
               mov     eax, buffer
               call    rot13
               call    print_string
               call    print_line
               jmp     exit

; | input:
; eax = string
; | output:
; eax = string
rot13:         pushad
               xor     ebx, ebx
.next_iter:    cmp     [eax], byte 0
               je      .exit
               mov     bl, [eax]
               xor     ch, ch
               mov     cl, 'A'
               cmp     bl, byte 'A'
               jge     .gt_A
               jmp     .pass
.gt_A:         cmp     bl, byte 'Z'
               jle     .rot13
               cmp     bl, byte 'a'
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

; | input:
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

; | input:
; eax = buffer
; ebx = buffer size
input_string:  pushad
               mov     ecx, eax
               mov     edx, ebx
               mov     eax, 3
               mov     ebx, 0
               int     0x80
               mov     [ecx+eax-1], byte 0
               popad
               ret

; | input:
; eax = string
; | output:
; eax = length
length_string: push    ebx
               xor     ebx, ebx
.next_iter:    cmp     [eax+ebx], byte 0
               je      .close
               inc     ebx
               jmp     .next_iter
.close:        mov     eax, ebx
               pop     ebx
               ret

; print_char(0xA)
print_line:    push    eax
               mov     eax, 0xA
               call    print_char
               pop     eax
               ret

; | input
; eax = char
print_char:    pushad
               mov     [_tchar], al
               mov     eax, 4
               mov     ebx, 1
               mov     ecx, _tchar
               mov     edx, 1
               int     0x80
               popad
               ret

; exit(0)
exit:          mov     eax, 1
               mov     ebx, 0
               int     0x80
