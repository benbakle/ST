
Partial Class Account_RecoverPassword
    Inherits System.Web.UI.Page

     Sub PasswordRecovery1_SendingMail(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MailMessageEventArgs)

        e.Message.IsBodyHtml = False
        e.Message.Subject = "New Password for SensorTec Inc."
    End Sub
End Class
