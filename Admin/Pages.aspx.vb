
Partial Class Admin_Pages
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            RenderDefaultView()
        End If
        AddTopic_LinkButton.Visible = False
        UpdateTopic_LinkButton.Visible = True
        DeleteTopic_HyperLink.Visible = True
    End Sub

    Protected Sub Product_GridView_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles Product_GridView.RowCommand
        If e.CommandName = "Select" Then
            Product_GridView.SelectedIndex = e.CommandArgument
        End If
    End Sub

    Protected Sub Services_GridView_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles Services_GridView.RowCommand
        If e.CommandName = "Select" Then
            Services_GridView.SelectedIndex = e.CommandArgument
        End If
    End Sub

    Protected Sub Product_GridView_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Product_GridView.SelectedIndexChanged
        PrimaryKey_HiddenField.Value = Product_GridView.SelectedValue
        RenderEditGridview()
    End Sub

    Protected Sub Services_GridView_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Services_GridView.SelectedIndexChanged
        PrimaryKey_HiddenField.Value = Services_GridView.SelectedValue
        RenderEditGridview()
    End Sub
    Protected Sub UpdateTopic_LinkButton_Click(sender As Object, e As System.EventArgs) Handles UpdateTopic_LinkButton.Click
        UpdateTopic()
        DataBindGridViews()
        RenderDefaultView()
    End Sub

    Protected Sub NewTopic_LinkButton_Click(sender As Object, e As System.EventArgs) Handles NewTopic_LinkButton.Click
        ClearForm()
        RenderEditView()
        UpdateTopic_LinkButton.Visible = False
        DeleteTopic_HyperLink.Visible = False
        AddTopic_LinkButton.Visible = True
    End Sub

    Protected Sub Cancel_LinkButton_Click(sender As Object, e As System.EventArgs) Handles Cancel_LinkButton.Click
        RenderDefaultView()
    End Sub

    Protected Sub ConfirmDeleteTopic_LinkButton_Click(sender As Object, e As System.EventArgs) Handles ConfirmDeleteTopic_LinkButton.Click
        DeleteTopic()
        DataBindGridViews()
        RenderDefaultView()
    End Sub

    Protected Sub AddTopic_LinkButton_Click(sender As Object, e As System.EventArgs) Handles AddTopic_LinkButton.Click
        InsertTopic()
        DataBindGridViews()
        RenderDefaultView()
    End Sub

    Protected Sub UpdateTopic()
        Dim dc As New QPriceDataClassesDataContext
        Dim primarykey As Long = PrimaryKey_HiddenField.Value
        Dim pg = (From p In dc.Pages Where
                  p.PageID = primarykey
                  Select p).SingleOrDefault

        pg.PageHeader = Header_TextBox.Text
        pg.PageImg = ImgURL_TextBox.Text
        pg.PageURL = PageURL_TextBox.Text
        pg.PageType_ID = PageType_DropDownList.SelectedValue
        pg.PageOrderBy = CInt(OrderBy_TextBox.Text)
        pg.PageDisplayChar = CInt(DisplayChar_TextBox.Text)
        pg.PageDesc = Desc_TextBox.Text

        dc.SubmitChanges()
        dc.Dispose()

    End Sub

    Protected Sub InsertTopic()
        Dim dc As New QPriceDataClassesDataContext
        Dim pg As New Page

        pg.PageHeader = Header_TextBox.Text
        pg.PageImg = ImgURL_TextBox.Text
        pg.PageURL = PageURL_TextBox.Text
        pg.PageType_ID = PageType_DropDownList.SelectedValue
        pg.PageOrderBy = CInt(OrderBy_TextBox.Text)
        pg.PageDisplayChar = CInt(DisplayChar_TextBox.Text)
        pg.PageDesc = Desc_TextBox.Text

        dc.Pages.InsertOnSubmit(pg)
        dc.SubmitChanges()
        dc.Dispose()
    End Sub

    Protected Sub DeleteTopic()
        Dim dc As New QPriceDataClassesDataContext
        Dim primarykey = PrimaryKey_HiddenField.Value
        Dim pg = (From p In dc.Pages
                  Where p.PageID = primarykey
                  Select p).SingleOrDefault

        dc.Pages.DeleteOnSubmit(pg)
        dc.SubmitChanges()
        dc.Dispose()

    End Sub

    Protected Sub RenderEditGridview()
        Dim dc As New QPriceDataClassesDataContext
        Dim primarykey = PrimaryKey_HiddenField.Value
        Dim pg = (From p In dc.Pages Where
                 p.PageID = primarykey
                 Select p).SingleOrDefault

        ID_TextBox.Text = pg.PageID
        Header_TextBox.Text = pg.PageHeader
        ImgURL_TextBox.Text = pg.PageImg
        PageURL_TextBox.Text = pg.PageURL
        PageType_DropDownList.SelectedValue = pg.PageType_ID
        OrderBy_TextBox.Text = pg.PageOrderBy
        DisplayChar_TextBox.Text = pg.PageDisplayChar
        Desc_TextBox.Text = pg.PageDesc

        TopicDelete_Label.Text = pg.PageHeader
        RenderEditView()

    End Sub
    Protected Sub RenderDefaultView()
        Start_Panel.Visible = True
        EditPages_Panel.Visible = False
    End Sub

    Protected Sub RenderEditView()
        Start_Panel.Visible = False
        EditPages_Panel.Visible = True
    End Sub

    Protected Sub ClearForm()
        Header_TextBox.Text = ""
        ImgURL_TextBox.Text = ""
        PageURL_TextBox.Text = ""
        PageType_DropDownList.SelectedValue = 1
        OrderBy_TextBox.Text = ""
        Desc_TextBox.Text = ""
    End Sub

    Protected Sub DataBindGridViews()
        Product_GridView.DataBind()
        Services_GridView.DataBind()
    End Sub

End Class
