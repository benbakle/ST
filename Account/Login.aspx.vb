
Partial Class Account_Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim isAdmin As Boolean = Context.User.IsInRole("Administrator")
        If Request.IsAuthenticated AndAlso isAdmin = True Then
            Response.Redirect("../Admin/Default.aspx")
        ElseIf Request.IsAuthenticated AndAlso isAdmin = False Then
            Response.Redirect("../QuickPrice/Default.aspx")
        End If

    End Sub

End Class