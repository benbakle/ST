
Partial Class QuickPriceUser_PriceSheet
    Inherits System.Web.UI.Page


    Private Function IsSales() As Boolean
        IsSales = Context.User.IsInRole("Administrator") Or Context.User.IsInRole("Sales")
    End Function
    Private pType As String
    Private Property PriceType As String
        Get
            If IsNothing(Request.QueryString("type")) Then
                pType = "Accessory"
            Else
                pType = Request.QueryString("type")
            End If
            Return pType
        End Get
        Set(value As String)
            pType = value
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim dc As New QPriceDataClassesDataContext
        QuotedDate_Label.Text = DateTime.Now.ToString("D")
        QuoteExpires_Label.Text = DateTime.Now.AddDays(60).ToString("D")

        If IsSales() Then
            CustomerName_Label.Visible = False
            CustomerCompany_Label.Visible = False
            Customer_TextBox.Visible = True
            Company_DropDownList.Visible = True

            If Not IsPostBack Then
                Company_DropDownList.DataBind()
                Company_DropDownList.SelectedValue = 2
                Customer_HiddenField.Value = Company_DropDownList.SelectedItem.ToString
            End If

        Else
            Dim userName As Customer
            userName = (From u In dc.Customers
                        Where u.CustEmail = Membership.GetUser.UserName.ToString
                        Select u).Single

            CustomerName_Label.Text = userName.CustFirstName & " " & userName.CustLastName
            CustomerCompany_Label.Text = userName.Company.CompanyName

            CustomerName_Label.Visible = True
            CustomerCompany_Label.Visible = True
            Customer_TextBox.Visible = False
            Company_DropDownList.Visible = False

            Customer_HiddenField.Value = (From c In dc.Companies, m In dc.Customers
                                          Where m.CustEmail = Membership.GetUser.UserName And m.Company_ID = c.CompanyID
                                          Select c.CompanyName).SingleOrDefault
        End If
        If Not IsPostBack Then
            If PriceType = "Wire" Then
                Catagory_HiddenField.Value = 31
                Calibration_HiddenField.Value = "J"
            Else
                Catagory_HiddenField.Value = 24
            End If
        End If

        RenderPricing()
        dc.Dispose()
    End Sub
    Protected Sub Company_DropDownList_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Company_DropDownList.SelectedIndexChanged
        Customer_HiddenField.Value = Company_DropDownList.SelectedItem.ToString
        RenderPricing()
    End Sub
    Protected Sub RenderPricing()
        Dim dc As New QPriceDataClassesDataContext
        Dim markUp As Double = 2.35

        Dim firstPercent As String, secondPercent As String, thirdPercent As String, forthPercent As String,
                fifthPercent As String

        Dim companyDiscount = (From c In dc.Companies
                               Where c.CompanyName = Customer_HiddenField.Value
                               Select c.Discount.DisountCode).SingleOrDefault

        Dim xmldoc As XDocument = XDocument.Load(Server.MapPath("~/App_Data/Discount.xml"))
        Dim scheduleDiscount = From d In xmldoc.Descendants("Discounts").Descendants(PriceType).Descendants(companyDiscount).Descendants("Discount")
                               Select d

        If PriceType = "Wire" Then
            ResaleWire_Panel.Visible = True
            ResaleAccessories_Panel.Visible = False
        Else
            ResaleWire_Panel.Visible = False
            ResaleAccessories_Panel.Visible = True
        End If

        For Each item In scheduleDiscount
            Dim myItemValue = item.Descendants("Percent").Value
            Select Case item.Descendants("Value").Value
                Case "discount1"
                    firstPercent = myItemValue
                Case "discount2"
                    secondPercent = myItemValue
                Case "discount3"
                    If myItemValue = "Consult" Then
                        thirdPercent = 1000
                    Else
                        thirdPercent = myItemValue
                    End If
                Case "discount4"
                    If myItemValue = "Consult" Then
                        forthPercent = 1000
                    Else
                        forthPercent = myItemValue
                    End If
                Case "discount5"
                    If myItemValue = "Consult" Then
                        fifthPercent = 1000
                    Else
                        fifthPercent = myItemValue
                    End If
            End Select
        Next

        Dim accessory As Object
        If PriceType = "Wire" Then
            If Catagory_HiddenField.Value = "37" Then
                accessory = From a In dc.Components
                            Where (a.ComponentCatagory.CatagoryInvCode = Catagory_HiddenField.Value And a.Resale = True)
                            Select partnumber = a.CompNum,
                                   partdesc = a.CompDesc,
                                   listPrice = FormatCurrency((a.CompCost + a.LaborCost) * markUp),
                                   one = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * firstPercent)),
                                   two = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * secondPercent)),
                                   three = -1,
                                   four = "",
                                   five = "",
                                   six = "",
                                   h1 = "25-999 ft",
                                   h2 = "1000-4999 ft",
                                   h3 = "5000+ ft",
                                   h4 = "",
                                   h5 = "",
                                   h6 = ""
                            Order By partnumber Ascending
            Else
                accessory = From a In dc.Components
                            Where (a.ComponentCatagory.CatagoryInvCode = Catagory_HiddenField.Value And a.Calibration.CalCode = Calibration_HiddenField.Value And a.Resale = True)
                            Select partnumber = a.CompNum,
                                   partdesc = a.CompDesc,
                                   listPrice = FormatCurrency((a.CompCost + a.LaborCost) * markUp),
                                   one = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * firstPercent)),
                                   two = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * secondPercent)),
                                   three = -1,
                                   four = "",
                                   five = "",
                                   six = "",
                                   h1 = "25-999 ft",
                                   h2 = "1000-4999 ft",
                                   h3 = "5000+ ft",
                                   h4 = "",
                                   h5 = "",
                                   h6 = ""
                            Order By partnumber Ascending
            End If
        Else
            If Catagory_HiddenField.Value = "26" Then

                accessory = From a In dc.Components
                            Where (a.ComponentCatagory.CatagoryInvCode = Catagory_HiddenField.Value And a.WireCount.WireCount = WireCount_HiddenField.Value And a.Standard = Standard_HiddenField.Value And a.Resale = True)
                            Select partcalibration = a.Calibration.CalCode,
                                   partnumber = a.CompNum,
                                   partdesc = a.CompDesc,
                                   listPrice = FormatCurrency((a.CompCost + a.LaborCost) * markUp),
                                   one = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * firstPercent)),
                                   two = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * secondPercent)),
                                   three = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * thirdPercent)),
                                   four = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * forthPercent)),
                                   five = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * fifthPercent)),
                                   six = -1,
                                   h1 = "1-9",
                                   h2 = "10-24",
                                   h3 = "25-49",
                                   h4 = "50-99",
                                   h5 = "100-249",
                                   h6 = "250+"
                            Order By partcalibration, partnumber Ascending
            Else
                accessory = From a In dc.Components
                            Where (a.ComponentCatagory.CatagoryInvCode = Catagory_HiddenField.Value And a.Resale = True)
                            Select partnumber = a.CompNum,
                                   partdesc = a.CompDesc,
                                   listPrice = FormatCurrency((a.CompCost + a.LaborCost) * markUp),
                                   one = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * firstPercent)),
                                   two = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * secondPercent)),
                                   three = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * thirdPercent)),
                                   four = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * forthPercent)),
                                   five = FormatCurrency(((a.CompCost + a.LaborCost) * markUp) - (((a.CompCost + a.LaborCost) * markUp) * fifthPercent)),
                                   six = -1,
                                   h1 = "1-9",
                                   h2 = "10-24",
                                   h3 = "25-49",
                                   h4 = "50-99",
                                   h5 = "100-249",
                                   h6 = "250+"
                            Order By partnumber Ascending
            End If

        End If
        Display_Gridview.DataSource = accessory
        On Error Resume Next
        Display_Gridview.DataBind()
        dc.Dispose()
    End Sub

    Public Function RenderPricing(ByVal val1 As String, val2 As String, val3 As String, val4 As String, val5 As String, val6 As String) As String
        Dim values() As String = {val1, val2, val3, val4, val5, val6}
        Dim header As String = ""
        For Each v In values
            If v <> "" Then
                If IsNumeric(v) Then
                    If v < 0 Then
                        v = "Consult"
                    End If
                End If
                header = header & "<td>" & v & "</td>"
            End If
        Next
        RenderPricing = header
    End Function

    Protected Sub Display_Gridview_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Display_Gridview.PageIndexChanging
        Display_Gridview.PageIndex = e.NewPageIndex
        RenderPricing()
    End Sub
    Protected Sub HeadsBlocks_LinkButton_Click(sender As Object, e As System.EventArgs) Handles HeadsBlocks_LinkButton.Click
        Catagory_HiddenField.Value = 24
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub
    Protected Sub StandardConnectors_LinkButton_Click(sender As Object, e As System.EventArgs) Handles StandardConnectors_LinkButton.Click
        Catagory_HiddenField.Value = 26
        WireCount_HiddenField.Value = 2
        Standard_HiddenField.Value = True
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub ThreePinConnectors_LinkButton_Click(sender As Object, e As System.EventArgs) Handles ThreePinConnectors_LinkButton.Click
        Catagory_HiddenField.Value = 26
        WireCount_HiddenField.Value = 3
        Standard_HiddenField.Value = True
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub MiniConnectors_LinkButton_Click(sender As Object, e As System.EventArgs) Handles MiniConnectors_LinkButton.Click
        Catagory_HiddenField.Value = 26
        WireCount_HiddenField.Value = 2
        Standard_HiddenField.Value = False
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub ThreePinMiniConnectors_LinkButton_Click(sender As Object, e As System.EventArgs) Handles ThreePinMiniConnectors_LinkButton.Click
        Catagory_HiddenField.Value = 26
        WireCount_HiddenField.Value = 3
        Standard_HiddenField.Value = False
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub JackPanels_LinkButton_Click(sender As Object, e As System.EventArgs) Handles JackPanels_LinkButton.Click
        Catagory_HiddenField.Value = 28
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub CompFittings_LinkButton_Click(sender As Object, e As System.EventArgs) Handles CompFittings_LinkButton.Click
        Catagory_HiddenField.Value = 43
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub Reducers_LinkButton_Click(sender As Object, e As System.EventArgs) Handles Reducers_LinkButton.Click
        Catagory_HiddenField.Value = 42
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub
    Protected Sub Bayonet_LinkButton_Click(sender As Object, e As System.EventArgs) Handles Bayonet_LinkButton.Click
        Catagory_HiddenField.Value = 44
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub TypeJ_LinkButton_Click(sender As Object, e As System.EventArgs) Handles TypeJ_LinkButton.Click
        Catagory_HiddenField.Value = 31
        Calibration_HiddenField.Value = "J"
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub TypeK_LinkButton_Click(sender As Object, e As System.EventArgs) Handles TypeK_LinkButton.Click
        Catagory_HiddenField.Value = 31
        Calibration_HiddenField.Value = "K"
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub TypeT_LinkButton_Click(sender As Object, e As System.EventArgs) Handles TypeT_LinkButton.Click
        Catagory_HiddenField.Value = 31
        Calibration_HiddenField.Value = "T"
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub TypeE_LinkButton_Click(sender As Object, e As System.EventArgs) Handles TypeE_LinkButton.Click
        Catagory_HiddenField.Value = 31
        Calibration_HiddenField.Value = "E"
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub RTD_LinkButton_Click(sender As Object, e As System.EventArgs) Handles RTD_LinkButton.Click
        Catagory_HiddenField.Value = 69
        Calibration_HiddenField.Value = "U"
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub

    Protected Sub Flex_LinkButton_Click(sender As Object, e As System.EventArgs) Handles Flex_LinkButton.Click
        Catagory_HiddenField.Value = 37
        Display_Gridview.PageIndex = 0
        RenderPricing()
    End Sub
End Class
