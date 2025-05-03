Attribute VB_Name = "vb6console"
Option Explicit

'For a new console project:
'Add reference to Microsoft Scripting Runtime via Project->References
'Link to console subsytem after compile to direct output to executing console vs. new console
'Your location of link.exe may vary, but for example:
'"C:\Program Files (x86)\Microsoft Visual Studio\vb98\LINK.EXE" /EDIT /SUBSYSTEM:CONSOLE <exename>
'NOTE: you will have to re-link after each compile
'
'Base code is an edit from https://stackoverflow.com/questions/10517338/how-to-write-to-a-debug-console-in-vb6/10517370

Public StdIn As Scripting.TextStream
Public StdOut As Scripting.TextStream

' Environment:
'   Visual Basic 6.0
'   Windows 2000
Private Sub Main()
    With New Scripting.FileSystemObject
        Set pIn = .GetStandardStream(StdIn)
        Set pOut = .GetStandardStream(StdOut)
    End With

    pOut.WriteLine ("Enter encoding string: ")
    Dim bsEncoded As String
    bsEncoded = pIn.ReadLine()
    pOut.WriteLine ("Encoded string: " & Rot13(bsEncoded))
End Sub

Function Rot13(Source As String) As String
    Dim nIndex As Long
    Dim bsResult
    bsResult = ""
        
    For nIndex = 0 To Len(Source) - 1
        Dim nCharacter As Integer
        nCharacter = Asc(Mid(Source, nIndex + 1, 1))

        Select Case nCharacter
            Case 97 To 109, 65 To 77
                bsResult = bsResult & Chr(nCharacter + 13)
            Case 110 To 122, 78 To 90
                bsResult = bsResult & Chr(nCharacter - 13)
            Case Else
                bsResult = bsResult & Chr(nCharacter)
        End Select
    Next nIndex
    
    ' Second variant of "Return" statement
    Rot13 = bsResult
End Function
