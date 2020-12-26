using System;
using System.Linq;

public class Rot13
{
  public static void Main()
  {
    Console.Write("Enter string to encode: ");
    Console.Write(String.Format("Encoded string: {0}\n",
      new String(
        Console.ReadLine().ToCharArray().Select(c => {
          if('a' <= c && c <= 'z') c = (char)((c - 'a' + 13) % 26 + 'a');
          else if('A' <= c && c <= 'Z') c = (char)((c - 'A' + 13) % 26 + 'A');
          return c;
        }).ToArray()
      )
    ));
  }
}
