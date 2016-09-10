
Partial Class QuickPrice_QPDefault
    Inherits System.Web.UI.Page


    Protected Sub GetStarted_LinkButton_Click(sender As Object, e As System.EventArgs) Handles GetStarted_LinkButton.Click
        Session("IsQuickQuote") = False
        Response.Redirect("~/QuickPriceUser/QPConfigure.aspx")
    End Sub
End Class
