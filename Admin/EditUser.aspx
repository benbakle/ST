<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false"
    CodeFile="EditUser.aspx.vb" Inherits="Admin_EditUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h1>Edit Users
            </h1>
            <br />
            <br />
            <hr />
            <br />
            <asp:Panel ID="EditUserPanel" runat="server" DefaultButton="UpdateUserButton">
                <asp:GridView ID="CustomerGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID"
                    DataSourceID="CustomerDataSource" CssClass="base-grid" OnRowDataBound="CustomerGridView_RowDataBound"
                    RowStyle-CssClass="noSelect" SelectedRowStyle-CssClass="selected" GridLines="None" AllowPaging="true"
                    PagerStyle-CssClass="pgr" OnPageIndexChanged="CustomerGridview_PageIndexChanged" PageSize="20">
                    <Columns>
                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Company" SortExpression="Company_ID">
                            <ItemTemplate>
                                <asp:Label ID="Company_Label" runat="server" Text='<%# Eval("Company.CompanyName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="Company_DropDownList" runat="server" DataSourceID="Company_DataSource"
                                    DataTextField="CompanyName" DataValueField="CompanyID" SelectedValue='<%# Bind("Company_ID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="Company_DataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                    EntityTypeName="" OrderBy="CompanyName" TableName="Companies">
                                </asp:LinqDataSource>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CustLastName" HeaderText="Last Name" SortExpression="CustLastName" />
                        <asp:BoundField DataField="CustFirstName" HeaderText="First Name" SortExpression="CustFirstName" />
                        <asp:TemplateField HeaderText="Username/Email" SortExpression="CustEmail">
                            <EditItemTemplate>
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("CustEmail") %>' ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("CustEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Permissions" SortExpression="Role_ID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="RoleDropDownList" runat="server" DataSourceID="RoleDataSource"
                                    DataTextField="RoleDesc" DataValueField="RoleID" SelectedValue='<%# Bind("Role_ID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="RoleDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                    EntityTypeName="" OrderBy="RoleDesc" TableName="UserRoles">
                                </asp:LinqDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("UserRole.RoleDesc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="true" ButtonType="Link" Visible="true" SelectText="Select"
                            HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                            <HeaderStyle CssClass="hidden" Width="0px" />
                            <ItemStyle CssClass="hidden" />
                        </asp:CommandField>
                    </Columns>
                    <RowStyle CssClass="noSelect" />
                    <SelectedRowStyle CssClass="selected" />
                </asp:GridView>
            </asp:Panel>
            <div id="deleteUser" class="message-box" style="display: none;">
                <asp:Label ID="DeleteUser_Label" runat="server" />
                <br />
                <br />
                <div class="inline-list align-right">
                    <ul>
                        <li>
                            <asp:LinkButton ID="ConfirmDeleteUser_LinkButton" runat="server" CssClass="button">Yes</asp:LinkButton></li>
                        <li>
                            <asp:HyperLink ID="CancelDeleteUser_HyperLink" runat="server" CssClass="button">Cancel</asp:HyperLink></li>
                    </ul>
                </div>
            </div>
            <div class="align-right">
                <asp:HyperLink ID="DeleteUser_HyperLink" CssClass="button" runat="server">Delete User</asp:HyperLink>
            </div>
            <asp:Button ID="UpdateUserButton" runat="server" Text="Button" CssClass="hidden"
                CausesValidation="false" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinqDataSource ID="CustomerDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
        EntityTypeName="" OrderBy="Company.CompanyName, CustLastName" TableName="Customers"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
</asp:Content>
