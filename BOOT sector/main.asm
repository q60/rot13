       bits  16
       org   0h7C00
       mov   AH, 0h00
       mov   AL, 0h01
       int   0h10
 read: mov   AH, 0h00
       int   0h16
       mov   BL, AL
       cmp   AL, 0h0D
       jne   rot1
       je    nl
 rot1: cmp   AL, 0h61 ; 'a'
       jge   rot2
       jle   rot4
 rot2: cmp   AL, 0h6D ; 'm'
       jle   rotp
       jg    rot3
 rot3: cmp   AL, 0h7A ; 'z'
       jle   rotm
       jg    rotn
 rot4: cmp   AL, 0h41 ; 'A'
       jge   rot5
       jl    rotn
 rot5: cmp   AL, 0h4D ; 'M'
       jle   rotp
       jg    rot6
 rot6: cmp   AL, 0h5A ; 'Z'
       jle   rotm
       jg    rotn
 rotn: jmp   put
 rotp: add   AL, 13
       jmp   put
 rotm: sub   AL, 13
       jmp   put
  put: mov   AH, 0h0E
       int   0h10
       jmp   read
   nl: mov   AH, 0h0E
       mov   AL, 0h0A
       int   0h10
       mov   AL, 0h0D
       int   0h10
       jmp   read
_boot: jmp   $
       times 510-($-$$) db 0h00
       dw    0hAA55