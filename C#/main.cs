// Using top-level statements (see https://learn.microsoft.com/en-us/dotnet/csharp/whats-new/tutorials/top-level-statements) 
// and Linq along with pattern matching (see https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/functional/pattern-matching)
if (args?.Count() > 0)
    Console.WriteLine(args[0].Select(c =>
            c switch
            {
                >= 'a' and <= 'm' or >= 'A' and <= 'M' => (char)(c + 13),
                >= 'n' and <= 'z' or >= 'N' and <= 'Z' => (char)(c - 13),
                _ => c
            }
        ).ToArray());
