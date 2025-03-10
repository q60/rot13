if (args?.Count() > 0)
    Console.WriteLine(args[0].Select(c =>
            c switch
            {
                >= 'a' and <= 'm' or >= 'A' and <= 'M' => (char)(c + 13),
                >= 'n' and <= 'z' or >= 'N' and <= 'Z' => (char)(c - 13),
                _ => c
            }
        ).ToArray());
