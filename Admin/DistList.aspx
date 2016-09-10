<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false"
    CodeFile="DistList.aspx.vb" Inherits="Admin_DistList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:LinqDataSource ID="Distributor_DataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
        OrderBy="DistOrderBy, DistName" TableName="Distributors">
    </asp:LinqDataSource>
    <div class="inline">
        <h1>Distributors
        </h1>
    </div>
    <br />
    <hr />
    <br />
    <asp:UpdatePanel runat="server" ID="Distributor_UpdatePanel">
        <ContentTemplate>
            <asp:Panel runat="server" ID="DistGridView_Panel">
                <asp:GridView ID="Distributor_GridView" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="DistributorID" DataSourceID="Distributor_DataSource" CssClass="base-grid"
                    PagerStyle-CssClass="pgr" RowStyle-CssClass="noSelect" GridLines="None" OnRowDataBound="Distributor_GridView_RowDataBound"
                    OnSelectedIndexChanged="Distributor_GridView_SelectedIndexChanged" AllowPaging="True"
                    PageSize="15">
                    <Columns>
                        <asp:BoundField DataField="DistName" HeaderText="Distributor" ReadOnly="True" SortExpression="DistName" />
                        <asp:BoundField DataField="DistContact" HeaderText="Contact" ReadOnly="True" SortExpression="DistContact" />
                        <asp:BoundField DataField="DistPhone" HeaderText="Phone" ReadOnly="True" SortExpression="DistPhone" />
                        <asp:BoundField DataField="DistFax" HeaderText="Fax" ReadOnly="True" SortExpression="DistFax" />
                        <asp:BoundField DataField="DistEmail" HeaderText="Email" ReadOnly="True" SortExpression="DistEmail" />
                        <asp:CommandField ShowSelectButton="True" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
                <br />
                <hr />
                <br />
                <div class="inline-list align-right">
                    <ul>
                        <li>
                            <asp:LinkButton ID="AddDist_LinkButton" runat="server" Text="Add Distributor" CssClass="button" />
                        </li>
                    </ul>
                    <div class="clear">
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="DistEdit_Panel">

                <br />
                <table class="table-pad">
                    <tr>
                        <td>
                            <h4>Distributor:</h4>
                            <br />
                            <asp:TextBox ID="Distributor_TextBox" runat="server" Width="400px"></asp:TextBox>
                        </td>
                        <td>
                            <h4>OrderBy:</h4>
                            <br />
                            <asp:TextBox ID="OrderBy_TextBox" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>Address:</h4>
                            <br />
                            <asp:TextBox ID="Address_TextBox" runat="server" Width="400px"></asp:TextBox>
                        </td>
                        <td>
                            <h4>City:</h4>
                            <br />
                            <asp:TextBox ID="City_TextBox" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <h4>State:</h4>
                            <br />
                            <asp:DropDownList ID="State_DropDownList" runat="server" DataSourceID="State_DataSource"
                                DataTextField="StateName" DataValueField="StateID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="State_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                SelectCommand="SELECT * FROM [State]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>Address 2:</h4>
                            <br />
                            <asp:TextBox ID="Address2_TextBox" runat="server" Width="400px"></asp:TextBox>
                        </td>
                        <td>
                            <h4>ZIP Code:</h4>
                            <br />
                            <asp:TextBox ID="ZIP_TextBox" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <hr style="border-top: 1px solid #dedede;" />
                <br />
                <table class="table-pad">
                    <tr>
                        <td>
                            <h4>Primary Contact:</h4>
                            <br />
                            <asp:TextBox ID="Contact_TextBox" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <h4>Phone:</h4>
                            <br />
                            <asp:TextBox ID="Phone_TextBox" runat="server" Width="125px"></asp:TextBox>
                        </td>
                        <td>
                            <h4>Fax:</h4>
                            <br />
                            <asp:TextBox ID="Fax_TextBox" runat="server" Width="125px"></asp:TextBox>
                        </td>
                        <td>
                            <h4>Email:</h4>
                            <br />
                            <asp:TextBox ID="Email_TextBox" runat="server" Width="205px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>Secondary Contact :</h4>
                            <br />
                            <asp:TextBox ID="Contact2_TextBox" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <h4>Phone:</h4>
                            <br />
                            <asp:TextBox ID="Phone2_TextBox" runat="server" Width="125px"></asp:TextBox>
                        </td>
                        <td>
                            <h4>Fax:</h4>
                            <br />
                            <asp:TextBox ID="Fax2_TextBox" runat="server" Width="125px"></asp:TextBox>
                        </td>
                        <td>
                            <h4>Email:</h4>
                            <br />
                            <asp:TextBox ID="Email2_TextBox" runat="server" Width="205px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <hr />
                <br />
                <div id="deleteDist" class="message-box" style="display: none;">
                    Are you sure you want to delete
                        <h5>
                            <asp:Label ID="DistName_Label" runat="server" /></h5>
                    from Distributors?
                        <br />
                    <br />
                    <div class="inline-list align-right">
                        <ul>
                            <li>
                                <asp:LinkButton ID="ConfirmDeleteDist_LinkButton" runat="server" CssClass="button">Yes</asp:LinkButton></li>
                            <li>
                                <asp:HyperLink ID="CancelDeleteDist_HyperLink" runat="server" CssClass="button">Cancel</asp:HyperLink></li>
                        </ul>
                    </div>
                </div>

                <div class="inline-list align-right">
                    <ul>
                        <li>
                            <asp:LinkButton ID="Cancel_LinkButton" runat="server" Text="Cancel" CssClass="button" />
                        </li>
                        <li>
                            <asp:HyperLink ID="DeleteDist_HyperLink" runat="server" Text="Delete" CssClass="button" />
                        </li>
                        <li>
                            <asp:LinkButton ID="UpdateDist_LinkButton" runat="server" Text="Done" CssClass="button" />
                        </li>
                        <li>
                            <asp:LinkButton ID="InsertDist_LinkButton" runat="server" Text="Add" CssClass="button" />
                        </li>
                    </ul>
                    <div class="clear">
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
