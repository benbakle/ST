
Partial Class Admin_Pricing
    Inherits System.Web.UI.Page


    '---------------------------------------------------------------------------------------------------'
    '------------------------------------- GET-FUNCTIONS & PROPERTIES ----------------------------------'
    '---------------------------------------------------------------------------------------------------'
    Protected Function GetCostUp(ByRef dc As QPriceDataClassesDataContext, ByVal primaryKey As Long) As CostUp
        GetCostUp = (From c In dc.CostUps
                   Where c.CostUpID = primaryKey
                   Select c).Single
    End Function
    Private _costType As String
    Public Property PageCostType() As String
        Get
            Return _costType
        End Get
        Set(value As String)
            _costType = value
        End Set
    End Property
    Private _sensorType As String
    Public Property PageSensorType() As String
        Get
            Return _sensorType
        End Get
        Set(value As String)
            _sensorType = value
        End Set
    End Property
    Private _pageID As String
    Public Property PageID As String
        Get
            Return _pageID
        End Get
        Set(value As String)
            _pageID = value
        End Set
    End Property
    Private _pageCompID As String
    Public Property PageCompID As Long
        Get
            Return _pageCompID
        End Get
        Set(value As Long)
            _pageCompID = value
        End Set
    End Property

    '---------------------------------------------------------------------------------------------------'
    '--------------------------------------- PAGE LOAD EVENTS ------------------------------------------'
    '---------------------------------------------------------------------------------------------------'
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PageCostType = Request.QueryString("ctype")
        PageSensorType = Request.QueryString("stype")
        PageCompID = Request.QueryString("ID")

        If PageCostType = "" Or PageSensorType = "" Then
            Response.Redirect("~/Admin/Pricing.aspx?ctype=1&stype=1")
        End If
        If Not IsPostBack Then
            SensorTypeDropDown.SelectedValue = PageSensorType
            PageID = Request.QueryString("pageID")
            If PageID <> "" Then
                CostUpGridView.PageIndex = PageID
            End If
           
        End If
        CostUpGridView.SelectedIndex = -1
     
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As System.EventArgs) Handles Me.PreRenderComplete
        Dim dc As New QPriceDataClassesDataContext
        Dim sensorTypeID As String = SensorTypeDropDown.SelectedValue.ToString
        MainSensorTypeLabel.Text = (From s In dc.SensorTypes
                                    Where s.TypeID = sensorTypeID
                                    Select s.TypeDesc).Single

        MainCostTypeLabel.Text = (From c In dc.CostTypes
                                  Where (c.CostTypeID = PageCostType)
                                  Select c.CostTypeDesc).Single

        Dim noItemExists As Boolean = CostUpGridView.Rows.Count < 1

        If (noItemExists) Then
            NullLabel.Text = "No Items Exist For Sensor Type '" & SensorTypeDropDown.SelectedItem.ToString & "'"
            NullLabel.Visible = True
        Else
            NullLabel.Visible = False
        End If

        Try
            For Each gvRow As GridViewRow In CostUpGridView.Rows
                If CInt(CostUpGridView.DataKeys(gvRow.DataItemIndex).Value) = PageCompID Then
                    CostUpGridView.SelectedIndex = gvRow.DataItemIndex
                    Exit For
                End If
            Next
        Catch ex As Exception

        End Try

    End Sub

    '---------------------------------------------------------------------------------------------------'
    '--------------------------------------- ROW DATA BOUND HANDLING -----------------------------------'
    '---------------------------------------------------------------------------------------------------'
    Protected Sub CostUpGridView_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CostUpGridView.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim mySensor As New TemperatureSensor
            Dim primaryKey As Long = CostUpGridView.DataKeys(e.Row.RowIndex).Value
            Dim totalCost = mySensor.GetBaseCost(primaryKey)
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(Me.CostUpGridView, "Select$" + e.Row.RowIndex.ToString()))
            DirectCast(e.Row.FindControl("CostLabel"), Label).Text = FormatCurrency(totalCost)
        End If
    End Sub

    '---------------------------------------------------------------------------------------------------'
    '------------------------------------SELECTED INDEX CHANGED HANDLING -------------------------------'
    '---------------------------------------------------------------------------------------------------'

    Protected Sub CostUpGridView_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles CostUpGridView.SelectedIndexChanged

        Response.Redirect("~/Admin/EditPricing.aspx?ID=" & CostUpGridView.SelectedDataKey.Value & _
                         "&ctype=" & PageCostType & _
                        "&stype=" & SensorTypeDropDown.SelectedValue & _
                        "&pageID=" & CostUpGridView.PageIndex)
    End Sub
    Protected Sub CostUpGridView_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles CostUpGridView.PageIndexChanging
        CostUpGridView.PageIndex = e.NewPageIndex
    End Sub
    Protected Sub TypeDropDown_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles TypeDropDown.SelectedIndexChanged
        SensorTypeDropDown.SelectedValue = TypeDropDown.SelectedValue
        Call ShowAddModal()
    End Sub

    Protected Sub TempDropDown_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles TempDropDown.SelectedIndexChanged
        Call ShowAddModal()
    End Sub

    Protected Sub SensorTypeDropDown_SelectedIndexChanged(sender As Object, e As EventArgs) Handles SensorTypeDropDown.SelectedIndexChanged
        CostUpGridView.PageIndex = 0
    End Sub

    '---------------------------------------------------------------------------------------------------'
    '--------------------------------------- RENDOR PANELS ---------------------------------------------'
    '---------------------------------------------------------------------------------------------------'
    Protected Sub RendorAddPanel()
        Dim sensorTypeValue As Integer = SensorTypeDropDown.SelectedValue
        Dim sensorType As String = SensorTypeDropDown.SelectedItem.ToString
        Dim IsHighTemp As Boolean = TempDropDown.SelectedItem.ToString = "High"

        TypeDropDown.SelectedValue = sensorTypeValue
        CostTypeLabel.Text = sensorType

        'EditSensorTypeDropDown.Visible = True
        SheathTermPanel.Visible = True
        LeadwireTermPanel.Visible = False
        ElementPanel.Visible = False
        WireCountPanel.Visible = True
        CalibrationPanel.Visible = True
        TempPanel.Visible = False
        SheathODPanel.Visible = True
        CIPPanel.Visible = False
        IPPanel.Visible = False
        TWAssemblyPanel.Visible = False
        QuickConnect_Panel.Visible = False

        Select Case PageCostType
            Case 1 'Base Product Pricing
                Select Case sensorType
                    Case "RTD", "Plastic RTD"
                        ElementPanel.Visible = True
                        CalibrationPanel.Visible = False
                        WireCountPanel.Visible = False
                        TempPanel.Visible = True
                        If Not IsHighTemp Then
                            SheathODPanel.Visible = False
                        End If
                    Case "Plastics"
                        SheathODPanel.Visible = False
                End Select
            Case 2 'Sheath Termination Pricing
                SheathODPanel.Visible = False
                If sensorType = "RTD" Then
                    TempPanel.Visible = True
                End If
            Case 3 'Leadwire Termination Pricing
                SheathTermPanel.Visible = False
                LeadwireTermPanel.Visible = True
                SheathODPanel.Visible = False
            Case 4 ' CIP Pricing
                CIPPanel.Visible = True
                SheathTermPanel.Visible = False
                CalibrationPanel.Visible = False
                WireCountPanel.Visible = False
                SheathODPanel.Visible = False
            Case 5 'Insertion Probe Pricing
                SheathTermPanel.Visible = False
                CalibrationPanel.Visible = False
                WireCountPanel.Visible = False
                SheathODPanel.Visible = False
                IPPanel.Visible = True
            Case 6 ' Thermowell Assemblies
                SheathTermPanel.Visible = False
                CalibrationPanel.Visible = False
                WireCountPanel.Visible = False
                SheathODPanel.Visible = False
                TWAssemblyPanel.Visible = True
            Case 7 '  Quick Connect
                SheathTermPanel.Visible = False
                CalibrationPanel.Visible = False
                WireCountPanel.Visible = False
                SheathODPanel.Visible = False
                QuickConnect_Panel.Visible = True
        End Select

        Select Case sensorType
            Case "RTD", "Plastic RTD"
                CalibrationDropDown.SelectedValue = 1
            Case "MgO", "Plastic"
                CalibrationDropDown.SelectedValue = 2
        End Select
    End Sub

    Protected Sub ShowAddModal()
        Call RendorAddPanel()
        AddModalPopup.Show()
    End Sub

    '---------------------------------------------------------------------------------------------------'
    '--------------------------------------------CODE GENERATORS ---------------------------------------'
    '---------------------------------------------------------------------------------------------------'

    Private Function GenerateBaseCode(ByVal myCostup As CostUp) As String
        Dim dc As New QPriceDataClassesDataContext
        Dim sheathODCode As String, sheathTermCode As String, calibrationCode As String, _
            elementCode As String, temperatureCode As String, sdCode As String

        Dim sensorTypeCode = (From s In dc.SensorTypes
                              Where s.TypeID = myCostup.SensorType_ID
                              Select s.TypeCode).Single

        calibrationCode = (From c In dc.Calibrations
                          Where c.CalID = myCostup.Cal_ID
                          Select c.CalCode).Single
        Try
            temperatureCode = (From t In dc.Temperatures
                                                Where t.TempID = myCostup.Temp_ID
                                                Select t.TempCode).Single
        Catch ex As Exception
            temperatureCode = ""
        End Try


        If sensorTypeCode = "M" Or temperatureCode = "H" Then
            sheathODCode = (From o In dc.ODs
                            Where o.ODID = myCostup.OD_ID
                            Select o.ODCode).Single
        Else
            sheathODCode = ""
        End If

        sheathTermCode = myCostup.SheathTermCode

        Dim baseCode As String = ""

        Select Case sensorTypeCode
            Case "R", "F" 'RTD or Plastic RTD
                elementCode = myCostup.ElementCode
                baseCode = sensorTypeCode & sheathTermCode & elementCode & temperatureCode
                If temperatureCode = "H" Then
                    baseCode = baseCode & "-" & sheathODCode
                End If
            Case "M", "P" 'Mgo or Plastics
                sdCode = (From s In dc.WireCounts
                          Where s.WireCountID = myCostup.WireCount_ID
                          Select s.WireCount).Single
                If CInt(sdCode) < 4 Then
                    sdCode = "0"
                End If
                baseCode = sensorTypeCode & sheathTermCode & calibrationCode & sdCode & "G"
                If sensorTypeCode = "M" Then
                    baseCode = baseCode & "-" & sheathODCode
                End If
        End Select
        GenerateBaseCode = UCase(baseCode)

    End Function
    Private Function GenerateTermCode(ByVal myCostup As CostUp) As String
        Dim dc As New QPriceDataClassesDataContext

        Dim sensorTypeCode = (From s In dc.SensorTypes
                              Where s.TypeID = myCostup.SensorType_ID
                              Select s.TypeCode).Single

        Dim termCode As String
        If IsNothing(myCostup.SheathTermCode) Then
            termCode = myCostup.LeadwireTermCode
        Else
            termCode = myCostup.SheathTermCode
        End If

        Dim wireCode = (From w In dc.WireCounts
                        Where w.WireCountID = myCostup.WireCount_ID
                        Select w.WireCount).Single

        Dim calibrationCode = (From c In dc.Calibrations
                                Where c.CalID = myCostup.Cal_ID
                                Select c.CalCode).Single

        Dim temperatureCode = (From t In dc.Temperatures
                               Where t.TempID = myCostup.Temp_ID
                               Select t.TempCode).SingleOrDefault

        termCode = sensorTypeCode & termCode & "-" & wireCode
        If sensorTypeCode = "M" Or sensorTypeCode = "P" Then
            termCode = termCode & calibrationCode
        End If
        If sensorTypeCode = "R" Then
            termCode = termCode & temperatureCode
        End If

        If termCode = "H" Then
            Dim sheathODCode = (From o In dc.ODs
                        Where o.ODID = ODDropDown.SelectedValue
                        Select o.ODCode).Single
            termCode = termCode & "-" & sheathODCode
        End If
        GenerateTermCode = UCase(termCode)

    End Function

    Private Function GenerateCIPCode(ByVal myCostUp As CostUp) As String
        Dim dc As New QPriceDataClassesDataContext
        GenerateCIPCode = (From c In dc.CIPCatagories
                           Where c.CIPID = myCostUp.CIP_ID
                           Select c.CIPCode).Single & "-" & myCostUp.CIPCap

    End Function

    Private Function GenerateInsertionCode(ByVal myCostUp As CostUp) As String
        Dim dc As New QPriceDataClassesDataContext
        Dim IPCatagory = (From i In dc.IPCatagories
                          Where i.IPID = myCostUp.IP_ID
                          Select i.IPCode).Single

        Dim IPType = (From t In dc.IPTypes
                      Where t.IPTypeID = myCostUp.IPType_ID
                      Select t.IPTypeCode).Single

        GenerateInsertionCode = IPCatagory & "-" & IPType

    End Function

    Private Function GenerateThermowellAssemblyCode(ByVal myCostUp As CostUp) As String
        Dim dc As New QPriceDataClassesDataContext

        Dim sensorTypeCode = (From s In dc.SensorTypes
                              Where s.TypeID = myCostUp.SensorType_ID
                              Select s.TypeCode).Single

        Dim TWConfig = (From c In dc.TWConfigurations
                        Where c.TWConfigID = myCostUp.TWConfig_ID
                        Select c.TWConfigCode).Single

        Dim TWExtLen = (From l In dc.TWExtLengths
                        Where l.TWExtLengthID = myCostUp.TWExtLength_ID
                        Select l.TWExtLengthCode).Single
        Dim TWMat = (From m In dc.Materials
                     Where m.MaterialID = myCostUp.TWExtMat_ID
                     Select m.MaterialCode).Single

        GenerateThermowellAssemblyCode = sensorTypeCode & "-" & TWConfig & TWExtLen & TWMat

    End Function
    Private Function GenerateQuickConnectCode(ByVal myCostUp As CostUp) As String
        Dim dc As New QPriceDataClassesDataContext

        Dim qcOption = (From q In dc.qcoptions
                       Where q.qcoptionid = myCostUp.QCOption_ID
                       Select q.qcoptioncode).Single

        GenerateQuickConnectCode = "QCA-" & qcOption
    End Function



    '---------------------------------------------------------------------------------------------------'
    '--------------------------------------------- MESSAGES --------------------------------------------'
    '---------------------------------------------------------------------------------------------------'
    Protected Sub ConfirmCostUpExist_LinkButton_Click(sender As Object, e As System.EventArgs) Handles ConfirmCostUpExist_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim primaryKey = (From c In dc.CostUps
                    Where c.CostUpCode = CostUpExistsCode_Label.Text And c.CostType_ID = PageCostType
                    Select c.CostUpID).Single
        Response.Redirect("~/Admin/EditPricing.aspx?ID=" & primaryKey & _
                          "&ctype=" & PageCostType & _
                          "&stype=" & PageSensorType & _
                          "&pageID=" & CostUpGridView.PageIndex)
    End Sub

    '---------------------------------------------------------------------------------------------------'
    '--------------------------------------------- VALIDATION ------------------------------------------'
    '---------------------------------------------------------------------------------------------------'

    Protected Sub SheathCustomValidator_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles SheathCustomValidator.ServerValidate
        If args.Value.Length > 2 Then
            args.IsValid = False
            SheathCustomValidator.ToolTip = "Termination code must be one to two character long."
        Else
            args.IsValid = True

        End If
    End Sub
    Protected Sub LeadwireTermCustomValidator_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles LeadwireTermCustomValidator.ServerValidate
        If args.Value.Length > 4 Then
            args.IsValid = False
        Else
            args.IsValid = True

        End If
    End Sub

    Protected Sub ElementCustomValidator_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles ElementCustomValidator.ServerValidate
        If args.Value.Length > 2 Or args.Value.Length < 2 Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub
    Function CostUpExists(ByVal myCostUp As CostUp) As Boolean
        Dim dc As New QPriceDataClassesDataContext
        Dim costID As Long
        CostUpExists = True
        Try
            costID = (From c In dc.CostUps
                              Where c.CostUpCode = myCostUp.CostUpCode _
                              And c.CostType_ID = myCostUp.CostType_ID _
                              And c.SensorType_ID = myCostUp.SensorType_ID _
                              And c.CostUpID <> myCostUp.CostUpID
                              Select c.CostUpID).Single
        Catch ex As Exception
            CostUpExists = False
        End Try
    End Function

    '------------------------------------------------------------------------------------------------------'
    '----------------------------------------------- BUTTONS ----------------------------------------------'
    '------------------------------------------------------------------------------------------------------'
    Protected Sub AddProduct_LinkButton_Click(sender As Object, e As System.EventArgs) Handles AddProduct_LinkButton.Click


        If Page.IsValid Then
            Dim dc As New QPriceDataClassesDataContext
            Dim myCostUp As New CostUp

            Dim sensorTypeValue As Long = TypeDropDown.SelectedValue
            Dim code As String = ""

            With myCostUp
                .SensorType_ID = sensorTypeValue
                .CostType_ID = PageCostType
                .WireCount_ID = WireCountDropDown.SelectedValue
                .Cal_ID = CalibrationDropDown.SelectedValue
                .CostUpCode = code
                .CostUpDesc = DescTextBox.Text
                .PPH = 1
                .Markup = 3
                .Overhead = 0.12

                If ElementPanel.Visible = True Then
                    .ElementCode = UCase(ElementTextBox.Text)
                End If
                If SheathTermPanel.Visible = True Then
                    .SheathTermCode = UCase(SheathTermTextBox.Text)
                End If
                If LeadwireTermPanel.Visible = True Then
                    .LeadwireTermCode = UCase(LeadwireTermTextBox.Text)
                End If
                If SheathODPanel.Visible = True Then
                    .OD_ID = ODDropDown.SelectedValue
                End If
                If TempPanel.Visible = True Then
                    .Temp_ID = TempDropDown.SelectedValue
                End If
                If CIPPanel.Visible = True Then
                    .CIP_ID = CIPDropDown.SelectedValue
                    .CIPCap = CIPCapDropDown.SelectedValue
                End If
                If IPPanel.Visible = True Then
                    .IP_ID = IPCatDropDown.SelectedValue
                    .IPType_ID = IPTypeDropDown.SelectedValue
                End If
                If TWAssemblyPanel.Visible = True Then
                    .TWConfig_ID = TWConfigDropDown.SelectedValue
                    .TWExtLength_ID = TWExtLenghtDropDown.SelectedValue
                    .TWExtMat_ID = TWMaterialDropDown.SelectedValue
                End If
                If QuickConnect_Panel.Visible = True Then
                    .QCOption_ID = QuickConnect_DropDownList.SelectedValue
                End If
            End With

            Select Case PageCostType
                Case 1 'Base Product Price
                    myCostUp.CostUpCode = GenerateBaseCode(myCostUp)
                Case 2, 3 'Sheath & Leadwire Termination Price
                    myCostUp.CostUpCode = GenerateTermCode(myCostUp)
                Case 4 ' CIP Price
                    myCostUp.CostUpCode = GenerateCIPCode(myCostUp)
                Case 5 'Insertion Probe Price
                    myCostUp.CostUpCode = GenerateInsertionCode(myCostUp)
                Case 6 'Thermowell Assemblies
                    myCostUp.CostUpCode = GenerateThermowellAssemblyCode(myCostUp)
                Case 7 'Quick Connect
                    myCostUp.CostUpCode = GenerateQuickConnectCode(myCostUp)
            End Select

            If Not CostUpExists(myCostUp) Then
                dc.CostUps.InsertOnSubmit(myCostUp)
                dc.SubmitChanges()
                dc.Dispose()
                CostUpGridView.DataBind()
                Call ClearAddModal()
            Else
                Call ClearAddModal()
                CostUpExistsCode_Label.Text = myCostUp.CostUpCode
                costUpExistsError.Attributes.Add("style", "display:block;")
                ShowAddModal()
                ' Call CostUpExistsMessage(myCostUp.CostUpCode)
            End If
        Else
            Call ShowAddModal()
        End If
    End Sub

    Protected Sub CloseAddImageButton_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles CloseAddImageButton.Click
        Call ClearAddModal()
        AddModalPopup.Hide()
    End Sub

    '---------------------------------------------------------------------------------------------------'
    '--------------------------------------------- CLEAR DATA ------------------------------------------'
    '---------------------------------------------------------------------------------------------------'

    Protected Sub ClearAddModal()
        DescTextBox.Text = ""
        SheathTermTextBox.Text = ""
        LeadwireTermTextBox.Text = ""
        ElementTextBox.Text = ""
        WireCountDropDown.SelectedValue = 1
        costUpExistsError.Attributes.Add("style", "display:none;")
    End Sub


End Class
