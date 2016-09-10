<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false"
    CodeFile="PriceSheet.aspx.vb" Inherits="QuickPriceUser_PriceSheet" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/price-sheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="qp-container">
        <div class="qp-quote-header">
            <div class="qp-quote-logo">
                <asp:ImageButton ID="Logo_ImageButton" runat="server" PostBackUrl="~/QuickPriceUser/QPConfigure.aspx"
                    ImageUrl="../images/logos/quickprice.png" />
            </div>
            <div class="qp-quote-print">
                <img src="../images/icons/print.png" alt="print" />
                <asp:LinkButton ID="Print_LinkButton" runat="server" OnClientClick="javascript:window.print();"
                    Text="print quote" />
            </div>
        </div>
        <div class="clear">
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <div class="qp-quote-conditions-container">
                    <div class="qp-quote-contact">
                        <table>
                            <tr>
                                <td>Prepared For:
                                </td>
                                <td>
                                    <asp:Label ID="CustomerName_Label" runat="server" />
                                    <asp:TextBox ID="Customer_TextBox" runat="server" CssClass="textbox" Width="250px" Height="19px" />
                                    <asp:TextBoxWatermarkExtender ID="Customer_TextBoxWatermarkExtender" TargetControlID="Customer_TextBox"
                                        WatermarkText="Enter Contact Name" WatermarkCssClass="watermark" runat="server">
                                    </asp:TextBoxWatermarkExtender>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Label ID="CustomerCompany_Label" runat="server" />
                                    <asp:DropDownList ID="Company_DropDownList" runat="server" DataSourceID="Company_SqlDataSource"
                                        DataTextField="CompanyName" DataValueField="CompanyID" AutoPostBack="true" Width="254px" Height="25px" />
                                    <asp:SqlDataSource ID="Company_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                        SelectCommand="SELECT * FROM [Company] ORDER BY [CompanyName]"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </div>
                    <div class="qp-quote-terms">
                        <table>
                            <tr>
                                <td>Quoted Date:
                                    <td>
                                        <asp:Label ID="QuotedDate_Label" runat="server" />
                                    </td>
                                </td>
                            </tr>
                            <tr>
                                <td>Quote Expires:
                                </td>
                                <td>
                                    <asp:Label ID="QuoteExpires_Label" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="resale">
                    <div class="resale-contents">
                        <div class="resale-menu">
                            <asp:Panel ID="ResaleWire_Panel" runat="server">
                                <ul>
                                    <asp:LinkButton runat="server" ID="TypeJ_LinkButton"><li>Type "J" Wire</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="TypeK_LinkButton"><li>Type "K" Wire</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="TypeT_LinkButton"><li>Type "T" Wire</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="TypeE_LinkButton"><li>Type "E" Wire</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="RTD_LinkButton"><li>RTD Wire</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="Flex_LinkButton"><li>Flex Armor</li></asp:LinkButton>
                                </ul>
                            </asp:Panel>
                            <asp:Panel ID="ResaleAccessories_Panel" runat="server">
                                <ul>
                                    <asp:LinkButton runat="server" ID="HeadsBlocks_LinkButton"><li>Heads & Blocks</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="StandardConnectors_LinkButton"><li>Standard Connectors</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="ThreePinConnectors_LinkButton"><li>3-Pin Connectors</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="MiniConnectors_LinkButton"><li>Miniature Connectors</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="ThreePinMiniConnectors_LinkButton"><li>3-Pin Miniature Connectors</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="JackPanels_LinkButton"><li>Jack Panels</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="CompFittings_LinkButton"><li>Compression Fittings</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="Reducers_LinkButton"><li>Reducing Bushings</li></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="Bayonet_LinkButton"><li>Bayonet Adapters/Caps</li></asp:LinkButton>
                                </ul>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="resale-gridview">
                        <asp:HiddenField ID="Customer_HiddenField" runat="server" />
                        <asp:HiddenField ID="Catagory_HiddenField" runat="server" />
                        <asp:HiddenField ID="Calibration_HiddenField" runat="server" />
                        <asp:HiddenField ID="WireCount_HiddenField" runat="server" />
                        <asp:HiddenField ID="Standard_HiddenField" runat="server" />

                        <asp:GridView ID="Display_Gridview" runat="server" CssClass="resale-grid" GridLines="None"
                            AllowPaging="true" PageSize="5" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"
                            OnPageIndexChanging="Display_Gridview_PageIndexChanging" RowStyle-CssClass="noSelect" AutoGenerateColumns="false" ShowHeader="false">
                             <pagersettings Mode="Numeric"  position="TopAndBottom"/>
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <h4><%# Eval("partnumber")%></h4>
                                        <br />
                                        <h5><%# Eval("partdesc")%></h5>
                                        <br />
                                        <br />
                                        <table class="price-grid">
                                            <tr>
                                                <td>List Price</td>
                                                <%# RenderPricing(Eval("h1"), Eval("h2"), Eval("h3"), Eval("h4"), Eval("h5"), Eval("h6"))%>
                                            </tr>
                                            <tr>
                                                <td><%# Eval("listPrice")%></td>
                                                <%# RenderPricing(Eval("one"), Eval("two"), Eval("three"), Eval("four"), Eval("five"), Eval("six"))%>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>

                         <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <div class="update_progress_background"></div>
                                <div class="update_progress_container">
                                    Retrieving Data...
                            <img src="../images/loading.gif" />
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="clear">
        </div>
        <div class="qp-thankyou">
            Thank you for the opportunity to quote your requirements!
        </div>
        <div class="qp-ship-message">
            Shipping & Handling Charges Are <b>Not</b> Included In The Above Pricing
            <br />
            Minimum Order of <b>$50</b> NET Required, Excluding Freight
        </div>
        <div class="qp-confidential">
            <b>Confidential Document</b>
            <br />
            This quotation contains confidential, privileged, and/or proprietary information
            intended only for the addressee. Unauthorized usage of this document is strictly
            prohibited. Any design principles contained herewith are the sole property of SensorTec,
            Inc and are not to be disclosed, reproduced and/or distributed without prior written
            consent.
        </div>
    </div>
</asp:Content>
