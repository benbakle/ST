
Partial Class QuickPrice_QuickPrice
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim dc As New QPriceDataClassesDataContext
        Dim userName As String
        Try

            userName = (From u In dc.Customers
                        Where u.CustEmail = Membership.GetUser.UserName.ToString
                        Select u.CustFirstName).Single

            ' Dim namelbl As Label = CType(HeadLoginView.FindControl("LoginNameLabel"), Label)

            LoginNameLabel.Text = userName.ToString

        Catch ex As Exception
        End Try

        If (HttpContext.Current.User.Identity.IsAuthenticated) Then
            LoginMenu_Panel.Visible = True
        Else
            LoginMenu_Panel.Visible = False
        End If


        Dim isAdmin As Boolean = Context.User.IsInRole("Administrator")
        If isAdmin Then
            AdminMenu_Panel.Visible = True
        Else
            AdminMenu_Panel.Visible = False
        End If

    End Sub

    '*********************************
    '***** BUTTON CLICK HANDLING *****
    '*********************************
    Protected Sub CreateCompany_LinkButton_Click(sender As Object, e As System.EventArgs) Handles CreateCompany_LinkButton.Click
        CreateCompany_ModalPopup.Show()
        CompanyAction_Label.Text = "Add Company"
        CompanyName_TextBox.Visible = True
        CompanyName_DropDownList.Visible = False
        DeleteCompany_LinkButton.Visible = False
        UpdateCompany_LinkButton.Visible = False
        AddCompany_LinkButton.Visible = True

    End Sub
    Protected Sub EditCompany_LinkButton_Click(sender As Object, e As System.EventArgs) Handles EditCompany_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim companyID As Integer = CompanyName_DropDownList.SelectedValue
        Dim discount = (From d In dc.Companies
                        Where companyID = d.CompanyID
                        Select d).Single

        Discount_DropDownList.SelectedValue = discount.Discount_ID
        CompanyAction_Label.Text = "Edit Company Discount"
        CompanyName_TextBox.Visible = False
        CompanyName_DropDownList.Visible = True
        DeleteCompany_LinkButton.Visible = True
        UpdateCompany_LinkButton.Visible = True
        AddCompany_LinkButton.Visible = False
        CreateCompany_ModalPopup.Show()
    End Sub

    Protected Sub ExtBaseCost_LinkButton_Click(sender As Object, e As System.EventArgs) Handles ExtBaseCost_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim myExtBaseCost = (From c In dc.ExtBaseCosts
                           Where c.ExtBaseCostID = 1
                           Select c.ExtBaseCost).Single
        ExtBaseCost_TextBox.Text = FormatCurrency(myExtBaseCost)

        ExtBaseCost_ModalPopup.Show()
    End Sub

    Protected Sub SanitaryWellCost_LinkButton_Click(sender As Object, e As System.EventArgs) Handles SanitaryWellCost_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim mySanitaryWellCost = (From c In dc.SanitaryWellCosts
                           Where c.SanitaryWellCostID = 1
                           Select c.SanitaryWellCost).Single
        SanitaryWellCost_TextBox.Text = FormatCurrency(mySanitaryWellCost)

        SanitaryWellCost_ModalPopup.Show()
    End Sub

    Protected Sub LaborCost_LinkButton_Click(sender As Object, e As System.EventArgs) Handles LaborCost_LinkButton.Click
        LaborCost_DropDownList.SelectedIndex = 0
        GetLaborCost()
        LaborCost_ModalPopup.Show()
    End Sub

    Protected Sub EditLaborCost_LinkButton_Click(sender As Object, e As System.EventArgs) Handles EditLaborCost_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim primarykey = LaborCost_DropDownList.SelectedValue
        Dim myLaborCost = (From c In dc.SensorTypes
                           Where c.TypeID = primarykey
                           Select c).Single
        myLaborCost.Labor = LaborCost_TextBox.Text
        dc.SubmitChanges()
        dc.Dispose()
        LaborCost_ModalPopup.Hide()
    End Sub

    Protected Sub EditExtBaseCost_LinkButton_Click(sender As Object, e As System.EventArgs) Handles EditExtBaseCost_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim myExtBaseCost = (From c In dc.ExtBaseCosts
                             Where c.ExtBaseCostID = 1
                             Select c).Single

        myExtBaseCost.ExtBaseCost = ExtBaseCost_TextBox.Text
        dc.SubmitChanges()
        dc.Dispose()

        ExtBaseCost_ModalPopup.Hide()
    End Sub

    Protected Sub EditSanitaryWellCost_LinkButton_Click(sender As Object, e As System.EventArgs) Handles EditSanitaryWellCost_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim mySanitaryWellCost = (From c In dc.SanitaryWellCosts
                             Where c.SanitaryWellCostID = 1
                             Select c).Single

        mySanitaryWellCost.SanitaryWellCost = SanitaryWellCost_TextBox.Text
        dc.SubmitChanges()
        dc.Dispose()

        SanitaryWellCost_ModalPopup.Hide()
    End Sub

    Protected Sub AddCompany_LinkButton_Click(sender As Object, e As System.EventArgs) Handles AddCompany_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim myCompany As New Company

        myCompany.CompanyName = CompanyName_TextBox.Text
        If CompanyExists(myCompany, dc) Then
            companyExistsError.Attributes.Add("style", "display:block;")
            CreateCompany_ModalPopup.Show()
        Else
            companyExistsError.Attributes.Add("style", "display:none;")
            myCompany.Discount_ID = Discount_DropDownList.SelectedValue
            dc.Companies.InsertOnSubmit(myCompany)
            dc.SubmitChanges()
            dc.Dispose()
            CompanyName_DropDownList.DataBind()
        End If


    End Sub
    Protected Function CompanyExists(ByVal testCompany As Company, ByVal dc As QPriceDataClassesDataContext) As Boolean
        CompanyExists = True
        Try
            Dim mycompany = (From c In dc.Companies
                             Where c.CompanyName = testCompany.CompanyName
                             Select c).Single
        Catch ex As Exception
            CompanyExists = False
        End Try

    End Function

    Protected Sub UpdateCompany_LinkButton_Click(sender As Object, e As System.EventArgs) Handles UpdateCompany_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim companyID As Integer = CompanyName_DropDownList.SelectedValue
        Dim discountID As Integer = Discount_DropDownList.SelectedValue

        Dim myCompany = (From c In dc.Companies
                         Where c.CompanyID = companyID
                         Select c).Single

        myCompany.Discount_ID = discountID
        dc.SubmitChanges()
        dc.Dispose()
    End Sub
    Protected Sub ConfirmDeleteCompany_LinkButton_Click(sender As Object, e As System.EventArgs) Handles ConfirmDeleteCompany_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim companyID As Integer = CompanyName_DropDownList.SelectedValue

        Dim myCompany = (From c In dc.Companies
                         Where c.CompanyID = companyID
                         Select c).Single
        dc.Companies.DeleteOnSubmit(myCompany)
        dc.SubmitChanges()
        dc.Dispose()
        CompanyName_DropDownList.DataBind()
        CreateCompany_ModalPopup.Show()
    End Sub


    Protected Sub CloseCreateCompany_ImageButton_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles CloseCreateCompany_ImageButton.Click
        companyExistsError.Attributes.Add("style", "display:none;")
        CreateCompany_ModalPopup.Hide()
    End Sub

    '*******************************************
    '***** SELECTED INDEX CHANGED HANDLING *****
    '*******************************************
    Protected Sub CompanyName_DropDownList_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles CompanyName_DropDownList.SelectedIndexChanged
        CreateCompany_ModalPopup.Show()
        Dim dc As New QPriceDataClassesDataContext
        Dim companyID As Integer = CompanyName_DropDownList.SelectedValue
        Dim discount = (From d In dc.Companies
                        Where companyID = d.CompanyID
                        Select d).Single
        Discount_DropDownList.SelectedValue = discount.Discount_ID

    End Sub

    Protected Sub LaborCost_DropDownList_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles LaborCost_DropDownList.SelectedIndexChanged
        GetLaborCost()
        LaborCost_ModalPopup.Show()
    End Sub

    '*******************************************
    '*************** FUNCTIONS *****************
    '*******************************************

    Private Sub GetLaborCost()
        Dim dc As New QPriceDataClassesDataContext
        Dim primarykey = LaborCost_DropDownList.SelectedValue

        Dim myLaborCost = (From c In dc.SensorTypes
                           Where c.TypeID = primarykey
                           Select c.Labor).Single

        LaborCost_TextBox.Text = FormatCurrency(myLaborCost)


    End Sub
End Class

