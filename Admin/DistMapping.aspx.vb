
Partial Class Admin_DistMapping
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        NoDistExist_Panel.Visible = False

        If Not IsPostBack Then
            PopulateDistributorRepeater(1)
            State_DropDownList.DataBind()
            Distributor_DropDownList.DataBind()
            RenderLabelValues()
        End If
    End Sub

    Protected Sub State_DropDownList_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles State_DropDownList.SelectedIndexChanged
        Dim primarykey As Long = State_DropDownList.SelectedValue
        PopulateDistributorRepeater(primarykey)
        RenderLabelValues()
    End Sub

    Protected Sub Distributor_DropDownList_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Distributor_DropDownList.SelectedIndexChanged
        RenderLabelValues()
    End Sub

    Protected Sub ConfirmRemoveDist_LinkButton_Click(sender As Object, e As System.EventArgs) Handles ConfirmRemoveDist_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim distributor As Long = Distributor_DropDownList.SelectedValue
        Dim state As Long = State_DropDownList.SelectedValue

        Dim mykey = (From k In dc.DistStateKeys
                    Where k.Distributor_ID = distributor And k.State_ID = state
                    Select k).SingleOrDefault

        If IsNothing(mykey) Then
            NoDistExist_Panel.Visible = True
        Else
            dc.DistStateKeys.DeleteOnSubmit(mykey)
            dc.SubmitChanges()
            PopulateDistributorRepeater(state)
        End If
        dc.Dispose()
    End Sub

    Protected Sub AddDist_LinkButton_Click(sender As Object, e As System.EventArgs) Handles AddDist_LinkButton.Click
        Dim dc As New QPriceDataClassesDataContext
        Dim distributor As Long = Distributor_DropDownList.SelectedValue
        Dim state As Long = State_DropDownList.SelectedValue

        If Not DistributorExists(state, distributor) Then
            Dim mykey As New DistStateKey
            mykey.State_ID = state
            mykey.Distributor_ID = distributor
            dc.DistStateKeys.InsertOnSubmit(mykey)
            dc.SubmitChanges()
            dc.Dispose()
            PopulateDistributorRepeater(state)
        End If
    End Sub

    Protected Sub StateDistributor_Repeater_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles StateDistributor_Repeater.ItemDataBound
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

    Protected Sub RenderLabelValues()
        Dim statelbl As String = State_DropDownList.SelectedItem.ToString
        Dim distlbl As String = Distributor_DropDownList.SelectedItem.ToString

        DistName_Label.Text = distlbl
        NoDistExist_Label.Text = distlbl
        RemoveDist_Label.Text = statelbl
        AddDist_Label.Text = statelbl
        DistState_Label.Text = statelbl
        NoDistExistState_Label.Text = statelbl
    End Sub

    Protected Sub PopulateDistributorRepeater(ByVal primarykey As Long)
        Dim dc As New QPriceDataClassesDataContext

        Dim dist = From d In dc.Distributors, k In dc.DistStateKeys, s In dc.States
                  Where s.StateID = primarykey And k.State_ID = s.StateID And k.Distributor_ID = d.DistributorID
                  Select d
                  Order By d.DistOrderBy, d.DistName

        StateDistributor_Repeater.DataSource = dist
        StateDistributor_Repeater.DataBind()
        dc.Dispose() 
    End Sub

    Protected Function DistributorExists(ByVal state As Long, ByVal dist As Long) As Boolean
        Dim dc As New QPriceDataClassesDataContext
        Dim distributor = (From k In dc.DistStateKeys
                            Where k.State_ID = state And k.Distributor_ID = dist
                            Select k).SingleOrDefault

        If IsNothing(distributor) Then
            DistributorExists = False
        Else
            DistributorExists = True
        End If
    End Function

End Class
