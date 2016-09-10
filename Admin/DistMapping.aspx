<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false"
    CodeFile="DistMapping.aspx.vb" Inherits="Admin_DistMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/gridview.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="Dist_UpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <div class="distributor-container">
                <div class="dist-map">
                    <h5>
                        Select which state to view from the drop down list:</h5>
                    <br />
                    <p>
                        <asp:DropDownList ID="State_DropDownList" runat="server" DataSourceID="State_DataSource"
                            DataTextField="StateName" DataValueField="StateID" AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:LinqDataSource ID="State_DataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                            EntityTypeName="" OrderBy="StateName" TableName="States">
                        </asp:LinqDataSource>
                    </p>
                    <br />
                    <hr style="border: 1px solid #eee; width: 420px;" />
                    <br />
                    <h5>
                        Distributor List:</h5>
                    <br />
                    <p>
                        <asp:DropDownList ID="Distributor_DropDownList" runat="server" DataSourceID="Distributor_DataSource"
                            DataTextField="DistName" DataValueField="DistributorID" AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:LinqDataSource ID="Distributor_DataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                            EntityTypeName="" OrderBy="DistName" TableName="Distributors">
                        </asp:LinqDataSource>
                    </p>
                    <br />
                    <div class="inline-list">
                        <ul>
                            <li>
                                <asp:HyperLink ID="RemoveDist_HyperLink" runat="server" CssClass="button">
                                    Remove from
                                    <asp:Label runat="server" ID="RemoveDist_Label" /></asp:HyperLink></li><li>
                                        <asp:LinkButton ID="AddDist_LinkButton" runat="server" CssClass="button">
                                            Add to
                                            <asp:Label runat="server" ID="AddDist_Label" /></asp:LinkButton></li></ul>
                        <ul>
                    </div>
                    <br />
                    <div id="removeDist" class="message-box" style="display: none; width: 380px;">
                        Are you sure you want to remove
                        <h5>
                            <asp:Label ID="DistName_Label" runat="server" /></h5>
                        as a(n)
                        <asp:Label ID="DistState_Label" runat="server" />
                        distributor?
                        <br />
                        <br />
                        <div class="inline-list align-right">
                            <ul>
                                <li>
                                    <asp:LinkButton ID="ConfirmRemoveDist_LinkButton" runat="server" CssClass="button">Yes</asp:LinkButton></li><li>
                                        <asp:HyperLink ID="CancelRemoveDist_HyperLink" runat="server" CssClass="button">Cancel</asp:HyperLink></li></ul>
                        </div>
                    </div>
                    <asp:Panel ID="NoDistExist_Panel" runat="server">
                        <div class="error-box error-message" style="width: 400px;">
                            <asp:Label runat="server" ID="NoDistExist_Label" />
                            is not currently a distributor in
                            <asp:Label runat="server" ID="NoDistExistState_Label" />
                        </div>
                    </asp:Panel>
                </div>
                <div class="dist-info">
                    <asp:Repeater ID="StateDistributor_Repeater" runat="server">
                        <HeaderTemplate>
                            <h2>
                                <asp:Label runat="server" ID="State_Label" /></h2>
                            <hr />
                            <br />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <p>
                                <b>
                                    <%# Eval("DistName")%></b>
                                <br />
                                <%# Eval("DistAddress")%>
                                <br />
                                <asp:Panel runat="server" ID="Address2_Panel">
                                    <asp:Label runat="server" ID="Address2_Label" Text='<%# DataBinder.Eval(Container.DataItem,"DistAddress2") %>' />
                                    <br />
                                </asp:Panel>
                                <%# Eval("DistCity")%>,
                                <%# Eval("State.StateName")%> <%# Eval("DistZIP")%></p>
                            <div class="contacts">
                                <div class="primary-contact">
                                    <h5>
                                        Primary Contact:</h5>
                                    <br />
                                    <%# Eval("DistContact")%><br />
                                    Tel:
                                    <%# Eval("DistPhone")%><br />
                                    Fax:
                                    <%# Eval("DistFax")%><br />
                                    Email: <a href="mailto:<%# Eval("DistEmail")%>">
                                        <%# Eval("DistEmail")%></a></div>
                                <asp:Panel runat="server" ID="Contact2_Panel">
                                    <div class="secondary-contact">
                                        <h5>
                                            Secondary Contact:</h5>
                                        <br />
                                        <asp:Label runat="server" ID="Contact2_Label" Text='<%# DataBinder.Eval(Container.DataItem,"DistContact2") %>' />
                                        <br />
                                        Tel:
                                        <%# Eval("DistPhone2")%><br />
                                        Fax:
                                        <%# Eval("DistFax2")%><br />
                                        Email: <a href="mailto:<%# Eval("DistEmail2")%>">
                                            <%# Eval("DistEmail2")%></a></div>
                                </asp:Panel>
                            </div>
                            <div class="clear">
                            </div>
                            <br />
                            <hr style="background-color: #dedede;" />
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="clear">
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
