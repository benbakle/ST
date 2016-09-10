
Partial Class Distributor
    Inherits System.Web.UI.Page


    Protected Sub Distributor_ImageMap_Click(sender As Object, e As System.Web.UI.WebControls.ImageMapEventArgs) Handles Distributor_ImageMap.Click
        Dim dc As New QPriceDataClassesDataContext

        Dim stID = (From s In dc.States
                      Where s.StateName = e.PostBackValue
                      Select s.StateID).SingleOrDefault

        GetDistributor(stID)
        States_DropDownList.SelectedValue = stID
    End Sub

    Protected Sub States_DropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles States_DropDownList.SelectedIndexChanged
        Dim stateID As Integer = States_DropDownList.SelectedValue
        If stateID < 0 Then
            Exit Sub
        End If

        GetDistributor(stateID)
    End Sub

    Protected Sub GetDistributor(ByVal stateID As Integer)
        Dim dc As New QPriceDataClassesDataContext
        Dim stateDisc = (From s In dc.States
                        Where s.StateID = stateID
                        Select s.StateName).SingleOrDefault

        Dim dist = From d In dc.Distributors, k In dc.DistStateKeys, s In dc.States
                   Where s.StateID = stateID And k.State_ID = s.StateID And k.Distributor_ID = d.DistributorID
                   Order By d.DistOrderBy, d.DistName
                   Select d

        Distributor_Repeater.DataSource = dist
        Distributor_Repeater.DataBind()

        Dim stateLabel As Label = CType(Distributor_Repeater.Controls(0).Controls(0).FindControl("State_Label"), Label)
        stateLabel.Text = "Distributors in " & stateDisc
        Dim pan As Panel = CType(Dist_UpdatePanel.FindControl("DistributionInst_Panel"), Panel)
        pan.Visible = False

    End Sub

    Protected Sub Distributor_Repeater_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles Distributor_Repeater.ItemDataBound
       If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim address2Pan As New Panel
            Dim address2Lbl As New Label
            Dim contact2Pan As New Panel
            Dim contact2Lbl As New Label

            address2Pan = DirectCast(e.Item.FindControl("Address2_Panel"), Panel)
            address2Lbl = DirectCast(e.Item.FindControl("Address2_Label"), Label)
            contact2Pan = DirectCast(e.Item.FindControl("Contact2_Panel"), Panel)
            contact2Lbl = DirectCast(e.Item.FindControl("Contact2_Label"), Label)

            If address2Lbl.Text.ToString = "" Then
                address2Pan.Visible = False
            End If
            If contact2Lbl.Text.ToString = "" Then
                contact2Pan.Visible = False
            End If
        End If
    End Sub

End Class
