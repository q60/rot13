program ROT13
    character (len = 256) :: str
    integer :: c 
    
    write (*, '(A)') "Enter string to encode: "
    read (*, '(A)') str
    
    do i = 1, 256
        c = ichar(str(i:i))
        
        if (ichar('A') <= c .and. c <= ichar('Z')) then
            c = mod(c - ichar('A') + 13, 26) + ichar('A')
        else if (ichar('a') <= c .and. c <= ichar('z')) then
            c = mod(c - ichar('a') + 13, 26) + ichar('a')
        end if
        
        str(i:i) = char(c)
        cycle
    enddo
    
    write (*, '(A,A)') "Encoded string: ", str
    
    stop
end
