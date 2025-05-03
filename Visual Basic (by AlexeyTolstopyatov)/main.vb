' Visual Basic (in this context) is a modern dialect
' of language, which uses .NET Framework or other .NET
' platform instead "MSVBVMXX.dll". 
' 
' So, if I use ,NET => I can use LINQ expressions
Imports System
Imports System.Linq

Public Class Rot13
    Public Shared Sub Main()
        Console.Write("Enter string to encode: ")
        Console.Write(String.Format("Encoded string: {0}" & vbCrLf,
            New String(
                Console.ReadLine().ToCharArray().Select(Function(c)
                    If "a"c <= c AndAlso c <= "z"c Then
                        c = ChrW((AscW(c) - AscW("a"c) + 13) Mod 26 + AscW("a"c))
                    ElseIf "A"c <= c AndAlso c <= "Z"c Then
                        c = ChrW((AscW(c) - AscW("A"c) + 13) Mod 26 + AscW("A"c))
                    End If
                    Return c
                End Function).ToArray()
            )
        ))
    End Sub
End Class

