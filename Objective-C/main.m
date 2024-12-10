- (NSString *)moveChar:(unichar)c {
    if (isalpha(c)) {
        int base = islower(c) ? (int)'a' : (int)'A';
        return [NSString stringWithFormat:@"%c", (char)((base + ((int)c - base + 13) % 13 * 2))];
    }
    return [NSString stringWithFormat:@"%c", c];
}

// [EntryPoint]
NSString *input = @"Enter string to encode:";
NSLog(@"%@", input);
char str[100];
scanf("%s", str);

NSString *result = @"";
for (int i = 0; i < strlen(str); i++) {
    result = [result stringByAppendingFormat:@"%@", [self encodeCharacter:str[i]]];
}

NSLog(@"Encoded string: %@", result);