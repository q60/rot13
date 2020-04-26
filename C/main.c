#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main() {
    printf("Enter string to encode: ");

    size_t sbuff_len = 256;
    char* sbuff = (char*)calloc(sbuff_len, sizeof(char));

    char c;
    size_t len = 0;
    while((c = getchar()) != '\n') {
        sbuff[len++] = isalpha(c) ? ((c - (islower(c) ? 'a' : 'A') + 13) % 26 + (islower(c) ? 'a' : 'A')) : c;

        if(len == sbuff_len) {
            size_t new_len = sbuff_len + 256;
            char* new_buff = (char*)realloc(sbuff, new_len * sizeof(char));
            if(new_buff != NULL) {
                sbuff_len = new_len;
                sbuff = new_buff;
            }
            else {
                printf("Input error. Aborting.\n");
                return 1;
            }
        }
    }
    sbuff[len] = '\0';

    printf("Encoded string: %s\n", sbuff);

    free(sbuff);
    return 0;
}