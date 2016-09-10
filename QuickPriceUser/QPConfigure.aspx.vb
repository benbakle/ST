
Partial Class QuickPrice_QPCatagory
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Me.MaintainScrollPositionOnPostBack = True

        If Not IsPostBack Then
            If Session("IsQuickQuote") Then
                GetPrice_LinkButton_Click(sender, e)
                If Session("Description") = "" Then
                    PartDescription_Label.Text = "<i>(To view a complete description of your part number, start with STEP 1 and configure your part number using QuickPrice.)</i>"
                Else
                    PartDescription_Label.Text = Session("Description")

                End If
            End If

        End If
        BreakDown_Panel.Attributes.Add("style", "display:none")

    End Sub
    '****************************
    'UNIVERSAL SUBS AND FUNCTIONS
    '****************************
    Private Function IsSales() As Boolean
        IsSales = Context.User.IsInRole("Administrator") Or Context.User.IsInRole("Sales")
    End Function


    Protected Sub RenderStep3()
        QuotedDate_Label.Text = DateTime.Now.ToString("D")
        QuoteExpires_Label.Text = DateTime.Now.AddDays(60).ToString("D")

        If IsSales() Then
            CustomerName_Label.Visible = False
            CustomerCompany_Label.Visible = False
            Customer_TextBox.Visible = True
            Company_DropDownList.Visible = True
            BreakDown_Panel.Visible = True
            ToggleBreakDown_HyperLink.Visible = True
        Else
            Dim dc As New QPriceDataClassesDataContext
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
            BreakDown_Panel.Visible = False
            ToggleBreakDown_HyperLink.Visible = False
        End If
    End Sub

    Protected Sub ActivateStep3()
        Step1_Panel.Style("display") = "none"
        Step2_Panel.Style("display") = "none"
        Step2_LinkButton.CssClass = "step2_tab"
        Step3_LinkButton.CssClass = "step3_tab"
        Step3_Panel.Style("display") = "block"
        Session("IsQuickQuote") = False

    End Sub


    '*********************
    'GET PRICE LINKBUTTON
    '*********************
    Protected Sub GetPrice_LinkButton_Click(sender As Object, e As System.EventArgs) Handles GetPrice_LinkButton.Click
        Dim mySensor As New TemperatureSensor
        System.Threading.Thread.Sleep(1000)
        Try
            If Session("IsQuickQuote") Then
                RenderStep3()
                ActivateStep3()
                Step2_LinkButton.CssClass = "step2_tab inactive"
            Else
                If (FormIsComplete_HiddenField.Value <> "true") Then
                    Exit Sub
                End If
                'Checks that partnumber is valid before proceeding to Step 3 (throws error in SetListPricing if bad part number)
                Session("PartNumber") = PartNumber_HiddenField.Value
                Session("Description") = Desc_HiddenField.Value
                mySensor.PartNumber = UCase(Session("PartNumber"))
                mySensor.SetListPricing()
                RenderStep3()
                ActivateStep3()

            End If

            PartNumber_Label.Text = Session("PartNumber").ToString
            PartDescription_Label.Text = Session("Description").ToString

            mySensor.PartNumber = UCase(Session("PartNumber"))
            mySensor.SetListPricing()

            BaseCost_Label.Text = DisplayPrice(mySensor.BaseCost)
            SheathTermCost_Label.Text = DisplayPrice(mySensor.SheathTermCost)
            FittingCost_Label.Text = DisplayPrice(mySensor.FittingCost)

            'Handles Leadwire display
            If mySensor.IsLeadwireStyle Or Not mySensor.HasMI Then
                LeadwireCostLineItem.Visible = True
                LeadwireCost_Label.Text = DisplayPrice(mySensor.LeadwireCost)
                LeadwireTermCostLineItem.Visible = True
                LeadwireTermCost_Label.Text = DisplayPrice(mySensor.LeadwireTermCost)
            Else
                LeadwireCostLineItem.Visible = False
                LeadwireTermCostLineItem.Visible = False
            End If
            'Handles Flex display
            If mySensor.HasFlex Then
                FlexCostLineItem.Visible = True
                FlexCost_Label.Text = DisplayPrice(mySensor.FlexCost)
            Else
                FlexCostLineItem.Visible = False
            End If
            'Handles MI display
            If mySensor.HasMI Then
                MICostLineItem.Visible = True
                MICost_Label.Text = DisplayPrice(mySensor.MICost)
            Else
                MICostLineItem.Visible = False
            End If
            'Handles Tubing display
            If mySensor.HasTubing Then
                TubeCostLineItem.Visible = True
                TubeCost_Label.Text = DisplayPrice(mySensor.TubeCost)
            Else
                TubeCostLineItem.Visible = False
            End If
            'Handles Sanitary display
            If mySensor.IsSanitary Then
                SanitaryCostLineItem.Visible = True
                SanitaryCost_Label.Text = DisplayPrice(mySensor.SanitaryCost)
            Else
                SanitaryCostLineItem.Visible = False
            End If
            'Handles Insertion Probe display
            If mySensor.IsInsertionProbe Then
                InsertionProbeCostLineItem.Visible = True
                InsertionProbeCost_Label.Text = DisplayPrice(mySensor.InsertionProbeCost)
            Else
                InsertionProbeCostLineItem.Visible = False
            End If
            'Handles Thermowell Assembly display
            If mySensor.IsThermowellAssembly Then
                ThermowellAssemblyCostLineItem.Visible = True
                ThermowellAssemblyCost_Label.Text = DisplayPrice(mySensor.ThermowellAssemblyCost)
            Else
                ThermowellAssemblyCostLineItem.Visible = False
            End If
            'Handles Thermowell display
            If mySensor.HasThermowell Then
                ThermowellCostLineItem.Visible = True
                ThermowellCost_Label.Text = DisplayPrice(mySensor.ThermowellCost)
            Else
                ThermowellCostLineItem.Visible = False
            End If
            'Handles Quick Connect display
            If mySensor.IsQuickConnect Then
                QuickConnectCostLineItem.Visible = True
                QuickConnectCost_Label.Text = DisplayPrice(mySensor.QuickConnectCost)
            Else
                QuickConnectCostLineItem.Visible = False
            End If
            If mySensor.IsExtension Then
                ExtensionCostLineItem.Visible = True
                ExtensionCost_Label.Text = DisplayPrice(mySensor.ExtensionCost)
            Else
                ExtensionCostLineItem.Visible = False
            End If
            If mySensor.HasOption1 Then
                Option1CostLineItem.Visible = True
                Option1Cost_Label.Text = DisplayPrice(mySensor.Option1Cost)
            Else
                Option1CostLineItem.Visible = False
            End If
            If mySensor.HasOption2 Then
                Option2CostLineItem.Visible = True
                Option2Cost_Label.Text = DisplayPrice(mySensor.Option2Cost)
            Else
                Option2CostLineItem.Visible = False
            End If
            If mySensor.HasCode Then
                SpecialCodeCostLineItem.Visible = True
                SpecialCodeCost_Label.Text = DisplayPrice(mySensor.CodeCost)
            Else
                SpecialCodeCostLineItem.Visible = False
            End If

            'Handles List Cost display
            SensorCost_Label.Text = DisplayPrice(mySensor.ListPrice, mySensor.QuoteError)


            Dim dc As New QPriceDataClassesDataContext
            Dim company = (From c In dc.Companies, m In dc.Customers
                          Where m.CustEmail = Membership.GetUser.UserName And m.Company_ID = c.CompanyID
                          Select c.CompanyName).SingleOrDefault

            If IsSales() Then
                Dim myCompany = (From s In dc.Companies
                                 Where s.CompanyName = "Sure Controls Inc."
                                 Select Name = s.CompanyName, ID = s.CompanyID).SingleOrDefault

                Company_DropDownList.SelectedValue = myCompany.ID
                company = myCompany.Name

            End If
            RenderDiscountPricing(mySensor.ListPrice, company)
            Step3_LinkButton.Focus()
        Catch ex As Exception
            ' MailToError_HyperLink.NavigateUrl = "mailto:sales@sensortecinc.com?subject=QuickPrice Assistance&body=Part Number:" & Session("PartNumber")
            Session("PartNumber") = ""
            Session("Description") = ""
            ' InvalidPartNumberError.Visible = True
        End Try
    End Sub

    Protected Function DisplayPrice(ByRef myCost As Double, Optional ByVal err As String = "") As String
        If myCost > -1 Then
            DisplayPrice = FormatCurrency(myCost)
            ConsultFactoryError.Visible = False
        Else
            DisplayPrice = "Consult Factory"
            ConsultFactoryError_HyperLink.NavigateUrl = "mailto:sales@sensortecinc.com?subject=QuickPrice Assistance&body=Part Number:" & Session("PartNumber")
            ConsultFactoryError.Visible = True
            If err <> "" Then
                QuoteError_Label.Text = err
                QuoteErrorDiv.Visible = True
            End If
        End If
    End Function

    Protected Sub Company_DropDownList_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Company_DropDownList.SelectedIndexChanged
        Dim mySensor As New TemperatureSensor
        Dim myPartNumber As String
        Dim company As String = Company_DropDownList.SelectedItem.ToString
        Dim listprice As Double

        myPartNumber = PartNumber_Label.Text
        mySensor.PartNumber = UCase(myPartNumber)
        mySensor.SetListPricing()
        listprice = mySensor.ListPrice
        RenderDiscountPricing(listprice, company)
        System.Threading.Thread.Sleep(1000)
    End Sub

    Protected Sub RenderDiscountPricing(ByVal listprice As Double, ByVal company As String)
        Dim dc As New QPriceDataClassesDataContext
        Dim discountList As String = ""


        Dim companyDiscount = (From c In dc.Companies
                               Where c.CompanyName = company
                               Select c.Discount.DisountCode).SingleOrDefault

        Dim xmldoc As XDocument = XDocument.Load(Server.MapPath("~/App_Data/Discount.xml"))

        Dim scheduleDiscount = From d In xmldoc.Descendants("Discounts").Descendants("Manufactured").Descendants(companyDiscount).Descendants("Discount") _
                               Select d

        For Each item In scheduleDiscount
            Dim qtydesc As String = item.Element("Quantity")
            Dim twoWeekPrice As String
            Dim oneDayPrice As String
            Dim threeDayPrice As String
            Dim fiveDayPrice As String
            Dim discountPercent As Double
            Try
                'forces error if listprice is -1 (setting double as string)
                If listprice < 0 Then
                    listprice = "force error"
                End If
                discountPercent = CDbl(item.Element("Percent"))
                twoWeekPrice = FormatCurrency((1 - discountPercent) * listprice)
                oneDayPrice = FormatCurrency(twoWeekPrice * 1.5)
                threeDayPrice = FormatCurrency(twoWeekPrice * 1.25)
                fiveDayPrice = FormatCurrency(twoWeekPrice * 1.15)
            Catch ex As Exception
                twoWeekPrice = "Consult"
                oneDayPrice = "Consult"
                threeDayPrice = "Consult"
                fiveDayPrice = "Consult"

            End Try


            discountList = discountList & "<div id=""DiscountLineItem"" runat=""server"">" & _
                                "<div class=""price-breakdown-container"">" & _
                                    "<ul class=""breakdown-line-item"">"

            discountList = discountList & "<li class=""quantity-discount-desc"">" & item.Element("Quantity").Value & "</li>" & _
                                           "<div class=""vDivider-light""></div>"

            discountList = discountList & "<li class=""two-weeks-discount"">" & twoWeekPrice & "</li>"
            discountList = discountList & "<li class=""exp-discount"">" & oneDayPrice & "</li>"
            discountList = discountList & "<li class=""exp-discount"">" & threeDayPrice & "</li>"
            discountList = discountList & "<li class=""exp-discount"">" & fiveDayPrice & "</li>"


            discountList = discountList & "</ul></div><div class=""clear""></div></div>"
        Next

        PriceDiscount_Label.Text = discountList
    End Sub




End Class

