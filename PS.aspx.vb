
Partial Class PS
    Inherits System.Web.UI.Page

    Protected Sub Product_Repeater_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles Product_Repeater.ItemDataBound
        Dim rptItem = e.Item
        Dim desc As String

        If (rptItem.ItemType = ListItemType.Item) Or (rptItem.ItemType = ListItemType.AlternatingItem) Then
            Dim lbl As Label = rptItem.FindControl("Product_Label")
            Dim hdn As HiddenField = rptItem.FindControl("DisplayChar_HiddenField")
            Dim charLen As Long = hdn.Value
            If lbl.Text <> "" Then
                desc = lbl.Text
                If desc.Length > charLen Then
                    lbl.Text = desc.Substring(0, charLen).ToString
                End If
            End If
        End If


    End Sub


End Class
