Imports Microsoft.VisualBasic

Public Class TemperatureSensor
    ''------------------
    ''PRICING ---------- 
    ''------------------
    Public Function SetListPricing() As TemperatureSensor
        SetBaseCost()
        SetSheathTerminationCost()
        SetFittingCost()

        If IsLeadwireStyle() Then
            SetLeadwireCost()
            SetLeadwireTermCost()
        Else
            If Not HasMI() Then
                SetLeadwireCost()
            End If
        End If
        If HasFlex() Then
            SetFlexCost()
        End If
        If HasMI() Then
            SetMICost()
        End If
        If HasTubing() Then
            SetTubeCost()
        End If
        If IsSanitary() Then
            SetSanitaryCost()
        End If
        If IsInsertionProbe() Then
            SetInsertionProbeCost()
        End If
        If IsThermowellAssembly() Then
            SetThermowellAssemblyCost()
        End If
        If IsQuickConnect() Then
            SetQuickConnectCost()
        End If
        If HasThermowell() Then
            SetThermowellCost()
        End If
        If IsExtension() Then
            SetExtensionCost()
        End If
        If HasOption1() Then
            SetOption1Cost()
        End If
        If HasOption2() Then
            SetOption2Cost()
        End If
        If HasCode() Then
            SetCodeCost()
        End If


        If BaseCost = -1 Or _
            SheathTermCost = -1 Or _
            TubeCost = -1 Or _
            MICost = -1 Or _
            LeadwireCost = -1 Or _
            LeadwireTermCost = -1 Or _
            FlexCost = -1 Or _
            FittingCost = -1 Or _
            SanitaryCost = -1 Or _
            InsertionProbeCost = -1 Or _
            ThermowellAssemblyCost = -1 Or _
            ThermowellCost = -1 Or _
            QuickConnectCost = -1 Or _
            ExtensionCost = -1 Or _
            Option1Cost = -1 Or _
            Option2Cost = -1 Or _
            CodeCost = -1 Or _
            Not IsQuotable() Then
            ListPrice = -1
        Else
            ListPrice = BaseCost + SheathTermCost + _
                        TubeCost + MICost + _
                        LeadwireCost + LeadwireTermCost + FlexCost + _
                        FittingCost + _
                        SanitaryCost + InsertionProbeCost + ThermowellAssemblyCost + ThermowellCost + QuickConnectCost + ExtensionCost + _
                        Option1Cost + Option2Cost + CodeCost
        End If

    End Function






    ''--------------------------
    ''COST PROPERTIES ----------
    ''--------------------------
    Private pQuoteError As String
    Public Property QuoteError As String
        Get
            Return pQuoteError
        End Get
        Set(value As String)
            pQuoteError = value
        End Set
    End Property

    Private pBaseCost As Double
    Public Property BaseCost As Double
        Get
            Return pBaseCost
        End Get
        Set(value As Double)
            pBaseCost = value
        End Set
    End Property

    Private pSheathTermCost As Double
    Public Property SheathTermCost As Double
        Get
            Return pSheathTermCost
        End Get
        Set(value As Double)
            pSheathTermCost = value
        End Set
    End Property

    Private pSanitaryCost As Double
    Public Property SanitaryCost As Double
        Get
            Return pSanitaryCost
        End Get
        Set(value As Double)
            pSanitaryCost = value
        End Set
    End Property

    Private pInsertionProbeCost As Double
    Public Property InsertionProbeCost As Double
        Get
            Return pInsertionProbeCost
        End Get
        Set(value As Double)
            pInsertionProbeCost = value
        End Set
    End Property

    Private pQuickConnectCost As Double
    Public Property QuickConnectCost As Double
        Get
            Return pQuickConnectCost
        End Get
        Set(value As Double)
            pQuickConnectCost = value
        End Set
    End Property

    Private pThermowellAssemblyCost As Double
    Public Property ThermowellAssemblyCost As Double
        Get
            Return pThermowellAssemblyCost
        End Get
        Set(value As Double)
            pThermowellAssemblyCost = value
        End Set
    End Property

    Private pThermowellCost As Double
    Public Property ThermowellCost As Double
        Get
            Return pThermowellCost
        End Get
        Set(value As Double)
            pThermowellCost = value
        End Set
    End Property

    Private pMICost As Double
    Public Property MICost As Double
        Get
            Return pMICost
        End Get
        Set(value As Double)
            pMICost = value
        End Set
    End Property

    Private pTubeCost As Double
    Public Property TubeCost As Double
        Get
            Return pTubeCost
        End Get
        Set(value As Double)
            pTubeCost = value
        End Set
    End Property

    Private pLeadwireTermCost As Double
    Public Property LeadwireTermCost As Double
        Get
            Return pLeadwireTermCost
        End Get
        Set(value As Double)
            pLeadwireTermCost = value
        End Set
    End Property

    Private pLeadwireCost As Double
    Public Property LeadwireCost As Double
        Get
            Return pLeadwireCost
        End Get
        Set(value As Double)
            pLeadwireCost = value
        End Set
    End Property

    Private pFlexCost As Double
    Public Property FlexCost As Double
        Get
            Return pFlexCost
        End Get
        Set(value As Double)
            pFlexCost = value
        End Set
    End Property

    Private pFittingCost As Double
    Public Property FittingCost As Double
        Get
            Return pFittingCost
        End Get
        Set(value As Double)
            pFittingCost = value
        End Set
    End Property

    Private pExtensionCost As Double
    Public Property ExtensionCost As Double
        Get
            Return pExtensionCost
        End Get
        Set(value As Double)
            pExtensionCost = value
        End Set
    End Property

    Private pOption1Cost As Double
    Public Property Option1Cost As Double
        Get
            Return pOption1Cost
        End Get
        Set(value As Double)
            pOption1Cost = value
        End Set
    End Property

    Private pOption2Cost As Double
    Public Property Option2Cost As Double
        Get
            Return pOption2Cost
        End Get
        Set(value As Double)
            pOption2Cost = value
        End Set
    End Property

    Private pCodeCost As Double
    Public Property CodeCost As Double
        Get
            Return pCodeCost
        End Get
        Set(value As Double)
            pCodeCost = value
        End Set
    End Property

    Private pListPrice As Double
    Public Property ListPrice As Double
        Get
            Return pListPrice
        End Get
        Set(value As Double)
            pListPrice = value
        End Set
    End Property

    Public Shared ReadOnly Property BaseCostTypeRef As Integer
        Get
            Return 1
        End Get
    End Property
    Public Shared ReadOnly Property SheathTerminationCostTypeRef As Integer
        Get
            Return 2
        End Get
    End Property
    Public Shared ReadOnly Property LeadwireTerminationCostTypeRef As Integer
        Get
            Return 3
        End Get
    End Property
    Public Shared ReadOnly Property SanitaryCostTypeRef As Integer
        Get
            Return 4
        End Get
    End Property
    Public Shared ReadOnly Property InsertionProbeCostTypeRef As Integer
        Get
            Return 5
        End Get
    End Property
    Public Shared ReadOnly Property ThermowellAssemblyCostTypeRef As Integer
        Get
            Return 6
        End Get
    End Property

    Public Shared ReadOnly Property QuickConnectCostTypeRef As Integer
        Get
            Return 7
        End Get
    End Property

    Public Shared ReadOnly Property ExtensionCostTypeRef As Integer
        Get
            Return 8
        End Get
    End Property

    Public Shared ReadOnly Property SpecialOptionRef As Integer
        Get
            Return 22
        End Get
    End Property


    ''---------------------------------
    ''PART NUMBER PROPERTIES ----------
    ''---------------------------------
    Private pPartNumber As String
    Public Property PartNumber As String
        Get
            If InStr(pPartNumber, " ") > 0 Then
                pCode = Mid(StringFunctions.ParseString(pPartNumber, 1, " "), 2, 3)
                pPartNumber = StringFunctions.ParseString(pPartNumber, 0, " ")
            End If
            Return pPartNumber.ToString.ToUpper
        End Get
        Set(value As String)
            pPartNumber = value
        End Set
    End Property

    Private pBuildParse As String
    Public Property BuildParse As String
        Get
            Select Case True
                Case IsRTDInsertionProbe()
                    pBuildParse = "RD" & StringFunctions.ParseString(PartNumber, 1, "-")
                Case IsTCInsertionProbe()
                    pBuildParse = "PD" & StringFunctions.ParseString(PartNumber, 1, "-")
                Case IsQuickConnect()
                    pBuildParse = "RB" & StringFunctions.ParseString(PartNumber, 1, "-")
                Case Else
                    pBuildParse = StringFunctions.ParseString(PartNumber, 0, "-")
            End Select
            Return pBuildParse
        End Get
        Set(value As String)
            pBuildParse = value
        End Set
    End Property

    Private pSheathParse As String
    Public Property SheathParse As String
        Get
            Dim OD As String
            Dim len As String
            Dim par As String
            Dim wellLenPosition As Integer

            Select Case True
                Case HasThermowell()
                    If (StringFunctions.ParseString(PartNumber, 2, "-").Chars(2).ToString = "2") Then
                        OD = "K"
                    Else
                        OD = "N"
                    End If
                    If StringFunctions.ParseString(PartNumber, 2, "-").Substring(0, 1) = "F" Then
                        wellLenPosition = 3
                    Else
                        wellLenPosition = 4
                    End If
                    len = Mid((Math.Ceiling(CDec(StringFunctions.ParseString(PartNumber, 1, "-").Substring(1, 2) * 1) + (StringFunctions.ParseString(PartNumber, wellLenPosition, "-") * 0.1)) * 0.01), 3, 2).ToString
                    pSheathParse = OD & "W" & len & "A"
                Case IsRTDWell(), IsMgOWell()
                    par = StringFunctions.ParseString(PartNumber, 2, "-")
                    pSheathParse = par.Chars(0) & "W" & par.Substring(1, 3)
                Case IsReducedStemSanitary()
                    par = StringFunctions.ParseString(PartNumber, 1, "-")
                    pSheathParse = par.Chars(0) & par.Substring(2, 4)
                Case IsInsertionProbe()
                    par = StringFunctions.ParseString(PartNumber, 2, "-")
                    pSheathParse = par.Chars(1) & "T" & par.Substring(2, 3)
                Case IsPlastics(), IsPlasticsRTD()
                    par = StringFunctions.ParseString(PartNumber, 1, "-")
                    pSheathParse = par.Chars(0) & "W" & par.Substring(1, 3)
                Case IsQuickConnect()
                    pSheathParse = StringFunctions.ParseString(PartNumber, 2, "-")
                Case Else
                    pSheathParse = StringFunctions.ParseString(PartNumber, 1, "-")
            End Select
            Return pSheathParse
        End Get
        Set(value As String)
            pSheathParse = value
        End Set
    End Property

    Private pReducedSheathOD As String
    Public Property ReducedSheathOD As String
        Get
            If IsReducedStemSanitary() Then
                pReducedSheathOD = StringFunctions.ParseString(PartNumber, 1, "-").Chars(0)
            End If
            Return pReducedSheathOD
        End Get
        Set(value As String)
            pReducedSheathOD = value
        End Set
    End Property

    Private pLeadwireParse As String
    Public Property LeadwireParse As String
        Get
            If IsLeadwireStyle() Then
                Select Case True
                    Case IsRTD(), IsMgO(), IsInsertionProbe()
                        pLeadwireParse = StringFunctions.ParseString(PartNumber, 3, "-")
                    Case IsPlastics(), IsPlasticsRTD()
                        pLeadwireParse = StringFunctions.ParseString(PartNumber, 2, "-")
                    Case IsExtension()
                        pLeadwireParse = StringFunctions.ParseString(PartNumber, 2, "-")
                End Select
            End If
            Return pLeadwireParse
        End Get
        Set(value As String)
            pLeadwireParse = value
        End Set
    End Property

    Private pFittingParse As String
    Public Property FittingParse As String
        Get
            pFittingParse = "00"
            Select Case True
                Case ((IsRTD() Or IsMgO()) And SheathTermination <> "A") And (Not IsThermowellAssembly() And Not IsInsertionProbe() And Not IsQuickConnect() And Not IsSanitary())
                    pFittingParse = StringFunctions.ParseString(PartNumber, 2, "-")
                Case IsPlastics() And Not (IsInsertionProbe()), IsPlasticsRTD(), IsQuickConnect()
                    Try
                        pFittingParse = StringFunctions.ParseString(PartNumber, 3, "-").ToString.ToUpper
                        'determines if a fitting or a code
                        If pFittingParse.Length < 2 Or pFittingParse.Chars(0) = "Q" Then
                            pFittingParse = "00"
                        End If
                    Catch ex As Exception

                    End Try
            End Select
            If pFittingParse = "47" And (IsRTD() Or IsMgO()) And (SheathTermination = "T" Or _
                                            SheathTermination = "W" Or _
                                            SheathTermination = "1" Or _
                                            SheathTermination = "2" Or _
                                            SheathTermination = "4" Or _
                                            SheathTermination = "5" Or _
                                            SheathTermination = "6" Or _
                                            SheathTermination = "7" Or _
                                            SheathTermination = "8") Then
                pFittingParse = "65"
            End If

            If IsQuickConnect() Then
                Dim fittingSub As String
                fittingSub = pFittingParse.Substring(0, 1)

                If fittingSub = "1" Or fittingSub = "2" Or fittingSub = "3" Then
                    pFittingParse = "QC-COMP"
                ElseIf fittingSub = "6" Then
                    pFittingParse = "QC-" & pFittingParse
                End If
            End If

            Return pFittingParse
        End Get
        Set(value As String)
            pFittingParse = value
        End Set
    End Property

    Private pOption1Parse As String
    Public Property Option1Parse As String
        Get
            Dim par As Integer
            If IsLeadwireStyle() Then
                Select Case True
                    Case IsRTD(), IsMgO(), IsInsertionProbe()
                        par = 4
                    Case IsExtension()
                        par = 3
                    Case IsPlastics(), IsPlasticsRTD()
                        If HasFitting() Or HasNozzleBolt() Then par = 4 Else par = 3
                End Select
            Else
                Select Case True
                    Case HasThermowell()
                        par = 6
                    Case IsQuickConnect()
                        par = -1
                    Case IsRTD(), IsMgO()
                        If IsSanitaryWell() Then
                            par = 4
                        Else
                            par = 3
                        End If
                End Select
            End If
            Try
                pOption1Parse = StringFunctions.ParseString(PartNumber, par, "-")
            Catch ex As Exception
                pOption1Parse = ""
            End Try
            Return pOption1Parse
        End Get
        Set(value As String)
            pOption1Parse = value
        End Set
    End Property

    Private pOption2Parse As String
    Public Property Option2Parse As String
        Get
            Dim par As Integer
            If IsLeadwireStyle() Then
                Select Case True
                    Case IsRTD(), IsMgO(), IsInsertionProbe()
                        par = 5
                    Case IsExtension()
                        par = 4
                    Case IsPlastics(), IsPlasticsRTD()
                        If HasFitting() Or HasNozzleBolt() Then par = 5 Else par = 4
                End Select
            Else
                Select Case True
                    Case HasThermowell()
                        par = 7
                    Case IsQuickConnect()
                        par = -1
                    Case IsRTD(), IsMgO()
                        par = 4
                End Select
            End If
            Try
                pOption2Parse = StringFunctions.ParseString(PartNumber, par, "-")
            Catch ex As Exception
                pOption2Parse = ""
            End Try
            Return pOption2Parse
        End Get
        Set(value As String)
            pOption2Parse = value
        End Set
    End Property


    ''BUILD PARSE ELEMENTS ---------
    Private pSheathTermination As String
    Public Property SheathTermination As String
        Get
            pSheathTermination = BuildParse.Chars(1)
            Return pSheathTermination
        End Get
        Set(value As String)
            pSheathTermination = value
        End Set
    End Property

    Private pElement As String
    Public Property Element As String
        Get
            pElement = BuildParse.Substring(2, 2)
            Return pElement
        End Get
        Set(value As String)
            pElement = value
        End Set
    End Property

    Private pTemperature As String
    Public Property Temperature As String
        Get
            pTemperature = BuildParse.Chars(4)
            Return pTemperature
        End Get
        Set(value As String)
            pTemperature = value
        End Set
    End Property

    Private pCalibration As String
    Public Property Calibration As String
        Get
            Select Case True
                Case IsTCExtension()
                    pCalibration = PartNumber.Chars(0)
                Case IsRTD(), IsPlasticsRTD(), IsRTDExtension()
                    pCalibration = "U"
                Case Else
                    pCalibration = BuildParse.Chars(2)
            End Select

            Return pCalibration
        End Get
        Set(value As String)
            pCalibration = value
        End Set
    End Property

    Private pMIType As String
    Public Property MIType As String
        Get
            Select Case True
                Case IsMgO()
                    pMIType = BuildParse.Chars(3)
                Case IsHighTemp()
                    pMIType = "0"
            End Select
            Return pMIType
        End Get
        Set(value As String)
            pMIType = value
        End Set
    End Property


    ''SHEATH PARSE ELEMENTS ----------
    Private pSheathOD As String
    Public Property SheathOD As String
        Get
            pSheathOD = SheathParse.Chars(0)
            Return pSheathOD
        End Get
        Set(value As String)
            pSheathOD = value
        End Set
    End Property

    Private pSheathMaterial As String
    Public Property SheathMaterial As String
        Get
            pSheathMaterial = SheathParse.Chars(1)
            Return pSheathMaterial
        End Get
        Set(value As String)
            pSheathMaterial = value
        End Set
    End Property

    Private pSheathLength As Decimal
    Public Property SheathLength As Decimal
        Get
            Dim len As String = SheathParse.Substring(2, 2)
            Dim fracLen As String = SheathParse.Chars(4)
            Dim fracLenToDecimal As Integer = CatalogConversion.SheathFractionalLengthToDecimal(fracLen)

            If fracLenToDecimal = -1 Then
                pSheathLength = -1
            Else
                pSheathLength = CDec(len * 1) + fracLenToDecimal
            End If

            Return pSheathLength
        End Get
        Set(value As Decimal)
            pSheathLength = value
        End Set
    End Property


    ''LEADWIRE PARSE ELEMENTS ----------
    Private pLeadwireCode As String
    Public Property LeadwireCode As String
        Get
            If Not IsLeadwireStyle() Then
                If Temperature = "L" Then
                    pLeadwireCode = "M"
                Else
                    pLeadwireCode = "D"
                End If
            Else
                If HasCoilCord() Then
                    pLeadwireCode = "CC"
                Else
                    On Error Resume Next
                    pLeadwireCode = LeadwireParse.Chars(0)
                End If
            End If
            Return pLeadwireCode
        End Get
        Set(value As String)
            pLeadwireCode = value
        End Set
    End Property

    Private pLeadwireLength As Long
    Public Property LeadwireLength As Long
        Get
            If IsNothing(LeadwireParse) Then
                pLeadwireLength = 0
            ElseIf HasCoilCord() Then
                pLeadwireLength = CLng(LeadwireParse.Substring(2, 2))
            Else
                pLeadwireLength = CLng(LeadwireParse.Substring(1, 3))
            End If

            If HasTubing() Then
                pLeadwireLength = pLeadwireLength + SheathLength
            End If
            Return pLeadwireLength
        End Get
        Set(value As Long)
            pLeadwireLength = value
        End Set
    End Property

    Private pLeadwireBeyondFlexLength As Long
    Public Property LeadwireBeyondFlexLength As Long
        Get
            If HasFlex() Then
                Try
                    If LeadwireParse.Contains("(") Then
                        pLeadwireBeyondFlexLength = CLng(LeadwireParse.Substring(5, 3))
                    Else
                        pLeadwireBeyondFlexLength = 4
                    End If
                Catch ex As Exception
                    pLeadwireBeyondFlexLength = 0
                End Try
            End If
            Return pLeadwireBeyondFlexLength
        End Get
        Set(value As Long)
            pLeadwireBeyondFlexLength = value
        End Set
    End Property

    Private pFlexLength As Long
    Public Property FlexLength As Long
        Get
            pFlexLength = LeadwireLength
            Return pFlexLength
        End Get
        Set(value As Long)
            pFlexLength = value
        End Set
    End Property

    Private pLeadwireTermination As String
    Public Property LeadwireTermination As String
        Get
            If LeadwireParse.Chars(4) = "(" Then
                Select Case True
                    Case LeadwireParse.Chars(9) = ")"
                        pLeadwireTermination = LeadwireParse.Substring(5, 4)
                    Case LeadwireParse.Chars(9) = "("
                        pLeadwireTermination = LeadwireParse.Substring(10, 4)
                    Case Else
                        pLeadwireTermination = LeadwireParse.Substring(9)

                End Select
            Else
                pLeadwireTermination = LeadwireParse.Chars(4)
            End If
                Return pLeadwireTermination
        End Get
        Set(value As String)
            pLeadwireTermination = value
        End Set
    End Property


    Private pFitting As String
    Public Property Fitting As String
        Get
            pFitting = FittingParse
            Return pFitting
        End Get
        Set(value As String)
            pFitting = value
        End Set
    End Property

    Private pOption1 As String
    Public Property Option1 As String
        Get
            pOption1 = Option1Parse
            Return pOption1
        End Get
        Set(value As String)
            pOption1 = value
        End Set
    End Property

    Private pOption2 As String
    Public Property Option2 As String
        Get
            pOption2 = Option2Parse
            Return pOption2
        End Get
        Set(value As String)
            pOption2 = value
        End Set
    End Property

    'CODE IS SET IN PARTNUMBER PROPERTY
    Private pCode As String
    Public Property Code As String
        Get
            Return pCode
        End Get
        Set(value As String)
            pCode = value
        End Set
    End Property


    Private pWireCount As Integer
    Public Property WireCount As Integer
        Get
            Dim wireCountCode As String = Left(Element, 1)
            Select Case True
                Case IsRTD() Or IsQuickConnect() Or IsPlasticsRTD()
                    Select Case wireCountCode
                        Case "A", "F", "K"
                            pWireCount = 2
                        Case "B", "G", "L"
                            pWireCount = 3
                        Case "D", "C", "H", "M"
                            pWireCount = 4
                        Case "E"
                            pWireCount = 6
                    End Select
                Case IsMgO()
                    Select Case MIType
                        Case "0", "1", "2", "3"
                            pWireCount = 2
                        Case "4", "5", "6", "7"
                            pWireCount = 4
                    End Select
                Case IsPlastics() And (Not (IsInsertionProbe()))
                    Select Case PartNumber.Chars(3).ToString
                        Case "0"
                            pWireCount = 2
                        Case "4"
                            pWireCount = 4
                    End Select
                Case (IsThermocouple() And IsInsertionProbe())
                    pWireCount = 2
                Case IsExtension()
                    Select Case PartNumber.Chars(1).ToString
                        Case 0
                            pWireCount = 2
                        Case Else
                            pWireCount = CInt(PartNumber.Chars(1).ToString)
                    End Select
            End Select
            Return pWireCount
        End Get
        Set(value As Integer)
            pWireCount = value
        End Set
    End Property


    ''----------------------------
    ''BOOLEAN FUNCTIONS ----------
    ''----------------------------

    Public Function IsRTD() As Boolean
        Dim code As String = PartNumber.Chars(0).ToString.ToUpper
        IsRTD = (code = "R" And Not IsExtension()) Or IsQuickConnect() Or (IsInsertionProbe() And Not (PartNumber.Substring(0, 3) = "TIP"))
    End Function

    Public Function IsRTDWell() As Boolean
        IsRTDWell = IsRTD() And IsNumeric(StringFunctions.ParseString(PartNumber, 1, "-").Chars(0))
    End Function

    Public Function IsMgO() As Boolean
        Dim code As String = PartNumber.Chars(0).ToString.ToUpper
        IsMgO = code = "M" And Not IsInsertionProbe()
    End Function

    Public Function IsMgOWell() As Boolean
        IsMgOWell = IsMgO() And IsNumeric(StringFunctions.ParseString(PartNumber, 1, "-").Chars(0))
    End Function

    Public Function IsPlastics() As Boolean
        IsPlastics = PartNumber.Chars(0).ToString.ToUpper = "P" Or (IsInsertionProbe() And (PartNumber.Substring(0, 3) = "TIP"))
    End Function

    Public Function IsPlasticsRTD() As Boolean
        IsPlasticsRTD = PartNumber.Chars(0).ToString.ToUpper = "F"
    End Function

    Public Function IsSanitary() As Boolean
        Dim parse_3 = StringFunctions.ParseString(PartNumber, 2, "-")
        IsSanitary = IsRTD() And ((parse_3.Chars(0) = "A" And parse_3.Length = 2) Or parse_3 = "TR")
    End Function

    Public Function IsInsertionProbe() As Boolean
        Dim parse_1 = PartNumber.Substring(0, 3)
        IsInsertionProbe = parse_1 = "RIP" Or _
                           parse_1 = "TIP" Or _
                           parse_1 = "MIP"
    End Function

    Public Function IsRTDInsertionProbe() As Boolean
        IsRTDInsertionProbe = IsRTD() And IsInsertionProbe()
    End Function

    Public Function IsTCInsertionProbe() As Boolean
        Dim parse_1 = PartNumber.Substring(0, 3)
        IsTCInsertionProbe = IsPlastics() And IsInsertionProbe()
    End Function

    Public Function IsQuickConnect() As Boolean
        IsQuickConnect = PartNumber.Substring(0, 2) = "QC"
    End Function

    Public Function IsExtension() As Boolean
        IsExtension = PartNumber.Substring(2, 3) = "EXT"
    End Function

    Public Function IsRTDExtension() As Boolean
        IsRTDExtension = IsExtension() And (PartNumber.Chars(0).ToString.ToUpper = "R" Or PartNumber.Chars(0).ToString.ToUpper = "Q")
    End Function
    Public Function IsTCExtension() As Boolean
        IsTCExtension = IsExtension() And (Not IsRTDExtension())
    End Function

    Public Function IsThermocouple() As Boolean
        IsThermocouple = IsMgO() Or IsMgOWell() Or IsPlastics() Or IsTCExtension() Or IsTCInsertionProbe()
    End Function

    Public Function IsThermowellAssembly() As Boolean
        IsThermowellAssembly = IsRTDWell() Or IsMgOWell()
    End Function

    Public Function IsTransitionStyle() As Boolean
        IsTransitionStyle = False
        Select Case SheathTermination
            Case "D", "E", "F", "G"
                IsTransitionStyle = True
        End Select
    End Function

    Public Function IsLeadwireStyle() As Boolean
        IsLeadwireStyle = False
        If Not IsQuickConnect() And Not IsExtension() Then
            Select Case SheathTermination
                Case "B", "C", "D", "E", "F", "G"
                    IsLeadwireStyle = True
            End Select
        End If
        IsLeadwireStyle = IsLeadwireStyle Or IsPlastics() Or IsPlasticsRTD() Or IsExtension() Or IsInsertionProbe()
    End Function

    Public Function IsSanitaryWell() As Boolean
        IsSanitaryWell = IsSanitary() And StringFunctions.ParseString(PartNumber, 3, "-") = "SW"
    End Function

    Public Function IsUngrounded() As Boolean
        IsUngrounded = BuildParse.Chars(4) = "U" And IsThermocouple()
    End Function

    Public Function HasTeflon() As Boolean
        HasTeflon = False
        Select Case LeadwireCode
            Case "1", "2", "M", "N", "O", "P", "J", "K", "L", "5", "6", "7"
                HasTeflon = True
        End Select
    End Function

    Public Function HasFiberglass() As Boolean
        HasFiberglass = False
        Select Case LeadwireCode
            Case "D", "E", "F", "8", "9", "A", "B", "C", "G", "H", "I"
                HasFiberglass = True
        End Select
    End Function
    Public Function HasCoilCord() As Boolean
        On Error Resume Next
        HasCoilCord = IsExtension() And StringFunctions.ParseString(PartNumber, 2, "-").Substring(0, 2) = "CC"
    End Function

    Public Function IsHighTemp() As Boolean
        IsHighTemp = Temperature = "H"
    End Function

    Public Function IsDual() As Boolean
        IsDual = IsThermocouple() And (WireCount > 2)
    End Function

    Public Function IsDuplex() As Boolean
        IsDuplex = IsRTD() And (Element.Substring(0, 1) = "D" Or Element.Substring(0, 1) = "E")
    End Function

    Public Function HasThermowell() As Boolean
        HasThermowell = IsThermowellAssembly() And StringFunctions.ParseString(PartNumber, 2, "-").Length = 3
    End Function

    Public Function HasFlex() As Boolean
        HasFlex = False
        Select Case LeadwireCode
            Case "N", "8", "E", "T", "K", "5", "R", "B", "H"
                HasFlex = True
        End Select
    End Function

    Public Function HasTubing() As Boolean
        HasTubing = Not HasMI() And _
                    Not IsExtension() And _
                    Not (IsPlasticsRTD() And SheathTermination = "K") And _
                    Not (IsPlastics() And (SheathTermination = "K" Or SheathTermination = "J" Or SheathTermination = "L" Or SheathTermination = "U"))
    End Function

    Public Function HasFitting() As Boolean
        HasFitting = Not Fitting = "00"
    End Function

    Public Function HasMI() As Boolean
        HasMI = IsMgO() Or (IsRTD() And IsHighTemp())
    End Function

    Public Function HasOption1() As Boolean
        HasOption1 = Not IsNothing(Option1)
    End Function

    Public Function HasOption2() As Boolean
        HasOption2 = Not IsNothing(Option2)
    End Function

    Public Function HasCode() As Boolean
        HasCode = Not IsNothing(Code)
    End Function
    Public Function HasNozzleBolt() As Boolean
        HasNozzleBolt = SheathTermination = "R" And (IsPlastics() Or IsPlasticsRTD())
    End Function

    Public Function IsStraightStemSanitary() As Boolean
        IsStraightStemSanitary = IsSanitary() And StringFunctions.ParseString(PartNumber, 1, "-").Substring(1, 1) = "W"
    End Function

    Public Function IsReducedStemSanitary() As Boolean
        IsReducedStemSanitary = IsSanitary() And StringFunctions.ParseString(PartNumber, 1, "-").Substring(2, 1) = "W"
    End Function

    Public Function IsThermowellSanitary() As Boolean
        IsThermowellSanitary = IsSanitary() And StringFunctions.ParseString(PartNumber, 1, "-").Substring(0, 2) = "OW"
    End Function

    Public Function IsThermometerReplacement() As Boolean
        IsThermometerReplacement = IsSanitary() And StringFunctions.ParseString(PartNumber, 2, "-") = "TR"
    End Function

    ''---------------------
    ''COST CODES ----------
    ''---------------------

    Public Function BaseCostCode() As String
        Select Case True
            Case (IsRTD() And Not IsPlasticsRTD()) Or IsQuickConnect()
                BaseCostCode = "RB" & Element & Temperature
                If IsHighTemp() Then
                    BaseCostCode = BaseCostCode & "-" & SheathOD
                End If
            Case IsMgO()
                BaseCostCode = "MB" & Calibration & (WireCount - 2) * 2 & "G" & "-" & SheathOD
            Case IsPlastics()
                BaseCostCode = "P" & SheathTermination & Calibration & (WireCount - 2) * 2 & "G"
            Case IsPlasticsRTD()
                BaseCostCode = "F" & SheathTermination & Element & Temperature
            Case IsInsertionProbe() And IsThermocouple()
                BaseCostCode = "P" & SheathTermination & Calibration & (WireCount - 2) * 2 & "G"
            Case IsExtension()
                BaseCostCode = "EXT"
        End Select
    End Function

    Public Function SheathTermCostCode() As String
        Select Case True
            Case IsRTD() And Not IsPlasticsRTD()
                SheathTermCostCode = "R" & SheathTermination & "-" & WireCount & Temperature
            Case IsPlasticsRTD()
                SheathTermCostCode = "F" & SheathTermination & "-" & WireCount & Temperature
            Case IsMgO()
                SheathTermCostCode = "M" & SheathTermination & "-" & WireCount & Calibration
            Case IsPlastics()
                SheathTermCostCode = "P" & SheathTermination & "-" & WireCount & Calibration
            Case Else
                SheathTermCostCode = ""
        End Select
    End Function

    Public Function LeadwireTermCostCode() As String
        Select Case True
            Case IsRTD(), IsPlasticsRTD(), (IsExtension() And Not IsThermocouple())
                LeadwireTermCostCode = "R" & LeadwireTermination & "-" & WireCount
            Case IsMgO()
                LeadwireTermCostCode = "M" & LeadwireTermination & "-" & WireCount & Calibration
            Case IsPlastics(), (IsInsertionProbe() And IsThermocouple()), (IsExtension() And IsThermocouple())
                LeadwireTermCostCode = "P" & LeadwireTermination & "-" & WireCount & Calibration
            Case Else
                LeadwireTermCostCode = ""
        End Select
    End Function

    Public Function SanitaryCode() As String
        Dim CIPType As String = ""
        Select Case True
            Case IsStraightStemSanitary() Or IsThermometerReplacement()
                CIPType = "S"
            Case IsReducedStemSanitary()
                CIPType = "R"
            Case IsThermowellSanitary()
                CIPType = "T"
        End Select
        SanitaryCode = CIPType & "-" & StringFunctions.ParseString(PartNumber, 2, "-")
    End Function

    Public Function ThermowellAssemblyCode() As String
        ThermowellAssemblyCode = PartNumber.Chars(0) & "-" & PartNumber.Substring(6, 4)
    End Function

    Public Function QuickConnectCode() As String
        QuickConnectCode = "QCA-" & PartNumber.Chars(17).ToString.ToUpper
    End Function

    Public Function ThermowellPartNumber() As String
        ThermowellPartNumber = "15-" & _
                               StringFunctions.ParseString(PartNumber, 2, "-") & "-" & _
                               StringFunctions.ParseString(PartNumber, 3, "-") & "-" & _
                               StringFunctions.ParseString(PartNumber, 4, "-") & "-" & _
                               StringFunctions.ParseString(PartNumber, 5, "-")
    End Function

    Public Function InsertionProbeCode() As String
        InsertionProbeCode = StringFunctions.ParseString(PartNumber, 0, "-") & "-" & Mid(StringFunctions.ParseString(PartNumber, 2, "-"), 1, 1)
    End Function

    ''-----------------------
    ''PRIMARY KEYS ----------
    ''-----------------------
    Public Shared Function GetPrimaryKey(ByVal code As String, ByVal costType As Long) As Long
        Dim dc As New QPriceDataClassesDataContext
        GetPrimaryKey = (From b In dc.CostUps
                            Where b.CostUpCode = code And b.CostType_ID = costType
                           Select b.CostUpID).Single
    End Function
    Public Function BasePrimaryKey(BaseCostCode As String) As Long
        BasePrimaryKey = GetPrimaryKey(BaseCostCode, BaseCostTypeRef)
    End Function
    Public Function SheathTerminationPrimaryKey(SheathTermCostCode As String) As Long
        SheathTerminationPrimaryKey = GetPrimaryKey(SheathTermCostCode, SheathTerminationCostTypeRef)
    End Function
    Public Function LeadwireTerminationPrimaryKey(LeadwireTermCostCode As String) As Long
        LeadwireTerminationPrimaryKey = GetPrimaryKey(LeadwireTermCostCode, LeadwireTerminationCostTypeRef)
    End Function


    Public Function IsQuotable() As Boolean
        Dim dc As New QPriceDataClassesDataContext
        Dim roles As String() = System.Web.Security.Roles.GetRolesForUser()
        Dim quotable As Boolean = True
        Dim err As String = ""
        'Dim isAdmin As Boolean = roles(0) = "Administrator"

        'DISPLAYS "CONSULT FACTORY" ON BELOW CRITERIA

        'singles can not be more than 60 inches
        If (LeadwireCode = "1" Or LeadwireCode = "9") Then
            Dim lw As Long
            If HasTubing() Then
                lw = LeadwireLength - SheathLength
            Else
                lw = LeadwireLength
            End If
            If lw > 60 Then
                quotable = False
                err = "Single leadwire must be 60 inches or less.  Call for quote on longer lengths </br>"
            End If
        End If

        'only high temp bulk material "RA"
        If (SheathTermination = "A" And (Temperature = "L" Or Temperature = "M") And Not IsPlasticsRTD()) Then
            quotable = False
            err = err & "Bulk material is availble in 'H' Series only. <br />"
        End If

        'not dual Plastics RTDs
        If (IsPlasticsRTD() And WireCount >= 4) Then
            quotable = False
            err = err & "Plastic style RTDs are not available in a duplex construction. <br />"
        End If

        'not low temperature probe with fiberglass
        If (Temperature = "L" And HasFiberglass() And IsLeadwireStyle()) Then
            quotable = False
            err = err & "Fiberglass wire is not available in an 'L' Series construction. <br />"
        End If

        'not medium temperature with teflon unless it has a transition
        If (Temperature = "M" And HasTeflon() And Not (IsTransitionStyle())) Then
            quotable = False
            err = err & "Teflon wire is only availble in 'M' Series probes with transitions. <br />"
        End If

        'not medium temperature duplex
        If (IsRTD() And Temperature = "M" And IsDuplex()) Then
            If (SheathOD <> "I" And SheathOD <> "K" And SheathOD <> "N") Then
                quotable = False
                err = err & "Duplex construction is not available with 'M' Series probes. <br />"
            End If
        End If

        'RTD high temp transition must have fiberglass wire. TM-6/2/16
        If (IsRTD() And (SheathTermination = "E" Or SheathTermination = "G") And Not (HasFiberglass())) Then
            quotable = False
            err = err & "High Temperature Transition Styles must use fiberglass wire <br />"
        End If

        'RTD "MB" must have a fitting
        If (IsMgO() And SheathTermination = "B" And Not (HasFitting())) Then
            quotable = False
            err = err & "'MB' style probes must have a sheath fitting <br />"
        End If

        If HasTubing() Or HasMI() Then
            'no teflon over 48"
            If (Option1 = "T" Or Option2 = "T") Then
                If (SheathLength > 48) Then
                    quotable = False
                    err = err & "Please consult factory for teflon sheath over 48"" <br />"
                End If
            End If
            'no sheath diameter .040" or less
            If (SheathOD = "D") Then
                    quotable = False
                    err = err & "Please consult factory for any sheath diameter .040"" or less. <br />"
                End If
                'no sheath diameter .500" unless sanitary
                If (SheathOD = "O" And Not (IsSanitary())) Then
                    quotable = False
                    err = err & "Please consult factory for any sheath diameter of .500"" or higher. <br />"
                End If
                'not spring loaded hex unless 1/4" OD Sheath
                If ((Fitting = "56" Or Fitting = "57") And (SheathOD <> "K")) Then
                    quotable = False
                    err = err & "Spring Loaded Hex Nipples are only available with a 1/4"" sheath diameter. <br />"
                End If
                'no sheath OD less than 3/16" on dual plastics with fiberglass
                If ((IsPlastics() Or IsPlasticsRTD()) And WireCount > 2 And HasFiberglass() And (SheathOD = "G" Or SheathOD = "E" Or SheathOD = "D")) Then
                    quotable = False
                    err = err & "Dual Plastic Style Probes are not available with sheath diameters less than 3/16"". <br />"
                End If
                'no plastics with term "A", "B", or "C" without sheath OD of 3/16"
                If ((IsPlastics() Or IsPlasticsRTD()) And SheathOD <> "I" And (SheathTermination = "A" Or SheathTermination = "B" Or SheathTermination = "C")) Then
                    quotable = False
                    err = err & "Adjustable Plastics are only available with a 3/16"" OD sheath. <br />"
                End If

                'no plastics with term "M", "N", or "O" without sheath OD of 1/8" or 3/16"
                If ((IsPlastics() Or IsPlasticsRTD()) And (SheathOD <> "G" And SheathOD <> "I") And (SheathTermination = "M" Or SheathTermination = "N" Or SheathTermination = "O")) Then
                    quotable = False
                    err = err & "Melt Bolts are only available with a sheath OD of 1/8"" or 3/16"". <br />"
                End If

                'no plastics with term "R" without sheath OD of 1/8"
                If ((IsPlastics() Or IsPlasticsRTD()) And SheathOD <> "G" And SheathTermination = "R") Then
                    quotable = False
                    err = err & "Nozzle Bolts are only available with a sheath OD of 1/8"". <br />"

                End If
            End If

            'IsQuotable = isAdmin Or quotable
            IsQuotable = quotable
        QuoteError = err
    End Function

    Public Sub SetBaseCost()
        Dim ungroundedAdder As Decimal

        If IsUngrounded() Then
            If IsDual() Then
                ungroundedAdder = 4.0
            Else
                ungroundedAdder = 2.0
            End If
        Else
            ungroundedAdder = 0
        End If

        Try
            If IsExtension() Then
                BaseCost = 0
            Else
                BaseCost = GetBaseCost(GetPrimaryKey(BaseCostCode, BaseCostTypeRef)) + ungroundedAdder
            End If
        Catch ex As Exception
            BaseCost = -1
        End Try

    End Sub

    Public Sub SetSheathTerminationCost()
        SheathTermCost = 0
        If Not IsInsertionProbe() And Not IsPlastics() And Not IsPlasticsRTD() And Not IsQuickConnect() And Not IsExtension() Then
            Try
                SheathTermCost = GetBaseCost(GetPrimaryKey(SheathTermCostCode, SheathTerminationCostTypeRef))
            Catch ex As Exception
                SheathTermCost = -1
            End Try
        End If
    End Sub

    Public Sub SetFittingCost()
        Try
            FittingCost = GetFittingCost(Fitting)
        Catch ex As Exception
            FittingCost = -1
        End Try

    End Sub
    Public Sub SetLeadwireTermCost()
        Try
            Dim availableWire = WireCount
            If IsThermocouple() Then availableWire = 2
            LeadwireTermCost = GetBaseCost(GetPrimaryKey(LeadwireTermCostCode, LeadwireTerminationCostTypeRef))
        Catch ex As Exception
            LeadwireTermCost = -1
        End Try
    End Sub
    Public Sub SetLeadwireCost()
        Dim lwCost As Double = 0
        Try
            Dim lwCode As String
            lwCode = LeadwireCode
            If HasFlex() Then
                Select Case lwCode
                    Case "N"
                        lwCode = "M"
                    Case "E"
                        lwCode = "D"
                    Case "8"
                        lwCode = "F"
                    Case "T"
                        lwCode = "S"
                    Case "B"
                        lwCode = "A"
                End Select
            End If
            Dim availableWire = WireCount
            If Not HasCoilCord() Then
                If lwCode = "1" Or lwCode = "9" Then
                    If IsThermocouple() Then
                        lwCost = GetWireCost(lwCode & "P", 1, Calibration) + _
                                 GetWireCost(lwCode & "N", 1, Calibration)
                        If IsDual() Then
                            lwCost = lwCost * 2
                        End If
                    Else

                        lwCost = GetWireCost(lwCode, 1, Calibration) * WireCount
                    End If

                Else
                    lwCost = GetWireCost(lwCode, availableWire, Calibration)
                End If
                lwCost = ((LeadwireLength + LeadwireBeyondFlexLength) / 12) * lwCost
            Else
                lwCost = GetCoilCordCost(lwCode, availableWire, Calibration, LeadwireParse.Substring(2, 2))
            End If
        Catch ex As Exception
            lwCost = -1
        End Try

        LeadwireCost = lwCost
    End Sub
    Public Sub SetFlexCost()
        Try
            Dim sheath As String
            If HasMI() Or HasTubing() Then
                sheath = SheathOD
            Else
                sheath = "I"
            End If
            FlexCost = (FlexLength / 12) * GetFlexCost(sheath)
        Catch ex As Exception
            FlexCost = -1
        End Try
    End Sub
    Public Sub SetMICost()
        Try
            If SheathLength = -1 Then
                MICost = -1
            Else
                MICost = (SheathLength / 12) * GetMICost(SheathOD, SheathMaterial, Calibration, WireCount, MIType)
            End If
        Catch ex As Exception
            MICost = -1
        End Try

    End Sub

    Public Sub SetTubeCost()
        Try
            TubeCost = (SheathLength / 12) * GetTubeCost(SheathOD, SheathMaterial)

            If IsRTD() And Temperature = "L" And Not (IsSanitary()) And Not (IsInsertionProbe()) And Not (IsReducedStemSanitary()) Then
                If SheathLength > 1 Then
                    TubeCost = ((SheathLength - 1) * 0.6) + TubeCost
                End If
            End If

            If IsRTD() And Temperature = "M" Then
                If SheathLength > 1 Then
                    TubeCost = ((SheathLength - 1) * 0.8) + TubeCost
                End If
            End If

            If IsPlasticsRTD() Or IsPlastics() Then
                If SheathLength > 6 Then
                    TubeCost = ((SheathLength - 6) * 0.3) + TubeCost
                End If
            End If

            If IsInsertionProbe() Then
                If SheathLength <= 6 Then
                    TubeCost = 0
                ElseIf SheathLength > 6 And SheathLength <= 12 Then
                    TubeCost = ((SheathLength - 6) * 4.17) + TubeCost
                Else
                    TubeCost = -1
                End If
            End If

            If IsSanitary() And SheathLength >= 6 Then
                Select Case True
                    Case SheathLength >= 6 And SheathLength < 10
                        TubeCost = ((SheathLength - 6) * 3) + TubeCost
                    Case SheathLength >= 10 And SheathLength < 15
                        TubeCost = ((SheathLength - 6) * 5) + TubeCost
                    Case SheathLength >= 15 And SheathLength <= 19
                        TubeCost = ((SheathLength - 6) * 8) + TubeCost
                    Case SheathLength > 19
                        TubeCost = -1
                End Select
            End If

            If IsReducedStemSanitary() And TubeCost <> -1 Then
                TubeCost = TubeCost + (GetTubeCost(ReducedSheathOD, SheathMaterial) * (1 / 3))
            End If



        Catch ex As Exception
            TubeCost = -1
        End Try
    End Sub

    Public Sub SetSanitaryCost()
        Try
            SanitaryCost = GetBaseCost(GetPrimaryKey(SanitaryCode, SanitaryCostTypeRef))
            If IsSanitaryWell() Then
                SanitaryCost = SanitaryCost + GetSanitaryWellCost()
            End If
        Catch ex As Exception
            SanitaryCost = -1
        End Try
    End Sub
    Public Sub SetInsertionProbeCost()
        Try
            InsertionProbeCost = GetBaseCost(GetPrimaryKey(InsertionProbeCode, InsertionProbeCostTypeRef))
        Catch ex As Exception
            InsertionProbeCost = -1
        End Try
    End Sub
    Public Sub SetThermowellAssemblyCost()
        Try
            ThermowellAssemblyCost = GetBaseCost(GetPrimaryKey(ThermowellAssemblyCode, ThermowellAssemblyCostTypeRef))
        Catch ex As Exception
            ThermowellAssemblyCost = -1
        End Try
    End Sub
    Public Sub SetQuickConnectCost()
        Try
            QuickConnectCost = GetBaseCost(GetPrimaryKey(QuickConnectCode, QuickConnectCostTypeRef))
        Catch ex As Exception
            QuickConnectCost = -1
        End Try
    End Sub

    Public Sub SetThermowellCost()
        Try
            ThermowellCost = GetThermowellCost(ThermowellPartNumber)
        Catch ex As Exception
            ThermowellCost = -1
        End Try
    End Sub

    Public Sub SetExtensionCost()
        Dim extTermination = LeadwireTermCostCode.Substring(0, 1).ToString & StringFunctions.ParseString(PartNumber, 1, "-").ToString
        If IsThermocouple() Then
            extTermination = extTermination & LeadwireTermCostCode.Substring(2, 3).ToString
        Else
            extTermination = extTermination & LeadwireTermCostCode.Substring(2, 2).ToString
        End If
        Try
            ExtensionCost = GetExtensionCost() + _
                            GetBaseCost(GetPrimaryKey(extTermination, LeadwireTerminationCostTypeRef))
        Catch ex As Exception
            ExtensionCost = -1
        End Try
    End Sub

    Public Sub SetOption1Cost()
        Try
            Dim dc As New QPriceDataClassesDataContext
            Dim extTerm As String
            Option1Cost = (From s In dc.Components
                                 Where s.CompCode = Option1 And s.Catagory_ID = SpecialOptionRef
                                 Select s.CompCost * s.Markup).Single

            Select Case Option1
                Case "C"
                    extTerm = StringFunctions.ParseString(PartNumber, 1, "-").ToString
                    If IsExtension() And IsConnector(extTerm) And IsConnector(LeadwireTermination) Then
                        Option1Cost = Option1Cost * 2
                    End If
                Case "S"
                    extTerm = StringFunctions.ParseString(PartNumber, 1, "-").ToString
                    If IsExtension() And IsPlug(extTerm) And IsPlug(LeadwireTermination) Then
                        Option1Cost = Option1Cost * 2
                    End If
                Case "T"
                    If (SheathLength > 48) Then
                        Option1Cost = -1
                    End If

            End Select


        Catch ex As Exception
            Option1Cost = -1
        End Try
    End Sub

    Public Sub SetOption2Cost()
        Try
            Dim dc As New QPriceDataClassesDataContext
            Dim extTerm As String
            Option2Cost = (From s In dc.Components
                                 Where s.CompCode = Option2 And s.Catagory_ID = SpecialOptionRef
                                 Select s.CompCost * s.Markup).Single
            Select Case Option1
                Case "C"
                    extTerm = StringFunctions.ParseString(PartNumber, 1, "-").ToString
                    If IsExtension() And IsConnector(extTerm) And IsConnector(LeadwireTermination) Then
                        Option1Cost = Option1Cost * 2
                    End If
                Case "S"
                    extTerm = StringFunctions.ParseString(PartNumber, 1, "-").ToString
                    If IsExtension() And IsPlug(extTerm) And IsPlug(LeadwireTermination) Then
                        Option1Cost = Option1Cost * 2
                    End If
                Case "T"
                    If (SheathLength > 48) Then
                        Option1Cost = -1
                    End If
            End Select

        Catch ex As Exception
            Option2Cost = -1
        End Try
    End Sub

    Public Function IsConnector(ByRef code As String) As Boolean
        IsConnector = False
        Select Case code
            Case "K", "L", "M", "N", "O", "P", "Q", "R", "S"
                IsConnector = True
        End Select
    End Function

    Public Function IsPlug(ByRef code As String) As Boolean
        IsPlug = False
        Select Case code
            Case "K", "L", "N", "O", "Q", "R"
                IsPlug = True
        End Select
    End Function

    Public Sub SetCodeCost()
        Try
            Dim dc As New QPriceDataClassesDataContext
            CodeCost = (From s In dc.Components
                                 Where s.CompCode = Code And s.Catagory_ID = SpecialOptionRef
                                 Select s.CompCost * s.Markup).Single
        Catch ex As Exception
            CodeCost = -1
        End Try
    End Sub

    Public Function GetBaseCost(ByVal primaryKey As Long) As Double
        Dim dc As New QPriceDataClassesDataContext
        Dim materialCost As Decimal

        Try
            Dim code As Long = (From p In dc.CostUps
                                      Where primaryKey = p.CostUpID
                                      Select p.CostUpID).Single
        Catch ex As Exception
            GetBaseCost = -1
            Exit Function
        End Try

        Try
            materialCost = Math.Round(GetMaterialCost(primaryKey), 2)
        Catch ex As Exception
            GetBaseCost = 0
            Exit Function
        End Try

        Dim overhead As Decimal = GetOverhead(primaryKey)
        Dim laborRate As Decimal = GetLaborRate(primaryKey)
        Dim markup As Decimal = GetMarkup(primaryKey)
        Dim pph As Decimal = GetPPH(primaryKey)

        GetBaseCost = (Math.Round(materialCost * (1 + overhead), 2) + (laborRate / pph)) * markup

        dc.Dispose()
    End Function
    Public Function GetTubeCost(ByVal sheathOD As String, ByVal material As String) As Double
        Dim dc As New QPriceDataClassesDataContext
        Dim myComp As Object
        If IsSanitary() Then
            Try
                myComp = (From c In dc.Components
                       Where c.CompCode = "POLISHED" _
                       And c.OD.ODCode = sheathOD _
                       And c.Material.MaterialCode = material
                       Select c.CompCost, c.Markup).First
            Catch ex As Exception
                myComp = (From c In dc.Components
                        Where c.OD.ODCode = sheathOD _
                        And c.Catagory_ID = 12 _
                        And c.Material.MaterialCode = material
                        Select c.CompCost, c.Markup).First
            End Try
        Else

            '12 is the catagory for tubing
            myComp = (From c In dc.Components
                            Where c.OD.ODCode = sheathOD _
                            And c.Catagory_ID = 12 _
                            And c.Material.MaterialCode = material
                            Select c.CompCost, c.Markup).First
        End If
        GetTubeCost = myComp.CompCost * myComp.Markup
        dc.Dispose()
    End Function
    Public Function GetMICost(ByVal sheathOD As String, ByVal material As String, ByVal calibration As String, _
                           ByVal wirecount As Long, ByVal MIType As String) As Double
        Dim dc As New QPriceDataClassesDataContext
        Dim myComp = (From c In dc.Components
                        Where c.OD.ODCode = sheathOD _
                        And c.Material.MaterialCode = material _
                        And c.MIType.MITypeCode = MIType _
                        And c.Calibration.CalCode = calibration _
                        And c.WireCount.WireCount = wirecount
                        Select c.CompCost, c.Markup).First
        GetMICost = myComp.CompCost * myComp.Markup
        dc.Dispose()
    End Function

    Public Function GetWireCost(ByVal wireType As String, ByVal wireCount As Integer, ByVal calibration As String) As Double
        Dim dc As New QPriceDataClassesDataContext
        Dim myComp As Object
        Dim myWireCount As Long = wireCount

        Dim compData = From c In dc.Components
                      Where c.CompCode = wireType _
                      And c.Calibration.CalCode = calibration
                      Select c

        Try
            If wireType = "1" Or wireType = "9" Then
                myWireCount = 1
            Else
                myWireCount = wireCount
            End If
            myComp = (From c In compData
                     Where c.WireCount.WireCount = myWireCount
                     Select c.CompCost, c.Markup).First

        Catch ex As Exception

        End Try

        If IsNothing(myComp) Then
            If wireCount > 3 Then
                myWireCount = wireCount / 2
            Else
                myWireCount = 2
            End If
            Do While IsNothing(myComp) And myWireCount <= 6
                Try
                    myComp = (From c In compData
                              Where c.WireCount.WireCount = myWireCount
                              Select c.CompCost, c.Markup).SingleOrDefault
                Catch ex As Exception

                End Try
                If IsNothing(myComp) Then
                    myWireCount = myWireCount + 1
                Else
                    Exit Do
                End If
            Loop
        End If

        If wireCount > myWireCount Then
            GetWireCost = ((myComp.compcost * myComp.markup) + 0.1) * Math.Ceiling(wireCount / myWireCount)
        Else

            GetWireCost = (myComp.CompCost * myComp.Markup) + 0.01 'Adder for shipping cost
        End If

        dc.Dispose()
    End Function
    Public Function GetCoilCordCost(ByVal wireType As String, ByVal wireCount As Integer, ByVal calibration As String, ByVal length As Long) As Double
        Dim dc As New QPriceDataClassesDataContext
        Dim myComp = (From c In dc.Components
                      Where c.CompCode = wireType _
                      And c.WireCount.WireCount = wireCount _
                      And c.Calibration.CalCode = calibration _
                      And c.CompNum.Substring(5, 2) = length
                      Select c.CompCost, c.Markup).First

        GetCoilCordCost = myComp.CompCost * myComp.Markup
        dc.Dispose()
    End Function

    Public Function GetFlexCost(ByVal sheathOD As String) As Double
        Dim dc As New QPriceDataClassesDataContext
        Dim flexSize As Double
        If (sheathOD = "G" Or sheathOD = "K") Then
            flexSize = 0.125
        Else
            flexSize = 0.188
        End If

        Dim myComp = (From c In dc.Components
                      Where c.OD.ODDecimal = flexSize _
                      And c.ComponentCatagory.CatagoryID = 19
                      Select c.CompCost, c.Markup).First
        GetFlexCost = (myComp.CompCost * myComp.Markup) + 0.1 'Adder for shipping cost

        dc.Dispose()

    End Function
    Public Function GetMaterialCost(primaryKey As Long) As Decimal
        Dim dc As New QPriceDataClassesDataContext
        GetMaterialCost = (From p In dc.CostComponentKeys, c In dc.Components, b In dc.CostUps
                            Where (p.CostUp_ID = primaryKey And p.Comp_ID = c.CompID And p.CostUp_ID = b.CostUpID)
                            Select c.CompCost * p.Quantity).Sum()
        dc.Dispose()
    End Function
    Public Function GetThermowellCost(TWPartNumber As String) As Decimal
        Dim dc As New QPriceDataClassesDataContext
        GetThermowellCost = (From t In dc.Components
                             Where t.CompNum = TWPartNumber
                             Select t.CompCost * t.Markup).Sum
        dc.Dispose()
    End Function
    Public Function GetExtensionCost() As Decimal
        Dim dc As New QPriceDataClassesDataContext
        GetExtensionCost = (From e In dc.ExtBaseCosts
                           Select e.ExtBaseCost).SingleOrDefault
    End Function
    Public Function GetSanitaryWellCost() As Decimal
        Dim dc As New QPriceDataClassesDataContext
        GetSanitaryWellCost = (From s In dc.SanitaryWellCosts
                               Select s.SanitaryWellCost).SingleOrDefault
    End Function
    Public Function GetOverhead(primaryKey As Long) As Decimal
        Dim dc As New QPriceDataClassesDataContext
        GetOverhead = (From o In dc.CostUps
                       Where o.CostUpID = primaryKey
                       Select o.Overhead).Single
        dc.Dispose()
    End Function
    Public Function GetPPH(primaryKey As Long) As Decimal
        Dim dc As New QPriceDataClassesDataContext
        GetPPH = (From b In dc.CostUps
                Where b.CostUpID = primaryKey
                Select b.PPH).Single
        dc.Dispose()
    End Function
    Public Function GetMarkup(primaryKey As Long) As Decimal
        Dim dc As New QPriceDataClassesDataContext
        GetMarkup = (From b In dc.CostUps
                Where b.CostUpID = primaryKey
                Select b.Markup).Single
        dc.Dispose()
    End Function
    Public Function GetLaborRate(primaryKey As Long) As Decimal
        Dim dc As New QPriceDataClassesDataContext
        GetLaborRate = (From b In dc.CostUps
                        Where b.CostUpID = primaryKey
                        Select b).Single.SensorType.Labor
        dc.Dispose()
    End Function

    Public Function GetFittingCost(ByVal fitting As String) As Double
        Dim dc As New QPriceDataClassesDataContext
        Dim fitting1 As String
        Dim fitting2 As String
        Dim myFitting As Object
        Dim myFitting2 As Object

        If fitting <> "00" And fitting <> Nothing Then
            If fitting.Contains("/") Then
                fitting1 = StringFunctions.ParseString(fitting, 0, "/")
                fitting2 = StringFunctions.ParseString(fitting, 1, "/")

                myFitting = (From f1 In dc.Components
                                 Where f1.CompCode = fitting1 And (f1.Catagory_ID = 3 Or f1.Catagory_ID = 33 Or f1.Catagory_ID = 35)
                                 Select f1).Single

                myFitting2 = (From f2 In dc.Components
                                 Where f2.CompCode = fitting2 And (f2.Catagory_ID = 3 Or f2.Catagory_ID = 33 Or f2.Catagory_ID = 35)
                                 Select f2).Single

                GetFittingCost = ((myFitting.CompCost + myFitting.LaborCost) * myFitting.Markup) + ((myFitting2.CompCost + myFitting2.LaborCost) * myFitting2.Markup)
            Else

                myFitting = (From f In dc.Components
                                 Where f.CompCode = fitting And (f.Catagory_ID = 3 Or f.Catagory_ID = 33 Or f.Catagory_ID = 35)
                                 Select f).Single
                GetFittingCost = (myFitting.CompCost + myFitting.LaborCost) * myFitting.Markup
            End If
        Else
            GetFittingCost = 0
        End If
        dc.Dispose()
    End Function

End Class