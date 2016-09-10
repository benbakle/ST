
Partial Class Admin_DistList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            DistEdit_Panel.Visible = False
        End If
    End Sub
    Protected Sub Distributor_GridView_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles Distributor_GridView.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(Me.Distributor_GridView, "Select$" + e.Row.RowIndex.ToString()))
        End If
    End Sub

    Protected Sub Distributor_GridView_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Distributor_GridView.SelectedIndexChanged
        Dim i As Long = Distributor_GridView.SelectedValue
        DistGridView_Panel.Visible = False
        DistEdit_Panel.Visible = True
        DeleteDist_HyperLink.Visible = True
        UpdateDist_LinkButton.Visible = True
        InsertDist_LinkButton.Visible = False
        Cancel_LinkButton.Visible = False
        RenderDistributor(i)
    End Sub

    Protected Sub RenderDistributor(ByVal primarykey As Long)
        Dim dc As New QPriceDataClassesDataContext

        Dim dist = (From d In dc.Distributors
                    Where d.DistributorID = primarykey
                    Select d).SingleOrDefault

        DistName_Label.Text = dist.DistName
        Distributor_TextBox.Text = dist.DistName

        If IsNothing(dist.DistOrderBy) Then
            OrderBy_TextBox.Text = 2000
        Else
            OrderBy_TextBox.Text = dist.DistOrderBy
        End If
        Address_TextBox.Text = dist.DistAddress
        Address2_TextBox.Text = dist.DistAddress2
        City_TextBox.Text = dist.DistCity
        State_DropDownList.SelectedValue = dist.State_ID
        ZIP_TextBox.Text = dist.DistZIP
        Contact_TextBox.Text = dist.DistContact
        Phone_TextBox.Text = dist.DistPhone
        Fax_TextBox.Text = dist.DistFax
        Email_TextBox.Text = dist.DistEmail
        Contact2_TextBox.Text = dist.DistContact2
        Phone2_TextBox.Text = dist.DistPhone2
        Fax2_TextBox.Text = dist.DistFax2
        Email2_TextBox.Text = dist.DistEmail2

        dc.Dispose()
    End Sub

    Protected Sub UpdateDistributor()
        Dim dc As New QPriceDataClassesDataContext
        Dim primaryKey As Long = Distributor_GridView.SelectedValue
        Dim dist = (From d In dc.Distributors
                    Where d.DistributorID = primaryKey
                    Select d).SingleOrDefault

        dist.DistName = Distributor_TextBox.Text
        dist.DistOrderBy = OrderBy_TextBox.Text
        dist.DistAddress = Address_TextBox.Text
        dist.DistAddress2 = Address2_TextBox.Text
        dist.DistCity = City_TextBox.Text
        dist.State_ID = State_DropDownList.SelectedValue
        dist.DistZIP = ZIP_TextBox.Text
        dist.DistContact = Contact_TextBox.Text
        dist.DistPhone = Phone_TextBox.Text
        dist.DistFax = Fax_TextBox.Text
        dist.DistEmail = Email_TextBox.Text
        dist.DistContact2 = Contact2_TextBox.Text
        dist.DistPhone2 = Phone2_TextBox.Text
        dist.DistFax2 = Fax2_TextBox.Text
        dist.DistEmail2 = Email2_TextBox.Text

        dc.SubmitChanges()
        dc.Dispose()
    End Sub

    Protected Sub InsertDistributor()
        Dim dc As New QPriceDataClassesDataContext
        Dim dist As New Distributor

        dist.DistName = Distributor_TextBox.Text
        dist.DistOrderBy = OrderBy_TextBox.Text
        dist.DistAddress = Address_TextBox.Text
        dist.DistAddress2 = Address2_TextBox.Text
        dist.DistCity = City_TextBox.Text
        dist.State_ID = State_DropDownList.SelectedValue
        dist.DistZIP = ZIP_TextBox.Text
        dist.DistContact = Contact_TextBox.Text
        dist.DistPhone = Phone_TextBox.Text
        dist.DistFax = Fax_TextBox.Text
        dist.DistEmail = Email_TextBox.Text
        dist.DistContact2 = Contact2_TextBox.Text
        dist.DistPhone2 = Phone2_TextBox.Text
        dist.DistFax2 = Fax2_TextBox.Text
        dist.DistEmail2 = Email2_TextBox.Text

        dc.Distributors.InsertOnSubmit(dist)
        dc.SubmitChanges()
        dc.Dispose()
    End Sub

    Protected Sub DeleteDistributor()
        Dim dc As New QPriceDataClassesDataContext
        Dim primarykey As Long = Distributor_GridView.SelectedValue

        Dim dist = (From d In dc.Distributors
                    Where d.DistributorID = primarykey
                    Select d).SingleOrDefault

        dc.Distributors.DeleteOnSubmit(dist)
        dc.SubmitChanges()
        dc.Dispose()
    End Sub

    Protected Sub AddDist_LinkButton_Click(sender As Object, e As System.EventArgs) Handles AddDist_LinkButton.Click
        DistGridView_Panel.Visible = False
        DistEdit_Panel.Visible = True
        DeleteDist_HyperLink.Visible = False
        UpdateDist_LinkButton.Visible = False
        InsertDist_LinkButton.Visible = True
        Cancel_LinkButton.Visible = True
        ClearDistData()

    End Sub

    Protected Sub UpdateDist_LinkButton_Click(sender As Object, e As System.EventArgs) Handles UpdateDist_LinkButton.Click
        UpdateDistributor()
        Distributor_GridView.DataBind()
        DistGridView_Panel.Visible = True
        DistEdit_Panel.Visible = False
    End Sub

    Protected Sub InsertDist_LinkButton_Click(sender As Object, e As System.EventArgs) Handles InsertDist_LinkButton.Click
        InsertDistributor()
        Distributor_GridView.DataBind()
        DistGridView_Panel.Visible = True
        DistEdit_Panel.Visible = False
    End Sub


    Protected Sub Cancel_LinkButton_Click(sender As Object, e As System.EventArgs) Handles Cancel_LinkButton.Click
        DistGridView_Panel.Visible = True
        DistEdit_Panel.Visible = False
    End Sub

    Protected Sub ConfirmDeleteDist_LinkButton_Click(sender As Object, e As System.EventArgs) Handles ConfirmDeleteDist_LinkButton.Click
        DeleteDistributor()
        Distributor_GridView.DataBind()
        DistGridView_Panel.Visible = True
        DistEdit_Panel.Visible = False
    End Sub

    Protected Sub ClearDistData()
        For Each c As Control In DistEdit_Panel.Controls
            If TypeOf c Is TextBox Then
                Dim txtbx As TextBox
                txtbx = CType(c, TextBox)
                txtbx.Text = ""
            End If
            If TypeOf c Is DropDownList Then
                Dim drpdwn As DropDownList
                drpdwn = CType(c, DropDownList)
                drpdwn.SelectedValue = 1
            End If
        Next
    End Sub


End Class
