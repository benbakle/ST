<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false"
    CodeFile="Components.aspx.vb" Inherits="Components" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/components.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="container">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <h1>Manage Components</h1>
                <br />
                <br />
                <hr />
                <br />
                <table class="table-pad">
                    <tr>
                        <td>
                            <h5>Select Catagory:
                            </h5>
                        </td>
                        <td>
                            <asp:DropDownList ID="CatagoryDropDown" runat="server" AutoPostBack="True" DataSourceID="CatagoryDataSource"
                                DataTextField="CatagoryDesc" DataValueField="CatagoryID" AppendDataBoundItems="true">
                                <asp:ListItem Value="0">[view items with codes]</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>
                                    <div class="update_progress_background"></div>
                                    <div class="update_progress_container">
                                        Retrieving Data...<link href="../Styles/password-recovery.css" rel="stylesheet" />
                                        <img src="../images/loading.gif" />
                                    </div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>
                    </tr>
                </table>
                <br />
                <!------------------------------------------------------------------------------------------------>
                <!-----------------------------BEGIN PARTS GRIDVIEW-------------- -------------------------------->
                <!------------------------------------------------------------------------------------------------>
                <asp:Panel runat="server" DefaultButton="UpdateMainButton">
                    <center>
                        <asp:Label ID="NullLabel" runat="server" Text="" CssClass="error-message" Visible="false" /></center>
                    <asp:GridView ID="PartsGridView" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="CompID" AllowPaging="True" OnPageIndexChanging="PartsGridView_PageIndexChanging" CssClass="base-grid" PagerStyle-CssClass="pgr"
                        RowStyle-CssClass="noSelect" SelectedRowStyle-CssClass="selected" GridLines="None"
                        OnSelectedIndexChanged="PartsGridview_SelectedIndexChanged" OnRowDataBound="PartsGridview_RowDataBound"
                        PageSize="20">
                        <Columns>
                            <asp:BoundField DataField="CompNum" HeaderText="Part Number" SortExpression="CompNum">
                                <HeaderStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CompCode" HeaderText="Code" SortExpression="CompCode">
                                <HeaderStyle Width="65px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Description" SortExpression="CompDesc">
                                <ItemTemplate>
                                    <asp:Label ID="DescLabel" runat="server" Text='<%# Bind("CompDesc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CompCost" DataFormatString="{0:c}" HeaderText="Cost" SortExpression="CompCost">
                                <HeaderStyle Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="UM" SortExpression="UM_ID">
                                <ItemTemplate>
                                    <asp:Label ID="UMLabel" runat="server" Text='<%# Eval("UM.UMDesc") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="true" ButtonType="Link" Visible="true" SelectText="Select"
                                HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                <HeaderStyle CssClass="hidden" Width="0px" />
                                <ItemStyle CssClass="hidden" />
                            </asp:CommandField>
                        </Columns>
                        <PagerStyle CssClass="pgr" />
                        <RowStyle CssClass="noSelect" />
                        <SelectedRowStyle CssClass="selected" />
                    </asp:GridView>
                    <br />
                    <hr />
                    <br />
                    <div class="align-right">
                        <asp:LinkButton ID="AddPartButton" runat="server" Text="Add Component" CausesValidation="false"
                            ToolTip="Add" OnClick="ShowAddModal" CssClass="button" />
                    </div>
                </asp:Panel>
                <asp:Button ID="UpdateMainButton" runat="server" Text="" CssClass="hidden" CausesValidation="false" />
                <!------------------------------------------------------------------------------------------------>
                <!-----------------------------BEGIN MODAL ADD/UPDATE COMPONENTS---------------------------------->
                <!------------------------------------------------------------------------------------------------>
                <div class="component">
                    <asp:ModalPopupExtender ID="AddModalPopup" runat="server" BackgroundCssClass="modalBackground"
                        DropShadow="false" CancelControlID="CloseAddImageButton" PopupControlID="AddPanel"
                        TargetControlID="AddHiddenField">
                    </asp:ModalPopupExtender>
                    <asp:HiddenField ID="AddHiddenField" runat="server" />
                    <asp:Panel ID="AddPanel" runat="server" Visible="true" CssClass="modalPanel" Style="display: none;">
                        <div class="close">
                            <asp:ImageButton ID="CloseAddImageButton" runat="server" ImageUrl="~/images/close2.gif"
                                CausesValidation="false" />
                        </div>

                        <div class="component-head">
                            <h1>
                                <asp:Label ID="AddEditTitle" runat="server" Text="" /></h1>
                            <br />
                            <h2>
                                <asp:Label ID="AddEditDesc" runat="server" Text="" /></h2>
                        </div>
                        <br />
                        <hr />
                        <br />
                        <div class="component-basic-entry">
                            <h1>Basic Information</h1>
                            <div class="column-container">
                                <div class="column entry">
                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Catagory:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:DropDownList ID="AddCatagoryDropDown" runat="server" DataSourceID="CatagoryDataSource"
                                                DataTextField="CatagoryDesc" DataValueField="CatagoryID" AutoPostBack="true">
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="CatagoryDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                                EntityTypeName="" OrderBy="CatagoryDesc" TableName="ComponentCatagories">
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>

                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Code:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:TextBox ID="AddCodeTextBox" runat="server" CssClass="textbox"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Part Number:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:TextBox ID="AddCompNumTextBox" runat="server" CssClass="textbox"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>

                                <div class="column">
                                    <h4>Desciption:</h4>
                                    <br />
                                    <asp:TextBox ID="AddDescTextBox" runat="server" CssClass="textarea" TextMode="MultiLine"
                                        Wrap="true" />
                                </div>
                            </div>
                        </div>

                        <div class="component-detailed-entry">
                            <h1>Detailed Specifications</h1>
                            <div class="column-container">

                                <div class="column entry">

                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Calibration:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:DropDownList ID="AddCalDropDownList" runat="server" DataSourceID="CalDataSource"
                                                DataTextField="CalDesc" DataValueField="CalID">
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="CalDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                                EntityTypeName="" OrderBy="CalCode" TableName="Calibrations">
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>

                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Single/Dual:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:DropDownList ID="AddSingleDualDropDownList" runat="server" DataSourceID="SingleDualDataSource"
                                                DataTextField="SingleDualDesc" DataValueField="SingleDualID" />
                                            <asp:LinqDataSource ID="SingleDualDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                                EntityTypeName="" OrderBy="SingleDualDesc desc" TableName="SingleDuals">
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>

                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Total Wires:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:DropDownList ID="AddWireCountDropDownList" runat="server" DataSourceID="WireCountDataSource"
                                                DataTextField="WireDesc" DataValueField="WireCountID">
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="WireCountDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                                EntityTypeName="" OrderBy="WireCount" TableName="WireCounts">
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>
                                </div>

                                <div class="column entry">

                                    <div class="column-container">
                                        <div class="column">
                                            <h4>NPT:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:DropDownList ID="AddNPTDropDownList" runat="server" DataSourceID="NPTDataSource"
                                                DataTextField="NPTDesc" DataValueField="NPTID">
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="NPTDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                                EntityTypeName="" OrderBy="NPTCode" TableName="NPTs">
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>

                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Sheath OD:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:DropDownList ID="AddODDropDownList" runat="server" DataSourceID="ODDataSource"
                                                DataTextField="ODDecimal" DataValueField="ODID" />
                                            <asp:LinqDataSource ID="ODDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                                EntityTypeName="" OrderBy="ODCode" TableName="ODs">
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>

                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Sheath Material:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:DropDownList ID="AddMaterialDropDownList" runat="server" DataSourceID="MaterialDataSource"
                                                DataTextField="MaterialDesc" DataValueField="MaterialID">
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="MaterialDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                                EntityTypeName="" OrderBy="MaterialDesc" TableName="Materials">
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="column entry">

                                    <div class="column-container">
                                        <div class="column">
                                            <h4>MI Type:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:DropDownList ID="AddMITypeDropDownList" runat="server" DataSourceID="MITypeDataSource"
                                                DataTextField="MITypeDesc" DataValueField="MITypeID">
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="MITypeDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                                EntityTypeName="" OrderBy="MITypeCode" TableName="MITypes">
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>

                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Standard/Mini:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:DropDownList ID="AddStandardDropDownList" runat="server">
                                                <asp:ListItem Value="Null">Does Not Apply</asp:ListItem>
                                                <asp:ListItem Value="True">Standard Size</asp:ListItem>
                                                <asp:ListItem Value="False">Miniature Size</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="component-pricing-entry">
                            <h1>Pricing</h1>
                            <div class="column-container">
                                <div class="column entry">
                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Cost:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:TextBox ID="AddCostTextBox" runat="server" CssClass="textbox"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="CostWatermarkExtender" runat="server" TargetControlID="AddCostTextBox"
                                                WatermarkText="$0.00" WatermarkCssClass="watermark">
                                            </asp:TextBoxWatermarkExtender>
                                        </div>
                                    </div>
                                    <div class="column-container">
                                        <div class="column">
                                        </div>
                                        <div class="column">
                                            <asp:DropDownList ID="AddUMDropDown" runat="server" DataSourceID="UMDataSource" DataTextField="UMDesc"
                                                DataValueField="UMID" CssClass="textbox">
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="UMDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                                EntityTypeName="" OrderBy="UMDesc" TableName="UMs">
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="column entry">
                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Labor Cost:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:TextBox ID="AddLaborCost_TextBox" runat="server" CssClass="textbox"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="AddLaborCost_TextBox"
                                                WatermarkText="0.00" WatermarkCssClass="watermark">
                                            </asp:TextBoxWatermarkExtender>
                                        </div>
                                    </div>
                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Build Markup:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:TextBox ID="AddMarkupTextBox" runat="server" CssClass="textbox"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="AddMarkupTextBox"
                                                WatermarkText="1.00" WatermarkCssClass="watermark">
                                            </asp:TextBoxWatermarkExtender>
                                        </div>
                                    </div>
                                </div>
                                <div class="column entry">
                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Resale Markup:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:TextBox ID="ResaleMarkup_TextBox" runat="server" CssClass="textbox" Text="2.35" Enabled="false" /></td>
                                        </div>
                                    </div>
                                    <div class="column-container">
                                        <div class="column">
                                            <h4>Allow Resale:</h4>
                                        </div>
                                        <div class="column">
                                            <asp:CheckBox ID="AddResale_CheckBox" runat="server" />
                                            <i>*only when applicable</i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <hr />
                        <br />

                        <div class="error-box error-message" id="CompExists" runat="server">
                            <asp:Label runat="server" ID="CompExists_Label" />
                        </div>
                        <div class="inline-list align-right">
                            <ul>
                                <li>
                                    <asp:LinkButton ID="DeleteButton" runat="server" Text="Delete" CssClass="button"
                                        CausesValidation="false" ToolTip="Delete" />
                                </li>
                                <li>
                                    <asp:LinkButton ID="AddButton" runat="server" Text="Add" CssClass="button" CausesValidation="false" />
                                </li>
                                <li>
                                    <asp:LinkButton ID="SaveButton" runat="server" Text="Done" CssClass="button" CausesValidation="false" />
                                </li>
                            </ul>
                        </div>
                    </asp:Panel>
                </div>
                <!------------------------------------------------------------------------------------------------------------->
                <!------------------------------------------ MESSAGE BOX PANEL ------------------------------------------------>
                <!------------------------------------------------------------------------------------------------------------->
                <asp:ModalPopupExtender ID="MessageModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                    DropShadow="false" CancelControlID="CloseImageButton" PopupControlID="MessagePanel"
                    TargetControlID="MessageHiddenField" />
                <asp:HiddenField ID="MessageHiddenField" runat="server" />
                <asp:Panel ID="MessagePanel" runat="server" CssClass="modalPanel" Style="display: none;">
                    <div class="close">
                        <asp:ImageButton ID="CloseImageButton" runat="server" ImageUrl="~/images/close2.gif" />
                    </div>
                    <div style="width: 400px;">
                        <asp:Label ID="MessageLabel" runat="server" Text="Label" />
                    </div>
                    <br />
                    <center>
                        <asp:LinkButton ID="MessageOKButton" runat="server" Text="OK" CssClass="button" />
                        <asp:LinkButton ID="DeleteYesButton" runat="server" Text="Yes" CssClass="button" />
                        <span style="padding-right: 20px;"></span>
                        <asp:LinkButton ID="DeleteNoButton" runat="server" Text="No" CssClass="button" />
                    </center>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
