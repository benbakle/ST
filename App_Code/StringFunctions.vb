Imports Microsoft.VisualBasic

Public Class StringFunctions
    Public Shared Function ParseString(ByVal myString As String, ByVal place As Integer, parse As String) As String
        Dim parsed As String()
        parsed = myString.Split(parse)
        On Error Resume Next
        ParseString = parsed(place)
    End Function
End Class
