
Partial Class Admin_CreateUser
    Inherits System.Web.UI.Page

    Protected Sub RegisterUser_CreatedUser(sender As Object, e As System.EventArgs) Handles RegisterUser.CreatedUser
        Dim user As MembershipUser = Membership.GetUser(RegisterUser.Email.ToString)
        Dim uKey = user.ProviderUserKey
        user.Email = user.UserName
        Membership.UpdateUser(user)

        Dim dc As New QPriceDataClassesDataContext
        Dim cust = (From c In dc.Customers
                   Where c.CustEmail = user.Email
                   Select c).Single

        cust.RegisteredID = uKey
        dc.SubmitChanges()
        dc.Dispose()

        Response.Redirect("EditUser.aspx")

    End Sub

    Protected Sub RegisterUser_CreatingUser(sender As Object, e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles RegisterUser.CreatingUser
        Dim cuw As CreateUserWizard = CType(sender, CreateUserWizard)
        Dim roleRadioList As RadioButtonList = CType(RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("Roles_RadioButtonList"), RadioButtonList)
        Dim role As Integer = roleRadioList.SelectedValue
        Dim dc As New QPriceDataClassesDataContext



        Dim roleDescription = (From d In dc.UserRoles
                                Where d.RoleID = role
                                Select d.RoleDesc).Single


        cuw.Email = cuw.UserName
        Try
            Roles.AddUserToRole(cuw.UserName, roleDescription)
            If Page.IsValid Then
                Dim myCustomer As New Customer

                Dim fName As TextBox = CType(RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("FirstNameTextBox"), TextBox)
                Dim lName As TextBox = CType(RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("LastNameTextBox"), TextBox)
                Dim cName As DropDownList = CType(RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("CompanyName_DropDownList"), DropDownList)

                Dim firstName As String = fName.Text
                Dim lastName As String = lName.Text
                Dim companyID As Integer = cName.SelectedValue

                myCustomer.CustEmail = cuw.UserName
                myCustomer.CustFirstName = firstName
                myCustomer.CustLastName = lastName
                myCustomer.Company_ID = companyID
                myCustomer.Role_ID = role

                dc.Customers.InsertOnSubmit(myCustomer)
                dc.SubmitChanges()
                dc.Dispose()
            End If
        Catch ex As Exception
        End Try



    End Sub

End Class
