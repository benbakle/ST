
Partial Class Admin_EditUser
    Inherits System.Web.UI.Page

    Protected Sub Page_PreRenderComplete(sender As Object, e As System.EventArgs) Handles Me.PreRenderComplete
        Call RenderDeleteUserMessage()
    End Sub

    Protected Sub CustomerGridView_PageIndexChanged(sender As Object, e As EventArgs) Handles CustomerGridView.PageIndexChanged
        CustomerGridView.EditIndex = 0
        CustomerGridView.SelectedIndex = 0
    End Sub

    Protected Sub CustomerGridView_PreRender(sender As Object, e As System.EventArgs) Handles CustomerGridView.PreRender
        Dim row As GridViewRow = CustomerGridView.Rows(CustomerGridView.EditIndex)
        Dim userTextboxValue As String = CType(row.Cells(0).FindControl("EmailTextBox"), TextBox).Text

        If (userTextboxValue = Membership.GetUser.UserName.ToString Or userTextboxValue = "Admin") Then
            CustomerGridView.SelectedRow.Enabled = False

        End If
        CustomerGridView.SelectedRow.Cells(3).Enabled = False
    End Sub
    Protected Sub CustomerGridView_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CustomerGridView.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(Me.CustomerGridView, "Select$" + e.Row.RowIndex.ToString()))
        End If
        If (Not IsPostBack) Then
            CustomerGridView.EditIndex = 0
            CustomerGridView.SelectedIndex = 0
        End If

    End Sub

    Protected Sub CustomerGridView_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles CustomerGridView.SelectedIndexChanged
        If (CustomerGridView.EditIndex > -1) Then
            Call UpdateUser()
            CustomerGridView.UpdateRow(CustomerGridView.EditIndex, False)
        End If
        CustomerGridView.EditIndex = CustomerGridView.SelectedIndex
    End Sub

    Protected Sub UpdateUserButton_Click(sender As Object, e As System.EventArgs) Handles UpdateUserButton.Click
        Call UpdateUser()
        CustomerGridView.UpdateRow(CustomerGridView.EditIndex, False)
        CustomerGridView.EditIndex = 0
        CustomerGridView.SelectedIndex = 0
        'CustomerGridView.SelectedIndex
    End Sub

    Protected Sub ConfirmDeleteUser_LinkButton_Click(sender As Object, e As System.EventArgs) Handles ConfirmDeleteUser_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim customer = (From c In dc.Customers
                       Where c.CustomerID = CType(CustomerGridView.SelectedDataKey.Value, Long)
                       Select c).Single


        Dim userName As String = customer.CustEmail

        dc.Customers.DeleteOnSubmit(customer)
        dc.SubmitChanges()
        CustomerGridView.DataBind()
        Membership.DeleteUser(userName, True)
        dc.Dispose()

        CustomerGridView.EditIndex = 0
        CustomerGridView.SelectedIndex = 0
    End Sub
    Protected Sub RenderDeleteUserMessage()
        Dim dc As New QPriceDataClassesDataContext
        Dim customer = (From c In dc.Customers
                       Where c.CustomerID = CType(CustomerGridView.SelectedDataKey.Value, Long)
                       Select c).Single


        Dim userName As String = Customer.CustEmail
        If (userName = "Admin") Then
            DeleteUser_Label.Text = "Administrator account can not be deleted."
            ConfirmDeleteUser_LinkButton.Visible = False
        ElseIf (userName = Membership.GetUser.UserName.ToString) Then
            DeleteUser_Label.Text = userName & " can not be deleted when logged in." & vbNewLine & "Log in under 'Admin' to delete this account."
            ConfirmDeleteUser_LinkButton.Visible = False
        Else
            DeleteUser_Label.Text = "Are you sure you would like to delete """ & customer.CustFirstName & " " & customer.CustLastName & """ from users?"
            ConfirmDeleteUser_LinkButton.Visible = True
        End If

        dc.Dispose()

    End Sub

    Protected Sub UpdateUser()
        Dim row As GridViewRow = CustomerGridView.Rows(CustomerGridView.EditIndex)

        Try
            Dim userName As String = CType(row.Cells(0).FindControl("EmailTextBox"), TextBox).Text
            Dim upDatedRole As String = CType(row.Cells(5).FindControl("RoleDropDownList"), DropDownList).SelectedItem.ToString
            Dim user As MembershipUser = Membership.GetUser(userName)

            If (Membership.GetUser.UserName <> userName) Then
                Dim roleArray = Roles.GetRolesForUser(userName)
                Dim currentRole As String = roleArray(0)
                Roles.RemoveUserFromRole(userName, currentRole)
                Roles.AddUserToRole(userName, upDatedRole)


            End If
        Catch ex As Exception

        End Try
    End Sub




End Class
