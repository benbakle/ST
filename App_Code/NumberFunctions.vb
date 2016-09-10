Imports Microsoft.VisualBasic

Public Class NumberFunctions
    Public Shared Function StringToNumeric(num As String, errorValue As Decimal) As Decimal
        Dim decNumber = num
        If num = "" Or Not IsNumeric(num) Then
            decNumber = errorValue
        End If
        StringToNumeric = CDec(decNumber)
    End Function
End Class
