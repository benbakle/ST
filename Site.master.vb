
Partial Class Site
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim dc As New QPriceDataClassesDataContext
        Dim isAdmin As Boolean = Context.User.IsInRole("Administrator")
        Try

            Dim myUser = (From u In dc.Customers
                            Where u.CustEmail = Membership.GetUser.UserName.ToString
                            Select u).Single

            Dim namelbl As Label = CType(QPLoginView.FindControl("LoginNameLabel"), Label)
            Dim namelink As LinkButton = CType(QPLoginView.FindControl("LoginNameLink"), LinkButton)
            Dim loginPanel As Panel = CType(QPLoginView.FindControl("LoginPanel"), Panel)
            If isAdmin Then
                namelbl.Visible = False
                namelink.Visible = True
                namelink.Text = myUser.CustFirstName.ToString
            Else
                namelink.Visible = False
                namelbl.Visible = True
                namelbl.Text = myUser.CustFirstName.ToString
            End If
            Dim discountDisplay As String = ""
            Dim discountSchedule As String = myUser.Company.Discount.DiscountDesc.ToString
            For i = 1 To (38 - Len(discountSchedule))
                discountDisplay = discountDisplay & "."
            Next
            DiscountSchedule_Label.Text = discountDisplay & discountSchedule
            ListCostDisplay.Visible = False
            PriceBreakDownMessage.Visible = False
        Catch ex As Exception
        End Try
        Dim myDate As Date = Date.Now
        Dim myDateString As String
        If myDate.Year > "2013" Then
            myDateString = "2013-" & myDate.Year.ToString
        Else
            myDateString = myDate.Year.ToString
        End If
        Date_Label.Text = "Copyright © " & myDateString & " SensorTec Inc. | Powered by Ninjas"
    End Sub

    Protected Sub GetCostButton_Click()
        Dim mySensor As New TemperatureSensor
        Dim costResult As String
        Dim pnTextBox As TextBox
        Dim pNumber As String
        Dim crLabel As Label
        Dim crString As String = ""

        pnTextBox = QPLoginView.FindControl("PartNumber_TextBox")
        crLabel = QPLoginView.FindControl("CostResultLabel")
        pNumber = UCase(pnTextBox.Text)

        If pNumber <> "" Then
            If (InStr(pNumber, " ") < 1) And Mid(pNumber, pNumber.Length - 4, 1) = "(" And Mid(pNumber, pNumber.Length, 1) = ")" Then
                pNumber = Mid(pNumber, 1, pNumber.Length - 5) & " " & Mid(pNumber, pNumber.Length - 4, 5)
            End If
        End If

        Session("PartNumber") = pNumber
        Session("Description") = ""
        Session("IsQuickQuote") = True

        mySensor.PartNumber = Session("PartNumber")
        Try
            mySensor.SetListPricing()
        Catch ex As Exception
            mySensor.ListPrice = -1
        End Try


        If mySensor.ListPrice > -1 Then
            costResult = FormatCurrency(mySensor.ListPrice)
            ListCostDisplay.Visible = True
            PriceBreakDownMessage.Visible = True
            HelpOptionMessage.Visible = False
        Else
            costResult = "Consult Factory"
            PriceBreakDownMessage.Visible = False
            ListCostDisplay.Visible = True
            HelpOptionMessage.Visible = True
        End If
        If mySensor.HasCode Then
            pnTextBox.Text = mySensor.PartNumber & " (" & mySensor.Code & ")"
        Else
            pnTextBox.Text = mySensor.PartNumber
        End If

        For i = 1 To (35 - Len(costResult))
            crString = crString & "."
        Next

        crLabel.Text = crString & costResult
        ListCostLabel.Visible = True
    End Sub
End Class

