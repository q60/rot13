#import <Foundation/Foundation.h>
#import <ctype.h>

int main(int argc, const char * argv[]) 
{
    // mandatory C-like implementation of encoding method.
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"Enter string to encode:\n");
    size_t sbuff_len = 256;
    char *sbuff = (char *)calloc(sbuff_len, sizeof(char));

    char c;
    size_t len = 0;
    
    while ((c = getchar()) != '\n') 
    {
        sbuff[len++] = isalpha(c) ? ((c - (islower(c) ? 'a' : 'A') + 13) % 26 + (islower(c) ? 'a' : 'A')) : c;

        if (len == sbuff_len) 
        {
            size_t new_len = sbuff_len + 255;
            char *new_buff = (char *)realloc(sbuff, new_len * sizeof(char));
            if (new_buff != NULL) 
            {
                sbuff_len = new_len;
                sbuff = new_buff;
            } 
            else 
            {
                NSLog(@"Input error. Aborting...\n");
                free(sbuff);
                [pool drain];
                return 1;
            }
        }
    }
    sbuff[len] = '\0';

    // CString -> NextStep String
    NSString *encodedString = [NSString stringWithUTF8String:sbuff];
    NSLog(@"Encoded string: %@\n", encodedString);

    free(sbuff);
    [pool drain];

    return 0;
}
