stringToEncode = input("Enter string to encode:\n", 's');
encodedString = "";

for i = 1:strlength(stringToEncode)
    char = stringToEncode(i);
    charUpper = upper(char);

    if (charUpper >= 'A') && (charUpper <= 'M')
        encodedString = encodedString + num2str(char+13, "%c");
    elseif (charUpper >= 'N') && (charUpper <= 'Z')
        encodedString = encodedString + num2str(char-13, "%c");
    else
        encodedString = encodedString + char;
    end
end

disp("Encoded string:");
disp(encodedString);
