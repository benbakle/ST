
Partial Class Topic
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim dc As New QPriceDataClassesDataContext
        Dim primarykey As Long = Request.QueryString("ID")

        Dim topic = (From t In dc.Pages
                     Where t.PageID = primarykey
                     Select t).SingleOrDefault

        Topic_Image.ImageUrl = topic.PageImg
        TopicHeader_Label.Text = topic.PageHeader
        TopicDesc_Label.Text = topic.PageDesc
    End Sub
End Class
