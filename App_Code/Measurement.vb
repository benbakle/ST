Imports Microsoft.VisualBasic

Public Class Measurement


    '*******************
    'LENGTH CONVERSIONS
    '*******************
    Private pMeter As Double
    Private pMillimeter As Double
    Private pInch As Double
    Private pFeet As Double
    Private pYard As Double
    Private pMile As Double
    Private pKilometer As Double

    Public Property Meter As Double
        Get
            Meter = pMeter
        End Get
        Set(value As Double)
            pMeter = value
        End Set
    End Property
    Public Property Millimeter As Double
        Get
            Millimeter = pMillimeter
        End Get
        Set(value As Double)
            pMillimeter = value
        End Set
    End Property
    Public Property Inch As Double
        Get
            Inch = pInch
        End Get
        Set(value As Double)
            pInch = value
        End Set
    End Property
    Public Property Feet As Double
        Get
            Feet = pFeet
        End Get
        Set(value As Double)
            pFeet = value
        End Set
    End Property
    Public Property Yard As Double
        Get
            Yard = pYard
        End Get
        Set(value As Double)
            pYard = value
        End Set
    End Property
    Public Property Mile As Double
        Get
            Mile = pMile
        End Get
        Set(value As Double)
            pMile = value
        End Set
    End Property
    Public Property Kilometer As Double
        Get
            Kilometer = pKilometer
        End Get
        Set(value As Double)
            pKilometer = value
        End Set
    End Property

    Public Sub AssignLength(ByVal val As Double, ByVal type As String)
        Select Case type
            Case "standard"
                Inch = val
                Meter = val / 39.37
            Case "metric"
                Inch = val * 39.37
                Meter = val
        End Select

        Millimeter = Meter * 1000
        Feet = Inch / 12
        Yard = Inch / 36
        Mile = Inch / 63360
        Kilometer = Meter / 1000
    End Sub

    Public Sub ConvertLength(ByVal val As Double, ByVal length As String)
        Select Case length
            Case "Meters"
                AssignLength(val, "metric")
            Case "Millimeters"
                AssignLength(val / 1000, "metric")
            Case "Inches"
                AssignLength(val, "standard")
            Case "Feet"
                AssignLength(val * 12, "standard")
            Case "Yards"
                AssignLength(val * 36, "standard")
            Case "Miles"
                AssignLength(val * 63360, "standard")
            Case "Kilometers"
                AssignLength(val * 1000, "metric")
        End Select
    End Sub


    '*****************
    'AREA CONVERSIONS
    '*****************
    Private pSquMeter As Double
    Private pSquMillimeter As Double
    Private pSquInch As Double
    Private pSquFeet As Double
    Private pSquYard As Double
    Private pSquMile As Double
    Private pSquKilometer As Double

    Public Property SquMeter As Double
        Get
            SquMeter = pSquMeter
        End Get
        Set(value As Double)
            pSquMeter = value
        End Set
    End Property
    Public Property SquMillimeter As Double
        Get
            SquMillimeter = pSquMillimeter
        End Get
        Set(value As Double)
            pSquMillimeter = value
        End Set
    End Property
    Public Property SquInch As Double
        Get
            SquInch = pSquInch
        End Get
        Set(value As Double)
            pSquInch = value
        End Set
    End Property
    Public Property SquFeet As Double
        Get
            SquFeet = pSquFeet
        End Get
        Set(value As Double)
            pSquFeet = value
        End Set
    End Property
    Public Property SquYard As Double
        Get
            SquYard = pSquYard
        End Get
        Set(value As Double)
            pSquYard = value
        End Set
    End Property
    Public Property SquMile As Double
        Get
            SquMile = pSquMile
        End Get
        Set(value As Double)
            pSquMile = value
        End Set
    End Property
    Public Property SquKilometer As Double
        Get
            SquKilometer = pSquKilometer
        End Get
        Set(value As Double)
            pSquKilometer = value
        End Set
    End Property

    Public Sub AssignArea(ByVal val As Double, ByVal type As String)

        Select Case type
            Case "standard"
                SquInch = val
                SquMeter = val / 1550
            Case "metric"
                SquInch = val * 1550
                SquMeter = val
        End Select
        SquMillimeter = SquMeter * 1000000
        SquFeet = SquInch / 144
        SquYard = SquInch / 1296
        SquMile = SquInch / 4014000000
        SquKilometer = SquMeter / 1000000
    End Sub

    Public Sub ConvertArea(ByVal val As Double, ByVal area As String)
        Select Case area
            Case "SquareMeters"
                AssignArea(val, "metric")
            Case "SquareMillimeters"
                AssignArea(val / 1000000, "metric")
            Case "SquareInches"
                AssignArea(val, "standard")
            Case "SquareFeet"
                AssignArea(val * 144, "standard")
            Case "SquareYards"
                AssignArea(val * 1296, "standard")
            Case "SquareMiles"
                AssignArea(val * 4014000000, "standard")
            Case "SquareKilometers"
                AssignArea(val * 1000000, "metric")
        End Select
    End Sub

    '*******************
    'VOLUME CONVERSIONS
    '*******************
    Private pLiter As Double
    Private pFluidOunce As Double
    Private pQuart As Double
    Private pGallon As Double
    Private pCubicFeet As Double
    Private pCubicYard As Double
    Private pCubicMeter As Double

    Public Property Liter As Double
        Get
            Liter = pLiter
        End Get
        Set(value As Double)
            pLiter = value
        End Set
    End Property
    Public Property FluidOunce As Double
        Get
            FluidOunce = pFluidOunce
        End Get
        Set(value As Double)
            pFluidOunce = value
        End Set
    End Property
    Public Property Quart As Double
        Get
            Quart = pQuart
        End Get
        Set(value As Double)
            pQuart = value
        End Set
    End Property
    Public Property Gallon As Double
        Get
            Gallon = pGallon
        End Get
        Set(value As Double)
            pGallon = value
        End Set
    End Property
    Public Property CubicFeet As Double
        Get
            CubicFeet = pCubicFeet
        End Get
        Set(value As Double)
            pCubicFeet = value
        End Set
    End Property
    Public Property CubicYard As Double
        Get
            CubicYard = pCubicYard
        End Get
        Set(value As Double)
            pCubicYard = value
        End Set
    End Property
    Public Property CubicMeter As Double
        Get
            CubicMeter = pCubicMeter
        End Get
        Set(value As Double)
            pCubicMeter = value
        End Set
    End Property

    Public Sub AssignVolume(ByVal val As Double, ByVal type As String)
        Select Case type
            Case "standard"
                Liter = val * 33.814
                FluidOunce = val
            Case "metric"
                Liter = val
                FluidOunce = val / 33.814
        End Select

        Quart = FluidOunce / 32
        Gallon = FluidOunce / 128
        CubicFeet = FluidOunce / 957.506
        CubicYard = FluidOunce / 25852.6753
        CubicMeter = Liter / 1000
    End Sub

    Public Sub ConvertVolume(ByVal val As Double, ByVal volume As String)
        Select Case volume
            Case "Liters"
                AssignVolume(val, "metric")
            Case "FluidOunces"
                AssignVolume(val, "standard")
            Case "Quarts"
                AssignVolume(val * 32, "standard")
            Case "Gallons"
                AssignVolume(val * 128, "standard")
            Case "CubicFeet"
                AssignVolume(val * 957.506, "standard")
            Case "CubicYards"
                AssignVolume(val * 25852.6753, "standard")
            Case "CubicMeters"
                AssignVolume(val * 1000, "metric")
        End Select

    End Sub

    '*******************
    'WEIGHT CONVERSIONS
    '*******************
    Private pKilogram As Double
    Private pOunce As Double
    Private pPound As Double
    Private pShortTon As Double
    Private pMetricTon As Double

    Public Property Kilogram As Double
        Get
            Kilogram = pKilogram
        End Get
        Set(value As Double)
            pKilogram = value
        End Set
    End Property
    Public Property Ounce As Double
        Get
            Ounce = pOunce
        End Get
        Set(value As Double)
            pOunce = value
        End Set
    End Property
    Public Property Pound As Double
        Get
            Pound = pPound
        End Get
        Set(value As Double)
            pPound = value
        End Set
    End Property
    Public Property ShortTon As Double
        Get
            ShortTon = pShortTon
        End Get
        Set(value As Double)
            pShortTon = value
        End Set
    End Property
    Public Property MetricTon As Double
        Get
            MetricTon = pMetricTon
        End Get
        Set(value As Double)
            pMetricTon = value
        End Set
    End Property

    Public Sub AssignWeight(ByVal val As Double, ByVal type As String)
        Select Case type
            Case "standard"
                Kilogram = val * 0.0283495
                Ounce = val
            Case "metric"
                Kilogram = val
                Ounce = val / 0.0283495
        End Select

        Pound = Ounce / 16
        ShortTon = Ounce / 32000
        MetricTon = Kilogram / 1000
    End Sub

    Public Sub ConvertWeight(ByVal val As Double, ByVal weight As String)
        Select Case weight
            Case "Kilograms"
                AssignWeight(val, "metric")
            Case "Ounces"
                AssignWeight(val, "standard")
            Case "Pounds"
                AssignWeight(val * 16, "standard")
            Case "ShortTons"
                AssignWeight(val * 32000, "standard")
            Case "MetricTons"
                AssignWeight(val * 1000, "metric")
        End Select
    End Sub

    '************************
    'TEMPERATURE CONVERSIONS
    '************************
    Private pCelsius As Double
    Private pFahrenheit As Double
    Private pKelvin As Double

    Public Property Celsius As Double
        Get
            Celsius = pCelsius
        End Get
        Set(value As Double)
            pCelsius = value
        End Set
    End Property

    Public Property Fahrenheit As Double
        Get
            Fahrenheit = pFahrenheit
        End Get
        Set(value As Double)
            pFahrenheit = value
        End Set
    End Property

    Public Property Kelvin As Double
        Get
            Kelvin = pKelvin
        End Get
        Set(value As Double)
            pKelvin = value
        End Set
    End Property

    Public Sub AssignTemperature(ByVal val As Double)
        Celsius = val
        Fahrenheit = ((9 / 5) * Celsius) + 32
        Kelvin = val + 273
    End Sub
    Public Sub ConvertTemperature(ByVal val As Double, ByVal temperature As String)
        Select Case temperature
            Case "Celsius"
                AssignTemperature(val)
            Case "Fahrenheit"
                AssignTemperature((val - 32) * (5 / 9))
            Case "Kelvin"
                AssignTemperature(val - 273)
        End Select
    End Sub


    '************************
    'PRESSURE CONVERSIONS
    '************************
    Private pkPa As Double
    Private ppsi As Double

    Public Property kPa As Double
        Get
            kPa = pkPa
        End Get
        Set(value As Double)
            pkPa = value
        End Set
    End Property

    Public Property psi As Double
        Get
            psi = ppsi
        End Get
        Set(value As Double)
            ppsi = value
        End Set
    End Property

    Public Sub AssignPressure(ByVal val As Double)
        kPa = val
        psi = val / 6.8947572931683609
    End Sub
    Public Sub ConvertPressure(ByVal val As Double, ByVal pressure As String)
        Select Case pressure
            Case "kPa"
                AssignPressure(val)
            Case "psi"
                AssignPressure(val * 6.8947572931683609)
        End Select
    End Sub

    '******************
    'FORCE CONVERSIONS
    '******************
    Private pNewton As Double
    Private pForcePound As Double

    Public Property Newton As Double
        Get
            Newton = pNewton
        End Get
        Set(value As Double)
            pNewton = value
        End Set
    End Property

    Public Property ForcePound As Double
        Get
            ForcePound = pForcePound
        End Get
        Set(value As Double)
            pForcePound = value
        End Set
    End Property

    Public Sub AssignForce(ByVal val As Double)
        Newton = val
        ForcePound = val / 4.44822162
    End Sub
    Public Sub ConvertForce(ByVal val As Double, ByVal force As String)
        Select Case force
            Case "Newtons"
                AssignForce(val)
            Case "ForcePounds"
                AssignForce(val * 4.44822162)
        End Select
    End Sub

End Class
