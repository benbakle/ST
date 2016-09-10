
Partial Class Admin_EditPricing
    Inherits System.Web.UI.Page

    '************************
    'Properties and Functions
    '************************
    Private _primaryKey As Integer
    Public Property primaryKey() As Integer
        Get
            Return _primaryKey
        End Get
        Set(value As Integer)
            _primaryKey = value
        End Set
    End Property
    Private _costType As Integer
    Public Property costType() As Integer
        Get
            Return _costType
        End Get
        Set(value As Integer)
            _costType = value
        End Set
    End Property
    Private _sensorType As Integer
    Public Property sensorType() As Integer
        Get
            Return _sensorType
        End Get
        Set(value As Integer)
            _sensorType = value
        End Set
    End Property

    Protected Function GetCostUp(ByRef dc As QPriceDataClassesDataContext, ByVal primaryKey As Long) As CostUp
        GetCostUp = (From c In dc.CostUps
                   Where c.CostUpID = primaryKey
                   Select c).SingleOrDefault
    End Function

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim dc As New QPriceDataClassesDataContext
        primaryKey = Request.QueryString("ID")
        costType = Request.QueryString("ctype")
        On Error Resume Next
        sensorType = Request.QueryString("stype")

        If Not IsPostBack Then
            Dim myCostUp = GetCostUp(dc, primaryKey)
            Call PopulateCostupLayout(myCostUp)
            Call RendorManagePanel()
        End If
        If Code_Label.Text = "" Then
            DuplicateLinkButton.Visible = False
        End If
        noAddComponentSelectedError.Attributes.Add("style", "display:none;")
        noComponentSelectedError.Attributes.Add("style", "display:none;")
        deleteComponentFromCostupConfirm.Attributes.Add("style", "display:none;")
    End Sub

    '****************************
    ' ComponentGridView Functions
    '****************************
    Protected Sub ComponentGridView_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles ComponentGridView.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(Me.ComponentGridView, "Select$" + e.Row.RowIndex.ToString()))
        End If
    End Sub
    Protected Sub ComponentGridView_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ComponentGridView.SelectedIndexChanged
        Dim dc As New QPriceDataClassesDataContext
        Dim primaryKey As Long = ComponentGridView.SelectedDataKey.Value
        Dim componentDesc = (From c In dc.CostComponentKeys
                             Where c.CCID = primaryKey
                             Select c.Component.CompDesc).Single
        ComponentDesc_Label.Text = componentDesc
        CostupCode_Label.Text = Code_Label.Text
        If (ComponentGridView.EditIndex > -1) Then
            ComponentGridView.UpdateRow(ComponentGridView.EditIndex, False)
        End If
        ComponentGridView.EditIndex = ComponentGridView.SelectedIndex
    End Sub

    Protected Sub EditTempDropDown_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles EditTempDropDown.SelectedIndexChanged
        If (EditTempDropDown.SelectedItem.ToString = "High") Then
            EditODPanel.Visible = True
        Else
            EditODPanel.Visible = False
        End If
    End Sub
    '****************************
    'Render Cost Up Data
    '****************************
    Protected Sub PopulateCostupLayout(ByVal myCostUp As CostUp)
        Dim mySensor As New TemperatureSensor
        Dim materialCost As Decimal, overhead As Decimal, pph As Decimal, _
            markup As Decimal, laborRate As Decimal, baseCost As Decimal

        Dim primaryKey As Long = myCostUp.CostUpID

        Try
            materialCost = mySensor.GetMaterialCost(primaryKey)
            pph = mySensor.GetPPH(primaryKey)
            markup = mySensor.GetMarkup(primaryKey)
            laborRate = mySensor.GetLaborRate(primaryKey)
            baseCost = mySensor.GetBaseCost(primaryKey)
        Catch ex As Exception
            pph = 1 'set to "1" so not dividing by "0" on PPHLabel.Text. Would error.
        End Try


        overhead = mySensor.GetOverhead(primaryKey)

        CostLabel.Text = FormatCurrency(materialCost)
        MaterialTotal_Label.Text = FormatCurrency(materialCost)
        OverHeadLabel.Text = "Overhead + "
        OverheadLinkButton.Text = FormatPercent(overhead, 0)
        OverheadTextBox.Text = overhead
        OverHeadCostLabel.Text = FormatCurrency(materialCost * overhead)
        PPHLabel.Text = FormatCurrency(laborRate / pph)
        MarkUpLabel.Text = FormatCurrency(Math.Round(Math.Round(materialCost, 2) * (1 + overhead), 2) + (laborRate / pph)) & " x "
        MarkUpLinkButton.Text = markup
        MarkUpTextBox.Text = markup
        LaborLinkButton.Text = pph
        LaborTextBox.Text = pph
        LaborLabel.Text = "parts per hour:"
        LaborCostLabel.Text = "(" & FormatCurrency(laborRate) & "/hr)"
        TotalCostLabel.Text = FormatCurrency(baseCost)
    End Sub
    Protected Sub RendorManagePanel()
        Dim dc As New QPriceDataClassesDataContext
        Dim myCostUp = GetCostUp(dc, primaryKey)

        Dim typeCode = myCostUp.SensorType.TypeCode
        Dim costType = myCostUp.CostType_ID

        EditSensorTypePanel.Visible = False
        EditSheathTermPanel.Visible = True
        EditLWTermPanel.Visible = False
        EditTempPanel.Visible = False
        EditODPanel.Visible = False
        EditWireCountPanel.Visible = True
        EditCalPanel.Visible = True
        EditElementPanel.Visible = False
        EditCIPPanel.Visible = False
        EditIPPanel.Visible = False
        EditTWAssemblyPanel.Visible = False
        EditQuickConnect_Panel.Visible = False

        Select Case costType
            Case 1
                Select Case typeCode
                    Case "R", "F"
                        EditTempDropDown.SelectedValue = myCostUp.Temp_ID
                        EditTempPanel.Visible = True
                        EditWireCountPanel.Visible = False
                        EditCalPanel.Visible = False
                        EditElementPanel.Visible = True
                        If myCostUp.Temperature.TempCode = "H" Then
                            EditODPanel.Visible = True
                        End If
                    Case "M"
                        EditODPanel.Visible = True
                End Select
            Case 2
                Select Case typeCode
                    Case "R"
                        EditTempPanel.Visible = True
                End Select
            Case 3
                Select Case typeCode
                    Case "R", "F"
                        EditSheathTermPanel.Visible = False
                        EditLWTermPanel.Visible = True
                    Case "M", "P"
                        EditSheathTermPanel.Visible = False
                        EditODPanel.Visible = False
                        EditLWTermPanel.Visible = True
                End Select
            Case 4
                EditCIPPanel.Visible = True
                EditSheathTermPanel.Visible = False
                EditWireCountPanel.Visible = False
                EditCalPanel.Visible = False
            Case 5 'Insertion Probes
                EditSheathTermPanel.Visible = False
                EditWireCountPanel.Visible = False
                EditCalPanel.Visible = False
                EditIPPanel.Visible = True
            Case 6 'Thermowell Assemblies
                EditSheathTermPanel.Visible = False
                EditWireCountPanel.Visible = False
                EditCalPanel.Visible = False
                EditTWAssemblyPanel.Visible = True
            Case 7 ' Quick Connect
                EditSheathTermPanel.Visible = False
                EditWireCountPanel.Visible = False
                EditCalPanel.Visible = False
                EditQuickConnect_Panel.Visible = True

        End Select

        Call PopulateEditManager(myCostUp)

        dc.Dispose()
    End Sub
    Protected Sub PopulateEditManager(ByVal myCostUp As CostUp)
        Dim dc As New QPriceDataClassesDataContext

        Code_Label.Text = myCostUp.CostUpCode
        DescLabel.Text = myCostUp.CostUpDesc
        EditDescTextBox.Text = myCostUp.CostUpDesc
        EditSheathTermTextBox.Text = myCostUp.SheathTermCode
        EditLWTermTextBox.Text = myCostUp.LeadwireTermCode
        EditSensorTypeDropDown.SelectedValue = myCostUp.SensorType_ID
        EditElementTextBox.Text = myCostUp.ElementCode
        EditCalDropDown.SelectedValue = myCostUp.Cal_ID

        If Not IsNothing(myCostUp.WireCount_ID) Then
            EditWireCountDropDown.SelectedValue = myCostUp.WireCount_ID
        End If
        If Not IsNothing(myCostUp.Temp_ID) Then
            EditTempDropDown.SelectedValue = myCostUp.Temp_ID
        End If
        If Not IsNothing(myCostUp.OD_ID) Then
            EditODDropDown.SelectedValue = myCostUp.OD_ID
        End If
        If Not IsNothing(myCostUp.CIP_ID) Then
            EditCIPTypeDropDown.SelectedValue = myCostUp.CIP_ID
            EditCIPCapDropDown.SelectedValue = myCostUp.CIPCap

        End If
        If Not IsNothing(myCostUp.IP_ID) Then
            EditIPCatDropDown.SelectedValue = myCostUp.IP_ID
            EditIPTypeDropDown.SelectedValue = myCostUp.IPType_ID
        End If
        If Not IsNothing(myCostUp.TWConfig_ID) Then
            EditTWConfigDropDown.SelectedValue = myCostUp.TWConfig_ID
            EditTWExtLengthDropDown.SelectedValue = myCostUp.TWExtLength_ID
            EditTWExtMaterialDropDown.SelectedValue = myCostUp.TWExtMat_ID
        End If
        If Not IsNothing(myCostUp.QCOption_ID) Then
            EditQuickConnect_DropDownList.SelectedValue = myCostUp.QCOption_ID
        End If

    End Sub


    '*******************************
    'Link Button to Textbox Handling
    '*******************************
    Protected Sub OverheadLinkButton_Click(sender As Object, e As System.EventArgs) Handles OverheadLinkButton.Click
        OverheadLinkButton.Visible = False
        OverheadTextBox.Visible = True
    End Sub

    Protected Sub LaborLinkButton_Click(sender As Object, e As System.EventArgs) Handles LaborLinkButton.Click
        LaborLinkButton.Visible = False
        LaborTextBox.Visible = True
    End Sub

    Protected Sub MarkUpLinkButton_Click(sender As Object, e As System.EventArgs) Handles MarkUpLinkButton.Click
        MarkUpLinkButton.Visible = False
        MarkUpTextBox.Visible = True
    End Sub

    '***************
    'Button Handeling
    '***************
    Protected Sub AddComponent_Click(sender As Object, e As System.EventArgs) Handles AddComponent.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim myCostComponentKey As New CostComponentKey
        Dim compID As Long
        Try
            compID = ComponentListBox.SelectedValue
        Catch ex As Exception
            noAddComponentSelectedError.Attributes.Add("style", "display:block;")
            AddComponentModalPopup.Show()
            Exit Sub
        End Try

        Dim qty As Decimal = NumberFunctions.StringToNumeric(QtyTextBox.Text, 1)

        Dim myCostUp = GetCostUp(dc, primaryKey)

        myCostComponentKey.CostUp_ID = primaryKey
        myCostComponentKey.Comp_ID = compID
        myCostComponentKey.Quantity = qty

        dc.CostComponentKeys.InsertOnSubmit(myCostComponentKey)
        dc.SubmitChanges()
        dc.Dispose()
        ComponentGridView.DataBind()
        QtyTextBox.Text = ""
        Call PopulateCostupLayout(myCostUp)
    End Sub


    Protected Sub TriggerUpdate_Click(sender As Object, e As System.EventArgs) Handles TriggerUpdate.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim myCostUp = GetCostUp(dc, primaryKey)

        Try
            ComponentGridView.UpdateRow(ComponentGridView.EditIndex, False)
            ComponentGridView.EditIndex = -1
            ComponentGridView.SelectedIndex = -1
        Catch ex As Exception

        End Try

        Try
            myCostUp.Overhead = CDec(OverheadTextBox.Text)
        Catch ex As Exception
            myCostUp.Overhead = 0.12
        End Try

        Try
            myCostUp.Markup = CDec(MarkUpTextBox.Text)
        Catch ex As Exception
            myCostUp.Markup = 3
        End Try

        Try
            myCostUp.PPH = CDec(LaborTextBox.Text)
        Catch ex As Exception
            myCostUp.PPH = 1
        End Try

        Try
            myCostUp.Markup = CDec(MarkUpTextBox.Text)
        Catch ex As Exception
            myCostUp.Markup = 3
        End Try
        OverheadLinkButton.Text = FormatPercent(myCostUp.Overhead)
        OverheadTextBox.Text = myCostUp.Overhead
        LaborLinkButton.Text = CDec(myCostUp.PPH).ToString
        LaborTextBox.Text = CDec(myCostUp.PPH).ToString
        MarkUpLinkButton.Text = CDec(myCostUp.Markup).ToString
        MarkUpTextBox.Text = CDec(myCostUp.Markup).ToString
        dc.SubmitChanges()
        dc.Dispose()

        OverheadTextBox.Visible = False
        OverheadLinkButton.Visible = True
        LaborTextBox.Visible = False
        LaborLinkButton.Visible = True
        MarkUpTextBox.Visible = False
        MarkUpLinkButton.Visible = True
        Call PopulateCostupLayout(myCostUp)
    End Sub

    'Protected Sub RevertButton_Click(sender As Object, e As System.EventArgs) Handles RevertButton.Click
    '    Call RendorManagePanel()
    'End Sub

    Protected Sub DuplicateLinkButton_Click(sender As Object, e As System.EventArgs) Handles DuplicateLinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim myNewCostUp As New CostUp

        Dim myCostUp = GetCostUp(dc, primaryKey)

        With myNewCostUp
            .CostUpDesc = myCostUp.CostUpDesc
            .SensorType_ID = myCostUp.SensorType_ID
            .CostType_ID = myCostUp.CostType_ID
            .WireCount_ID = myCostUp.WireCount_ID
            .ElementCode = myCostUp.ElementCode
            .SheathTermCode = myCostUp.SheathTermCode
            .LeadwireTermCode = myCostUp.LeadwireTermCode
            .Cal_ID = myCostUp.Cal_ID
            .OD_ID = myCostUp.OD_ID
            .Temp_ID = myCostUp.Temp_ID
            .PPH = myCostUp.PPH
            .Markup = myCostUp.Markup
            .Overhead = myCostUp.Overhead
        End With
        dc.CostUps.InsertOnSubmit(myNewCostUp)
        dc.SubmitChanges()

        Dim myLinkedComponents = From c In dc.CostComponentKeys
                        Where c.CostUp_ID = primaryKey
                        Select c.Quantity, c.Comp_ID

        For Each c In myLinkedComponents
            Dim myNewCostComponentKey As New CostComponentKey
            myNewCostComponentKey.CostUp_ID = myNewCostUp.CostUpID
            myNewCostComponentKey.Quantity = c.Quantity
            myNewCostComponentKey.Comp_ID = c.Comp_ID
            dc.CostComponentKeys.InsertOnSubmit(myNewCostComponentKey)
            dc.SubmitChanges()
        Next
        Response.Redirect("~/Admin/EditPricing.aspx?ID=" & myNewCostUp.CostUpID & _
                          "&ctype=" & costType & _
                          "&stype=" & sensorType & _
                          "&pageID=" & Request.QueryString("pageID"))

        If EditSheathTermPanel.Visible = True Then
            EditSheathTermTextBox.Focus()
        Else
            EditLWTermTextBox.Focus()
        End If
        dc.Dispose()
    End Sub

    Protected Sub CompDoneButton_Click(sender As Object, e As System.EventArgs) Handles CompDoneButton.Click
        If Page.IsValid Then
            Call SaveCostUp()
        End If
    End Sub
    Protected Sub SaveCostUp()

        Dim dc As New QPriceDataClassesDataContext
        Dim myCostUp = GetCostUp(dc, primaryKey)

        Dim tempCostUp As New CostUp

        Dim cLabel As String = Code_Label.Text
        tempCostUp.CostUpID = primaryKey
        tempCostUp.CostType_ID = costType
        tempCostUp.SensorType_ID = sensorType
        tempCostUp.CostUpDesc = EditDescTextBox.Text
        Try
            tempCostUp.Cal_ID = EditCalDropDown.SelectedValue
        Catch ex As Exception
            tempCostUp.Cal_ID = 1
        End Try


        If (EditSheathTermPanel.Visible = True) Then
            tempCostUp.SheathTermCode = UCase(EditSheathTermTextBox.Text)
        End If
        If (EditLWTermPanel.Visible = True) Then
            tempCostUp.LeadwireTermCode = UCase(EditLWTermTextBox.Text)
        End If
        If (EditElementPanel.Visible = True) Then
            tempCostUp.ElementCode = UCase(EditElementTextBox.Text)
        End If
        If (EditWireCountPanel.Visible = True) Then
            tempCostUp.WireCount_ID = EditWireCountDropDown.SelectedValue
        End If

        If (EditTempPanel.Visible = True) Then
            tempCostUp.Temp_ID = EditTempDropDown.SelectedValue
        End If
        If (EditODPanel.Visible = True) Then
            tempCostUp.OD_ID = EditODDropDown.SelectedValue
        End If
        If (EditCIPPanel.Visible = True) Then
            tempCostUp.CIP_ID = EditCIPTypeDropDown.SelectedValue
            tempCostUp.CIPCap = EditCIPCapDropDown.SelectedValue
        End If
        If (EditIPPanel.Visible = True) Then
            tempCostUp.IP_ID = EditIPCatDropDown.SelectedValue
            tempCostUp.IPType_ID = EditIPTypeDropDown.SelectedValue
            If tempCostUp.IP_ID = 2 Then
                tempCostUp.SensorType_ID = 3
            Else
                tempCostUp.SensorType_ID = 1
            End If
        End If
        If (EditTWAssemblyPanel.Visible = True) Then
            tempCostUp.TWConfig_ID = EditTWConfigDropDown.SelectedValue
            tempCostUp.TWExtLength_ID = EditTWExtLengthDropDown.SelectedValue
            tempCostUp.TWExtMat_ID = EditTWExtMaterialDropDown.SelectedValue
        End If
        If (EditQuickConnect_Panel.Visible = True) Then
            tempCostUp.QCOption_ID = EditQuickConnect_DropDownList.SelectedValue
        End If

        Select Case myCostUp.CostType_ID
            Case 1
                tempCostUp.CostUpCode = GenerateBaseCode(tempCostUp)
            Case 2, 3
                tempCostUp.CostUpCode = GenerateTermCode(tempCostUp)
            Case 4
                tempCostUp.CostUpCode = GenerateCIPCode(tempCostUp)
            Case 5
                tempCostUp.CostUpCode = GenerateInsertionCode(tempCostUp)
            Case 6
                tempCostUp.CostUpCode = GenerateThermowellAssemblyCode(tempCostUp)
            Case 7
                tempCostUp.CostUpCode = GenerateQuickConnectCode(tempCostUp)
        End Select

        If CostUpExists(tempCostUp) Then
            Call ShowCostUpExistsMessage(tempCostUp.CostUpCode)
        Else
            With myCostUp
                .CostUpCode = tempCostUp.CostUpCode
                .CostUpDesc = tempCostUp.CostUpDesc
                .CostType_ID = tempCostUp.CostType_ID
                .SensorType_ID = tempCostUp.SensorType_ID
                .SheathTermCode = tempCostUp.SheathTermCode
                .LeadwireTermCode = tempCostUp.LeadwireTermCode
                .ElementCode = tempCostUp.ElementCode
                .WireCount_ID = tempCostUp.WireCount_ID
                .Cal_ID = tempCostUp.Cal_ID
                .Temp_ID = tempCostUp.Temp_ID
                .OD_ID = tempCostUp.OD_ID
                .CIP_ID = tempCostUp.CIP_ID
                .CIPCap = tempCostUp.CIPCap
                .IP_ID = tempCostUp.IP_ID
                .IPType_ID = tempCostUp.IPType_ID
                .TWConfig_ID = tempCostUp.TWConfig_ID
                .TWExtLength_ID = tempCostUp.TWExtLength_ID
                .TWExtMat_ID = tempCostUp.TWExtMat_ID
                .QCOption_ID = tempCostUp.QCOption_ID
            End With
            dc.SubmitChanges()
            Response.Redirect("~/Admin/Pricing.aspx?ID=" & primaryKey & "&ctype=" & costType & "&stype=" & sensorType & "&pageID=" & Request.QueryString("pageID"))
        End If

        dc.Dispose()


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
            primaryKey = costID
        Catch ex As Exception
            CostUpExists = False
        End Try
    End Function


    '*******************
    'Generate Base Code
    '*******************
    Private Function GenerateBaseCode(ByVal myCostup As CostUp) As String
        Dim dc As New QPriceDataClassesDataContext
        Dim sheathODCode As String, sheathTermCode As String, calibrationCode As String, _
            elementCode As String, temperatureCode As String, sdCode As String

        Dim sensorTypeCode = (From s In dc.SensorTypes
                              Where s.TypeID = myCostup.SensorType_ID
                              Select s.TypeCode).Single

        Try
        calibrationCode = (From c In dc.Calibrations
                          Where c.CalID = myCostup.Cal_ID
                          Select c.CalCode).Single

        Catch ex As Exception
            calibrationCode = "U"
        End Try
        Try
            temperatureCode = (From t In dc.Temperatures
                                                Where t.TempID = myCostup.Temp_ID
                                                Select t.TempCode).Single
        Catch ex As Exception
            temperatureCode = ""
        End Try


        If (sensorTypeCode = "M" Or temperatureCode = "H") Then
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
                        Where o.ODID = EditODDropDown.SelectedValue
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

        Dim qcOption = (From q In dc.QCOptions
                       Where q.QCOptionID = myCostUp.QCOption_ID
                       Select q.QCOptionCode).Single

        GenerateQuickConnectCode = "QCA-" & qcOption
    End Function



    '*******************
    'Validation Handling
    '*******************
    Protected Sub SheathCustomValidator_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles SheathCustomValidator.ServerValidate
        If args.Value.Length > 2 Then
            args.IsValid = False
        Else
            args.IsValid = True

        End If
    End Sub
    Protected Sub LeadwireTermCustomValidator_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles LeadwireTermCustomValidator.ServerValidate
        If args.Value.Length > 4 Then
            args.IsValid = False
            'LeadwireTermCustomValidator.ToolTip = "Termination code can only be four characters long."
        Else
            args.IsValid = True

        End If
    End Sub

    Protected Sub ElementCustomValidator_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles ElementCustomValidator.ServerValidate
        If args.Value.Length > 2 Or args.Value.Length < 2 Then
            args.IsValid = False
            'ElementCustomValidator.ToolTip = "Element code should be two characters long."
        Else
            args.IsValid = True
        End If
    End Sub
    



    ''**********
    ''Messages
    ''**********
    Protected Sub ConfirmDeleteCostUp_LinkButton_Click(sender As Object, e As System.EventArgs) Handles ConfirmDeleteCostUp_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext

        Dim linkedComponents = From c In dc.CostComponentKeys
                               Where c.CostUp_ID = primaryKey
                               Select c

        Dim baseCost = (From b In dc.CostUps
                       Where b.CostUpID = primaryKey
                       Select b).Single
        Dim costType = baseCost.CostType_ID

        dc.CostUps.DeleteOnSubmit(baseCost)

        For Each c In linkedComponents
            dc.CostComponentKeys.DeleteOnSubmit(c)
        Next
        Try
            dc.SubmitChanges()
        Catch ex As Exception
        End Try

        Response.Redirect("~/Admin/Pricing.aspx?ctype=" & costType & "&stype=" & sensorType)
    End Sub

    Protected Sub ShowCostUpExistsMessage(ByVal code As String)
        Code_HiddenField.Value = code
        CostUpExistsCode_Label.Text = code
        costUpExistsError.Attributes.Add("style", "display:block;")
    End Sub

    Protected Sub ConfirmCostUpExist_LinkButton_Click(sender As Object, e As System.EventArgs) Handles ConfirmCostUpExist_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim tempCostUp As New CostUp
        tempCostUp = (From c In dc.CostUps
                      Where c.CostUpID = primaryKey
                      Select c).SingleOrDefault


        dc.CostUps.DeleteOnSubmit(tempCostUp)
        dc.SubmitChanges()

        Dim newPrimaryKey = (From c In dc.CostUps
                    Where c.CostUpCode = Code_HiddenField.Value And c.CostType_ID = costType
                    Select c.CostUpID).Single
        Response.Redirect("~/Admin/EditPricing.aspx?ID=" & newPrimaryKey & _
                          "&ctype=" & costType & _
                          "&stype=" & sensorType)
    End Sub


    Protected Sub RemoveComponent_Click(sender As Object, e As System.EventArgs) Handles RemoveComponent.Click
        If ComponentGridView.EditIndex = -1 Then
            noComponentSelectedError.Attributes.Add("style", "display:block;")

        Else
            deleteComponentFromCostupConfirm.Attributes.Add("style", "display:block;")
        End If

    End Sub


 
    Protected Sub DeleteComponentFromCostup_LinkButton_Click(sender As Object, e As System.EventArgs) Handles DeleteComponentFromCostup_LinkButton.Click

        Dim dc As New QPriceDataClassesDataContext
        Dim myCostUp = GetCostUp(dc, primaryKey)
        ComponentGridView.DeleteRow(ComponentGridView.EditIndex)
        ComponentGridView.EditIndex = -1
        ComponentGridView.SelectedIndex = -1
        ComponentGridView.DataBind()
        Call PopulateCostupLayout(myCostUp)
    End Sub


    Private Sub CatagoryDropDownList_TextChanged(sender As Object, e As EventArgs) Handles CatagoryDropDownList.TextChanged
        AddComponentModalPopup.Show()
    End Sub

End Class
