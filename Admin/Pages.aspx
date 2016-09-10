<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false"
    ValidateRequest="false" CodeFile="Pages.aspx.vb" Inherits="Admin_Pages" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="Pages_UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <h1>Manage SensorTec Products & Services</h1>
            <br />
            <br />
            <hr />
            <br />
            <div class="manage-pages">
                <div class="manage-pages-links">

                    <h2>Product</h2>
                    <asp:GridView ID="Product_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="PageID"
                        DataSourceID="Product_DataSource" OnRowCommand="Product_GridView_RowCommand"
                        ShowHeader="False" GridLines="None">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" Text='<%# Eval("PageHeader") %>'
                                        CommandArgument='<%# Eval("PageID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:LinqDataSource ID="Product_DataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                        EntityTypeName="" TableName="Pages" Where="PageType_ID == @PageType_ID" OrderBy="PageOrderBy">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="1" Name="PageType_ID" Type="Int64" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <h2>Services</h2>
                    <asp:GridView ID="Services_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="PageID"
                        DataSourceID="Services_DataSource" OnRowCommand="Services_GridView_RowCommand"
                        ShowHeader="False" GridLines="None">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" Text='<%# Eval("PageHeader") %>'
                                        CommandArgument='<%# Eval("PageID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:LinqDataSource ID="Services_DataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                        EntityTypeName="" TableName="Pages" Where="PageType_ID == @PageType_ID" OrderBy="PageOrderBy">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="2" Name="PageType_ID" Type="Int64" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:HiddenField ID="PrimaryKey_HiddenField" runat="server" />
                </div>
                <div class="manage-pages-edit">
                    <asp:Panel ID="Start_Panel" runat="server">
                        <h4>To Edit a topic, click on the appropriate link to the left. Edit mode allows you
                            to change the values of the following:</h4>
                        <br />
                        <br />
                        <ul style="list-style: none;">
                            <li>Header - title of each section or page</li>
                            <li>Image URL - url of the image to be displayed</li>
                            <li>Page URL - url of the page to link to</li>
                            <li>Display Page - which page data is to be displayed on</li>
                            <li>Display Order - the order in which the data should be displayed</li>
                            <li>Description - a description summary of header topic</li>
                        </ul>
                        <br />
                        <h4>To Add a new topic, click the "New Topic" button below. Be sure to fill out the
                            form completely. (recommended for service administrator only)</h4>
                        <br />
                        <br />
                        <br />
                        <div class="align-right">
                            <asp:LinkButton ID="NewTopic_LinkButton" runat="server" CssClass="big-button" CausesValidation="false">New Topic</asp:LinkButton>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="EditPages_Panel" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <h4>Page ID:</h4>
                                </td>
                                <td>
                                    <asp:TextBox ID="ID_TextBox" Enabled="false" runat="server" Width="25px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Header:</h4>
                                </td>
                                <td>
                                    <asp:TextBox ID="Header_TextBox" runat="server" />
                                    <asp:RequiredFieldValidator ID="Header_Validator" runat="server" ErrorMessage="Header value is required."
                                        ControlToValidate="OrderBy_TextBox" CssClass="error-message" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Image URL:</h4>
                                </td>
                                <td>
                                    <asp:TextBox ID="ImgURL_TextBox" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Page URL:</h4>
                                </td>
                                <td>
                                    <asp:TextBox ID="PageURL_TextBox" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Display Page:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="PageType_DropDownList" runat="server" DataSourceID="PageType_DataSource"
                                        DataTextField="PageTypeDesc" DataValueField="PageTypeID" />
                                    <asp:SqlDataSource ID="PageType_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                        SelectCommand="SELECT * FROM [PageType] ORDER BY [PageTypeDesc]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Display Order:</h4>
                                </td>
                                <td>
                                    <asp:TextBox ID="OrderBy_TextBox" runat="server" Width="25px" />
                                    <asp:RequiredFieldValidator ID="OrderBy_Validator" runat="server" ErrorMessage="*"
                                        ControlToValidate="OrderBy_TextBox" CssClass="error-message" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Char Display:</h4>
                                </td>
                                <td>
                                    <asp:TextBox ID="DisplayChar_TextBox" runat="server" Width="25px" />
                                    <asp:RequiredFieldValidator ID="DisplayChar_Validator" runat="server" ErrorMessage="*"
                                        ControlToValidate="DisplayChar_TextBox" CssClass="error-message" />
                                    <i style="font-size: .8em;">number of characters to display on "Products" & "Services" pages. </i>
                                    
                                </td>
                            </tr>
                        </table>

                        <br />
                        <br />
                        <h4>Page Code (html/css/javascript):</h4>
                        <br />
                        <a href="http://www.lettercount.com/" target="_blank">[get character count here]</a>
                        <br />
                        <br />
                        <asp:TextBox ID="Desc_TextBox" runat="server" TextMode="MultiLine"/>
                        <br />
                        <br />
                        <div id="deleteTopic" class="message-box" style="display: none;">
                            Are you sure you want to delete
                            <h5>
                                <asp:Label ID="TopicDelete_Label" runat="server" /></h5>
                            from topics list?
                            <br />
                            <br />
                            <div class="inline-list align-right">
                                <ul>
                                    <li>
                                        <asp:LinkButton ID="ConfirmDeleteTopic_LinkButton" runat="server" CssClass="button">Yes</asp:LinkButton></li>
                                    <li>
                                        <asp:HyperLink ID="CancelDeleteTopic_HyperLink" runat="server" CssClass="button">Cancel</asp:HyperLink></li>
                                </ul>
                            </div>
                        </div>
                        <div class="align-right inline-list">
                            <ul>
                                <li>
                                    <asp:LinkButton ID="Cancel_LinkButton" runat="server" CssClass="button" Text="Cancel"
                                        CausesValidation="false" />
                                </li>
                                <li>
                                    <asp:LinkButton ID="AddTopic_LinkButton" runat="server" CssClass="button" Text="Add"
                                        CausesValidation="true" />
                                </li>
                                <li>
                                    <asp:HyperLink ID="DeleteTopic_HyperLink" runat="server" CssClass="button" Text="Delete" />
                                </li>
                                <li>
                                    <asp:LinkButton ID="UpdateTopic_LinkButton" runat="server" CssClass="button" Text="Update"
                                        CausesValidation="true" />
                                </li>
                            </ul>
                        </div>
                    </asp:Panel>
                </div>
                <div class="clear">
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
