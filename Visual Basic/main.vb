Imports System

Public Class ROT13
    Public Shared Sub Main()
        Console.Write("Enter string to encode: ")
        Dim str As String = Console.ReadLine()
        
        Console.Write("Encoded string: ")
        Dim c As Char
        For Each c in str
            If (Asc("a"C) <= Asc(c)) And (Asc(c) <= Asc("z"C)) Then
                Dim nc As Char = Chr((Asc(c) - Asc("a"C) + 13) mod 26 + Asc("a"C))
                Console.Write(nc)
            Else If (Asc("A"C) <= Asc(c)) And (Asc(c) <= Asc("Z"C)) Then
                Dim nc As Char = Chr((Asc(c) - Asc("A"C) + 13) mod 26 + Asc("A"C))
                Console.Write(nc)
            Else
                Console.Write(c)
            End If
        Next
        Console.WriteLine()
        
    End Sub
End Class
