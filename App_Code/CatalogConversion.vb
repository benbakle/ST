Imports Microsoft.VisualBasic

Public Class CatalogConversion
    Public Shared Function SheathFractionalLengthToDecimal(ByVal code As String) As Decimal
        
        Select Case code
            Case "A"
                SheathFractionalLengthToDecimal = 0
            Case "B"
                SheathFractionalLengthToDecimal = 1 / 16
            Case "C"
                SheathFractionalLengthToDecimal = 1 / 8
            Case "E"
                SheathFractionalLengthToDecimal = 3 / 16
            Case "G"
                SheathFractionalLengthToDecimal = 1 / 4
            Case "J"
                SheathFractionalLengthToDecimal = 3 / 8
            Case "L"
                SheathFractionalLengthToDecimal = 1 / 2
            Case "N"
                SheathFractionalLengthToDecimal = 5 / 8
            Case "Q"
                SheathFractionalLengthToDecimal = 3 / 4
            Case "S"
                SheathFractionalLengthToDecimal = 7 / 8
            Case Else
                SheathFractionalLengthToDecimal = -1
        End Select

    End Function

    Public Shared Function DecimalToSheathFractionalLength(ByVal dec As Decimal) As String
        DecimalToSheathFractionalLength = "S"
        Select Case dec
            Case 0
                DecimalToSheathFractionalLength = "A"
            Case 1 / 16
                DecimalToSheathFractionalLength = "B"
            Case 1 / 8
                DecimalToSheathFractionalLength = "C"
            Case 3 / 16
                DecimalToSheathFractionalLength = "D"
            Case 1 / 4
                DecimalToSheathFractionalLength = "G"
            Case 3 / 8
                DecimalToSheathFractionalLength = "J"
            Case 1 / 2
                DecimalToSheathFractionalLength = "L"
            Case 5 / 8
                DecimalToSheathFractionalLength = "N"
            Case 3 / 4
                DecimalToSheathFractionalLength = "Q"
        End Select
    End Function
End Class
