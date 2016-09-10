<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="PS.aspx.vb" Inherits="PS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Styles/product-service.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="paper">
            <div class="paper-container">

                <asp:Repeater ID="Product_Repeater" runat="server" DataSourceID="Product_DataSource">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="product-layout">

                            <img src='<%# DataBinder.Eval(Container.DataItem, "PageImg") %>' />

                            <div class="product-desc">
                                <h1>
                                    <%# Eval("PageHeader")%></h1>
                                <br />
                                <br />
                                <asp:HiddenField ID="DisplayChar_HiddenField" Value='<%# DataBinder.Eval(Container.DataItem, "PageDisplayChar")%>' runat="server" />
                                <p>
                                    <asp:Label ID="Product_Label" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"PageDesc")  %>'></asp:Label>
                                </p>

                            </div>
                            <div class="clear"></div>
                            <div class="learn">
                                <asp:LinkButton ID="Product_LinkButton" runat="server" Text="LEARN MORE" PostBackUrl='<%# DataBinder.Eval(Container.DataItem, "PageURL") %>' />
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>

                <asp:LinqDataSource ID="Product_DataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                    EntityTypeName="" TableName="Pages" OrderBy="PageOrderBy" Where="PageType_ID == @PageType_ID">
                    <WhereParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="PageType_ID" QueryStringField="type"
                            Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </div>
        </div>
        <div class="paper-shadow">
        </div>
    </div>
</asp:Content>
