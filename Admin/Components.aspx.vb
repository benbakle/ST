
Partial Class Components
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        GetPartsGridviewDataSource()
        CompExists.Visible = False
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As System.EventArgs) Handles Me.PreRenderComplete

        If (PartsGridView.Rows.Count < 1) Then

            NullLabel.Text = "No Items Exist For Catagory '" & CatagoryDropDown.SelectedItem.ToString & "'"
            NullLabel.Visible = True
            AddPartButton.Visible = True
            DeleteButton.Visible = False
        Else
            NullLabel.Visible = False
            If (PartsGridView.SelectedIndex = -1) Then
                DeleteButton.Visible = False
            Else
                DeleteButton.Visible = True
            End If
        End If
    End Sub

    Private Function GetComponent(ByRef dc As QPriceDataClassesDataContext, ByVal primaryKey As Long) As Component
        GetComponent = (From c In dc.Components
                        Where c.CompID = primaryKey
                        Select c).Single
    End Function

    Protected Sub PartsGridView_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles PartsGridView.PageIndexChanging
        PartsGridView.PageIndex = e.NewPageIndex
        GetPartsGridviewDataSource()
    End Sub

    '**************
    'ROW DATABOUND 
    '**************
    Protected Sub PartsGridView_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles PartsGridView.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(Me.PartsGridView, "Select$" + e.Row.RowIndex.ToString()))
        End If
    End Sub

    Private Const NAString As String = "Does Not Apply"

    Protected Sub AddCalDropDownList_DataBound(sender As Object, e As System.EventArgs) Handles AddCalDropDownList.DataBound
        AddCalDropDownList.Items.Insert(0, New ListItem(NAString, -1))
    End Sub
    Protected Sub AddSingleDualDropDownList_DataBound(sender As Object, e As System.EventArgs) Handles AddSingleDualDropDownList.DataBound
        AddSingleDualDropDownList.Items.Insert(0, New ListItem(NAString, -1))
    End Sub
    Protected Sub AddWireCountDropDownList_DataBound(sender As Object, e As System.EventArgs) Handles AddWireCountDropDownList.DataBound
        AddWireCountDropDownList.Items.Insert(0, New ListItem(NAString, -1))
    End Sub
    Protected Sub AddNPTDropDownList_DataBound(sender As Object, e As System.EventArgs) Handles AddNPTDropDownList.DataBound
        AddNPTDropDownList.Items.Insert(0, New ListItem(NAString, -1))
    End Sub
    Protected Sub AddODDropDownList_DataBound(sender As Object, e As System.EventArgs) Handles AddODDropDownList.DataBound
        AddODDropDownList.Items.Insert(0, New ListItem(NAString, -1))
    End Sub
    Protected Sub AddMaterialDropDownList_DataBound(sender As Object, e As System.EventArgs) Handles AddMaterialDropDownList.DataBound
        AddMaterialDropDownList.Items.Insert(0, New ListItem(NAString, -1))
    End Sub
    Protected Sub AddMITypeDropDownList_DataBound(sender As Object, e As System.EventArgs) Handles AddMITypeDropDownList.DataBound
        AddMITypeDropDownList.Items.Insert(0, New ListItem(NAString, -1))
    End Sub

    '************************
    ' SELECTED INDEX CHANGED 
    '************************
    Protected Sub PartsGridview_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles PartsGridView.SelectedIndexChanged
        If (PartsGridView.EditIndex > -1) Then
            PartsGridView.UpdateRow(PartsGridView.EditIndex, False)
        End If
        Call ShowEditModal()
    End Sub

    Protected Sub CatagoryDropDown_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles CatagoryDropDown.SelectedIndexChanged
        Dim val = CatagoryDropDown.SelectedValue
        PartsGridView.SelectedIndex = -1
        If val <> "0" Then
            AddCatagoryDropDown.SelectedValue = CatagoryDropDown.SelectedValue
        End If

        GetPartsGridviewDataSource()
    End Sub

    Protected Sub AddCatagoryDropDown_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles AddCatagoryDropDown.SelectedIndexChanged
        If (AddEditTitle.Text = "Add") Then
            ShowAddModal()
            CatagoryDropDown.SelectedValue = AddCatagoryDropDown.SelectedValue
            Dim catagoryName As String = AddCatagoryDropDown.SelectedItem.ToString
            AddEditDesc.Text = catagoryName
        Else
            ShowEditModal()
        End If
    End Sub

    Private Sub GetPartsGridviewDataSource()
        Dim dc As New QPriceDataClassesDataContext
        Dim cat As Integer = CInt(CatagoryDropDown.SelectedValue)
        Dim dsource As Object
        If cat = 0 Then
            dsource = From d In dc.Components
                    Where d.CompCode <> "" And d.CompCode <> "NA"
                    Order By d.ComponentCatagory.CatagoryInvCode, d.CompNum
                    Select d
        Else
            dsource = From d In dc.Components
                    Where d.Catagory_ID = cat
                    Order By d.CompNum
                    Select d
        End If

        PartsGridView.DataSource = dsource
        PartsGridView.DataBind()

        dc.Dispose()
    End Sub


    '**************
    'BUTTON CLICKS 
    '**************
    Protected Sub AddPartButton_Click(sender As Object, e As System.EventArgs) Handles AddPartButton.Click
        PartsGridView.SelectedIndex = -1
    End Sub

    Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs) Handles SaveButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim primaryKey As Long = PartsGridView.SelectedDataKey.Value
        Dim myComponent = GetComponent(dc, primaryKey)

        myComponent.Catagory_ID = AddCatagoryDropDown.SelectedValue
        myComponent.CompCode = AddCodeTextBox.Text.Trim
        myComponent.CompNum = AddCompNumTextBox.Text
        myComponent.CompDesc = AddDescTextBox.Text
        myComponent.CompCost = NumberFunctions.StringToNumeric(AddCostTextBox.Text, 0)
        myComponent.UM_ID = AddUMDropDown.SelectedValue
        myComponent.LaborCost = NumberFunctions.StringToNumeric(AddLaborCost_TextBox.Text, 1)
        myComponent.Markup = NumberFunctions.StringToNumeric(AddMarkupTextBox.Text, 1)
        myComponent.Cal_ID = AddCalDropDownList.SelectedValue
        myComponent.SingleDual_ID = AddSingleDualDropDownList.SelectedValue
        myComponent.WireCount_ID = AddWireCountDropDownList.SelectedValue
        myComponent.NPT_ID = AddNPTDropDownList.SelectedValue
        myComponent.OD_ID = AddODDropDownList.SelectedValue
        myComponent.Material_ID = AddMaterialDropDownList.SelectedValue
        myComponent.MIType_ID = AddMITypeDropDownList.SelectedValue
        myComponent.Resale = AddResale_CheckBox.Checked
        If Not (AddStandardDropDownList.SelectedValue = "Null") Then
            myComponent.Standard = AddStandardDropDownList.SelectedValue
        End If
        Dim markup As String = AddMarkupTextBox.Text
        If Not IsNumeric(markup) Or markup = "" Then
            markup = 1
        End If
        myComponent.Markup = markup

        Dim laborCost As String = AddLaborCost_TextBox.Text
        If Not IsNumeric(laborCost) Or laborCost = "" Then
            laborCost = 0
        End If
        myComponent.LaborCost = laborCost

        If ComponentIsValid(myComponent) Then
            dc.SubmitChanges()
            CatagoryDropDown.SelectedValue = AddCatagoryDropDown.SelectedValue
            GetPartsGridviewDataSource()
        Else
            CompExists.Visible = True
            CompExists_Label.Text = "Part number <h5>" & myComponent.CompNum & "</h5> already exists. Please choose another Part Number. Close window to exit."
            AddModalPopup.Show()
        End If
        dc.Dispose()

        If CatagoryDropDown.SelectedValue <> CInt(0) Then
            CatagoryDropDown.SelectedValue = AddCatagoryDropDown.SelectedValue
        End If
        PartsGridView.EditIndex = -1
        GetPartsGridviewDataSource()
    End Sub

    Protected Sub AddButton_Click(sender As Object, e As System.EventArgs) Handles AddButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim myComponent As New Component

        myComponent.CompCost = NumberFunctions.StringToNumeric(AddCostTextBox.Text, 0)
        myComponent.LaborCost = NumberFunctions.StringToNumeric(AddLaborCost_TextBox.Text, 0)
        myComponent.Markup = NumberFunctions.StringToNumeric(AddMarkupTextBox.Text, 1)
        myComponent.Catagory_ID = AddCatagoryDropDown.SelectedValue
        myComponent.CompCode = AddCodeTextBox.Text.Trim
        myComponent.CompNum = AddCompNumTextBox.Text
        myComponent.CompDesc = AddDescTextBox.Text
        myComponent.UM_ID = AddUMDropDown.SelectedValue
        myComponent.Cal_ID = AddCalDropDownList.SelectedValue
        myComponent.SingleDual_ID = AddSingleDualDropDownList.SelectedValue
        myComponent.WireCount_ID = AddWireCountDropDownList.SelectedValue
        myComponent.NPT_ID = AddNPTDropDownList.SelectedValue
        myComponent.OD_ID = AddODDropDownList.SelectedValue
        myComponent.Material_ID = AddMaterialDropDownList.SelectedValue
        myComponent.MIType_ID = AddMITypeDropDownList.SelectedValue
        myComponent.Resale = AddResale_CheckBox.Checked
        If Not (AddStandardDropDownList.SelectedValue = "Null") Then
            myComponent.Standard = AddStandardDropDownList.SelectedValue
        End If

        If ComponentIsValid(myComponent) Then
            dc.Components.InsertOnSubmit(myComponent)
            dc.SubmitChanges()
            CatagoryDropDown.SelectedValue = AddCatagoryDropDown.SelectedValue
            GetPartsGridviewDataSource()
        Else
            CompExists.Visible = True
            CompExists_Label.Text = "Part number <h5>" & myComponent.CompNum & "</h5> already exists. Please choose another Part Number. Close window to exit."
            AddModalPopup.Show()
        End If

        dc.Dispose()
    End Sub
    Protected Function ComponentIsValid(ByVal myComponent As Component) As String
        Dim dc As New QPriceDataClassesDataContext
        Dim myCompNum As Object
        Try
            myCompNum = (From c In dc.Components
                      Where c.CompNum.Trim = myComponent.CompNum
                      Select c).SingleOrDefault

            If IsNothing(myCompNum) Then
                ComponentIsValid = True
            ElseIf myComponent.CompID = myCompNum.CompID Then
                ComponentIsValid = True
            Else
                ComponentIsValid = False
            End If
        Catch ex As Exception

        End Try
    End Function

    Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs) Handles DeleteButton.Click
        Dim ComponentsExist As Boolean = PartsGridView.Rows.Count > 0
        If ComponentsExist Then
            Dim dc As New QPriceDataClassesDataContext
            Dim primaryKey As Integer = PartsGridView.SelectedDataKey.Value
            Dim baseList As String = ""

            Dim myCostUpCodes = From b In dc.CostComponentKeys
                                Where b.Comp_ID = primaryKey
                                Select b.CostUp.CostUpCode


            Dim NoComponentIsLinkedToCostUp As Boolean = myCostUpCodes.Count < 1

            If (NoComponentIsLinkedToCostUp) Then
                MessageOKButton.Visible = False
                DeleteYesButton.Visible = True
                DeleteNoButton.Visible = True
                ' MessageImage.ImageUrl = "~/images/messages/question.png"
                Dim catagory As String = CatagoryDropDown.SelectedItem.ToString
                MessageLabel.Text = "Are you sure you want to delete selected component from '" & catagory & "'?"

            Else
                For Each c In myCostUpCodes
                    If c <> "" Then
                        baseList = baseList & c & "; "
                    End If
                Next c
                If baseList.Length > 150 Then
                    baseList = baseList.Substring(0, 150) & "... etc"
                End If
                MessageOKButton.Visible = True
                DeleteYesButton.Visible = False
                DeleteNoButton.Visible = False
                ' MessageImage.ImageUrl = "~/images/messages/wrong.png"
                MessageLabel.Text = "<h4>Can not delete item!</h4><br /><br /><hr /><br /> The selected component exists in base cost:<br /> <h5>" & baseList & "</h5><br /><br /><hr /><br /> Please remove the component from all base costs and try again."

                End If

        End If
        MessageModalPopupExtender.Show()
    End Sub
    Protected Sub DeleteYesButton_Click(sender As Object, e As System.EventArgs) Handles DeleteYesButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim primarykey As Integer = PartsGridView.SelectedDataKey.Value

        Dim myPart = (From p In dc.Components
                     Where p.CompID = primarykey
                     Select p).SingleOrDefault

        dc.Components.DeleteOnSubmit(myPart)
        dc.SubmitChanges()
        dc.Dispose()
        GetPartsGridviewDataSource()
    End Sub

    Protected Sub UpdateMainButton_Click(sender As Object, e As System.EventArgs) Handles UpdateMainButton.Click
        PartsGridView.UpdateRow(PartsGridView.EditIndex, False)
        PartsGridView.EditIndex = -1
        PartsGridView.SelectedIndex = -1
    End Sub

    '****************
    ' MODAL HANDLING 
    '****************
    Protected Sub ShowEditModal()

        Dim dc As New QPriceDataClassesDataContext

        Dim primaryKey As Integer = PartsGridView.SelectedDataKey.Value
        Dim selectedComp = GetComponent(dc, primaryKey)

        AddCatagoryDropDown.Enabled = True
        If CatagoryDropDown.SelectedValue = "0" Then
            AddCatagoryDropDown.SelectedValue = selectedComp.Catagory_ID
            AddCatagoryDropDown.Enabled = False
        End If
        AddCodeTextBox.Text = selectedComp.CompCode.Trim
        AddCompNumTextBox.Text = selectedComp.CompNum
        AddDescTextBox.Text = selectedComp.CompDesc
        AddCostTextBox.Text = selectedComp.CompCost
        AddLaborCost_TextBox.Text = selectedComp.LaborCost
        AddMarkupTextBox.Text = selectedComp.Markup
        AddUMDropDown.SelectedValue = selectedComp.UM_ID
        AddCalDropDownList.SelectedValue = selectedComp.Cal_ID
        AddSingleDualDropDownList.SelectedValue = selectedComp.SingleDual_ID
        AddWireCountDropDownList.SelectedValue = selectedComp.WireCount_ID
        AddNPTDropDownList.SelectedValue = selectedComp.NPT_ID
        AddODDropDownList.SelectedValue = selectedComp.OD_ID
        AddMaterialDropDownList.SelectedValue = selectedComp.Material_ID
        AddMITypeDropDownList.SelectedValue = selectedComp.MIType_ID
        AddResale_CheckBox.Checked = selectedComp.Resale

        If IsNothing(selectedComp.Standard) Then
            AddStandardDropDownList.SelectedValue = "Null"
        Else
            AddStandardDropDownList.SelectedValue = selectedComp.Standard
        End If


        AddPanel.FindControl("SaveButton").Visible = True
        AddPanel.FindControl("DeleteButton").Visible = True
        AddPanel.FindControl("AddButton").Visible = False
        AddEditTitle.Text = selectedComp.CompNum
        AddEditDesc.Text = selectedComp.CompDesc
        AddPanel.DefaultButton = "SaveButton"
        AddModalPopup.Show()
    End Sub
    Protected Sub ShowAddModal()
        AddCodeTextBox.Text = ""
        AddCompNumTextBox.Text = ""
        AddDescTextBox.Text = ""
        AddCostTextBox.Text = ""
        AddUMDropDown.SelectedIndex = 0
        AddCalDropDownList.SelectedValue = -1
        AddSingleDualDropDownList.SelectedValue = -1
        AddWireCountDropDownList.SelectedValue = -1
        AddNPTDropDownList.SelectedValue = -1
        AddODDropDownList.SelectedValue = -1
        AddMaterialDropDownList.SelectedValue = -1
        AddMITypeDropDownList.SelectedValue = -1
        AddStandardDropDownList.SelectedValue = ""
        AddResale_CheckBox.Checked = False



        AddPanel.FindControl("AddButton").Visible = True
        AddPanel.FindControl("DeleteButton").Visible = False
        AddPanel.FindControl("SaveButton").Visible = False
        Dim catagoryName As String = CatagoryDropDown.SelectedItem.ToString
        AddEditTitle.Text = "Add"
        AddEditDesc.Text = catagoryName
        AddPanel.DefaultButton = "AddButton"

        AddModalPopup.Show()
    End Sub


End Class


