
Partial Class Calculator
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            HideCalculatorPanels()
            Temperature_Panel.Visible = True
            Conversion_DropDownList.SelectedValue = "Temperature"
            Calculator_Label.Text = Conversion_DropDownList.SelectedItem.ToString
            Calculate_LinkButton.CommandArgument = Conversion_DropDownList.SelectedValue
        End If
    End Sub
    Protected Sub Calculate_LinkButton_Click(sender As Object, e As System.EventArgs) Handles Calculate_LinkButton.Click
        Dim arg As String = Calculate_LinkButton.CommandArgument
        Select Case arg
            Case "Length"
                CalculateLength()
            Case "Ohms"
                CalculateOhms()
            Case "Area"
                CalculateArea()
            Case "Volume"
                CalculateVolume()
            Case "Weight"
                CalculateWeight()
            Case "Temperature"
                CalculateTemperature()
            Case "Pressure"
                CalculatePressure()
            Case "Force"
                CalculateForce()
        End Select

    End Sub
    Protected Sub Clear_LinkButton_Click(sender As Object, e As System.EventArgs) Handles Clear_LinkButton.Click
        ClearTextBoxes()
    End Sub
    Protected Sub Conversion_DropDownList_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Conversion_DropDownList.SelectedIndexChanged
        Dim calc As String = Conversion_DropDownList.SelectedValue.ToString
        Calculator_Label.Text = Conversion_DropDownList.SelectedItem.ToString

        HideCalculatorPanels()
        Select Case calc
            Case "Length"
                Length_Panel.Visible = True
                Calculate_LinkButton.CommandArgument = calc
            Case "Ohms"
                Ohms_Panel.Visible = True
                Calculate_LinkButton.CommandArgument = calc
            Case "Area"
                Area_Panel.Visible = True
                Calculate_LinkButton.CommandArgument = calc
            Case "Volume"
                Volume_Panel.Visible = True
                Calculate_LinkButton.CommandArgument = calc
            Case "Weight"
                Weight_Panel.visible = True
                Calculate_LinkButton.CommandArgument = calc
            Case "Temperature"
                Temperature_Panel.Visible = True
                Calculate_LinkButton.CommandArgument = calc
            Case "Pressure"
                Pressure_Panel.Visible = True
                Calculate_LinkButton.CommandArgument = calc
            Case "Force"
                Force_Panel.Visible = True
                Calculate_LinkButton.CommandArgument = calc

        End Select
    End Sub

    Private Sub CalculateOhms()
        Dim celsius As Double
        Dim Ro As Integer

        celsius = OhmsCelsius_TextBox.Text
        Ro = Ro_RadioButtonList.SelectedValue
        Curve385_TextBox.Text = DegreesToOhms(celsius, Ro, 0.00385)
        Curve392_TextBox.Text = DegreesToOhms(celsius, Ro, 0.00392)




    End Sub
    Private Function DegreesToOhms(celsius As Double, Ro As Integer, curve As Double) As Double
        Dim A As Double
        Dim B As Double
        Dim C As Double

        Dim A_Celsius As Double
        Dim B_Celsius2 As Double

        Dim RtA As Double
        Dim RtB As Double

        Select Case curve
            Case 0.00392
                A = 0.0039787
                B = -0.00000058686
                C = -0.000000000004167
            Case 0.00385
                A = 0.00390802
                B = -0.0000005802
                C = -0.00000000000416166666666668
        End Select

        A_Celsius = A * celsius
        B_Celsius2 = B * (celsius ^ 2)

        RtA = Ro * (1 + A_Celsius + B_Celsius2)
        RtB = Ro * (1 + A_Celsius + B_Celsius2 + (C * (celsius - 100) * (celsius ^ 3)))

        If celsius < 0 Then
            DegreesToOhms = Math.Round(RtB, 2)
        Else
            DegreesToOhms = Math.Round(RtA, 2)
        End If

    End Function

    Private Sub CalculateLength()
        Dim calculation As New Measurement
        Select Case True
            Case IsMeter()
                calculation.ConvertLength(Meters_TextBox.Text, "Meters")
            Case IsMillimeter()
                calculation.ConvertLength(Millimeters_TextBox.Text, "Millimeters")
            Case IsInch()
                calculation.ConvertLength(Inches_TextBox.Text, "Inches")
            Case IsFeet()
                calculation.ConvertLength(Feet_TextBox.Text, "Feet")
            Case IsYard()
                calculation.ConvertLength(Yards_TextBox.Text, "Yards")
            Case IsMile()
                calculation.ConvertLength(Miles_TextBox.Text, "Miles")
            Case IsKilometer()
                calculation.ConvertLength(Kilometers_TextBox.Text, "Kilometers")

        End Select
        DisplayLength(calculation)
    End Sub
    Private Sub CalculateArea()
        Dim calculation As New Measurement
        Select Case True
            Case IsSquareMeter()
                calculation.ConvertArea(SquareMeters_TextBox.Text, "SquareMeters")
            Case IsSquareMil()
                calculation.ConvertArea(SquareMil_TextBox.Text, "SquareMillimeters")
            Case IsSquareInch()
                calculation.ConvertArea(SquareInches_TextBox.Text, "SquareInches")
            Case IsSquareFeet()
                calculation.ConvertArea(SquareFeet_TextBox.Text, "SquareFeet")
            Case IsSquareYard()
                calculation.ConvertArea(SquareYards_TextBox.Text, "SquareYards")
            Case IsSquareMile()
                calculation.ConvertArea(SquareMiles_TextBox.Text, "SquareMiles")
            Case IsSquareKilo()
                calculation.ConvertArea(SquareKilo_TextBox.Text, "SquareKilometers")

        End Select
        DisplayArea(calculation)
    End Sub
    Private Sub CalculateVolume()
        Dim calculation As New Measurement
        Select Case True
            Case IsLiter()
                calculation.ConvertVolume(Liters_TextBox.Text, "Liters")
            Case IsFluidOunce()
                calculation.ConvertVolume(Ounces_TextBox.Text, "FluidOunces")
            Case IsQuart()
                calculation.ConvertVolume(Quarts_TextBox.Text, "Quarts")
            Case IsGallon()
                calculation.ConvertVolume(Gallons_TextBox.Text, "Gallons")
            Case IsCubicFoot()
                calculation.ConvertVolume(CubicFeet_TextBox.Text, "CubicFeet")
            Case IsCubicYard()
                calculation.ConvertVolume(CubicYards_TextBox.Text, "CubicYards")
            Case IsCubicMeter()
                calculation.ConvertVolume(CubicMeters_TextBox.Text, "CubicMeters")
        End Select
        DisplayVolume(calculation)
    End Sub

    Private Sub CalculateWeight()
        Dim calculation As New Measurement
        Select Case True
            Case IsKilogram()
                calculation.ConvertWeight(Kilograms_TextBox.Text, "Kilograms")
            Case IsOunce()
                calculation.ConvertWeight(Ounces_TextBox.Text, "Ounces")
            Case IsPound()
                calculation.ConvertWeight(Pounds_TextBox.Text, "Pounds")
            Case IsShortTon()
                calculation.ConvertWeight(ShortTons_TextBox.Text, "ShortTons")
            Case IsMetricTon()
                calculation.ConvertWeight(MetricTons_TextBox.Text, "MetricTons")
        End Select
        DisplayWeight(calculation)
    End Sub

    Private Sub CalculateTemperature()
        Dim calculation As New Measurement
        Select Case True
            Case IsCelsius()
                calculation.ConvertTemperature(Celsius_TextBox.Text, "Celsius")
            Case IsFahrenheit()
                calculation.ConvertTemperature(Fahrenheit_TextBox.Text, "Fahrenheit")
            Case IsKelvin()
                calculation.ConvertTemperature(Kelvin_TextBox.Text, "Kelvin")
        End Select
        DisplayTemperature(calculation)
    End Sub

    Private Sub CalculatePressure()
        Dim calculation As New Measurement
        Select Case True
            Case IskPa()
                calculation.ConvertPressure(kPa_TextBox.Text, "kPa")
            Case Ispsi()
                calculation.ConvertPressure(psi_TextBox.Text, "psi")
        End Select
        DisplayPressure(calculation)
    End Sub

    Private Sub CalculateForce()
        Dim calculation As New Measurement
        Select Case True
            Case IsNewton()
                calculation.ConvertForce(Newtons_TextBox.Text, "Newtons")
            Case IsForcePound()
                calculation.ConvertForce(ForcePounds_TextBox.Text, "ForcePounds")
        End Select
        DisplayForce(calculation)
    End Sub

    Private Sub DisplayLength(ByVal calculation As Measurement)
        Meters_TextBox.Text = calculation.Meter
        Millimeters_TextBox.Text = calculation.Millimeter
        Inches_TextBox.Text = calculation.Inch
        Feet_TextBox.Text = calculation.Feet
        Yards_TextBox.Text = calculation.Yard
        Miles_TextBox.Text = calculation.Mile
        Kilometers_TextBox.Text = calculation.Kilometer
    End Sub

    Private Sub DisplayArea(ByVal calculation As Measurement)
        SquareMeters_TextBox.Text = calculation.SquMeter
        SquareMil_TextBox.Text = calculation.SquMillimeter
        SquareInches_TextBox.Text = calculation.SquInch
        SquareFeet_TextBox.Text = calculation.SquFeet
        SquareYards_TextBox.Text = calculation.SquYard
        SquareMiles_TextBox.Text = calculation.SquMile
        SquareKilo_TextBox.Text = calculation.SquKilometer
    End Sub
    Private Sub DisplayVolume(ByVal calculation As Measurement)
        Liters_TextBox.Text = calculation.Liter
        FluidOunces_TextBox.Text = calculation.FluidOunce
        Quarts_TextBox.Text = calculation.Quart
        Gallons_TextBox.Text = calculation.Gallon
        CubicFeet_TextBox.Text = calculation.CubicFeet
        CubicYards_TextBox.Text = calculation.CubicYard
        CubicMeters_TextBox.Text = calculation.CubicMeter
    End Sub
    Private Sub DisplayWeight(ByVal calculation As Measurement)
        Kilograms_TextBox.Text = calculation.Kilogram
        Ounces_TextBox.Text = calculation.Ounce
        Pounds_TextBox.Text = calculation.Pound
        ShortTons_TextBox.Text = calculation.ShortTon
        MetricTons_TextBox.Text = calculation.MetricTon
    End Sub
    Private Sub DisplayTemperature(ByVal calculation As Measurement)
        Celsius_TextBox.Text = calculation.Celsius
        Fahrenheit_TextBox.Text = calculation.Fahrenheit
        Kelvin_TextBox.Text = calculation.Kelvin
    End Sub
    Private Sub DisplayPressure(ByVal calculation As Measurement)
        kPa_TextBox.Text = calculation.kPa
        psi_TextBox.Text = calculation.psi
    End Sub
    Private Sub DisplayForce(ByVal calculation As Measurement)
        Newtons_TextBox.Text = calculation.Newton
        ForcePounds_TextBox.Text = calculation.ForcePound
    End Sub

    Private Function IsMeter() As Boolean
        IsMeter = Not (Meters_TextBox.Text = "")
    End Function
    Private Function IsMillimeter() As Boolean
        IsMillimeter = Not (Millimeters_TextBox.Text = "")
    End Function
    Private Function IsInch() As Boolean
        IsInch = Not (Inches_TextBox.Text = "")
    End Function
    Private Function IsFeet() As Boolean
        IsFeet = Not (Feet_TextBox.Text = "")
    End Function
    Private Function IsYard() As Boolean
        IsYard = Not (Yards_TextBox.Text = "")
    End Function
    Private Function IsMile() As Boolean
        IsMile = Not (Miles_TextBox.Text = "")
    End Function
    Private Function IsKilometer() As Boolean
        IsKilometer = Not (Kilometers_TextBox.Text = "")
    End Function


    Private Function IsSquareMeter() As Boolean
        IsSquareMeter = Not (SquareMeters_TextBox.Text = "")
    End Function
    Private Function IsSquareMil() As Boolean
        IsSquareMil = Not (SquareMil_TextBox.Text = "")
    End Function
    Private Function IsSquareInch() As Boolean
        IsSquareInch = Not (SquareInches_TextBox.Text = "")
    End Function
    Private Function IsSquareFeet() As Boolean
        IsSquareFeet = Not (SquareFeet_TextBox.Text = "")
    End Function
    Private Function IsSquareYard() As Boolean
        IsSquareYard = Not (SquareYards_TextBox.Text = "")
    End Function
    Private Function IsSquareMile() As Boolean
        IsSquareMile = Not (SquareMiles_TextBox.Text = "")
    End Function
    Private Function IsSquareKilo() As Boolean
        IsSquareKilo = Not (SquareKilo_TextBox.Text = "")
    End Function


    Private Function IsLiter() As Boolean
        IsLiter = Not (Liters_TextBox.Text = "")
    End Function
    Private Function IsFluidOunce() As Boolean
        IsFluidOunce = Not (FluidOunces_TextBox.Text = "")
    End Function
    Private Function IsQuart() As Boolean
        IsQuart = Not (Quarts_TextBox.Text = "")
    End Function
    Private Function IsGallon() As Boolean
        IsGallon = Not (Gallons_TextBox.Text = "")
    End Function
    Private Function IsCubicFoot() As Boolean
        IsCubicFoot = Not (CubicFeet_TextBox.Text = "")
    End Function
    Private Function IsCubicYard() As Boolean
        IsCubicYard = Not (CubicYards_TextBox.Text = "")
    End Function
    Private Function IsCubicMeter() As Boolean
        IsCubicMeter = Not (CubicMeters_TextBox.Text = "")
    End Function

    Private Function IsKilogram() As Boolean
        IsKilogram = Not (Kilograms_TextBox.Text = "")
    End Function
    Private Function IsOunce() As Boolean
        IsOunce = Not (Ounces_TextBox.Text = "")
    End Function
    Private Function IsPound() As Boolean
        IsPound = Not (Pounds_TextBox.Text = "")
    End Function
    Private Function IsShortTon() As Boolean
        IsShortTon = Not (ShortTons_TextBox.Text = "")
    End Function
    Private Function IsMetricTon() As Boolean
        IsMetricTon = Not (MetricTons_TextBox.Text = "")
    End Function

    Private Function IsCelsius() As Boolean
        IsCelsius = Not (Celsius_TextBox.Text = "")
    End Function
    Private Function IsFahrenheit() As Boolean
        IsFahrenheit = Not (Fahrenheit_TextBox.Text = "")
    End Function
    Private Function IsKelvin() As Boolean
        IsKelvin = Not (Kelvin_TextBox.Text = "")
    End Function

    Private Function IskPa() As Boolean
        IskPa = Not (kPa_TextBox.Text = "")
    End Function
    Private Function Ispsi() As Boolean
        Ispsi = Not (psi_TextBox.Text = "")
    End Function

    Private Function IsNewton() As Boolean
        IsNewton = Not (Newtons_TextBox.Text = "")
    End Function
    Private Function IsForcePound() As Boolean
        IsForcePound = Not (ForcePounds_TextBox.Text = "")
    End Function

    Private Sub ClearTextBoxes()
        For Each c As Control In Calculate_Panel.Controls
            If TypeOf c Is Panel Then
                Dim p As Panel
                p = CType(c, Panel)
                For Each t As Control In p.Controls
                    If TypeOf t Is TextBox Then
                        Dim txtbx As TextBox
                        txtbx = CType(t, TextBox)
                        txtbx.Text = ""
                    End If
                Next
            End If
        Next
    End Sub

    Private Sub HideCalculatorPanels()
        For Each c As Control In Calculate_Panel.Controls
            If TypeOf c Is Panel Then
                Dim p As Panel
                p = CType(c, Panel)
                p.Visible = False
            End If
        Next
    End Sub

End Class
