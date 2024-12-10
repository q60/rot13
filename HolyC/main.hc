//
// As far as I know, HolyC doesn't has I/O "built-in" library  
// Just because, rot13 lives only inside TempleOS.
// TempleOS has itself API and represents the important 
// I/O functions
//

U0 main() {
    printf("Enter string to encode: ");

    I32 buffer_len = 256; 
    I1 buffer[256]; 
    I32 len = 0;
    I1 c;
    
    while ((c = GetChar()) != '\n') {
        
        if (c >= 'a' && c <= 'z') {
            buffer[len++] = (c - 'a' + 13) % 26 + 'a';
        } else if (c >= 'A' && c <= 'Z') {
            buffer[len++] = (c - 'A' + 13) % 26 + 'A';
        } else {
            buffer[len++] = c;
        }

        // Buffer overload? => ignoring 
        
        if (len >= buffer_len -1) {
            PrintErr("Buffer overloaded! Aborting...\n");
            break;
        }
    }
    buffer[len] = '\0';

    Print("Encoded string: %s", buffer);
}